//Input capture demo



// Simulated encoder input: A0
// External Interrupt to simulate poll: D10
// Interrupt timing pulse: E10



#define TIMER_PRESCALER					2563
#define TIMER_RELOAD_VALUE				65522
#define UART_BAUD_RATE					115200


unsigned int poll_flag = 0;											// Flag to alert main that a polling event occured
unsigned int overflowCount = 0;										// Number of timer 2 overflows 
unsigned long totalTicks = 0;										// Total time between previous input capture event and current one 
unsigned long previousTime = 0;										// Timer value when the previous input capture event occured 
unsigned long presentTime = 0;										// Timer value for the current input capture event 


//Function Prototypes 
void timer2_interrupt();											// Handler for timer 2 interrupt 
void external_interrupt();											// Handler for external interrupt 	
void init_tim2_input_capture();										// Initialize input capture for Timer 2 Channel 1 
void init_hardware();												// Initialize GPIO's 
void init_serial_comm();											// Initialize UART communication 



//Main Program 
void main() {
	
	while(1) {
		if (poll_flag) {
			//Calculate period 
			//Calculate frequency 
			//Print to terminal period 
			//Print to terminal frequency 
			//Print to terminal total events between polls 
		}
	}	
}





//**********  Initialize input capture for Timer 2 Channel 1  **********
void init_tim2_input_capture() {
	RCC_APB1ENR.TIM2EN = 1;           //Enable clock gating for timer module 2
	TIM2_CR1.CEN = 0;                 //Disable timer/counter
	TIM2_PSC = 2563;                  //Set timer 2 prescaler (need to determine value)
	TIM2_ARR = 65522;                 //Set timer 2 overflow value at max
	TIM2_CR1.B4 = 0;                  //Set counter direction as upcounting  (DIR Bit)
	TIM2_CR1.B8 = 0;                  //Set counter to have no clock divider    (CKD Bits)
	TIM2_CR1.B9 = 0;                         //second bit of this
	TIM2_CCMR1_Input.B1 = 0;           //Set capture channel 1 as input   (CC1S = 01)
	TIM2_CCMR1_Input.B0 = 1;                 //Second bit of this
	TIM2_CCER.CC1P = 1;               //Set capture on rising edge event
	TIM2_CCER.CC1E = 1;               //Enable capture on channel 1
	TIM2_CCMR1_Input.B3 = 0;          //Disable Capture 1 input prescaler    (IC2PSC = 0)
	TIM2_CCMR1_Input.B2 = 0;                 //Second bit of this
	TIM2_CCMR1_Input.B7 = 0;          //Disable Capture 1 input filtering (IC1F = 0)
	TIM2_CCMR1_Input.B6 = 0;                    //Second bit of this
	TIM2_CCMR1_Input.B5 = 0;                    //Third bit of this
	TIM2_CCMR1_Input.B4 = 0;                    //Fourth bit of this
	TIM2_DIER.CC1IE = 1;              //Enable capture 1 interrupt
	TIM2_DIER.UIE = 1;                //CC1 Update Interrupt Enable
	NVIC_IntEnable(IVT_INT_TIM2);     //Enable timer 2 interrupt
	EnableInterrupts();               //Probably unneeded due to previous line
	TIM2_CR1.CEN = 1;                 						//Enable timer/counter
	
}							






//**********  Interrupt handler for Timer 2  **********
void timer2_interrupt() iv IVT_INT_TIM2 {
	NVIC_IntDisable(IVT_INT_TIM2);     								// Disable timer 2 interrupts
	GPIOE_ODR.B10 = 1;												// Set handler timing pin high 
	
	if(TIM2_SR.UIF == 1) {											// If timer 2 overflow event occured 
		TIM2_SR.UIF = 0;                                   			// Clear timer 2 interrupt bit 
		overflowCount++;                                  			// Increment overflow counter
	}
	 
	if (TIM2_SR.CC1IF == 1) {										// If Input Capture event occured 
		TIM2_SR.CC1IF = 0;                                 			// Clear input capture event bit 
		presentTime = TIM2_CCR1;                              		// Read stored input capture time
		totalTicks = (overflowCount << 16) - previousTime + presentTime;    // Calculate total ticks between input capture events 
		previousTime = presentTime;									// Store time of latest input capture event for use in next instance 
		overflowCount = 0;											// Reset the overflow counter to 0
	}
	
	//TIM2_SR.CC1IF = 0;                                 			// Reset input capture event bit 
	//TIM2_SR.UIF = 0;                                   			// Reset timer 2 interupt bit 
	NVIC_IntEnable(IVT_INT_TIM2);									// Re-enable timer 2 interrupt 
	GPIOE_ODR.B10 = 0;												// Set handler timing pin low 
}






//**********  Handler for External Interrupt  **********
void external_interrupt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
	EXTI_PR.B10 = 1;												// Clear external interrupt flag 
	poll_flag = 1;													// Set poll flag for main 	
}





//*********  Initialize GPIO's and external interrupt  **********
void init_hardware() {
	//Initialize Output Pin 
	GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);				// Enable digital output on E10
	GPIOE_ODR.B10 = 0;												// Set pin B10 low 
	
	//Initialize input for external interrupt button 	
	GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10);  			// Enable digital output D10
	SYSCFGEN_bit = 1;                    							// Enable clock for alternate pin functions
	SYSCFG_EXTICR3 = 0x00000300;         							// Map external interrupt on PD10
	EXTI_RTSR = 0x00000000;              							// Set interrupt on Rising edge (none)
	EXTI_FTSR = 0x00000400;              							// Set Interrupt on Falling edge (PD10)
	EXTI_IMR |= 0x00000400;              							// Set mask to interrupt on bit 10 
	NVIC_IntEnable(IVT_INT_EXTI1);   								// Enable External interrupt
}





//**********  Initialize serial communications (Wired UART)  **********
void init_serial_comm() {
	UART1_Init(UART_BAUD_RATE);										// Configure UART 1 
	Delay_ms(200);													// Wait for UART to stabilize 
}

























