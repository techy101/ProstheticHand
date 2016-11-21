#line 1 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/PI Motor Control/main.c"
#line 18 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/PI Motor Control/main.c"
int Pcontrol(int, int);
void moveFinger(int);
int getForce();

void UART_init();
void UART_print_values();

void Timer4_init();

int setP = 60;
int const margin = 4;
float const K = 1.6;
unsigned int PWM_PERIOD;
int MPV;
int dutyCycle;
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


 Timer4_init();


 PWM_PERIOD = PWM_TIM1_Init(1000);
 PWM_TIM1_Set_Duty(30*(PWM_PERIOD/100), _PWM_NON_INVERTED, _PWM_CHANNEL1);


 ADC_Set_Input_Channel(_ADC_CHANNEL_0);
 ADC1_Init();


 UART_init();


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

 PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);

 for(i = 0; i < 5; i++)
 MPV = getForce();

 while(1)
 {
 if(~ GPIOD_ODR.B0  && sampleFlag)
 {
 sampleFlag = 0;
 MPV = getForce();

 dutyCycle = Pcontrol(setP, MPV);

 UART_print_values();

 moveFinger(dutyCycle);

 if(abs(MPV - setP) < margin)
 {
 moveFinger(0);
 sampleFlag = 0;
 NVIC_IntDisable(IVT_INT_TIM4);
 UART_Write_Text("\n** PV stabilized at ");
 IntToStr(MPV, toStr);
 UART1_Write_Text(ToStr);





 moveFinger(60);
 NVIC_IntEnable(IVT_INT_TIM4);
 MPV = getForce();
 }
 }
 }
}


int Pcontrol(int setP, int MPV)
{
 int dutyCycle;

 if((setP-MPV) < 0)
  GPIOE_ODR.B14  =  0 ;
 else
  GPIOE_ODR.B14  =  1 ;

 if(abs(setP-MPV) > 60)
 dutyCycle = 80;
 else if(abs(setP-MPV) >= 10)
 dutyCycle = K*abs(setP - MPV);
 else
 dutyCycle = 20;

 return (int)dutyCycle;
}

void moveFinger(int dutyCycle)
{
 PWM_TIM1_Set_Duty(dutyCycle*(PWM_PERIOD/100), _PWM_NON_INVERTED, _PWM_CHANNEL1);
}

int getForce()
{
 unsigned measure;


 measure = ADC1_Get_Sample(0);
 averageForceReading = (((averageForceReading * 4) + measure) / 5);

 return (int)(averageForceReading*100/(3700-350));
}

void UART_init()
{
 UART1_Init(115200);
 delay_ms(100);
 UART_Write_Text("\r\nStarted. ");
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
 IntToStr( GPIOE_ODR.B14 , ToStr);
 UART1_Write_Text(ToStr);

 UART1_Write_Text("\nSetpoint = ");
 IntToStr(setP, ToStr);
 UART1_Write_Text(ToStr);
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
