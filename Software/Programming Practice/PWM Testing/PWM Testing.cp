#line 1 "C:/Users/Matthew/Dropbox/Senior Design Team Folder/Software/Programming Practice/PWM Testing/PWM Testing.c"
#line 45 "C:/Users/Matthew/Dropbox/Senior Design Team Folder/Software/Programming Practice/PWM Testing/PWM Testing.c"
void motor_1_init();
void motor_1_pwm_init();
void motor_1_pwm_sweep();
void motor_1_toggle_direction();
void all_motors_toggle_enable();



unsigned int current_duty = 0;
unsigned int pwm_period;
unsigned int pwm_frequency = 100;
unsigned int change_direction_flag = 0;
unsigned int motor_enable_flag = 0;


void main() {

 motor_1_init();
 motor_1_pwm_init();

enable_TIM2(true);

 while(1) {
 motor_1_pwm_sweep();

 if(change_direction_flag) {
 motor_1_toggle_direction();
 }

 if(motor_enable_flag) {
 all_motors_toggle_enable();
 }

 delay_ms(1);
 }
}







void motor_1_init() {
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
 GPIOD_ODR.B0 = 0;
 GPIOD_ODR.B1 = 1;
}



void motor_1_pwm_init() {
 pwm_period = PWM_TIM1_Init(pwm_frequency);
 PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);
 PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);
}



void motor_1_pwm_sweep() {
 if(current_duty < pwm_period) {
 current_duty += 10;
 }
 else {
 current_duty = 0;
 change_direction_flag = 1;
 delay_ms(50);
 }
 PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);
}



void motor_1_toggle_direction() {
 GPIOD_ODR.B1 = ~GPIOD_ODR.B1;
 change_direction_flag = 0;
}



void all_motors_toggle_enable() {
 GPIOD_ODR.B0 = ~GPIOD_ODR.B0;
 motor_enable_flag = 0;
}
