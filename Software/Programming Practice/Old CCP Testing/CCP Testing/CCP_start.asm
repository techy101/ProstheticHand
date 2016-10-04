_InputCapture:
;CCP_start.c,7 :: 		void InputCapture() iv IVT_INT_EXTI0 ics ICS_AUTO {
;CCP_start.c,8 :: 		TIM2_SR.B1 = 1;   // clear flag?
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;CCP_start.c,9 :: 		counterInterrupt = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_counterInterrupt+0)
MOVT	R0, #hi_addr(_counterInterrupt+0)
STRH	R1, [R0, #0]
;CCP_start.c,10 :: 		}
L_end_InputCapture:
BX	LR
; end of _InputCapture
_main:
;CCP_start.c,12 :: 		void main() {
;CCP_start.c,14 :: 		UART1_Init(115200);             // Initialize UART module at 115200 bps
MOV	R0, #115200
BL	_UART1_Init+0
;CCP_start.c,15 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
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
;CCP_start.c,16 :: 		UART1_Write_Text("Writing something... ");
MOVW	R0, #lo_addr(?lstr1_CCP_start+0)
MOVT	R0, #hi_addr(?lstr1_CCP_start+0)
BL	_UART1_Write_Text+0
;CCP_start.c,19 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;CCP_start.c,29 :: 		TIM2_CCMR1_Input.B3 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;CCP_start.c,30 :: 		TIM2_CCMR1_Input.B2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;CCP_start.c,33 :: 		TIM2_CCMR1_Input.B7 = 0;
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;CCP_start.c,34 :: 		TIM2_CCMR1_Input.B6 = 0;
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;CCP_start.c,35 :: 		TIM2_CCMR1_Input.B5 = 0;
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;CCP_start.c,36 :: 		TIM2_CCMR1_Input.B4 = 0;
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;CCP_start.c,39 :: 		TIM2_CCER.CC1NP = 0;
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;CCP_start.c,40 :: 		TIM2_CCER.CC1P = 0;
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;CCP_start.c,43 :: 		TIM2_CCMR1_Input.B3 = 0;
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;CCP_start.c,44 :: 		TIM2_CCMR1_Input.B2 = 0;
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R0, #0]
;CCP_start.c,47 :: 		TIM2_CCER.CC1E = 1;
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;CCP_start.c,50 :: 		TIM2_DIER.CC1IE = 1;
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;CCP_start.c,53 :: 		UART1_Write_Text("Starting...");
MOVW	R0, #lo_addr(?lstr2_CCP_start+0)
MOVT	R0, #hi_addr(?lstr2_CCP_start+0)
BL	_UART1_Write_Text+0
;CCP_start.c,54 :: 		UART1_Write(13);
MOVS	R0, #13
BL	_UART1_Write+0
;CCP_start.c,55 :: 		UART1_Write(10);
MOVS	R0, #10
BL	_UART1_Write+0
;CCP_start.c,57 :: 		while(1)
L_main2:
;CCP_start.c,59 :: 		if(counterInterrupt)
MOVW	R0, #lo_addr(_counterInterrupt+0)
MOVT	R0, #hi_addr(_counterInterrupt+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;CCP_start.c,61 :: 		counterValue = TIM2_CNT;      // read the counter value
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_counterValue+0)
MOVT	R0, #hi_addr(_counterValue+0)
STRH	R1, [R0, #0]
;CCP_start.c,62 :: 		UART1_Write_Text("Count: ");  // display it
MOVW	R0, #lo_addr(?lstr3_CCP_start+0)
MOVT	R0, #hi_addr(?lstr3_CCP_start+0)
BL	_UART1_Write_Text+0
;CCP_start.c,63 :: 		UART1_Write(counterValue);
MOVW	R0, #lo_addr(_counterValue+0)
MOVT	R0, #hi_addr(_counterValue+0)
LDRH	R0, [R0, #0]
BL	_UART1_Write+0
;CCP_start.c,64 :: 		counterInterrupt = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_counterInterrupt+0)
MOVT	R0, #hi_addr(_counterInterrupt+0)
STRH	R1, [R0, #0]
;CCP_start.c,65 :: 		}
L_main4:
;CCP_start.c,66 :: 		}
IT	AL
BAL	L_main2
;CCP_start.c,68 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
