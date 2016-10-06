_main:
;input_capture_demo.c,46 :: 		void main() {
;input_capture_demo.c,49 :: 		init_hardware();                                                           // Initialize GPIO hardware
BL	_init_hardware+0
;input_capture_demo.c,50 :: 		init_tim2_input_capture();                                                 // Initialize input capture
BL	_init_tim2_input_capture+0
;input_capture_demo.c,51 :: 		init_serial_comm();                                                        // Initialize UART1 (Wired)
BL	_init_serial_comm+0
;input_capture_demo.c,54 :: 		testOutput = "this is a test\n\r";
MOVS	R1, #lo_addr(?lstr_1_input_capture_demo+0)
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
STRB	R1, [R0, #0]
;input_capture_demo.c,55 :: 		UART1_Write_Text(testOutput);
LDRB	R0, [R0, #0]
BL	_UART1_Write_Text+0
;input_capture_demo.c,57 :: 		while(1) {
L_main0:
;input_capture_demo.c,58 :: 		if (poll_flag) {
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main2
;input_capture_demo.c,59 :: 		poll_flag = 0;                                                       // Clear state entry flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,61 :: 		inputPeriod = (totalTicks * 1000) / TIMER_RELOAD_VALUE;              // Calculate period in ms
MOVW	R0, #lo_addr(_totalTicks+0)
MOVT	R0, #hi_addr(_totalTicks+0)
LDR	R1, [R0, #0]
MOVW	R0, #1000
MULS	R1, R0, R1
MOVW	R0, #63999
UDIV	R0, R1, R0
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #lo_addr(_inputPeriod+0)
MOVT	R0, #hi_addr(_inputPeriod+0)
VSTR	#1, S1, [R0, #0]
;input_capture_demo.c,62 :: 		inputFrequency = 1000 / inputPeriod;                                 // Calculate frequency in Hz
MOVW	R0, #0
MOVT	R0, #17530
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_inputFrequency+0)
MOVT	R0, #hi_addr(_inputFrequency+0)
VSTR	#1, S0, [R0, #0]
;input_capture_demo.c,64 :: 		UART1_Write_Text("Period of incoming signal: ");
MOVW	R0, #lo_addr(?lstr2_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr2_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,65 :: 		FloatToStr(inputPeriod, periodInText);
MOVW	R0, #lo_addr(_inputPeriod+0)
MOVT	R0, #hi_addr(_inputPeriod+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_periodInText+0)
MOVT	R0, #hi_addr(_periodInText+0)
BL	_FloatToStr+0
;input_capture_demo.c,68 :: 		UART1_Write_Text("Frequency of incoming signal: ");
MOVW	R0, #lo_addr(?lstr3_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr3_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,70 :: 		UART1_Write_Text("Total number of events: ");
MOVW	R0, #lo_addr(?lstr4_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr4_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,73 :: 		inputEventCounter = 0;                                               // Reset input event counter for next
MOVS	R1, #0
MOVW	R0, #lo_addr(_inputEventCounter+0)
MOVT	R0, #hi_addr(_inputEventCounter+0)
STR	R1, [R0, #0]
;input_capture_demo.c,74 :: 		}
L_main2:
;input_capture_demo.c,75 :: 		}
IT	AL
BAL	L_main0
;input_capture_demo.c,76 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_init_tim2_input_capture:
;input_capture_demo.c,80 :: 		void init_tim2_input_capture() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,82 :: 		RCC_APB1ENR.TIM2EN = 1;                                                    // Enable clock gating for timer module 2
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R2, [R0, #0]
;input_capture_demo.c,83 :: 		TIM2_CR1.CEN = 0;                                                          // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,84 :: 		TIM2_PSC = TIMER_PRESCALER;                                                // Set timer 2 prescaler (need to determine value)
MOVW	R1, #2624
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;input_capture_demo.c,85 :: 		TIM2_ARR = TIMER_RELOAD_VALUE;                                             // Set timer 2 overflow value at max
MOVW	R1, #63999
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,86 :: 		TIM2_CR1 |= 0x10;                                                          // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,87 :: 		TIM2_CCMR1_Input |= 0x01;                                                  // Set capture channel 1 as input (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;input_capture_demo.c,88 :: 		TIM2_CCER.CC1P = 1;                                                        // Set capture on rising edge event
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,89 :: 		TIM2_CCER.CC1E = 1;                                                        // Enable capture on channel 1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,90 :: 		TIM2_DIER.CC1IE = 1;                                                       // Enable capture 1 interrupt
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,91 :: 		TIM2_DIER.UIE = 1;                                                         // CC1 Update Interrupt Enable
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R2, [R0, #0]
;input_capture_demo.c,92 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                              // Enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;input_capture_demo.c,94 :: 		TIM2_CR1.CEN = 1;                                                          // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;input_capture_demo.c,95 :: 		}
L_end_init_tim2_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_tim2_input_capture
_timer2_interrupt:
;input_capture_demo.c,99 :: 		void timer2_interrupt() iv IVT_INT_TIM2 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,101 :: 		NVIC_IntDisable(IVT_INT_TIM2);                                             // Disable timer 2 interrupts
MOVW	R0, #44
BL	_NVIC_IntDisable+0
;input_capture_demo.c,102 :: 		GPIOE_ODR.B10 = 1;                                                         // Set handler timing pin high
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,104 :: 		if(TIM2_SR.UIF == 1) {                                                     // If timer 2 overflow event occured
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_interrupt3
;input_capture_demo.c,105 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,106 :: 		overflowCount++;                                                        // Increment overflow counter
MOVW	R1, #lo_addr(_overflowCount+0)
MOVT	R1, #hi_addr(_overflowCount+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;input_capture_demo.c,107 :: 		}
L_timer2_interrupt3:
;input_capture_demo.c,109 :: 		if (TIM2_SR.CC1IF == 1) {                                                  // If Input Capture event occured
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_interrupt4
;input_capture_demo.c,110 :: 		TIM2_SR.CC1IF = 0;                                                      // Clear input capture event bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,111 :: 		presentTime = TIM2_CCR1;                                                // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
MOVW	R3, #lo_addr(_presentTime+0)
MOVT	R3, #hi_addr(_presentTime+0)
STR	R0, [R3, #0]
;input_capture_demo.c,112 :: 		totalTicks = (overflowCount << 16) - previousTime + presentTime;        // Calculate total ticks between input capture events
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
;input_capture_demo.c,113 :: 		previousTime = presentTime;                                             // Store time of latest input capture event for use in next instance
MOV	R0, R3
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;input_capture_demo.c,114 :: 		overflowCount = 0;                                                      // Reset the overflow counter to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(_overflowCount+0)
MOVT	R0, #hi_addr(_overflowCount+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,115 :: 		inputEventCounter++;                                                    // Increment total input capture event counter
MOVW	R1, #lo_addr(_inputEventCounter+0)
MOVT	R1, #hi_addr(_inputEventCounter+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;input_capture_demo.c,116 :: 		}
L_timer2_interrupt4:
;input_capture_demo.c,120 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                              // Re-enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;input_capture_demo.c,121 :: 		GPIOE_ODR.B10 = 0;                                                         // Set handler timing pin low
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,122 :: 		}
L_end_timer2_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _timer2_interrupt
_external_interrupt:
;input_capture_demo.c,126 :: 		void external_interrupt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
;input_capture_demo.c,128 :: 		EXTI_PR.B10 = 1;                                                           // Clear external interrupt bit
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,129 :: 		poll_flag = 1;                                                             // Set poll flag for main
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;input_capture_demo.c,130 :: 		}
L_end_external_interrupt:
BX	LR
; end of _external_interrupt
_init_hardware:
;input_capture_demo.c,134 :: 		void init_hardware() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,137 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                        // Enable digital output on E10
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;input_capture_demo.c,138 :: 		GPIOE_ODR.B10 = 0;                                                         // Set pin E10 low
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,141 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10);                         // Enable digital output D10
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;input_capture_demo.c,142 :: 		SYSCFGEN_bit = 1;                                                          // Enable clock for alternate pin functions
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;input_capture_demo.c,143 :: 		SYSCFG_EXTICR3 = 0x00000300;                                               // Map external interrupt on PD10
MOVW	R1, #768
MOVW	R0, #lo_addr(SYSCFG_EXTICR3+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR3+0)
STR	R1, [R0, #0]
;input_capture_demo.c,144 :: 		EXTI_RTSR = 0x00000000;                                                    // Set interrupt on Rising edge (none)
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,145 :: 		EXTI_FTSR = 0x00000400;                                                    // Set Interrupt on Falling edge (PD10)
MOVW	R1, #1024
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,146 :: 		EXTI_IMR |= 0x00000400;                                                    // Set mask to interrupt on bit 10
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;input_capture_demo.c,147 :: 		NVIC_IntEnable(IVT_INT_EXTI1);                                             // Enable External interrupt
MOVW	R0, #23
BL	_NVIC_IntEnable+0
;input_capture_demo.c,148 :: 		}
L_end_init_hardware:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_hardware
_init_serial_comm:
;input_capture_demo.c,152 :: 		void init_serial_comm() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,154 :: 		UART1_Init(UART_BAUD_RATE);                                                // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;input_capture_demo.c,155 :: 		Delay_ms(200);                                                             // Wait for UART to stabilize
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_init_serial_comm5:
SUBS	R7, R7, #1
BNE	L_init_serial_comm5
NOP
NOP
NOP
;input_capture_demo.c,156 :: 		}
L_end_init_serial_comm:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_serial_comm
