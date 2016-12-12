#ifndef EMG_H
#define EMG_H

#include "defines.h"

/*
Prosthetic Hand Senior Design Project
12/12/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File name:
    emg.h

 * Description:
    Header file for EMG related variables and functions
*/




/************ Threshold Definitions ***********/
#define high_level                                400                    // Analog Watchdog High Threshold level for initial state
#define low_level                                 0                      // Analog Watchdog Low Threshold level for initial state
#define high_level2                               4095                   // Analog Watchdog High Threshold level for armed state
#define low_level2                                400                    // Analog Watchdog Low Threshold level for armed state


/* --------------------------- Constants ---------------------------- */
extern const unsigned int EMG_TIMER_PSC;                                 // Prescaler value for EMG timer (Timer 5) (3s)
extern const unsigned int EMG_TIMER_RELOAD;                         // Auto reload value for EMG timer (Timer 5) (3s)


/* ---------------------- Function Prototypes ----------------------- */
void init_emg();                                                         // Initialize EMG functions (AWD, Timer, Override)


/* ---------------------- Interrupt Handlers ------------------------ */
void emg_timer_ISR();                                                    // EMG Timer (Timer 5) interrupt handler
void AWD_ISR();                                                          // Analog Watchdog interrupt handler
void emg_override_ISR();                                                 // EMG Override button interrupt handler

#endif