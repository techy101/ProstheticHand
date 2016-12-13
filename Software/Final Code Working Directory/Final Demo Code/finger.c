#include "finger.h"
#include "defines.h"
#include "system.h"

/*
Prosthetic Hand Senior Design Project
12/12/2016
Donnell Jones
Rachel Mertz
Matthew Varas

 * File name:
    finger.c

 * Description:
    Finger All functions related to control of individual fingers


*/




/**********************/
// Another playground for Rachel

void set_finger_name(struct finger *fngr)   {

     strcpy(fngr->name, "fngr_pointer");/*strcpy(fngr_middle.name, "fngr_middle");
     strcpy(fngr_ring.name, "fngr_ring");
     strcpy(fngr_pinky.name, "fngr_pinky");
     strcpy(fngr_thumb.name, "fngr_thumb");*/
}
/*************************/




/***************  Input Capture Timer Initialization  ***************
/                                                                    /
/    Function Name: void init_input_capture()                            /
/                                                                    /
/    Description:                                                     /
/        This function performs initial configuration of timers             /
/        2 and 3 which are used for motor encoder input capture            /
/        of fingers (2) and thumb (3)                                /
/                                                                    /
/    Preconditions:                                                     /
/        None                                                             /
/                                                                    /
/    Postconditions:                                                     /
/        Timers 2 and 3 are configured but not yet active              /
/                                                                    /
/*******************************************************************/
void init_input_capture() {

    // Configure timer 3 (Used for pointer, middle, ring, pinky)
    // 0 values not strictly needed as all are reset states. Used for testing and clarity
    RCC_APB1ENR.TIM3EN = 1;                                                     // Enable clock gating for timer module 3
    TIM3_CR1.CEN = 0;                                                           // Disable timer/counter
    TIM3_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
    TIM3_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
    TIM3_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
    TIM3_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)

    // Configure Timer 2 (Used for thumb)
    RCC_APB1ENR.TIM2EN = 1;                                                     // Enable clock gating for timer module 5
    TIM2_CR1.CEN = 0;                                                           // Disable timer/counter
    TIM2_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
    TIM2_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
    TIM2_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
    TIM2_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)

    // Calculate period of TIM2_CLK and TIM3_CLK in ms. Used in state calculations
    encoder_timer_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
}



/*****************  Input Capture Timer Activation  *****************
/                                                                    /
/    Function Name: void activate_input_capture()                    /
/                                                                    /
/    Description:                                                     /
/        This function activates interrupts for timers 2 and 3            /
/        used for input capture timing                                     /
/                                                                    /
/    Preconditions:                                                     /
/        Timers 2 and 3 have been initialized                             /
/                                                                    /
/    Postconditions:                                                     /
/        Timers 2 and 3 are running and interrupts are activated            /
/                                                                    /
/*******************************************************************/
void activate_input_capture() {

    TIM3_DIER.UIE = 1;                                                          // Enable overflow interrupt Timer 3
    TIM2_DIER.UIE = 1;                                                          // Enable overflow interrupt for Timer 2
    NVIC_IntEnable(IVT_INT_TIM3);                                               // Enable timer 3 ISR
    NVIC_IntEnable(IVT_INT_TIM2);                                               // Enable timer 2 ISR
    TIM3_CR1.CEN = 1;                                                           // Enable timer 3
    TIM2_CR1.CEN = 1;                                                           // Enable Timer 2
}



