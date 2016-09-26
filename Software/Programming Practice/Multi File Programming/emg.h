#ifndef EMG_H
#define EMB_H
/*
Prosthetic Hand Senior Design Project
9/25/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File name:
    emg.h

 * Description:
    Header file for EMG related variables and functions 
*/

#include <built_in.h>						//?????  Unsure if this is needed ?????
#include <defines.h>
#include <globals.h>

#define AWD_INITIAL_LOW_THRESH		400			//Const  - Lower threshold for analog watchdog in initial state (waiting for low->high transition)
#define AWD_INITIAL_HIGH_THRESH		3695		//Const  - Upper threshold for analog watchdog in initial state (waiting for low->high transition)
#define AWD_ARMED_LOW_THRESH		3695		//Const  - Lower threshold for analog watchdog in armed state (waiting for high->low transition)  (same as high threshold in initial state)
#define AWD_ARMED_HIGH_THRESH		1000000		//Const  - Upper (unreachable) threshold for analog watchdog in armed state (waiting for high->low transition)


//Variables



/************************  EMG Function Prototypes  ************************/
void initialize_emg();						//Initialization of analog watchdog and other EMG items 
void ADC_AWD();								//Analog Watchdog interrupt handler   (???Can we re-name this???)
void set_initial_awd_window();				//Sets the AWD window to the initial state (waiting for low->high transition)
void set_armed_awd_window();				//Sets the AWD window to the armed state (waiting for the high->low transition) 
unsigned long get_current_emg_value();		//Samples the EMG signal and returns the current value 


