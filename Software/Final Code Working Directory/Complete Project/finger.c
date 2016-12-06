#include <finger.h>

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
		GPIO_Digital_Input(&GPIOE_BASE, _GPIO_PINMASK_12);                          // Pointer motor encoder channel B (E12)

		// Configure Pointer finger PWM (Pin E9)
		pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);                                  	// Set PWM base frequency to 100 Hz
		PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, POINTER_PWM);          				// PWM duty cycle to 0 on Timer 1, channel 1
		PWM_TIM1_Start(POINTER_PWM, &_GPIO_MODULE_TIM1_CH1_PE9);       				// Start PWM
		
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
		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_11);                          // Middle motor encoder channel B (A11)

		// Configure Middle finger PWM (Pin E11)
		pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);                                  	// Set PWM base frequency to 100 Hz
		PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, MIDDLE_PWM);          				// PWM duty cycle to 0 on Timer 1, channel 2
		PWM_TIM1_Start(MIDDLE_PWM, &_GPIO_MODULE_TIM1_CH2_PE11);       				// Start PWM
		
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
		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_15);                          // Ring motor encoder channel B (B15)

		// Configure Ring finger PWM (Pin E13)
		pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);                                  	// Set PWM base frequency to 100 Hz
		PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, RING_PWM);          				// PWM duty cycle to 0 on Timer 1, channel 3
		PWM_TIM1_Start(RING_PWM, &_GPIO_MODULE_TIM1_CH3_PE13);       				// Start PWM

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
		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_9);                           // Pinky motor encoder channel B (D9)

		// Configure Pinky finger PWM (Pin E14)
		pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);                                  	// Set PWM base frequency to 100 Hz
		PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, PINKY_PWM);          				// PWM duty cycle to 0 on Timer 1, channel 4
		PWM_TIM1_Start(PINKY_PWM, &_GPIO_MODULE_TIM1_CH4_PE14);       				// Start PWM

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
		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_11);                          // Thumb motor encoder channel B (C11)

		// Configure Thumb PWM (Pin B6) 
		pwm_period = PWM_TIM4_Init(PWM_FREQ_HZ);                                  	// Set PWM base frequency to 100 Hz
		PWM_TIM4_Set_Duty(0, _PWM_NON_INVERTED, THUMB_PWM);          				// PWM duty cycle to 0 on Timer 4, channel 1

		// Configure flexiforce sensor 
		
		//Configure motor driver current sensor 
		
	}


	//Set Initial States
	fngr->direction = CONTRACT;				// Set initial direction of finger movement to contracting 
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
	
	unsigned int duty_cycle;
		
	// convert speed to duty cycle: integer 20-100
	duty_cycle = speed;						// for now...
	
	if(speed == 0 || fngr->speed_actual > 20000)
		fngr->speed_actual = 0;
	
	if (strcmp(fngr->name, "fngr_pointer") == 0) {
		//Do PWM magic here:		
		// Convert duty cycle to timer ticks and set it 
		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);		
	}
	
	else if (strcmp(fngr->name, "fngr_middle") == 0) {
		//Do PWM magic here:		
		// Convert duty cycle to timer ticks and set it 
		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);	
	}
	
	else if (strcmp(fngr->name, "fngr_ring") == 0) {
		//Do PWM magic here:
		// Convert duty cycle to timer ticks and set it 
		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);	
	}
	
	else if (strcmp(fngr->name, "fngr_pinky") == 0) {
		//Do PWM magic here:
		// Convert duty cycle to timer ticks and set it 
		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, PINKY_PWM);
	}
	
	else if (strcmp(fngr->name, "fngr_thumb") == 0) {
		//Do PWM magic here:
		// Convert duty cycle to timer ticks and set it 
		PWM_TIM4_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);
	}
	
	fngr->speed_desired = speed; 									// Store speed to finger instance 
}






