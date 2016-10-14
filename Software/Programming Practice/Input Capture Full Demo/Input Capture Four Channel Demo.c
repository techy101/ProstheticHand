//Input capture demo for four encoder input channels. 



//Unsure how to use structure member to access input register 
//	assigning a member to a specific pin 
//	So could call member.in1 and access GPIOA_IDR.B1 





#define FNGR_POINTER_ENC_A 						GPIOA_IDR.B0			// Pin A0: Pointer finger encoder channel A (Tim2 CH1 input capture)
#define FNGR_POINTER_ENC_B						GPIOA_IDR.B4			// Pin A4: Pointer finger encoder channel B (Direction only)
#define FNGR_MIDDLE_ENC_A						GPIOA_IDR.B1			// Pin A1: Middle finger encoder channel A (Tim2 CH2 input capture)
#define FNGR_MIDDLE_ENC_B						GPIOA_IDR.B5			// Pin A5: Middle finger encoder channel B (Direction only)  
#define FNGR_RING_ENC_A							GPIOA_IDR.B2			// Pin A2: Ring finger encoder channel A (Tim2 CH3 input capture) 
#define FNGR_RING_ENC_B 						GPIOA_IDR.B6			// Pin A6: Ring finger encoder channel B (Direction only) 
#define FNGR_PINKY_ENC_A						GPIOA_IDR.B3			// Pin A3: Pinky finger encoder channel A (Tim2 CH4 input capture)
#define FNGR_PINKY_ENC_B						GPIOA_IDR.B7			// Pin A7: Pinky finger encoder channel B (Direction only)


/**************  Constants  **************/
const unsigned int UART_BAUD_RATE = 115200;				// Baud rate for UART connection 
const unsigned int STR_MAX = 15;						// Maximum string size for UART writes 
const unsigned int ENCODER_TIMER_PRESCALER = 0;			// Prescaler for timer 2 (Used for encoder CCP timing)
const unsigned int TERMINAL_PRINT_THRESH = 15;			// Number of polling events before a terminal print is executed 
const unsigned long ENCODER_TIMER_ARR = 65535;			// Auto Reload value for Timer 2 (16 bit register)
const unsigned long MCU_FREQUENCY = 168000000;			// Microcontroller clock speed in Hz



/**************  Global Variables  **************/
unsigned int poll_flag;									// Flag to enter main loop (Polled via Timer ??)
unsigned int terminal_print_count;						// ** DEBUG ** Flag to print statistics to terminal (via UART)
unsigned long overflow_count;							// How many times timer 2 has overflowed 
float time_per_tick;									// Time per tick of timer 2 (Calculated from timer parameters)



/**************  Function Prototypes  **************/
void timer2_ISR();										// Interrupt handler for Timer 2
void timer3_ISR();										// Interrupt handler for Timer 3
void init_GPIO();										// Initialization of MCU I/O 
void init_UART();										// Initialization of UART for terminal communication 
void init_input_capture();								// Initialization of input capture for timer 2 
void init_timer3();										// Initialization of timer 3 (Used for fixed polling rate)
void calc_timer2_values();								// Calculate the time per tick for finger timer 
void calc_finger_state(struct finger *fngr);			// Function to determine state of finger 
void print_finger_info(struct finger *fngr);			// Function to print finger state info to terminal 




// Limited finger struct definition 
//	* Not all parameters will be used in final implementation. 
//	* Some are used only for this demo program to verify functionality 

struct finger {
	char name[10];											// Name of finger 
	unsigned int direction_actual;							// Actual direction of motor movement as read from encoder 
	unsigned int speed_actual;								// Actual speed of the motor (calculated from encoder data)
	unsigned int enc_chan_a;								// ?????? Encoder channel A Pin definition 
	unsigned int enc_chan_b;								// ?????? Encoder channel B pin definition 
	unsigned long enc_start_time;							// Value of encoder timer when previous capture event occured 
	unsigned long enc_end_time;								// Value of encoder timer when current capture event occured 
	unsigned long enc_total_time;							// Calculated total time between input capture events
	unsigned long enc_total_ticks;							// Calculated total number of timer ticks between input capture events 
	unsigned long enc_overflow_start;						// Value of timer overflow counter when previous capture event occured 
	unsigned long enc_overflow_end;							// Value of timer overflow counter when current capture event occured 
	unsigned long period;									// Period of motor encoder signal (in ms)
	unsigned long frequency;								// Frequency of motor encoder signal (in Hz)
	unsigned long enc_overflow_delta;						// Calculated number of timer overflows between capture events 
	unsigned long enc_overflow_ticks;						// Total number of timer ticks for the timer overflows between events 
	unsigned long enc_delta_ticks;							// Number of timer ticks between previous/current capture events (Minus overflows)
	unsigned long position_actual;							// Total input capture events, represents finger position 
};





