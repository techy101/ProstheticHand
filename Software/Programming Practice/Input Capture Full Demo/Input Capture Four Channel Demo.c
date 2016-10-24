//Input capture demo for four encoder input channels. 

/* Hookup:
   * Pointer finger motor encoder
     * Encoder Channel A: A6
     * Encoder Channel B: D0
     
   * Middle finger motor encoder
     * Encoder Channel A: C7
     * Encoder Challen B: D1
     
   * Ring finger motor encoder
     * Encoder Channel A: B0
     * Encoder Channel B: D2
     
   * Pinky motor encoder
     * Encoder Channel A: B1
     * Encoder Channel B: D3
     
   * Thumb motor encoder
     * Encoder Channel A: A5
     * Encoder Channel B: D4
     
*/


// Define second encoder channels for each motor. Used for direction checking
#define FNGR_POINTER_ENC_B                               GPIOD_IDR.B0           // Pin D0
#define FNGR_MIDDLE_ENC_B                                GPIOD_IDR.B1           // Pin D1
#define FNGR_RING_ENC_B                                  GPIOD_IDR.B2           // Pin D2
#define FNGR_PINKY_ENC_B                                 GPIOD_IDR.B3           // Pin D3
#define FNGR_THUMB_ENC_B                                 GPIOD_IDR.B4           // Pin D4

// Define other parameters
#define STR_MAX                                          15                     //Max string size
#define UART_BAUD_RATE                                   115200


/**************  Constants  **************/
unsigned long MCU_FREQUENCY = 168000000;                                        // Microcontroller clock speed in Hz
unsigned long ENCODER_TIM_RELOAD = 65535;                                       // Auto Reload value for Timer 2 (16 bit register)
unsigned int ENCODER_TIM_PSC = 100;                                             // Prescaler for timer 2 (Used for encoder CCP timing)
unsigned int TERMINAL_PRINT_THRESH = 40;                                        // Number of polling events before a terminal print is executed


/**************  Global Variables  **************/
long double timer2_period_ms;                                                   // TIM2_CLK calculated period
long double timer3_period_ms;                                                   // TIM3_CLK calculated period
unsigned int poll_flag;                                                         // Flag to enter main loop
unsigned int terminal_print_count;                                              // ** DEBUG ** Flag to print statistics to terminal (via UART)
unsigned long overflow_count;                                                   // Current number of overflow events on timer
unsigned long tim2_overflow_count;
unsigned long tim3_overflow_count;


/**************  Function Prototypes  **************/
void timer2_ISR();                                                              // Interrupt handler for Timer 2
void timer3_ISR();                                                              // Interrupt handler for Timer 3
void init_GPIO();                                                               // Initialization of MCU I/O
void init_UART();                                                               // Initialization of UART for terminal communication
void init_input_capture();
void init_timer4();                                                             // Initialization of timer 4 (Used for fixed polling rate)
void calc_finger_state(struct finger *fngr);                                    // Function to determine state of finger
void print_finger_info(struct finger *fngr);                                    // Function to print finger state info to terminal
void calc_timer_values(struct finger *fngr);                                    // Function to calculate motor speed, etc...


/**************  Generic Finger Struct Definition  **************/
struct finger {
        char name[STR_MAX];                                                     // Name of finger
        long position_temp;                                                     // Number of input capture events since last sample. Used for finger position
        long position_actual;                                                   // Calculated position of finger 
        unsigned int direction_actual;                                          // Actual direction of motor movement as read from encoder
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


// Main Starts here 
void main() {
        
        // Initializations 
        init_UART();
        init_GPIO();

        //Define names of fingers 
        strcpy(fngr_pointer.name, "Pointer");
        strcpy(fngr_middle.name, "Middle");
        strcpy(fngr_ring.name, "Ring");
        strcpy(fngr_pinky.name, "Pinky");
        strcpy(fngr_thumb.name, "Thumb");

        // Program start terminal verification 
        UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
        delay_ms(500);
        
        //Begin Timers and input capture
        init_timer4();
        init_input_capture();
        
        // Infinite Loop
        while(1) {

           if (poll_flag) {                                                     // Calculate finger state values (Set by timer 3)
              poll_flag = 0;                                                    // Clear flag
              calc_finger_state(&fngr_pointer);                                 // Call state calculation function for each finger
              calc_finger_state(&fngr_middle);
              calc_finger_state(&fngr_ring);
              calc_finger_state(&fngr_pinky);
              calc_finger_state(&fngr_thumb);
           }
             
           if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal

              print_finger_info(&fngr_pointer);
              print_finger_info(&fngr_middle);
              print_finger_info(&fngr_ring);
              print_finger_info(&fngr_pinky);
              print_finger_info(&fngr_thumb);
              UART1_Write_Text("\n\n\n\n\n\n\n\r");
           }
        }
}       // Main ends here






