#include "defines.h"

// Prosthetic Hand Senior Design Project
// Matthew Varas, Rachel Mertz, Donnell Jones
// 12/2/2016

// This program tests the following:
// * Input capture of quadrature encoders for five motors concurrently
// * Direction checking
// * Using structs for individual fingers
// * Passing structs into functions so they can be written as generic functions

// * Timer 11 used to set sample rate: 100ms

/* Hookup:
   * Pointer finger motor encoder
     * Timer 3, Channel 1
     * Encoder Channel A: C6
     * Encoder Channel B: E12
     
   * Middle finger motor encoder
     * Timer 3, Channel 2
     * Encoder Channel A: C7
     * Encoder Channel B: A11
     
   * Ring finger motor encoder
     * Timer 3, Channel 3
     * Encoder Channel A: C8
     * Encoder Channel B: B15
     
   * Pinky motor encoder
     * Timer 3, Channel 4
     * Encoder Channel A: C9
     * Encoder Channel B: D9
     
   * Thumb motor encoder
     * Timer 2, Channel 1
     * Encoder Channel A: A5
     * Encoder Channel B: C11
     
*/

/*****************  System constants  ******************/
unsigned long MCU_FREQUENCY = 168000000;                                        // Microcontroller clock speed in Hz
unsigned long ENCODER_TIM_RELOAD = 65535;                                       // Auto Reload value for encoder CCP timers (16 bit register)
unsigned int ENCODER_TIM_PSC = 100;                                             // Prescaler for encoder CCP timers
unsigned int SAMPLE_TIM_RELOAD = 55999;                                         // Auto reload value for sampling timer (5ms)
unsigned int SAMPLE_TIM_PSC = 2;                                              // Prescaler for sampling timer
unsigned int TERMINAL_PRINT_THRESH = 500;                                        // Number of polling events
unsigned long PWM_FREQ_HZ = 10000;                                              // PWM base frequency

unsigned int PWM_PERIOD_TIM1;                                                   // For four fingers - base timer period of PWM - needed for duty cycle calculations
unsigned int PWM_PERIOD_TIM4;                                                   // For thumb

// Motor control constants
long FULLY_EXTENDED = 0;                                                        // Lower bound for position
unsigned long FULLY_CONTRACTED = 3600;                                          // Higher bound for position
unsigned int NORMALIZATION_CONSTANT = 1;                                        // "Self-explanatory" - was 4


/**************  Global Variables  **************/
long double encoder_timer_period_ms;                                            // Period in ms of timers used for motor encoder input capture
unsigned int poll_flag;                                                         // Flag to enter main loop
unsigned int terminal_print_count;                                              // ** DEBUG ** Flag to print statistics to terminal (via UART)
unsigned long tim2_overflow_count;                                              // Overflow counter for timer 2
unsigned long tim3_overflow_count;                                              // Overflow counter for timer 3
int analogGo = 0;                                                               // Tells the system whether the timer interrupt has triggered
int doShutdown = 0;                                                              // Tells the system whether it needs to go through the shutoff procedure
int emg_override_status;                                                        // Used as state variable to control EMG delay timer. Do not use for anything else



/*************  Function Prototypes  ************/
void timer2_ISR();                                                              // Interrupt handler for Timer 2
void timer3_ISR();                                                              // Interrupt handler for Timer 3
void init_GPIO();                                                               // Initialization of MCU I/O
void init_UART();                                                               // Initialization of UART for terminal communication
void init_input_capture();
void init_timer11();                                                            // Initialization of timer 11 (Used for fixed polling rate at 100 Hz)
void sample_finger(struct finger *fngr);                                        // Function to determine state of finger
void print_finger_info(struct finger *fngr);                                    // Function to print finger state info to terminal
void calc_timer_values(struct finger *fngr);                                    // Function to calculate motor speed, etc...

void InitTimer10();            // Timer 5 init
void Timer10_interrupt();      // Timer 5 interrupt handler

// Initializes and starts pointer PWM with a set duty cycle
void init_pointer_PWM(unsigned int);
 
 
// P control based on force
unsigned int Pcontrol_force(struct finger *, unsigned int, unsigned int);       // Takes finger structure, SP, and MPV
void move_pointer_finger(struct finger *, unsigned int);                        // Takes finger structure and duty cycle

int MARGIN = 250;                                                                // accuracy of PV - 10/400 = 2.5%
int setP;
int SP_LOW = 700;                                               // setpoints - desired force
                                                                                // Firm touch - about 700 mV + 200-300 mV offset
float FORCE_K = 50.0;                                                           // proportionality constant for P control
unsigned int MPV;                                                               // measured process variable
unsigned int dutyCycle;                                                         // duty cycle returned by P controller
float pointer_average = 0.0;                                                    // moving average over 5 force samples
int change_SP_flag;                                                             // Allows toggling between two different system setpoints
char toStr[STR_MAX];                    // convenient


