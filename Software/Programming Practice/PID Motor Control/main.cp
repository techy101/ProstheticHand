#line 1 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 34 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
void motor_1_init();
void motor_1_pwm_init();
void InitTimer3();


unsigned int Pcontrol(int, int);
void moveFinger(unsigned int);
int getForce();
void InitTimer4();
void ADC_setup();


void UART1_init_and_log();
void UART_print_values();





int setP = 60;
int const MARGIN = 2;
float const K = 5.0;
int MPV;
unsigned int dutyCycle;
float averageForceReading = 0.0;
int sampleFlag = 0;


int analogGo = 1;


unsigned int PWM_PERIOD;
char ToStr[15];
int i;






void Timer3_interrupt() iv IVT_INT_TIM3 {
 TIM3_SR.UIF = 0;
 ADC1_HTR =  400 ;
 ADC1_LTR =  0 ;
 TIM3_DIER.UIE = 0;
 analogGo = ~analogGo;
}


void Timer4_interrupt() iv IVT_INT_TIM4 {
 TIM4_SR.UIF = 0;
 sampleFlag = 1;
}


void ADC_AWD() iv IVT_INT_ADC ics ICS_AUTO {
 ADC1_CR1bits.AWDIE = 0;
 ADC1_SRbits.AWD = 0;
 if(ADC1_HTR <= 1000)
 {
 TIM3_SR.UIF = 0;
 TIM3_CNT = 0x00;
 ADC1_HTR =  4095 ;
 ADC1_LTR =  400 ;
 TIM3_DIER.UIE = 1;
 }
 else
 {
 TIM3_DIER.UIE = 0;
 ADC1_HTR =  400 ;
 ADC1_LTR =  0 ;
 }
 ADC1_CR1bits.AWDIE = 1;
}



void main()
{
 srand(50);

 motor_1_init();
 motor_1_pwm_init();
 InitTimer3();
 InitTimer4();

 ADC_setup();
 UART1_init_and_log();

 for(i = 0; i < 5; i++)
 MPV = getForce();




 ADC_Set_Input_Channel(_ADC_CHANNEL_3);
 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
 GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_ALL);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);

 ADC1_Init();
 ADC1_LTR =  0 ;
 ADC1_HTR =  400 ;

 ADC1_CR1bits.AWDEN = 1;
 ADC1_CR1bits.AWDSGL = 0;
 ADC1_CR1bits.JAWDEN = 0;
 ADC1_CR1bits.AWDIE = 1;
 NVIC_IntEnable(IVT_INT_ADC);



 while(1)
 {
 GPIOD_ODR = ADC1_Get_Sample(3);
#line 151 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
 if( ! GPIOE_ODR.B15 
 && sampleFlag)
 {
 sampleFlag = 0;
 MPV = getForce();
 dutyCycle = Pcontrol(setP, MPV);
 moveFinger(dutyCycle);

 UART_print_values();

 if(abs(MPV - setP) < MARGIN)
 {
#line 165 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
 moveFinger(0);
 sampleFlag = 0;
 NVIC_IntDisable(IVT_INT_TIM4);
 UART_Write_Text("\n** PV stabilized at ");
 IntToStr(MPV, toStr);
 UART1_Write_Text(ToStr);
#line 176 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
 moveFinger(100);
 NVIC_IntEnable(IVT_INT_TIM4);
 MPV = getForce();
#line 185 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
 }
 }
 }
}







unsigned int Pcontrol(int setP, int MPV)
{
 if((setP-MPV) < 0)
  GPIOE_ODR.B14  =  0 ;
 else
  GPIOE_ODR.B14  =  1 ;

 if(abs(setP-MPV) > 60)
 return 100;
 else if(abs(setP-MPV) >= 10)
 return (unsigned int)(K*abs(setP - MPV));
 else
 return 0;
}

void moveFinger(unsigned int dutyCycle)
{
 PWM_TIM1_Set_Duty((dutyCycle*(PWM_PERIOD/100)), _PWM_NON_INVERTED, _PWM_CHANNEL1);
}

int getForce()
{
 unsigned measure;


 measure = ADC2_Get_Sample(3);
 averageForceReading = (((averageForceReading * 4) + measure) / 5);

 return (int)(averageForceReading*100/(3700-350));
}





void InitTimer3(){
 RCC_APB1ENR.TIM3EN = 1;
 TIM3_CR1.CEN = 0;
 TIM3_PSC = 7874;
 TIM3_ARR = 63999;
 NVIC_IntEnable(IVT_INT_TIM3);
 TIM3_CR1.CEN = 1;
}


void ADC_setup()
{

 ADC2_Init();
}


void UART1_init_and_log()
{

 UART1_Init(115200);
 delay_ms(100);
 UART_Write_Text("\r\nStarted. ");


 UART1_Write_Text("\nNotes:");
 UART1_Write_Text("\n- K = ");
 FloatToStr(K, ToStr);
 UART1_Write_Text(ToStr);
 UART1_Write_Text("\n- SP = ");
 IntToStr(setP, ToStr);
 UART1_Write_Text(ToStr);
 UART1_Write_Text("\n- MARGIN = ");
 IntToStr(MARGIN, ToStr);
 UART1_Write_Text(ToStr);
 UART1_Write_Text("\n- PWM period = ");
 IntToStr(PWM_PERIOD, ToStr);
 UART1_Write_Text(ToStr);
}


void UART_print_values()
{
 UART1_Write_Text("\n\nCurrent force = ");
 IntToStr(MPV, ToStr);
 UART1_Write_Text(ToStr);

 UART1_Write_Text("\nPID control returns ");
 IntToStr(dutyCycle, toStr);
 UART1_Write_Text(ToStr);

 UART1_Write_Text("\nDirection = ");
 if( GPIOE_ODR.B14  ==  0 )
 UART1_Write_Text("EXTEND");
 else
 UART1_Write_Text("CONTRACT");

 UART1_Write_Text("\nSetpoint = ");
 IntToStr(setP, ToStr);
 UART1_Write_Text(ToStr);
}


void motor_1_init() {
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_14 | _GPIO_PINMASK_15);
  GPIOE_ODR.B14  =  1 ;
  GPIOE_ODR.B15  = 0;
}


void motor_1_pwm_init() {
 PWM_PERIOD = PWM_TIM1_Init( 10000 );
 PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);
 PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);
}


void InitTimer4(){
 RCC_APB1ENR.TIM4EN = 1;
 TIM4_CR1.CEN = 0;
 TIM4_PSC = 279;
 TIM4_ARR = 59999;
 NVIC_IntEnable(IVT_INT_TIM4);
 TIM4_DIER.UIE = 1;
 TIM4_CR1.CEN = 1;
}
