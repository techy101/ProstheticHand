_init_UART:
;uart.c,37 :: 		void init_UART() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uart.c,39 :: 		UART1_Init(UART_BAUD_RATE);                                                 // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;uart.c,40 :: 		Delay_ms(200);                                                              // Wait for UART to stabilize
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_init_UART0:
SUBS	R7, R7, #1
BNE	L_init_UART0
NOP
NOP
NOP
;uart.c,41 :: 		UART_Write_Text("\rUART Init Complete\r\n");                                // *** DEBUG *** Print test statement to terminal
MOVW	R0, #lo_addr(?lstr1_uart+0)
MOVT	R0, #hi_addr(?lstr1_uart+0)
BL	_UART_Write_Text+0
;uart.c,44 :: 		UART2_Init_Advanced(UART_BAUD_RATE, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PD56);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART2_PD56+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART2_PD56+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOV	R0, #115200
BL	_UART2_Init_Advanced+0
ADD	SP, SP, #4
;uart.c,45 :: 		Delay_ms(100);                  						// Wait for UART module to stabilize
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_init_UART2:
SUBS	R7, R7, #1
BNE	L_init_UART2
NOP
NOP
NOP
;uart.c,46 :: 		UART2_Write_Text("Bluetooth UART Started\r\n");				// Write verification message to terminal
MOVW	R0, #lo_addr(?lstr2_uart+0)
MOVT	R0, #hi_addr(?lstr2_uart+0)
BL	_UART2_Write_Text+0
;uart.c,47 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