/*********************  Finger Initialization  **********************
/                                                                    /
/    Function Name: void init_finger(struct finger *fngr)            /
/                                                                    /
/    Description:                                                     /
/        This function sets pin masks and initialize all GPIO pins,  /
/        timers, PWM's and other finger attributs                    /
/                                                                    /
/    Preconditions:                                                     /
/        Finger instance has been instantiated and passed in            /
/                                                                    /
/    Postconditions:                                                     /
/        All pins and resources will be allocated to the finger            /
/                                                                    /
/*******************************************************************/
void init_finger(struct finger *fngr) {

    //Pointer Finger
    if (strcmp(fngr->name, "fngr_pointer") == 0) {
        // Configure pointer finger (Pin C6, Channel 1) input capture
        GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_6, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
        TIM3_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
        TIM3_CCER.CC1P = 0;                                                         // Set capture on rising edge event
        TIM3_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
        TIM3_CCER.CC1E = 1;                                                         // Enable capture on channel 1
        TIM3_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1

        // Configure encoder channel B
        GPIO_Config(&GPIOE_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

        // Configure Pointer finger PWM (Pin E9)
        PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);    // Set initial duty on Timer 1, channel 1
        PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                  // Start PWM

        // Configure flexiforce sensor
        ADC_Set_Input_Channel(_ADC_CHANNEL_7);
        
        //Configure motor driver current sensor
        ADC_Set_Input_Channel(_ADC_CHANNEL_4);
        
        // Configure Limit Switch External Interrupt
        GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_14, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
        
        
        
        
        
    }

    else if (strcmp(fngr->name, "fngr_middle") == 0) {
        // Configure middle finger (Pin C7, Channel 2) input capture
        GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_7, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
        TIM3_CCMR1_Input |= 0x100;                                                  // Set capture channel 2 as input on TI2 (CC2S = 01)
        TIM3_CCER.CC2P = 0;                                                         // Set capture on rising edge event
        TIM3_CCER.CC2NP = 0;                                                        // ^^ Continuation of above
        TIM3_CCER.CC2E = 1;                                                         // Enable capture on channel 2
        TIM3_DIER.CC2IE = 1;                                                        // Enable interrupt on capture channel 2

        // Configure encoder channel B
        GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

        // Configure Middle finger PWM (Pin E11)
        PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);     // Set initial duty on Timer 1, channel 2
        PWM_TIM1_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM1_CH2_PE11);                 // Start PWM

        // Configure flexiforce sensor
        ADC_Set_Input_Channel(_ADC_CHANNEL_9);
        
        //Configure motor driver current sensor
        ADC_Set_Input_Channel(_ADC_CHANNEL_8);
    }

    //Ring Finger
    else if (strcmp(fngr->name, "fngr_ring") == 0) {
        // Configure ring finger (Pin C8, Channel 3) input capture
        GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_8, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
        TIM3_CCMR2_Input |= 0x01;                                                   // Set capture channel 3 as input on TI3 (CC3S = 01)
        TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
        TIM3_CCER.CC3NP = 0;                                                        // ^^ Continuation of above
        TIM3_CCER.CC3E = 1;                                                         // Enable capture on channel 3
        TIM3_DIER.CC3IE = 1;                                                        // Enable interrupt on capture channel 3

        // Configure encoder channel B
        GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

        // Configure Ring finger PWM (Pin E13)
        PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);       // Set initial duty on Timer 1, channel 3
        PWM_TIM1_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM1_CH3_PE13);                 // Start PWM

        // Configure flexiforce sensor
        ADC_Set_Input_Channel(_ADC_CHANNEL_11);
        
        //Configure motor driver current sensor
        ADC_Set_Input_Channel(_ADC_CHANNEL_10);
    }

    //Pinky
    else if (strcmp(fngr->name, "fngr_pinky") == 0) {
        // Configure pinky finger (Pin C9, Channel 4) input capture
        GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_4, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
        TIM3_CCMR2_Input |= 0x100;                                                  // Set capture channel 4 as input on TI4 (CC4S = 01)
        TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
        TIM3_CCER.CC3NP = 0;                                                        // ^^ Continuation of above
        TIM3_CCER.CC4E = 1;                                                         // Enable capture on channel 4
        TIM3_DIER.CC4IE = 1;                                                        // Enable interrupt on capture channel 4

        // Configure encoder channel B
        GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

        // Configure Pinky finger PWM (Pin E14)
        PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, PINKY_PWM);      // Set initial duty on Timer 1, channel 4
        PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PE14);                 // Start PWM

        // Configure flexiforce sensor
        ADC_Set_Input_Channel(_ADC_CHANNEL_13);
       
        //Configure motor driver current sensor
        ADC_Set_Input_Channel(_ADC_CHANNEL_12);
    }

    //Thumb
    else if (strcmp(fngr->name, "fngr_thumb") == 0) {
        // Configure Thumb (Pin A5, Channel 1) input capture
        GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_5, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM2 | _GPIO_CFG_PULL_DOWN);
        TIM2_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
        TIM2_CCER.CC1P = 0;                                                         // Set capture on rising edge event
        TIM2_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
        TIM2_CCER.CC1E = 1;                                                         // Enable capture on channel 1
        TIM2_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1

        // Configure encoder channel B
        GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

        // Configure Thumb PWM (Pin B6)
        PWM_TIM4_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);     // Set initial duty on Timer 4, channel 1
        PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);                 // Start PWM

        // Configure flexiforce sensor
         ADC_Set_Input_Channel(_ADC_CHANNEL_3);
        
        //Configure motor driver current sensor
        ADC_Set_Input_Channel(_ADC_CHANNEL_2);
    }

    //Set Initial States
    fngr->position_actual = 0;                                // ****** Will change once limit switches and calibration are in place ******
    fngr->direction_desired = INITIAL_DIRECTION;
}



