#include <emg.h>

/*
Prosthetic Hand Senior Design Project
12/3/2016
Matthew Varas
Donnell Jones
Rachel Mertz 

 * File name:
    emg.c

 * Description:
    C file for all EMG related functions and interrupts  
*/




/****************  Electromyography Initialization  *****************
/																	/
/	Function Name: init_emg()										/
/	Return Type: None												/
/																	/
/	Description: 													/
/		This function performs all initialization of analog 		/
/		watchdog and other EMG related items						/
/																	/
/	Preconditions: 													/
/		None														/
/																	/
/	Postconditions: 												/
/		All EMG and AWD configurations are complete 				/
/		EMG Timer interrupt (UIE) is left disabled because it is    /
/		dealt with in the AWD interrupt handler.					/
/																	/
/*******************************************************************/
void init_emg() {					
	 /* ------------ ADC Initialization ------------ */
     ADC_Set_Input_Channel(_ADC_CHANNEL_1);     				// Set ADC channel 1 active for EMG input signal 
     ADC1_Init();                                               // Initialize ADC1

     /* ------------ Analog Watchdog Initialization ------------ */
     ADC1_LTR = low_level;        // Set AWD guard window initial lower threshold
     ADC1_HTR = high_level;       // Set AWD guard window initial upper threshold
     ADC1_CR2bits.CONT = 1;       // Enable ADC1 continuous conversion mode
     ADC1_SQR3bits.SQ1 = 1;       // Set first channel in continuous coversion sequence to channel 3
     ADC1_CR1bits.AWDSGL = 1;     // Enable single channel monitoring mode for AWD
     ADC1_CR1 |= 1;               // Set channel 3 as the single monitored AWD channel
     ADC1_CR1bits.AWDEN = 1;      // Enable Analog watchdog on regular channels
     ADC1_CR2bits.SWSTART = 1;    // Start ADC1 Conversions
     ADC1_CR1bits.AWDIE = 1;      // Enable analog watchdog interrupt
     NVIC_IntEnable(IVT_INT_ADC); // Enable global ADC interrupt
	 
	 
	 /* ------------ EMG Timer (10) Initialization ------------ */
     RCC_APB2ENR.TIM10EN = 1;       		// Enable clock gating for timer 10
     TIM10_CR1.CEN = 0;              		// Disable timer/counter
     TIM10_PSC = EMG_TIMER_PSC;         	// Set timer 10 prescaler
     TIM10_ARR = EMG_TIMER_RELOAD;      	// Set timer 10 overflow value 
     NVIC_IntEnable(IVT_INT_TIM1_UP_TIM10); // Enable timer 10 interrupt
     TIM10_CR1.CEN = 1;              		// Enable timer/counter
	 
	 
	 /* ------------ EMG Override Button (EXTI) Initialization ------------ */   //B3
	 GPIO_Digital_input(&GPIOB_BASE, _GPIO_PINMASK_3);		// Enable digital input on B3 
	 SYSCFGEN_bit = 1;					//Enable system config controller clock 
	 SYSCFG_EXTICR1bits.EXTI3 = 1;		// Map external interrupt 3 to port B 
	 EXTI_RTSRbits.TR3 = 1;				// Set interrupt on rising edge 
	 EXTI_IMRbits.MR3 = 1;				// Unmask bit 3 to enable external interrupt on line 3
	 NVIC_IntEnable(IVT_INT_EXTI3);     //Enable external interrupt B3 for EMG override button 
}