// Main Starts here 
void main() {
	
	// Initializations 
	init_UART();
	init_input_capture();
	init_timer3();
	
	
	// Create Structs
	struct finger fngr_pointer;
	struct finger fngr_middle;
	struct finger fngr_ring;
	struct finger fngr_pinky;
	
	
	//Define names of fingers 
	strcpy(fngr_pointer.name, "Pointer");
	strcpy(fngr_middle.name, "Middle");
	strcpy(fngr_ring.name, "Ring");
	strcpy(fngr_pinky.name, "Pinky");
	
	
	//Define encoder channel pins 
	
	//?????????????????????????????????????????????????????????????????????????????????????
	
		
	
	// Program start terminal verification 
	UART1_Write_Text("\n\n\rProgram Has Started!\n\n\r");
	
	
	// Infinite Loop
	while(1) {
		
		if (poll_flag) {													// Polling event occured => Calculate values 
			poll_flag = 0;													// Clear poll_flag 
			
			calc_finger_state(&fngr_pointer);								// Perform finger calculations 
			//calc_finger_state(&fngr_middle);
			//calc_finger_state(&fngr_ring);
			//calc_finger_state(&fngr_pinky);
		}
		
		if (terminal_print_count >= TERMINAL_PRINT_THRESH) {				// Set number of polling events has occured => Print statistics to terminal		
		
			print_finger_info(&fngr_pointer);
			//print_finger_info(&fngr_middle);
			//print_finger_info(&fngr_ring);
			//print_finger_info(&fngr_pinky);		
		}	
	}
} // Main ends here 






/**************  Interrupt Handlers  **************/