/**************  Interrupt Handlers  **************/

// Interrupt handler for Timer 2 Thumb (Overflows AND Capture events)
void timer2_ISR() iv IVT_INT_TIM2 {

    // Timer 2 Overflow
    if(TIM2_SR.UIF == 1) {                                                     
        TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
        tim2_overflow_count++;                                                       // Increment overflow counter
    }

    // Channel 1 (Pin A0) Pointer finger input capture event
    if (TIM2_SR.CC1IF == 1) {    
        fngr_thumb.enc_start_time = fngr_thumb.enc_end_time;                // Store previous captured value for next calculation
        fngr_thumb.enc_end_time = TIM2_CCR1;                                  // Read stored input capture time
        fngr_thumb.enc_overflow_start = fngr_thumb.enc_overflow_end;        // Store previous overflow value for next calculation
        fngr_thumb.enc_overflow_end = tim2_overflow_count;                         // Store number of timer 2 overflows for this finger
        fngr_thumb.enc_chan_b = FNGR_THUMB_ENC_B;                           // Sample the second encoder channel state (For direction)
        fngr_thumb.position_temp++;                                           // Increment total input capture event counter
    }
}


// Interrupt handler for Timer 3
void timer3_ISR() iv IVT_INT_TIM3 {

    GPIOD_ODR.B5 = 1;
    // Timer 3 Overflow
    if(TIM3_SR.UIF == 1) {
        TIM3_SR.UIF = 0;                                                        // Clear timer 3 interrupt bit
        tim3_overflow_count++;                                                       // Increment overflow counter
    }

    // Channel 1 (Pointer finger) input capture event
    if (TIM3_SR.CC1IF == 1) {
        fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;                // Store previous captured value for next calculation
        fngr_pointer.enc_end_time = TIM3_CCR1;                                  // Read stored input capture time
        fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;        // Store previous overflow value for next calculation
        fngr_pointer.enc_overflow_end = tim3_overflow_count;                         // Store number of timer 3 overflows for this finger
        fngr_pointer.enc_chan_b = FNGR_POINTER_ENC_B;                           // Sample the second encoder channel state (For direction)
        fngr_pointer.position_temp++;                                           // Increment total input capture event counter
    }


    // Channel 2 (Middle finger) input capture event
    if (TIM3_SR.CC2IF == 1) {
        fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
        fngr_middle.enc_end_time = TIM3_CCR2;                                   // Read stored input capture time
        fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
        fngr_middle.enc_overflow_end = tim3_overflow_count;                          // Store number of timer 3 overflows for this finger
        fngr_middle.enc_chan_b = FNGR_MIDDLE_ENC_B;                            // Sample the second encoder channel state (For direction)
        fngr_middle.position_temp++;                                          // Increment total input capture event counter
    }

    // Channel 3 (Ring finger) input capture event
    if (TIM3_SR.CC3IF == 1) {
        fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
        fngr_ring.enc_end_time = TIM3_CCR3;                                     // Read stored input capture time
        fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
        fngr_ring.enc_overflow_end = tim3_overflow_count;                            // Store number of timer 3 overflows for this finger
        fngr_ring.enc_chan_b = FNGR_RING_ENC_B;                              // Sample the second encoder channel state (For direction)
        fngr_ring.position_temp++;                                            // Increment total input capture event counter
    }

    // Channel 4 (Pinky) input capture event
    if (TIM3_SR.CC4IF == 1) {
        fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
        fngr_pinky.enc_end_time = TIM3_CCR4;                                    // Read stored input capture time
        fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
        fngr_pinky.enc_overflow_end = tim3_overflow_count;                           // Store number of timer 3 overflows for this finger
        fngr_pinky.enc_chan_b = FNGR_PINKY_ENC_B;                             // Sample the second encoder channel state (For direction)
        fngr_pinky.position_temp++;                                           // Increment total input capture event counter
    }
    
    GPIOD_ODR.B5 = 0;
}                                                                


