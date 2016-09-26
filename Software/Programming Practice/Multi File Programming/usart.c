/*
Prosthetic Hand Senior Design Project
9/25/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File name:
    usart.c

 * Description:
    All functions and interrupt handlers related to UART communications

*/


#include <usart.h>

//Functions

/*****************  UART 1 (Wired) Initialization  ******************
/																	/
/	Function Name: initialize_uart1_wired()							/
/	Return Type: None												/
/																	/
/	Arguments: None												   	/
/																	/
/	Description: 													/
/		This function performs initialization of UART 1 which is    /
/		used for wired FTDI adapter serial communication 			/
/																	/
/	Preconditions: 													/
/		None														/
/																	/
/	Postconditions: 												/
/		Wired serial communication via UART1 is configured and test	/
/		message is sent to the terminal.							/
/																	/
/*******************************************************************/
void initialize_uart1_wired() {											// Initialize UART1, with MikroC library function 
	UART1_Init(UART_GLOBAL_BAUD_RATE);              					// Initialize UART1 (wired) at global baud rate (defined in usart.h)
	Delay_ms(100);                 										// Wait for UART module to stabilize

	UART1_Write_Text("Wired UART Started");								// Write verification message to terminal 
	UART1_Write(13);
	UART1_Write(10);
}




/***************  UART 2 (Bluetooth) Initialization  ****************
/																	/
/	Function Name: initialize_uart2_bt()							/
/	Return Type: None												/
/																	/
/	Arguments: None													/
/																	/
/	Description: 													/
/		This function performs initialization of UART 2 which is    /
/		used for Bluetooth serial communication 					/
/																	/
/	Preconditions: 													/
/		None														/
/																	/
/	Postconditions: 												/
/		Bluetooth serial communication via UART1 is configured and 	/
/		test message is sent to the terminal.						/
/																	/
/*******************************************************************/
void initialize_uart2_bt() {											//Initialize UART2, which is used for the wireless Bluetooth UART interface 
	//Initialize UART2 with MikroC library functions (advanced setup)
	UART2_Init_Advanced(UART_GLOBAL_BAUD_RATE, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PD56);
	Delay_ms(100);                  									// Wait for UART module to stabilize

	UART2_Write_Text("Bluetooth UART Started");							// Write verification message to terminal 
	UART2_Write(13);
	UART2_Write(10);
}






/******************  Initialize UART Interrupts  ********************
/																	/
/	Function Name: initialize_uart_interrupts()						/
/	Return Type: None 												/
/																	/
/	Description: 													/
/		This function initializes interrupts for recieved messages	/
/		on UART1 AND UART2. 										/
/																	/
/	Preconditions: 													/
/		UART1 and UART2 have been initialized 						/
/																	/
/	Postconditions: 												/
/		Interrupts for UART1 (Wired) and UART2 (Bluetooth) have 	/
/		been configured. These are combined because registers are 	/
/		hard-coded to set up both at once.							/
/																	/
/*******************************************************************/
void initialize_uart_interrupts() {										//Initialize UART1 and UART2 recieve interrupts 
	NVIC_IntEnable(IVT_INT_USART1);										//*****ADD COMMENTS FOR WHAT THESE LINES DO LATER*****
	NVIC_IntEnable(IVT_INT_USART2);
	SYSCFGEN_bit = 1;
	SYSCFG_EXTICR1=0b0010001000000000;
	EXTI_IMR = EXTI_IMR | 0b1100;
	EXTI_RTSR =  0b0;
	EXTI_FTSR = EXTI_RTSR | 0b1100;
	RXNEIE_USART1_CR1_bit =1;
	RXNEIE_USART2_CR1_bit =1;
	TCIE_bit = 1;
	TXEIE_bit = 1;
}





/***************  UART 1 (Wired) Interrupt Handler  *****************
/																	/
/	Function Name: USART1_INT()										/
/	Interrupt Handler												/
/																	/
/	Description: 													/
/		This function handles code to execute when wired serial     /
/		data is recieved via UART1									/
/																	/
/	Preconditions: 													/
/		UART1 has been initialized									/
/																	/
/	Postconditions: 												/
/		Text in UART1 buffer has been read in and parsed for use 	/
/																	/
/*******************************************************************/
void USART1_INT() iv IVT_INT_USART1 ics ICS_AUTO {						//Wired UART1 interrupt handler (can we change this name?)
	if (UART1_Data_Ready()) {     										// Check if there is remaining data in the rx buffer 
        uartRead = UART1_Read();     									// Read the received data	
}






/*************  UART 2 (Bluetooth) Interrupt Handler  ***************
/																	/
/	Function Name: USART2_INT()										/
/	Interrupt Handler												/
/																	/
/	Description: 													/
/		This function handles code to execute when Bluetooth serial /
/		data is recieved via UART2									/
/																	/
/	Preconditions: 													/
/		UART2 has been initialized									/
/																	/
/	Postconditions: 												/
/		Text in UART2 buffer has been read in and parsed for use 	/
/																	/
/*******************************************************************/
void void USART2_INT() iv IVT_INT_USART2 ics ICS_AUTO {					//Bluetooth UART2 interrupt handler (can we change this name?)
	if (UART2_Data_Ready()) {     										// Check if there is remaining data in the rx buffer 
		uartRead = UART2_Read();     									// Read the received data	
}







/******************  Write Text To Serial Port  *********************
/																	/
/	Function Name: serial_write()									/
/	Return Type: None												/
/																	/
/	Arguments: (int data type flag, *char[] text data, int # data)  /
/																	/
/	Description: 													/
/		This function takes input data and writes it out to the 	/
/		both serial ports (Wired and Bluetooth) concurrently. 		/
/		The data can be either text or numerical, however each uses	/
/		a different MikroC library write function, so first 		/
/		argument (data type flag) is used to determine which write  /
/		function to use (UARTx_Write() or UARTx_Write_Text()) and 	/
/		which data argument to use. 								/
/																	/
/	Preconditions: 													/
/		UART1 and UART2 have both been initialized 					/
/		Data type flag is passed in and unused argument is passed   /
/		something as an unused place holder							/
/																	/
/	Postconditions: 												/
/		Text or data has been sent to BOTH UART ports 				/
/																	/
/*******************************************************************/
void serial_write(int, *char[], int) {									//??????? Function to write text or data to BOTH UARTs (Text/Data Flag, Text Char array, Data as int) 
	//Determine what type of data is to be written 
	//Call appropriate library uart_write function for data type 
}








/*******************  Parse Incoming Message  ***********************
/																	/
/	Function Name: serial_write()									/
/	Return Type: None				 								/
/																	/
/	Arguments: (*char text read in by UART ISR)						/
/																	/
/	Description: 													/
/		This function parses the text string that was sent through  /
/		the UART connection. It writes text and numerical data to   /
/		to appropriate global variables for use.					/
/																	/
/	Preconditions: 													/
/		Data has been read in via one of the UART interrupt 		/
/		handlers and this character array is passed into the 		/
/		function. 													/
/																	/
/	Postconditions: 												/
/		Text from serial port has been parsed and values have been  /
/		stored in the appropriate global variables 					/
/																	/
/*******************************************************************/
char parse_incoming_text(*char) {										//Parse recieved text for use in main code 
	//Take incoming text string and break it up into data types
	//Store values for each data type in the appropriate global variable 
}


























