_main:
;input_capture_demo.c,81 :: 		void main() {
SUB	SP, SP, #28
;input_capture_demo.c,84 :: 		init_hardware();                                                           // Initialize GPIO hardware
BL	_init_hardware+0
;input_capture_demo.c,85 :: 		init_timer3();
BL	_init_timer3+0
;input_capture_demo.c,86 :: 		init_tim2_input_capture();                                                 // Initialize input capture
BL	_init_tim2_input_capture+0
;input_capture_demo.c,87 :: 		init_serial_comm();                                                        // Initialize UART1 (Wired)
BL	_init_serial_comm+0
;input_capture_demo.c,90 :: 		strncpy(testOutput, "\rProgram Has Started\n\r", STR_MAX);
MOVW	R0, #lo_addr(?lstr1_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr1_input_capture_demo+0)
MOVS	R2, #15
SXTH	R2, R2
MOV	R1, R0
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
BL	_strncpy+0
;input_capture_demo.c,91 :: 		UART1_Write_Text(testOutput);
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,94 :: 		while(1) {
L_main0:
;input_capture_demo.c,95 :: 		if (poll_flag && print_counter >= 15) {
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
;input_capture_demo.c,96 :: 		poll_flag = 0;                                                       // Clear state entry flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,102 :: 		totalOverflowTime = (long double) timer2_overflow_period_ms * overflowCountTemp;
MOVW	R0, #lo_addr(_timer2_overflow_period_ms+0)
MOVT	R0, #hi_addr(_timer2_overflow_period_ms+0)
LDRD	R0, R1, [R0, #0]
STRD	R0, R1, [SP, #8]
MOVW	R0, #lo_addr(_overflowCountTemp+0)
MOVT	R0, #hi_addr(_overflowCountTemp+0)
STR	R0, [SP, #24]
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToLongDouble+0
VLDR	#1, D0, [SP, #8]
VMOV	R2, S0
VMOV	R3, S1
BL	__Mul_DP+0
MOVW	R2, #lo_addr(_totalOverflowTime+0)
MOVT	R2, #hi_addr(_totalOverflowTime+0)
STR	R2, [SP, #8]
STRD	R0, R1, [R2, #0]
;input_capture_demo.c,103 :: 		totalInputTime = (long double) endTime * timer2_tick_period_ms;
MOVW	R0, #lo_addr(_timer2_tick_period_ms+0)
MOVT	R0, #hi_addr(_timer2_tick_period_ms+0)
STR	R0, [SP, #20]
VLDR	#1, D2, [R0, #0]
MOVW	R0, #lo_addr(_endTime+0)
MOVT	R0, #hi_addr(_endTime+0)
STR	R0, [SP, #16]
VLDR	#1, D0, [R0, #0]
VMOV	R0, S0
VMOV	R1, S1
VMOV	R2, S2
VMOV	R3, S3
BL	__Mul_DP+0
MOVW	R2, #lo_addr(_totalInputTime+0)
MOVT	R2, #hi_addr(_totalInputTime+0)
STRD	R0, R1, [R2, #0]
;input_capture_demo.c,104 :: 		inputPeriod = (long double) totalOverflowTime + totalInputTime;
LDR	R2, [SP, #8]
VLDR	#1, D0, [R2, #0]
VMOV	R2, S0
VMOV	R3, S1
BL	__Add_DP+0
STRD	R0, R1, [SP, #8]
MOVW	R0, #lo_addr(_inputPeriod+0)
MOVT	R0, #hi_addr(_inputPeriod+0)
STRD	R1, R2, [SP, #0]
LDRD	R1, R2, [SP, #8]
STRD	R1, R2, [R0, #0]
LDRD	R1, R2, [SP, #0]
;input_capture_demo.c,105 :: 		inputFrequency = (long double) 1 / inputPeriod;
MOV	R0, #1065353216
MOVS	R1, #0
VMOV	S0, R0
VMOV	S1, R1
STRD	R2, R3, [SP, #0]
LDRD	R2, R3, [SP, #8]
VMOV	R0, S0
VMOV	R1, S1
BL	__Div_DP+0
LDRD	R2, R3, [SP, #0]
MOVW	R2, #lo_addr(_inputFrequency+0)
MOVT	R2, #hi_addr(_inputFrequency+0)
STRD	R0, R1, [R2, #0]
;input_capture_demo.c,110 :: 		pulseTicks = ((long) (overflowCountTemp * (ENCODER_TIM_RELOAD)) + (endTime));
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R0, #0]
LDR	R0, [SP, #24]
LDRH	R0, [R0, #0]
MULS	R0, R1, R0
BL	__SignedIntegralToLongDouble+0
LDR	R2, [SP, #16]
VLDR	#1, D0, [R2, #0]
VMOV	R2, S0
VMOV	R3, S1
BL	__Add_DP+0
BL	__LongDoubleToSignedIntegral+0
MOVW	R1, #lo_addr(_pulseTicks+0)
MOVT	R1, #hi_addr(_pulseTicks+0)
STR	R0, [R1, #0]
;input_capture_demo.c,116 :: 		LongDoubleToStr(timer2_tick_period_ms, timePerTickInText);                                  // Convert number of overflows to a string
LDR	R0, [SP, #20]
LDRD	R0, R1, [R0, #0]
VMOV	S0, R0
VMOV	S1, R1
MOVW	R0, #lo_addr(_timePerTickInText+0)
MOVT	R0, #hi_addr(_timePerTickInText+0)
BL	_LongDoubleToStr+0
;input_capture_demo.c,117 :: 		UART1_Write_Text("Time per tick: ");
MOVW	R0, #lo_addr(?lstr2_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr2_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,118 :: 		UART1_Write_Text(timePerTickInText);
MOVW	R0, #lo_addr(_timePerTickInText+0)
MOVT	R0, #hi_addr(_timePerTickInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,119 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr3_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr3_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,122 :: 		IntToStr(overflowCountTemp, overflowsInText);                                  // Convert number of overflows to a string
MOVW	R0, #lo_addr(_overflowCountTemp+0)
MOVT	R0, #hi_addr(_overflowCountTemp+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_overflowsInText+0)
MOVT	R1, #hi_addr(_overflowsInText+0)
BL	_IntToStr+0
;input_capture_demo.c,123 :: 		UART1_Write_Text("Total number of timer overflows: ");
MOVW	R0, #lo_addr(?lstr4_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr4_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,124 :: 		UART1_Write_Text(overflowsInText);
MOVW	R0, #lo_addr(_overflowsInText+0)
MOVT	R0, #hi_addr(_overflowsInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,125 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr5_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr5_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,128 :: 		LongDoubleToStr(totalOverflowTime, totalOverflowTimeInText);                                  // Convert number of overflows to a string
MOVW	R0, #lo_addr(_totalOverflowTime+0)
MOVT	R0, #hi_addr(_totalOverflowTime+0)
LDRD	R0, R1, [R0, #0]
VMOV	S0, R0
VMOV	S1, R1
MOVW	R0, #lo_addr(_totalOverflowTimeInText+0)
MOVT	R0, #hi_addr(_totalOverflowTimeInText+0)
BL	_LongDoubleToStr+0
;input_capture_demo.c,129 :: 		UART1_Write_Text("Calculated Overflow Time : ");
MOVW	R0, #lo_addr(?lstr6_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr6_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,130 :: 		UART1_Write_Text(totalOverflowTimeInText);
MOVW	R0, #lo_addr(_totalOverflowTimeInText+0)
MOVT	R0, #hi_addr(_totalOverflowTimeInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,131 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr7_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr7_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,134 :: 		LongDoubleToStr(endTime, endTimeInText);                                  // Convert number of overflows to a string
MOVW	R0, #lo_addr(_endTime+0)
MOVT	R0, #hi_addr(_endTime+0)
LDRD	R0, R1, [R0, #0]
VMOV	S0, R0
VMOV	S1, R1
MOVW	R0, #lo_addr(_endTimeInText+0)
MOVT	R0, #hi_addr(_endTimeInText+0)
BL	_LongDoubleToStr+0
;input_capture_demo.c,135 :: 		UART1_Write_Text("Time read from CCP1 Register: ");
MOVW	R0, #lo_addr(?lstr8_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr8_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,136 :: 		UART1_Write_Text(endTimeInText);
MOVW	R0, #lo_addr(_endTimeInText+0)
MOVT	R0, #hi_addr(_endTimeInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,137 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr9_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr9_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,140 :: 		LongToStr(pulseTicks, ticksInText);                                  // Convert number of ticks to a string
MOVW	R0, #lo_addr(_pulseTicks+0)
MOVT	R0, #hi_addr(_pulseTicks+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_ticksInText+0)
MOVT	R1, #hi_addr(_ticksInText+0)
BL	_LongToStr+0
;input_capture_demo.c,141 :: 		UART1_Write_Text("Total number of ticks between events: ");
MOVW	R0, #lo_addr(?lstr10_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr10_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,142 :: 		UART1_Write_Text(ticksInText);
MOVW	R0, #lo_addr(_ticksInText+0)
MOVT	R0, #hi_addr(_ticksInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,143 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr11_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr11_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,145 :: 		LongDoubleToStr(inputPeriod, periodInText);                               // Convert period float to string
MOVW	R0, #lo_addr(_inputPeriod+0)
MOVT	R0, #hi_addr(_inputPeriod+0)
LDRD	R0, R1, [R0, #0]
VMOV	S0, R0
VMOV	S1, R1
MOVW	R0, #lo_addr(_periodInText+0)
MOVT	R0, #hi_addr(_periodInText+0)
BL	_LongDoubleToStr+0
;input_capture_demo.c,146 :: 		UART1_Write_Text("Period of incoming signal (ms): ");
MOVW	R0, #lo_addr(?lstr12_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr12_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,147 :: 		UART1_Write_Text(periodInText);
MOVW	R0, #lo_addr(_periodInText+0)
MOVT	R0, #hi_addr(_periodInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,148 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr13_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr13_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,150 :: 		LongDoubleToStr(inputFrequency, frequencyInText);                         // Convert Frequency float to string
MOVW	R0, #lo_addr(_inputFrequency+0)
MOVT	R0, #hi_addr(_inputFrequency+0)
LDRD	R0, R1, [R0, #0]
VMOV	S0, R0
VMOV	S1, R1
MOVW	R0, #lo_addr(_frequencyInText+0)
MOVT	R0, #hi_addr(_frequencyInText+0)
BL	_LongDoubleToStr+0
;input_capture_demo.c,151 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R0, #lo_addr(?lstr14_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr14_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,152 :: 		UART1_Write_Text(frequencyInText);
MOVW	R0, #lo_addr(_frequencyInText+0)
MOVT	R0, #hi_addr(_frequencyInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,153 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr15_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr15_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,155 :: 		LongToStr(inputEventCounter, eventCounterInText);                    // Convert input event counter long to string
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_eventCounterInText+0)
MOVT	R1, #hi_addr(_eventCounterInText+0)
BL	_LongToStr+0
;input_capture_demo.c,156 :: 		UART1_Write_Text("Number of input capture events: ");
MOVW	R0, #lo_addr(?lstr16_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr16_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,157 :: 		UART1_Write_Text(eventCounterInText);
MOVW	R0, #lo_addr(_eventCounterInText+0)
MOVT	R0, #hi_addr(_eventCounterInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,158 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R0, #lo_addr(?lstr17_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr17_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,160 :: 		inputEventCounter = 0;                                               // Reset input event counter for next
MOVS	R1, #0
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
STR	R1, [R0, #0]
;input_capture_demo.c,161 :: 		print_counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_print_counter+0)
MOVT	R0, #hi_addr(_print_counter+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,162 :: 		}
IT	AL
BAL	L_main5
;input_capture_demo.c,95 :: 		if (poll_flag && print_counter >= 15) {
L__main16:
L__main15:
;input_capture_demo.c,164 :: 		else if (poll_flag && !inputEventCounter) {
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
;input_capture_demo.c,165 :: 		UART1_Write_Text("No Events Detected\n\n\r");
MOVW	R0, #lo_addr(?lstr18_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr18_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,166 :: 		poll_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,167 :: 		inputEventCounter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
STR	R1, [R0, #0]
;input_capture_demo.c,164 :: 		else if (poll_flag && !inputEventCounter) {
L__main18:
L__main17:
;input_capture_demo.c,168 :: 		}
L_main5:
;input_capture_demo.c,169 :: 		}
IT	AL
BAL	L_main0
;input_capture_demo.c,170 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_init_tim2_input_capture:
;input_capture_demo.c,174 :: 		void init_tim2_input_capture() {
SUB	SP, SP, #36
STR	LR, [SP, #0]
;input_capture_demo.c,176 :: 		RCC_APB1ENR.TIM2EN = 1;                                                    // Enable clock gating for timer module 2
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R2, [R0, #0]
;input_capture_demo.c,177 :: 		TIM2_CR1.CEN = 0;                                                          // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,178 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                                // Set timer 2 prescaler (need to determine value)
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
STR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;input_capture_demo.c,179 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                             // Set timer 2 overflow value at max
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
STR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,180 :: 		TIM2_CR1 |= 0x10;                                                          // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,181 :: 		TIM2_CCMR1_Input |= 0x01;                                                  // Set capture channel 1 as input (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;input_capture_demo.c,182 :: 		TIM2_CCER.CC1P = 1;                                                        // Set capture on rising edge event
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,183 :: 		TIM2_CCER.CC1E = 1;                                                        // Enable capture on channel 1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,184 :: 		TIM2_DIER.CC1IE = 1;                                                       // Enable capture 1 interrupt
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,185 :: 		TIM2_DIER.UIE = 1;                                                         // CC1 Update Interrupt Enable
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,186 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                              // Enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;input_capture_demo.c,188 :: 		TIM2_CNT = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
STR	R1, [R0, #0]
;input_capture_demo.c,189 :: 		TIM2_CR1.CEN = 1;                                                          // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,191 :: 		timer2_overflow_frequency = (long double) MCU_FREQUENCY / ((ENCODER_TIM_PSC + 1) * (ENCODER_TIM_RELOAD + 1));
MOVW	R0, #lo_addr(_MCU_FREQUENCY+0)
MOVT	R0, #hi_addr(_MCU_FREQUENCY+0)
VLDR	#1, S0, [R0, #0]
VMOV	R0, S0
BL	__UnsignedIntegralToLongDouble+0
MOV	R2, R0
MOV	R3, R1
LDR	R0, [SP, #20]
STRD	R2, R3, [SP, #28]
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
UXTH	R1, R1
LDR	R0, [SP, #12]
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [SP, #20]
MULS	R0, R1, R0
BL	__UnsignedIntegralToLongDouble+0
STRD	R0, R1, [SP, #12]
VLDR	#1, D0, [SP, #28]
STRD	R2, R3, [SP, #4]
LDRD	R2, R3, [SP, #12]
VMOV	R0, S0
VMOV	R1, S1
BL	__Div_DP+0
STRD	R0, R1, [SP, #12]
LDRD	R2, R3, [SP, #4]
MOVW	R0, #lo_addr(_timer2_overflow_frequency+0)
MOVT	R0, #hi_addr(_timer2_overflow_frequency+0)
STRD	R1, R2, [SP, #4]
LDRD	R1, R2, [SP, #12]
STRD	R1, R2, [R0, #0]
LDRD	R1, R2, [SP, #4]
;input_capture_demo.c,192 :: 		timer2_overflow_period_ms = (long double) 100000 / timer2_overflow_frequency;
MOVW	R0, #20480
MOVT	R0, #18371
MOVS	R1, #0
VMOV	S0, R0
VMOV	S1, R1
STRD	R2, R3, [SP, #4]
LDRD	R2, R3, [SP, #12]
VMOV	R0, S0
VMOV	R1, S1
BL	__Div_DP+0
LDRD	R2, R3, [SP, #4]
MOVW	R2, #lo_addr(_timer2_overflow_period_ms+0)
MOVT	R2, #hi_addr(_timer2_overflow_period_ms+0)
STRD	R0, R1, [R2, #0]
;input_capture_demo.c,193 :: 		timer2_tick_period_ms = (long double) timer2_overflow_period_ms / (ENCODER_TIM_RELOAD + 1);
MOV	R2, R0
MOV	R3, R1
LDR	R0, [SP, #20]
STRD	R2, R3, [SP, #20]
BL	__UnsignedIntegralToLongDouble+0
STRD	R0, R1, [SP, #12]
VLDR	#1, D0, [SP, #20]
STRD	R2, R3, [SP, #4]
LDRD	R2, R3, [SP, #12]
VMOV	R0, S0
VMOV	R1, S1
BL	__Div_DP+0
LDRD	R2, R3, [SP, #4]
MOVW	R2, #lo_addr(_timer2_tick_period_ms+0)
MOVT	R2, #hi_addr(_timer2_tick_period_ms+0)
STRD	R0, R1, [R2, #0]
;input_capture_demo.c,194 :: 		}
L_end_init_tim2_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _init_tim2_input_capture
_timer2_interrupt:
;input_capture_demo.c,197 :: 		void timer2_interrupt() iv IVT_INT_TIM2 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,198 :: 		TIM2_CNT = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
STR	R1, [R0, #0]
;input_capture_demo.c,199 :: 		NVIC_IntDisable(IVT_INT_TIM2);                                             // Disable timer 2 interrupts
MOVW	R0, #44
BL	_NVIC_IntDisable+0
;input_capture_demo.c,201 :: 		if(TIM2_SR.UIF == 1) {                                                     // If timer 2 overflow event occured
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_interrupt9
;input_capture_demo.c,202 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,203 :: 		overflowCount++;                                                        // Increment overflow counter
MOVW	R1, #lo_addr(_overflowCount+0)
MOVT	R1, #hi_addr(_overflowCount+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;input_capture_demo.c,204 :: 		}
L_timer2_interrupt9:
;input_capture_demo.c,206 :: 		if (TIM2_SR.CC1IF == 1) {                                                  // If Input Capture event occured
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_interrupt10
;input_capture_demo.c,207 :: 		TIM2_SR.CC1IF = 0;                                                      // Clear input capture event bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,208 :: 		endTime = TIM2_CCR1;                                                // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
VLDR	#1, S0, [R0, #0]
VMOV	R0, S0
BL	__UnsignedIntegralToLongDouble+0
MOVW	R2, #lo_addr(_endTime+0)
MOVT	R2, #hi_addr(_endTime+0)
STRD	R0, R1, [R2, #0]
;input_capture_demo.c,210 :: 		overflowCountTemp = overflowCount;
MOVW	R2, #lo_addr(_overflowCount+0)
MOVT	R2, #hi_addr(_overflowCount+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_overflowCountTemp+0)
MOVT	R0, #hi_addr(_overflowCountTemp+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,211 :: 		overflowCount = 0;                                                      // Reset the overflow counter to 0
MOVS	R0, #0
STRH	R0, [R2, #0]
;input_capture_demo.c,212 :: 		inputEventCounter++;                                                    // Increment total input capture event counter
MOVW	R1, #lo_addr(_inputEventCounter+0)
MOVT	R1, #hi_addr(_inputEventCounter+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;input_capture_demo.c,213 :: 		}
L_timer2_interrupt10:
;input_capture_demo.c,217 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                              // Re-enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;input_capture_demo.c,219 :: 		}
L_end_timer2_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _timer2_interrupt
_external_interrupt:
;input_capture_demo.c,223 :: 		void external_interrupt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
;input_capture_demo.c,225 :: 		EXTI_PR.B10 = 1;                                                           // Clear external interrupt bit
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,226 :: 		poll_flag = 1;                                                             // Set poll flag for main
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,228 :: 		}
L_end_external_interrupt:
BX	LR
; end of _external_interrupt
_init_hardware:
;input_capture_demo.c,232 :: 		void init_hardware() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,235 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                        // Enable digital output on E10
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;input_capture_demo.c,236 :: 		GPIOE_ODR.B10 = 0;                                                         // Set pin E10 low
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,239 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
BL	_GPIO_Alternate_Function_Enable+0
;input_capture_demo.c,250 :: 		}
L_end_init_hardware:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_hardware
_init_serial_comm:
;input_capture_demo.c,254 :: 		void init_serial_comm() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,256 :: 		UART1_Init(UART_BAUD_RATE);                                                // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;input_capture_demo.c,257 :: 		Delay_ms(200);                                                             // Wait for UART to stabilize
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
;input_capture_demo.c,258 :: 		}
L_end_init_serial_comm:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_serial_comm
_init_timer3:
;input_capture_demo.c,262 :: 		void init_timer3(){                                                              // Interrupts every 100ms
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,263 :: 		RCC_APB1ENR.TIM3EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,264 :: 		TIM3_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,265 :: 		TIM3_PSC = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;input_capture_demo.c,266 :: 		TIM3_ARR = 59999;
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,267 :: 		NVIC_IntEnable(IVT_INT_TIM3);
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;input_capture_demo.c,268 :: 		TIM3_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;input_capture_demo.c,269 :: 		TIM3_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,270 :: 		}
L_end_init_timer3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_timer3
_Timer3_interrupt:
;input_capture_demo.c,272 :: 		void Timer3_interrupt() iv IVT_INT_TIM3 {
;input_capture_demo.c,273 :: 		TIM3_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,274 :: 		poll_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,275 :: 		print_counter++;
MOVW	R1, #lo_addr(_print_counter+0)
MOVT	R1, #hi_addr(_print_counter+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;input_capture_demo.c,276 :: 		}
L_end_Timer3_interrupt:
BX	LR
; end of _Timer3_interrupt
