#line 1 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Completed AWD Interrupt/AWD.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 11 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Completed AWD Interrupt/AWD.c"
void motor_1_init();
void motor_1_pwm_init();
void motor_1_pwm_sweep();
unsigned int pwm_period;
void ADC_AWD();
void InitTimer3();
void Timer3_interrupt();
int motorState = 1;
int analogGo = 0;
int goStatus = 0;



int sampleFlag = 0;
unsigned int MPV;
char ToStr[15];
void Timer4_init();


void timer4_ISR() iv IVT_INT_TIM4 {
 TIM4_SR.UIF = 0;
 sampleFlag = 1;
}


void main() {
 motor_1_init();
 motor_1_pwm_init();
 InitTimer3();

 UART1_Init(115200);
 delay_ms(100);
 UART1_Write_Text("Started \n");


 Timer4_init();


 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
 GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_ALL);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);


 ADC_Set_Input_Channel(_ADC_CHANNEL_4 | _ADC_CHANNEL_3);
 ADC1_Init();


 ADC1_LTR =  0 ;
 ADC1_HTR =  400 ;
 ADC1_CR2bits.CONT = 1;
 ADC1_SQR3bits.SQ1 = 3;
 ADC1_SQR3bits.SQ2 = 4;
 ADC1_CR1bits.AWDSGL = 1;
 ADC1_CR1 |= 3;
 ADC1_CR1bits.AWDEN = 1;
 ADC1_CR2bits.SWSTART = 1;
 ADC1_CR1bits.AWDIE = 1;
 NVIC_IntEnable(IVT_INT_ADC);


 while(1){
 if (analogGo) {
 analogGo = 0;
 goStatus = !goStatus;
 GPIOC_ODR.B13 = goStatus;
 }
 if(sampleFlag)
 {
 sampleFlag = 0;
 MPV = ADC1_Get_Sample(4);
 UART1_Write_Text("\n\nFlexiforce reading = ");
 IntToStr(MPV, ToStr);

 }
 GPIOD_ODR = ADC1_Get_Sample(3);
 Delay_ms(20);
 }
 }




void Timer4_init()
{
 RCC_APB1ENR.TIM4EN = 1;
 TIM4_CR1.CEN = 0;
 TIM4_PSC = 279;
 TIM4_ARR = 59999;
 NVIC_IntEnable(IVT_INT_TIM4);
 TIM4_DIER.UIE = 1;
 TIM4_CR1.CEN = 1;
}


void ADC_AWD() iv IVT_INT_ADC ics ICS_AUTO {
 ADC1_CR1bits.AWDIE = 0;
 ADC1_SRbits.AWD = 0;
 if(ADC1_HTR <= 1000) {
 TIM3_SR.UIF = 0;
 TIM3_CNT = 0x00;
 ADC1_HTR =  4095 ;
 ADC1_LTR =  400 ;
 TIM3_DIER.UIE = 1;
 }else {
 TIM3_DIER.UIE = 0;
 ADC1_HTR =  400 ;
 ADC1_LTR =  0 ;
 }
 ADC1_CR1bits.AWDIE = 1;
}


void InitTimer3(){
 RCC_APB1ENR.TIM3EN = 1;
 TIM3_CR1.CEN = 0;
 TIM3_PSC = 7874;
 TIM3_ARR = 63999;
 NVIC_IntEnable(IVT_INT_TIM3);
 TIM3_CR1.CEN = 1;
}


void Timer3_interrupt() iv IVT_INT_TIM3 {
 TIM3_SR.UIF = 0;
 ADC1_HTR =  400 ;
 ADC1_LTR =  0 ;
 TIM3_DIER.UIE = 0;
 analogGo = 1;
}


void motor_1_init() {
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
 GPIOD_ODR.B0 = 0;
 GPIOD_ODR.B1 = 1;
}


void motor_1_pwm_init() {
 pwm_period = PWM_TIM1_Init(10000);
 PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);
 PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);
}


void motor_1_pwm_sweep() {
 if(motorState){
 PWM_TIM1_Set_Duty(10000, _PWM_NON_INVERTED, _PWM_CHANNEL1);
 motorState = 0;
 }else{
 PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);
 motorState = 1;
 }
}