/**************  Generic Finger Struct Definition  **************/
struct finger {
        char name[STR_MAX];                                                     // Name of finger
        long position_temp;                                                     // Number of input capture events since last sample. Used for finger position
        long position_actual;                                                   // Calculated position of finger 
        unsigned int direction_actual;                                          // Actual direction of motor movement as read from encoder
        
        // NEW
        unsigned int direction_desired;                                         // Desired direction of movement of finger
        
        
        unsigned int enc_chan_b;                                                // Motor encoder channel b value. Used to test direction of movement
        unsigned long enc_start_time;                                           // Value of encoder timer when previous capture event occured 
        unsigned long enc_end_time;                                             // Value of encoder timer when current capture event occured                 
        unsigned long enc_delta_ticks;                                          // Number of timer ticks between previous/current capture events (Minus overflows)
        unsigned long enc_overflow_start;                                       // Value of timer overflow counter when previous capture event occured 
        unsigned long enc_overflow_end;                                         // Value of timer overflow counter when current capture event occured        
        unsigned long enc_overflow_delta;                                       // Calculated number of timer overflows between capture events
        unsigned long enc_overflow_ticks;                                       // Total number of timer ticks for the timer overflows between events
        unsigned long enc_total_ticks;                                          // Calculated total number of timer ticks between input capture events 
        unsigned long input_sig_frequency;                                      // Frequency of motor encoder signal (in Hz)
        long double input_sig_period;                                           // Period of motor encoder signal (in ms)
        int tip_force;                                                          // NEW: Force applied at flexiforce sensor on fingertip
};


// Create Finger Structs
struct finger fngr_pointer;
struct finger fngr_middle;
struct finger fngr_ring;
struct finger fngr_pinky;
struct finger fngr_thumb;


// NEW
void init_finger(struct finger *);                                              // Sets initial position of finger to 0 and direction to CONTRACT

unsigned int dirTrack;