// Interrupt handler for Timer 4
void timer4_ISR() iv IVT_INT_TIM4 {

    TIM4_SR.UIF = 0;                                                            // Clear timer 4 interrupt flag
    poll_flag = 1;                                                              // Set poll flag for main loop
    terminal_print_count++;                                                     // Increment the debug print counter
}



/**************  Initialization Functions  **************/

// Initialize MCU GPIO's and other hardware
void init_GPIO() {

    // Configure GPIO's for secondary motor encoder channels
    GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
    GPIO_Digital_Output(&GPIOD_Base, _GPIO_PINMASK_5);                          // **DEBUG** For timing interrupt handler
}



// Initialize UART
void init_UART() {
        
    UART1_Init(UART_BAUD_RATE);                                                 // Configure UART 1
    Delay_ms(200);                                                              // Wait for UART to stabilize
    UART_Write_Text("\rUART Init Complete\r\n");                                // Print test statement to terminal
}                                                        


// Initialize Input Capture on Timer 3 Channel 1
void init_input_capture() {



    // Configure timer 3 (Used for pointer, middle, ring, pinky)
    RCC_APB1ENR.TIM3EN = 1;                                                 // Enable clock gating for timer module 3
    TIM3_CR1.CEN = 0;                                                       // Disable timer/counter
    TIM3_CR2.TI1S = 0;                                                      // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
    TIM3_PSC = ENCODER_TIM_PSC;                                             // Set timer 3 prescaler
    TIM3_ARR = ENCODER_TIM_RELOAD;                                          // Set timer 3 Auto Reload value
    TIM3_CR1 |= 0;                                                          // Set counter direction as upcounting (DIR bit)
    
    // Configure pointer finger (Pin A6, Channel 1) input capture
    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH1_PA6);             // Configure alternate function for A6 as Timer 3 Channel 1
    TIM3_CCMR1_Input |= 0x01;                                               // Set capture channel 1 as input on TI1 (CC1S = 01)
    TIM3_CCER.CC1P = 0;                                                     // Set capture on rising edge event
    TIM3_CCER.CC1NP = 0;
    TIM3_CCER.CC1E = 1;                                                     // Enable capture on channel 1
    TIM3_DIER.CC1IE = 1;                                                    // Enable interrupt on capture channel 1

    // Configure middle finger (Pin C7, Channel 2) input capture
    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH2_PC7);             // Configure alternate function for pin C7 as Timer 3 Channel 2
    TIM3_CCMR1_Input |= 0x100;                                              // Set capture channel 2 as input on TI2 (CC2S = 01)
    TIM3_CCER.CC2P = 0;                                                     // Set capture on rising edge event
    TIM3_CCER.CC2NP = 0;
    TIM3_CCER.CC2E = 1;                                                     // Enable capture on channel 2
    TIM3_DIER.CC2IE = 1;                                                    // Enable interrupt on capture channel 2
    
    // Configure ring finger (Pin B0, Channel 3) input capture
    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH3_PB0);             // Configure alternate function for pin B0 as Timer 3 Channel 3
    TIM3_CCMR2_Input |= 0x01;                                               // Set capture channel 3 as input on TI3 (CC3S = 01)
    TIM3_CCER.CC3P = 0;                                                     // Set capture on rising edge event
    TIM3_CCER.CC3NP = 0;
    TIM3_CCER.CC3E = 1;                                                     // Enable capture on channel 2
    TIM3_DIER.CC3IE = 1;                                                    // Enable interrupt on capture channel 3
    
    // Configure pinky finger (Pin B1, Channel 4) input capture
    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH4_PB1);             // Configure alternate function for pin B1 as Timer 3 Channel 4
    TIM3_CCMR2_Input |= 0x100;                                              // Set capture channel 4 as input on TI4 (CC4S = 01)
    TIM3_CCER.CC3P = 0;                                                     // Set capture on rising edge event
    TIM3_CCER.CC3NP = 0;
    TIM3_CCER.CC4E = 1;                                                     // Enable capture on channel 2
    TIM3_DIER.CC4IE = 1;                                                    // Enable interrupt on capture channel 4
    
    
    // Configure Timer 2 (Used for thumb)
    RCC_APB1ENR.TIM2EN = 1;                                                 // Enable clock gating for timer module 5
    TIM2_CR1.CEN = 0;                                                       // Disable timer/counter
    TIM2_CR2.TI1S = 0;                                                      // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
    TIM2_PSC = ENCODER_TIM_PSC;                                             // Set timer 3 prescaler
    TIM2_ARR = ENCODER_TIM_RELOAD;                                          // Set timer 3 Auto Reload value
    TIM2_CR1 |= 0;                                                          // Set counter direction as upcounting (DIR bit)

    // Configure Thumb (Pin A5, Channel 1) input capture
    GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA5);             // Configure alternate function for A5 as Timer 2 Channel 1
    TIM2_CCMR1_Input |= 0x01;                                               // Set capture channel 1 as input on TI1 (CC1S = 01)
    TIM2_CCER.CC1P = 0;                                                     // Set capture on rising edge event
    TIM2_CCER.CC1NP = 0;
    TIM2_CCER.CC1E = 1;                                                     // Enable capture on channel 1
    TIM2_DIER.CC1IE = 1;                                                    // Enable interrupt on capture channel 1
    

    // Configure timer interrupts
    TIM3_DIER.UIE = 1;                                                      // Enable overflow interrupt Timer 3
    TIM2_DIER.UIE = 1;                                                      // Enable overflow interrupt for Timer 2
    NVIC_IntEnable(IVT_INT_TIM3);                                           // Enable timer 3 ISR
    NVIC_IntEnable(IVT_INT_TIM2);                                           // Enable timer 2 ISR
    TIM3_CR1.CEN = 1;                                                       // Enable timer 3
    TIM2_CR1.CEN = 1;                                                       // Enable Timer 2

    // Calculate period of TIM2_CLK in ms
    timer3_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
}



