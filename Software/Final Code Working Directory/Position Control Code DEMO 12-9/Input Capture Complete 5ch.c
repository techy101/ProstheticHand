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


// Define second encoder channels for each motor. Used for direction checking
#define FNGR_POINTER_ENC_B                               GPIOE_IDR.B12          // Pin E12
#define FNGR_MIDDLE_ENC_B                                GPIOA_IDR.B11          // Pin A11
#define FNGR_RING_ENC_B                                  GPIOB_IDR.B15          // Pin B15
#define FNGR_PINKY_ENC_B                                 GPIOD_IDR.B9           // Pin D9
#define FNGR_THUMB_ENC_B                                 GPIOC_IDR.B11          // Pin C11

// NEW
#define POINTER_PWM                                        _PWM_CHANNEL1                // Chan   - E9  - TIM1 CH1 PWM Channel used for pointer finger
#define POINTER_DIRECTION                                GPIOE_ODR.B10                // Output - E10 - Direction pin for Pointer motor driver


// Define other parameters
#define STR_MAX                                          15                     // Max string size
#define UART_BAUD_RATE                                   115200                 // UART Baud rate


/* ------- DEFINE ANALOG WATCHDOG STUFFS --------*/
// Define variables 1 (mode = 0)
#define high_level        400
#define low_level         0
// Define variable 2  (mode = 1)
#define high_level2        4095
#define low_level2         400


/*****************  Constants  ******************/
unsigned long MCU_FREQUENCY = 168000000;                                        // Microcontroller clock speed in Hz
unsigned long ENCODER_TIM_RELOAD = 65535;                                       // Auto Reload value for encoder CCP timers (16 bit register)
unsigned int ENCODER_TIM_PSC = 100;                                             // Prescaler for encoder CCP timers
unsigned int SAMPLE_TIM_RELOAD = 59999;                                         // Auto reload value for sampling timer (100ms)
unsigned int SAMPLE_TIM_PSC = 279;                                              // Prescaler for sampling timer
unsigned int TERMINAL_PRINT_THRESH = 5;                                        // Number of polling events

// NEW
unsigned long PWM_FREQ_HZ = 10000;                                              // PWM base frequency
int EXTEND = 1;                                                                 // Arbitrarily assigned - reliant on encoder orientation
int CONTRACT = 0;
long FULLY_EXTENDED = 0;                                                        // Lower bound for position
unsigned long FULLY_CONTRACTED = 3000;                                          // Higher bound for position
unsigned int NORMALIZATION_CONSTANT = 1;                                       // "Self-explanatory" - was 4


/**************  Global Variables  **************/
long double encoder_timer_period_ms;                                            // Period in ms of timers used for motor encoder input capture
unsigned int poll_flag;                                                         // Flag to enter main loop
unsigned int terminal_print_count;                                              // ** DEBUG ** Flag to print statistics to terminal (via UART)
unsigned long tim2_overflow_count;                                              // Overflow counter for timer 2
unsigned long tim3_overflow_count;                                              // Overflow counter for timer 3
int analogGo = 0;
int goStatus = 0;

// NEW
unsigned int pwm_period;                                                        // Base timer period of PWM - needed for duty cycle calculations


/*************  Function Prototypes  ************/
void timer2_ISR();                                                              // Interrupt handler for Timer 2
void timer3_ISR();                                                              // Interrupt handler for Timer 3
void init_GPIO();                                                               // Initialization of MCU I/O
void init_UART();                                                               // Initialization of UART for terminal communication
void init_input_capture();
void init_timer11();                                                            // Initialization of timer 11 (Used for fixed polling rate)
void calc_finger_state(struct finger *fngr);                                    // Function to determine state of finger
void print_finger_info(struct finger *fngr);                                    // Function to print finger state info to terminal
void calc_timer_values(struct finger *fngr);                                    // Function to calculate motor speed, etc...
void ADC_AWD();               // ADC interrupt handler
void InitTimer5();            // Timer 5 init
void Timer5_interrupt();      // Timer 5 interrupt handler