/********************  Sample Finger State  *************************
/                                                                    /
/    Function Name: sample_finger(struct)                             /
/    Return Type: None                                                     /
/                                                                    /
/    Description:                                                     /
/        This function samples and calculates all paramaters               /
/        associated with a finger instance.                              /
/        (Speed, position, direction, tip force,motor torque)            /
/                                                                    /
/    Preconditions:                                                     /
/        Finger has been instantiated                                     /
/        Finger instance has been passed in                             /
/                                                                    /
/    Postconditions:                                                     /
/        All parameters have been stored to struct instance members  /
/                                                                    /
/*******************************************************************/

//================= Currently set motor functions, this needs to be broken out to a dedicated function =============

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
    if (fngr->input_sig_frequency > 1200.0 || fngr->input_sig_frequency < 10.0)           // NEW: Handles startup error
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
    }

     if(fngr->position_actual <= FULLY_EXTENDED) {
         fngr->direction_desired = CONTRACT;
     }

     if(strcmp(fngr->name, "fngr_pointer") == 0) {
        POINTER_DIRECTION = fngr->direction_desired;
     }

     else if(strcmp(fngr->name, "fngr_middle") == 0) {
        MIDDLE_DIRECTION = fngr->direction_desired;
     }

     else if(strcmp(fngr->name, "fngr_ring") == 0) {
        RING_DIRECTION = fngr->direction_desired;
     }

     else if(strcmp(fngr->name, "fngr_pinky") == 0) {
        PINKY_DIRECTION = fngr->direction_desired;
     }

     else if(strcmp(fngr->name, "fngr_thumb") == 0) {
        THUMB_DIRECTION = fngr->direction_desired;
     }

    // Reset position counter
    fngr->position_temp = 0;
}




/************************  Move Finger ******************************
/                                                                    /
/    Function Name: move_finger(struct, int)                             /
/    Return Type: None                                                     /
/                                                                    /
/    Description:                                                     /
/        This function sets the motor speed for a finger via duty    /
/        cycle from the P control algorithm                            /
/                                                                    /
/    Preconditions:                                                     /
/        Finger has been initialized                                     /
/        Finger instance has been passed in                             /
/        Duty cycle is passed in from P control                      /
/                                                                    /
/    Postconditions:                                                     /
/        Finger motor is running at set speed / duty cycle            /
/                                                                    /
/*******************************************************************/
// set duty cycle returned from P control
void move_finger(struct finger *fngr, unsigned int duty_cycle)
{
     if(strcmp(fngr->name, "fngr_pointer") == 0) {
        PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);       // set new duty cycle
     }

     else if(strcmp(fngr->name, "fngr_middle") == 0) {
        PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);
     }

     else if(strcmp(fngr->name, "fngr_ring") == 0) {
        PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);
     }

     else if(strcmp(fngr->name, "fngr_pinky") == 0) {
        PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, PINKY_PWM);
     }

     else if(strcmp(fngr->name, "fngr_thumb") == 0) {
        PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);
     }
}