// Initialize Timer 4 (Interrupts every 100ms to poll encoder state)
void init_timer4() {

    RCC_APB1ENR.TIM4EN = 1;                                                     // Enable clock for timer 4
    TIM4_CR1.CEN = 0;                                                           // Disable timer/counter
    TIM4_PSC = 279;                                                             // Set timer 4 prescaler
    TIM4_ARR = 59999;                                                           // Set timer 4 overflow value
    NVIC_IntEnable(IVT_INT_TIM4);                                               // Enable timer 4 interrupt
    TIM4_DIER.UIE = 1;                                                          // Timer 4 update interrupt enable
    TIM4_CR1.CEN = 1;                                                           // Enable timer/counter
}





// Function to calculate statistics finger encoder 
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
    fngr->input_sig_period = (long double) fngr->enc_total_ticks * timer3_period_ms;
    
    // Calculate frequency of captured signal (Hz)
    fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;

    // Check direction of motor movement and calculate position
    if (fngr->enc_chan_b == 1) {                                                // Clockwise
            fngr->direction_actual = 1;
            fngr->position_actual += fngr->position_temp;                       // Calculate new position
    }

    else if (fngr->enc_chan_b == 0) {                                           // Counter Clockwise
            fngr->direction_actual = 0;
            fngr->position_actual -= fngr->position_temp;                       // Calculate new position
    }

    else {                                                                      // ERROR: Invalid direction state
            fngr->direction_actual = 7;
    }
    
    // Reset position counter
    fngr->position_temp = 0;
}


// Function to print all statistics to terminal (This is for testing only. Do not move into final code)
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

    IntToStr(fngr->direction_actual, direction_text);                           // Print direction of movement to terminal
    UART1_Write_Text("Direction of movement:             ");
    UART1_Write_Text(direction_text);
    UART1_Write_Text("\n\r");                        
    
    LongToStr(fngr->position_actual, position_text);                            // Print total number of input events (position) to terminal
    UART1_Write_Text("Position of finger:                ");
    UART1_Write_Text(position_text);
    UART1_Write_Text("\n\n\n\r");        

    terminal_print_count = 0;                                                   // Reset counter for terminal printing
}