// NEW
void init_pointer_PWM();
 
 
// NEW P control based on position
unsigned int Pcontrol_position(struct finger *, unsigned long, unsigned long);
void move_finger(struct finger *, unsigned int);

int setP = 3000;            // setpoint - desired position. normalized for 0-1000 range. CHANGE TO 3000 AND TEST CONTROL FOR DEMO.
int const MARGIN = 30;     // accuracy of PV - 1.5% from normalization constant
float const K = 1000.0;      // proportion constant for P control
unsigned int duty_cycle = 0;            // initial
char toStr[STR_MAX];                    // convenient


/**************  Generic Finger Struct Definition  **************/
struct finger {
        char name[STR_MAX];                                                     // Name of finger
        long position_temp;                                                     // Number of input capture events since last sample. Used for finger position
        long position_actual;                                                   // Calculated position of finger 
        unsigned int direction_actual;                                          // Actual direction of motor movement as read from encoder
        
        // NEW
        unsigned int direction_desired;                                                // Desired direction of movement of finger
        
        
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
};


// Create Finger Structs
struct finger fngr_pointer;
struct finger fngr_middle;
struct finger fngr_ring;
struct finger fngr_pinky;
struct finger fngr_thumb;


// NEW
void init_finger(struct finger *);                                    // Sets initial position of finger to 0 and direction to CONTRACT