// Main Starts here 
void main() {

        // Initializations
        init_UART();                                                            // Configure and Initialize UART serial communications
        init_GPIO();                                                            // Configure MCU I/O
        init_pointer_PWM(0);                                                    // Set up PWM with 0% duty cycle
        
/*while(1)
    {
    // Cleanup to extend finger backward
    POINTER_DIRECTION = EXTEND;
    if(GRAB_MODE_BUTTON == 1)  // pressing the button should run the motor!!
        move_pointer_finger(&fngr_pointer, 100);                                // Extend finger at 100% without position control - visually choose where it stops
    else
        move_pointer_finger(&fngr_pointer, 0);
    }*/
    

    // Initialize stuff for AWD
    InitTimer10();                  // Timer3 init


    // Define names of finger struct instances
    strcpy(fngr_pointer.name, "fngr_pointer");
    strcpy(fngr_middle.name, "fngr_middle");
    strcpy(fngr_ring.name, "fngr_ring");
    strcpy(fngr_pinky.name, "fngr_pinky");
    strcpy(fngr_thumb.name, "fngr_thumb");

    // Set initial direction to CONTRACT, initial position to 0, and configure ADC1 for input on channel 7
    init_finger(&fngr_pointer);
    init_finger(&fngr_middle);
    init_finger(&fngr_ring);
    init_finger(&fngr_pinky);
    init_finger(&fngr_thumb);



    // Program start terminal verification
    UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
    delay_ms(500);

    // Begin Timers and input capture
    init_timer11();                                                         // Initialize timer 11, used for sampling
    init_input_capture();                                                   // Initialize input capture channels

    setP = SP_LOW;                                                          // Medium touch to begin
    change_SP_flag = 1;                                                     // Light touch next time

    LOW_BATTERY_LED = 0;

    // Initialize ADC
    ADC1_init();

    // Infinite Loop
    while(1) {

           if (poll_flag) {                             // system is running and doesn't need to go through shutoff
              poll_flag = 0;                                                    // Clear flag
              sample_finger(&fngr_pointer);                                     // Call state calculation function for each finger - equivalent of sampling
              sample_finger(&fngr_middle);
              sample_finger(&fngr_ring);
              sample_finger(&fngr_pinky);
              sample_finger(&fngr_thumb);
              

          }

        // execute shutoff outside of sampling
        if(analogGo && !doShutdown)         // if the system is running and still needs to go through the shutoff procedure
        {
          // emergency - if stabilization not reached
          // If finger reaches fully contracted state instruct it to shutdown
          if(fngr_pointer.position_actual >= FULLY_CONTRACTED )
              doShutdown = 1;
              

          MPV = fngr_pointer.tip_force;                                     // Store the sampled value locally

          dutyCycle = Pcontrol_force(&fngr_pointer, setP, MPV);  // apply P control; input is finger, SP, MPV

          /*UART1_Write_Text("Force value is ");
          IntToStr(MPV, toStr);               // Print
          UART1_Write_Text(toStr);
          UART1_Write_Text("\n\r");*/


          POINTER_DIRECTION = fngr_pointer.direction_desired;


/*if(MPV - setP > 0)       // stabilizing - MARGIN should be small
          {
             MPV = fngr_pointer.tip_force;                                     // Store the sampled value locally

             dutyCycle = Pcontrol_force(&fngr_pointer, setP, MPV);  // apply P control; input is finger, SP, MPV

             move_pointer_finger(&fngr_pointer, dutyCycle);
            // sample_finger(&fngr_pointer);
            // MPV = fngr_pointer.tip_force;      // store the MPV to be able to break out of stabilization
          }*/

if(MPV > setP)       // stabilizing - MARGIN should be small
          {
    //       sample_finger(&fngr_pointer);
    //          MPV = fngr_pointer.tip_force;                                     // Store the sampled value locally

             dutyCycle = Pcontrol_force(&fngr_pointer, setP, MPV);  // apply P control; input is finger, SP, MPV

             move_pointer_finger(&fngr_pointer, 0);

            // sample_finger(&fngr_pointer);
            // MPV = fngr_pointer.tip_force;      // store the MPV to be able to break out of stabilization
          }
 else
               move_pointer_finger(&fngr_pointer, dutyCycle);                 // apply duty cycle
          // stabilization: toggle between two different setpoints, light and hard
          /*if(abs(MPV - setP) < MARGIN)
          {
               move_pointer_finger(&fngr_pointer, 0);                       // stop the motor

               fngr_pointer.direction_desired = EXTEND;                     // Set up to EXTEND back from setpoint to mechanical 0
               POINTER_DIRECTION = fngr_pointer.direction_desired;

               poll_flag = 0;
               NVIC_IntDisable(IVT_INT_TIM1_TRG_COM_TIM11);                   // stop sampling with timer 11

               // Indicate stabilization
               UART1_Write_Text("\n\n************* PV stabilized at ");       // HOORAH
               IntToStr(MPV, toStr);
               UART1_Write_Text(ToStr);

               UART_Write_Text("\n\r***************** Setpoint was ");   // display it
               IntToStr(setP, toStr);
               UART1_Write_Text(ToStr);
               UART1_Write_Text("\n\n\n\n\r");

               // Change system setpoint
               if(change_SP_flag == 0)   {
                    setP = SP_LOW;                                          // Switch to low setpoint for next time
                    change_SP_flag = 1;
               }
               else if(change_SP_flag == 1)     {
                    setP = SP_HIGH;                                          // Normally would switch to high setpoint for next time
                    change_SP_flag = 0;
               }

               UART_Write_Text("\n***************** New setpoint = ");   // display it
               IntToStr(setP, toStr);
               UART1_Write_Text(ToStr);
               UART1_Write_Text("\n\n\n\n\r");

               fngr_pointer.direction_desired = EXTEND;                     // Set up to EXTEND again!
               POINTER_DIRECTION = fngr_pointer.direction_desired;

               move_pointer_finger(&fngr_pointer, 100);                     // Restart the motor
               NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);                  // Start sampling with timer 11 again
               sample_finger(&fngr_pointer);                                // Sample to get current position
               while(fngr_pointer.position_actual >= FULLY_EXTENDED)   {
                    sample_finger(&fngr_pointer);                           // Make sure finger extends backward before resuming force control
                    MPV = fngr_pointer.tip_force;                           // Store the force value for comparison
               }
               // reached FULLY_EXTENDED: start contracting again
               POINTER_DIRECTION = CONTRACT;
          }*/
       }

       if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
            
            dirTrack = fngr_pointer.direction_desired;
                        UART1_Write_Text("Duty cycle returned is ");
              IntToStr(dutyCycle, toStr);                                       // Print
              UART1_Write_Text(toStr);
              UART1_Write_Text("\n\r");

               UART_Write_Text(" \n Setpoint is ");   // display it
               IntToStr(setP, toStr);
               UART1_Write_Text(ToStr);
               UART1_Write_Text("\n\r");
          print_finger_info(&fngr_pointer);                                 // Print statistics to terminal for each finger     - PUT BACK IN
          print_finger_info(&fngr_middle);
          print_finger_info(&fngr_ring);
          print_finger_info(&fngr_pinky);
          print_finger_info(&fngr_thumb);
          UART1_Write_Text("\n\n\n\n\n\n\n\r");                             //PUT BACK IN
       }
       
       // Actual shutdown code
       if (doShutdown) {

          while(fngr_pointer.position_actual >= FULLY_EXTENDED) {                // Loop until finger is fully extended again
              sample_finger(&fngr_pointer);
              fngr_pointer.direction_desired = EXTEND;          // could move these two lines out in front of while
              POINTER_DIRECTION = EXTEND;
              move_pointer_finger(&fngr_pointer, 100);                          // Run finger back
          }
          
          // finger now fully extended
          move_pointer_finger(&fngr_pointer, 0);                                // Stop the motor - wait for analogGo again
            analogGo = 0;                                                                // Set the system to be inactive
            doShutdown = 0;                                                        // Disable shutdown flag since shutdown routine has been completed
            LOW_BATTERY_LED = 0;                                                        // Turn off LED to indicate system is now inactive
          fngr_pointer.position_actual = 2;
       }
    
      dirTrack = fngr_pointer.direction_desired;

    }
} // Main ends here



