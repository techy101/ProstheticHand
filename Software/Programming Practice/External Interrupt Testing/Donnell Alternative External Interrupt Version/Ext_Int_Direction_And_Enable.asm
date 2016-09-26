_DirectionInt2:
;Ext_Int_Direction_And_Enable.c,10 :: 		void DirectionInt2() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
;Ext_Int_Direction_And_Enable.c,11 :: 		if((EXTI_PR & 0x00000800) != 0) {                          //CHECKING PE11
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #2048
CMP	R0, #0
IT	EQ
BEQ	L_DirectionInt20
;Ext_Int_Direction_And_Enable.c,12 :: 		EXTI_PR.B11 = 1;                     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,13 :: 		GPIOE_ODR.B10 = ~GPIOE_ODR.B10;    // Toggle Direction(Pin)
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,14 :: 		}
L_DirectionInt20:
;Ext_Int_Direction_And_Enable.c,16 :: 		if((EXTI_PR & 0x00001000) != 0){            //CHECKING PE12
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #4096
CMP	R0, #0
IT	EQ
BEQ	L_DirectionInt21
;Ext_Int_Direction_And_Enable.c,17 :: 		EXTI_PR.B11 = 1;                     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,18 :: 		GPIOE_ODR.B10 = ~GPIOE_ODR.B10;    // Toggle Direction(Pin)
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,19 :: 		}
L_DirectionInt21:
;Ext_Int_Direction_And_Enable.c,20 :: 		}
L_end_DirectionInt2:
BX	LR
; end of _DirectionInt2
_main:
;Ext_Int_Direction_And_Enable.c,23 :: 		void main() {
;Ext_Int_Direction_And_Enable.c,24 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9 | _GPIO_PINMASK_10);  // Enable digital output on PE9 and PE10
MOVW	R1, #1536
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Ext_Int_Direction_And_Enable.c,25 :: 		GPIO_Digital_Input(&GPIOE_BASE, _GPIO_PINMASK_11 | _GPIO_PINMASK_12);  // Enable digital input through buttons D9 and D10
MOVW	R1, #6144
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Input+0
;Ext_Int_Direction_And_Enable.c,26 :: 		GPIOE_ODR.B9 = 0;               // Enable motor
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,27 :: 		GPIOE_ODR.B10 = 0;             // Start direction clockwise, ha
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,29 :: 		SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,30 :: 		SYSCFG_EXTICR3 = 0x00000300;         // Map external interrupt on PD10 and PD11
MOVW	R1, #768
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,32 :: 		EXTI_RTSR = 0x00000C00;              // Set interrupt on Rising edge (PD10 and PD11)
MOVW	R1, #3072
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,33 :: 		EXTI_FTSR = 0x00000000;              // Set Interrupt on Falling edge (none)
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,34 :: 		EXTI_IMR |= 0x00000C00;              // Unmask bits 10 and 11 to interrupt on those lines
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3072
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,35 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);   // Enable External interrupt
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;Ext_Int_Direction_And_Enable.c,37 :: 		while(1)
L_main2:
;Ext_Int_Direction_And_Enable.c,38 :: 		;
IT	AL
BAL	L_main2
;Ext_Int_Direction_And_Enable.c,39 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
