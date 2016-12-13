#ifndef FINGER_H
#define FINGER_H

#include "defines.h"

/*
Prosthetic Hand Senior Design Project
12/12/2016
Matthew Varas
Rachel Mertz
Donnell Jones

 * File Name:
    finger.h

 * Description:
    Header file for all finger related variables, structs, and functions





/************************  Finger Structure  ************************
/                                                                    /
/    Structure name: finger                                            /
/                                                                    /
/    Description:                                                     /
/        This structure includes all paramaters for a generic             /
/        finger.                                                     /
/                                                                    /
/*******************************************************************/
/*extern struct finger {
    char name[STR_MAX];                                         // Name of finger
    long position_temp;                                         // Number of input capture events since last sample. Used for finger position
    long position_actual;                                       // Calculated position of finger
    unsigned int direction_actual;                              // Actual direction of motor movement as read from encoder
    unsigned int direction_desired;                             // Desired direction of movement of finger
    unsigned int enc_chan_b;                                    // Motor encoder channel b value. Used to test direction of movement
    unsigned long enc_start_time;                               // Value of encoder timer when previous capture event occured
    unsigned long enc_end_time;                                 // Value of encoder timer when current capture event occured
    unsigned long enc_delta_ticks;                              // Number of timer ticks between previous/current capture events (Minus overflows)
    unsigned long enc_overflow_start;                           // Value of timer overflow counter when previous capture event occured
    unsigned long enc_overflow_end;                             // Value of timer overflow counter when current capture event occured
    unsigned long enc_overflow_delta;                           // Calculated number of timer overflows between capture events
    unsigned long enc_overflow_ticks;                           // Total number of timer ticks for the timer overflows between events
    unsigned long enc_total_ticks;                              // Calculated total number of timer ticks between input capture events
    unsigned long input_sig_frequency;                          // Frequency of motor encoder signal (in Hz)
    long double input_sig_period;                               // Period of motor encoder signal (in ms)
};*/



/****************************************************************/
// Rachel's playground

extern struct finger {     // doesn't declare an object - just tells how to build one. intuition says this doesn't need to be extern. tried it that way and didn't make a difference.
    char name[STR_MAX];                                         // Name of finger
    long position_temp;                                         // Number of input capture events since last sample. Used for finger position
    long position_actual;                                       // Calculated position of finger
    unsigned int direction_actual;                              // Actual direction of motor movement as read from encoder
    unsigned int direction_desired;                             // Desired direction of movement of finger
    unsigned int enc_chan_b;                                    // Motor encoder channel b value. Used to test direction of movement
    unsigned long enc_start_time;                               // Value of encoder timer when previous capture event occured
    unsigned long enc_end_time;                                 // Value of encoder timer when current capture event occured
    unsigned long enc_delta_ticks;                              // Number of timer ticks between previous/current capture events (Minus overflows)
    unsigned long enc_overflow_start;                           // Value of timer overflow counter when previous capture event occured
    unsigned long enc_overflow_end;                             // Value of timer overflow counter when current capture event occured
    unsigned long enc_overflow_delta;                           // Calculated number of timer overflows between capture events
    unsigned long enc_overflow_ticks;                           // Total number of timer ticks for the timer overflows between events
    unsigned long enc_total_ticks;                              // Calculated total number of timer ticks between input capture events
    unsigned long input_sig_frequency;                          // Frequency of motor encoder signal (in Hz)
    long double input_sig_period;                               // Period of motor encoder signal (in ms)
};


extern struct finger fngr_pointer;
extern struct finger fngr_middle;                               // COMMENTED BY RM 12/13
extern struct finger fngr_ring;
extern struct finger fngr_pinky;
extern struct finger fngr_thumb;

/******************************************************************/


/************ Instantiate Finger Structs ***********/
/*extern struct finger fngr_pointer;
extern struct finger fngr_middle;                               // COMMENTED BY RM 12/13
extern struct finger fngr_ring;
extern struct finger fngr_pinky;
extern struct finger fngr_thumb;*/

/*************  Constants ***********/
extern const unsigned int NORMALIZATION_CONSTANT;           // "Self-explanatory" - was 4
extern const unsigned long FULLY_CONTRACTED;             // Higher bound for position
extern const long FULLY_EXTENDED;                           // Lower bound for position



/**************  Global Variables  **************/
extern long double encoder_timer_period_ms;                     // Period in ms of timers used for motor encoder input capture
extern unsigned long tim2_overflow_count;                       // Overflow counter for fingers timer (timer 2)
extern unsigned long tim3_overflow_count;                       // Overflow counter for thumb timer (timer 3)
extern unsigned int pwm_period;                                 // Base timer period of PWM - needed for duty cycle calculations
extern int INITIAL_DIRECTION;                               // ***DEBUG***



/************ Position Control Variables ***********/
extern const int position_setP;                                   // Setpoint - desired position. normalized for 0-1000 range. CHANGE TO 3000 AND TEST CONTROL FOR DEMO.
extern const int POSITION_MARGIN;                                   // Accuracy of PV - 1.5% from normalization constant
extern const float const position_K;                            // Proportion constant for P control


extern unsigned int duty_cycle;                             // Initial PWM duty cycle
extern char toStr[STR_MAX];                                     // General variable for converting numbers to strings for terminal print


/************ Force Control Variables ***********/
extern const int force_setP;                                   // Setpoint - desired position. normalized for 0-1000 range. CHANGE TO 3000 AND TEST CONTROL FOR DEMO.
extern const int FORCE_MARGIN;                                   // Accuracy of PV - 1.5% from normalization constant
extern const float const force_K;                            // Proportion constant for P control



/************ Function Prototypes ***********/
void init_input_capture();                                      // Initialization of timers 2 and 3 for input capture
void activate_input_capture();                                  // Activates input capture timers
void init_finger(struct finger *fngr);                          // Configures input capture, PWM, initial state, and pins for fingers
void sample_finger(struct finger *fngr);                        // Function to determine state of finger
void move_finger(struct finger *, unsigned int);                // Function to set new finger speed
void print_finger_info(struct finger *fngr);                    // Function to print finger state info to terminal


// RACHEL
void set_finger_name(struct finger *fngr);

/************ Force Control Function Prototypes ***********/





/************ Position Control Function Prototypes ***********/
unsigned int Pcontrol_position(struct finger *, unsigned long, unsigned long);  // Function for finger position P-control
unsigned int Pcontrol_force(struct finger *, unsigned int, unsigned int);       // Function for fingertip force P-control



/************ Interrupt Handlers ***********/
void fingers_input_capture_ISR();                               // Interrupt handler for fingers timer (timer 2)
void thumb_input_capture_ISR();                                 // Interrupt handler for thumb timer (timer 3)



#endif