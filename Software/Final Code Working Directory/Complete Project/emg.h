#ifndef EMG_H
#define EMG_H

#include <defines.h>

/*
Prosthetic Hand Senior Design Project
12/3/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File name:
    emg.h

 * Description:
    Header file for EMG related variables and functions 
*/



// Define thresholds mode 0 (Waiting for EMG activation)
#define high_level        400		// Upper threshold for analog watchdog in initial state (waiting for low->high transition)
#define low_level         0			// Lower threshold for analog watchdog in initial state (waiting for low->high transition)

// Define thresholds mode 1 (EMG activated, currently timing)
#define high_level2       4095		// Upper (unreachable) threshold for analog watchdog in armed state (waiting for high->low transition)
#define low_level2        400		// Lower threshold for analog watchdog in armed state (waiting for high->low transition)  (same as high threshold in initial state)



/* --------------------------- Function Prototypes ---------------------------- */
void init_emg();					// Initialize Electromyography
void AWD_ISR();               		// ADC interrupt handler
void emg_override_ISR();			// EMG Override button interrupt handler 
void init_emg_timer();            	// Timer 11 init
void emg_timer_ISR();      			// Timer 11 interrupt handler
unsigned long read_emg();			// Samples and returns current EMG value 



/* --------------------------- Variables ---------------------------- */
int system_go = 0;			  // Flag to start hand operation 
int go_status = 0;			  // Current operating status of hand (active or inactive)



/* --------------------------- Constants ---------------------------- */
unsigned int EMG_TIMER_PSC = 7874				// Prescaler value for EMG timer 10 (3s)
unsigned int EMG_TIMER_RELOAD = 63999			// Auto reload value for EMG timer 10 (3s)







