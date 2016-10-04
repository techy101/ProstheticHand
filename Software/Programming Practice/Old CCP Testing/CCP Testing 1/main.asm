_wrong:
;main.c,8 :: 		void wrong() iv IVT_INT_EXTI0 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,9 :: 		TIM2_SR.B1 = 1;   // clear flag?
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;main.c,10 :: 		UART1_Write_Text("Inside handler \n");
MOVW	R0, #lo_addr(?lstr1_main+0)
MOVT	R0, #hi_addr(?lstr1_main+0)
BL	_UART1_Write_Text+0
;main.c,11 :: 		counterInterrupt = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_counterInterrupt+0)
MOVT	R0, #hi_addr(_counterInterrupt+0)
STRH	R1, [R0, #0]
;main.c,12 :: 		}
L_end_wrong:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _wrong
_InputCapture:
;main.c,15 :: 		void InputCapture() iv IVT_INT_TIM1_CC ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,17 :: 		TIM1_SR.CC1IF = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM1_SR+0)
MOVT	R0, #hi_addr(TIM1_SR+0)
STR	R1, [R0, #0]
;main.c,18 :: 		UART1_Write_Text("inside tim1_cc interrupt \n");
MOVW	R0, #lo_addr(?lstr2_main+0)
MOVT	R0, #hi_addr(?lstr2_main+0)
BL	_UART1_Write_Text+0
;main.c,19 :: 		}
L_end_InputCapture:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InputCapture
_main:
;main.c,25 :: 		void main() {
;main.c,27 :: 		UART1_Init(115200);             // Initialize UART module at 115200 bps
MOV	R0, #115200
BL	_UART1_Init+0
;main.c,28 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;main.c,31 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;main.c,43 :: 		TIM1_CCMR1_Input.B1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM1_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Input+0)
STR	R2, [R0, #0]
;main.c,44 :: 		TIM1_CCMR1_Input.B0 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM1_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Input+0)
STR	R1, [R0, #0]
;main.c,47 :: 		TIM1_CCMR1_Input.B7 = 0;
MOVW	R0, #lo_addr(TIM1_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Input+0)
STR	R2, [R0, #0]
;main.c,48 :: 		TIM1_CCMR1_Input.B6 = 0;
MOVW	R0, #lo_addr(TIM1_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Input+0)
STR	R2, [R0, #0]
;main.c,49 :: 		TIM1_CCMR1_Input.B5 = 0;
MOVW	R0, #lo_addr(TIM1_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Input+0)
STR	R2, [R0, #0]
;main.c,50 :: 		TIM1_CCMR1_Input.B4 = 0;
MOVW	R0, #lo_addr(TIM1_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Input+0)
STR	R2, [R0, #0]
;main.c,53 :: 		TIM1_CCER.CC1NP = 0;
MOVW	R0, #lo_addr(TIM1_CCER+0)
MOVT	R0, #hi_addr(TIM1_CCER+0)
STR	R2, [R0, #0]
;main.c,54 :: 		TIM1_CCER.CC1P = 0;
MOVW	R0, #lo_addr(TIM1_CCER+0)
MOVT	R0, #hi_addr(TIM1_CCER+0)
STR	R2, [R0, #0]
;main.c,57 :: 		TIM1_CCMR1_Input.B3 = 0;
MOVW	R0, #lo_addr(TIM1_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Input+0)
STR	R2, [R0, #0]
;main.c,58 :: 		TIM1_CCMR1_Input.B2 = 0;
MOVW	R0, #lo_addr(TIM1_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Input+0)
STR	R2, [R0, #0]
;main.c,61 :: 		TIM1_CCER.CC1E = 1;
MOVW	R0, #lo_addr(TIM1_CCER+0)
MOVT	R0, #hi_addr(TIM1_CCER+0)
STR	R1, [R0, #0]
;main.c,64 :: 		TIM1_DIER.CC1IE = 1;
MOVW	R0, #lo_addr(TIM1_DIER+0)
MOVT	R0, #hi_addr(TIM1_DIER+0)
STR	R1, [R0, #0]
;main.c,66 :: 		SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions... for luck
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;main.c,69 :: 		TIM1_CR1.CEN = 1; // enable counter
MOVW	R0, #lo_addr(TIM1_CR1+0)
MOVT	R0, #hi_addr(TIM1_CR1+0)
STR	R1, [R0, #0]
;main.c,72 :: 		UART1_Write_Text("Starting...");
MOVW	R0, #lo_addr(?lstr3_main+0)
MOVT	R0, #hi_addr(?lstr3_main+0)
BL	_UART1_Write_Text+0
;main.c,73 :: 		UART1_Write(13);
MOVS	R0, #13
BL	_UART1_Write+0
;main.c,74 :: 		UART1_Write(10);
MOVS	R0, #10
BL	_UART1_Write+0
;main.c,81 :: 		while(1)
L_main2:
;main.c,83 :: 		if(GPIOA_IDR.B5)  {    //PA5 was pressed
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;main.c,84 :: 		Delay_ms(150);      //debounce
MOVW	R7, #11390
MOVT	R7, #128
NOP
NOP
L_main5:
SUBS	R7, R7, #1
BNE	L_main5
NOP
NOP
NOP
;main.c,85 :: 		UART1_Write_Text("button A5 pressed \n");
MOVW	R0, #lo_addr(?lstr4_main+0)
MOVT	R0, #hi_addr(?lstr4_main+0)
BL	_UART1_Write_Text+0
;main.c,86 :: 		TIM1_EGR.B1 = 1;    // generate a cc event on timer 1, channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM1_EGR+0)
MOVT	R0, #hi_addr(TIM1_EGR+0)
STR	R1, [R0, #0]
;main.c,87 :: 		test |= TIM1_EGR.B1;
MOVW	R0, #lo_addr(TIM1_EGR+0)
MOVT	R0, #hi_addr(TIM1_EGR+0)
LDR	R2, [R0, #0]
MOVW	R1, #lo_addr(test+0)
MOVT	R1, #hi_addr(test+0)
LDRB	R0, [R1, #0]
ORRS	R0, R2
UXTB	R0, R0
STRB	R0, [R1, #0]
;main.c,88 :: 		if(test == 1)
CMP	R0, #1
IT	NE
BNE	L_main7
;main.c,89 :: 		UART1_Write_Text("test = 1 \n ");
MOVW	R0, #lo_addr(?lstr5_main+0)
MOVT	R0, #hi_addr(?lstr5_main+0)
BL	_UART1_Write_Text+0
IT	AL
BAL	L_main8
L_main7:
;main.c,90 :: 		else if(test == 0)
MOVW	R0, #lo_addr(test+0)
MOVT	R0, #hi_addr(test+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main9
;main.c,91 :: 		UART1_Write_Text("test = 0 \n");
MOVW	R0, #lo_addr(?lstr6_main+0)
MOVT	R0, #hi_addr(?lstr6_main+0)
BL	_UART1_Write_Text+0
IT	AL
BAL	L_main10
L_main9:
;main.c,93 :: 		UART1_Write_Text("something else happened \n");
MOVW	R0, #lo_addr(?lstr7_main+0)
MOVT	R0, #hi_addr(?lstr7_main+0)
BL	_UART1_Write_Text+0
L_main10:
L_main8:
;main.c,94 :: 		if(TIM1_SR.CC1IF == 1) {      // interrupt flag on cc1 was set
MOVW	R1, #lo_addr(TIM1_SR+0)
MOVT	R1, #hi_addr(TIM1_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main11
;main.c,95 :: 		UART1_Write_Text("You win! \n");
MOVW	R0, #lo_addr(?lstr8_main+0)
MOVT	R0, #hi_addr(?lstr8_main+0)
BL	_UART1_Write_Text+0
;main.c,96 :: 		TIM1_SR.CC1IF = 0;    // clear flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM1_SR+0)
MOVT	R0, #hi_addr(TIM1_SR+0)
STR	R1, [R0, #0]
;main.c,98 :: 		}
L_main11:
;main.c,99 :: 		}
L_main4:
;main.c,114 :: 		}
IT	AL
BAL	L_main2
;main.c,116 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