// Interrupt handler for Timer 2
void timer2_ISR() iv IVT_INT_TIM2 {															

    //NVIC_IntDisable(IVT_INT_TIM2);                                   		// Disable timer 2 interrupts

	// Timer 2 Overflow 
    if(TIM2_SR.UIF == 1) {                                                     
		TIM2_SR.UIF = 0;                                                  	// Clear timer 2 interrupt bit
        overflow_count++;                                               	// Increment overflow counter
    }

	// Channel 1 (Pin A0) Pointer finger input capture event 
    if (TIM2_SR.CC1IF == 1) {                                               
        //TIM2_SR.CC1IF = 0;                                     			// Clear  *** Shouldn't be needed per p.663 ref man, reading on next line auto clears 
        fngr_pointer.enc_end_time = TIM2_CCR1;                         		// Read stored input capture time
		fngr_pointer.enc_overflow_end = overflow_count;						// Store number of timer 2 overflows for this finger 
        fngr_pointer.position_actual++;                                		// Increment total input capture event counter
    }
	
	
//All other channels disabled for initial testing. Start with testing only a single channel, then expand. 
/*
	// Channel 2 (Middle finger) input capture event 
    if (TIM2_SR.CC2IF == 1) {                                               
        //TIM2_SR.CC2IF = 0;                                     			// Clear  *** Shouldn't be needed per p.663 ref man, reading on next line auto clears 
        fngr_middle.enc_end_time = TIM2_CCR2;                         		// Read stored input capture time
		fngr_middle.enc_overflow_end = overflow_count;						// Store number of timer 2 overflows for this finger 
        fngr_middle.position_actual++;                                		// Increment total input capture event counter
    }	
	
	// Channel 3 (Ring finger) input capture event 
    if (TIM2_SR.CC13F == 1) {                                               
        //TIM2_SR.CC3IF = 0;                                     			// Clear  *** Shouldn't be needed per p.663 ref man, reading on next line auto clears 
        fngr_ring.enc_end_time = TIM2_CCR3;                         		// Read stored input capture time
		fngr_ring.enc_overflow_end = overflow_count;						// Store number of timer 2 overflows for this finger 
        fngr_ring.position_actual++;                                		// Increment total input capture event counter
    }	
	
	// Channel 4 (Pinky) input capture event 
    if (TIM2_SR.CC4IF == 1) {                                               
        //TIM2_SR.CC4IF = 0;                                     			// Clear  *** Shouldn't be needed per p.663 ref man, reading on next line auto clears 
        fngr_pinky.enc_end_time = TIM2_CCR4;                         		// Read stored input capture time
		fngr_pinky.enc_overflow_end = overflow_count;						// Store number of timer 2 overflows for this finger 
        fngr_pinky.position_actual++;                                		// Increment total input capture event counter
    }	
*/	
    //NVIC_IntEnable(IVT_INT_TIM2);                                	    	// Re-enable timer 2 interrupt
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

	//Configure GPIO's for secondary motor encoder channels 
	GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | GPIO_PINMASK_6 | GPIO_PINMASK_7);

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

	//Configure timer 2 
	RCC_APB1ENR.TIM2EN = 1;                                               	// Enable clock gating for timer module 2
	TIM2_CR1.CEN = 0;                                                       // Disable timer/counter
	TIM2_PSC = ENCODER_TIM_PSC;                                             // Set timer 2 prescaler (need to determine value)
	TIM2_ARR = ENCODER_TIM_RELOAD;                                          // Set timer 2 overflow (Auto Reload) value 
	TIM2_CR1 |= 0x10;                                                       // Set counter direction as upcounting (DIR bit)
	
	//Configure pointer finger (Pin A0, Channel 1) input capture 
	GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);				// Configure alternate function for A0 as Timer 2 Channel 1 
	TIM2_CCMR1_Input |= 0x01;                                               // Set capture channel 1 as input on TI2 (CC1S = 01)
	TIM2_CCER.CC1P = 0;                                                     // Set capture on rising edge event
	TIM2_CCER.CC1E = 1;                                                     // Enable capture on channel 1
	TIM2_DIER.CC1IE = 1;                                                    // Enable interrupt on capture channel 1 
	
	//Configure middle finger (Pin A1, Channel 2) input capture 
	GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH2_PA1);				// Configure alternate function for pin A1 as Timer 2 Channel 2 
	TIM2_CCMR1_Input |= 0x200;												// Set capture channel 2 as input on TI1 (CC2S = 10)
	TIM2_CCER.CC2P = 0;														// Set capture on rising edge event 
	TIM2_CCER.CC2E = 1;														// Enable capture on channel 2 
	TIM2_DIER.CC2IE = 1;													// Enable interrupt on capture channel 2
	
	//Configure ring finger (Pin A2, Channel 3) input capture 
	GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH3_PA2);				// Configure alternate function for pin A2 as Timer 2 Channel 3 
	TIM2_CCMR2_Input |= 0x01;												// Set capture channel 3 as input on TI2 (CC3S = 01)
	TIM2_CCER.CC3P = 0;														// Set capture on rising edge event 
	TIM2_CCER.CC3E = 1;														// Enable capture on channel 3 
	TIM2_DIER.CC3IE = 1;													// Enable interrupt on capture channel 3	
	
	//Configure pinky finger (Pin A3, Channel 4) input capture 
	GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH4_PA3);				// Configure alternate function for pin A3 as Timer 2 Channel 4 
	TIM2_CCMR2_Input |= 0x200;												// Set capture channel 4 as input on TI1 (CC4S = 10)
	TIM2_CCER.CC3P = 0;														// Set capture on rising edge event 
	TIM2_CCER.CC3E = 1;														// Enable capture on channel 4
	TIM2_DIER.CC4IE = 1;													// Enable interrupt on capture channel 4
	
	//Configure timer interrupts 
	TIM2_DIER.UIE = 1;                                                      // Enable overflow interrupt 
	NVIC_IntEnable(IVT_INT_TIM2);                                           // Enable timer 2 interrupt
	//EnableInterrupts();                                                   // Probably unneeded due to previous line??????
	//TIM2_CNT = 0x00;														// Set counter value to 0 (Probably not needed) 
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



//Calculate time per tick for timer2 - Based on TIMCLK, PSC, and ARR
void calc_timer2_values() {
	
	//Do math here. Basic function for interrupt time is: TIMx_CLK / ((ARR+1) * (PSC+1))
	
}






