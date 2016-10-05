#line 1 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Timer2 Input Capture/Timer2 Interrupt.c"
#line 28 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Timer2 Input Capture/Timer2 Interrupt.c"
unsigned int overflow_count = 0;
unsigned long pulse_ticks = 0;
unsigned long start_time = 0;
unsigned long end_time = 0;


void init_tim2_input_capture() {
 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = 2563;
 TIM2_ARR = 65522;
 TIM2_CR1.B4 = 0;
 TIM2_CR1.B8 = 0;
 TIM2_CR1.B9 = 0;
 TIM2_CCMR1_Input.B1 = 0;
 TIM2_CCMR1_Input.B0 = 1;
 TIM2_CCER.CC1P = 1;
 TIM2_CCER.CC1E = 1;
 TIM2_CCMR1_Input.B3 = 0;
 TIM2_CCMR1_Input.B2 = 0;
 TIM2_CCMR1_Input.B7 = 0;
 TIM2_CCMR1_Input.B6 = 0;
 TIM2_CCMR1_Input.B5 = 0;
 TIM2_CCMR1_Input.B4 = 0;
 TIM2_DIER.CC1IE = 1;
 TIM2_DIER.UIE = 1;
 NVIC_IntEnable(IVT_INT_TIM2);
 EnableInterrupts();
 TIM2_CR1.CEN = 1;
}


void Timer2_interrupt() iv IVT_INT_TIM2 {
 NVIC_IntDisable(IVT_INT_TIM2);
 if(TIM2_SR.UIF == 1) {
 TIM2_SR.UIF = 0;
 overflow_count++;
 }

 if (TIM2_SR.CC1IF == 1) {
 TIM2_SR.CC1IF = 0;
 end_time = TIM2_CCR1;
 pulse_ticks = (overflow_count << 16) - start_time + end_time;
 start_time = end_time;
 overflow_count = 0;
 GPIOE_ODR = ~GPIOE_ODR;







 UART1_Write(0x30);

 delay_ms(1000);
 GPIOE_ODR = ~GPIOE_ODR;
 }

 TIM2_SR.CC1IF = 0;
 TIM2_SR.UIF = 0;
 NVIC_IntEnable(IVT_INT_TIM2);

}

void main() {
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);
 GPIOE_ODR = 0;
 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);

 init_tim2_input_capture();

 UART1_Init(115200);
 Delay_ms(200);

 while(1) ;
}