// Main Starts here 
void main() {
        
        // Initializations 
        init_UART();                                                            // Configure and Initialize UART serial communications
        init_GPIO();                                                            // Configure MCU I/O
        init_pointer_PWM();

        // Initialize stuff for AWD
        InitTimer5();                  // Timer3 init

        /* ------------ ADC Initialization ------------ */
                ADC_Set_Input_Channel(_ADC_CHANNEL_3);     // Set active ADC channels
                ADC1_Init();                                                // Initialize ADC1

                /* ------------ AWD Initialization ------------ */
                ADC1_LTR = low_level;        // Set AWD guard window initial lower threshold
                ADC1_HTR = high_level;       // Set AWD guard window initial upper threshold
                ADC1_CR2bits.CONT = 1;       // Enable ADC1 continuous conversion mode
                ADC1_SQR3bits.SQ1 = 3;       // Set first channel in continuous coversion sequence to channel 3
                ADC1_SQR3bits.SQ2 = 4;       // Set second channel in continuous coversion sequence to channel 4 - NEW
                ADC1_CR1bits.AWDSGL = 1;     // Enable single channel monitoring mode for AWD
                ADC1_CR1 |= 3;               // Set channel 3 as the single monitored AWD channel
                ADC1_CR1bits.AWDEN = 1;      // Enable Analog watchdog on regular channels
                ADC1_CR2bits.SWSTART = 1;    // Start ADC1 Conversions
                ADC1_CR1bits.AWDIE = 1;      // Enable analog watchdog interrupt
                NVIC_IntEnable(IVT_INT_ADC); // Enable global ADC interrupt

        // Define names of finger struct instances
        strcpy(fngr_pointer.name, "fngr_pointer");
        strcpy(fngr_middle.name, "fngr_middle");
        strcpy(fngr_ring.name, "fngr_ring");
        strcpy(fngr_pinky.name, "fngr_pinky");
        strcpy(fngr_thumb.name, "fngr_thumb");
        
        // NEW
        init_finger(&fngr_pointer);

        // Program start terminal verification 
        UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
        delay_ms(500);
        
        // Begin Timers and input capture
        init_timer11();                                                         // Initialize timer 11, used for sampling
        init_input_capture();                                                   // Initialize input capture channels
        
        // Infinite Loop
        while(1) {
                       /*if(analogGo) {*/
                                if (poll_flag) {                                                     // Calculate finger state values (Set by timer 3)
                                  poll_flag = 0;                                                    // Clear flag
                                  calc_finger_state(&fngr_pointer);                                 // Call state calculation function for each finger - equivalent of sampling
                                  
                                  
                                  /*calc_finger_state(&fngr_middle);
                                  calc_finger_state(&fngr_ring);
                                  calc_finger_state(&fngr_pinky);
                                  calc_finger_state(&fngr_thumb);*/
                                  
                                  /*duty_cycle = Pcontrol_position(&fngr_pointer, setP, fngr_pointer.position_actual);  // apply P control; input is finger, SP, MPV

                                  UART1_Write_Text("Position normalized is ");
                                  LongWordToStr(fngr_pointer.position_actual, toStr);               // Print
                                  UART1_Write_Text(toStr);
                                  UART1_Write_Text("\n\r");

                                  UART1_Write_Text("Duty cycle returned is ");
                                  IntToStr(duty_cycle, toStr);               // Print
                                  UART1_Write_Text(toStr);
                                  UART1_Write_Text("\n\r");

                                  move_finger(&fngr_pointer, duty_cycle);*/       // apply duty cycle
                                  
                                  // stabilization: don't generate a new setpoint, just let it find once
                                  /*if(abs(fngr_pointer.position_actual - setP) < MARGIN)    // both values normalized
                                  {
                                           move_finger(&fngr_pointer, 0);       // stop the motor
                                           poll_flag = 0;
                                           NVIC_IntDisable(IVT_INT_TIM1_TRG_COM_TIM11);                   // stop sampling with timer 11
                                           UART1_Write_Text("\n** PV stabilized!!!! ");*/       // HOORAH
                                           /*IntToStr(MPV, toStr);
                                           UART1_Write_Text(ToStr);*/

                                           /*setP = (rand() % 95) + 20;    // generate a new setpoint
                                           UART_Write_Text("\n** New SP = ");   // display it
                                           IntToStr(setP, toStr);*/
                                           /*UART1_Write_Text(ToStr);
                                           moveFinger(60);       // start the motor
                                           NVIC_IntEnable(IVT_INT_TIM4);*/            // start sampling again
                                  /*}*/
              
                           }

                           if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal

                                  print_finger_info(&fngr_pointer);                                 // Print statistics to terminal for each finger
                                  /*print_finger_info(&fngr_middle);
                                  print_finger_info(&fngr_ring);
                                  print_finger_info(&fngr_pinky);
                                  print_finger_info(&fngr_thumb);*/
                                  UART1_Write_Text("\n\n\n\n\n\n\n\r");
                           }  
                        }        
        //}

           
} // Main ends here



/************** Position control ******************/

// apply P control to position to determine duty cycle. takes in encoder values (positions) and returns duty cycle.
// *** ONLY WORKS if finger begins fully extended, i.e. the limit switch is hit
// *** so counting up is contracting and counting down is extending.
unsigned int Pcontrol_position(struct finger *fngr, unsigned long SP, unsigned long MPV)
{
     unsigned int duty_cycle;

     if((SP-MPV) < 0)                // moved past SP
          fngr->direction_desired = EXTEND;              // Move back
     else
         fngr->direction_desired = CONTRACT;         // Keep going

     duty_cycle = K*abs(SP-MPV);    // proportional control
     
     if(duty_cycle > 100)
          duty_cycle = 100;       // cap duty cycle
     else if(duty_cycle < 20)
           duty_cycle = 20;       // boost duty cycle

     return duty_cycle;
}


