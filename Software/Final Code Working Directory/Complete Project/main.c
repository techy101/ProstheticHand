/*
Prosthetic Hand Senior Design Project
9/25/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * Project name:
    Prosthetic Hand

 * Description:
    Main code for the prosthetic hand project 

 * Includes Needed:
	#Defines.h		Redefines pin names for readability 
	#globals.h 		All global variables
	#emg.h			Includes functions for analog EMG functions
	#finger.h		All functions releated to the finger struct 
	#usart.h		All UART related functions 
	#user_io.h 		All external interface functions other than EMG 
 

 * Pin Configuration
    PE14: All Motor Driver IC's Enable
    PE15: Motor 1 Direction Output
    PE9: Motor 1 PWM Output
    D0 Button: Motor Enable Toggle Button
    D1 Button: Motor 1 Direction Toggle Button

 * NOTES:
     Motor Direction:
        0: Clockwise
        1: Counter Clockwise

*/

/* General Software Flow:

	*Hand stays in standby/stop mode with MCU and other chips shut down until EMG event 
	
	*EMG event seen by analog watchdog triggers ADC interrupt
		*ADC interrupt redefines AWD guarded window, sets state value, and enabled main execution timer interrupt
		*If ADC interrupts again before main execution timer interrupt:
			-AWD window is reset to standby range
			-Main execution timer interrupt is disabled
			-System is put back to sleep 
		*If main execution timer interrupts prior to second ADC interrupt the main code is executed
		
	*Main code activates hand and begins finger movement in position control for all fingers
		*Depending on mode (set by user buttons) the fingers will each attempt to reach their destination location
		*Fingers will track position using motor encoders (and possibly polling) via timer/counter 
		*Finger analog inputs will be polled during movement to check for applied forces (finger touching something)
		*If force is detected, that finger switches into force control mode
		*Fingers will each attempt to exert a pre-determined amount of force on object 
		*If force is not detedted fingers will stop upon reaching final location 
		*Upon all fingers stopping, MCU will switch to a slow verification poll 
			-Every ____?ms MCU will poll position and force for each finger
			-If a change has been detected, finger will activate again to compensate for change
			-MCU will then go back to sleep and re-start verification poll 		
		
	*Possible events while hand is activated:
		*Main execution timer interrupt occurs
			-Fingers will each reverse and return to home position (detected by limit switch and/or location counter)
			-Hand will return to standby/sleep mode, awaiting another execution 
		
		*User mode button is pressed 
			-Fingers will each reverse and return to home position (detected by limit switch and/or counter)
			-Upon all fingers reaching home, they will all re-enter main code loop for new mode/position 
			
		*Force control knob is turned
			-Value of force knob is detected during verification poll 
			-Change in value will be seen as finger force not correct anymore 
			-Fingers will activate as defined in standard verification poll mode 
			
		*UART message recieved 
			-MCU will stop whatever it's doing and process the recieved command 
			-Upon processing completion, hand will immediatly execute the command 
			-All previous states will be forgotten 
			-If needed, hand will return to home and then execute new command 

*/
#include <defines.h> 					//Maybe not needed since in all headers??
#include <globals.h>					//Maybe not needed since in all headers??
#include <emg.h> 
#include <finger.h> 
#include <usart.h> 
#include <user_io.h> 










void main() {
	
	//Create struct instances 
	
	
	//Initialize all hardware 
	
	
	while(1) {
		//Main Infinite Loop 
	}
	

return 0;
}