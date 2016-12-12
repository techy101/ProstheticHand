#ifndef UART_H
#define UART_H

#include "defines.h"

/*
Prosthetic Hand Senior Design Project
12/12/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File name:
    uart.h

 * Description:
    * Header file for UART related functions and interrupts.
	* Utilizes MikroC UART library.
	* All UART write functions go to both Bluetooth and Wired connections.
	* Everything is duplicated for wired connection during development and BT in final design.
	* UART is for debug purposes only, and will have no real function in final use case.
	* Both are configured for RS232 communication with baud rate of 115200
	* UART interrupt handlers execute full read. Stopping main code execution is not a problem
	  because any recieved command is going to cause the hand to execute a new command anyway.
	* Assumes only one method used at a time for Rx (Wired OR Bluetooth)
*/




/************ Function Prototypes ***********/
void init_UART();                                       // Initialization of UART for terminal communication


//======================== FOR LATER IMPLEMENTATION ======================
/************ Function Prototypes ***********/
/*void initialize_uart_interrupts();			//Initialize UART1 and UART2 recieve interrupts
void USART1_INT();					//Wired UART1 interrupt handler (Can we change this name?)
void USART2_INT();					//Bluetooth UART2 interrupt handler (can we change this name?)
void serial_write(int, *char[], int);			//??????? Function to write text or data to BOTH UARTs (Text/Data Flag, Text Char array, Data as int)
char parse_incoming_text(*char);			//??????? Function to parse recieved text for use in main code*/


/************ Variables ***********/
//static char uartRead;					//Storage of incoming text

#endif
