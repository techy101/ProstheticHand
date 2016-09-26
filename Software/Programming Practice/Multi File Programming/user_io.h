#ifndef USER_IO_H
#define USER_IO_H
/*
Prosthetic Hand Senior Design Project
9/25/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File name:
    user_io.h

 * Description:
    * Header file for user interface hardware 
	* Sets up external interrupts for user buttons 
	* Sets up LED's for user feedback 
*/


#include <defines.h>
#include <globals.h>

//Header file for user interface buttons and LED's


/*	Functions Needed:
		* Mode buttons interrupt initialization 
		* Mode buttons interrrupt handler (Use grouped EINT's for these, so need to determine which pin it came in on)
		* Manual Run override button interrupt initialization and handlers
		* User mode LED initializations
		* Power level LED initialization 
		