#line 1 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Prosthetic Hand Code/main.c"
#line 38 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Prosthetic Hand Code/main.c"
void motor_1_init();
void motor_1_pwm_init();
void motor_1_pwm_sweep();
void motor_1_toggle_direction();
void all_motors_toggle_enable();
void interrupt_init();
void UART_Wired_init();
void UART_BT_init();



unsigned int current_duty = 0;
unsigned int pwm_stopped = 0;
unsigned int pwm_period;
unsigned int pwm_frequency = 100;
unsigned int change_direction_flag = 0;
unsigned int motor_enable_flag = 0;
char uart_rd;

void main() {

 motor_1_init();
 motor_1_pwm_init();
 interrupt_init();
 UART_Wired_init();
 UART_BT_init();
 NVIC_IntEnable(IVT_INT_USART1);
 NVIC_IntEnable(IVT_INT_USART2);
 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR1=0b0010001000000000;
 EXTI_IMR = EXTI_IMR | 0b1100;
 EXTI_RTSR = 0b0;
 EXTI_FTSR = EXTI_RTSR | 0b1100;

 RXNEIE_USART1_CR1_bit =1;
 RXNEIE_USART2_CR1_bit =1;
 TCIE_bit = 1;
 TXEIE_bit = 1;

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
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_14 | _GPIO_PINMASK_15);
 GPIOE_ODR.B14 = 0;
 GPIOE_ODR.B15 = 1;
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

 delay_ms(50);
 }
 PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);
}



void motor_1_toggle_direction() {

  GPIOE_ODR.B15  = ~ GPIOE_ODR.B15 ;
 change_direction_flag = 0;
 UART1_Write_Text("Direction changed\n");
 UART2_Write_Text("Direction changed\n");
}



void all_motors_toggle_enable() {
 GPIOE_ODR.B14 = ~GPIOE_ODR.B14;
 motor_enable_flag = 0;
 UART1_Write_Text("Motor Enable changed\n");
 UART2_Write_Text("Motor Enable changed\n");
}




void UART_Wired_init() {
 UART1_Init(115200);
 Delay_ms(100);

 UART1_Write_Text("Start FTDI Wired");
 UART1_Write(13);
 UART1_Write(10);
}

void UART_BT_init() {

 UART2_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PD56);
 Delay_ms(100);



 UART2_Write_Text("Start Bluetooth");
 UART2_Write(13);
 UART2_Write(10);
}




void interrupt_init() {

 GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);



 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR1 = 0x00000033;
 EXTI_RTSR = 0x00000003;
 EXTI_FTSR = 0x00000000;
 EXTI_IMR |= 0x00000003;
 NVIC_IntEnable(IVT_INT_EXTI0);
 NVIC_IntEnable(IVT_INT_EXTI1);
}

void EnableInt() iv IVT_INT_EXTI0 ics ICS_AUTO {
 EXTI_PR.B0 = 1;
 motor_enable_flag = 1;
}

void DirectionInt() iv IVT_INT_EXTI1 ics ICS_AUTO {
 EXTI_PR.B1 = 1;
 change_direction_flag = 1;
}

 void USART1_INT() iv IVT_INT_USART1 ics ICS_AUTO {
 if(UART1_Data_ready()) {
 uart_rd = UART1_Read();

 if(uart_rd == 'd') {
 change_direction_flag = 1;
 }

 else if(uart_rd == 'e') {
 motor_enable_flag = 1;
 }

 else if(uart_rd == 's') {
 if(pwm_stopped == 0) {
 PWM_TIM1_Stop(_PWM_CHANNEL1);
 pwm_stopped = 1;
 UART1_Write_Text("PWM Stopped\n");
 UART2_Write_Text("PWM Stopped\n");
 }

 else {
 motor_1_pwm_init();
 pwm_stopped = 0;
 UART1_Write_Text("PWM Started\n");
 UART2_Write_Text("PWM Started\n");
 }
 }
 }

}

 void USART2_INT() iv IVT_INT_USART2 ics ICS_AUTO {
 if (UART2_Data_Ready()) {
 uart_rd = UART2_Read();

 if(uart_rd == 'd') {
 change_direction_flag = 1;
 }

 else if(uart_rd == 'e') {
 motor_enable_flag = 1;
 }

 else if(uart_rd == 's') {
 if(pwm_stopped == 0) {
 PWM_TIM1_Stop(_PWM_CHANNEL1);
 pwm_stopped = 1;
 UART1_Write_Text("PWM Stopped\n");
 UART2_Write_Text("PWM Stopped\n");
 }

 else {
 motor_1_pwm_init();
 pwm_stopped = 0;
 UART1_Write_Text("PWM Started\n");
 UART2_Write_Text("PWM Started\n");
 }
 }
 }
}
