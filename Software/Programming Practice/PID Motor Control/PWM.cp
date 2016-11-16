#line 1 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/PWM.c"
#line 7 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/PWM.c"
unsigned int current_duty, old_duty = 0;
unsigned int pwm_period;

void InitMain() {
 GPIO_Digital_Input (&GPIOA_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
}

void main() {

 InitMain();
 current_duty = 100;

 pwm_period = PWM_TIM1_Init(10000);

 PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);

 PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);

 while (1) {
 if (GPIOA_IDR.B3) {
 Delay_ms(1);
 current_duty = current_duty + 5;
 if (current_duty > pwm_period) {
 current_duty = 0;
 }
 PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);
 }

 if (GPIOA_IDR.B4) {
 Delay_ms(1);
 current_duty = current_duty - 5;
 if (current_duty > pwm_period) {
 current_duty = pwm_period;
 }
 PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);
 }

 Delay_ms(1);
 }
}
