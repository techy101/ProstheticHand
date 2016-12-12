_init_input_capture:
;finger.c,39 :: 		void init_input_capture() {
SUB	SP, SP, #20
STR	LR, [SP, #0]
;finger.c,43 :: 		RCC_APB1ENR.TIM3EN = 1;                                                     // Enable clock gating for timer module 3
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R3, [R0, #0]
;finger.c,44 :: 		TIM3_CR1.CEN = 0;                                                           // Disable timer/counter
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R2, [R0, #0]
;finger.c,45 :: 		TIM3_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM3_CR2+0)
MOVT	R0, #hi_addr(TIM3_CR2+0)
STR	R2, [R0, #0]
;finger.c,46 :: 		TIM3_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
MOVW	R1, _ENCODER_TIM_PSC
MOVT	R1, _ENCODER_TIM_PSC+2
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;finger.c,47 :: 		TIM3_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
MOVW	R1, _ENCODER_TIM_RELOAD
MOVT	R1, _ENCODER_TIM_RELOAD+2
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;finger.c,48 :: 		TIM3_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;finger.c,51 :: 		RCC_APB1ENR.TIM2EN = 1;                                                     // Enable clock gating for timer module 5
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R3, [R0, #0]
;finger.c,52 :: 		TIM2_CR1.CEN = 0;                                                           // Disable timer/counter
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;finger.c,53 :: 		TIM2_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM2_CR2+0)
MOVT	R0, #hi_addr(TIM2_CR2+0)
STR	R2, [R0, #0]
;finger.c,54 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
MOVW	R1, _ENCODER_TIM_PSC
MOVT	R1, _ENCODER_TIM_PSC+2
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;finger.c,55 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
MOVW	R1, _ENCODER_TIM_RELOAD
MOVT	R1, _ENCODER_TIM_RELOAD+2
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;finger.c,56 :: 		TIM2_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;finger.c,59 :: 		encoder_timer_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
MOVW	R0, _ENCODER_TIM_PSC
ADDS	R1, R0, #1
UXTH	R1, R1
MOVW	R0, _MCU_FREQUENCY
MOVT	R0, _MCU_FREQUENCY+2
UDIV	R0, R0, R1
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
MOVW	R2, #lo_addr(_encoder_timer_period_ms+0)
MOVT	R2, #hi_addr(_encoder_timer_period_ms+0)
STRD	R0, R1, [R2, #0]
;finger.c,60 :: 		}
L_end_init_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _init_input_capture
_activate_input_capture:
;finger.c,82 :: 		void activate_input_capture() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;finger.c,84 :: 		TIM3_DIER.UIE = 1;                                                          // Enable overflow interrupt Timer 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;finger.c,85 :: 		TIM2_DIER.UIE = 1;                                                          // Enable overflow interrupt for Timer 2
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;finger.c,86 :: 		NVIC_IntEnable(IVT_INT_TIM3);                                               // Enable timer 3 ISR
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;finger.c,87 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                               // Enable timer 2 ISR
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;finger.c,88 :: 		TIM3_CR1.CEN = 1;                                                           // Enable timer 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;finger.c,89 :: 		TIM2_CR1.CEN = 1;                                                           // Enable Timer 2
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;finger.c,90 :: 		}
L_end_activate_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _activate_input_capture
_init_finger:
;finger.c,109 :: 		void init_finger(struct finger *fngr) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
STR	R0, [SP, #4]
;finger.c,112 :: 		if (strcmp(fngr->name, "fngr_pointer") == 0) {
MOVW	R1, #lo_addr(?lstr1_finger+0)
MOVT	R1, #hi_addr(?lstr1_finger+0)
LDR	R0, [SP, #4]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger0
;finger.c,114 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_6, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;finger.c,115 :: 		TIM3_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R1, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R1, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1
MOVW	R1, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R1, #hi_addr(TIM3_CCMR1_Input+0)
STR	R2, [R1, #0]
;finger.c,116 :: 		TIM3_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(TIM3_CCER+0)
MOVT	R1, #hi_addr(TIM3_CCER+0)
STR	R2, [R1, #0]
;finger.c,117 :: 		TIM3_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R1, #lo_addr(TIM3_CCER+0)
MOVT	R1, #hi_addr(TIM3_CCER+0)
STR	R2, [R1, #0]
;finger.c,118 :: 		TIM3_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(TIM3_CCER+0)
MOVT	R1, #hi_addr(TIM3_CCER+0)
STR	R2, [R1, #0]
;finger.c,119 :: 		TIM3_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R1, #lo_addr(TIM3_DIER+0)
MOVT	R1, #hi_addr(TIM3_DIER+0)
STR	R2, [R1, #0]
;finger.c,122 :: 		GPIO_Config(&GPIOE_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Config+0
;finger.c,125 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);    // Set initial duty on Timer 1, channel 1
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
LDRH	R2, [R1, #0]
MOVS	R1, #100
UDIV	R2, R2, R1
UXTH	R2, R2
MOVS	R1, #100
MULS	R1, R2, R1
MOVS	R2, #0
UXTH	R0, R1
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;finger.c,126 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                  // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;finger.c,129 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_7);
MOVW	R0, #128
BL	_ADC_Set_Input_Channel+0
;finger.c,132 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_4);
MOVW	R0, #16
BL	_ADC_Set_Input_Channel+0
;finger.c,135 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_14, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #16384
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;finger.c,141 :: 		}
IT	AL
BAL	L_init_finger1
L_init_finger0:
;finger.c,143 :: 		else if (strcmp(fngr->name, "fngr_middle") == 0) {
MOVW	R1, #lo_addr(?lstr2_finger+0)
MOVT	R1, #hi_addr(?lstr2_finger+0)
LDR	R0, [SP, #4]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger2
;finger.c,145 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_7, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;finger.c,146 :: 		TIM3_CCMR1_Input |= 0x100;                                                  // Set capture channel 2 as input on TI2 (CC2S = 01)
MOVW	R1, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R1, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #256
MOVW	R1, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R1, #hi_addr(TIM3_CCMR1_Input+0)
STR	R2, [R1, #0]
;finger.c,147 :: 		TIM3_CCER.CC2P = 0;                                                         // Set capture on rising edge event
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(TIM3_CCER+0)
MOVT	R1, #hi_addr(TIM3_CCER+0)
STR	R2, [R1, #0]
;finger.c,148 :: 		TIM3_CCER.CC2NP = 0;                                                        // ^^ Continuation of above
MOVW	R1, #lo_addr(TIM3_CCER+0)
MOVT	R1, #hi_addr(TIM3_CCER+0)
STR	R2, [R1, #0]
;finger.c,149 :: 		TIM3_CCER.CC2E = 1;                                                         // Enable capture on channel 2
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(TIM3_CCER+0)
MOVT	R1, #hi_addr(TIM3_CCER+0)
STR	R2, [R1, #0]
;finger.c,150 :: 		TIM3_DIER.CC2IE = 1;                                                        // Enable interrupt on capture channel 2
MOVW	R1, #lo_addr(TIM3_DIER+0)
MOVT	R1, #hi_addr(TIM3_DIER+0)
STR	R2, [R1, #0]
;finger.c,153 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;finger.c,156 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);     // Set initial duty on Timer 1, channel 2
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
LDRH	R2, [R1, #0]
MOVS	R1, #100
UDIV	R2, R2, R1
UXTH	R2, R2
MOVS	R1, #100
MULS	R1, R2, R1
MOVS	R2, #1
UXTH	R0, R1
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;finger.c,157 :: 		PWM_TIM1_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM1_CH2_PE11);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH2_PE11+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH2_PE11+0)
MOVS	R0, #1
BL	_PWM_TIM1_Start+0
;finger.c,160 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_9);
MOVW	R0, #512
BL	_ADC_Set_Input_Channel+0
;finger.c,163 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8);
MOVW	R0, #256
BL	_ADC_Set_Input_Channel+0
;finger.c,164 :: 		}
IT	AL
BAL	L_init_finger3
L_init_finger2:
;finger.c,167 :: 		else if (strcmp(fngr->name, "fngr_ring") == 0) {
MOVW	R1, #lo_addr(?lstr3_finger+0)
MOVT	R1, #hi_addr(?lstr3_finger+0)
LDR	R0, [SP, #4]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger4
;finger.c,169 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_8, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;finger.c,170 :: 		TIM3_CCMR2_Input |= 0x01;                                                   // Set capture channel 3 as input on TI3 (CC3S = 01)
MOVW	R1, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R1, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1
MOVW	R1, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R1, #hi_addr(TIM3_CCMR2_Input+0)
STR	R2, [R1, #0]
;finger.c,171 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(TIM3_CCER+0)
MOVT	R1, #hi_addr(TIM3_CCER+0)
STR	R2, [R1, #0]
;finger.c,172 :: 		TIM3_CCER.CC3NP = 0;                                                        // ^^ Continuation of above
MOVW	R1, #lo_addr(TIM3_CCER+0)
MOVT	R1, #hi_addr(TIM3_CCER+0)
STR	R2, [R1, #0]
;finger.c,173 :: 		TIM3_CCER.CC3E = 1;                                                         // Enable capture on channel 3
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(TIM3_CCER+0)
MOVT	R1, #hi_addr(TIM3_CCER+0)
STR	R2, [R1, #0]
;finger.c,174 :: 		TIM3_DIER.CC3IE = 1;                                                        // Enable interrupt on capture channel 3
MOVW	R1, #lo_addr(TIM3_DIER+0)
MOVT	R1, #hi_addr(TIM3_DIER+0)
STR	R2, [R1, #0]
;finger.c,177 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;finger.c,180 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);       // Set initial duty on Timer 1, channel 3
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
LDRH	R2, [R1, #0]
MOVS	R1, #100
UDIV	R2, R2, R1
UXTH	R2, R2
MOVS	R1, #100
MULS	R1, R2, R1
MOVS	R2, #2
UXTH	R0, R1
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;finger.c,181 :: 		PWM_TIM1_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM1_CH3_PE13);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH3_PE13+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH3_PE13+0)
MOVS	R0, #2
BL	_PWM_TIM1_Start+0
;finger.c,184 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_11);
MOVW	R0, #2048
BL	_ADC_Set_Input_Channel+0
;finger.c,187 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_10);
MOVW	R0, #1024
BL	_ADC_Set_Input_Channel+0
;finger.c,188 :: 		}
IT	AL
BAL	L_init_finger5
L_init_finger4:
;finger.c,191 :: 		else if (strcmp(fngr->name, "fngr_pinky") == 0) {
MOVW	R1, #lo_addr(?lstr4_finger+0)
MOVT	R1, #hi_addr(?lstr4_finger+0)
LDR	R0, [SP, #4]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger6
;finger.c,193 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_4, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;finger.c,194 :: 		TIM3_CCMR2_Input |= 0x100;                                                  // Set capture channel 4 as input on TI4 (CC4S = 01)
MOVW	R1, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R1, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #256
MOVW	R1, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R1, #hi_addr(TIM3_CCMR2_Input+0)
STR	R2, [R1, #0]
;finger.c,195 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(TIM3_CCER+0)
MOVT	R1, #hi_addr(TIM3_CCER+0)
STR	R2, [R1, #0]
;finger.c,196 :: 		TIM3_CCER.CC3NP = 0;                                                        // ^^ Continuation of above
MOVW	R1, #lo_addr(TIM3_CCER+0)
MOVT	R1, #hi_addr(TIM3_CCER+0)
STR	R2, [R1, #0]
;finger.c,197 :: 		TIM3_CCER.CC4E = 1;                                                         // Enable capture on channel 4
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(TIM3_CCER+0)
MOVT	R1, #hi_addr(TIM3_CCER+0)
STR	R2, [R1, #0]
;finger.c,198 :: 		TIM3_DIER.CC4IE = 1;                                                        // Enable interrupt on capture channel 4
MOVW	R1, #lo_addr(TIM3_DIER+0)
MOVT	R1, #hi_addr(TIM3_DIER+0)
STR	R2, [R1, #0]
;finger.c,201 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;finger.c,204 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, PINKY_PWM);      // Set initial duty on Timer 1, channel 4
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
LDRH	R2, [R1, #0]
MOVS	R1, #100
UDIV	R2, R2, R1
UXTH	R2, R2
MOVS	R1, #100
MULS	R1, R2, R1
MOVS	R2, #3
UXTH	R0, R1
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;finger.c,205 :: 		PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PE14);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH4_PE14+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH4_PE14+0)
MOVS	R0, #3
BL	_PWM_TIM1_Start+0
;finger.c,208 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_13);
MOVW	R0, #8192
BL	_ADC_Set_Input_Channel+0
;finger.c,211 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_12);
MOVW	R0, #4096
BL	_ADC_Set_Input_Channel+0
;finger.c,212 :: 		}
IT	AL
BAL	L_init_finger7
L_init_finger6:
;finger.c,215 :: 		else if (strcmp(fngr->name, "fngr_thumb") == 0) {
MOVW	R1, #lo_addr(?lstr5_finger+0)
MOVT	R1, #hi_addr(?lstr5_finger+0)
LDR	R0, [SP, #4]
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger8
;finger.c,217 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_5, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM2 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #16
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;finger.c,218 :: 		TIM2_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R1, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R1, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1
MOVW	R1, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R1, #hi_addr(TIM2_CCMR1_Input+0)
STR	R2, [R1, #0]
;finger.c,219 :: 		TIM2_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(TIM2_CCER+0)
MOVT	R1, #hi_addr(TIM2_CCER+0)
STR	R2, [R1, #0]
;finger.c,220 :: 		TIM2_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R1, #lo_addr(TIM2_CCER+0)
MOVT	R1, #hi_addr(TIM2_CCER+0)
STR	R2, [R1, #0]
;finger.c,221 :: 		TIM2_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(TIM2_CCER+0)
MOVT	R1, #hi_addr(TIM2_CCER+0)
STR	R2, [R1, #0]
;finger.c,222 :: 		TIM2_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R1, #lo_addr(TIM2_DIER+0)
MOVT	R1, #hi_addr(TIM2_DIER+0)
STR	R2, [R1, #0]
;finger.c,225 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;finger.c,228 :: 		PWM_TIM4_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);     // Set initial duty on Timer 4, channel 1
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
LDRH	R2, [R1, #0]
MOVS	R1, #100
UDIV	R2, R2, R1
UXTH	R2, R2
MOVS	R1, #100
MULS	R1, R2, R1
MOVS	R2, #0
UXTH	R0, R1
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;finger.c,229 :: 		PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;finger.c,232 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;finger.c,235 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_2);
MOVW	R0, #4
BL	_ADC_Set_Input_Channel+0
;finger.c,236 :: 		}
L_init_finger8:
L_init_finger7:
L_init_finger5:
L_init_finger3:
L_init_finger1:
;finger.c,239 :: 		fngr->position_actual = 0;				// ****** Will change once limit switches and calibration are in place ******
LDR	R1, [SP, #4]
ADDW	R2, R1, #20
MOVS	R1, #0
STR	R1, [R2, #0]
;finger.c,240 :: 		fngr->direction_desired = INITIAL_DIRECTION;
LDR	R1, [SP, #4]
ADDW	R2, R1, #26
MOVW	R1, #lo_addr(_INITIAL_DIRECTION+0)
MOVT	R1, #hi_addr(_INITIAL_DIRECTION+0)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;finger.c,241 :: 		}
L_end_init_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _init_finger
_sample_finger:
;finger.c,266 :: 		void sample_finger( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R9, R0
; fngr end address is: 0 (R0)
; fngr start address is: 36 (R9)
;finger.c,269 :: 		fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;
ADD	R3, R9, #52
ADD	R1, R9, #48
LDR	R2, [R1, #0]
ADD	R1, R9, #44
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;finger.c,272 :: 		fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);
ADD	R3, R9, #56
ADD	R1, R9, #52
LDR	R2, [R1, #0]
MOVW	R1, _ENCODER_TIM_RELOAD
MOVT	R1, _ENCODER_TIM_RELOAD+2
SUBS	R1, R1, #3
MULS	R1, R2, R1
STR	R1, [R3, #0]
;finger.c,275 :: 		fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;
ADD	R3, R9, #40
ADD	R1, R9, #36
LDR	R2, [R1, #0]
ADD	R1, R9, #32
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;finger.c,278 :: 		fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;
ADD	R3, R9, #60
ADD	R1, R9, #56
LDR	R2, [R1, #0]
ADD	R1, R9, #40
LDR	R1, [R1, #0]
ADDS	R1, R2, R1
STR	R1, [R3, #0]
;finger.c,281 :: 		fngr->input_sig_period = (long double) fngr->enc_total_ticks * encoder_timer_period_ms;
ADD	R1, R9, #68
STR	R1, [SP, #4]
ADD	R1, R9, #60
LDR	R1, [R1, #0]
MOV	R0, R1
BL	__UnsignedIntegralToLongDouble+0
MOVW	R2, #lo_addr(_encoder_timer_period_ms+0)
MOVT	R2, #hi_addr(_encoder_timer_period_ms+0)
VLDR	#1, D0, [R2, #0]
VMOV	R2, S0
VMOV	R3, S1
BL	__Mul_DP+0
LDR	R2, [SP, #4]
STRD	R0, R1, [R2, #0]
;finger.c,284 :: 		fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
ADD	R1, R9, #64
STR	R1, [SP, #8]
ADD	R1, R9, #68
STR	R1, [SP, #4]
MOV	R1, #1000
VMOV	S0, R1
VMOV	R0, S0
BL	__UnsignedIntegralToLongDouble+0
LDR	R2, [SP, #4]
LDRD	R2, R3, [R2, #0]
BL	__Div_DP+0
BL	__LongDoubleToUnsignedIntegral+0
LDR	R1, [SP, #8]
STR	R0, [R1, #0]
;finger.c,285 :: 		if (fngr->input_sig_frequency > 1200.0 || fngr->input_sig_frequency < 10.0)           // NEW: Handles startup error
ADD	R1, R9, #64
LDR	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#0, S1, S1
MOVW	R1, #0
MOVT	R1, #17558
VMOV	S0, R1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GT
BGT	L__sample_finger52
ADD	R1, R9, #64
VLDR	#1, S0, [R1, #0]
VCVT.F32	#0, S1, S0
VMOV.F32	S0, #10
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L__sample_finger51
IT	AL
BAL	L_sample_finger11
L__sample_finger52:
L__sample_finger51:
;finger.c,286 :: 		fngr->input_sig_frequency = 0;
ADD	R2, R9, #64
MOVS	R1, #0
STR	R1, [R2, #0]
L_sample_finger11:
;finger.c,289 :: 		if (fngr->enc_chan_b == 1) {                                                // Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_sample_finger12
;finger.c,290 :: 		fngr->direction_actual = CONTRACT;
ADD	R2, R9, #24
MOVS	R1, #1
STRH	R1, [R2, #0]
;finger.c,291 :: 		fngr->position_actual += (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
ADD	R3, R9, #20
ADD	R1, R9, #16
LDR	R2, [R1, #0]
MOVW	R1, _NORMALIZATION_CONSTANT
MOVT	R1, _NORMALIZATION_CONSTANT+2
SDIV	R2, R2, R1
LDR	R1, [R3, #0]
ADDS	R1, R1, R2
STR	R1, [R3, #0]
;finger.c,292 :: 		}
IT	AL
BAL	L_sample_finger13
L_sample_finger12:
;finger.c,294 :: 		else if (fngr->enc_chan_b == 0) {                                           // Counter Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_sample_finger14
;finger.c,295 :: 		fngr->direction_actual = EXTEND;
ADD	R2, R9, #24
MOVS	R1, #0
STRH	R1, [R2, #0]
;finger.c,296 :: 		fngr->position_actual -= (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
ADD	R3, R9, #20
ADD	R1, R9, #16
LDR	R2, [R1, #0]
MOVW	R1, _NORMALIZATION_CONSTANT
MOVT	R1, _NORMALIZATION_CONSTANT+2
SDIV	R2, R2, R1
LDR	R1, [R3, #0]
SUB	R1, R1, R2
STR	R1, [R3, #0]
;finger.c,297 :: 		}
IT	AL
BAL	L_sample_finger15
L_sample_finger14:
;finger.c,300 :: 		fngr->direction_actual = 7;
ADD	R2, R9, #24
MOVS	R1, #7
STRH	R1, [R2, #0]
;finger.c,301 :: 		}
L_sample_finger15:
L_sample_finger13:
;finger.c,305 :: 		if(fngr->position_actual >= FULLY_CONTRACTED) {  // don't run too far!
ADD	R1, R9, #20
LDR	R2, [R1, #0]
MOVW	R1, _FULLY_CONTRACTED
MOVT	R1, _FULLY_CONTRACTED+2
CMP	R2, R1
IT	CC
BCC	L_sample_finger16
;finger.c,306 :: 		fngr->direction_desired = EXTEND;
ADD	R2, R9, #26
MOVS	R1, #0
STRH	R1, [R2, #0]
;finger.c,307 :: 		}
L_sample_finger16:
;finger.c,309 :: 		if(fngr->position_actual <= FULLY_EXTENDED) {
ADD	R1, R9, #20
LDR	R2, [R1, #0]
MOVW	R1, _FULLY_EXTENDED
MOVT	R1, _FULLY_EXTENDED+2
CMP	R2, R1
IT	GT
BGT	L_sample_finger17
;finger.c,310 :: 		fngr->direction_desired = CONTRACT;
ADD	R2, R9, #26
MOVS	R1, #1
STRH	R1, [R2, #0]
;finger.c,311 :: 		}
L_sample_finger17:
;finger.c,313 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0) {
MOVW	R1, #lo_addr(?lstr6_finger+0)
MOVT	R1, #hi_addr(?lstr6_finger+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger18
;finger.c,314 :: 		POINTER_DIRECTION = fngr->direction_desired;
ADD	R1, R9, #26
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;finger.c,315 :: 		}
IT	AL
BAL	L_sample_finger19
L_sample_finger18:
;finger.c,317 :: 		else if(strcmp(fngr->name, "fngr_middle") == 0) {
MOVW	R1, #lo_addr(?lstr7_finger+0)
MOVT	R1, #hi_addr(?lstr7_finger+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger20
;finger.c,318 :: 		MIDDLE_DIRECTION = fngr->direction_desired;
ADD	R1, R9, #26
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R2, [R1, #0]
;finger.c,319 :: 		}
IT	AL
BAL	L_sample_finger21
L_sample_finger20:
;finger.c,321 :: 		else if(strcmp(fngr->name, "fngr_ring") == 0) {
MOVW	R1, #lo_addr(?lstr8_finger+0)
MOVT	R1, #hi_addr(?lstr8_finger+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger22
;finger.c,322 :: 		RING_DIRECTION = fngr->direction_desired;
ADD	R1, R9, #26
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R2, [R1, #0]
;finger.c,323 :: 		}
IT	AL
BAL	L_sample_finger23
L_sample_finger22:
;finger.c,325 :: 		else if(strcmp(fngr->name, "fngr_pinky") == 0) {
MOVW	R1, #lo_addr(?lstr9_finger+0)
MOVT	R1, #hi_addr(?lstr9_finger+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger24
;finger.c,326 :: 		PINKY_DIRECTION = fngr->direction_desired;
ADD	R1, R9, #26
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R2, [R1, #0]
;finger.c,327 :: 		}
IT	AL
BAL	L_sample_finger25
L_sample_finger24:
;finger.c,329 :: 		else if(strcmp(fngr->name, "fngr_thumb") == 0) {
MOVW	R1, #lo_addr(?lstr10_finger+0)
MOVT	R1, #hi_addr(?lstr10_finger+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger26
;finger.c,330 :: 		THUMB_DIRECTION = fngr->direction_desired;
ADD	R1, R9, #26
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
STR	R2, [R1, #0]
;finger.c,331 :: 		}
L_sample_finger26:
L_sample_finger25:
L_sample_finger23:
L_sample_finger21:
L_sample_finger19:
;finger.c,334 :: 		fngr->position_temp = 0;
ADD	R2, R9, #16
; fngr end address is: 36 (R9)
MOVS	R1, #0
STR	R1, [R2, #0]
;finger.c,335 :: 		}
L_end_sample_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _sample_finger
_move_finger:
;finger.c,359 :: 		void move_finger(struct finger *fngr, unsigned int duty_cycle)
; duty_cycle start address is: 4 (R1)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
UXTH	R6, R1
; duty_cycle end address is: 4 (R1)
; fngr end address is: 0 (R0)
; fngr start address is: 16 (R4)
; duty_cycle start address is: 24 (R6)
;finger.c,361 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0) {
MOVW	R2, #lo_addr(?lstr11_finger+0)
MOVT	R2, #hi_addr(?lstr11_finger+0)
MOV	R1, R2
MOV	R0, R4
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_finger27
; fngr end address is: 16 (R4)
;finger.c,362 :: 		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);       // set new duty cycle
MOVW	R2, #lo_addr(_pwm_period+0)
MOVT	R2, #hi_addr(_pwm_period+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R6, R2
; duty_cycle end address is: 24 (R6)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #0
BL	_PWM_TIM1_Set_Duty+0
;finger.c,363 :: 		}
IT	AL
BAL	L_move_finger28
L_move_finger27:
;finger.c,365 :: 		else if(strcmp(fngr->name, "fngr_middle") == 0) {
; duty_cycle start address is: 24 (R6)
; fngr start address is: 16 (R4)
MOVW	R2, #lo_addr(?lstr12_finger+0)
MOVT	R2, #hi_addr(?lstr12_finger+0)
MOV	R1, R2
MOV	R0, R4
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_finger29
; fngr end address is: 16 (R4)
;finger.c,366 :: 		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);
MOVW	R2, #lo_addr(_pwm_period+0)
MOVT	R2, #hi_addr(_pwm_period+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R6, R2
; duty_cycle end address is: 24 (R6)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #1
BL	_PWM_TIM1_Set_Duty+0
;finger.c,367 :: 		}
IT	AL
BAL	L_move_finger30
L_move_finger29:
;finger.c,369 :: 		else if(strcmp(fngr->name, "fngr_ring") == 0) {
; duty_cycle start address is: 24 (R6)
; fngr start address is: 16 (R4)
MOVW	R2, #lo_addr(?lstr13_finger+0)
MOVT	R2, #hi_addr(?lstr13_finger+0)
MOV	R1, R2
MOV	R0, R4
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_finger31
; fngr end address is: 16 (R4)
;finger.c,370 :: 		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);
MOVW	R2, #lo_addr(_pwm_period+0)
MOVT	R2, #hi_addr(_pwm_period+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R6, R2
; duty_cycle end address is: 24 (R6)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #2
BL	_PWM_TIM1_Set_Duty+0
;finger.c,371 :: 		}
IT	AL
BAL	L_move_finger32
L_move_finger31:
;finger.c,373 :: 		else if(strcmp(fngr->name, "fngr_pinky") == 0) {
; duty_cycle start address is: 24 (R6)
; fngr start address is: 16 (R4)
MOVW	R2, #lo_addr(?lstr14_finger+0)
MOVT	R2, #hi_addr(?lstr14_finger+0)
MOV	R1, R2
MOV	R0, R4
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_finger33
; fngr end address is: 16 (R4)
;finger.c,374 :: 		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, PINKY_PWM);
MOVW	R2, #lo_addr(_pwm_period+0)
MOVT	R2, #hi_addr(_pwm_period+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R6, R2
; duty_cycle end address is: 24 (R6)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #3
BL	_PWM_TIM1_Set_Duty+0
;finger.c,375 :: 		}
IT	AL
BAL	L_move_finger34
L_move_finger33:
;finger.c,377 :: 		else if(strcmp(fngr->name, "fngr_thumb") == 0) {
; duty_cycle start address is: 24 (R6)
; fngr start address is: 16 (R4)
MOVW	R2, #lo_addr(?lstr15_finger+0)
MOVT	R2, #hi_addr(?lstr15_finger+0)
MOV	R1, R2
MOV	R0, R4
; fngr end address is: 16 (R4)
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_finger35
;finger.c,378 :: 		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);
MOVW	R2, #lo_addr(_pwm_period+0)
MOVT	R2, #hi_addr(_pwm_period+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R6, R2
; duty_cycle end address is: 24 (R6)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #0
BL	_PWM_TIM1_Set_Duty+0
;finger.c,379 :: 		}
L_move_finger35:
L_move_finger34:
L_move_finger32:
L_move_finger30:
L_move_finger28:
;finger.c,380 :: 		}
L_end_move_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _move_finger
_print_finger_info:
;finger.c,403 :: 		void print_finger_info( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #36
STR	LR, [SP, #0]
MOV	R7, R0
; fngr end address is: 0 (R0)
; fngr start address is: 28 (R7)
;finger.c,411 :: 		UART1_Write_Text("\n\rFinger Name: ");
MOVW	R1, #lo_addr(?lstr16_finger+0)
MOVT	R1, #hi_addr(?lstr16_finger+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;finger.c,412 :: 		UART1_Write_Text(fngr->name);
MOV	R0, R7
BL	_UART1_Write_Text+0
;finger.c,413 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr17_finger+0)
MOVT	R1, #hi_addr(?lstr17_finger+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;finger.c,416 :: 		LongWordToStr(fngr->input_sig_frequency, frequency_text);
ADD	R2, SP, #4
ADDW	R1, R7, #64
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;finger.c,417 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R1, #lo_addr(?lstr18_finger+0)
MOVT	R1, #hi_addr(?lstr18_finger+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;finger.c,418 :: 		UART1_Write_Text(frequency_text);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART1_Write_Text+0
;finger.c,419 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr19_finger+0)
MOVT	R1, #hi_addr(?lstr19_finger+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;finger.c,422 :: 		UART1_Write_Text("Direction of movement:             ");
MOVW	R1, #lo_addr(?lstr20_finger+0)
MOVT	R1, #hi_addr(?lstr20_finger+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;finger.c,423 :: 		if(fngr->direction_actual == EXTEND)
ADDW	R1, R7, #24
LDRH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_print_finger_info36
;finger.c,424 :: 		UART1_Write_Text("EXTEND ");
MOVW	R1, #lo_addr(?lstr21_finger+0)
MOVT	R1, #hi_addr(?lstr21_finger+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
IT	AL
BAL	L_print_finger_info37
L_print_finger_info36:
;finger.c,426 :: 		UART1_Write_Text("CONTRACT ");
MOVW	R1, #lo_addr(?lstr22_finger+0)
MOVT	R1, #hi_addr(?lstr22_finger+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
L_print_finger_info37:
;finger.c,427 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr23_finger+0)
MOVT	R1, #hi_addr(?lstr23_finger+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;finger.c,430 :: 		LongToStr(fngr->position_actual, position_text);
ADD	R2, SP, #19
ADDW	R1, R7, #20
; fngr end address is: 28 (R7)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongToStr+0
;finger.c,431 :: 		UART1_Write_Text("Position of finger:                ");
MOVW	R1, #lo_addr(?lstr24_finger+0)
MOVT	R1, #hi_addr(?lstr24_finger+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;finger.c,432 :: 		UART1_Write_Text(position_text);
ADD	R1, SP, #19
MOV	R0, R1
BL	_UART1_Write_Text+0
;finger.c,433 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr25_finger+0)
MOVT	R1, #hi_addr(?lstr25_finger+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;finger.c,436 :: 		terminal_print_count = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
STRH	R2, [R1, #0]
;finger.c,437 :: 		}
L_end_print_finger_info:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _print_finger_info
_Pcontrol_position:
;finger.c,465 :: 		unsigned int Pcontrol_position(struct finger *fngr, unsigned long SP, unsigned long MPV)
; MPV start address is: 8 (R2)
; SP start address is: 4 (R1)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; MPV end address is: 8 (R2)
; SP end address is: 4 (R1)
; fngr end address is: 0 (R0)
; fngr start address is: 0 (R0)
; SP start address is: 4 (R1)
; MPV start address is: 8 (R2)
;finger.c,469 :: 		if((SP-MPV) < 0)                                        // moved past SP
SUB	R3, R1, R2
CMP	R3, #0
IT	CS
BCS	L_Pcontrol_position38
;finger.c,470 :: 		fngr->direction_desired = EXTEND;                  // Move back
ADDW	R4, R0, #26
; fngr end address is: 0 (R0)
MOVS	R3, #0
STRH	R3, [R4, #0]
IT	AL
BAL	L_Pcontrol_position39
L_Pcontrol_position38:
;finger.c,472 :: 		fngr->direction_desired = CONTRACT;                 // Keep going
; fngr start address is: 0 (R0)
ADDW	R4, R0, #26
; fngr end address is: 0 (R0)
MOVS	R3, #1
STRH	R3, [R4, #0]
L_Pcontrol_position39:
;finger.c,474 :: 		duty_cycle = K*abs(SP-MPV);                             // proportional control
SUB	R3, R1, R2
; SP end address is: 4 (R1)
; MPV end address is: 8 (R2)
SXTH	R0, R3
BL	_abs+0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R3, _K
MOVT	R3, _K+2
VMOV	S0, R3
VMUL.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
UXTH	R3, R3
; duty_cycle start address is: 0 (R0)
UXTH	R0, R3
;finger.c,476 :: 		if(duty_cycle > 100)
CMP	R3, #100
IT	LS
BLS	L_Pcontrol_position40
;finger.c,477 :: 		duty_cycle = 100;                                  // cap duty cycle
MOVS	R0, #100
IT	AL
BAL	L_Pcontrol_position41
L_Pcontrol_position40:
;finger.c,478 :: 		else if(duty_cycle < 20)
CMP	R0, #20
IT	CS
BCS	L__Pcontrol_position53
;finger.c,479 :: 		duty_cycle = 20;                                  // boost duty cycle
MOVS	R0, #20
; duty_cycle end address is: 0 (R0)
IT	AL
BAL	L_Pcontrol_position42
L__Pcontrol_position53:
;finger.c,478 :: 		else if(duty_cycle < 20)
;finger.c,479 :: 		duty_cycle = 20;                                  // boost duty cycle
L_Pcontrol_position42:
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
L_Pcontrol_position41:
;finger.c,481 :: 		return duty_cycle;
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
;finger.c,482 :: 		}
L_end_Pcontrol_position:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pcontrol_position
_thumb_input_capture_ISR:
;finger.c,542 :: 		void thumb_input_capture_ISR() iv IVT_INT_TIM3 {
;finger.c,545 :: 		if(TIM3_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_thumb_input_capture_ISR43
;finger.c,546 :: 		TIM3_SR.UIF = 0;                                                        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;finger.c,547 :: 		tim3_overflow_count++;                                                  // Increment timer 3 overflow counter
MOVW	R1, #lo_addr(_tim3_overflow_count+0)
MOVT	R1, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;finger.c,548 :: 		}
L_thumb_input_capture_ISR43:
;finger.c,551 :: 		if (TIM3_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_thumb_input_capture_ISR44
;finger.c,552 :: 		fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;                // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+36)
MOVT	R2, #hi_addr(_fngr_pointer+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+32)
MOVT	R0, #hi_addr(_fngr_pointer+32)
STR	R1, [R0, #0]
;finger.c,553 :: 		fngr_pointer.enc_end_time = TIM3_CCR1;                                  // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR1+0)
MOVT	R0, #hi_addr(TIM3_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;finger.c,554 :: 		fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;        // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+48)
MOVT	R2, #hi_addr(_fngr_pointer+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+44)
MOVT	R0, #hi_addr(_fngr_pointer+44)
STR	R1, [R0, #0]
;finger.c,555 :: 		fngr_pointer.enc_overflow_end = tim3_overflow_count;                    // Store number of timer 3 overflows for Pointer finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;finger.c,556 :: 		fngr_pointer.enc_chan_b = POINTER_ENCODER_B;                            // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+28)
MOVT	R0, #hi_addr(_fngr_pointer+28)
STRH	R1, [R0, #0]
;finger.c,557 :: 		fngr_pointer.position_temp++;                                           // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pointer+16)
MOVT	R1, #hi_addr(_fngr_pointer+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;finger.c,558 :: 		}
L_thumb_input_capture_ISR44:
;finger.c,562 :: 		if (TIM3_SR.CC2IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_thumb_input_capture_ISR45
;finger.c,563 :: 		fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+36)
MOVT	R2, #hi_addr(_fngr_middle+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+32)
MOVT	R0, #hi_addr(_fngr_middle+32)
STR	R1, [R0, #0]
;finger.c,564 :: 		fngr_middle.enc_end_time = TIM3_CCR2;                                   // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR2+0)
MOVT	R0, #hi_addr(TIM3_CCR2+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;finger.c,565 :: 		fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+48)
MOVT	R2, #hi_addr(_fngr_middle+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+44)
MOVT	R0, #hi_addr(_fngr_middle+44)
STR	R1, [R0, #0]
;finger.c,566 :: 		fngr_middle.enc_overflow_end = tim3_overflow_count;                     // Store number of timer 3 overflows for Middle finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;finger.c,567 :: 		fngr_middle.enc_chan_b = MIDDLE_ENCODER_B;                              // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_middle+28)
MOVT	R0, #hi_addr(_fngr_middle+28)
STRH	R1, [R0, #0]
;finger.c,568 :: 		fngr_middle.position_temp++;                                            // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_middle+16)
MOVT	R1, #hi_addr(_fngr_middle+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;finger.c,569 :: 		}
L_thumb_input_capture_ISR45:
;finger.c,572 :: 		if (TIM3_SR.CC3IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_thumb_input_capture_ISR46
;finger.c,573 :: 		fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+36)
MOVT	R2, #hi_addr(_fngr_ring+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+32)
MOVT	R0, #hi_addr(_fngr_ring+32)
STR	R1, [R0, #0]
;finger.c,574 :: 		fngr_ring.enc_end_time = TIM3_CCR3;                                     // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR3+0)
MOVT	R0, #hi_addr(TIM3_CCR3+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;finger.c,575 :: 		fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+48)
MOVT	R2, #hi_addr(_fngr_ring+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+44)
MOVT	R0, #hi_addr(_fngr_ring+44)
STR	R1, [R0, #0]
;finger.c,576 :: 		fngr_ring.enc_overflow_end = tim3_overflow_count;                       // Store number of timer 3 overflows for Ring finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;finger.c,577 :: 		fngr_ring.enc_chan_b = RING_ENCODER_B;                                  // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_ring+28)
MOVT	R0, #hi_addr(_fngr_ring+28)
STRH	R1, [R0, #0]
;finger.c,578 :: 		fngr_ring.position_temp++;                                              // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_ring+16)
MOVT	R1, #hi_addr(_fngr_ring+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;finger.c,579 :: 		}
L_thumb_input_capture_ISR46:
;finger.c,582 :: 		if (TIM3_SR.CC4IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_thumb_input_capture_ISR47
;finger.c,583 :: 		fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+36)
MOVT	R2, #hi_addr(_fngr_pinky+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+32)
MOVT	R0, #hi_addr(_fngr_pinky+32)
STR	R1, [R0, #0]
;finger.c,584 :: 		fngr_pinky.enc_end_time = TIM3_CCR4;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR4+0)
MOVT	R0, #hi_addr(TIM3_CCR4+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;finger.c,585 :: 		fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+48)
MOVT	R2, #hi_addr(_fngr_pinky+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+44)
MOVT	R0, #hi_addr(_fngr_pinky+44)
STR	R1, [R0, #0]
;finger.c,586 :: 		fngr_pinky.enc_overflow_end = tim3_overflow_count;                      // Store number of timer 3 overflows for Pinky
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;finger.c,587 :: 		fngr_pinky.enc_chan_b = PINKY_ENCODER_B;                                // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pinky+28)
MOVT	R0, #hi_addr(_fngr_pinky+28)
STRH	R1, [R0, #0]
;finger.c,588 :: 		fngr_pinky.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pinky+16)
MOVT	R1, #hi_addr(_fngr_pinky+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;finger.c,589 :: 		}
L_thumb_input_capture_ISR47:
;finger.c,590 :: 		}
L_end_thumb_input_capture_ISR:
BX	LR
; end of _thumb_input_capture_ISR
_fingers_input_capture_ISR:
;finger.c,594 :: 		void fingers_input_capture_ISR() iv IVT_INT_TIM2 {
;finger.c,597 :: 		if(TIM2_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_fingers_input_capture_ISR48
;finger.c,598 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;finger.c,599 :: 		tim2_overflow_count++;                                                  // Increment timer 2 overflow counter
MOVW	R1, #lo_addr(_tim2_overflow_count+0)
MOVT	R1, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;finger.c,600 :: 		}
L_fingers_input_capture_ISR48:
;finger.c,604 :: 		if (TIM2_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_fingers_input_capture_ISR49
;finger.c,605 :: 		fngr_thumb.enc_start_time = fngr_thumb.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+36)
MOVT	R2, #hi_addr(_fngr_thumb+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+32)
MOVT	R0, #hi_addr(_fngr_thumb+32)
STR	R1, [R0, #0]
;finger.c,606 :: 		fngr_thumb.enc_end_time = TIM2_CCR1;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;finger.c,607 :: 		fngr_thumb.enc_overflow_start = fngr_thumb.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+48)
MOVT	R2, #hi_addr(_fngr_thumb+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+44)
MOVT	R0, #hi_addr(_fngr_thumb+44)
STR	R1, [R0, #0]
;finger.c,608 :: 		fngr_thumb.enc_overflow_end = tim2_overflow_count;                      // Store number of timer 2 overflows for thumb
MOVW	R0, #lo_addr(_tim2_overflow_count+0)
MOVT	R0, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;finger.c,609 :: 		fngr_thumb.enc_chan_b = THUMB_ENCODER_B;                                // Sample the second encoder channel (For direction)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_thumb+28)
MOVT	R0, #hi_addr(_fngr_thumb+28)
STRH	R1, [R0, #0]
;finger.c,610 :: 		fngr_thumb.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_thumb+16)
MOVT	R1, #hi_addr(_fngr_thumb+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;finger.c,611 :: 		}
L_fingers_input_capture_ISR49:
;finger.c,612 :: 		}
L_end_fingers_input_capture_ISR:
BX	LR
; end of _fingers_input_capture_ISR
