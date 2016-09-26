_main:
;PWM Testing.c,60 :: 		void main() {
;PWM Testing.c,62 :: 		motor_1_init();                             //Initialize hardware for motor 1
BL	_motor_1_init+0
;PWM Testing.c,63 :: 		motor_1_pwm_init();                         //Initialize PWM for motor 1
BL	_motor_1_pwm_init+0
;PWM Testing.c,66 :: 		while(1) {                                  //Infinite loop
L_main0:
;PWM Testing.c,67 :: 		motor_1_pwm_sweep();                   //Call motor sweep function
BL	_motor_1_pwm_sweep+0
;PWM Testing.c,69 :: 		if(change_direction_flag) {            //Check if it's time to change motor direction
MOVW	R0, #lo_addr(_change_direction_flag+0)
MOVT	R0, #hi_addr(_change_direction_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main2
;PWM Testing.c,70 :: 		motor_1_toggle_direction();       //Call motor direction change function
BL	_motor_1_toggle_direction+0
;PWM Testing.c,71 :: 		}
L_main2:
;PWM Testing.c,73 :: 		if(motor_enable_flag) {                //Check if motor enable button has been pressed
MOVW	R0, #lo_addr(_motor_enable_flag+0)
MOVT	R0, #hi_addr(_motor_enable_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main3
;PWM Testing.c,74 :: 		all_motors_toggle_enable();       //Call motor enable toggle function
BL	_all_motors_toggle_enable+0
;PWM Testing.c,75 :: 		}
L_main3:
;PWM Testing.c,77 :: 		delay_ms(1);                           //Delay for functionality
MOVW	R7, #55998
MOVT	R7, #0
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;PWM Testing.c,78 :: 		}
IT	AL
BAL	L_main0
;PWM Testing.c,79 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_motor_1_init:
;PWM Testing.c,87 :: 		void motor_1_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PWM Testing.c,88 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);        //Enable digital output for enable pin (D0) and direction pin (D1)
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;PWM Testing.c,89 :: 		GPIOD_ODR.B0 = 0;                                                           //Turn on motor enable (active low)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;PWM Testing.c,90 :: 		GPIOD_ODR.B1 = 1;                                                           //Set initial direction
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;PWM Testing.c,91 :: 		}
L_end_motor_1_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_init
_motor_1_pwm_init:
;PWM Testing.c,95 :: 		void motor_1_pwm_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PWM Testing.c,96 :: 		pwm_period = PWM_TIM1_Init(pwm_frequency);                                  //Set PWM base frequency to 100Hz
MOVW	R0, #lo_addr(_pwm_frequency+0)
MOVT	R0, #hi_addr(_pwm_frequency+0)
LDRH	R0, [R0, #0]
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;PWM Testing.c,97 :: 		PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);          //PWM duty cycle to "current_duty" on Timer 1, channel 1
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;PWM Testing.c,98 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                  //Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;PWM Testing.c,99 :: 		}
L_end_motor_1_pwm_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_pwm_init
_motor_1_pwm_sweep:
;PWM Testing.c,103 :: 		void motor_1_pwm_sweep() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PWM Testing.c,104 :: 		if(current_duty < pwm_period) {                                             //Check duty cycle is < 100%
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_motor_1_pwm_sweep6
;PWM Testing.c,105 :: 		current_duty += 10;                                                    //Increment duty cycle by 10ms
MOVW	R1, #lo_addr(_current_duty+0)
MOVT	R1, #hi_addr(_current_duty+0)
LDRH	R0, [R1, #0]
ADDS	R0, #10
STRH	R0, [R1, #0]
;PWM Testing.c,106 :: 		}
IT	AL
BAL	L_motor_1_pwm_sweep7
L_motor_1_pwm_sweep6:
;PWM Testing.c,108 :: 		current_duty = 0;                                                      //Reset duty cycle to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
STRH	R1, [R0, #0]
;PWM Testing.c,109 :: 		change_direction_flag = 1;                                             //Set flag to trigger motor direction change
MOVS	R1, #1
MOVW	R0, #lo_addr(_change_direction_flag+0)
MOVT	R0, #hi_addr(_change_direction_flag+0)
STRH	R1, [R0, #0]
;PWM Testing.c,110 :: 		delay_ms(50);                                                          //Delay 50ms to prevent hard direction change on motor gears
MOVW	R7, #47486
MOVT	R7, #42
NOP
NOP
L_motor_1_pwm_sweep8:
SUBS	R7, R7, #1
BNE	L_motor_1_pwm_sweep8
NOP
NOP
NOP
;PWM Testing.c,111 :: 		}
L_motor_1_pwm_sweep7:
;PWM Testing.c,112 :: 		PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);          //Activate new duty cycle
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;PWM Testing.c,113 :: 		}
L_end_motor_1_pwm_sweep:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_pwm_sweep
_motor_1_toggle_direction:
;PWM Testing.c,117 :: 		void motor_1_toggle_direction() {
;PWM Testing.c,118 :: 		GPIOD_ODR.B1 = ~GPIOD_ODR.B1;                                               //Toggle motor rotation direction
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;PWM Testing.c,119 :: 		change_direction_flag = 0;                                                  //Disable change direction flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_change_direction_flag+0)
MOVT	R0, #hi_addr(_change_direction_flag+0)
STRH	R1, [R0, #0]
;PWM Testing.c,120 :: 		}
L_end_motor_1_toggle_direction:
BX	LR
; end of _motor_1_toggle_direction
_all_motors_toggle_enable:
;PWM Testing.c,124 :: 		void all_motors_toggle_enable() {
;PWM Testing.c,125 :: 		GPIOD_ODR.B0 = ~GPIOD_ODR.B0;                                               //Toggle enable pins on ALL motor driver chips
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;PWM Testing.c,126 :: 		motor_enable_flag = 0;                                                      //Reset motor enable flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_motor_enable_flag+0)
MOVT	R0, #hi_addr(_motor_enable_flag+0)
STRH	R1, [R0, #0]
;PWM Testing.c,127 :: 		}
L_end_all_motors_toggle_enable:
BX	LR
; end of _all_motors_toggle_enable
