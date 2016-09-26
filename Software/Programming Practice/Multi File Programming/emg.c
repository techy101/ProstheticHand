/*
Prosthetic Hand Senior Design Project
9/25/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File name:
    emg.c

 * Description:
    C file for all EMG related functions and interrupts  
*/

#include <emg.h>




/****************  Electromyography Initialization  *****************
/																	/
/	Function Name: initialize_emg()									/
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
/																	/
/*******************************************************************/
void initialize_emg() {														// Initialization of remaining Electromyography system
	ADC_Set_Input_Channel(_ADC_CHANNEL_3);                    				// Choose ADC channel
	GPIO_Config(&MASK_AWD_PORT_BASE, MASK_AWD_INPUT_PIN, (_GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO));		//Set port and pin for EMG analog input (Pulldown = NO)
	//ADC?_Init();                                               			// Call MikroC built-in ADC Channel ? initialization function 
    //ADC?_LTR = AWD_INITIAL_LOW_THRESH;     								// Set AWD Guarded zone low threshold value to initial state (defined in emg.h)
    //ADC?_HTR = AWD_INITIAL_HIGH_THRESH;  									// Set AWD Guarded zone high threshold value to initial state (defined in emg.h)
    //ADC?_CR1bits.AWDIE = 1;   											// Enable analog interrupt
    //ADC?_CR1bits.AWDEN = 1;    											// Enable Analog watchdog on regular channels
	
	//Initialize AWD Interrupt   ***Unsure of code here, waiting for Donnell***
}


/*********************  AWD Interrupt Handler  **********************
/																	/
/	Function Name: ADC_AWD()										/
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
/		AWD is disabled, range is reset, main execution timer 	    /
/		interrupt is executed, and AWD is finally re-enabled. For	/
/		now this ISR handles all code, but this may be transfered   /
/		to a state in the main code and setting a flag. However		/
/		this ISR can override all other code, so if it executes 	/
/		quickly enough the code will be left inside the ISR, unlike	/
/		all other ISR's 											/
/																	/
/*******************************************************************/
void ADC_AWD() iv IVT_INT_WWDG ics ICS_AUTO {								//Declaring ISR for analog watchdog (***Does this need to be named this, or can we be more descriptive***)
																			//Disable AWD interrupt 
																			//Disable AWD (forget name of this, but it's the bit set in the ADC (AWD?) register)
																			//Clear AWD interrupt bit 
																			//Clear AWD bit  (forget name of this one)
																			//Execute appropriate AWD range change (call change window function)
																			//Set state flag for initial or armed state (check range) 
																			//Re-Enable AWD Interrupt 
																			//Re-Enable AWD bit 	
}



/****************  Initial AWD Guarded Zone Setup  ******************
/																	/
/	Function Name: set_initial_awd_window()							/
/	Return Type: None												/
/																	/
/	Description: 													/
/		This function configures the analog watchdog guarded zone   /
/		to its standby state. This is the state where it's looking  /
/		for a low-to-high transition (initial flexing of muscle)	/
/																	/
/	Preconditions: 													/
/		AWD and EMG have been initialized							/
/																	/
/	Postconditions: 												/
/		AWD Guarded zone window will be set to initial(standby) 	/
/		state. 														/
/																	/
/*******************************************************************/
void set_initial_awd_window() {												//Sets the AWD window to the initial state (waiting for low->high transition)
    //ADC?_LTR = AWD_INITIAL_LOW_THRESH;     								// Set AWD Guarded zone low threshold value to initial state (defined in emg.h)
    //ADC?_HTR = AWD_INITIAL_HIGH_THRESH;  									// Set AWD Guarded zone high threshold value to initial state (defined in emg.h)
}



/*****************  Armed AWD Guarded Zone Setup  *******************
/																	/
/	Function Name: set_armed_awd_window()							/
/	Return Type: None												/
/																	/
/	Description: 													/
/		This function configures the analog watchdog guarded zone   /
/		to its armed state. This is the state where it's looking	/
/		for a high-to-low transition (releasing of muscle flex)		/
/																	/
/	Preconditions: 													/
/		AWD and EMG have been initialized							/
/																	/
/	Postconditions: 												/
/		AWD Guarded zone window will be set to armed state		 	/
/																	/
/*******************************************************************/
void set_armed_awd_window() {												//Sets the AWD window to the armed state (waiting for the high->low transition) 
    //ADC?_LTR = AWD_ARMED_LOW_THRESH;     									// Set AWD Guarded zone low threshold value to initial state (defined in emg.h)
    //ADC?_HTR = AWD_ARMED_HIGH_THRESH;  									// Set AWD Guarded zone high threshold value to initial state (defined in emg.h)
}



/******************  Get Current EMG Signal Value  ******************
/																	/
/	Function Name: get_current_emg_value()							/
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
unsigned long get_current_emg_value() {										//Samples the EMG signal and returns the current value 
	unsigned long currentADCValue;											//Local variable to store and return read value from EMG ADC 
	currentADCValue = ADC?_Get_Sample(CHANNEL_ADC_EMG_SIGNAL);				//Sample EMG signal 
	
	return currentADCValue;										
}
