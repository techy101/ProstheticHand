#ifndef USART_H
#define USART_H

/*
Prosthetic Hand Senior Design Project
9/25/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File name:
    usart.h

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

#include <defines.h>
#include <globals.h>


#define UART_GLOBAL_BAUD_RATE		115200			//Baud rate used for all UART communications 




/* Functions needed
	* Initialize UART1 Wired & interrupt 
	* Initialize UART2 Bluetooth & interrupt
	* UART1 Wired Interrupt Handler
	* UART2 Bluetooth Interrupt Handler
	* Write input out to BOTH UART's
	* Parse/decompose/read strings brought in from the interrupt string parser
	
*/

//Variables
char uartRead;										//Storage of incoming text 



void initialize_uart1_wired();						//Initialize UART1, which is used for the wired FTDI UART interface 
void initialize_uart2_bt();							//Initialize UART2, which is used for the wireless Bluetooth UART interface 
void USART1_INT();									//Wired UART1 interrupt handler (Can we change this name?)
void USART2_INT();									//Bluetooth UART2 interrupt handler (can we change this name?)
void serial_write(int, *char[], int);				//??????? Function to write text or data to BOTH UARTs (Text/Data Flag, Text Char array, Data as int) 
void parse_command(*char);							//??????? Function to parse recieved text for use in main code 






	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


