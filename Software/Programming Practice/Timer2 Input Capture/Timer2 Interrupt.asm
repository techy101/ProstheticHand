_init_tim2_input_capture:
;Timer2 Interrupt.c,34 :: 		void init_tim2_input_capture() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Timer2 Interrupt.c,35 :: 		RCC_APB1ENR.TIM2EN = 1;           //Enable clock gating for timer module 2
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R3, [R0, #0]
;Timer2 Interrupt.c,36 :: 		TIM2_CR1.CEN = 0;                 //Disable timer/counter
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;Timer2 Interrupt.c,37 :: 		TIM2_PSC = 2563;                  //Set timer 2 prescaler (need to determine value)
MOVW	R1, #2563
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,38 :: 		TIM2_ARR = 65522;                 //Set timer 2 overflow value at max
MOVW	R1, #65522
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,39 :: 		TIM2_CR1.B4 = 0;                  //Set counter direction as upcounting  (DIR Bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;Timer2 Interrupt.c,40 :: 		TIM2_CR1.B8 = 0;                  //Set counter to have no clock divider    (CKD Bits)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;Timer2 Interrupt.c,41 :: 		TIM2_CR1.B9 = 0;                         //second bit of this
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;Timer2 Interrupt.c,42 :: 		TIM2_CCMR1_Input.B1 = 0;           //Set capture channel 1 as input   (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;Timer2 Interrupt.c,43 :: 		TIM2_CCMR1_Input.B0 = 1;                 //Second bit of this
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R3, [R0, #0]
;Timer2 Interrupt.c,44 :: 		TIM2_CCER.CC1P = 1;               //Set capture on rising edge event
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R3, [R0, #0]
;Timer2 Interrupt.c,45 :: 		TIM2_CCER.CC1E = 1;               //Enable capture on channel 1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R3, [R0, #0]
;Timer2 Interrupt.c,46 :: 		TIM2_CCMR1_Input.B3 = 0;          //Disable Capture 1 input prescaler    (IC2PSC = 0)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;Timer2 Interrupt.c,47 :: 		TIM2_CCMR1_Input.B2 = 0;                 //Second bit of this
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;Timer2 Interrupt.c,48 :: 		TIM2_CCMR1_Input.B7 = 0;          //Disable Capture 1 input filtering (IC1F = 0)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;Timer2 Interrupt.c,49 :: 		TIM2_CCMR1_Input.B6 = 0;                    //Second bit of this
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;Timer2 Interrupt.c,50 :: 		TIM2_CCMR1_Input.B5 = 0;                    //Third bit of this
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;Timer2 Interrupt.c,51 :: 		TIM2_CCMR1_Input.B4 = 0;                    //Fourth bit of this
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;Timer2 Interrupt.c,52 :: 		TIM2_DIER.CC1IE = 1;              //Enable capture 1 interrupt
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R3, [R0, #0]
;Timer2 Interrupt.c,53 :: 		TIM2_DIER.UIE = 1;                //CC1 Update Interrupt Enable
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R3, [R0, #0]
;Timer2 Interrupt.c,54 :: 		NVIC_IntEnable(IVT_INT_TIM2);     //Enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Timer2 Interrupt.c,55 :: 		EnableInterrupts();               //Probably unneeded due to previous line
BL	_EnableInterrupts+0
;Timer2 Interrupt.c,56 :: 		TIM2_CR1.CEN = 1;                 //Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,57 :: 		}
L_end_init_tim2_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_tim2_input_capture
_Timer2_interrupt:
;Timer2 Interrupt.c,60 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Timer2 Interrupt.c,61 :: 		NVIC_IntDisable(IVT_INT_TIM2);     //Disable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntDisable+0
;Timer2 Interrupt.c,62 :: 		if(TIM2_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Timer2_interrupt0
;Timer2 Interrupt.c,63 :: 		TIM2_SR.UIF = 0;                                   //Reset timer 2 interupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,64 :: 		overflow_count++;                                  //Increment overflow counter
MOVW	R1, #lo_addr(_overflow_count+0)
MOVT	R1, #hi_addr(_overflow_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Timer2 Interrupt.c,65 :: 		}
L_Timer2_interrupt0:
;Timer2 Interrupt.c,67 :: 		if (TIM2_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Timer2_interrupt1
;Timer2 Interrupt.c,68 :: 		TIM2_SR.CC1IF = 0;                                 //Reset input capture event flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,69 :: 		end_time = TIM2_CCR1;                              //Grab stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
MOVW	R3, #lo_addr(_end_time+0)
MOVT	R3, #hi_addr(_end_time+0)
STR	R0, [R3, #0]
;Timer2 Interrupt.c,70 :: 		pulse_ticks = (overflow_count << 16) - start_time + end_time;    //Calculate total ticks between events
MOVW	R2, #lo_addr(_start_time+0)
MOVT	R2, #hi_addr(_start_time+0)
LDR	R0, [R2, #0]
RSBS	R1, R0, #0
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_pulse_ticks+0)
MOVT	R0, #hi_addr(_pulse_ticks+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,71 :: 		start_time = end_time;
MOV	R0, R3
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Timer2 Interrupt.c,72 :: 		overflow_count = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
STRH	R1, [R0, #0]
;Timer2 Interrupt.c,73 :: 		GPIOE_ODR = ~GPIOE_ODR;      // Toggle PORTE led's
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,81 :: 		UART1_Write(0x30);       // should be
MOVS	R0, #48
BL	_UART1_Write+0
;Timer2 Interrupt.c,83 :: 		delay_ms(1000);
MOVW	R7, #32254
MOVT	R7, #854
NOP
NOP
L_Timer2_interrupt2:
SUBS	R7, R7, #1
BNE	L_Timer2_interrupt2
NOP
NOP
NOP
;Timer2 Interrupt.c,84 :: 		GPIOE_ODR = ~GPIOE_ODR;
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,85 :: 		}
L_Timer2_interrupt1:
;Timer2 Interrupt.c,87 :: 		TIM2_SR.CC1IF = 0;                                 //Reset input capture event flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,88 :: 		TIM2_SR.UIF = 0;                                   //Reset timer 2 interupt flag
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,89 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Timer2 Interrupt.c,91 :: 		}
L_end_Timer2_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_interrupt
_main:
;Timer2 Interrupt.c,93 :: 		void main() {
;Timer2 Interrupt.c,94 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);  // Enable digital output on PORTE
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Timer2 Interrupt.c,95 :: 		GPIOE_ODR = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Timer2 Interrupt.c,96 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
BL	_GPIO_Alternate_Function_Enable+0
;Timer2 Interrupt.c,98 :: 		init_tim2_input_capture();
BL	_init_tim2_input_capture+0
;Timer2 Interrupt.c,100 :: 		UART1_Init(115200);
MOV	R0, #115200
BL	_UART1_Init+0
;Timer2 Interrupt.c,101 :: 		Delay_ms(200);     // wait for UART1 to stabilize
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;Timer2 Interrupt.c,103 :: 		while(1)  ;
L_main6:
IT	AL
BAL	L_main6
;Timer2 Interrupt.c,104 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
