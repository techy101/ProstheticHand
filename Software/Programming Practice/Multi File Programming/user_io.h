#ifndef USER_IO_H
#define USER_IO_H

#include <defines.h>
#include <globals.h>

//Header file for user interface buttons and LED's


/*	Functions Needed:
		* Mode buttons interrupt initialization 
		* Mode buttons interrrupt handler (Use grouped EINT's for these, so need to determine which pin it came in on)
		* Manual Run override button interrupt initialization and handlers
		* User mode LED initializations
		* Power level LED initialization 
		