/************** Force control ******************/

// apply P control to force to determine duty cycle. takes in Flexiforce values and returns duty cycle.
// *** ONLY WORKS if finger begins fully extended, i.e. the limit switch is hit
// *** so counting up is contracting and counting down is extending.
unsigned int Pcontrol_force(struct finger *fngr, unsigned int SP, unsigned int mpv)
{
     unsigned int duty_cycle;

     if((SP-mpv) <= 0) {                // moved past SP
          fngr->direction_desired = EXTEND;
     //     POINTER_DIRECTION = EXTEND;              // Move back
          }
     else
         fngr->direction_desired = CONTRACT;         // Keep going

 //    if(strcmp(fngr->name, "fngr_pointer") == 0)     {
 //         POINTER_DIRECTION = fngr->direction_desired;
  //   }

     duty_cycle = FORCE_K*abs(SP-mpv);    // proportional control
     
     if(duty_cycle > 100)
          duty_cycle = 100;       // cap duty cycle
     else if(duty_cycle < 20)
           duty_cycle = 0;       // boost duty cycle

     return duty_cycle;
}


// set duty cycle returned from P control
void move_pointer_finger(struct finger *fngr, unsigned int duty_cycle)
{
     //if(strcmp(fngr->name, "fngr_pointer") == 0)
        PWM_TIM1_Set_Duty(duty_cycle*(PWM_PERIOD_TIM1/100), _PWM_NON_INVERTED, POINTER_PWM);       // set new duty cycle
     //else if(strcmp(fngr->name, "fngr_middle") == 0)            // etc.
            // PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);
}


/**************  Interrupt Handlers  **************/

// Interrupt handler for Timer 2 (Handles thumb overflows AND Capture events)
void timer2_ISR() iv IVT_INT_TIM2 {

     /* Timer 2 Overflow Events */
    if(TIM2_SR.UIF == 1) {                                                     
        TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
        tim2_overflow_count++;                                                  // Increment timer 2 overflow counter
    }

    /* Input Capture Events */
    // Timer 2, Channel 1 (Pin A5) Thumb input capture event
    if (TIM2_SR.CC1IF == 1) {    
        fngr_thumb.enc_start_time = fngr_thumb.enc_end_time;                    // Store previous captured value for next calculation
        fngr_thumb.enc_end_time = TIM2_CCR1;                                    // Read stored input capture time
        fngr_thumb.enc_overflow_start = fngr_thumb.enc_overflow_end;            // Store previous overflow value for next calculation
        fngr_thumb.enc_overflow_end = tim2_overflow_count;                      // Store number of timer 2 overflows for thumb
        fngr_thumb.enc_chan_b = THUMB_ENCODER_B;                               // Sample the second encoder channel (For direction)
        fngr_thumb.position_temp++;                                             // Increment total input capture event counter
    }
}


// Interrupt handler for Timer 3 (Handles Pointer, Middle, Ring, Pinky overflows AND Capture events)
void timer3_ISR() iv IVT_INT_TIM3 {

    /* Timer 3 Overflow Events */
    if(TIM3_SR.UIF == 1) {
        TIM3_SR.UIF = 0;                                                        // Clear timer 3 interrupt bit
        tim3_overflow_count++;                                                  // Increment timer 3 overflow counter
    }

    // Timer 3, Channel 1 (Pin C6) Pointer finger input capture event
    if (TIM3_SR.CC1IF == 1) {
        fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;                // Store previous captured value for next calculation
        fngr_pointer.enc_end_time = TIM3_CCR1;                                  // Read stored input capture time
        fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;        // Store previous overflow value for next calculation
        fngr_pointer.enc_overflow_end = tim3_overflow_count;                    // Store number of timer 3 overflows for Pointer finger
        fngr_pointer.enc_chan_b = POINTER_ENCODER_B;                           // Sample the second encoder channel state (For direction)
        fngr_pointer.position_temp++;                                           // Increment total input capture event counter
    }


    // Timer 3, Channel 2 (Pin C7) Middle finger input capture event
    if (TIM3_SR.CC2IF == 1) {
        fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
        fngr_middle.enc_end_time = TIM3_CCR2;                                   // Read stored input capture time
        fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
        fngr_middle.enc_overflow_end = tim3_overflow_count;                     // Store number of timer 3 overflows for Middle finger
        fngr_middle.enc_chan_b = MIDDLE_ENCODER_B;                             // Sample the second encoder channel state (For direction)
        fngr_middle.position_temp++;                                            // Increment total input capture event counter
    }

    // Timer 3, Channel 3 (Pin C8) Ring finger input capture event
    if (TIM3_SR.CC3IF == 1) {
        fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
        fngr_ring.enc_end_time = TIM3_CCR3;                                     // Read stored input capture time
        fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
        fngr_ring.enc_overflow_end = tim3_overflow_count;                       // Store number of timer 3 overflows for Ring finger
        fngr_ring.enc_chan_b = RING_ENCODER_B;                                 // Sample the second encoder channel state (For direction)
        fngr_ring.position_temp++;                                              // Increment total input capture event counter
    }

    // Timer 3, Channel 4 (Pin C9) Pinky input capture event
    if (TIM3_SR.CC4IF == 1) {
        fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
        fngr_pinky.enc_end_time = TIM3_CCR4;                                    // Read stored input capture time
        fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
        fngr_pinky.enc_overflow_end = tim3_overflow_count;                      // Store number of timer 3 overflows for Pinky
        fngr_pinky.enc_chan_b = PINKY_ENCODER_B;                               // Sample the second encoder channel state (For direction)
        fngr_pinky.position_temp++;                                             // Increment total input capture event counter
    }
}                                                                


