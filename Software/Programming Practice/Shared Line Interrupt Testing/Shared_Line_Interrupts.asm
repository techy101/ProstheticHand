_interrupt_init:
;Shared_Line_Interrupts.c,11 :: 		void interrupt_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Shared_Line_Interrupts.c,12 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_11 | _GPIO_PINMASK_12 | _GPIO_PINMASK_13);  // Enable digital input using buttons D10-13
MOVW	R1, #15360
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;Shared_Line_Interrupts.c,14 :: 		SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,15 :: 		SYSCFG_EXTICR3 = 0x00003300;         // Map external interrupts for PORTD on lines 10 and 11        **Changed to 3300 from 0300 to (Ref Man p.294)
MOVW	R1, #13056
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,16 :: 		SYSCFG_EXTICR4 = 0x00003333;         // Map external interrupts for PORTD on lines 12-15
MOVW	R1, #13107
MOVW	R0, #lo_addr(SYSCFG_EXTICR4+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR4+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,17 :: 		EXTI_RTSR = 0x0000FC00;              // Set interrupt on Rising edge for lines 10-15
MOVW	R1, #64512
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,18 :: 		EXTI_FTSR = 0x00000000;              // Set Interrupt on Falling edge (none)
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,19 :: 		EXTI_IMR |= 0x0000FC00;              // Unmask bits 10-15 to interrupt on those lines
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64512
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,20 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);      //Enable external interrupt for pins 10-15
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;Shared_Line_Interrupts.c,21 :: 		}
L_end_interrupt_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interrupt_init
_ExtInt:
;Shared_Line_Interrupts.c,23 :: 		void ExtInt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
;Shared_Line_Interrupts.c,24 :: 		if(EXTI_PR.B10 != 0)
MOVW	R1, #lo_addr(EXTI_PR+0)
MOVT	R1, #hi_addr(EXTI_PR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ExtInt0
;Shared_Line_Interrupts.c,26 :: 		GPIOE_ODR.B10 = ~GPIOE_IDR.B10;       // Toggle the corresponding LED on PORTE
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,27 :: 		EXTI_PR.B10 = 1;     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,28 :: 		}
L_ExtInt0:
;Shared_Line_Interrupts.c,29 :: 		if(EXTI_PR.B11 != 0)
MOVW	R1, #lo_addr(EXTI_PR+0)
MOVT	R1, #hi_addr(EXTI_PR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ExtInt1
;Shared_Line_Interrupts.c,31 :: 		GPIOE_ODR.B11 = ~GPIOE_IDR.B11;       // Toggle the corresponding LED on PORTE
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,32 :: 		EXTI_PR.B11 = 1;     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,33 :: 		}
L_ExtInt1:
;Shared_Line_Interrupts.c,34 :: 		if(EXTI_PR.B12 != 0)
MOVW	R1, #lo_addr(EXTI_PR+0)
MOVT	R1, #hi_addr(EXTI_PR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ExtInt2
;Shared_Line_Interrupts.c,36 :: 		GPIOE_ODR.B12 = ~GPIOE_IDR.B12;       // Toggle the corresponding LED on PORTE
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,37 :: 		EXTI_PR.B12 = 1;     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,38 :: 		}
L_ExtInt2:
;Shared_Line_Interrupts.c,39 :: 		if(EXTI_PR.B13 != 0)
MOVW	R1, #lo_addr(EXTI_PR+0)
MOVT	R1, #hi_addr(EXTI_PR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ExtInt3
;Shared_Line_Interrupts.c,41 :: 		GPIOE_ODR.B13 = ~GPIOE_IDR.B13;       // Toggle the corresponding LED on PORTE
MOVW	R1, #lo_addr(GPIOE_IDR+0)
MOVT	R1, #hi_addr(GPIOE_IDR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,42 :: 		EXTI_PR.B13 = 1;     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,43 :: 		}
L_ExtInt3:
;Shared_Line_Interrupts.c,44 :: 		}
L_end_ExtInt:
BX	LR
; end of _ExtInt
_main:
;Shared_Line_Interrupts.c,46 :: 		void main() {
;Shared_Line_Interrupts.c,48 :: 		interrupt_init();
BL	_interrupt_init+0
;Shared_Line_Interrupts.c,50 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);  // Enable digital output on PORTE (LEDs)
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Shared_Line_Interrupts.c,51 :: 		GPIOE_ODR = 0x0000;  // LEDs start off or on?
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Shared_Line_Interrupts.c,53 :: 		while(1)
L_main4:
;Shared_Line_Interrupts.c,54 :: 		;
IT	AL
BAL	L_main4
;Shared_Line_Interrupts.c,55 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