/**********************  Print Debug Values  ************************
/                                                                    /
/    Function Name: print_finger_info(struct)                            /
/    Return Type: None                                                     /
/                                                                    /
/    Description:                                                     /
/        This function prints all current state values of the finger /
/        to the terminal for debug                                     /
/                                                                    /
/    Preconditions:                                                     /        ***Needs to be adapted for new multi-UART print functions
/        Finger has been initialized                                     /
/        Finger instance has been passed in                             /
/                                                                    /
/    Postconditions:                                                     /
/        All state values have been printed to the terminal             /
/                                                                    /
/*******************************************************************/
void print_finger_info( struct finger *fngr) {

    //Local strings
    char frequency_text[STR_MAX];
    char position_text[STR_MAX];
    char direction_text[STR_MAX];

    //Print name of current finger to terminal
    UART1_Write_Text("\n\rFinger Name: ");
    UART1_Write_Text(fngr->name);
    UART1_Write_Text("\n\r");

    // Print input capture signal frequency to terminal
    LongWordToStr(fngr->input_sig_frequency, frequency_text);
    UART1_Write_Text("Frequency of incoming signal (Hz): ");
    UART1_Write_Text(frequency_text);
    UART1_Write_Text("\n\r");

    // Print actual direction of movement to terminal
    UART1_Write_Text("Direction of movement:             ");
    if(fngr->direction_actual == EXTEND)
         UART1_Write_Text("EXTEND ");
    else
        UART1_Write_Text("CONTRACT ");
    UART1_Write_Text("\n\r");

    // Print total number of input events (position) to terminal
    LongToStr(fngr->position_actual, position_text);
    UART1_Write_Text("Position of finger:                ");
    UART1_Write_Text(position_text);
    UART1_Write_Text("\n\n\n\r");

    // Reset counter for terminal printing
    terminal_print_count = 0;
}




/*********************  Proportional control for position  ******************
/                                                                            /
/    Function Name: Pcontrol_position(struct, unsigned long, unsigned long) /
/    Return Type: Unsigned int                                                     /
/                                                                            /
/    Description:                                                             /
/        This function applies P control to position values                     /
/        (encoder ticks) and returns a corresponding duty cycle.                    /
/                                                                            /
/    Preconditions:                                                             /
/        Finger has been initialized                                             /
/        Finger starts fully extended (limit switches have been hit)            /
/        Finger instance has been passed in                                     /
/        Setpoint and MPV are normalized position values                            /
/                                                                            /
/    Postconditions:                                                             /
/        Duty cycle returned is positive                                            /
/        Finger direction is set correctly relative to setpoint                    /
/                                                                            /
/***************************************************************************/
// apply P control to position to determine duty cycle. takes in encoder values (positions) and returns duty cycle.
// *** ONLY WORKS if finger begins fully extended, i.e. the limit switch is hit
// *** so counting up is contracting and counting down is extending.
unsigned int Pcontrol_position(struct finger *fngr, unsigned long SP, unsigned long MPV)
{
     unsigned int duty_cycle;

     if((SP-MPV) < 0)                                        // moved past SP
          fngr->direction_desired = EXTEND;                  // Move back
     else
         fngr->direction_desired = CONTRACT;                 // Keep going

     duty_cycle = position_K*abs(SP-MPV);                             // proportional control

     if(duty_cycle > 100)
          duty_cycle = 100;                                  // cap duty cycle
     else if(duty_cycle < 20)
           duty_cycle = 20;                                  // boost duty cycle

     return duty_cycle;
}




/*********************  Proportional control for force  *********************
/                                                                            /
/    Function Name: Pcontrol_force(struct, int, int)                             /
/    Return Type: Unsigned int                                                     /
/                                                                            /
/    Description:                                                             /
/        This function applies P control to force values                     /
/        (from Flexiforce sensor on fingertip) and                             /
/        returns a corresponding duty cycle.                                    /
/                                                                            /
/    Preconditions:                                                             /
/        Finger has been initialized                                             /
/       Finger starts fully extended (limit switches have been hit)            /
/        Finger instance has been passed in                                     /
/        Setpoint and MPV are normalized force values                            /
/                                                                            /
/    Postconditions:                                                             /
/        Duty cycle returned is positive                                            /
/        Finger direction is set correctly relative to setpoint                    /
/                                                                            /
/***************************************************************************/
unsigned int Pcontrol_force(struct finger *fngr, unsigned int SP, unsigned int MPV)
{
     unsigned int duty_cycle;

     if((SP-MPV) < 0)                                        // moved past SP
          fngr->direction_desired = EXTEND;                  // Move back
     else
         fngr->direction_desired = CONTRACT;                 // Keep going

     duty_cycle = force_K*abs(SP-MPV);                             // proportional control

     if(duty_cycle > 100)
          duty_cycle = 100;                                  // cap duty cycle
     else if(duty_cycle < 20)
           duty_cycle = 20;                                  // boost duty cycle

     return duty_cycle;
}














