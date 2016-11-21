
/*
    Notes:
    - PD0 button is enable.
    - PE14 pin is direction.
    - PE9 pin is motor PWM output.
    - PA0 is Flexiforce analog input.
*/

#define analogIn GPIOA_IDR.B0
#define motorDirection GPIOE_ODR.B14
#define motorEnable GPIOD_ODR.B0

#define EXTEND      0           // direction toward mechanical 0
#define CONTRACT    1           // direction away from mechanical 0


int Pcontrol(int, int);
void moveFinger(int);
int getForce();

void UART_init();
void UART_print_values();
 
void Timer4_init();

int setP = 60;            // setpoint - what PV should be
int const margin = 4;     // accuracy of PV - 5%
float const KP = 5.0;      // proportion constant for P control
float const KI = 5.0;      // integral constant for I control
unsigned int PWM_PERIOD;  // needed for duty cycle conversion
int MPV;                  // measured process variable
int dutyCycle;            // initial
float averageForceReading = 0.0;

int sampleFlag = 0;
char ToStr[15];
int i;

// 10 Hz timer handler
void timer4_ISR() iv IVT_INT_TIM4 {
    TIM4_SR.UIF = 0;                   // Clear timer 4 interrupt flag
    sampleFlag = 1;
}


void main()
{
   srand(50);
   
   // prepare E14 for digital output
   GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_14);
   GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0);
   motorDirection = CONTRACT;
   motorEnable = 0;        // enabled initially
   
   // set up 10 Hz timer
    Timer4_init();

   // set up PWM on PE9 @ 1 kHz
   PWM_PERIOD = PWM_TIM1_Init(1000);
   PWM_TIM1_Set_Duty(30*(PWM_PERIOD/100), _PWM_NON_INVERTED, _PWM_CHANNEL1);  // Set current duty for PWM_TIM4

   // set up ADC1
   ADC_Set_Input_Channel(_ADC_CHANNEL_0);
   ADC1_Init();
   
   // set up UART1
   UART_init();
   
   // stuff for logs
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
         MPV = getForce();   // set up the first 5 samples - HMMMM
   
   while(1)
   {
      if(~motorEnable && sampleFlag)                 // active low
      {
          sampleFlag = 0;   // reset interrupt flag
          MPV = getForce();   // sample

          dutyCycle = Pcontrol(setP, MPV);
          
          UART_print_values();
          
          moveFinger(dutyCycle);

          if(abs(MPV - setP) < margin)                  // stop the motor, stop sampling, indicate stabilization, and restart the motor. seems superfluous.
            {
                   moveFinger(0);       // stop the motor
                   sampleFlag = 0;
                   NVIC_IntDisable(IVT_INT_TIM4);                    // stop sampling
                   UART_Write_Text("\n** PV stabilized at ");
                   IntToStr(MPV, toStr);
                   UART1_Write_Text(ToStr);

                   //setP = (rand() % 95) + 20;    // generate a new setpoint
                   //UART_Write_Text("\n** New SP = ");   // display it
                   //IntToStr(setP, toStr);
                   //UART1_Write_Text(ToStr);
                   moveFinger(60);       // start the motor
                   NVIC_IntEnable(IVT_INT_TIM4);            // start sampling again
                   MPV = getForce();                        // sample to break out of stabilization
            }
      }
   }
}


int Pcontrol(int setP, int MPV)   // must return duty cycle which is an int
{
      int DC;    // duty cycle

      if((setP-MPV) < 0)
           motorDirection = EXTEND; // handle direction change
      else
          motorDirection = CONTRACT;
          
      if(abs(setP-MPV) > 60)
           DC = 80;       // cap duty cycle
      else if(abs(setP-MPV) >= 10)
           DC = (KP*(setP - MPV))
              + KI*(setP-MPV)*dt;
      else 
           DC = 20;         // boost duty cycle
           
      return (int)DC;
}

void moveFinger(int dutyCycle)
{
     PWM_TIM1_Set_Duty(dutyCycle*(PWM_PERIOD/100), _PWM_NON_INVERTED, _PWM_CHANNEL1);       // set new duty cycle
}

int getForce()
{
    unsigned measure;

    // Moving average over 5 samples
    measure = ADC1_Get_Sample(0);         // read analog value from channel 0
    averageForceReading = (((averageForceReading * 4) + measure) / 5);

    return (int)(averageForceReading*100/(3700-350));       //Converts read value to value between 0 and 100
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
          IntToStr(motorDirection, ToStr);
          UART1_Write_Text(ToStr);

          UART1_Write_Text("\nSetpoint = ");
          IntToStr(setP, ToStr);
          UART1_Write_Text(ToStr);
}

void Timer4_init()
{
    RCC_APB1ENR.TIM4EN = 1;                                                     // Enable clock for timer 4
    TIM4_CR1.CEN = 0;                                                           // Disable timer/counter
    TIM4_PSC = 279;                                                             // Set timer 4 prescaler
    TIM4_ARR = 59999;                                                           // Set timer 4 overflow value
    NVIC_IntEnable(IVT_INT_TIM4);                                               // Enable timer 4 interrupt
    TIM4_DIER.UIE = 1;                                                          // Enable timer/counter
   TIM4_CR1.CEN = 1;                                                            // Start timer
}