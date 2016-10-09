// Input capture demo
// 10/8/2016


// Simulated encoder input: A0
// Interrupt timing pulse: E10



/* Description: 
		* This program tests and helps debug timing of incoming signals using input capture
		* Timer 2 interrupts every time it overflows OR a rising edge is detected on channel 1 (input capture)
		* Timer 2 ISR checks which of these has happened and executes appropriate code 
		* Timer 3 interrupts every time it overflows (100ms) and sets a flag to perform calculations in the main loop 
		* Every X times timer 3 has interrupted the main loop will print calculated and stored values to the terminal for debug 






/**************  Constants  **************/
const unsigned int UART_BAUD_RATE = 115200;				// Baud rate for UART connection 
const unsigned int STR_MAX = 15;						// Maximum string size for UART writes 
const unsigned int TIMER_2_PRESCALER = 0;				// Prescaler for timer 2 (Used for encoder CCP timing)
const unsigned int TERMINAL_PRINT_THRESH = 15;			// Number of polling events before a terminal print is executed 
const unsigned long TIMER_2_ARR = 65535;				// Auto Reload value for Timer 2 (16 bit register)
const unsigned long MCU_FREQUENCY = 168000000;			// Microcontroller clock speed in Hz





/**************  Global Variables  **************/
unsigned int poll_flag;									// Flag to enter main loop (Polled via Timer 3)
unsigned int terminal_print_count;						// Flag to print statistics to terminal (via UART)
unsigned int timer2_overflow_count;						// Number of times timer 2 has overflowed 
unsigned int timer2_overflow_temp;						// ** DEBUG** Duplicate of timer2OverflowCount used for printing to terminal 
unsigned long total_timer2_ticks;						// Calculated total number of ticks by timer 2 between input capture events 
unsigned long timer2_start_time;						// Value of Timer 2 when the previous input capture event occured
unsigned long timer2_end_eime;							// Value of Timer 2 at which the present input capture event occured 
unsigned long total_overflow_time;						// ** DEBUG ** Total number ticks by timer 2 due to overflow (overflow count * ARR)
unsigned long input_capture_delta;						// ** DEBUG ** Delta time between end_time and start_time
unsigned long input_capture_period;						// Period of input capture signal (Used for motor speed calculations)
unsigned long input_capture_frequency;					// Frequency of input capture signal (Used for motor speed calculations)
unsigned long input_capture_position;					// Total number of input capture events (This will be the position value in final implementation) 
long double time_per_tick;								// Time per tick of timer 2 (Calculated from timer parameters)

//Used only for printing statistics to terminal 
char period_text[STR_MAX];								// Text string for 'input_capture_period'
char frequency_text[STR_MAX];							// Text string for 'input_capture_frequency'
char position_text[STR_MAX];							// Text string for 'input_capture_position'
char total_ticks_text[STR_MAX];							// Text string for 'total_timer2_ticks'
char timer2_overflow_text[STR_MAX];						// Text string for 'timer2_overflow_temp'
char time_per_tick_text[STR_MAX];						// Text string for 'time_per_tick'
char overflow_time_text[STR_MAX];						// Text string for 'total_overflow_time'
char capture_delta_text[STR_MAX];						// Text string for 'input_capture_delta'





/**************  Function Prototypes  **************/
void timer2_ISR();										// Interrupt handler for Timer 2
void timer3_ISR();										// Interrupt handler for Timer 3
void init_GPIO();										// Initialization of MCU I/O 
void init_UART();										// Initialization of UART for terminal communication 
void init_input_capture();								// Initialization of input capture for timer 2 
void init_timer3();										// Initialization of timer 3 (Used for fixed polling rate)