/**************  Finger Encoder Interrupt Handlers  *****************
/                                                                    /
/    Description:                                                     /
/        These ISR's handle all encoder input capture and overflow   /
/        events for timers 2 and 3. These are capture channels for   /
/        motor encoder channel A on all fingers                             /
/                                                                    /
/    Preconditions:                                                     /
/        Timers 2 and 3 have been initialized                             /
/        Input capture channels have been configured                     /
/                                                                    /
/*******************************************************************/



// Interrupt handler for Timer 3 (Handles Pointer, Middle, Ring, Pinky overflows AND Capture events)
void thumb_input_capture_ISR() iv IVT_INT_TIM3 {

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
        fngr_pointer.enc_chan_b = POINTER_ENCODER_B;                            // Sample the second encoder channel state (For direction)
        fngr_pointer.position_temp++;                                           // Increment total input capture event counter
    }


    // Timer 3, Channel 2 (Pin C7) Middle finger input capture event
    if (TIM3_SR.CC2IF == 1) {
        fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
        fngr_middle.enc_end_time = TIM3_CCR2;                                   // Read stored input capture time
        fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
        fngr_middle.enc_overflow_end = tim3_overflow_count;                     // Store number of timer 3 overflows for Middle finger
        fngr_middle.enc_chan_b = MIDDLE_ENCODER_B;                              // Sample the second encoder channel state (For direction)
        fngr_middle.position_temp++;                                            // Increment total input capture event counter
    }

    // Timer 3, Channel 3 (Pin C8) Ring finger input capture event
    if (TIM3_SR.CC3IF == 1) {
        fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
        fngr_ring.enc_end_time = TIM3_CCR3;                                     // Read stored input capture time
        fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
        fngr_ring.enc_overflow_end = tim3_overflow_count;                       // Store number of timer 3 overflows for Ring finger
        fngr_ring.enc_chan_b = RING_ENCODER_B;                                  // Sample the second encoder channel state (For direction)
        fngr_ring.position_temp++;                                              // Increment total input capture event counter
    }

    // Timer 3, Channel 4 (Pin C9) Pinky input capture event
    if (TIM3_SR.CC4IF == 1) {
        fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
        fngr_pinky.enc_end_time = TIM3_CCR4;                                    // Read stored input capture time
        fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
        fngr_pinky.enc_overflow_end = tim3_overflow_count;                      // Store number of timer 3 overflows for Pinky
        fngr_pinky.enc_chan_b = PINKY_ENCODER_B;                                // Sample the second encoder channel state (For direction)
        fngr_pinky.position_temp++;                                             // Increment total input capture event counter
    }
}


// Interrupt handler for Timer 2 (Handles thumb overflows AND Capture events)
void fingers_input_capture_ISR() iv IVT_INT_TIM2 {

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
        fngr_thumb.enc_chan_b = THUMB_ENCODER_B;                                // Sample the second encoder channel (For direction)
        fngr_thumb.position_temp++;                                             // Increment total input capture event counter
    }
}






/***************  Limit Switch Interrupt Handlers  ******************
/                                                                    /
/    Description:                                                     /
/        These ISR's handle all finger limit switch ext interrupts   /
/                                                                    /
/    Preconditions:                                                     /
/       All finger limit switches have been initialized             /
/       Limit switch external interrupts have been configured       /
/                                                                    /
/*******************************************************************/

/*
Thumb: EXTI 8
Pointer: EXTI 15
Middle: EXTI 12
Ring: EXTI 14
Pinky: EXTI 10 */