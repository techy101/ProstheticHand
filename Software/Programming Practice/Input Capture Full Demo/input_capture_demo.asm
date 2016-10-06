_main:
;input_capture_demo.c,48 :: 		void main() {
;input_capture_demo.c,51 :: 		init_hardware();                                                           // Initialize GPIO hardware
BL	_init_hardware+0
;input_capture_demo.c,52 :: 		init_tim2_input_capture();                                                 // Initialize input capture
BL	_init_tim2_input_capture+0
;input_capture_demo.c,53 :: 		init_serial_comm();                                                        // Initialize UART1 (Wired)
BL	_init_serial_comm+0
;input_capture_demo.c,56 :: 		strncpy(testOutput, "\rProgram Has Started\n\r", STR_MAX);
MOVW	R0, #lo_addr(?lstr1_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr1_input_capture_demo+0)
MOVS	R2, #100
SXTH	R2, R2
MOV	R1, R0
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
BL	_strncpy+0
;input_capture_demo.c,57 :: 		UART1_Write_Text(testOutput);
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,60 :: 		while(1) {
L_main0:
;input_capture_demo.c,61 :: 		if (poll_flag && inputEventCounter) {
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main16
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
LDR	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main15
L__main14:
;input_capture_demo.c,62 :: 		poll_flag = 0;                                                       // Clear state entry flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,64 :: 		inputPeriod = (totalTicks * 1000) / TIMER_RELOAD_VALUE;              // Calculate period in ms
MOVW	R2, #lo_addr(_totalTicks+0)
MOVT	R2, #hi_addr(_totalTicks+0)
LDR	R1, [R2, #0]
MOVW	R0, #1000
MULS	R1, R0, R1
MOVW	R0, #63999
UDIV	R0, R1, R0
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #lo_addr(_inputPeriod+0)
MOVT	R0, #hi_addr(_inputPeriod+0)
VSTR	#1, S1, [R0, #0]
;input_capture_demo.c,65 :: 		inputFrequency = 1000 / inputPeriod;                                 // Calculate frequency in Hz
MOVW	R0, #0
MOVT	R0, #17530
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_inputFrequency+0)
MOVT	R0, #hi_addr(_inputFrequency+0)
VSTR	#1, S0, [R0, #0]
;input_capture_demo.c,68 :: 		FloatToStr(totalTicks, periodInText);                               // Convert period float to string
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S0, S0
MOVW	R0, #lo_addr(_periodInText+0)
MOVT	R0, #hi_addr(_periodInText+0)
BL	_FloatToStr+0
;input_capture_demo.c,69 :: 		UART1_Write_Text("Total Ticks: ");
MOVW	R0, #lo_addr(?lstr2_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr2_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,70 :: 		UART1_Write_Text(periodInText);
MOVW	R0, #lo_addr(_periodInText+0)
MOVT	R0, #hi_addr(_periodInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,71 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr3_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr3_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,73 :: 		FloatToStr(inputFrequency, frequencyInText);                         // Convert Frequency float to string
MOVW	R0, #lo_addr(_inputFrequency+0)
MOVT	R0, #hi_addr(_inputFrequency+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_frequencyInText+0)
MOVT	R0, #hi_addr(_frequencyInText+0)
BL	_FloatToStr+0
;input_capture_demo.c,74 :: 		UART1_Write_Text("Frequency of incoming signal: ");
MOVW	R0, #lo_addr(?lstr4_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr4_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,75 :: 		UART1_Write_Text(frequencyInText);
MOVW	R0, #lo_addr(_frequencyInText+0)
MOVT	R0, #hi_addr(_frequencyInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,76 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr5_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr5_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,78 :: 		LongToStr(inputEventCounter, eventCounterInText);                    // Convert input event counter long to string
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_eventCounterInText+0)
MOVT	R1, #hi_addr(_eventCounterInText+0)
BL	_LongToStr+0
;input_capture_demo.c,79 :: 		UART1_Write_Text("Number of input capture events: ");
MOVW	R0, #lo_addr(?lstr6_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr6_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,80 :: 		UART1_Write_Text(eventCounterInText);
MOVW	R0, #lo_addr(_eventCounterInText+0)
MOVT	R0, #hi_addr(_eventCounterInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,81 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R0, #lo_addr(?lstr7_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr7_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,83 :: 		inputEventCounter = 0;                                               // Reset input event counter for next
MOVS	R1, #0
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
STR	R1, [R0, #0]
;input_capture_demo.c,84 :: 		}
IT	AL
BAL	L_main5
;input_capture_demo.c,61 :: 		if (poll_flag && inputEventCounter) {
L__main16:
L__main15:
;input_capture_demo.c,86 :: 		else if (poll_flag && !inputEventCounter) {
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
;input_capture_demo.c,87 :: 		UART1_Write_Text("No Events Detected\n\n\r");
MOVW	R0, #lo_addr(?lstr8_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr8_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,88 :: 		poll_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,89 :: 		inputEventCounter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
STR	R1, [R0, #0]
;input_capture_demo.c,86 :: 		else if (poll_flag && !inputEventCounter) {
L__main18:
L__main17:
;input_capture_demo.c,90 :: 		}
L_main5:
;input_capture_demo.c,91 :: 		}
IT	AL
BAL	L_main0
;input_capture_demo.c,92 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_init_tim2_input_capture:
;input_capture_demo.c,96 :: 		void init_tim2_input_capture() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,98 :: 		RCC_APB1ENR.TIM2EN = 1;                                                    // Enable clock gating for timer module 2
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R2, [R0, #0]
;input_capture_demo.c,99 :: 		TIM2_CR1.CEN = 0;                                                          // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,100 :: 		TIM2_PSC = TIMER_PRESCALER;                                                // Set timer 2 prescaler (need to determine value)
MOVW	R1, #2624
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;input_capture_demo.c,101 :: 		TIM2_ARR = TIMER_RELOAD_VALUE;                                             // Set timer 2 overflow value at max
MOVW	R1, #63999
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,102 :: 		TIM2_CR1 |= 0x10;                                                          // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,103 :: 		TIM2_CCMR1_Input |= 0x01;                                                  // Set capture channel 1 as input (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;input_capture_demo.c,104 :: 		TIM2_CCER.CC1P = 1;                                                        // Set capture on rising edge event
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,105 :: 		TIM2_CCER.CC1E = 1;                                                        // Enable capture on channel 1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,106 :: 		TIM2_DIER.CC1IE = 1;                                                       // Enable capture 1 interrupt
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,107 :: 		TIM2_DIER.UIE = 1;                                                         // CC1 Update Interrupt Enable
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,108 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                              // Enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;input_capture_demo.c,109 :: 		EnableInterrupts();                                                      // Probably unneeded due to previous line
BL	_EnableInterrupts+0
;input_capture_demo.c,110 :: 		TIM2_CR1.CEN = 1;                                                          // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,111 :: 		}
L_end_init_tim2_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_tim2_input_capture
_timer2_interrupt:
;input_capture_demo.c,115 :: 		void timer2_interrupt() iv IVT_INT_TIM2 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,117 :: 		NVIC_IntDisable(IVT_INT_TIM2);                                             // Disable timer 2 interrupts
MOVW	R0, #44
BL	_NVIC_IntDisable+0
;input_capture_demo.c,118 :: 		GPIOE_ODR.B10 = 1;                                                         // ****DEBUG****
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,120 :: 		if(TIM2_SR.UIF == 1) {                                                     // If timer 2 overflow event occured
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_interrupt9
;input_capture_demo.c,122 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,123 :: 		overflowCount++;                                                        // Increment overflow counter
MOVW	R1, #lo_addr(_overflowCount+0)
MOVT	R1, #hi_addr(_overflowCount+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;input_capture_demo.c,124 :: 		}
L_timer2_interrupt9:
;input_capture_demo.c,126 :: 		if (TIM2_SR.CC1IF == 1) {                                                  // If Input Capture event occured
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_interrupt10
;input_capture_demo.c,129 :: 		TIM2_SR.CC1IF = 0;                                                      // Clear input capture event bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,130 :: 		presentTime = TIM2_CCR1;                                                // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
MOVW	R3, #lo_addr(_presentTime+0)
MOVT	R3, #hi_addr(_presentTime+0)
STR	R0, [R3, #0]
;input_capture_demo.c,131 :: 		totalTicks = ((overflowCount << 16) - previousTime + presentTime);        // Calculate total ticks between input capture events
MOVW	R2, #lo_addr(_previousTime+0)
MOVT	R2, #hi_addr(_previousTime+0)
LDR	R0, [R2, #0]
RSBS	R1, R0, #0
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_totalTicks+0)
MOVT	R0, #hi_addr(_totalTicks+0)
STR	R1, [R0, #0]
;input_capture_demo.c,132 :: 		previousTime = presentTime;                                             // Store time of latest input capture event for use in next instance
MOV	R0, R3
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;input_capture_demo.c,133 :: 		overflowCount = 0;                                                      // Reset the overflow counter to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(_overflowCount+0)
MOVT	R0, #hi_addr(_overflowCount+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,134 :: 		inputEventCounter++;                                                    // Increment total input capture event counter
MOVW	R1, #lo_addr(_inputEventCounter+0)
MOVT	R1, #hi_addr(_inputEventCounter+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;input_capture_demo.c,135 :: 		}
L_timer2_interrupt10:
;input_capture_demo.c,139 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                              // Re-enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;input_capture_demo.c,140 :: 		GPIOE_ODR.B10 = 0;                                                         // Set handler timing pin low
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,141 :: 		}
L_end_timer2_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _timer2_interrupt
_external_interrupt:
;input_capture_demo.c,145 :: 		void external_interrupt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
;input_capture_demo.c,147 :: 		EXTI_PR.B10 = 1;                                                           // Clear external interrupt bit
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,148 :: 		poll_flag = 1;                                                             // Set poll flag for main
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,150 :: 		}
L_end_external_interrupt:
BX	LR
; end of _external_interrupt
_init_hardware:
;input_capture_demo.c,154 :: 		void init_hardware() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,157 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                        // Enable digital output on E10
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;input_capture_demo.c,158 :: 		GPIOE_ODR.B10 = 0;                                                         // Set pin E10 low
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,161 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
BL	_GPIO_Alternate_Function_Enable+0
;input_capture_demo.c,164 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10);                         // Enable digital output D10
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;input_capture_demo.c,165 :: 		SYSCFGEN_bit = 1;                                                          // Enable clock for alternate pin functions
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;input_capture_demo.c,166 :: 		SYSCFG_EXTICR3 = 0x00000300;                                               // Map external interrupt on PD10
MOVW	R1, #768
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
STR	R1, [R0, #0]
;input_capture_demo.c,167 :: 		EXTI_RTSR = 0x00000000;                                                    // Set interrupt on Rising edge (none)
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,168 :: 		EXTI_FTSR = 0x00000400;                                                    // Set Interrupt on Falling edge (PD10)
MOVW	R1, #1024
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,169 :: 		EXTI_IMR |= 0x00000400;                                                    // Set mask to interrupt on bit 10
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,170 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);                                             // Enable External interrupt
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;input_capture_demo.c,171 :: 		}
L_end_init_hardware:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_hardware
_init_serial_comm:
;input_capture_demo.c,175 :: 		void init_serial_comm() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,177 :: 		UART1_Init(UART_BAUD_RATE);                                                // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;input_capture_demo.c,178 :: 		Delay_ms(200);                                                             // Wait for UART to stabilize
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
;input_capture_demo.c,179 :: 		}
L_end_init_serial_comm:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_serial_comm
