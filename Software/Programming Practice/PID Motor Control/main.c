
/*
    Notes:
    - PD0 button is enable.
    - PE14 pin is direction.
    - PE9 pin is motor PWM output.
    - PB0 is Flexiforce analog input.
*/

#define analogIn GPIOA_IDR.B0
#define motorDirection GPIOE_ODR.B14
#define motorEnable GPIOD_ODR.B0


int Pcontrol(int, int);
void moveFinger(int);
int getForce();

int setP = 60;            // setpoint - what PV should be
int const margin = 4;     // accuracy of PV - 5%
float const K = 1.6;      // proportion constant for P control

int MPV;                  // measured process variable
int dutyCycle = 30;       // initial
float averageForceReading = 0.0;

int sampleFlag = 0;
char ToStr[15];
int i;
int stabilized = 0;

// 10 Hz timer handler
void timer4_ISR() iv IVT_INT_TIM4 {
    TIM4_SR.UIF = 0;                   // Clear timer 4 interrupt flag
    sampleFlag = 1;
}

// enable button handler
void EnableInt() iv IVT_INT_EXTI0 ics ICS_AUTO {
  EXTI_PR.B0 = 1;                     // clear flag
  motorEnable = ~motorEnable;         // toggle enable
}


void main()
{
   srand(50);
   
   // prepare E14 for digital output
   GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_14);
   GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0);
   motorDirection = 0;
   motorEnable = 0;        // disabled initially
   
   // set up B0 for analog input
   //GPIO_Analog_Input(&GPIOB_BASE, _GPIO_PINMASK_0);
   
   // set up 10 Hz timer
    RCC_APB1ENR.TIM4EN = 1;                                                     // Enable clock for timer 4
    TIM4_CR1.CEN = 0;                                                           // Disable timer/counter
    TIM4_PSC = 279;                                                             // Set timer 4 prescaler
    TIM4_ARR = 59999;                                                           // Set timer 4 overflow value
    NVIC_IntEnable(IVT_INT_TIM4);                                               // Enable timer 4 interrupt
    TIM4_DIER.UIE = 1;                                                          // Enable timer/counter

   // set up PWM on PE9 @ 1 kHz
   PWM_TIM1_Init(1000);
   PWM_TIM1_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL1);  // Set current duty for PWM_TIM4

   // set up enable (external interrupt)
   SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
   SYSCFG_EXTICR1 = 0x00000033;         // Map external interrupt on PD0 and PD1
   EXTI_RTSR = 0x00000001;              // Set interrupt on Rising edge (PD0)
   EXTI_FTSR = 0x00000000;              // Set Interrupt on Falling edge (none)
   EXTI_IMR |= 0x00000001;              // Unmask bit 0 to interrupt on tht line
   NVIC_IntEnable(IVT_INT_EXTI0);       //Enable external interrupt for enable pin
   
   // set up ADC1
   ADC_Set_Input_Channel(_ADC_CHANNEL_0);
   ADC1_Init();
   
   // set up UART1
   UART1_Init(115200);
   delay_ms(100);
   UART_Write_Text("\r\nStarted. ");
   
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

   TIM4_CR1.CEN = 1;    // start 10 Hz timer
   PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);
   
   for(i = 0; i < 5; i++)
         MPV = getForce();   // set up the first 5 samples
   
   while(1)
   {  
      if(~motorEnable)                 // active low
      {
        if(sampleFlag)
        {
           sampleFlag = 0;   // reset interrupt flag
           MPV = getForce();   // sample

           UART1_Write_Text("\n\nCurrent force = ");
           IntToStr(MPV, ToStr);
           UART1_Write_Text(ToStr);

           dutyCycle = Pcontrol(setP, MPV);

           UART1_Write_Text("\nPID control returns ");
           IntToStr(dutyCycle, toStr);
           UART1_Write_Text(ToStr);

           UART1_Write_Text("\nDirection = ");
           IntToStr(motorDirection, ToStr);
           UART1_Write_Text(ToStr);

           moveFinger(dutyCycle);

           if(abs(MPV - setP) < margin) {
               UART_Write_Text("\n** PV stabilized at ");
               IntToStr(MPV, toStr);
               UART1_Write_Text(ToStr);
               if(stabilized == 2) {
                 setP = (rand() % 95) + 20;    // generate a new setpoint
                 UART_Write_Text("\n** New SP = ");   // display it
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


int Pcontrol(int setP, int MPV)   // must return duty cycle which is an int
{
      if((setP-MPV) < 0)
           motorDirection = ~motorDirection; // handle direction change
      if(abs(setP-MPV) > 60)
           return 100;       // cap duty cycle
      else if(abs(setP-MPV) >= 10)
           return (int)(K*abs(setP - MPV));
      else 
           return 20;         // boost duty cycle
}

void moveFinger(int dutyCycle)
{
     PWM_TIM1_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL1);       // set new duty cycle
}

int getForce()
{
    unsigned measure;

    //Moving average over 5 samples
    measure = ADC1_Get_Sample(0);         // read analog value from channel 0
    averageForceReading = (((averageForceReading * 4) + measure) / 5);

    return (int)(averageForceReading*100/(3700-350));       //Converts read value to value between 0 and 100
}