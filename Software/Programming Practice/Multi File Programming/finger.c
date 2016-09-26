/*
Prosthetic Hand Senior Design Project
9/25/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File name:
    finger.c

 * Description:
    Finger All functions related to control of individual fingers 
	
	
	***Unsure if any functions need to return a value if they set the struct instance value***
	
*/


#include <finger.h>


/*********************  Finger Initialization  **********************
/																	/
/	Function Name: void initialize_finger()							/
/																	/
/	Description: 													/
/		This function sets pin masks and initialize all GPIO pins,	/
/		timers, PWM's and other finger attributs					/
/																	/
/	Preconditions: 													/
/		Finger instance has been initialized and passed in			/
/																	/
/	Postconditions: 												/
/		All pins and resources will be allocated to the finger		/
/																	/
/*******************************************************************/
void initialize_finger(struct fingerName) {

	 //Determine which finger to initialize 
	 switch(fingerName) {
		//Pointer Finger 
		case 'fngr_pointer': 
			//Initialize Direction and PWM
			GPIO_Digital_Output(&MASK_POINTER_PORT_BASE, MASK_POINTER_DIR_PIN);				//Enable digital output for Direction pin (Pin: ??)
			pwm_period = PWM_TIM1_Init(pwmFrequency);                                  		//Set PWM base frequency
			PWM_TIM1_Set_Duty(pwmInitialDuty, _PWM_NON_INVERTED, CHANNEL_POINTER_PWM);     	//Set initial duty cycle of 0 on Timer ??, channel ??
			PWM_TIM1_Start(CHANNEL_POINTER_PWM, &PIN_POINTER_PWM);          				//Start PWM (pin: ??)
					
			//Initialize Encoder Interrupts
			
			
			//Initialize ADC (Force Sensor, Current Sensor)
			
			
			//Set Initial States
			fingerName.direction = close;													//Set initial direction of finger movement to closing 
			fingerName.speed = 0;															//Set initial speed of finger movement to stopped 
			fingerName.goalPosition = fingerHomeLocation;									//Set initial position of finger at home location 
			fingerName.currentDirection = close;											//Set initial read direction to close (matches set direction)
			fingerName.currentSpeed = 0;													//Set initial read motor speed to stopped (matches set speed)
			fingerName.currentPosition = fingerHomeLocation;								//Set initial read finger position to home (matches set position)
			fingerName.tipForce = 0;														//Initialize flexiforce sensor value to 0 
			fingerName.fingerForce = 0;														//Initialize current sensing force value to 0 			

			break;
		
		//Middle Finger
		case 'fngr_middle': 
			//Initialize Direction and PWM
			GPIO_Digital_Output(&MASK_MIDDLE_PORT_BASE, MASK_MIDDLE_DIR_PIN);				//Enable digital output for Direction pin (Pin: ??)
			pwm_period = PWM_TIM1_Init(pwmFrequency);                                  		//Set PWM base frequency
			PWM_TIM1_Set_Duty(pwmInitialDuty, _PWM_NON_INVERTED, CHANNEL_MIDDLE_PWM);     	//Set initial duty cycle of 0 on Timer ??, channel ??
			PWM_TIM1_Start(CHANNEL_MIDDLE_PWM, &PIN_MIDDLE_PWM);          					//Start PWM (pin: ??)
								
			//Initialize Encoder Interrupts
			
			
			//Initialize ADC (Force Sensor, Current Sensor)
			
			
			//Set Initial States
			fingerName.direction = close;													//Set initial direction of finger movement to closing 
			fingerName.speed = 0;															//Set initial speed of finger movement to stopped 
			fingerName.goalPosition = fingerHomeLocation;									//Set initial position of finger at home location 
			fingerName.currentDirection = close;											//Set initial read direction to close (matches set direction)
			fingerName.currentSpeed = 0;													//Set initial read motor speed to stopped (matches set speed)
			fingerName.currentPosition = fingerHomeLocation;								//Set initial read finger position to home (matches set position)
			fingerName.tipForce = 0;														//Initialize flexiforce sensor value to 0 
			fingerName.fingerForce = 0;														//Initialize current sensing force value to 0 	
			break;
		
		//Ring Finger
		case 'fngr_ring': 
			//Initialize Direction and PWM
			GPIO_Digital_Output(&MASK_RING_PORT_BASE, MASK_RING_DIR_PIN);					//Enable digital output for Direction pin (Pin: ??)
			pwm_period = PWM_TIM1_Init(pwmFrequency);                                  		//Set PWM base frequency
			PWM_TIM1_Set_Duty(pwmInitialDuty, _PWM_NON_INVERTED, CHANNEL_RING_PWM);    		//Set initial duty cycle of 0 on Timer ??, channel ??
			PWM_TIM1_Start(CHANNEL_RING_PWM, &PIN_RING_PWM);          						//Start PWM (pin: ??)
											
			//Initialize Encoder Interrupts
			
			
			//Initialize ADC (Force Sensor, Current Sensor)
			
			
			//Set Initial States
			fingerName.direction = close;													//Set initial direction of finger movement to closing 
			fingerName.speed = 0;															//Set initial speed of finger movement to stopped 
			fingerName.goalPosition = fingerHomeLocation;									//Set initial position of finger at home location 
			fingerName.currentDirection = close;											//Set initial read direction to close (matches set direction)
			fingerName.currentSpeed = 0;													//Set initial read motor speed to stopped (matches set speed)
			fingerName.currentPosition = fingerHomeLocation;								//Set initial read finger position to home (matches set position)
			fingerName.tipForce = 0;														//Initialize flexiforce sensor value to 0 
			fingerName.fingerForce = 0;														//Initialize current sensing force value to 0 	
			break;
		
		//Pinky 
		case 'fngr_pinky':
			//Initialize Direction and PWM
			GPIO_Digital_Output(&MASK_PINKY_PORT_BASE, MASK_PINKY_DIR_PIN);					//Enable digital output for Direction pin (Pin: ??)
			pwm_period = PWM_TIM1_Init(pwmFrequency);                                  		//Set PWM base frequency
			PWM_TIM1_Set_Duty(pwmInitialDuty, _PWM_NON_INVERTED, CHANNEL_PINKY_PWM);     	//Set initial duty cycle of 0 on Timer ??, channel ??
			PWM_TIM1_Start(CHANNEL_PINKY_PWM, &PIN_PINKY_PWM);          					//Start PWM (pin: ??)
											
			//Initialize Encoder Interrupts
			
			
			//Initialize ADC (Force Sensor, Current Sensor)
			
			
			//Set Initial States
			fingerName.direction = close;													//Set initial direction of finger movement to closing 
			fingerName.speed = 0;															//Set initial speed of finger movement to stopped 
			fingerName.goalPosition = fingerHomeLocation;									//Set initial position of finger at home location 
			fingerName.currentDirection = close;											//Set initial read direction to close (matches set direction)
			fingerName.currentSpeed = 0;													//Set initial read motor speed to stopped (matches set speed)
			fingerName.currentPosition = fingerHomeLocation;								//Set initial read finger position to home (matches set position)
			fingerName.tipForce = 0;														//Initialize flexiforce sensor value to 0 
			fingerName.fingerForce = 0;														//Initialize current sensing force value to 0 	
			break;

		//Thumb
		case 'fngr_thumb':
			//Initialize Direction and PWM
			GPIO_Digital_Output(&MASK_THUMB_PORT_BASE, MASK_THUMB_DIR_PIN);					//Enable digital output for Direction pin (Pin: ??)
			pwm_period = PWM_TIM1_Init(pwmFrequency);                                  		//Set PWM base frequency
			PWM_TIM1_Set_Duty(pwmInitialDuty, _PWM_NON_INVERTED, CHANNEL_THUMB_PWM);   	  	//Set initial duty cycle of 0 on Timer ??, channel ??
			PWM_TIM1_Start(CHANNEL_THUMB_PWM, &PIN_THUMB_PWM);          					//Start PWM (pin: ??)
											
			//Initialize Encoder Interrupts
			
			
			//Initialize ADC (Force Sensor, Current Sensor)
			
			
			//Set Initial States
			fingerName.direction = close;													//Set initial direction of finger movement to closing 
			fingerName.speed = 0;															//Set initial speed of finger movement to stopped 
			fingerName.goalPosition = fingerHomeLocation;									//Set initial position of finger at home location 
			fingerName.currentDirection = close;											//Set initial read direction to close (matches set direction)
			fingerName.currentSpeed = 0;													//Set initial read motor speed to stopped (matches set speed)
			fingerName.currentPosition = fingerHomeLocation;								//Set initial read finger position to home (matches set position)
			fingerName.tipForce = 0;														//Initialize flexiforce sensor value to 0 
			fingerName.fingerForce = 0;														//Initialize current sensing force value to 0 	
			break;
		
		//Thumb Articulation 
		case 'fngr_thumb_articulate': 
			//Initialize Direction and PWM 
			GPIO_Digital_Output(&MASK_THUMB_ARTIC_PORT_BASE, MASK_THUMB_ARTIC_DIR_PIN);		//Enable digital output for Direction pin (Pin: ??)
			pwm_period = PWM_TIM1_Init(pwmFrequency);                                  		//Set PWM base frequency
			PWM_TIM1_Set_Duty(pwmInitialDuty, _PWM_NON_INVERTED, CHANNEL_THUMB_ARTIC_PWM);  //Set initial duty cycle of 0 on Timer ??, channel ??
			PWM_TIM1_Start(CHANNEL_THUMB_ARTIC_PWM, &PIN_THUMB_ARTIC_PWM);          		//Start PWM (pin: ??)
											
			//Initialize Encoder Interrupts
			
			
			//Initialize ADC (Force Sensor, Current Sensor)
			
			
			//Set Initial States
			fingerName.direction = close;													//Set initial direction of finger movement to closing 
			fingerName.speed = 0;															//Set initial speed of finger movement to stopped 
			fingerName.goalPosition = fingerHomeLocation;									//Set initial position of finger at home location 
			fingerName.currentDirection = close;											//Set initial read direction to close (matches set direction)
			fingerName.currentSpeed = 0;													//Set initial read motor speed to stopped (matches set speed)
			fingerName.currentPosition = fingerHomeLocation;								//Set initial read finger position to home (matches set position)
			fingerName.tipForce = 0;														//Initialize flexiforce sensor value to 0 
			fingerName.fingerForce = 0;														//Initialize current sensing force value to 0 	
			break;  
	 }
}




