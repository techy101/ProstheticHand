_Timer2_interrupt:
;Timer2 Interrupt.c,26 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
;Timer2 Interrupt.c,27 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,28 :: 		GPIOE_ODR = ~GPIOE_ODR;      // Toggle PORTE led's
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,29 :: 		}
L_end_Timer2_interrupt:
BX	LR
; end of _Timer2_interrupt
_main:
;Timer2 Interrupt.c,40 :: 		void main() {
;Timer2 Interrupt.c,41 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);  // Enable digital output on PORTE
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Timer2 Interrupt.c,42 :: 		GPIOE_ODR = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,44 :: 		RCC_APB1ENR.TIM2EN = 1;       // Enable clock gating for timer module 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,45 :: 		TIM2_CR1.CEN = 0;             // Disable timer
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,46 :: 		TIM2_PSC = 2563;              // Set timer prescaler.
MOVW	R1, #2563
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,47 :: 		TIM2_ARR = 65522;
MOVW	R1, #65522
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,48 :: 		NVIC_IntEnable(IVT_INT_TIM2); // Enable timer interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Timer2 Interrupt.c,49 :: 		TIM2_DIER.UIE = 1;            // Update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,50 :: 		TIM2_CR1.CEN = 1;             // Enable timer
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,52 :: 		while(1)  ;
L_main0:
IT	AL
BAL	L_main0
;Timer2 Interrupt.c,53 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
