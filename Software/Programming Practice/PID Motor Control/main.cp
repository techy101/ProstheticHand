#line 1 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
#line 18 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
unsigned int Pcontrol(int, int);
void moveFinger(unsigned int);
int getForce();

int setP = 60;
int const margin = 2;
float const K = 5.0;
unsigned int PWM_PERIOD;

int MPV;
unsigned int dutyCycle;
float averageForceReading = 0.0;

int sampleFlag = 0;
char ToStr[15];
int i;
int stabilized = 0;


void timer4_ISR() iv IVT_INT_TIM4 {
 TIM4_SR.UIF = 0;
 sampleFlag = 1;
}


void main()
{
 srand(50);


 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_14);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0);
  GPIOE_ODR.B14  =  1 ;
  GPIOD_ODR.B0  = 0;


 RCC_APB1ENR.TIM4EN = 1;
 TIM4_CR1.CEN = 0;
 TIM4_PSC = 279;
 TIM4_ARR = 59999;
 NVIC_IntEnable(IVT_INT_TIM4);
 TIM4_DIER.UIE = 1;


 PWM_PERIOD = PWM_TIM1_Init( 10000 );
 PWM_TIM1_Set_Duty(50, _PWM_NON_INVERTED, _PWM_CHANNEL1);


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
 UART1_Write_Text("\n- PWM period = ");
 IntToStr(PWM_PERIOD, ToStr);
 UART1_Write_Text(ToStr);

 TIM4_CR1.CEN = 1;
 PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);

 for(i = 0; i < 5; i++)
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
 if( GPIOE_ODR.B14  ==  0 )
 UART1_Write_Text("EXTEND");
 else
 UART1_Write_Text("CONTRACT");

 UART1_Write_Text("\nSetpoint = ");
 IntToStr(setP, ToStr);
 UART1_Write_Text(ToStr);

 moveFinger(dutyCycle);

 if(abs(MPV - setP) < margin)
 {
#line 130 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
 moveFinger(0);
#line 133 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
 sampleFlag = 0;
 NVIC_IntDisable(IVT_INT_TIM4);
 UART_Write_Text("\n** PV stabilized at ");
 IntToStr(MPV, toStr);
 UART1_Write_Text(ToStr);
#line 143 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
 moveFinger(100);
#line 146 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
 NVIC_IntEnable(IVT_INT_TIM4);
 MPV = getForce();
 stabilized = 0;
#line 154 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"
 }
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


 measure = ADC1_Get_Sample(0);
 averageForceReading = (((averageForceReading * 4) + measure) / 5);

 return (int)(averageForceReading*100/(3700-350));
}
