_USART1_INT:
;main.c,5 :: 		void USART1_INT() iv IVT_INT_USART1 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,6 :: 		if(UART1_Data_ready()) {  // If data is received
BL	_UART1_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_USART1_INT0
;main.c,7 :: 		uart1_rd = UART1_Read();   // read the received data
BL	_UART1_Read+0
MOVW	R1, #lo_addr(_uart1_rd+0)
MOVT	R1, #hi_addr(_uart1_rd+0)
STRB	R0, [R1, #0]
;main.c,8 :: 		UART1_Write(uart1_rd);     // and send data via UART
UXTB	R0, R0
BL	_UART1_Write+0
;main.c,9 :: 		}
L_USART1_INT0:
;main.c,10 :: 		}
L_end_USART1_INT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART1_INT
_USART2_INT:
;main.c,12 :: 		void USART2_INT() iv IVT_INT_USART2 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,13 :: 		if (UART2_Data_Ready()) {     // If data is received
BL	_UART2_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_USART2_INT1
;main.c,14 :: 		uart2_rd = UART2_Read();     // read the received data
BL	_UART2_Read+0
MOVW	R1, #lo_addr(_uart2_rd+0)
MOVT	R1, #hi_addr(_uart2_rd+0)
STRB	R0, [R1, #0]
;main.c,15 :: 		UART2_Write(uart2_rd);       // and send data via UART
UXTB	R0, R0
BL	_UART2_Write+0
;main.c,16 :: 		}
L_USART2_INT1:
;main.c,17 :: 		}
L_end_USART2_INT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART2_INT
_main:
;main.c,20 :: 		void main() {
;main.c,22 :: 		UART1_Init(115200);              // Initialize UART module at 115200 bps
MOV	R0, #115200
BL	_UART1_Init+0
;main.c,23 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;main.c,25 :: 		UART1_Write_Text("Start FTDI Wired");
MOVW	R0, #lo_addr(?lstr1_main+0)
MOVT	R0, #hi_addr(?lstr1_main+0)
BL	_UART1_Write_Text+0
;main.c,26 :: 		UART1_Write(13);
MOVS	R0, #13
BL	_UART1_Write+0
;main.c,27 :: 		UART1_Write(10);
MOVS	R0, #10
BL	_UART1_Write+0
;main.c,31 :: 		UART2_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PD56);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART2_PD56+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART2_PD56+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOV	R0, #115200
BL	_UART2_Init_Advanced+0
ADD	SP, SP, #4
;main.c,32 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;main.c,34 :: 		UART2_Write_Text("Start Bluetooth");
MOVW	R0, #lo_addr(?lstr2_main+0)
MOVT	R0, #hi_addr(?lstr2_main+0)
BL	_UART2_Write_Text+0
;main.c,35 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;main.c,36 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;main.c,37 :: 		NVIC_IntEnable(IVT_INT_USART1);
MOVW	R0, #53
BL	_NVIC_IntEnable+0
;main.c,38 :: 		NVIC_IntEnable(IVT_INT_USART2);
MOVW	R0, #54
BL	_NVIC_IntEnable+0
;main.c,39 :: 		SYSCFGEN_bit = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R2, [R0, #0]
;main.c,40 :: 		SYSCFG_EXTICR1=0b0010001000000000;
MOVW	R1, #8704
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;main.c,41 :: 		EXTI_IMR = EXTI_IMR | 0b1100;
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;main.c,42 :: 		EXTI_RTSR =  0b0;
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;main.c,43 :: 		EXTI_FTSR = EXTI_RTSR | 0b1100;
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;main.c,45 :: 		RXNEIE_USART1_CR1_bit =1;
MOVW	R0, #lo_addr(RXNEIE_USART1_CR1_bit+0)
MOVT	R0, #hi_addr(RXNEIE_USART1_CR1_bit+0)
STR	R2, [R0, #0]
;main.c,46 :: 		RXNEIE_USART2_CR1_bit =1;
MOVW	R0, #lo_addr(RXNEIE_USART2_CR1_bit+0)
MOVT	R0, #hi_addr(RXNEIE_USART2_CR1_bit+0)
STR	R2, [R0, #0]
;main.c,47 :: 		TCIE_bit = 1;
MOVW	R0, #lo_addr(TCIE_bit+0)
MOVT	R0, #hi_addr(TCIE_bit+0)
STR	R2, [R0, #0]
;main.c,48 :: 		TXEIE_bit = 1;
MOVW	R0, #lo_addr(TXEIE_bit+0)
MOVT	R0, #hi_addr(TXEIE_bit+0)
STR	R2, [R0, #0]
;main.c,50 :: 		while (1) {                     // Endless loop
L_main6:
;main.c,53 :: 		}
IT	AL
BAL	L_main6
;main.c,54 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
