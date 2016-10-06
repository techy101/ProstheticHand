_main:
;input_capture_demo.c,57 :: 		void main() {
;input_capture_demo.c,60 :: 		init_hardware();                                                           // Initialize GPIO hardware
BL	_init_hardware+0
;input_capture_demo.c,61 :: 		init_tim2_input_capture();                                                 // Initialize input capture
BL	_init_tim2_input_capture+0
;input_capture_demo.c,62 :: 		init_serial_comm();                                                        // Initialize UART1 (Wired)
BL	_init_serial_comm+0
;input_capture_demo.c,65 :: 		strncpy(testOutput, "\rProgram Has Started\n\r", STR_MAX);
MOVW	R0, #lo_addr(?lstr1_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr1_input_capture_demo+0)
MOVS	R2, #100
SXTH	R2, R2
MOV	R1, R0
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
BL	_strncpy+0
;input_capture_demo.c,66 :: 		UART1_Write_Text(testOutput);
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,69 :: 		while(1) {
L_main0:
;input_capture_demo.c,70 :: 		if (poll_flag && inputEventCounter >= 100) {
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main16
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
LDR	R0, [R0, #0]
CMP	R0, #100
IT	CC
BCC	L__main15
L__main14:
;input_capture_demo.c,71 :: 		poll_flag = 0;                                                       // Clear state entry flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,74 :: 		inputPeriod = (float) pulseTicks * timePerTick;                      // Calculate period in us
MOVW	R0, #lo_addr(_pulseTicks+0)
MOVT	R0, #hi_addr(_pulseTicks+0)
VLDR	#1, D0, [R0, #0]
VMOV	R0, S0
VMOV	R1, S1
BL	__UnsignedLongLongToFloat+0
VMOV	S0, R0
MOVW	R0, #lo_addr(_timePerTick+0)
MOVT	R0, #hi_addr(_timePerTick+0)
VLDR	#1, S1, [R0, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_inputPeriod+0)
MOVT	R0, #hi_addr(_inputPeriod+0)
VSTR	#1, S1, [R0, #0]
;input_capture_demo.c,75 :: 		inputFrequency = 1000000.0 / inputPeriod;                            // Calculate frequency in Hz
MOVW	R0, #9216
MOVT	R0, #18804
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_inputFrequency+0)
MOVT	R0, #hi_addr(_inputFrequency+0)
VSTR	#1, S0, [R0, #0]
;input_capture_demo.c,78 :: 		IntToStr(overflowCount, overflowsInText);                                  // Convert number of overflows to a string
MOVW	R0, #lo_addr(_overflowCount+0)
MOVT	R0, #hi_addr(_overflowCount+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_overflowsInText+0)
MOVT	R1, #hi_addr(_overflowsInText+0)
BL	_IntToStr+0
;input_capture_demo.c,79 :: 		UART1_Write_Text("Total number of timer overflows: ");
MOVW	R0, #lo_addr(?lstr2_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr2_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,80 :: 		UART1_Write_Text(overflowsInText);
MOVW	R0, #lo_addr(_overflowsInText+0)
MOVT	R0, #hi_addr(_overflowsInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,81 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr3_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr3_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,84 :: 		LongLongUnsignedToStr(pulseTicks, ticksInText);                                  // Convert number of ticks to a string
MOVW	R0, #lo_addr(_pulseTicks+0)
MOVT	R0, #hi_addr(_pulseTicks+0)
LDRD	R0, R1, [R0, #0]
MOVW	R2, #lo_addr(_ticksInText+0)
MOVT	R2, #hi_addr(_ticksInText+0)
BL	_LongLongUnsignedToStr+0
;input_capture_demo.c,85 :: 		UART1_Write_Text("Total number of ticks between events: ");
MOVW	R0, #lo_addr(?lstr4_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr4_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,86 :: 		UART1_Write_Text(ticksInText);
MOVW	R0, #lo_addr(_ticksInText+0)
MOVT	R0, #hi_addr(_ticksInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,87 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr5_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr5_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,89 :: 		FloatToStr(inputPeriod, periodInText);                               // Convert period float to string
MOVW	R0, #lo_addr(_inputPeriod+0)
MOVT	R0, #hi_addr(_inputPeriod+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_periodInText+0)
MOVT	R0, #hi_addr(_periodInText+0)
BL	_FloatToStr+0
;input_capture_demo.c,90 :: 		UART1_Write_Text("Period of incoming signal (us): ");
MOVW	R0, #lo_addr(?lstr6_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr6_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,91 :: 		UART1_Write_Text(periodInText);
MOVW	R0, #lo_addr(_periodInText+0)
MOVT	R0, #hi_addr(_periodInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,92 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr7_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr7_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,94 :: 		FloatToStr(inputFrequency, frequencyInText);                         // Convert Frequency float to string
MOVW	R0, #lo_addr(_inputFrequency+0)
MOVT	R0, #hi_addr(_inputFrequency+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_frequencyInText+0)
MOVT	R0, #hi_addr(_frequencyInText+0)
BL	_FloatToStr+0
;input_capture_demo.c,95 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R0, #lo_addr(?lstr8_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr8_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,96 :: 		UART1_Write_Text(frequencyInText);
MOVW	R0, #lo_addr(_frequencyInText+0)
MOVT	R0, #hi_addr(_frequencyInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,97 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr9_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr9_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,99 :: 		LongToStr(inputEventCounter, eventCounterInText);                    // Convert input event counter long to string
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_eventCounterInText+0)
MOVT	R1, #hi_addr(_eventCounterInText+0)
BL	_LongToStr+0
;input_capture_demo.c,100 :: 		UART1_Write_Text("Number of input capture events: ");
MOVW	R0, #lo_addr(?lstr10_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr10_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,101 :: 		UART1_Write_Text(eventCounterInText);
MOVW	R0, #lo_addr(_eventCounterInText+0)
MOVT	R0, #hi_addr(_eventCounterInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,102 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R0, #lo_addr(?lstr11_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr11_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,104 :: 		inputEventCounter = 0;                                               // Reset input event counter for next
MOVS	R1, #0
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
STR	R1, [R0, #0]
;input_capture_demo.c,105 :: 		}
IT	AL
BAL	L_main5
;input_capture_demo.c,70 :: 		if (poll_flag && inputEventCounter >= 100) {
L__main16:
L__main15:
;input_capture_demo.c,107 :: 		else if (poll_flag && !inputEventCounter) {
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
;input_capture_demo.c,108 :: 		UART1_Write_Text("No Events Detected\n\n\r");
MOVW	R0, #lo_addr(?lstr12_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr12_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,109 :: 		poll_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,110 :: 		inputEventCounter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
STR	R1, [R0, #0]
;input_capture_demo.c,107 :: 		else if (poll_flag && !inputEventCounter) {
L__main18:
L__main17:
;input_capture_demo.c,111 :: 		}
L_main5:
;input_capture_demo.c,112 :: 		}
IT	AL
BAL	L_main0
;input_capture_demo.c,113 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_init_tim2_input_capture:
;input_capture_demo.c,117 :: 		void init_tim2_input_capture() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;input_capture_demo.c,119 :: 		RCC_APB1ENR.TIM2EN = 1;                                                    // Enable clock gating for timer module 2
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R2, [R0, #0]
;input_capture_demo.c,120 :: 		TIM2_CR1.CEN = 0;                                                          // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,121 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                                // Set timer 2 prescaler (need to determine value)
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;input_capture_demo.c,122 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                             // Set timer 2 overflow value at max
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
STR	R0, [SP, #4]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,123 :: 		TIM2_CR1 |= 0x10;                                                          // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,124 :: 		TIM2_CCMR1_Input |= 0x01;                                                  // Set capture channel 1 as input (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;input_capture_demo.c,125 :: 		TIM2_CCER.CC1P = 1;                                                        // Set capture on rising edge event
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,126 :: 		TIM2_CCER.CC1E = 1;                                                        // Enable capture on channel 1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,127 :: 		TIM2_DIER.CC1IE = 1;                                                       // Enable capture 1 interrupt
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,128 :: 		TIM2_DIER.UIE = 1;                                                         // CC1 Update Interrupt Enable
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,129 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                              // Enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;input_capture_demo.c,130 :: 		EnableInterrupts();                                                      // Probably unneeded due to previous line
BL	_EnableInterrupts+0
;input_capture_demo.c,131 :: 		TIM2_CR1.CEN = 1;                                                          // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,133 :: 		timePerTick = (float) (1000.0 * ENCODER_TIM_OVERFLOW) / ENCODER_TIM_RELOAD;
MOVW	R0, #lo_addr(_ENCODER_TIM_OVERFLOW+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_OVERFLOW+0)
LDRH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #0
MOVT	R0, #17530
VMOV	S0, R0
VMUL.F32	S1, S0, S1
LDR	R0, [SP, #4]
LDRH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_timePerTick+0)
MOVT	R0, #hi_addr(_timePerTick+0)
VSTR	#1, S0, [R0, #0]
;input_capture_demo.c,134 :: 		}
L_end_init_tim2_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _init_tim2_input_capture
_timer2_interrupt:
;input_capture_demo.c,138 :: 		void timer2_interrupt() iv IVT_INT_TIM2 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,140 :: 		NVIC_IntDisable(IVT_INT_TIM2);                                             // Disable timer 2 interrupts
MOVW	R0, #44
BL	_NVIC_IntDisable+0
;input_capture_demo.c,143 :: 		if(TIM2_SR.UIF == 1) {                                                     // If timer 2 overflow event occured
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_interrupt9
;input_capture_demo.c,146 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,147 :: 		overflowCount++;                                                        // Increment overflow counter
MOVW	R1, #lo_addr(_overflowCount+0)
MOVT	R1, #hi_addr(_overflowCount+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;input_capture_demo.c,148 :: 		}
L_timer2_interrupt9:
;input_capture_demo.c,150 :: 		if (TIM2_SR.CC1IF == 1) {                                                  // If Input Capture event occured
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_interrupt10
;input_capture_demo.c,153 :: 		TIM2_SR.CC1IF = 0;                                                      // Clear input capture event bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,154 :: 		endTime = TIM2_CCR1;                                                // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
MOVW	R7, #lo_addr(_endTime+0)
MOVT	R7, #hi_addr(_endTime+0)
STR	R0, [R7, #0]
;input_capture_demo.c,155 :: 		pulseTicks = (((long long) overflowCount * 59999) - startTime + endTime);      // Calculate total ticks between input capture events
MOVW	R6, #lo_addr(_overflowCount+0)
MOVT	R6, #hi_addr(_overflowCount+0)
LDRH	R4, [R6, #0]
MOVS	R5, #0
MOVW	R0, #59999
MOVS	R1, #0
UMULL	R2, R3, R4, R0
MLA	R3, R5, R0, R3
MLA	R3, R4, R1, R3
MOVW	R4, #lo_addr(_startTime+0)
MOVT	R4, #hi_addr(_startTime+0)
LDR	R0, [R4, #0]
MOVS	R1, #0
SUBS	R2, R2, R0
SBCS	R3, R1
MOV	R0, R7
LDR	R0, [R0, #0]
MOVS	R1, #0
ADDS	R2, R2, R0
ADCS	R3, R1
MOVW	R0, #lo_addr(_pulseTicks+0)
MOVT	R0, #hi_addr(_pulseTicks+0)
STRD	R2, R3, [R0, #0]
;input_capture_demo.c,156 :: 		startTime = endTime;                                             // Store time of latest input capture event for use in next instance
MOV	R0, R7
LDR	R0, [R0, #0]
STR	R0, [R4, #0]
;input_capture_demo.c,157 :: 		overflowCount = 0;                                                      // Reset the overflow counter to 0
MOVS	R0, #0
STRH	R0, [R6, #0]
;input_capture_demo.c,158 :: 		inputEventCounter++;                                                    // Increment total input capture event counter
MOVW	R1, #lo_addr(_inputEventCounter+0)
MOVT	R1, #hi_addr(_inputEventCounter+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;input_capture_demo.c,159 :: 		}
L_timer2_interrupt10:
;input_capture_demo.c,163 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                              // Re-enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;input_capture_demo.c,165 :: 		}
L_end_timer2_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _timer2_interrupt
_external_interrupt:
;input_capture_demo.c,169 :: 		void external_interrupt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
;input_capture_demo.c,171 :: 		EXTI_PR.B10 = 1;                                                           // Clear external interrupt bit
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,172 :: 		poll_flag = 1;                                                             // Set poll flag for main
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,174 :: 		}
L_end_external_interrupt:
BX	LR
; end of _external_interrupt
_init_hardware:
;input_capture_demo.c,178 :: 		void init_hardware() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,181 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                        // Enable digital output on E10
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;input_capture_demo.c,182 :: 		GPIOE_ODR.B10 = 0;                                                         // Set pin E10 low
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,185 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
BL	_GPIO_Alternate_Function_Enable+0
;input_capture_demo.c,188 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10);                         // Enable digital output D10
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;input_capture_demo.c,189 :: 		SYSCFGEN_bit = 1;                                                          // Enable clock for alternate pin functions
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;input_capture_demo.c,190 :: 		SYSCFG_EXTICR3 = 0x00000300;                                               // Map external interrupt on PD10
MOVW	R1, #768
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
STR	R1, [R0, #0]
;input_capture_demo.c,191 :: 		EXTI_RTSR = 0x00000000;                                                    // Set interrupt on Rising edge (none)
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,192 :: 		EXTI_FTSR = 0x00000400;                                                    // Set Interrupt on Falling edge (PD10)
MOVW	R1, #1024
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,193 :: 		EXTI_IMR |= 0x00000400;                                                    // Set mask to interrupt on bit 10
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,194 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);                                             // Enable External interrupt
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;input_capture_demo.c,195 :: 		}
L_end_init_hardware:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_hardware
_init_serial_comm:
;input_capture_demo.c,199 :: 		void init_serial_comm() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,201 :: 		UART1_Init(UART_BAUD_RATE);                                                // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;input_capture_demo.c,202 :: 		Delay_ms(200);                                                             // Wait for UART to stabilize
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
;input_capture_demo.c,203 :: 		}
L_end_init_serial_comm:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_serial_comm