/********************  Sample Finger State  *************************
/																	/
/	Function Name: sample_finger(struct) 							/
/	Return Type: None		 										/
/																	/
/	Description: 													/
/		This function samples all paramaters associated with a  	/
/		finger instance. (Speed, position, direction, tip force, 	/
/		motor torque)												/
/																	/
/	Preconditions: 													/
/		Finger has been instantiated 								/
/		Finger instance has been passed in 							/
/																	/
/	Postconditions: 												/
/		All paramaters have been stored to struct instance members	/
/																	/
/*******************************************************************/
void sample_finger(struct finger *fngr){
	
	
	if (strcmp(fngr->name, "fngr_pointer") == 0) {							// Get analog values for pointer finger 
		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_POINTER_TIP_FORCE);	//Sample pointer finger flexiforce 
		fngr->motor_torque = ADC1_Get_Sample(CHANNEL_ADC_POINTER_ISENSE);	//Sample pointer finger motor torque 
	}
		
	
	else if (strcmp(fngr->name, "fngr_middle") == 0) {						// Get analog values for middle finger 
		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_MIDDLE_TIP_FORCE);	// Sample middle finger flexiforce 
		fngr->motor_torque = ADC1_Get_Sample(CHANNEL_ADC_MIDDLE_ISENSE);	// Sample middle finger motor torque 
	}
	
	else if (strcmp(fngr->name, "fngr_ring") == 0) {						// Get analog values for ring finger 
		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_RING_TIP_FORCE);		// Sample ring finger flexiforce 
		fngr->motor_torque = ADC1_Get_Sample(CHANNEL_ADC_RING_ISENSE);		// Sample ring finger motor torque 
	}
	
	else if (strcmp(fngr->name, "fngr_pinky") == 0) {						// Get analog values for pinky
		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_PINKY_TIP_FORCE);		// Sample pinky flexiforce 
		fngr->motor_torque = ADC1_Get_Sample(CHANNEL_ADC_PINKY_ISENSE);		// Sample pinky motor torque 
	}
	
	else if (strcmp(fngr->name, "fngr_thumb") == 0) {						// Get analog values for thumb
		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_THUMB_TIP_FORCE);		// Sample thumb flexiforce 
		fngr->motor_torque = ADC1_Get_Sample(CHANNEL_ADC_THUMB_ISENSE);		// Sample thumb motor torque 
	}
	
	
	// Calculate position, direction, speed of motor 
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
	   
	fngr->motor_speed_actual = fngr->input_sig_frequency;						// Temporary reassignment, will be conversion in future from 
																				// 	  input encoder frequency to motor output shaft speed (RPM)
	
	// Check direction of motor movement and calculate position
	if (fngr->enc_chan_b == 1) {                                                // Clockwise
			fngr->direction_actual = 1;											// TODO use EXTEND and CONTRACT
			fngr->position_actual += fngr->position_temp;                       // Calculate new position
	}

	else if (fngr->enc_chan_b == 0) {                                           // Counter Clockwise
			fngr->direction_actual = 0;
			fngr->position_actual -= fngr->position_temp;                       // Calculate new position
	}

	else {                                                                      // ERROR: Invalid direction state
			fngr->direction_actual = 7;
	}

	fngr->position_temp = 0;													// Reset position counter
}







/**********************  Print Debug Values  ************************
/																	/
/	Function Name: debug_finger(struct)								/
/	Return Type: None		 										/
/																	/
/	Description: 													/
/		This function prints all current state values of the finger /
/		to the terminal for debug 									/
/																	/
/	Preconditions: 													/	***Needs to be adapted for new multi-UART print functions 
/		Finger has been initialized 								/
/		Finger instance has been passed in 							/
/																	/
/	Postconditions: 												/
/		All state values have been printed to the terminal 			/
/																	/
/*******************************************************************/
void debug_finger(struct finger *fngr) {
	
    //Local strings
    char frequency_text[STR_MAX];
    char position_text[STR_MAX];
    char direction_text[STR_MAX];
	char tip_force_text[STR_MAX];
	char motor_torque_text[STR_MAX];
    
    UART1_Write_Text("\n\rFinger Name: ");                                      //Print name of current finger to terminal
    UART1_Write_Text(fngr->name);
    UART1_Write_Text("\n\r");

    LongWordToStr(fngr->input_sig_frequency, frequency_text);                   // Print input capture signal frequency to terminal
    UART1_Write_Text("Finger speed (Hz): ");
    UART1_Write_Text(frequency_text);
    UART1_Write_Text("\n\r");                        

    IntToStr(fngr->direction_actual, direction_text);                           // Print direction of movement to terminal
    UART1_Write_Text("Direction of movement:             ");
    UART1_Write_Text(direction_text);
    UART1_Write_Text("\n\r");                        
    
    LongToStr(fngr->position_actual, position_text);                            // Print total number of input events (position) to terminal
    UART1_Write_Text("Position of finger:                ");
    UART1_Write_Text(position_text);
    UART1_Write_Text("\n\r");
	
	FloatToStr(fngr->tip_force, tip_force_text);								// Print flexiforce value to terminal 
	UART1_Write_Text("Fingertip Force: 					 ");
	UART1_Write_Text(tip_force_text);
	UART1_Write_Text("\n\r");
	
	FloatToStr(fngr->motor_torque, motor_torque_text);							// Print motor torque value to terminal 
	UART1_Write_Text("Finger Motor Torque: 				 ");
	UART1_Write_Text(motor_torque_text);
	UART1_Write_Text("\n\n\n\r");
}






/**************  Finger Encoder Interrupt Handlers  *****************
/																	/
/	Description: 													/
/		These ISR's handle all encoder input capture and overflow	/
/		events for timers 2 and 3. These are capture channels for 	/
/		motor encoder channel A on all fingers 						/
/																	/
/	Preconditions: 													/
/		Timers 2 and 3 have been initialized 						/
/		Input capture channels have been configured 				/
/																	/
/*******************************************************************/
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
        fngr_thumb.enc_chan_b = THUMB_ENCODER_B;                                // Sample the second encoder channel (For direction)
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


