
/*
    Notes:
    - PE15 button is enable.
    - PE14 button is direction.
    - PD13 is motor PWM output.
*/

#define motorDirection GPIOE_ODR.B14
#define motorEnable GPIOE_ODR.B15


int Pcontrol(int, int);
void moveFinger(int);
int getForce();

int setP = 60;            // setpoint - what PV should be
int const margin = 2;     // accuracy of PV - 2%
float const K = 1.6;      // proportion constant for P control

int MPV;                  // measured process variable
int dutyCycle = 30;       // initial

int sampleFlag = 0;
char ToStr[15];

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
   
   // prepare E14 and E15 for digital output
   GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_14 | _GPIO_PINMASK_15);
   motorDirection = 0;
   motorEnable = 1;
   
   // set up 10 Hz timer
    RCC_APB1ENR.TIM4EN = 1;                                                     // Enable clock for timer 4
    TIM4_CR1.CEN = 0;                                                           // Disable timer/counter
    TIM4_PSC = 279;                                                             // Set timer 4 prescaler
    TIM4_ARR = 59999;                                                           // Set timer 4 overflow value
    NVIC_IntEnable(IVT_INT_TIM4);                                               // Enable timer 4 interrupt
    TIM4_DIER.UIE = 1;                                                          // Enable timer/counter

   // set up PWM on PD13 @ 1 kHz
   PWM_TIM4_Init(1000);
   PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL2);  // Set current duty for PWM_TIM4

   // set up enable (external interrupt)
   SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
   SYSCFG_EXTICR1 = 0x00000033;         // Map external interrupt on PD0 and PD1
   EXTI_RTSR = 0x00000001;              // Set interrupt on Rising edge (PD0)
   EXTI_FTSR = 0x00000000;              // Set Interrupt on Falling edge (none)
   EXTI_IMR |= 0x00000001;              // Unmask bit 0 to interrupt on tht line
   NVIC_IntEnable(IVT_INT_EXTI0);       //Enable external interrupt for enable pin
   
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
   PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);
   
   while(1)
   {  
      if(motorEnable)
      {
        if(sampleFlag)
        {
           sampleFlag = 0;   // reset interrupt flag
           //MPV = getForce();
           // maybe hack by starting at 0 and incrementing by 10s? gah...

           UART1_Write_Text("\n\nCurrent position = ");
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
               //break;     // stop since user input for a new SP isn't possible
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
      else if(abs(setP-MPV) > 10)
           return int(K*abs(setP - MPV));
      else
           return 20;         // boost duty cycle
}

void moveFinger(int dutyCycle)
{
     PWM_TIM4_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL2);       // set new duty cycle
}

int getForce() 
{

}