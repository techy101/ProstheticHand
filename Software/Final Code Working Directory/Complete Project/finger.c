/*
Prosthetic Hand Senior Design Project
12/2/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File name:
    finger.c

 * Description:
    Finger All functions related to control of individual fingers 

	
*/


#include <finger.h>


/***************  Input Capture Timer Initialization  ***************
/																	/
/	Function Name: void init_capture_timers()						/
/																	/
/	Description: 													/
/		This function performs initial configuration of timers 		/
/		2 and 3 which are used for motor encoder input capture		/
/		timing. 													/
/																	/
/	Preconditions: 													/
/		None 														/
/																	/
/	Postconditions: 												/
/		Timers 2 and 3 are configured, but not yet activated		/
/																	/
/*******************************************************************/
void init_capture_timers() {
	
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
}



/*****************  Input Capture Timer Activation  *****************
/																	/
/	Function Name: void activate_capture_timers()					/
/																	/
/	Description: 													/
/		This function activates interrupts for timers 2 and 3		/
/		used for input capture timing 								/
/																	/
/	Preconditions: 													/
/		Timers 2 and 3 have been initialized 						/
/																	/
/	Postconditions: 												/
/		Timers 2 and 3 are running and interrupts are activated		/
/																	/
/*******************************************************************/
void activate_capture_timers() {
	
	TIM3_DIER.UIE = 1;                                                          // Enable overflow interrupt Timer 3
    TIM2_DIER.UIE = 1;                                                          // Enable overflow interrupt for Timer 2
    NVIC_IntEnable(IVT_INT_TIM3);                                               // Enable timer 3 ISR
    NVIC_IntEnable(IVT_INT_TIM2);                                               // Enable timer 2 ISR
    TIM3_CR1.CEN = 1;                                                           // Enable timer 3
    TIM2_CR1.CEN = 1;                                                           // Enable Timer 2
}




