#ifndef FINGERSTRUCT_H
#define FINGERSTRUCT_H

/*
Prosthetic Hand Senior Design Project
9/25/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File Name:
    finger.h

 * Description:
    Header file for all finger related variables, structs, and functions


 * General Information about fingers:
	* Motor 3: Pointer
	* Motor 4: Middle
	* Motor 5: Ring
	* Motor 6: Pinky
	* Motor 1: Thumb Main
	* Motor 1: Thumb Articulation ???
	
 * Motor/Finger direction:
	0: Clockwise: Finger opening (defined as open)
	1: Counter Clockwise: Finger Closing (defined as close)	
*/

#include <defines.h>
#include <globals.h>




/************************  Initialize Finger Struct  ************************/
extern struct finger {
	unsigned int speed;									//Output - Intended speed (PWM Duty Cycle) of finger movement
	unsigned int direction;								//Output - Intended direction of finger movement
	unsigned int goalPosition;							//Output - Intended final position of finger 
	unsigned int home;									//Input  - Mechanical home limit switch
	unsigned int encoderA;								//Input  - State of quadrature encoder channel A
	unsigned int encoderB;								//Input  - State of quadrature encoder channel B
	unsigned int currentDirection;						//Input  - Direction of finger as read by quadrature encoder
	unsigned int currentPosition;						//Input  - Current position of finger 
	unsigned int currentSpeed;							//Input  - Speed of finger as read from encoder
	unsigned int previousPosition;						//Store  - Previously read location for speed calculation using known polling rate
	unsigned int positionOverflow;						//Store  - Position counter overflow counter (Incremented in counter overflow ISR)
	unsigned int moveFlag;								//Flag   - Flag for main loop that finger needs to move 
	float tipForce;										//Input  - Fingertip Flexiforce reading ****May need to be float??****
	float fingerForce;									//Input  - Force on finger as read by motor current ****May need to be float??****
	
}



//+++++++++++++++++++++ NEED TO FIGURE OUT STRUCT FUNCTION POINTERS+++++++++++++++++++++++++++++++++++++


/************************  Finger Function Prototypes  ************************/
void initialize_finger(struct);							//Initialize fingers individually by passing the individual structs in
void set_speed(struct, int);							//Set speed of finger movement (duty cycle of PWM, 0-100)
void set_dir(struct, int);								//Set direction of finger movement (open or close)
void set_position(struct, int);							//Set final position location of finger 
void home_reset(struct);								//Function to reset position counter when mechanical home switch hit
unsigned int get_current_direction(struct);				//Read direction of finger movement (used with currentDirection)
unsigned int get_current_position(struct);				//Read the position counter value (used with currentPosition)
unsigned int get_current_speed(struct, int);			//Read speed of finger movement (used with currentSpeed)
float get_tip_force(struct);							//Read the FlexiForce fingertip pressure
float get_finger_force(struct);							//Read force on finger from motor current sense

