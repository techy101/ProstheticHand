_main:
;input_capture_demo.c,79 :: 		void main() {
SUB	SP, SP, #20
;input_capture_demo.c,82 :: 		init_hardware();                                                           // Initialize GPIO hardware
BL	_init_hardware+0
;input_capture_demo.c,83 :: 		init_timer3();
BL	_init_timer3+0
;input_capture_demo.c,84 :: 		init_tim2_input_capture();                                                 // Initialize input capture
BL	_init_tim2_input_capture+0
;input_capture_demo.c,85 :: 		init_serial_comm();                                                        // Initialize UART1 (Wired)
BL	_init_serial_comm+0
;input_capture_demo.c,88 :: 		strncpy(testOutput, "\rProgram Has Started\n\r", STR_MAX);
MOVW	R0, #lo_addr(?lstr1_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr1_input_capture_demo+0)
MOVS	R2, #15
SXTH	R2, R2
MOV	R1, R0
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
BL	_strncpy+0
;input_capture_demo.c,89 :: 		UART1_Write_Text(testOutput);
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,92 :: 		while(1) {
L_main0:
;input_capture_demo.c,93 :: 		if (poll_flag && print_counter >= 15) {
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main16
MOVW	R0, #lo_addr(_print_counter+0)
MOVT	R0, #hi_addr(_print_counter+0)
LDRH	R0, [R0, #0]
CMP	R0, #15
IT	CC
BCC	L__main15
L__main14:
;input_capture_demo.c,94 :: 		poll_flag = 0;                                                       // Clear state entry flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,98 :: 		tim_overflow_ticks = (unsigned long) overflowCountTemp * (tim_arr - 3);            // 3 is an adjustment factor for accurate reading.
MOVW	R0, #lo_addr(_overflowCountTemp+0)
MOVT	R0, #hi_addr(_overflowCountTemp+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_tim_arr+0)
MOVT	R0, #hi_addr(_tim_arr+0)
LDR	R0, [R0, #0]
SUBS	R0, R0, #3
MUL	R2, R1, R0
MOVW	R0, #lo_addr(_tim_overflow_ticks+0)
MOVT	R0, #hi_addr(_tim_overflow_ticks+0)
STR	R2, [R0, #0]
;input_capture_demo.c,99 :: 		tim_ticks_total = (unsigned long) (old_tim_ticks_remain) - (tim_ticks_remain) + tim_overflow_ticks;
MOVW	R0, #lo_addr(_tim_ticks_remain+0)
MOVT	R0, #hi_addr(_tim_ticks_remain+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_old_tim_ticks_remain+0)
MOVT	R0, #hi_addr(_old_tim_ticks_remain+0)
LDR	R0, [R0, #0]
SUB	R0, R0, R1
ADDS	R2, R0, R2
MOVW	R0, #lo_addr(_tim_ticks_total+0)
MOVT	R0, #hi_addr(_tim_ticks_total+0)
STR	R2, [R0, #0]
;input_capture_demo.c,100 :: 		input_sig_period = (long double) tim_ticks_total * timer_period_ms;
MOV	R0, R2
BL	__UnsignedIntegralToLongDouble+0
MOVW	R2, #lo_addr(_timer_period_ms+0)
MOVT	R2, #hi_addr(_timer_period_ms+0)
STR	R2, [SP, #16]
VLDR	#1, D0, [R2, #0]
VMOV	R2, S0
VMOV	R3, S1
BL	__Mul_DP+0
STRD	R0, R1, [SP, #8]
MOVW	R0, #lo_addr(_input_sig_period+0)
MOVT	R0, #hi_addr(_input_sig_period+0)
STRD	R1, R2, [SP, #0]
LDRD	R1, R2, [SP, #8]
STRD	R1, R2, [R0, #0]
LDRD	R1, R2, [SP, #0]
;input_capture_demo.c,101 :: 		input_sig_freq = (long double) 1000.0 / input_sig_period;
MOV	R0, #0
MOVW	R1, #16384
MOVT	R1, #16527
VMOV	S0, R0
VMOV	S1, R1
STRD	R2, R3, [SP, #0]
LDRD	R2, R3, [SP, #8]
VMOV	R0, S0
VMOV	R1, S1
BL	__Div_DP+0
LDRD	R2, R3, [SP, #0]
MOVW	R2, #lo_addr(_input_sig_freq+0)
MOVT	R2, #hi_addr(_input_sig_freq+0)
STRD	R0, R1, [R2, #0]
;input_capture_demo.c,104 :: 		LongDoubleToStr(timer_period_ms, timePerTickInText);                 // Time Per Tick in ms
LDR	R0, [SP, #16]
LDRD	R0, R1, [R0, #0]
VMOV	S0, R0
VMOV	S1, R1
MOVW	R0, #lo_addr(_timePerTickInText+0)
MOVT	R0, #hi_addr(_timePerTickInText+0)
BL	_LongDoubleToStr+0
;input_capture_demo.c,105 :: 		UART1_Write_Text("Time per tick: ");
MOVW	R0, #lo_addr(?lstr2_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr2_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,106 :: 		UART1_Write_Text(timePerTickInText);
MOVW	R0, #lo_addr(_timePerTickInText+0)
MOVT	R0, #hi_addr(_timePerTickInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,107 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr3_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr3_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,110 :: 		IntToStr(overflowCountTemp, overflowsInText);                        // Number of overflows
MOVW	R0, #lo_addr(_overflowCountTemp+0)
MOVT	R0, #hi_addr(_overflowCountTemp+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_overflowsInText+0)
MOVT	R1, #hi_addr(_overflowsInText+0)
BL	_IntToStr+0
;input_capture_demo.c,111 :: 		UART1_Write_Text("Total number of timer overflows: ");
MOVW	R0, #lo_addr(?lstr4_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr4_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,112 :: 		UART1_Write_Text(overflowsInText);
MOVW	R0, #lo_addr(_overflowsInText+0)
MOVT	R0, #hi_addr(_overflowsInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,113 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr5_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr5_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,116 :: 		LongWordToStr(tim_overflow_ticks, totalOverflowTimeInText);          // Total number of overflow ticks
MOVW	R0, #lo_addr(_tim_overflow_ticks+0)
MOVT	R0, #hi_addr(_tim_overflow_ticks+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_totalOverflowTimeInText+0)
MOVT	R1, #hi_addr(_totalOverflowTimeInText+0)
BL	_LongWordToStr+0
;input_capture_demo.c,117 :: 		UART1_Write_Text("Total Overflow Ticks : ");
MOVW	R0, #lo_addr(?lstr6_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr6_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,118 :: 		UART1_Write_Text(totalOverflowTimeInText);
MOVW	R0, #lo_addr(_totalOverflowTimeInText+0)
MOVT	R0, #hi_addr(_totalOverflowTimeInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,119 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr7_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr7_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,122 :: 		LongWordToStr(tim_ticks_remain, endTimeInText);                             // Value of CC1 at capture event
MOVW	R0, #lo_addr(_tim_ticks_remain+0)
MOVT	R0, #hi_addr(_tim_ticks_remain+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_endTimeInText+0)
MOVT	R1, #hi_addr(_endTimeInText+0)
BL	_LongWordToStr+0
;input_capture_demo.c,123 :: 		UART1_Write_Text("Time read from CCP1 Register: ");
MOVW	R0, #lo_addr(?lstr8_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr8_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,124 :: 		UART1_Write_Text(endTimeInText);
MOVW	R0, #lo_addr(_endTimeInText+0)
MOVT	R0, #hi_addr(_endTimeInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,125 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr9_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr9_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,128 :: 		LongWordToStr(tim_ticks_total, ticksInText);                                  // Total number of timer ticks between events
MOVW	R0, #lo_addr(_tim_ticks_total+0)
MOVT	R0, #hi_addr(_tim_ticks_total+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_ticksInText+0)
MOVT	R1, #hi_addr(_ticksInText+0)
BL	_LongWordToStr+0
;input_capture_demo.c,129 :: 		UART1_Write_Text("Total number of ticks between events: ");
MOVW	R0, #lo_addr(?lstr10_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr10_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,130 :: 		UART1_Write_Text(ticksInText);
MOVW	R0, #lo_addr(_ticksInText+0)
MOVT	R0, #hi_addr(_ticksInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,131 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr11_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr11_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,133 :: 		LongDoubleToStr(input_sig_period, periodInText);                          // Input signal period (ms)
MOVW	R0, #lo_addr(_input_sig_period+0)
MOVT	R0, #hi_addr(_input_sig_period+0)
LDRD	R0, R1, [R0, #0]
VMOV	S0, R0
VMOV	S1, R1
MOVW	R0, #lo_addr(_periodInText+0)
MOVT	R0, #hi_addr(_periodInText+0)
BL	_LongDoubleToStr+0
;input_capture_demo.c,134 :: 		UART1_Write_Text("Period of incoming signal (ms): ");
MOVW	R0, #lo_addr(?lstr12_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr12_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,135 :: 		UART1_Write_Text(periodInText);
MOVW	R0, #lo_addr(_periodInText+0)
MOVT	R0, #hi_addr(_periodInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,136 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr13_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr13_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,138 :: 		LongDoubleToStr(input_sig_freq, frequencyInText);                    // Input signal frequency
MOVW	R0, #lo_addr(_input_sig_freq+0)
MOVT	R0, #hi_addr(_input_sig_freq+0)
LDRD	R0, R1, [R0, #0]
VMOV	S0, R0
VMOV	S1, R1
MOVW	R0, #lo_addr(_frequencyInText+0)
MOVT	R0, #hi_addr(_frequencyInText+0)
BL	_LongDoubleToStr+0
;input_capture_demo.c,139 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R0, #lo_addr(?lstr14_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr14_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,140 :: 		UART1_Write_Text(frequencyInText);
MOVW	R0, #lo_addr(_frequencyInText+0)
MOVT	R0, #hi_addr(_frequencyInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,141 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr15_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr15_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,143 :: 		LongToStr(inputEventCounter, eventCounterInText);                    // Total number of input events between polls
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_eventCounterInText+0)
MOVT	R1, #hi_addr(_eventCounterInText+0)
BL	_LongToStr+0
;input_capture_demo.c,144 :: 		UART1_Write_Text("Number of input capture events: ");
MOVW	R0, #lo_addr(?lstr16_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr16_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,145 :: 		UART1_Write_Text(eventCounterInText);
MOVW	R0, #lo_addr(_eventCounterInText+0)
MOVT	R0, #hi_addr(_eventCounterInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,146 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R0, #lo_addr(?lstr17_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr17_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,148 :: 		inputEventCounter = 0;                                               // Reset input event counter for next
MOVS	R1, #0
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
STR	R1, [R0, #0]
;input_capture_demo.c,149 :: 		print_counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_print_counter+0)
MOVT	R0, #hi_addr(_print_counter+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,150 :: 		}
IT	AL
BAL	L_main5
;input_capture_demo.c,93 :: 		if (poll_flag && print_counter >= 15) {
L__main16:
L__main15:
;input_capture_demo.c,152 :: 		else if (poll_flag && !inputEventCounter) {
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main18
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
LDR	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__main17
L__main13:
;input_capture_demo.c,153 :: 		UART1_Write_Text("No Events Detected\n\n\r");
MOVW	R0, #lo_addr(?lstr18_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr18_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,154 :: 		poll_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,155 :: 		inputEventCounter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
STR	R1, [R0, #0]
;input_capture_demo.c,152 :: 		else if (poll_flag && !inputEventCounter) {
L__main18:
L__main17:
;input_capture_demo.c,156 :: 		}
L_main5:
;input_capture_demo.c,157 :: 		}
IT	AL
BAL	L_main0
;input_capture_demo.c,158 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_init_tim2_input_capture:
;input_capture_demo.c,162 :: 		void init_tim2_input_capture() {
SUB	SP, SP, #20
STR	LR, [SP, #0]
;input_capture_demo.c,164 :: 		RCC_APB1ENR.TIM2EN = 1;                                                    // Enable clock gating for timer module 2
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R2, [R0, #0]
;input_capture_demo.c,165 :: 		TIM2_CR1.CEN = 0;                                                          // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,166 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                                // Set timer 2 prescaler (need to determine value)
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;input_capture_demo.c,167 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                             // Set timer 2 overflow value at max
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,168 :: 		TIM2_CR1 |= 0x10;                                                          // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,169 :: 		TIM2_CCMR1_Input |= 0x01;                                                  // Set capture channel 1 as input (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;input_capture_demo.c,170 :: 		TIM2_CCER.CC1P = 1;                                                        // Set capture on rising edge event
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,171 :: 		TIM2_CCER.CC1E = 1;                                                        // Enable capture on channel 1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,172 :: 		TIM2_DIER.CC1IE = 1;                                                       // Enable capture 1 interrupt
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,173 :: 		TIM2_DIER.UIE = 1;                                                         // CC1 Update Interrupt Enable
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,174 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                              // Enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;input_capture_demo.c,176 :: 		TIM2_CNT = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
STR	R1, [R0, #0]
;input_capture_demo.c,177 :: 		TIM2_CR1.CEN = 1;                                                          // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,182 :: 		timer_period_ms = (long double) 1000.0 / clk_freq;
MOVW	R0, #lo_addr(_clk_freq+0)
MOVT	R0, #hi_addr(_clk_freq+0)
VLDR	#1, S0, [R0, #0]
VMOV	R0, S0
BL	__UnsignedIntegralToLongDouble+0
STRD	R0, R1, [SP, #12]
MOV	R0, #0
MOVW	R1, #16384
MOVT	R1, #16527
VMOV	S0, R0
VMOV	S1, R1
STRD	R2, R3, [SP, #4]
LDRD	R2, R3, [SP, #12]
VMOV	R0, S0
VMOV	R1, S1
BL	__Div_DP+0
LDRD	R2, R3, [SP, #4]
MOVW	R2, #lo_addr(_timer_period_ms+0)
MOVT	R2, #hi_addr(_timer_period_ms+0)
STRD	R0, R1, [R2, #0]
;input_capture_demo.c,185 :: 		}
L_end_init_tim2_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _init_tim2_input_capture
_timer2_interrupt:
;input_capture_demo.c,188 :: 		void timer2_interrupt() iv IVT_INT_TIM2 {
;input_capture_demo.c,192 :: 		if(TIM2_SR.UIF == 1) {                                                     // If timer 2 overflow event occured
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_interrupt9
;input_capture_demo.c,193 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,194 :: 		overflowCount++;                                                        // Increment overflow counter
MOVW	R1, #lo_addr(_overflowCount+0)
MOVT	R1, #hi_addr(_overflowCount+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;input_capture_demo.c,195 :: 		}
L_timer2_interrupt9:
;input_capture_demo.c,197 :: 		if (TIM2_SR.CC1IF == 1) {                                                  // If Input Capture event occured
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_interrupt10
;input_capture_demo.c,199 :: 		old_tim_ticks_remain = tim_ticks_remain;
MOVW	R2, #lo_addr(_tim_ticks_remain+0)
MOVT	R2, #hi_addr(_tim_ticks_remain+0)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_old_tim_ticks_remain+0)
MOVT	R0, #hi_addr(_old_tim_ticks_remain+0)
STR	R1, [R0, #0]
;input_capture_demo.c,200 :: 		tim_ticks_remain = TIM2_CCR1;                                                 // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;input_capture_demo.c,201 :: 		overflowCountTemp = overflowCount;
MOVW	R2, #lo_addr(_overflowCount+0)
MOVT	R2, #hi_addr(_overflowCount+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_overflowCountTemp+0)
MOVT	R0, #hi_addr(_overflowCountTemp+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,202 :: 		overflowCount = 0;                                                      // Reset the overflow counter to 0
MOVS	R0, #0
STRH	R0, [R2, #0]
;input_capture_demo.c,203 :: 		inputEventCounter++;                                                    // Increment total input capture event counter
MOVW	R1, #lo_addr(_inputEventCounter+0)
MOVT	R1, #hi_addr(_inputEventCounter+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;input_capture_demo.c,204 :: 		}
L_timer2_interrupt10:
;input_capture_demo.c,210 :: 		}
L_end_timer2_interrupt:
BX	LR
; end of _timer2_interrupt
_external_interrupt:
;input_capture_demo.c,214 :: 		void external_interrupt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
;input_capture_demo.c,216 :: 		EXTI_PR.B10 = 1;                                                           // Clear external interrupt bit
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,217 :: 		poll_flag = 1;                                                             // Set poll flag for main
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,219 :: 		}
L_end_external_interrupt:
BX	LR
; end of _external_interrupt
_init_hardware:
;input_capture_demo.c,223 :: 		void init_hardware() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,226 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                        // Enable digital output on E10
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;input_capture_demo.c,227 :: 		GPIOE_ODR.B10 = 0;                                                         // Set pin E10 low
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,230 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
BL	_GPIO_Alternate_Function_Enable+0
;input_capture_demo.c,241 :: 		}
L_end_init_hardware:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_hardware
_init_serial_comm:
;input_capture_demo.c,245 :: 		void init_serial_comm() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,247 :: 		UART1_Init(UART_BAUD_RATE);                                                // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;input_capture_demo.c,248 :: 		Delay_ms(200);                                                             // Wait for UART to stabilize
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_init_serial_comm11:
SUBS	R7, R7, #1
BNE	L_init_serial_comm11
NOP
NOP
NOP
;input_capture_demo.c,249 :: 		}
L_end_init_serial_comm:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_serial_comm
_init_timer3:
;input_capture_demo.c,253 :: 		void init_timer3(){                                                              // Interrupts every 100ms
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,254 :: 		RCC_APB1ENR.TIM3EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,255 :: 		TIM3_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,256 :: 		TIM3_PSC = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;input_capture_demo.c,257 :: 		TIM3_ARR = 59999;
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,258 :: 		NVIC_IntEnable(IVT_INT_TIM3);
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;input_capture_demo.c,259 :: 		TIM3_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;input_capture_demo.c,260 :: 		TIM3_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,261 :: 		}
L_end_init_timer3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_timer3
_Timer3_interrupt:
;input_capture_demo.c,263 :: 		void Timer3_interrupt() iv IVT_INT_TIM3 {
;input_capture_demo.c,264 :: 		TIM3_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,265 :: 		poll_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,266 :: 		print_counter++;
MOVW	R1, #lo_addr(_print_counter+0)
MOVT	R1, #hi_addr(_print_counter+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;input_capture_demo.c,267 :: 		}
L_end_Timer3_interrupt:
BX	LR
; end of _Timer3_interrupt