/***************  Analog Watchdog Interrupt Handler  ****************
/																	/
/	Function Name: AWD_ISR()										/
/	Interrupt Handler												/
/																	/
/	Description: 													/
/		This function handles code to execute when the EMG signal   /
/		monitored by the AWD moves outside the guarded zone 		/
/																	/
/	Preconditions: 													/
/		Signal monitored by AWD moved outside the guarded zone		/
/																	/
/	Postconditions: 												/
/		Timer is armed if AWD is in initial state 					/
/		AWD is reset and timer disarmed is AWD is in armed state 	/ 
/																	/
/*******************************************************************/
void AWD_ISR() iv IVT_INT_ADC ics ICS_AUTO {
      ADC1_CR1bits.AWDIE = 0;       // Disable ADC1 interrupt
      ADC1_SRbits.AWD = 0;          // Clear AWD event flag 
      
	  // Analog Watchdog is in initial state (User just flexed muscle)
	  if(ADC1_HTR <= 1000) {
            TIM10_SR.UIF = 0;       // Clear timer 10 interrupt flag
            TIM10_CNT = 0x00;       // Reset timer value to 0
            ADC1_HTR = high_level2; // Set high threshold to MAX (Armed high level)
            ADC1_LTR = low_level2;  // Set high threshold to initial high level (Armed low level)
            TIM10_DIER.UIE = 1;     // Enable emg_timer (Timer 10) interrupts 
	  }	
		
	  // Analog Watchdog is in armed state (User release muscle flex prior to emg_timer timout (3s))
      else {
            TIM10_DIER.UIE = 0;     // Disable emg_timer (Timer 10) interrupts 
            ADC1_HTR = high_level;  // Set high threshold back to initial value 
            ADC1_LTR = low_level;   // Set low threshold back to initial value 
            }
			
      ADC1_CR1bits.AWDIE = 1;       //Enable ADC1 interrupt 
}




/*********  EMG Override Button (EXTI) Interrupt Handler  ***********
/																	/
/	Function Name: emg_override_ISR()								/
/	Interrupt Handler												/
/																	/
/	Description: 													/
/		This ISR overrides EMG inputs and activates the system. 	/
/		It is used for testing and debug only. 						/
/		Override button is a hardware button on the PCB				/
/																	/
/	Preconditions: 													/
/		EMG override button external interrupt has been configured  /
/		EMG override button has been pressed						/
/																	/
/	Postconditions: 												/
/		System is immediatly activated 								/
/																	/
/*******************************************************************/
void emg_override_ISR() iv IVT_INT_EXTI3 ICS_AUTO {
	EXTI_PR.B3 = 1;				// Clear interrupt event flag 
	system_go = 1;				// Activate hand 
	go_status = ~go_status;		// Toggle status of system (Relies on variable initialized to 0, probably better way to do this)
}






/******************  EMG Timer Interrupt Handler  *******************
/																	/
/	Function Name: emg_timer_ISR()									/
/	Interrupt Handler 												/
/																	/
/	Description: 													/
/		This interrupt handler activates only if the EMG signal has /
/		crossed out of the inital AWD guard zone AND three seconds  /
/		have passed without the AWD signal falling out of the 		/
/		armed guard zone. It resets the AWD thresholds to their 	/
/		initial states and disables its own overflow interrupt		/
/																	/
/	Preconditions: 													/
/		Three seconds have passed since timer was activated 		/
/																	/
/	Postconditions: 												/
/		AWD low and high thresholds are set to their initial states	/
/		Emg timer (Timer 10) overflow interrupts are disabled 		/
/																	/
/*******************************************************************/
void emg_timer_ISR() iv IVT_INT_TIM1_UP_TIM10 { 	
     TIM10_SR.UIF = 0;                     	// Clear timer 10 interrupt flag
     ADC1_HTR = high_level;               	// Reset AWD high threshold to initial state 
     ADC1_LTR = low_level;                	// Reset AWD low threshold to initial state 
     TIM10_DIER.UIE = 0;                   	// Disable timer 10 interrupt
	 go_status = ~go_status;				// Toggle status of system (Relies on variable initialized to 0, probably better way to do this)
     system_go = 1;							// Go flag to start the whole system in main.c 
}






/******************  Get Current EMG Signal Value  ******************
/																	/
/	Function Name: read_emg()										/
//	Return Type: unsigned long										/
/																	/
/	Description: 													/
/		This function samples the EMG ADC channel and returns the   /
/		current value of the signal.								/
/																	/
/	Preconditions: 													/
/		EMG has been initialized 									/
/																	/
/	Postconditions: 												/
/		Current value of EMG signal is returned 					/
/																	/
/*******************************************************************/
unsigned long read_emg() {								
	unsigned long currentADCValue;									//Local variable to store and return read value from EMG ADC 
	
	currentADCValue = ADC?_Get_Sample(CHANNEL_ADC_EMG);				//Sample EMG signal 
	
	return currentADCValue;										
}














