#line 1 "C:/Users/SCSUS/Desktop/Final Demo Code/system.c"
#line 1 "c:/users/scsus/desktop/final demo code/system.h"
#line 23 "c:/users/scsus/desktop/final demo code/system.h"
extern const unsigned long MCU_FREQUENCY;
extern const unsigned long ENCODER_TIM_RELOAD;
extern const unsigned long PWM_FREQ_HZ;
extern const unsigned int ENCODER_TIM_PSC;
extern const unsigned int SAMPLE_TIM_RELOAD;
extern const unsigned int SAMPLE_TIM_PSC;
extern const unsigned int TERMINAL_PRINT_THRESH;





extern unsigned int poll_flag;
extern unsigned int terminal_print_count;
extern int analogGo;
extern int goStatus;




void init_GPIO();
void init_sample_timer();



void sample_timer_ISR();
#line 39 "C:/Users/SCSUS/Desktop/Final Demo Code/system.c"
void init_GPIO() {

 GPIO_Config(&GPIOE_BASE, _GPIO_PINMASK_10, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);
 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_10, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);
 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_13, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);
 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_8, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);
 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);


 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_7, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_1, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);


 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_14, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_8, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);


 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);


 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);


 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_4, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);


 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_8, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_7, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);
}
#line 107 "C:/Users/SCSUS/Desktop/Final Demo Code/system.c"
void init_sample_timer() {

 RCC_APB2ENR.TIM11EN = 1;
 TIM11_CR1.CEN = 0;
 TIM11_PSC = SAMPLE_TIM_PSC;
 TIM11_ARR = SAMPLE_TIM_RELOAD;
 NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);
 TIM11_DIER.UIE = 1;
 TIM11_CR1.CEN = 1;
}
#line 142 "C:/Users/SCSUS/Desktop/Final Demo Code/system.c"
void sample_timer_ISR() iv IVT_INT_TIM1_TRG_COM_TIM11 {
 TIM11_SR.UIF = 0;
 poll_flag = 1;
 terminal_print_count++;
}
