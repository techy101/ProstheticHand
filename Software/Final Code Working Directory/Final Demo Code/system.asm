_init_GPIO:
;system.c,39 :: 		void init_GPIO() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;system.c,41 :: 		GPIO_Config(&GPIOE_BASE, _GPIO_PINMASK_10, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);     // Pointer Direction Pin
MOVW	R2, #84
MOVT	R2, #8
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Config+0
;system.c,42 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_10, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);     // Middle Direction Pin
MOVW	R2, #84
MOVT	R2, #8
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;system.c,43 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_13, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);     // Ring Direction Pin
MOVW	R2, #84
MOVT	R2, #8
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;system.c,44 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_8, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);      // Pinky Direction Pin
MOVW	R2, #84
MOVT	R2, #8
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;system.c,45 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);     // Thumb Direction Pin
MOVW	R2, #84
MOVT	R2, #8
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;system.c,48 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);    // Mode 1 button
MOVW	R2, #322
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;system.c,49 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_7, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);     // Mode 2 button
MOVW	R2, #322
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;system.c,50 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_1, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);     // Mode 3 button
MOVW	R2, #322
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;system.c,51 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);    // Mode 4 button
MOVW	R2, #322
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;system.c,54 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);   // Mode 1 LED
MOVW	R2, #276
MOVT	R2, #8
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;system.c,55 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_14, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);   // Mode 2 LED
MOVW	R2, #276
MOVT	R2, #8
MOVW	R1, #16384
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;system.c,56 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);   // Mode 3 LED
MOVW	R2, #276
MOVT	R2, #8
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;system.c,57 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_8, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);    // Mode 4 LED
MOVW	R2, #276
MOVT	R2, #8
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;system.c,60 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;system.c,63 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);                                            // For awd debug test
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;system.c,66 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);     // Wakeup Button (Unsure what to use for now)
MOVW	R2, #322
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;system.c,67 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_4, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);     // User Defined Button (Unused)
MOVW	R2, #322
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;system.c,70 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_8, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);    // System Active LED
MOVW	R2, #276
MOVT	R2, #8
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;system.c,71 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_7, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);    // Low Battery LED (Unused)
MOVW	R2, #276
MOVT	R2, #8
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;system.c,72 :: 		}
L_end_init_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_GPIO
_init_sample_timer:
;system.c,107 :: 		void init_sample_timer() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;system.c,109 :: 		RCC_APB2ENR.TIM11EN = 1;                         // Enable clock for timer 11
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;system.c,110 :: 		TIM11_CR1.CEN = 0;                               // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;system.c,111 :: 		TIM11_PSC = SAMPLE_TIM_PSC;                      // Set timer 11 prescaler
MOVW	R1, _SAMPLE_TIM_PSC
MOVT	R1, _SAMPLE_TIM_PSC+2
MOVW	R0, #lo_addr(TIM11_PSC+0)
MOVT	R0, #hi_addr(TIM11_PSC+0)
STR	R1, [R0, #0]
;system.c,112 :: 		TIM11_ARR = SAMPLE_TIM_RELOAD;                   // Set timer 11 overflow value
MOVW	R1, _SAMPLE_TIM_RELOAD
MOVT	R1, _SAMPLE_TIM_RELOAD+2
MOVW	R0, #lo_addr(TIM11_ARR+0)
MOVT	R0, #hi_addr(TIM11_ARR+0)
STR	R1, [R0, #0]
;system.c,113 :: 		NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);      // Enable timer 11 interrupt
MOVW	R0, #42
BL	_NVIC_IntEnable+0
;system.c,114 :: 		TIM11_DIER.UIE = 1;                              // Timer 11 update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_DIER+0)
MOVT	R0, #hi_addr(TIM11_DIER+0)
STR	R1, [R0, #0]
;system.c,115 :: 		TIM11_CR1.CEN = 1;                               // Enable timer/counter
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;system.c,116 :: 		}
L_end_init_sample_timer:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_sample_timer
_sample_timer_ISR:
;system.c,142 :: 		void sample_timer_ISR() iv IVT_INT_TIM1_TRG_COM_TIM11 {
;system.c,143 :: 		TIM11_SR.UIF = 0;                                                           // Clear timer 11 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_SR+0)
MOVT	R0, #hi_addr(TIM11_SR+0)
STR	R1, [R0, #0]
;system.c,144 :: 		poll_flag = 1;                                                              // Set poll flag for main loop
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;system.c,145 :: 		terminal_print_count++;                                                     // Increment the debug print counter
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;system.c,146 :: 		}
L_end_sample_timer_ISR:
BX	LR
; end of _sample_timer_ISR
