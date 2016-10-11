_TIM3_timed:
;TimerTickPeriod.c,8 :: 		void TIM3_timed() iv IVT_INT_TIM3 {
;TimerTickPeriod.c,9 :: 		TIM3_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,10 :: 		print_flag = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_print_flag+0)
MOVT	R0, #hi_addr(_print_flag+0)
STRH	R1, [R0, #0]
;TimerTickPeriod.c,11 :: 		}
L_end_TIM3_timed:
BX	LR
; end of _TIM3_timed
_TIM4_run:
;TimerTickPeriod.c,13 :: 		void TIM4_run() iv IVT_INT_TIM4  {
;TimerTickPeriod.c,14 :: 		TIM4_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SR+0)
MOVT	R0, #hi_addr(TIM4_SR+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,15 :: 		overflow_count++;
MOVW	R1, #lo_addr(_overflow_count+0)
MOVT	R1, #hi_addr(_overflow_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;TimerTickPeriod.c,16 :: 		}
L_end_TIM4_run:
BX	LR
; end of _TIM4_run
_main:
;TimerTickPeriod.c,18 :: 		void main() {
SUB	SP, SP, #4
;TimerTickPeriod.c,19 :: 		UART1_init(115200);
MOV	R0, #115200
BL	_UART1_Init+0
;TimerTickPeriod.c,20 :: 		Delay_ms(200);
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
;TimerTickPeriod.c,23 :: 		RCC_APB1ENR.TIM3EN = 1;       // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,24 :: 		TIM3_CR1.CEN = 0;             // Disable timer
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,25 :: 		TIM3_PSC = 2563;              // Set timer prescaler
MOVW	R1, #2563
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,26 :: 		TIM3_ARR = 65522;
MOVW	R1, #65522
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,27 :: 		NVIC_IntEnable(IVT_INT_TIM3); // Enable timer interrupt
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;TimerTickPeriod.c,28 :: 		TIM3_DIER.UIE = 1;            // Update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,31 :: 		RCC_APB1ENR.TIM4EN = 1;       // Enable clock gating for timer module 4
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,32 :: 		TIM4_CR1.CEN = 0;             // Disable timer
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,33 :: 		TIM4_PSC = 0;                 // Set timer prescaler
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,34 :: 		TIM4_ARR = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,35 :: 		NVIC_IntEnable(IVT_INT_TIM4); // Enable timer interrupt
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;TimerTickPeriod.c,36 :: 		TIM4_DIER.UIE = 1;            // Update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_DIER+0)
MOVT	R0, #hi_addr(TIM4_DIER+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,38 :: 		TIM3_CR1.CEN = 1;             // Enable timer 3
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,39 :: 		TIM4_CR1.CEN = 1;             // Enable timer 4
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,41 :: 		while(1) {
L_main2:
;TimerTickPeriod.c,42 :: 		if(print_flag == 1) {            // Print every second
MOVW	R0, #lo_addr(_print_flag+0)
MOVT	R0, #hi_addr(_print_flag+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main4
;TimerTickPeriod.c,43 :: 		tim4_leftover = TIM4_CNT;     // Read value in running timer
MOVW	R0, #lo_addr(TIM4_CNT+0)
MOVT	R0, #hi_addr(TIM4_CNT+0)
LDR	R0, [R0, #0]
MOVW	R2, #lo_addr(_tim4_leftover+0)
MOVT	R2, #hi_addr(_tim4_leftover+0)
STRH	R0, [R2, #0]
;TimerTickPeriod.c,44 :: 		TIM3_CR1.CEN = 0;             // Disable one-second timer
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,45 :: 		TIM4_CR1.CEN = 0;             // Disable running timer
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,47 :: 		tick_count = 65536*overflow_count + tim4_leftover;
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
STR	R0, [SP, #0]
LDRH	R0, [R0, #0]
LSLS	R1, R0, #16
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_tick_count+0)
MOVT	R0, #hi_addr(_tick_count+0)
STRH	R1, [R0, #0]
;TimerTickPeriod.c,48 :: 		IntToStr(tick_count, tickCountInText);                                  // Convert number of overflows to a string
SXTH	R0, R1
MOVW	R1, #lo_addr(_tickCountInText+0)
MOVT	R1, #hi_addr(_tickCountInText+0)
BL	_IntToStr+0
;TimerTickPeriod.c,49 :: 		UART1_Write_Text("Total timer ticks in one second: ");
MOVW	R0, #lo_addr(?lstr1_TimerTickPeriod+0)
MOVT	R0, #hi_addr(?lstr1_TimerTickPeriod+0)
BL	_UART1_Write_Text+0
;TimerTickPeriod.c,50 :: 		UART1_Write_Text(tickCountInText);
MOVW	R0, #lo_addr(_tickCountInText+0)
MOVT	R0, #hi_addr(_tickCountInText+0)
BL	_UART1_Write_Text+0
;TimerTickPeriod.c,51 :: 		UART1_Write_Text("\n\n");
MOVW	R0, #lo_addr(?lstr2_TimerTickPeriod+0)
MOVT	R0, #hi_addr(?lstr2_TimerTickPeriod+0)
BL	_UART1_Write_Text+0
;TimerTickPeriod.c,53 :: 		print_flag = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_print_flag+0)
MOVT	R0, #hi_addr(_print_flag+0)
STRH	R1, [R0, #0]
;TimerTickPeriod.c,54 :: 		overflow_count = 0;
MOVS	R1, #0
LDR	R0, [SP, #0]
STRH	R1, [R0, #0]
;TimerTickPeriod.c,56 :: 		TIM3_CR1.CEN = 1;             // Enable one-second timer
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,57 :: 		TIM4_CR1.CEN = 1;             // Enable running timer
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;TimerTickPeriod.c,58 :: 		}
L_main4:
;TimerTickPeriod.c,59 :: 		}
IT	AL
BAL	L_main2
;TimerTickPeriod.c,60 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