// Interrupt handler for Timer 11 - Used to set sampling rate
void timer11_ISR() iv IVT_INT_TIM1_TRG_COM_TIM11 {

    TIM11_SR.UIF = 0;                                                           // Clear timer 11 interrupt flag
    poll_flag = 1;                                                              // Set poll flag for main loop
    terminal_print_count++;                                                     // Increment the debug print counter
}



/**************  Initialization Functions  **************/

// Initialize MCU GPIO's
void init_GPIO() {

    // Configure GPIO's for secondary motor encoder channels
    // Configure GPIO's for secondary motor encoder channels
    GPIO_Config(&GPIOE_BASE,                                                    // Pointer Encoder Channel B
            _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

    GPIO_Config(&GPIOA_BASE,                                                    // Middle Encoder Channel B
            _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

    GPIO_Config(&GPIOB_BASE,                                                    // Ring Encoder Channel B
            _GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

    GPIO_Config(&GPIOD_BASE,                                                    // Pinky Encoder Channel B
            _GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

    GPIO_Config(&GPIOC_BASE,                                                    // Thumb Encoder Channel B
            _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
    
    // NEW: for motor control
    GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                         // Pointer direction
    GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_10);                         // Middle direction
    GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_13);                         // Ring direction
    GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_8);                          // Pinky direction
    GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12);                         // Thumb direction
    GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);                          // Motor enable: may not use in this test
    
    // Two debug lights on PCB used for EMG Override visual indicators
    GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7 | _GPIO_PINMASK_9);
    
              /* ------------ EMG Override Button (EXTI) Initialization ------------ */   //D3
         GPIO_Digital_input(&GPIOD_BASE, _GPIO_PINMASK_3);                // Enable digital input on B3
         SYSCFGEN_bit = 1;                                        //Enable system config controller clock
         SYSCFG_EXTICR1bits.EXTI3 = 3;                // Map external interrupt 3 to port B
         EXTI_RTSRbits.TR3 = 1;                                // Set interrupt on rising edge
         EXTI_IMRbits.MR3 = 1;                                // Unmask bit 3 to enable external interrupt on line 3
         NVIC_IntEnable(IVT_INT_EXTI3);     //Enable external interrupt B3 for EMG override button
    
}


 // Initialize pointer finger PWM
 void init_pointer_PWM(unsigned int dutyCycle) {
     // Configure Pointer finger PWM (Pin E9)
     PWM_PERIOD_TIM1 = PWM_TIM1_Init(PWM_FREQ_HZ);                                   // Set PWM base frequency to 100 Hz
     PWM_TIM1_Set_Duty(dutyCycle*(PWM_PERIOD_TIM1/100), _PWM_NON_INVERTED, POINTER_PWM);    // Set duty on Timer 1, channel 1
     PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                 // Start PWM
 }


 // Initialize finger positions to 0, start finger at CONTRACT, and set up Flexiforce channel
 void init_finger(struct finger *fngr)
 {
      fngr->position_actual = 0;
      //fngr->position_actual = FULLY_CONTRACTED +100;                 // CLEANUP - in case finger jams contracted
      fngr->direction_desired = CONTRACT;
      
      if (strcmp(fngr->name, "fngr_pointer") == 0) {
         POINTER_DIRECTION = fngr->direction_desired;
         ADC_Set_Input_Channel(_ADC_CHANNEL_7);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
      }
      else if (strcmp(fngr->name, "fngr_middle") == 0) {
         MIDDLE_DIRECTION = fngr->direction_desired;
         ADC_Set_Input_Channel(_ADC_CHANNEL_9);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
      }
      else if (strcmp(fngr->name, "fngr_ring") == 0) {
         RING_DIRECTION = fngr->direction_desired;
         ADC_Set_Input_Channel(_ADC_CHANNEL_11);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
      }
      else if (strcmp(fngr->name, "fngr_pinky") == 0) {
         PINKY_DIRECTION = fngr->direction_desired;
         ADC_Set_Input_Channel(_ADC_CHANNEL_13);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works

      }
      else if (strcmp(fngr->name, "fngr_thumb") == 0) {
         THUMB_DIRECTION = fngr->direction_desired;
         ADC_Set_Input_Channel(_ADC_CHANNEL_3);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
    }
 }
 

