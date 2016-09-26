_EnableInt:
;Ext_Int_Direction_And_Enable.c,10 :: 		void EnableInt() iv IVT_INT_EXTI0 ics ICS_AUTO {
;Ext_Int_Direction_And_Enable.c,11 :: 		EXTI_PR.B10 = 1;                     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,12 :: 		GPIOE_ODR.B9 = ~GPIOE_ODR.B9;      // Toggle Enable(Pin)
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,13 :: 		}
L_end_EnableInt:
BX	LR
; end of _EnableInt
_DirectionInt2:
;Ext_Int_Direction_And_Enable.c,15 :: 		void DirectionInt2() iv IVT_INT_EXTI1 ics ICS_AUTO {
;Ext_Int_Direction_And_Enable.c,16 :: 		EXTI_PR.B11 = 1;                     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,17 :: 		GPIOE_ODR.B10 = ~GPIOE_ODR.B10;    // Toggle Direction(Pin)
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,18 :: 		}
L_end_DirectionInt2:
BX	LR
; end of _DirectionInt2
_main:
;Ext_Int_Direction_And_Enable.c,20 :: 		void main() {
;Ext_Int_Direction_And_Enable.c,21 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9 | _GPIO_PINMASK_10);  // Enable digital output on PE9 and PE10
MOVW	R1, #1536
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Ext_Int_Direction_And_Enable.c,22 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);  // Enable digital input through buttons D9 and D10
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;Ext_Int_Direction_And_Enable.c,23 :: 		GPIOE_ODR.B9 = 0;               // Enable motor
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,24 :: 		GPIOE_ODR.B10 = 0;             // Start direction clockwise, ha
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,26 :: 		SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,27 :: 		SYSCFG_EXTICR1 = 0x00000033;         // Map external interrupt on PD0 and PD1         **Changed to 3300 from 0300 to (Ref Man p.294)
MOVS	R1, #51
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,28 :: 		EXTI_RTSR = 0x00000003;              // Set interrupt on Rising edge (PD10 and PD11)
MOVS	R1, #3
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,29 :: 		EXTI_FTSR = 0x00000000;              // Set Interrupt on Falling edge (none)
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,30 :: 		EXTI_IMR |= 0x00000003;              // Unmask bits 10 and 11 to interrupt on those lines
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;Ext_Int_Direction_And_Enable.c,31 :: 		NVIC_IntEnable(IVT_INT_EXTI0);      //Enable external interrupt for direction pin
MOVW	R0, #22
BL	_NVIC_IntEnable+0
;Ext_Int_Direction_And_Enable.c,32 :: 		NVIC_IntEnable(IVT_INT_EXTI1);      //Enable external interrupt for direction pin
MOVW	R0, #23
BL	_NVIC_IntEnable+0
;Ext_Int_Direction_And_Enable.c,35 :: 		while(1)
L_main0:
;Ext_Int_Direction_And_Enable.c,36 :: 		;
IT	AL
BAL	L_main0
;Ext_Int_Direction_And_Enable.c,37 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
