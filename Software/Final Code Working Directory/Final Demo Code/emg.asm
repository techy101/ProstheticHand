_init_emg:
;emg.c,40 :: 		void init_emg() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;emg.c,43 :: 		ADC1_LTR = low_level;                                       // Set AWD guard window initial lower threshold
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;emg.c,44 :: 		ADC1_HTR = high_level;                                      // Set AWD guard window initial upper threshold
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;emg.c,45 :: 		ADC1_CR2bits.CONT = 1;                                      // Enable ADC1 continuous conversion mode
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;emg.c,46 :: 		ADC1_SQR3bits.SQ1 = 3;                                      // Set first channel in continuous coversion sequence to channel 3
MOVS	R2, #3
MOVW	R1, #lo_addr(ADC1_SQR3bits+0)
MOVT	R1, #hi_addr(ADC1_SQR3bits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #0, #5
STRB	R0, [R1, #0]
;emg.c,47 :: 		ADC1_SQR3bits.SQ2 = 4;                                      // Set second channel in continuous coversion sequence to channel 4 - NEW
MOVS	R2, #4
MOVW	R1, #lo_addr(ADC1_SQR3bits+0)
MOVT	R1, #hi_addr(ADC1_SQR3bits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #5, #5
STRH	R0, [R1, #0]
;emg.c,48 :: 		ADC1_CR1bits.AWDSGL = 1;                                    // Enable single channel monitoring mode for AWD
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;emg.c,49 :: 		ADC1_CR1 |= 3;                                              // Set channel 3 as the single monitored AWD channel
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
;emg.c,50 :: 		ADC1_CR1bits.AWDEN = 1;                                     // Enable Analog watchdog on regular channels
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;emg.c,51 :: 		ADC1_CR2bits.SWSTART = 1;                                   // Start ADC1 Conversions
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;emg.c,52 :: 		ADC1_CR1bits.AWDIE = 1;                                     // Enable analog watchdog interrupt
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;emg.c,53 :: 		NVIC_IntEnable(IVT_INT_ADC);                                // Enable global ADC interrupt
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;emg.c,56 :: 		RCC_APB1ENR.TIM5EN = 1;                                     // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;emg.c,57 :: 		TIM5_CR1.CEN = 0;                                           // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;emg.c,58 :: 		TIM5_PSC = EMG_TIMER_PSC;                                   // Set timer 3 prescaler (need to determine value)
MOVW	R1, _EMG_TIMER_PSC
MOVT	R1, _EMG_TIMER_PSC+2
MOVW	R0, #lo_addr(TIM5_PSC+0)
MOVT	R0, #hi_addr(TIM5_PSC+0)
STR	R1, [R0, #0]
;emg.c,59 :: 		TIM5_ARR = EMG_TIMER_RELOAD;                                // Set timer 3 overflow value at max
MOVW	R1, _EMG_TIMER_RELOAD
MOVT	R1, _EMG_TIMER_RELOAD+2
MOVW	R0, #lo_addr(TIM5_ARR+0)
MOVT	R0, #hi_addr(TIM5_ARR+0)
STR	R1, [R0, #0]
;emg.c,60 :: 		NVIC_IntEnable(IVT_INT_TIM5);                               // Enable timer 3 interrupt
MOVW	R0, #66
BL	_NVIC_IntEnable+0
;emg.c,61 :: 		TIM5_CR1.CEN = 1;                                           // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;emg.c,62 :: 		GPIO_Digital_Output(&GPIOB_BASE, EMG_ACTIVE_LED);           // Initialize successful EMG indicator LED
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R1, #0]
MOV	R1, R0
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;emg.c,71 :: 		}
L_end_init_emg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_emg
_AWD_ISR:
;emg.c,92 :: 		void AWD_ISR() iv IVT_INT_ADC ics ICS_AUTO {
;emg.c,93 :: 		ADC1_CR1bits.AWDIE = 0;       // Disabling analog interrupt (disable)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;emg.c,94 :: 		ADC1_SRbits.AWD = 0;          // Reset status bit
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;emg.c,95 :: 		if(ADC1_HTR <= 1000) {        // Current EMG state is dormant
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
LDR	R0, [R0, #0]
CMP	R0, #1000
IT	HI
BHI	L_AWD_ISR0
;emg.c,96 :: 		TIM5_SR.UIF = 0;        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_SR+0)
MOVT	R0, #hi_addr(TIM5_SR+0)
STR	R1, [R0, #0]
;emg.c,97 :: 		TIM5_CNT = 0x00;        // Reset timer value to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM5_CNT+0)
MOVT	R0, #hi_addr(TIM5_CNT+0)
STR	R1, [R0, #0]
;emg.c,98 :: 		ADC1_HTR = high_level2; // Set high threshold to MAX
MOVW	R1, #4095
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;emg.c,99 :: 		ADC1_LTR = low_level2;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;emg.c,100 :: 		TIM5_DIER.UIE = 1;      // CC1 Update Interrupt Enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R1, [R0, #0]
;emg.c,101 :: 		}
IT	AL
BAL	L_AWD_ISR1
L_AWD_ISR0:
;emg.c,103 :: 		TIM5_DIER.UIE = 0;      // Disable timer interrupt
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R1, [R0, #0]
;emg.c,104 :: 		ADC1_HTR = high_level;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;emg.c,105 :: 		ADC1_LTR = low_level;   // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;emg.c,106 :: 		}
L_AWD_ISR1:
;emg.c,107 :: 		ADC1_CR1bits.AWDIE = 1;       //Enable analog interrupt (enabled)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;emg.c,108 :: 		}
L_end_AWD_ISR:
BX	LR
; end of _AWD_ISR
_emg_timer_ISR:
;emg.c,132 :: 		void emg_timer_ISR() iv IVT_INT_TIM5 {
;emg.c,133 :: 		TIM5_SR.UIF = 0;                     // Clear timer 3 interrupt bit
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM5_SR+0)
MOVT	R0, #hi_addr(TIM5_SR+0)
STR	R2, [R0, #0]
;emg.c,134 :: 		ADC1_HTR = high_level;               // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;emg.c,135 :: 		ADC1_LTR = low_level;                // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;emg.c,136 :: 		TIM5_DIER.UIE = 0;                   // Disable timer interrupt
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R2, [R0, #0]
;emg.c,137 :: 		analogGo = 1;                        // System activation flag
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
STRH	R1, [R0, #0]
;emg.c,138 :: 		goStatus = 1;                        // Present system execution state flag
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_goStatus+0)
MOVT	R0, #hi_addr(_goStatus+0)
STRH	R1, [R0, #0]
;emg.c,139 :: 		EMG_ACTIVE_LED = 1;                  // Visual indicator of successful EMG execution
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;emg.c,140 :: 		}
L_end_emg_timer_ISR:
BX	LR
; end of _emg_timer_ISR
