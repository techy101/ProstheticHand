#ifndef GLOBALS_H
#define GLOBALS_H

//Global variables here



//Finger global constants
extern const unsigned int directionOpen = 0;			//Finger direction of movement opening 
extern const unsigned int directionClose = 1;			//Finger direction of movement closing 
extern const unsigned int pwmFrequency = 100;			//PWM Generation frequency in Hz (100Hz)
extern const unsigned int pwmInitialDuty = 0;			//Initial duty cycle used for motor speed at boot 
extern const unsigned int fingerHomeLocation = 0;		//Home location for fingers defined as 0


//Control variables 
//???These two may be merged???
extern unsigned int analogPollingRate;					//The global polling rate for all analog sensors 
extern unsigned int encoderPollingRate;					//The global polling rate for reading all encoders 

extern unsigned int maxPositionValue;					//The overflow value of the position counters 