// Initialize UART
void init_UART() {
        
    UART1_Init(UART_BAUD_RATE);                                                 // Configure UART 1
    Delay_ms(200);                                                              // Wait for UART to stabilize
    UART_Write_Text("\rUART Init Complete\r\n");                                // *** DEBUG *** Print test statement to terminal
}                                                        


// Initialize Input Capture for all fingers
void init_input_capture() {

 // Configure timer 3 (Used for pointer, middle, ring, pinky)
    // 0 values not strictly needed as all are reset states. Used for testing and clarity
    RCC_APB1ENR.TIM3EN = 1;                                                     // Enable clock gating for timer module 3
    TIM3_CR1.CEN = 0;                                                           // Disable timer/counter
    TIM3_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
    TIM3_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
    TIM3_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
    TIM3_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)

    // Configure pointer finger (Pin C6, Channel 1) input capture
 //   GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH1_PC6);                 // Configure alternate function for C6 as Timer 3 Channel 1
    GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_6, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
    TIM3_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
    TIM3_CCER.CC1P = 0;                                                         // Set capture on rising edge event
    TIM3_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
    TIM3_CCER.CC1E = 1;                                                         // Enable capture on channel 1
    TIM3_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1

    // Configure middle finger (Pin C7, Channel 2) input capture
//    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH2_PC7);                 // Configure alternate function for pin C7 as Timer 3 Channel 2
    GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_7, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
    TIM3_CCMR1_Input |= 0x100;                                                  // Set capture channel 2 as input on TI2 (CC2S = 01)
    TIM3_CCER.CC2P = 0;                                                         // Set capture on rising edge event
    TIM3_CCER.CC2NP = 0;                                                        // ^^ Continuation of above
    TIM3_CCER.CC2E = 1;                                                         // Enable capture on channel 2
    TIM3_DIER.CC2IE = 1;                                                        // Enable interrupt on capture channel 2

    // Configure ring finger (Pin C8, Channel 3) input capture
//    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH3_PC8);                 // Configure alternate function for pin BC8 as Timer 3 Channel 3
    GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_8, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
    TIM3_CCMR2_Input |= 0x01;                                                   // Set capture channel 3 as input on TI3 (CC3S = 01)
    TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
    TIM3_CCER.CC3NP = 0;                                                         // ^^ Continuation of above
    TIM3_CCER.CC3E = 1;                                                         // Enable capture on channel 3
    TIM3_DIER.CC3IE = 1;                                                        // Enable interrupt on capture channel 3

    // Configure pinky finger (Pin C9, Channel 4) input capture
//    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH4_PC9);                 // Configure alternate function for pin C9 as Timer 3 Channel 4
    GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_4, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
    TIM3_CCMR2_Input |= 0x100;                                                  // Set capture channel 4 as input on TI4 (CC4S = 01)
    TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
    TIM3_CCER.CC3NP = 0;                                                        // ^^ Continuation of above
    TIM3_CCER.CC4E = 1;                                                         // Enable capture on channel 4
    TIM3_DIER.CC4IE = 1;                                                        // Enable interrupt on capture channel 4


    // Configure Timer 2 (Used for thumb)
    RCC_APB1ENR.TIM2EN = 1;                                                     // Enable clock gating for timer module 5
    TIM2_CR1.CEN = 0;                                                           // Disable timer/counter
    TIM2_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
    TIM2_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
    TIM2_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
    TIM2_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)

    // Configure Thumb (Pin A5, Channel 1) input capture
  //  GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA5);                 // Configure alternate function for A5 as Timer 2 Channel 1
    GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_5, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM2 | _GPIO_CFG_PULL_DOWN);
    TIM2_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
    TIM2_CCER.CC1P = 0;                                                         // Set capture on rising edge event
    TIM2_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
    TIM2_CCER.CC1E = 1;                                                         // Enable capture on channel 1
    TIM2_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1


    // Configure timer interrupts
    TIM3_DIER.UIE = 1;                                                          // Enable overflow interrupt Timer 3
    TIM2_DIER.UIE = 1;                                                          // Enable overflow interrupt for Timer 2
    NVIC_IntEnable(IVT_INT_TIM3);                                               // Enable timer 3 ISR
    NVIC_IntEnable(IVT_INT_TIM2);                                               // Enable timer 2 ISR
    TIM3_CR1.CEN = 1;                                                           // Enable timer 3
    TIM2_CR1.CEN = 1;                                                           // Enable Timer 2

    // Calculate period of TIM2_CLK and TIM3_CLK in ms. Used in state calculations
    // Name misleading, should be fixed to indicate period for all encoder timers, not just timer 3
    encoder_timer_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
}