/**************  Main  **************/
void main() {
	
	//Initialization Routines 
	//init_GPIO();										//Setup external timing pin, unused at present 							
	init_UART();
	init_input_capture();		
	init_timer3();
	
	
	//Program Start Terminal Verification 
	UART1_Write_Text("\rProgram Has Started\n\r");
	
	
	//Infinite Loop 
	while(1) {
		
		if (poll_flag) {													// Polling event occured => Calculate values 
			poll_flag = 0;													// Clear poll_flag 
			
			//Calculate input capture timing values 
			total_timer2_ticks = ((long) timer2_overflow_temp * TIMER_2_ARR) - timer2_start_time + timer2_end_eime;
			input_capture_period = (long double) total_timer2_ticks * time_per_tick;		// Milliseconds  
			input_capture_frequency = 1000000.0 / input_capture_period;						// Hertz
			total_overflow_time = (long) timer2_overflow_temp * TIMER_2_ARR;				// ** DEBUG ** 
			input_capture_delta = timer2_end_eime - timer2_start_time;						// ** DEBUG ** 
			timer2_start_time = timer2_end_eime;											// Set new start time for next input capture event 
		}
		
	
		if (terminal_print_count >= TERMINAL_PRINT_THRESH) {				// Set number of polling events has occured => Print statistics to terminal 
			
			FloatToStr(time_per_tick, time_per_tick_text);      			// Print calculated time per tick to terminal 
			UART1_Write_Text("Time per tick: ");
			UART1_Write_Text(time_per_tick_text);
			UART1_Write_Text("\n\r");
			
			IntToStr(timer2_overflow_temp, overflow_time_text);            	// Print number of timer 2 overflow events to terminal 
			UART1_Write_Text("Total number of timer overflows: ");
			UART1_Write_Text(overflow_time_text);
			UART1_Write_Text("\n\r");	

			FloatToStr(total_overflow_time, overflow_time_text);         	// Print total calculated time from timer 2 overflows to terminal 
			UART1_Write_Text("Calculated Overflow Time : ");
			UART1_Write_Text(overflow_time_text);
			UART1_Write_Text("\n\r");		

			FloatToStr(input_capture_delta, capture_delta_text);          	// Print input capture delta time to terminal 
			UART1_Write_Text("Input Capture Delta: ");
			UART1_Write_Text(capture_delta_text);
			UART1_Write_Text("\n\r");			
			
			LongToStr(total_timer2_ticks, total_ticks_text;               	// Print total number of ticks between input capture events to terminal 
			UART1_Write_Text("Timer 2 ticks between input captures: ");
			UART1_Write_Text(total_ticks_text);
			UART1_Write_Text("\n\r");			
			
			FloatToStr(input_capture_period, period_text);                  // Print input capture signal period to terminal 
			UART1_Write_Text("Period of incoming signal (ms): ");
			UART1_Write_Text(period_text);
			UART1_Write_Text("\n\r");			
			
			FloatToStr(input_capture_frequency, frequency_text);            // Print input capture signal frequency to terminal
			UART1_Write_Text("Frequency of incoming signal (Hz): ");
			UART1_Write_Text(frequency_text);
			UART1_Write_Text("\n\r");			
			
			LongToStr(input_capture_position, position_text);               // Print total number of input events (position) to terminal 
			UART1_Write_Text("Number of input capture events: ");
			UART1_Write_Text(position_text);
			UART1_Write_Text("\n\n\n\r");	


			input_capture_position = 0;										// Reset total events (position) 
			terminal_print_count = 0;										// Reset counter for terminal printing 
		}
	}	
} // END OF MAIN  




/**************  Interrupt Handlers  **************/

// Interrupt handler for Timer 2
void timer2_ISR() iv IVT_INT_TIM2 {															

    NVIC_IntDisable(IVT_INT_TIM2);                                   		// Disable timer 2 interrupts

	// Timer 2 Overflow 
    if(TIM2_SR.UIF == 1) {                                                     
		TIM2_SR.UIF = 0;                                                  	// Clear timer 2 interrupt bit
        overflowCount++;                                                    // Increment overflow counter
    }

	// Input Capture Event 
    if (TIM2_SR.CC1IF == 1) {                                               
        TIM2_SR.CC1IF = 0;                                     				// Clear input capture event bit
        endTime = TIM2_CCR1;                                                // Read stored input capture time
        overflowCountTemp = overflowCount;									// Store overflow count for use in main 
        overflowCount = 0;                                              	// Reset the overflow counter to 0
        inputEventCounter++;                                                // Increment total input capture event counter
    }

    NVIC_IntEnable(IVT_INT_TIM2);                                	    	// Re-enable timer 2 interrupt
}


// Interrupt handler for Timer 3
void timer3_ISR() iv IVT_INT_EXTI15_10 ics ICS_AUTO {

	TIM3_SR.UIF = 0;														// Clear timer 3 interrupt bit 
	poll_flag = 1;															// Set poll flag for main loop 
	terminal_print_count++;													// Increment the print counter 
}								





/**************  Initialization Functions  **************/

//Initialize MCU GPIO's and other hardware 
void init_GPIO() {

	GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                   	// ** DEBUG ** Enable digital output on E10
    GPIOE_ODR.B10 = 0;                                                      // ** DEBUG ** Set pin E10 low
}



//Initialize UART 
void init_UART() {
	
	UART1_Init(UART_BAUD_RATE);                                       		// Configure UART 1
    Delay_ms(200);                                                 			// Wait for UART to stabilize	
}							



//Initialize Input Capture on Timer 2 Channel 1 
void init_input_capture() {

	RCC_APB1ENR.TIM2EN = 1;                                               	// Enable clock gating for timer module 2
	TIM2_CR1.CEN = 0;                                                       // Disable timer/counter
	TIM2_PSC = ENCODER_TIM_PSC;                                             // Set timer 2 prescaler (need to determine value)
	TIM2_ARR = ENCODER_TIM_RELOAD;                                          // Set timer 2 overflow value at max
	TIM2_CR1 |= 0x10;                                                       // Set counter direction as upcounting (DIR bit)
	TIM2_CCMR1_Input |= 0x01;                                               // Set capture channel 1 as input (CC1S = 01)
	TIM2_CCER.CC1P = 1;                                                     // Set capture on rising edge event
	TIM2_CCER.CC1E = 1;                                                     // Enable capture on channel 1
	TIM2_DIER.CC1IE = 1;                                                    // Enable capture 1 interrupt
	TIM2_DIER.UIE = 1;                                                      // CC1 Update Interrupt Enable
	NVIC_IntEnable(IVT_INT_TIM2);                                           // Enable timer 2 interrupt
	//EnableInterrupts();                                                   // Probably unneeded due to previous line??????
	TIM2_CNT = 0x00;														// Set counter value to 0 (Probably not needed) 
	TIM2_CR1.CEN = 1;                                                       // Enable timer/counter

	//Calculate the time per timer 2 tick 
	timePerTick = (long double) 1000000.0 / MCU_FREQUENCY;                  // Time per tick in ms	
}



//Initialize Timer 3 (Interrupts ever 100ms to poll encoder state)
void init_timer3() {

	RCC_APB1ENR.TIM3EN = 1;													// Enable clock for timer 3
	TIM3_CR1.CEN = 0;														// Disable timer/counter 
	TIM3_PSC = 279;															// Set timer 3 prescaler 
	TIM3_ARR = 59999;														// Set timer 3 overflow value 
	NVIC_IntEnable(IVT_INT_TIM3);											// Enable timer 3 interrupt 
	TIM3_DIER.UIE = 1;														// Timer 3 update interrupt enable 
	TIM3_CR1.CEN = 1;														// Enable timer/counter 
}