/*********************  Finger Initialization  **********************
/																	/
/	Function Name: void init_finger(struct finger *fngr)			/
/																	/
/	Description: 													/
/		This function sets pin masks and initialize all GPIO pins,	/
/		timers, PWM's and other finger attributs					/
/																	/
/	Preconditions: 													/
/		Finger instance has been instantiated and passed in			/
/																	/
/	Postconditions: 												/
/		All pins and resources will be allocated to the finger		/
/																	/
/*******************************************************************/
void init_finger(struct finger *fngr) {

	//Pointer Finger 
	if (strcmp(fngr->name, "fngr_pointer") == 0) {
		
		// Configure pointer finger (Pin C6, Channel 1) input capture
		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH1_PC6);                 // Configure alternate function for C6 as Timer 3 Channel 1
		TIM3_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
		TIM3_CCER.CC1P = 0;                                                         // Set capture on rising edge event
		TIM3_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
		TIM3_CCER.CC1E = 1;                                                         // Enable capture on channel 1
		TIM3_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
			
		// Configure encoder channel B 
		GPIO_Digital_Input(&GPIOE_BASE, _GPIO_PINMASK_12);                          // Pointer motor encoder channel B

		// Configure Pointer finger PWM 

		// Configure flexiforce sensor 
		
		//Configure motor driver current sensor 
	}
	
	else if (strcmp(fngr->name, "fngr_middle") == 0) {

		// Configure middle finger (Pin C7, Channel 2) input capture
		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH2_PC7);                 // Configure alternate function for pin C7 as Timer 3 Channel 2
		TIM3_CCMR1_Input |= 0x100;                                                  // Set capture channel 2 as input on TI2 (CC2S = 01)
		TIM3_CCER.CC2P = 0;                                                         // Set capture on rising edge event
		TIM3_CCER.CC2NP = 0;                                                        // ^^ Continuation of above
		TIM3_CCER.CC2E = 1;                                                         // Enable capture on channel 2
		TIM3_DIER.CC2IE = 1;                                                        // Enable interrupt on capture channel 2
			
		// Configure encoder channel B 
		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_11);                          // Middle motor encoder channel B

		// Configure Pointer finger PWM 

		// Configure flexiforce sensor 
		
		//Configure motor driver current sensor 
	}

	//Ring Finger
	else if (strcmp(fngr->name, "fngr_ring") == 0) {
		// Configure ring finger (Pin C8, Channel 3) input capture
		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH3_PC8);                 // Configure alternate function for pin BC8 as Timer 3 Channel 3
		TIM3_CCMR2_Input |= 0x01;                                                   // Set capture channel 3 as input on TI3 (CC3S = 01)
		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
		TIM3_CCER.CC3NP = 0;                                                         // ^^ Continuation of above
		TIM3_CCER.CC3E = 1;                                                         // Enable capture on channel 3
		TIM3_DIER.CC3IE = 1;                                                        // Enable interrupt on capture channel 3
			
		// Configure encoder channel B 
		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_15);                          // Ring motor encoder channel B

		// Configure Pointer finger PWM 

		// Configure flexiforce sensor 
		
		//Configure motor driver current sensor 
	}

	//Pinky 
	else if (strcmp(fngr->name, "fngr_pinky") == 0) {	

		// Configure pinky finger (Pin C9, Channel 4) input capture
		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH4_PC9);                 // Configure alternate function for pin C9 as Timer 3 Channel 4
		TIM3_CCMR2_Input |= 0x100;                                                  // Set capture channel 4 as input on TI4 (CC4S = 01)
		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
		TIM3_CCER.CC3NP = 0;                                                        // ^^ Continuation of above
		TIM3_CCER.CC4E = 1;                                                         // Enable capture on channel 4
		TIM3_DIER.CC4IE = 1;                                                        // Enable interrupt on capture channel 4
			
		// Configure encoder channel B 
		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_9);                           // Pinky motor encoder channel B

		// Configure Pointer finger PWM 

		// Configure flexiforce sensor 
		
		//Configure motor driver current sensor 
	}

	//Thumb
	else if (strcmp(fngr->name, "fngr_thumb") == 0) {

		// Configure Thumb (Pin A5, Channel 1) input capture
		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA5);                 // Configure alternate function for A5 as Timer 2 Channel 1
		TIM2_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
		TIM2_CCER.CC1P = 0;                                                         // Set capture on rising edge event
		TIM2_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
		TIM2_CCER.CC1E = 1;                                                         // Enable capture on channel 1
		TIM2_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
			
		// Configure encoder channel B 
		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_11);                          // Thumb motor encoder channel B

		// Configure Pointer finger PWM 

		// Configure flexiforce sensor 
		
		//Configure motor driver current sensor 
	}


	//Set Initial States
	fngr->direction = contract;				// Set initial direction of finger movement to contracting 
	fngr->speed_desired = 0;				// Set initial speed of finger movement to stopped 
	fngr->position_desired = 0;				// Set initial desired position to home (0)
	
    // Calculate period of TIM2_CLK and TIM3_CLK in ms. Used in state calculations
    encoder_timer_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
}





/*********************  Set Finger Speed  ***************************
/																	/
/	Function Name: set_finger_speed(struct, int) 					/
/	Return Type: None		 										/
/																	/
/	Description: 													/
/		This function sets the motor speed for a finger via duty	/
/		cycle. 														/
/																	/
/	Preconditions: 													/
/		Finger has been initialized 								/
/		Finger instance has been passed in 							/
/		Duty cycle input is valid									/
/																	/
/	Postconditions: 												/
/		Finger motor is running at set speed / duty cycle			/
/																	/
/*******************************************************************/
void set_finger_speed(struct finger *fngr, int speed) {
	
	
	if (strcmp(fngr->name, "fngr_pointer") == 0) {
		//Do PWM magic here
	}
	
	else if (strcmp(fngr->name, "fngr_middle") == 0) {
		//Do PWM magic here
	}
	
	else if (strcmp(fngr->name, "fngr_ring") == 0) {
		//Do PWM magic here
	}
	
	else if (strcmp(fngr->name, "fngr_pinky") == 0) {
		//Do PWM magic here
	}
	
	else if (strcmp(fngr->name, "fngr_thumb") == 0) {
		//Do PWM magic here
	}
	
	fngr->speed_desired = speed; 									// Store speed to finger instance 
}