/***********************  Set Finger Speed  *************************
/																	/
/	Function Name: set_speed(struct, int)							/
/	Return Type: None 												/
/																	/
/	Description: 													/
/		This function sets the speed of a finger's movement by 		/
/		PWM duty cycle (0-100)										/
/																	/
/	Preconditions: 													/
/		Finger has been initialized 								/
/		Finger instance has been passed in 							/
/		Valid integer 0-100 has been passed in						/
/																	/
/	Postconditions: 												/
/		Finger will be attempting to move at the set speed 			/
/			Speed control system will work with this 				/
/																	/
/*******************************************************************/
void set_speed(struct fingerName, int desiredSpeed) {
	//Other stuff probably goes in here too
	fingerName.speed = desiredSpeed;									//Set the finger instance speed to desiredSpeed 	
}



/*********************  Set Finger Direction  ***********************
/																	/
/	Function Name: set_dir(struct, int)								/
/	Return Type: None 												/
/																	/
/	Description: 													/
/		This function sets the direction of a fingers movement		/
/		to opening or closing. It does not however start a 			/
/		finger moving or adjust the speed							/
/																	/
/	Preconditions: 													/
/		Finger has been initialized 								/
/		Finger instance has been passed in 							/
/		Valid direction (open or close) has been passed in			/
/																	/
/	Postconditions: 												/
/		Finger will be set to move the indicated direction			/
/																	/
/*******************************************************************/
void set_dir(struct fingerName, int desiredDirection) {
	//More stuff probably goes here too 
	fingerName.direction = desiredDirection;							//Set the finger to move as indicated by desiredDirection	
}