// set duty cycle returned from P control
void move_finger(struct finger *fngr, unsigned int duty_cycle)
{
     if(strcmp(fngr->name, "fngr_pointer") == 0)
        PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);       // set new duty cycle
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
        fngr_thumb.enc_chan_b = FNGR_THUMB_ENC_B;                               // Sample the second encoder channel (For direction)
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
        fngr_pointer.enc_chan_b = FNGR_POINTER_ENC_B;                           // Sample the second encoder channel state (For direction)
        fngr_pointer.position_temp++;                                           // Increment total input capture event counter
    }


    // Timer 3, Channel 2 (Pin C7) Middle finger input capture event
    if (TIM3_SR.CC2IF == 1) {
        fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
        fngr_middle.enc_end_time = TIM3_CCR2;                                   // Read stored input capture time
        fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
        fngr_middle.enc_overflow_end = tim3_overflow_count;                     // Store number of timer 3 overflows for Middle finger
        fngr_middle.enc_chan_b = FNGR_MIDDLE_ENC_B;                             // Sample the second encoder channel state (For direction)
        fngr_middle.position_temp++;                                            // Increment total input capture event counter
    }

    // Timer 3, Channel 3 (Pin C8) Ring finger input capture event
    if (TIM3_SR.CC3IF == 1) {
        fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
        fngr_ring.enc_end_time = TIM3_CCR3;                                     // Read stored input capture time
        fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
        fngr_ring.enc_overflow_end = tim3_overflow_count;                       // Store number of timer 3 overflows for Ring finger
        fngr_ring.enc_chan_b = FNGR_RING_ENC_B;                                 // Sample the second encoder channel state (For direction)
        fngr_ring.position_temp++;                                              // Increment total input capture event counter
    }

    // Timer 3, Channel 4 (Pin C9) Pinky input capture event
    if (TIM3_SR.CC4IF == 1) {
        fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
        fngr_pinky.enc_end_time = TIM3_CCR4;                                    // Read stored input capture time
        fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
        fngr_pinky.enc_overflow_end = tim3_overflow_count;                      // Store number of timer 3 overflows for Pinky
        fngr_pinky.enc_chan_b = FNGR_PINKY_ENC_B;                               // Sample the second encoder channel state (For direction)
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
    GPIO_Digital_Input(&GPIOE_BASE, _GPIO_PINMASK_12);                          // Pointer motor encoder channel B
    GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_11);                          // Middle motor encoder channel B
    GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_15);                          // Ring motor encoder channel B
    GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_9);                           // Pinky motor encoder channel B
    GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_11);                          // Thumb motor encoder channel B
    
    // NEW: for motor control
    GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                         // Pointer direction
    GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);                          // Motor enable: may not use in this test
    
    // For AWD Debug light
    GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);                          // For awd debug test
}


 // Initialize pointer finger PWM
 void init_pointer_PWM( ) {
     // Configure Pointer finger PWM (Pin E9)
     pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);                                   // Set PWM base frequency to 100 Hz
     PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);    // Set 70% duty on Timer 1, channel 1
     PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                 // Start PWM
 }


 // Initialize finger positions to 0: carefully run motor to this point. Also start finger at CONTRACT.
 void init_finger(struct finger *fngr)
 {
      fngr->position_actual = 0;
      POINTER_DIRECTION = CONTRACT;        // skips over using POINTER_DIRECTION
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
    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH1_PC6);                 // Configure alternate function for C6 as Timer 3 Channel 1
    TIM3_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
    TIM3_CCER.CC1P = 0;                                                         // Set capture on rising edge event
    TIM3_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
    TIM3_CCER.CC1E = 1;                                                         // Enable capture on channel 1
    TIM3_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1

    // Configure middle finger (Pin C7, Channel 2) input capture
    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH2_PC7);                 // Configure alternate function for pin C7 as Timer 3 Channel 2
    TIM3_CCMR1_Input |= 0x100;                                                  // Set capture channel 2 as input on TI2 (CC2S = 01)
    TIM3_CCER.CC2P = 0;                                                         // Set capture on rising edge event
    TIM3_CCER.CC2NP = 0;                                                        // ^^ Continuation of above
    TIM3_CCER.CC2E = 1;                                                         // Enable capture on channel 2
    TIM3_DIER.CC2IE = 1;                                                        // Enable interrupt on capture channel 2
    
    // Configure ring finger (Pin C8, Channel 3) input capture
    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH3_PC8);                 // Configure alternate function for pin BC8 as Timer 3 Channel 3
    TIM3_CCMR2_Input |= 0x01;                                                   // Set capture channel 3 as input on TI3 (CC3S = 01)
    TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
    TIM3_CCER.CC3NP = 0;                                                         // ^^ Continuation of above
    TIM3_CCER.CC3E = 1;                                                         // Enable capture on channel 3
    TIM3_DIER.CC3IE = 1;                                                        // Enable interrupt on capture channel 3
    
    // Configure pinky finger (Pin C9, Channel 4) input capture
    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH4_PC9);                 // Configure alternate function for pin C9 as Timer 3 Channel 4
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
    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA5);                 // Configure alternate function for A5 as Timer 2 Channel 1
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
void calc_finger_state( struct finger *fngr) {

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
    if(fngr->position_actual >= FULLY_CONTRACTED) {  // don't run too far!
         fngr->direction_desired = EXTEND;
         POINTER_DIRECTION = EXTEND;
    }
    
     if(fngr->position_actual <= FULLY_EXTENDED) {
         fngr->direction_desired = CONTRACT;
         POINTER_DIRECTION = CONTRACT;
                 analogGo = 0;
     }
         
    // Reset position counter
    fngr->position_temp = 0;
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
    
    LongToStr(fngr->position_actual, position_text);                            // Print total number of input events (position) to terminal
    UART1_Write_Text("Position of finger:                ");
    UART1_Write_Text(position_text);
    UART1_Write_Text("\n\n\n\r");        

    terminal_print_count = 0;                                                   // Reset counter for terminal printing
}