// Initialize Timer 11 (Interrupts every 100ms to poll encoder state)
void init_timer11() {

    RCC_APB2ENR.TIM11EN = 1;                                                    // Enable clock for timer 11
    TIM11_CR1.CEN = 0;                                                          // Disable timer/counter
    TIM11_PSC = SAMPLE_TIM_PSC;                                                 // Set timer 11 prescaler
    TIM11_ARR = SAMPLE_TIM_RELOAD;                                              // Set timer 11 overflow value
    NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);                                 // Enable timer 11 interrupt
    TIM11_DIER.UIE = 1;                                                         // Timer 11 update interrupt enable
    TIM11_CR1.CEN = 1;                                                          // Enable timer/counter
}





// Function to calculate statistics finger encoder. Broken into steps for clarity
void sample_finger( struct finger *fngr) {

    // Calculate number of timer overflows between previous and current capture events 
    fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;
    
    // Calculate timer ticks for the number of overflows
    fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);
    
    // Calculate number of timer ticks (minus overflows) between previous and current capture events 
    fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;
    
    // Calculate total timer ticks between previous and current capture events 
    fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;
    
    // Calculate period of captured signal (ms)
    fngr->input_sig_period = (long double) fngr->enc_total_ticks * encoder_timer_period_ms;
    
    // Calculate frequency of captured signal (Hz)
    fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
    if (fngr->input_sig_frequency > 20000.0)                                    // NEW: Handles startup error
       fngr->input_sig_frequency = 0;

    // Check direction of motor movement and calculate position
    if (fngr->enc_chan_b == 1) {                                                // Clockwise
            fngr->direction_actual = CONTRACT;
            fngr->position_actual += (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
    }

    else if (fngr->enc_chan_b == 0) {                                           // Counter Clockwise
            fngr->direction_actual = EXTEND;
            fngr->position_actual -= (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
    }

    else {                                                                      // ERROR: Invalid direction state
            fngr->direction_actual = 7;
    }
    
   // fngr->position_actual = (long) fngr->position_actual / 4.0;
    // NEW
 /*if(fngr->position_actual >= FULLY_CONTRACTED) {  // don't run too far!
         fngr->direction_desired = EXTEND;
    }

     if(fngr->position_actual <= FULLY_EXTENDED) {
         fngr->direction_desired = CONTRACT;
     }*/
         
    // Reset position counter
    fngr->position_temp = 0;
    

    
    
    

    if(strcmp(fngr->name, "fngr_pointer") == 0)   {
        fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_POINTER_TIP_FORCE);
    }
    else if (strcmp(fngr->name, "fngr_middle") == 0) {
        fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_MIDDLE_TIP_FORCE);
    }
    else if (strcmp(fngr->name, "fngr_ring") == 0) {
        fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_RING_TIP_FORCE);
    }
    else if (strcmp(fngr->name, "fngr_pinky") == 0) {
        fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_PINKY_TIP_FORCE);
    }
    else if (strcmp(fngr->name, "fngr_thumb") == 0) {
        fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_THUMB_TIP_FORCE);
    }
}


// Function to print all statistics to terminal (This is for testing only. Do not merge into final code)
void print_finger_info( struct finger *fngr) {
    
    //Local strings
    char frequency_text[STR_MAX];
    char position_text[STR_MAX];
    char direction_text[STR_MAX];
    
    UART1_Write_Text("\n\rFinger Name: ");                                      //Print name of current finger to terminal
    UART1_Write_Text(fngr->name);
    UART1_Write_Text("\n\r");

    LongWordToStr(fngr->input_sig_frequency, frequency_text);                   // Print input capture signal frequency to terminal
    UART1_Write_Text("Frequency of incoming signal (Hz): ");
    UART1_Write_Text(frequency_text);
    UART1_Write_Text("\n\r");                        

    //IntToStr(fngr->direction_actual, direction_text);                           // Print direction of movement to terminal
    UART1_Write_Text("Direction of movement:             ");
    if(fngr->direction_actual == EXTEND)
         UART1_Write_Text("EXTEND ");
    else
        UART1_Write_Text("CONTRACT ");
    //UART1_Write_Text(direction_text);
    UART1_Write_Text("\n\r");                        
    
        //IntToStr(fngr->direction_actual, direction_text);                           // Print direction of movement to terminal
    UART1_Write_Text("Direction desired:             ");
    if(fngr->direction_desired == EXTEND)
         UART1_Write_Text("EXTEND ");
    else
        UART1_Write_Text("CONTRACT ");
    //UART1_Write_Text(direction_text);
    UART1_Write_Text("\n\r");
    
    
    LongToStr(fngr->position_actual, position_text);                            // Print total number of input events (position) to terminal
    UART1_Write_Text("Position of finger:                ");
    UART1_Write_Text(position_text);
    UART1_Write_Text("\n\n\n\r"); 
    
    IntToStr(fngr->tip_force, toStr);                            // Print Flexiforce value (16-bit unsigned) to terminal
    UART1_Write_Text("Force applied to tip of finger:                ");
    UART1_Write_Text(toStr);
    UART1_Write_Text("\n\n\n\r");

    terminal_print_count = 0;                                                   // Reset counter for terminal printing
}