/*********************  Set Finger Position  ************************
/																	/
/	Function Name: set_position(struct, int)						/
/	Return Type: None 												/
/																	/
/	Description: 													/
/		This function sets the goal position of a finger. ie. 		/
/		the finger will attempt to reach this location as its 		/
/		final position if no force control takes over.				/
/																	/
/	Preconditions: 													/
/		Finger has been initialized 								/
/		Finger instance has been passed in 							/
/		Valid position has been passed in							/
/																	/
/	Postconditions: 												/
/		Finger will be set to move the indicated direction			/
/																	/
/*******************************************************************/
void set_position(struct fingerName, int desiredPosition) {
	//Other stuff probably goes here too 
	fingerName.goalPosition = desiredPosition);							//Set the final location of the finger to desiredPosition
}



/********************  Reset Finger Position  ***********************
/																	/
/	Function Name: home_reset(struct)								/
/	Return Type: None												/
/																	/
/	Description: 													/
/		This function resets the position counter for a given 		/
/		finger when the home-position limit switch has been hit.	/
/																	/
/	Preconditions: 													/
/		Finger has been initialized 								/
/		Finger instance has been passed in 							/
/																	/
/	Postconditions: 												/
/		Finger position counter will be set to 0 (home)				/
/																	/
/*******************************************************************/
void home_reset(struct fingerName) {
	//Reset timer/counter for the given finger encoder 
	fingerName.currentPosition = fingerHomeLocation;					//Resets the position attribute to initial location 
}





