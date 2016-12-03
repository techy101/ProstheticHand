#ifndef FINGER_H
#define FINGER_H

#include <defines.h>

/*
Prosthetic Hand Senior Design Project
12/2/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File Name:
    finger.h

 * Description:
    Header file for all finger related variables, structs, and functions

// * Timer 11 used to set sample rate: 100ms

/* Hookup:
   * Pointer finger motor encoder
     * Timer 3, Channel 1
     * Encoder Channel A: C6
     * Encoder Channel B: E12
     
   * Middle finger motor encoder
     * Timer 3, Channel 2
     * Encoder Channel A: C7
     * Encoder Challen B: A11
     
   * Ring finger motor encoder
     * Timer 3, Channel 3
     * Encoder Channel A: C8
     * Encoder Channel B: B15
     
   * Pinky motor encoder
     * Timer 3, Channel 4
     * Encoder Channel A: C9
     * Encoder Channel B: D9
     
   * Thumb motor encoder
     * Timer 2, Channel 1
     * Encoder Channel A: A5
     * Encoder Channel B: C11
     
*/



/************************  Finger Structure  ************************
/																	/
/	Structure name: finger											/
/																	/
/	Description: 													/
/		This structure includes all paramaters for a generic 		/
/		finger. 													/
/																	/
/*******************************************************************/

extern struct finger {
	char name[STR_MAX];                                                     // Name of finger
	long position_temp;                                                     // Number of input capture events since last sample. Used for finger position
	long position_actual;                                                   // Calculated position of finger 
	unsigned int direction;													// Desired direction of movement of finger 
	unsigned int speed_desired;												// Desired speed of finger movement 
	unsigned int position_desired;											// Desired destination position of finger 
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
	float motor_torque;														// Motor torque as measured by motor driver current 
	float tip_force;														// Force applied at flexiforce sensor on fingertip 
};



/************************  Finger Function Prototypes  ************************/
void init_capture_timers();										// Configure Timers 2 and 3 for input capture 
void activate_capture_timers();									// Arm timers 2 and 3 interrupts 
void init_finger(struct finger *fngr);							// Initialize all hardware for the selected finger 
void set_finger_speed(struct finger *fngr, int speed);			// Set speed of finger via PWM duty cycle 
void set_finger_position(struct finger *fngr, int position);	// Set the desired destination position of finger 
float get_tip_force(struct finger *fngr);						// Read the FlexiForce fingertip pressure
float get_finger_force(struct finger *fngr);					// Read force on finger from motor current sense