// ADC INTERRUPT HANDLER
void ADC_AWD() iv IVT_INT_ADC ics ICS_AUTO {
      ADC1_CR1bits.AWDIE = 0;       // Disabling analog interrupt (disable)
      ADC1_SRbits.AWD = 0;          // Reset status bit
      if(ADC1_HTR <= 1000) {
            TIM5_SR.UIF = 0;        // Clear timer 3 interrupt bit
            TIM5_CNT = 0x00;        // Reset timer value to 0
            ADC1_HTR = high_level2; // Set high threshold to MAX
            ADC1_LTR = low_level2;  // Set high threshold to 400
            TIM5_DIER.UIE = 1;      // CC1 Update Interrupt Enable
      }else {
            TIM5_DIER.UIE = 0;      // Disable timer interrupt
            ADC1_HTR = high_level;  // Set high threshold to 400
            ADC1_LTR = low_level;   // Set low threshold to 0
            }
      ADC1_CR1bits.AWDIE = 1;       //Enable analog interrupt (enabled)
}


// TIMER5 INTERRUPT ( 3 seconds )
void InitTimer5(){
     RCC_APB1ENR.TIM5EN = 1;        // Enable clock gating for timer module 3
     TIM5_CR1.CEN = 0;              // Disable timer/counter
     TIM5_PSC = 7874;               // Set timer 3 prescaler (need to determine value)
     TIM5_ARR = 63999;              // Set timer 3 overflow value at max
     NVIC_IntEnable(IVT_INT_TIM5);  // Enable timer 3 interrupt
     TIM5_CR1.CEN = 1;              // Enable timer/counter
}

// TIMER5 INTERRUPT HANDLER
void Timer5_interrupt() iv IVT_INT_TIM5 { // Interrupt handler if 6 s have past
     TIM5_SR.UIF = 0;                     // Clear timer 3 interrupt bit
     ADC1_HTR = high_level;               // Set high threshold to 400
     ADC1_LTR = low_level;                // Set low threshold to 0
     TIM5_DIER.UIE = 0;                   // Disable timer interrupt
     analogGo = 1;
     GPIOD_ODR.B1 = 1;                              //DEBUG
}