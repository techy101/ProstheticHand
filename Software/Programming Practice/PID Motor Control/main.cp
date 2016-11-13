#line 1 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
#line 15 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
int Pcontrol(int, int);
void moveFinger(int);
int getForce();

int setP = 60;
int const margin = 4;
float const K = 1.6;

int MPV;
int dutyCycle = 30;
float averageForceReading = 0.0;

int sampleFlag = 0;
char ToStr[15];
int i;
int stabilized = 0;


void timer4_ISR() iv IVT_INT_TIM4 {
 TIM4_SR.UIF = 0;
 sampleFlag = 1;
}


void EnableInt() iv IVT_INT_EXTI0 ics ICS_AUTO {
 EXTI_PR.B0 = 1;
  GPIOD_ODR.B0  = ~ GPIOD_ODR.B0 ;
}


void main()
{
 srand(50);


 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_14);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0);
  GPIOE_ODR.B14  = 0;
  GPIOD_ODR.B0  = 0;





 RCC_APB1ENR.TIM4EN = 1;
 TIM4_CR1.CEN = 0;
 TIM4_PSC = 279;
 TIM4_ARR = 59999;
 NVIC_IntEnable(IVT_INT_TIM4);
 TIM4_DIER.UIE = 1;


 PWM_TIM1_Init(1000);
 PWM_TIM1_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL1);


 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR1 = 0x00000033;
 EXTI_RTSR = 0x00000001;
 EXTI_FTSR = 0x00000000;
 EXTI_IMR |= 0x00000001;
 NVIC_IntEnable(IVT_INT_EXTI0);


 ADC_Set_Input_Channel(_ADC_CHANNEL_0);
 ADC1_Init();


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
 UART1_Write_Text("\n- Margin = ");
 IntToStr(margin, ToStr);
 UART1_Write_Text(ToStr);

 TIM4_CR1.CEN = 1;
 PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);

 for(i = 0; i < 100; i++)
 MPV = getForce();

 while(1)
 {
 if(~ GPIOD_ODR.B0 )
 {
 if(sampleFlag)
 {
 sampleFlag = 0;
 MPV = getForce();

 UART1_Write_Text("\n\nCurrent force = ");
 IntToStr(MPV, ToStr);
 UART1_Write_Text(ToStr);

 dutyCycle = Pcontrol(setP, MPV);

 UART1_Write_Text("\nPID control returns ");
 IntToStr(dutyCycle, toStr);
 UART1_Write_Text(ToStr);

 UART1_Write_Text("\nDirection = ");
 IntToStr( GPIOE_ODR.B14 , ToStr);
 UART1_Write_Text(ToStr);

 moveFinger(dutyCycle);

 if(abs(MPV - setP) < margin) {
 UART_Write_Text("\n** PV stabilized at ");
 IntToStr(MPV, toStr);
 UART1_Write_Text(ToStr);
 if(stabilized == 2) {
 setP = (rand() % 95) + 20;
 UART_Write_Text("\n** New SP = ");
 IntToStr(setP, toStr);
 UART1_Write_Text(ToStr);
 stabilized = 0;
 }
 else
 stabilized++;
 }
 }
 }
 }
}


int Pcontrol(int setP, int MPV)
{
 if((setP-MPV) < 0)
  GPIOE_ODR.B14  = ~ GPIOE_ODR.B14 ;
 if(abs(setP-MPV) > 60)
 return 100;
 else if(abs(setP-MPV) >= 10)
 return (int)(K*abs(setP - MPV));
 else
 return 20;
}

void moveFinger(int dutyCycle)
{
 PWM_TIM1_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL1);
}

int getForce()
{
 unsigned measure;


 measure = ADC1_Get_Sample(0);
 averageForceReading = (((averageForceReading * 4) + measure) / 5);

 return (int)(averageForceReading*100/(3700-350));
}
