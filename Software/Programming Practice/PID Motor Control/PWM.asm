_InitMain:
;PWM.c,10 :: 		void InitMain() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PWM.c,11 :: 		GPIO_Digital_Input (&GPIOA_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4); // configure PORTA pins as input
MOVS	R1, #24
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;PWM.c,12 :: 		}
L_end_InitMain:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitMain
_main:
;PWM.c,14 :: 		void main() {
SUB	SP, SP, #4
;PWM.c,16 :: 		InitMain();
BL	_InitMain+0
;PWM.c,17 :: 		current_duty  = 100;                        // initial value for current_duty
MOVS	R1, #100
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
STR	R0, [SP, #0]
STRH	R1, [R0, #0]
;PWM.c,19 :: 		pwm_period = PWM_TIM1_Init(10000);
MOVW	R0, #10000
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;PWM.c,21 :: 		PWM_TIM1_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL1);  // Set current duty for PWM_TIM1
LDR	R0, [SP, #0]
LDRH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;PWM.c,23 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;PWM.c,25 :: 		while (1) {                                // endless loop
L_main0:
;PWM.c,26 :: 		if (GPIOA_IDR.B3) {                // button on RA3 pressed
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main2
;PWM.c,27 :: 		Delay_ms(1);
MOVW	R7, #55998
MOVT	R7, #0
NOP
NOP
L_main3:
SUBS	R7, R7, #1
BNE	L_main3
NOP
NOP
NOP
;PWM.c,28 :: 		current_duty = current_duty + 5;       // increment current_duty
MOVW	R2, #lo_addr(_current_duty+0)
MOVT	R2, #hi_addr(_current_duty+0)
LDRH	R0, [R2, #0]
ADDS	R1, R0, #5
UXTH	R1, R1
STRH	R1, [R2, #0]
;PWM.c,29 :: 		if (current_duty > pwm_period) {      // if we increase current_duty greater then possible pwm_period value
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R0, [R0, #0]
CMP	R1, R0
IT	LS
BLS	L_main5
;PWM.c,30 :: 		current_duty = 0;                    // reset current_duty value to zero
MOVS	R1, #0
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
STRH	R1, [R0, #0]
;PWM.c,31 :: 		}
L_main5:
;PWM.c,32 :: 		PWM_TIM1_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL1); // set newly acquired duty ratio
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;PWM.c,33 :: 		}
L_main2:
;PWM.c,35 :: 		if (GPIOA_IDR.B4) {                // button on RA4 pressed
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main6
;PWM.c,36 :: 		Delay_ms(1);
MOVW	R7, #55998
MOVT	R7, #0
NOP
NOP
L_main7:
SUBS	R7, R7, #1
BNE	L_main7
NOP
NOP
NOP
;PWM.c,37 :: 		current_duty = current_duty - 5;       // decrement current_duty
MOVW	R2, #lo_addr(_current_duty+0)
MOVT	R2, #hi_addr(_current_duty+0)
LDRH	R0, [R2, #0]
SUBS	R1, R0, #5
UXTH	R1, R1
STRH	R1, [R2, #0]
;PWM.c,38 :: 		if (current_duty > pwm_period) {      // if we decrease current_duty greater then possible pwm_period value (overflow)
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R0, [R0, #0]
CMP	R1, R0
IT	LS
BLS	L_main9
;PWM.c,39 :: 		current_duty = pwm_period;          // set current_duty to max possible value
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
STRH	R1, [R0, #0]
;PWM.c,40 :: 		}
L_main9:
;PWM.c,41 :: 		PWM_TIM1_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL1); // set newly acquired duty ratio
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;PWM.c,42 :: 		}
L_main6:
;PWM.c,44 :: 		Delay_ms(1);                             // slow down change pace a little
MOVW	R7, #55998
MOVT	R7, #0
NOP
NOP
L_main10:
SUBS	R7, R7, #1
BNE	L_main10
NOP
NOP
NOP
;PWM.c,45 :: 		}
IT	AL
BAL	L_main0
;PWM.c,46 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