/****************  Read Current Finger Direction  *******************
/																	/
/	Function Name: get_current_direction(struct)					/
/	Return Type: unsigned int 										/
/																	/
/	Description: 													/
/		This function checks the state of both finger motor encoder /
/		lines (A and B) to determine the actual direction of 		/
/		movement of the motor/finger. 								/
/																	/
/	Preconditions: 													/
/		Finger has been initialized 								/
/		Finger instance has been passed in 							/
/		Both quadrature encoder signals are available				/
/																	/
/	Postconditions: 												/
/		Direction of finger movement will be returned				/
/																	/
/*******************************************************************/
unsigned int get_current_direction(struct fingerName) {
	//Other stuff probably goes in here too 
	int encoderStateA, encoderStateB, actualDirection;
	
		 //Determine which finger to test 
	 switch(fingerName) {
		//Pointer Finger 
		case 'fngr_pointer': 
			encoderStateA = PIN_POINTER_ENCODER_A;
			encoderStateB = PIN_POINTER_ENCODER_B;
			
			if (encoderStateA && !encoderStateB) {						//The finger is opening **********This logic is a guess. needs to be sorted out*******
				fingerName.currentDirection = open;						//Set the instance variable to open 
				actualDirection = open;									//Set return variable to open 
			}
			
			else if (!encoderStateA && encoderStateB) {					//The finger is closing 
				fingerName.currentDirection = close;					//Set the instance variable to close 
				actualDirection = close;								//Set return variable to close
			}
			
			else {
				//ERROR HANDLER HERE 
			}
			break;
		
		//Middle Finger
		case 'fngr_middle': 
			encoderStateA = PIN_MIDDLE_ENCODER_A;
			encoderStateB = PIN_MIDDLE_ENCODER_B;
			
			if (encoderStateA && !encoderStateB) {						//The finger is opening **********This logic is a guess. needs to be sorted out*******
				fingerName.currentDirection = open;						//Set the instance variable to open 
				actualDirection = open;									//Set return variable to open 
			}
			
			else if (!encoderStateA && encoderStateB) {					//The finger is closing 
				fingerName.currentDirection = close;					//Set the instance variable to close 
				actualDirection = close;								//Set return variable to close
			}
			
			else {
				//ERROR HANDLER HERE 
			}
			break;
		
		//Ring Finger
		case 'fngr_ring': 
			encoderStateA = PIN_RING_ENCODER_A;
			encoderStateB = PIN_RING_ENCODER_B;
			
			if (encoderStateA && !encoderStateB) {						//The finger is opening **********This logic is a guess. needs to be sorted out*******
				fingerName.currentDirection = open;						//Set the instance variable to open 
				actualDirection = open;									//Set return variable to open 
			}
			
			else if (!encoderStateA && encoderStateB) {					//The finger is closing 
				fingerName.currentDirection = close;					//Set the instance variable to close 
				actualDirection = close;								//Set return variable to close
			}
			
			else {
				//ERROR HANDLER HERE 
			}
			break;
		
		//Pinky 
		case 'fngr_pinky':
			encoderStateA = PIN_PINKY_ENCODER_A;
			encoderStateB = PIN_PINKY_ENCODER_B;
			
			
			if (encoderStateA && !encoderStateB) {						//The finger is opening **********This logic is a guess. needs to be sorted out*******
				fingerName.currentDirection = open;						//Set the instance variable to open 
				actualDirection = open;									//Set return variable to open 				
			}
			
			else if (!encoderStateA && encoderStateB) {					//The finger is closing 
				fingerName.currentDirection = close;					//Set the instance variable to close 
				actualDirection = close;								//Set return variable to close
			}
			
			else {
				//ERROR HANDLER HERE 
			}
			break;

		//Thumb
		case 'fngr_thumb':
			encoderStateA = PIN_THUMB_ENCODER_A;
			encoderStateB = PIN_THUMB_ENCODER_B;
			
			if (encoderStateA && !encoderStateB) {						//The finger is opening **********This logic is a guess. needs to be sorted out*******
				fingerName.currentDirection = open;						//Set the instance variable to open 
				actualDirection = open;									//Set return variable to open 
			}
			
			else if (!encoderStateA && encoderStateB) {					//The finger is closing 
				fingerName.currentDirection = close;					//Set the instance variable to close 
				actualDirection = close;								//Set return variable to close
			}
			
			else {
				//ERROR HANDLER HERE 
			}
			break;
		
		//Thumb Articulation 
		case 'fngr_thumb_articulate': 
			encoderStateA = PIN_THUMB_ARTIC_ENCODER_A;
			encoderStateB = PIN_THUMB_ARTIC_ENCODER_B;
			
			if (encoderStateA && !encoderStateB) {						//The finger is opening **********This logic is a guess. needs to be sorted out*******
				fingerName.currentDirection = open;						//Set the instance variable to open 
				actualDirection = open;									//Set return variable to open 
			}
			
			else if (!encoderStateA && encoderStateB) {					//The finger is closing 
				fingerName.currentDirection = close;					//Set the instance variable to close 
				actualDirection = close;								//Set return variable to close
			}
			
			else {
				//ERROR HANDLER HERE 
			}
			break;  
	 }
	 return actualDirection;
}





