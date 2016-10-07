_main:
;input_capture_demo.c,64 :: 		void main() {
SUB	SP, SP, #16
;input_capture_demo.c,67 :: 		init_hardware();                                                           // Initialize GPIO hardware
BL	_init_hardware+0
;input_capture_demo.c,68 :: 		init_timer3();
BL	_init_timer3+0
;input_capture_demo.c,69 :: 		init_tim2_input_capture();                                                 // Initialize input capture
BL	_init_tim2_input_capture+0
;input_capture_demo.c,70 :: 		init_serial_comm();                                                        // Initialize UART1 (Wired)
BL	_init_serial_comm+0
;input_capture_demo.c,73 :: 		strncpy(testOutput, "\rProgram Has Started\n\r", STR_MAX);
MOVW	R0, #lo_addr(?lstr1_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr1_input_capture_demo+0)
MOVS	R2, #15
SXTH	R2, R2
MOV	R1, R0
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
BL	_strncpy+0
;input_capture_demo.c,74 :: 		UART1_Write_Text(testOutput);
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,77 :: 		while(1) {
L_main0:
;input_capture_demo.c,78 :: 		if (poll_flag && print_counter >= 15) {
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
;input_capture_demo.c,79 :: 		poll_flag = 0;                                                       // Clear state entry flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,81 :: 		pulseTicks = ((long) overflowCountTemp * ENCODER_TIM_RELOAD) + endTime;
MOVW	R0, #lo_addr(_overflowCountTemp+0)
MOVT	R0, #hi_addr(_overflowCountTemp+0)
STR	R0, [SP, #12]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
STR	R0, [SP, #8]
LDRH	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_endTime+0)
MOVT	R0, #hi_addr(_endTime+0)
LDR	R0, [R0, #0]
ADDS	R2, R1, R0
MOVW	R0, #lo_addr(_pulseTicks+0)
MOVT	R0, #hi_addr(_pulseTicks+0)
STR	R2, [R0, #0]
;input_capture_demo.c,82 :: 		inputPeriod = (long double) pulseTicks * timePerTick;                      // Calculate period in ms
MOV	R0, R2
BL	__UnsignedIntegralToLongDouble+0
MOVW	R2, #lo_addr(_timePerTick+0)
MOVT	R2, #hi_addr(_timePerTick+0)
STR	R2, [SP, #4]
VLDR	#1, D0, [R2, #0]
VMOV	R2, S0
VMOV	R3, S1
BL	__Mul_DP+0
MOVW	R2, #lo_addr(_inputPeriod+0)
MOVT	R2, #hi_addr(_inputPeriod+0)
STR	R2, [SP, #0]
STRD	R0, R1, [R2, #0]
;input_capture_demo.c,83 :: 		inputFrequency = 1000000.0 / inputPeriod;                            // Calculate frequency in Hz
MOVW	R0, #9216
MOVT	R0, #18804
VMOV	S0, R0
VMOV	R0, S0
BL	__FloatToLongDouble+0
LDR	R2, [SP, #0]
VLDR	#1, D0, [R2, #0]
VMOV	R2, S0
VMOV	R3, S1
BL	__Div_DP+0
BL	__LongDoubleToFloat+0
VMOV	S0, R0
MOVW	R0, #lo_addr(_inputFrequency+0)
MOVT	R0, #hi_addr(_inputFrequency+0)
VSTR	#1, S0, [R0, #0]
;input_capture_demo.c,84 :: 		totalOverflowTime = (long) overflowCountTemp * ENCODER_TIM_RELOAD;
LDR	R0, [SP, #12]
LDRH	R1, [R0, #0]
LDR	R0, [SP, #8]
LDRH	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_totalOverflowTime+0)
MOVT	R0, #hi_addr(_totalOverflowTime+0)
STR	R1, [R0, #0]
;input_capture_demo.c,87 :: 		FloatToStr(timePerTick, timePerTickInText);                                  // Convert number of overflows to a string
LDR	R0, [SP, #4]
VLDR	#1, D0, [R0, #0]
VMOV	R0, S0
VMOV	R1, S1
BL	__LongDoubleToFloat+0
VMOV	S0, R0
MOVW	R0, #lo_addr(_timePerTickInText+0)
MOVT	R0, #hi_addr(_timePerTickInText+0)
BL	_FloatToStr+0
;input_capture_demo.c,88 :: 		UART1_Write_Text("Time per tick: ");
MOVW	R0, #lo_addr(?lstr2_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr2_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,89 :: 		UART1_Write_Text(timePerTickInText);
MOVW	R0, #lo_addr(_timePerTickInText+0)
MOVT	R0, #hi_addr(_timePerTickInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,90 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr3_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr3_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,93 :: 		IntToStr(overflowCountTemp, overflowsInText);                                  // Convert number of overflows to a string
MOVW	R0, #lo_addr(_overflowCountTemp+0)
MOVT	R0, #hi_addr(_overflowCountTemp+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_overflowsInText+0)
MOVT	R1, #hi_addr(_overflowsInText+0)
BL	_IntToStr+0
;input_capture_demo.c,94 :: 		UART1_Write_Text("Total number of timer overflows: ");
MOVW	R0, #lo_addr(?lstr4_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr4_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,95 :: 		UART1_Write_Text(overflowsInText);
MOVW	R0, #lo_addr(_overflowsInText+0)
MOVT	R0, #hi_addr(_overflowsInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,96 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr5_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr5_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,99 :: 		FloatToStr(totalOverflowTime, totalOverflowTimeInText);                                  // Convert number of overflows to a string
MOVW	R0, #lo_addr(_totalOverflowTime+0)
MOVT	R0, #hi_addr(_totalOverflowTime+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S0, S0
MOVW	R0, #lo_addr(_totalOverflowTimeInText+0)
MOVT	R0, #hi_addr(_totalOverflowTimeInText+0)
BL	_FloatToStr+0
;input_capture_demo.c,100 :: 		UART1_Write_Text("Calculated Overflow Time : ");
MOVW	R0, #lo_addr(?lstr6_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr6_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,101 :: 		UART1_Write_Text(totalOverflowTimeInText);
MOVW	R0, #lo_addr(_totalOverflowTimeInText+0)
MOVT	R0, #hi_addr(_totalOverflowTimeInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,102 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr7_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr7_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,105 :: 		FloatToStr(endTime, endTimeInText);                                  // Convert number of overflows to a string
MOVW	R0, #lo_addr(_endTime+0)
MOVT	R0, #hi_addr(_endTime+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S0, S0
MOVW	R0, #lo_addr(_endTimeInText+0)
MOVT	R0, #hi_addr(_endTimeInText+0)
BL	_FloatToStr+0
;input_capture_demo.c,106 :: 		UART1_Write_Text("Time read from CCP1 Register: ");
MOVW	R0, #lo_addr(?lstr8_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr8_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,107 :: 		UART1_Write_Text(endTimeInText);
MOVW	R0, #lo_addr(_endTimeInText+0)
MOVT	R0, #hi_addr(_endTimeInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,108 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr9_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr9_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,111 :: 		LongToStr(pulseTicks, ticksInText);                                  // Convert number of ticks to a string
MOVW	R0, #lo_addr(_pulseTicks+0)
MOVT	R0, #hi_addr(_pulseTicks+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_ticksInText+0)
MOVT	R1, #hi_addr(_ticksInText+0)
BL	_LongToStr+0
;input_capture_demo.c,112 :: 		UART1_Write_Text("Total number of ticks between events: ");
MOVW	R0, #lo_addr(?lstr10_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr10_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,113 :: 		UART1_Write_Text(ticksInText);
MOVW	R0, #lo_addr(_ticksInText+0)
MOVT	R0, #hi_addr(_ticksInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,114 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr11_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr11_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,116 :: 		FloatToStr(inputPeriod, periodInText);                               // Convert period float to string
MOVW	R0, #lo_addr(_inputPeriod+0)
MOVT	R0, #hi_addr(_inputPeriod+0)
VLDR	#1, D0, [R0, #0]
VMOV	R0, S0
VMOV	R1, S1
BL	__LongDoubleToFloat+0
VMOV	S0, R0
MOVW	R0, #lo_addr(_periodInText+0)
MOVT	R0, #hi_addr(_periodInText+0)
BL	_FloatToStr+0
;input_capture_demo.c,117 :: 		UART1_Write_Text("Period of incoming signal (ms): ");
MOVW	R0, #lo_addr(?lstr12_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr12_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,118 :: 		UART1_Write_Text(periodInText);
MOVW	R0, #lo_addr(_periodInText+0)
MOVT	R0, #hi_addr(_periodInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,119 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr13_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr13_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,121 :: 		FloatToStr(inputFrequency, frequencyInText);                         // Convert Frequency float to string
MOVW	R0, #lo_addr(_inputFrequency+0)
MOVT	R0, #hi_addr(_inputFrequency+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_frequencyInText+0)
MOVT	R0, #hi_addr(_frequencyInText+0)
BL	_FloatToStr+0
;input_capture_demo.c,122 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R0, #lo_addr(?lstr14_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr14_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,123 :: 		UART1_Write_Text(frequencyInText);
MOVW	R0, #lo_addr(_frequencyInText+0)
MOVT	R0, #hi_addr(_frequencyInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,124 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr15_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr15_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,126 :: 		LongToStr(inputEventCounter, eventCounterInText);                    // Convert input event counter long to string
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_eventCounterInText+0)
MOVT	R1, #hi_addr(_eventCounterInText+0)
BL	_LongToStr+0
;input_capture_demo.c,127 :: 		UART1_Write_Text("Number of input capture events: ");
MOVW	R0, #lo_addr(?lstr16_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr16_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,128 :: 		UART1_Write_Text(eventCounterInText);
MOVW	R0, #lo_addr(_eventCounterInText+0)
MOVT	R0, #hi_addr(_eventCounterInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,129 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R0, #lo_addr(?lstr17_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr17_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,131 :: 		inputEventCounter = 0;                                               // Reset input event counter for next
MOVS	R1, #0
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
STR	R1, [R0, #0]
;input_capture_demo.c,132 :: 		print_counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_print_counter+0)
MOVT	R0, #hi_addr(_print_counter+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,133 :: 		}
IT	AL
BAL	L_main5
;input_capture_demo.c,78 :: 		if (poll_flag && print_counter >= 15) {
L__main16:
L__main15:
;input_capture_demo.c,135 :: 		else if (poll_flag && !inputEventCounter) {
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
;input_capture_demo.c,136 :: 		UART1_Write_Text("No Events Detected\n\n\r");
MOVW	R0, #lo_addr(?lstr18_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr18_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,137 :: 		poll_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,138 :: 		inputEventCounter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
STR	R1, [R0, #0]
;input_capture_demo.c,135 :: 		else if (poll_flag && !inputEventCounter) {
L__main18:
L__main17:
;input_capture_demo.c,139 :: 		}
L_main5:
;input_capture_demo.c,140 :: 		}
IT	AL
BAL	L_main0
;input_capture_demo.c,141 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_init_tim2_input_capture:
;input_capture_demo.c,145 :: 		void init_tim2_input_capture() {
SUB	SP, SP, #20
STR	LR, [SP, #0]
;input_capture_demo.c,147 :: 		RCC_APB1ENR.TIM2EN = 1;                                                    // Enable clock gating for timer module 2
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R2, [R0, #0]
;input_capture_demo.c,148 :: 		TIM2_CR1.CEN = 0;                                                          // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,149 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                                // Set timer 2 prescaler (need to determine value)
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;input_capture_demo.c,150 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                             // Set timer 2 overflow value at max
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,151 :: 		TIM2_CR1 |= 0x10;                                                          // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,152 :: 		TIM2_CCMR1_Input |= 0x01;                                                  // Set capture channel 1 as input (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;input_capture_demo.c,153 :: 		TIM2_CCER.CC1P = 1;                                                        // Set capture on rising edge event
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,154 :: 		TIM2_CCER.CC1E = 1;                                                        // Enable capture on channel 1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,155 :: 		TIM2_DIER.CC1IE = 1;                                                       // Enable capture 1 interrupt
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,156 :: 		TIM2_DIER.UIE = 1;                                                         // CC1 Update Interrupt Enable
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,157 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                              // Enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;input_capture_demo.c,159 :: 		TIM2_CNT = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
STR	R1, [R0, #0]
;input_capture_demo.c,160 :: 		TIM2_CR1.CEN = 1;                                                          // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,162 :: 		timePerTick = (long double) 1000000.0 / MCU_FREQUENCY;                                //Time per tick in ms
MOVW	R0, #lo_addr(_MCU_FREQUENCY+0)
MOVT	R0, #hi_addr(_MCU_FREQUENCY+0)
VLDR	#1, S0, [R0, #0]
VMOV	R0, S0
BL	__UnsignedIntegralToLongDouble+0
STRD	R0, R1, [SP, #12]
MOV	R0, #0
MOVW	R1, #33920
MOVT	R1, #16686
VMOV	S0, R0
VMOV	S1, R1
STRD	R2, R3, [SP, #4]
LDRD	R2, R3, [SP, #12]
VMOV	R0, S0
VMOV	R1, S1
BL	__Div_DP+0
LDRD	R2, R3, [SP, #4]
MOVW	R2, #lo_addr(_timePerTick+0)
MOVT	R2, #hi_addr(_timePerTick+0)
STRD	R0, R1, [R2, #0]
;input_capture_demo.c,163 :: 		}
L_end_init_tim2_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _init_tim2_input_capture
_timer2_interrupt:
;input_capture_demo.c,166 :: 		void timer2_interrupt() iv IVT_INT_TIM2 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,167 :: 		TIM2_CNT = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
STR	R1, [R0, #0]
;input_capture_demo.c,168 :: 		NVIC_IntDisable(IVT_INT_TIM2);                                             // Disable timer 2 interrupts
MOVW	R0, #44
BL	_NVIC_IntDisable+0
;input_capture_demo.c,170 :: 		if(TIM2_SR.UIF == 1) {                                                     // If timer 2 overflow event occured
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_interrupt9
;input_capture_demo.c,171 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,172 :: 		overflowCount++;                                                        // Increment overflow counter
MOVW	R1, #lo_addr(_overflowCount+0)
MOVT	R1, #hi_addr(_overflowCount+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;input_capture_demo.c,173 :: 		}
L_timer2_interrupt9:
;input_capture_demo.c,175 :: 		if (TIM2_SR.CC1IF == 1) {                                                  // If Input Capture event occured
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_interrupt10
;input_capture_demo.c,176 :: 		TIM2_SR.CC1IF = 0;                                                      // Clear input capture event bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,177 :: 		endTime = TIM2_CCR1;                                                // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_endTime+0)
MOVT	R0, #hi_addr(_endTime+0)
STR	R1, [R0, #0]
;input_capture_demo.c,179 :: 		overflowCountTemp = overflowCount;
MOVW	R2, #lo_addr(_overflowCount+0)
MOVT	R2, #hi_addr(_overflowCount+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_overflowCountTemp+0)
MOVT	R0, #hi_addr(_overflowCountTemp+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,180 :: 		overflowCount = 0;                                                      // Reset the overflow counter to 0
MOVS	R0, #0
STRH	R0, [R2, #0]
;input_capture_demo.c,181 :: 		inputEventCounter++;                                                    // Increment total input capture event counter
MOVW	R1, #lo_addr(_inputEventCounter+0)
MOVT	R1, #hi_addr(_inputEventCounter+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;input_capture_demo.c,182 :: 		}
L_timer2_interrupt10:
;input_capture_demo.c,186 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                              // Re-enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;input_capture_demo.c,188 :: 		}
L_end_timer2_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _timer2_interrupt
_external_interrupt:
;input_capture_demo.c,192 :: 		void external_interrupt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
;input_capture_demo.c,194 :: 		EXTI_PR.B10 = 1;                                                           // Clear external interrupt bit
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,195 :: 		poll_flag = 1;                                                             // Set poll flag for main
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,197 :: 		}
L_end_external_interrupt:
BX	LR
; end of _external_interrupt
_init_hardware:
;input_capture_demo.c,201 :: 		void init_hardware() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,204 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                        // Enable digital output on E10
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;input_capture_demo.c,205 :: 		GPIOE_ODR.B10 = 0;                                                         // Set pin E10 low
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,208 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
BL	_GPIO_Alternate_Function_Enable+0
;input_capture_demo.c,219 :: 		}
L_end_init_hardware:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_hardware
_init_serial_comm:
;input_capture_demo.c,223 :: 		void init_serial_comm() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,225 :: 		UART1_Init(UART_BAUD_RATE);                                                // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;input_capture_demo.c,226 :: 		Delay_ms(200);                                                             // Wait for UART to stabilize
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
;input_capture_demo.c,227 :: 		}
L_end_init_serial_comm:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_serial_comm
_init_timer3:
;input_capture_demo.c,231 :: 		void init_timer3(){                                                              // Interrupts every 100ms
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,232 :: 		RCC_APB1ENR.TIM3EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,233 :: 		TIM3_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,234 :: 		TIM3_PSC = 279;
MOVW	R1, #279
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;input_capture_demo.c,235 :: 		TIM3_ARR = 59999;
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,236 :: 		NVIC_IntEnable(IVT_INT_TIM3);
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;input_capture_demo.c,237 :: 		TIM3_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;input_capture_demo.c,238 :: 		TIM3_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,239 :: 		}
L_end_init_timer3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_timer3
_Timer3_interrupt:
;input_capture_demo.c,241 :: 		void Timer3_interrupt() iv IVT_INT_TIM3 {
;input_capture_demo.c,242 :: 		TIM3_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,243 :: 		poll_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,244 :: 		print_counter++;
MOVW	R1, #lo_addr(_print_counter+0)
MOVT	R1, #hi_addr(_print_counter+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;input_capture_demo.c,245 :: 		}
L_end_Timer3_interrupt:
BX	LR
; end of _Timer3_interrupt
