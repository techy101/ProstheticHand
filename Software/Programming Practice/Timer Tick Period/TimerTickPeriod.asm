_TIM3_timed:
;TimerTickPeriod.c,9 :: 		void TIM3_timed() iv IVT_INT_TIM3 {
;TimerTickPeriod.c,10 :: 		TIM3_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,11 :: 		print_flag = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_print_flag+0)
MOVT	R0, #hi_addr(_print_flag+0)
STRH	R1, [R0, #0]
;TimerTickPeriod.c,12 :: 		}
L_end_TIM3_timed:
BX	LR
; end of _TIM3_timed
_TIM4_run:
;TimerTickPeriod.c,14 :: 		void TIM4_run() iv IVT_INT_TIM4  {
;TimerTickPeriod.c,15 :: 		TIM4_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SR+0)
MOVT	R0, #hi_addr(TIM4_SR+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,16 :: 		overflow_count++;
MOVW	R1, #lo_addr(_overflow_count+0)
MOVT	R1, #hi_addr(_overflow_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;TimerTickPeriod.c,17 :: 		}
L_end_TIM4_run:
BX	LR
; end of _TIM4_run
_main:
;TimerTickPeriod.c,19 :: 		void main() {
SUB	SP, SP, #4
;TimerTickPeriod.c,20 :: 		UART1_init(115200);
MOV	R0, #115200
BL	_UART1_Init+0
;TimerTickPeriod.c,21 :: 		Delay_ms(200);
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;TimerTickPeriod.c,24 :: 		RCC_APB1ENR.TIM3EN = 1;       // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,25 :: 		TIM3_CR1.CEN = 0;             // Disable timer
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,26 :: 		TIM3_PSC = 2563;              // Set timer prescaler
MOVW	R1, #2563
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,27 :: 		TIM3_ARR = 65522;
MOVW	R1, #65522
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,28 :: 		NVIC_IntEnable(IVT_INT_TIM3); // Enable timer interrupt
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;TimerTickPeriod.c,29 :: 		TIM3_DIER.UIE = 1;            // Update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,32 :: 		RCC_APB1ENR.TIM4EN = 1;       // Enable clock gating for timer module 4
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,33 :: 		TIM4_CR1.CEN = 0;             // Disable timer
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,34 :: 		TIM4_PSC = 0;                 // Set timer prescaler
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,35 :: 		TIM4_ARR = 65535;
MOVW	R1, #65535
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,36 :: 		NVIC_IntEnable(IVT_INT_TIM4); // Enable timer interrupt
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;TimerTickPeriod.c,37 :: 		TIM4_DIER.UIE = 1;            // Update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_DIER+0)
MOVT	R0, #hi_addr(TIM4_DIER+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,39 :: 		TIM3_CR1.CEN = 1;             // Enable timer 3
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,40 :: 		TIM4_CR1.CEN = 1;             // Enable timer 4
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,42 :: 		while(1) {
L_main2:
;TimerTickPeriod.c,43 :: 		if(print_flag == 1) {            // Print every second
MOVW	R0, #lo_addr(_print_flag+0)
MOVT	R0, #hi_addr(_print_flag+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main4
;TimerTickPeriod.c,44 :: 		tim4_leftover = TIM4_CNT;     // Read value in running timer
MOVW	R0, #lo_addr(TIM4_CNT+0)
MOVT	R0, #hi_addr(TIM4_CNT+0)
LDR	R0, [R0, #0]
MOVW	R2, #lo_addr(_tim4_leftover+0)
MOVT	R2, #hi_addr(_tim4_leftover+0)
STR	R0, [R2, #0]
;TimerTickPeriod.c,45 :: 		TIM3_CR1.CEN = 0;             // Disable one-second timer
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,46 :: 		TIM4_CR1.CEN = 0;             // Disable running timer
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,48 :: 		tim4_leftover = TIM4_CNT;
MOVW	R0, #lo_addr(TIM4_CNT+0)
MOVT	R0, #hi_addr(TIM4_CNT+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;TimerTickPeriod.c,49 :: 		tick_count = (unsigned long)65535*overflow_count + tim4_leftover;
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
STR	R0, [SP, #0]
LDRH	R1, [R0, #0]
MOVW	R0, #65535
MOVT	R0, #0
MULS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_tick_count+0)
MOVT	R0, #hi_addr(_tick_count+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,51 :: 		UART1_Write_Text("Timer ticks per 1 sec: ");
MOVW	R0, #lo_addr(?lstr1_TimerTickPeriod+0)
MOVT	R0, #hi_addr(?lstr1_TimerTickPeriod+0)
BL	_UART1_Write_Text+0
;TimerTickPeriod.c,52 :: 		LongToStr(tick_count, tickCountInText);
MOVW	R0, #lo_addr(_tick_count+0)
MOVT	R0, #hi_addr(_tick_count+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_tickCountInText+0)
MOVT	R1, #hi_addr(_tickCountInText+0)
BL	_LongToStr+0
;TimerTickPeriod.c,53 :: 		UART1_Write_Text(tickCountInText);
MOVW	R0, #lo_addr(_tickCountInText+0)
MOVT	R0, #hi_addr(_tickCountInText+0)
BL	_UART1_Write_Text+0
;TimerTickPeriod.c,54 :: 		UART1_Write_Text("\n");
MOVW	R0, #lo_addr(?lstr2_TimerTickPeriod+0)
MOVT	R0, #hi_addr(?lstr2_TimerTickPeriod+0)
BL	_UART1_Write_Text+0
;TimerTickPeriod.c,56 :: 		LongToStr(tim4_leftover, tim4LeftoverInText);
MOVW	R0, #lo_addr(_tim4_leftover+0)
MOVT	R0, #hi_addr(_tim4_leftover+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_tim4LeftoverInText+0)
MOVT	R1, #hi_addr(_tim4LeftoverInText+0)
BL	_LongToStr+0
;TimerTickPeriod.c,57 :: 		UART1_Write_Text("Timer 4 value: ");
MOVW	R0, #lo_addr(?lstr3_TimerTickPeriod+0)
MOVT	R0, #hi_addr(?lstr3_TimerTickPeriod+0)
BL	_UART1_Write_Text+0
;TimerTickPeriod.c,58 :: 		UART1_Write_Text(tim4LeftoverInText);
MOVW	R0, #lo_addr(_tim4LeftoverInText+0)
MOVT	R0, #hi_addr(_tim4LeftoverInText+0)
BL	_UART1_Write_Text+0
;TimerTickPeriod.c,59 :: 		UART1_Write_Text("\n\n");
MOVW	R0, #lo_addr(?lstr4_TimerTickPeriod+0)
MOVT	R0, #hi_addr(?lstr4_TimerTickPeriod+0)
BL	_UART1_Write_Text+0
;TimerTickPeriod.c,61 :: 		print_flag = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_print_flag+0)
MOVT	R0, #hi_addr(_print_flag+0)
STRH	R1, [R0, #0]
;TimerTickPeriod.c,62 :: 		overflow_count = 0;
MOVS	R1, #0
LDR	R0, [SP, #0]
STRH	R1, [R0, #0]
;TimerTickPeriod.c,63 :: 		TIM4_CNT = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM4_CNT+0)
MOVT	R0, #hi_addr(TIM4_CNT+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,65 :: 		TIM3_CR1.CEN = 1;             // Enable one-second timer
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,66 :: 		TIM4_CR1.CEN = 1;             // Enable running timer
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,67 :: 		}
L_main4:
;TimerTickPeriod.c,68 :: 		}
IT	AL
BAL	L_main2
;TimerTickPeriod.c,69 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