/****************  Read Current Finger Position  ********************
/																	/
/	Function Name: get_current_position(struct) 					/
/	Return Type: unsigned int 										/
/																	/
/	Description: 													/
/		This function checks value of the counter associated with   /
/		the given finger's position encoder and returns it			/
/																	/
/	Preconditions: 													/
/		Finger has been initialized 								/
/		Finger instance has been passed in 							/
/		Quadrature encoder channel A is valid						/
/																	/
/	Postconditions: 												/
/		Current position of the finger will be returned				/
/																	/
/*******************************************************************/
unsigned int get_current_position(struct fingerName) {
	int actualPosition;
	
		 //Determine which finger to test 
	 switch(fingerName) {
		//Pointer Finger 
		case 'fngr_pointer': 
			//fingerName.currentPosition = COUNTER_POINTER_POSITION;
			//actualPosition = COUNTER_POINTER_POSITION;
			break;
		
		//Middle Finger
		case 'fngr_middle': 

			//fingerName.currentPosition = COUNTER_MIDDLE_POSITION;
			//actualPosition = COUNTER_MIDDLE_POSITION;
			break;
		
		//Ring Finger
		case 'fngr_ring': 
			//fingerName.currentPosition = COUNTER_RING_POSITION;
			//actualPosition = COUNTER_RING_POSITION 
			break;
		
		//Pinky 
		case 'fngr_pinky':
			//fingerName.currentPosition = COUNTER_PINKY_POSITION;
			//actualPosition = COUNTER_PINKY_POSITION;
			break;

		//Thumb
		case 'fngr_thumb':
			//fingerName.currentPosition = COUNTER_THUMB_POSITION;
			//actualPosition = COUNTER_THUMB_POSITION; 
			break;
		
		//Thumb Articulation 
		case 'fngr_thumb_articulate': 
			//fingerName.currentPosition = COUNTER_THUMB_ARTIC_POSITION;
			//actualPosition = COUNTER_THUMB_ARTIC_POSITION;
			break;  
	 }
	 
	 return actualPosition;
}






