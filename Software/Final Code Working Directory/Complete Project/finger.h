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


/************************  Constants  ************************/
unsigned long MCU_FREQUENCY = 168000000;                                        // Microcontroller clock speed in Hz
unsigned long ENCODER_TIM_RELOAD = 65535;                                       // Auto Reload value for encoder CCP timers (16 bit register)
unsigned int ENCODER_TIM_PSC = 100;                                             // Prescaler for encoder CCP timers
unsigned int SAMPLE_TIM_RELOAD = 59999;                                         // Auto reload value for sampling timer (100ms)
unsigned int SAMPLE_TIM_PSC = 279;                                             	// Prescaler for sampling timer
unsigned long PWM_FREQ_HZ = 10000;												// PWM base frequency
int EXTEND = 1;																	// TODO these may not be the right directions
int CONTRACT = 0;
//unsigned long FULLY_EXTENDED = 0;                                              	// Lower bound for finger position			- These may not be necessary. 
//unsigned long FULLY_CONTRACTED = 4000;                                          // Higher bound for finger position			- In any case, they must be determined by testing.
unsigned int NORMALIZATION_CONSTANT = 4;                                       	// "Self-explanatory": to normalize encoder ticks to a given range (0-1000)


/**************  Global Variables  **************/
long double encoder_timer_period_ms;                                            // Period in ms of timers used for motor encoder input capture
unsigned int poll_flag;                                                         // Flag to enter main loop
unsigned long tim2_overflow_count;                                              // Overflow counter for timer 2
unsigned long tim3_overflow_count;                                              // Overflow counter for timer 3
unsigned int pwm_period;														// Base timer period of PWM - needed for duty cycle calculations


/************************  Finger Structure  ************************
/																	/
/	Structure name: finger											/
/																	/
/	Description: 													/
/		This structure includes all paramaters for a generic 		/
/		finger. 													/
/																	/
/*******************************************************************/

struct finger {
	char name[STR_MAX];                                                     // Name of finger
	long position_temp;                                                     // Number of input capture events since last sample. Used for finger position
	long position_actual;                                                   // Calculated position of finger 
	unsigned int direction_desired;											// Desired direction of movement of finger 
	unsigned int speed_desired;												// Desired speed of finger movement 
	unsigned int motor_speed_actual;										// Calculated motor output shaft speed (RPM)
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
	unsigned long input_sig_frequency;                                      // Frequency of motor encoder signal (in Hz) (Used in future for motor_speed_actual conversion)
	long double input_sig_period;                                           // Period of motor encoder signal (in ms)
	float motor_torque;														// Motor torque as measured by motor driver current 
	float tip_force;														// Force applied at flexiforce sensor on fingertip 
};




/************************  Finger Function Prototypes  ************************/
void init_capture_timers();										// Configure Timers 2 and 3 for input capture 
void activate_capture_timers();									// Arm timers 2 and 3 interrupts 
void init_finger(struct finger *fngr);							// Initialize all hardware for the selected finger 
unsigned int Pcontrol_position(struct finger *, unsigned long, unsigned long);	// Apply proportional control to position finger based on position handler
//unsigned int Pcontrol_force(struct finger *, unsigned long, unsigned long);	// Not sure about return type yet
void set_finger_speed(struct finger *fngr, int speed);			// Set speed of finger via PWM duty cycle 
void sample_finger(struct finger *fngr);						// Sample all finger paramaters and write to struct members
void debug_finger(struct finger *fngr);							// Print all finger state value to terminal 
void timer2_ISR();                                              // Interrupt handler for Timer 2
void timer3_ISR();                                              // Interrupt handler for Timer 3





