// TIMER10 INTERRUPT Init ( 3 seconds )
void InitTimer10(){
     RCC_APB2ENR.TIM10EN = 1;                       // Enable clock gating for timer 10
     TIM10_CR1.CEN = 0;                              // Disable timer/counter
     TIM10_PSC = 7874;                 // Set timer 10 prescaler
     TIM10_ARR = 63999;              // Set timer 10 overflow value
     NVIC_IntEnable(IVT_INT_TIM1_UP_TIM10); // Enable timer 10 interrupt
     TIM10_CR1.CEN = 1;                              // Enable timer/counter
}

// TIMER10 INTERRUPT HANDLER
// I feel like there should be a case in here using emg_override_status:
// like if that status is 1, analogGo should be 1 and doShutoff should be 0
// and if that status is 0 (system should go dormant on timer interrupt), then analogGo should stay 1 and doShutoff should be 1
// The only reason I haven't implemented this is because I don't know if that involves different configurations inside this interrupt.
// I don't know how the configurations would be changed.
void Timer10_interrupt() iv IVT_INT_TIM1_UP_TIM10 { // Interrupt handler if 3 s have past
    // Deal with interrupt stuffs
    EXTI_IMRbits.MR3 = 0;                        // mask bit 3 to disable external interrupt on line 3
    EXTI_PR.B3 = 1;                                    // Clear Interrupt Flag
    TIM10_DIER.UIE = 0;                           // Disable timer 10 interrupt
    TIM10_SR.UIF = 0;                             // Clear timer 10 interrupt flag
    EXTI_RTSRbits.TR3 = 1;                      // Enable rising edge trigger
    EXTI_FTSRbits.TR3 = 0;                      // Disable falling edge trigger
    EXTI_IMRbits.MR3 = 1;                        // Unmask bit 3 to enable external interrupt on line 3
    EMG_ACTIVE_LED = 0;                         // Clear EMG Override button indicator
    emg_override_status = 0;                        // Put the EMG override handler back into dormant state

    // Deal with conditional stuff
    if (!analogGo) {                                // If system is current inactive
       doShutdown = 0;
       analogGo = 1;                        // Flag to indicate the system should run
       LOW_BATTERY_LED = 1;                            // Turn on the system state LED to indicate system is now running
    }

    else {                                        // If the system is currently active
       doShutdown = 1;                                // Send the shutdown command.
       analogGo = 0;
                                                    // The LED, analogGo, doShutdown, and emg_override_status are all cleared by the "actual shutdown code"
}
}




// EMG Override Button Interrupt Hnadler
void emg_override_ISR() iv IVT_INT_EXTI3 {

     EXTI_IMRbits.MR3 = 0;                            // mask bit 3 to Disable external interrupt on line 3
      EXTI_PR.B3 = 1;                               // Clear Interrupt Flag
      if(emg_override_status == 0) {                // Current system state is dormant
            TIM10_SR.UIF = 0;                       // Clear timer 5 interrupt bit
            TIM10_CNT = 0x00;                       // Reset timer value to 0
            emg_override_status = 1;                // Turn on system so it waits for analogGo from Timer 10 interrupt
            EXTI_RTSRbits.TR3 = 0;                  // Disable rising edge trigger
            EXTI_FTSRbits.TR3 = 1;                  // Enable falling edge trigger
            TIM10_DIER.UIE = 1;                     // CC1 Update Interrupt Enable
            EMG_ACTIVE_LED = 1;                     // Notify button is held
            //doShutdown = 0;
      }
      else {                                        // Current EMG state is armed
            TIM10_DIER.UIE = 0;                     // Disable timer interrupt
            emg_override_status = 0;                // Turn off system
            EXTI_RTSRbits.TR3 = 1;                  // Enable rising edge trigger
            EXTI_FTSRbits.TR3 = 0;                  // Disable falling edge trigger
            EMG_ACTIVE_LED = 0;                     // Notify button released
            analogGo = 0;
            doShutdown = 1;
      }
      EXTI_IMRbits.MR3 = 1;                            // Unmask bit 3 to enable external interrupt on line 3
}