/*********************  Set Finger Position  *************************
/																	/
/	Function Name: set_finger_position(struct, int)					/
/	Return Type: None		 										/
/																	/
/	Description: 													/
/		This function sets the desired destination position of a 	/
/		finger.														/
/																	/
/	Preconditions: 													/
/		Finger has been initialized 								/
/		Finger instance has been passed in 							/
/		Position value is valid										/
/																	/
/	Postconditions: 												/
/		Finger will attempt to reach desired position 				/
/																	/
/*******************************************************************/
void set_finger_position(struct finger *fngr, int position) {
	
	if (strcmp(fngr->name, "fngr_pointer") == 0) {
		//Do Position magic here
	}
	
	else if (strcmp(fngr->name, "fngr_middle") == 0) {
		//Do Position magic here
	}
	
	else if (strcmp(fngr->name, "fngr_ring") == 0) {
		//Do Position magic here
	}
	
	else if (strcmp(fngr->name, "fngr_pinky") == 0) {
		//Do Position magic here
	}
	
	else if (strcmp(fngr->name, "fngr_thumb") == 0) {
		//Do Position magic here
	}
	
	fngr->position_desired_desired = position; 							// Store position to finger instance 
}



/***************  Read Current Flexiforce Value  ********************
/																	/
/	Function Name: get_tip_force(struct) 							/
/	Return Type: float		 										/
/																	/
/	Description: 													/
/		This function samples the ADC channel for the Flexiforce    /
/		sensor on the given finger and returns the value 			/
/																	/
/	Preconditions: 													/
/		Finger has been initialized 								/
/		Finger instance has been passed in 							/
/		Signal from Flexiforce sensor is valid						/
/																	/
/	Postconditions: 												/
/		Current flexiforce pressure is returned 					/
/																	/
/*******************************************************************/
float get_tip_force(struct finger *fngr) {
	float currentTipForce;
	
	if (strcmp(fngr->name, "fngr_pointer") == 0) {
		currentTipForce = ADC1_Get_Sample(POINTER_FORCE_SENSOR};	// Sample ADC channel ??
	}
	
	else if (strcmp(fngr->name, "fngr_middle") == 0) {
		currentTipForce = ADC1_Get_Sample(MIDDLE_FORCE_SENSOR);		// Sample ADC channel ??
	}
	
	else if (strcmp(fngr->name, "fngr_ring") == 0) {
		currentTipForce = ADC1_Get_Sample(RING_FORCE_SENSOR);		// Sample ADC channel ??
	}
	
	else if (strcmp(fngr->name, "fngr_pinky") == 0) {
		currentTipForce = ADC1_Get_Sample(PINKY_FORCE_SENSOR);		// Sample ADC channel ??
	}
	
	else if (strcmp(fngr->name, "fngr_thumb") == 0) {
		currentTipForce = ADC1_Get_Sample(THUMB_FORCE_SENSOR);		// Sample ADC channel ??
	}
	
	fngr->tip_force = currentTipForce;								// Set current force reading to finger instance 

	return currentTipForce;
}





/**************  Read Current Isense Force Value  ******************
/																	/
/	Function Name: get_finger_force(struct) 						/
/	Return Type: float		 										/
/																	/
/	Description: 													/
/		This function samples the ADC channel for a the current     /
/		sensor on the motor driver IC. This corresponds to the 		/
/		torque applied to the motor 								/
/																	/
/	Preconditions: 													/
/		Finger has been initialized 								/
/		Finger instance has been passed in 							/
/		Signal from Isense resistor is valid						/
/																	/
/	Postconditions: 												/
/		Current Isense force value is returned 						/
/																	/
/*******************************************************************/
float get_finger_force(struct fingerName) {
	float currentFingerForce;
	
	
	if (strcmp(fngr->name, "fngr_pointer") == 0) {
		currentFingerForce = ADC1_Get_Sample(POINTER_FORCE_SENSOR};		// Sample ADC channel ??
	}
	
	else if (strcmp(fngr->name, "fngr_middle") == 0) {
		currentFingerForce = ADC1_Get_Sample(MIDDLE_FORCE_SENSOR);		// Sample ADC channel ??
	}
	
	else if (strcmp(fngr->name, "fngr_ring") == 0) {
		currentFingerForce = ADC1_Get_Sample(RING_FORCE_SENSOR);		// Sample ADC channel ??
	}
	
	else if (strcmp(fngr->name, "fngr_pinky") == 0) {
		currentFingerForce = ADC1_Get_Sample(PINKY_FORCE_SENSOR);		// Sample ADC channel ??
	}
	
	else if (strcmp(fngr->name, "fngr_thumb") == 0) {
		currentFingerForce = ADC1_Get_Sample(THUMB_FORCE_SENSOR);		// Sample ADC channel ??
	}
	
	fngr->motor_torque = currentFingerForce;							// Set current torque reading to finger instance 

	return currentFingerForce;
}