// Function to calculate statistics finger encoder 
void calc_finger_state( struct finger *fngr) {
	
	// Calculate number of timer overflows between previous and current capture events 
	fngr->enc_overflow_delta = fngr->enc_overflow_end - fngr->enc_overflow_start;
	
	// Calculate timer ticks for the delta number of overflows 
	fngr->enc_overflow_ticks = fngr->enc_overflow_delta * ENCODER_TIMER_ARR;
	
	// Calculate number of timer ticks (minus overflows) between previous and current capture events 
	fngr->enc_delta_ticks = fngr->enc_end_time - enc_start_time;
	
	// Calculate total timer ticks between previous and current capture events 
	fngr->enc_total_ticks = fngr->enc_overflow_ticks + fngr->enc_delta_ticks;
	
	// Calculate period of captured signal (ms)
	fngr->period = (unsigned long) fngr->enc_total_ticks * time_per_tick;
	
	// Calculate frequency of captured signal (Hz)
	fngr->frequency = 1000000.0 / fngr->period;
	
	// Store current overflow and timer values for next cycle
	fngr->enc_overflow_start = fngr->enc_overflow_end;
	fngr->enc_start_time = fngr->enc_end_time;
	
	// Check direction of motor movement 
	if (FNGR_POINTER_ENC_A && !FNGR_POINTER_ENC_B) {
		fngr->direction_actual = 1;								// Clockwise
	}
	
	else if (!FNGR_POINTER_ENC_A && FNGR_POINTER_ENC_B) {
		fngr->direction_actual = 0;								// Counter Clockwise 
	}
	
	else {
		fngr->direction_actual = 7;								// ERROR DIRECTION
	}
}



// Function to print all statistics to terminal 
void print_finger_info( struct finger *fngr) {
	
	//Local strings
	char timer_per_tick_text[STR_MAX];
	char overflow_delta_text[STR_MAX];
	char overflow_time_text[STR_MAX];
	char enc_delta_ticks_text[STR_MAX];
	char total_ticks_text[STR_MAX];
	char period_text[STR_MAX];
	char frequency_text[STR_MAX];
	char position_text[STR_MAX];
	char direction_text[STR_MAX];
	
	
	UART1_Write_Text("\n\rFinger Name: ");							//Print name of current finger to terminal 
	UART1_Write_Text(fngr->name);
	UART1_Write_Text("\n\r");
	
	FloatToStr(time_per_tick, time_per_tick_text);      			// Print calculated time per tick to terminal 
	UART1_Write_Text("Time per tick: ");
	UART1_Write_Text(time_per_tick_text);
	UART1_Write_Text("\n\r");

	LongToStr(fngr->enc_overflow_delta, overflow_delta_text);      	// Print number of timer 2 overflow events to terminal 
	UART1_Write_Text("Total number of timer overflows: ");
	UART1_Write_Text(overflow_delta_text);
	UART1_Write_Text("\n\r");	

	LongToStr(fngr->enc_overflow_ticks, overflow_time_text);        // Print total calculated time from timer 2 overflows to terminal 
	UART1_Write_Text("Calculated Overflow Ticks : ");
	UART1_Write_Text(overflow_time_text);
	UART1_Write_Text("\n\r");		

	LongToStr(fngr->enc_delta_ticks, enc_delta_ticks_text);         // Print input capture delta time to terminal 
	UART1_Write_Text("Input Capture Delta Ticks: ");
	UART1_Write_Text(enc_delta_ticks_text);
	UART1_Write_Text("\n\r");			

	LongToStr(fngr->enc_total_ticks, total_ticks_text;             	// Print total number of ticks between input capture events to terminal 
	UART1_Write_Text("Total timer ticks between input captures: ");
	UART1_Write_Text(total_ticks_text);
	UART1_Write_Text("\n\r");			

	LongToStr(fngr->period, period_text);                  			// Print input capture signal period to terminal 
	UART1_Write_Text("Period of incoming signal (ms): ");
	UART1_Write_Text(period_text);
	UART1_Write_Text("\n\r");			

	LongToStr(fngr->frequency, frequency_text);            			// Print input capture signal frequency to terminal
	UART1_Write_Text("Frequency of incoming signal (Hz): ");
	UART1_Write_Text(frequency_text);
	UART1_Write_Text("\n\r");			

	IntToStr(fngr->direction_actual, direction_text);            	// Print direction of movement to terminal
	UART1_Write_Text("Direction of movement: ");
	UART1_Write_Text(direction_text);
	UART1_Write_Text("\n\r");			
	
	LongToStr(fngr->position_actual, position_text);               // Print total number of input events (position) to terminal 
	UART1_Write_Text("Position of finger: ");
	UART1_Write_Text(position_text);
	UART1_Write_Text("\n\n\n\r");	

	terminal_print_count = 0;										// Reset counter for terminal printing 	
}






