/*****************  Read Current Finger Speed  **********************
/																	/
/	Function Name: get_current_speed(struct) 						/
/	Return Type: unsigned int 										/
/																	/
/	Description: 													/
/		This function checks value of the counter associated with   /
/		the given finger's position encoder, checks the prevoius 	/
/		value and, using a known polling rate, calculates the 		/
/		current speed of finger movement							/
/																	/
/	Preconditions: 													/
/		Finger has been initialized 								/
/		Finger instance has been passed in 							/
/		Quadrature encoder channel A is valid						/
/																	/
/	Postconditions: 												/
/		Current speed of the finger will be returned				/
/																	/
/*******************************************************************/
unsigned int get_current_speed(struct fingerName, int pollingRate) {
	unsigned int actualPosition, deltaPosition = 0;
	unsigned int previousPosition = fingerName.previousPosition;
	
		 //Determine which finger to test 
	 switch(fingerName) {
		//Pointer Finger 
		case 'fngr_pointer': 
			//fingerName.currentPosition = COUNTER_POINTER_POSITION;
			//actualPosition = COUNTER_POINTER_POSITION;
			break;
		
		//Middle Finger
		case 'fngr_middle': 

			//fingerName.currentPosition = COUNTER_MIDDLE_POSITION;
			//actualPosition = COUNTER_MIDDLE_POSITION;
			break;
		
		//Ring Finger
		case 'fngr_ring': 
			//fingerName.currentPosition = COUNTER_RING_POSITION;
			//actualPosition = COUNTER_RING_POSITION 
			break;
		
		//Pinky 
		case 'fngr_pinky':
			//fingerName.currentPosition = COUNTER_PINKY_POSITION;
			//actualPosition = COUNTER_PINKY_POSITION;
			break;

		//Thumb
		case 'fngr_thumb':
			//fingerName.currentPosition = COUNTER_THUMB_POSITION;
			//actualPosition = COUNTER_THUMB_POSITION; 
			break;
		
		//Thumb Articulation 
		case 'fngr_thumb_articulate': 
			//fingerName.currentPosition = COUNTER_THUMB_ARTIC_POSITION;
			//actualPosition = COUNTER_THUMB_ARTIC_POSITION;
			break;  
	 }
	 
		if (fingerName.positionOverflow) {											//Check if position counter has overflowed (Determined in counter overflow ISR)
			deltaPosition =  (fingerName.positionOverflow * maxPositionValue);		//Calculate total from previous overflows
			}
			deltaPosition += actualPosition;										//Add current position to total position. 
		}
		else {																		//If no overflow has occured 
			deltaPosition = actualPosition;											//Store current position
		}
		
	 return deltaPosition;
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
unsigned int get_tip_force(struct fingerName) {
	float currentTipForce;
	
		 //Determine which finger to test 
	 switch(fingerName) {
		//Pointer Finger 
		case 'fngr_pointer': 
			//fingerName.tipForce = ADC?_Get_Sample(CHANNEL_ADC_POINTER_TIP_FORCE);
			//currentTipForce = ADC?_Get_Sample(CHANNEL_ADC_POINTER_TIP_FORCE);
			break;
		
		//Middle Finger
		case 'fngr_middle': 
			//fingerName.tipForce = ADC?_Get_Sample(CHANNEL_ADC_MIDDLE_TIP_FORCE);
			//currentTipForce = ADC?_Get_Sample(CHANNEL_ADC_MIDDLE_TIP_FORCE);
			break;
		
		//Ring Finger
		case 'fngr_ring': 
			//fingerName.tipForce = ADC?_Get_Sample(CHANNEL_ADC_RING_TIP_FORCE);
			//currentTipForce = ADC?_Get_Sample(CHANNEL_ADC_RING_TIP_FORCE);
			break;
		
		//Pinky 
		case 'fngr_pinky':
			//fingerName.tipForce = ADC?_Get_Sample(CHANNEL_ADC_PINKY_TIP_FORCE);
			//currentTipForce = ADC?_Get_Sample(CHANNEL_ADC_PINKY_TIP_FORCE);
			break;

		//Thumb
		case 'fngr_thumb':
			//fingerName.tipForce = ADC?_Get_Sample(CHANNEL_ADC_THUMB_TIP_FORCE);
			//currentTipForce = ADC?_Get_Sample(CHANNEL_ADC_THUMB_TIP_FORCE);
			break;
		
		//Thumb Articulation 
		case 'fngr_thumb_articulate': 
			//fingerName.tipForce = ADC?_Get_Sample(CHANNEL_ADC_THUMB_ARTIC_TIP_FORCE);
			//currentTipForce = ADC?_Get_Sample(CHANNEL_ADC_THUMB_ARTIC_TIP_FORCE);
			break;  
	 }
	 
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
/		force applied to the finger. 								/
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
unsigned int get_finger_force(struct fingerName) {
	float currentFingerForce;
	
		 //Determine which finger to test 
	 switch(fingerName) {
		//Pointer Finger 
		case 'fngr_pointer': 
			//fingerName.fingerForce = ADC?_Get_Sample(CHANNEL_ADC_POINTER_ISENSE);
			//currentFingerForce = ADC?_Get_Sample(CHANNEL_ADC_POINTER_ISENSE);
			break;
		
		//Middle Finger
		case 'fngr_middle': 
			//fingerName.fingerForce = ADC?_Get_Sample(CHANNEL_ADC_MIDDLE_ISENSE);
			//currentFingerForce = ADC?_Get_Sample(CHANNEL_ADC_MIDDLE_ISENSE);
			break;
		
		//Ring Finger
		case 'fngr_ring': 
			//fingerName.fingerForce = ADC?_Get_Sample(CHANNEL_ADC_RING_ISENSE);
			//currentFingerForce = ADC?_Get_Sample(CHANNEL_ADC_RING_ISENSE);
			break;
		
		//Pinky 
		case 'fngr_pinky':
			//fingerName.fingerForce = ADC?_Get_Sample(CHANNEL_ADC_PINKY_ISENSE);
			//currentFingerForce = ADC?_Get_Sample(CHANNEL_ADC_PINKY_ISENSE);
			break;

		//Thumb
		case 'fngr_thumb':
			//fingerName.fingerForce = ADC?_Get_Sample(CHANNEL_ADC_THUMB_ISENSE);
			//currentFingerForce = ADC?_Get_Sample(CHANNEL_ADC_THUMB_ISENSE);
			break;
		
		//Thumb Articulation 
		case 'fngr_thumb_articulate': 
			//fingerName.fingerForce = ADC?_Get_Sample(CHANNEL_ADC_THUMB_ARTIC_ISENSE);
			//currentFingerForce = ADC?_Get_Sample(CHANNEL_ADC_THUMB_ARTIC_ISENSE);
			break;  
	 }
	 
	 return currentFingerForce;
}