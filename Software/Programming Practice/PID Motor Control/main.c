
/*
    Notes:
    - PE15 button is enable.
    - PE10 pin is direction.
    - PE9 pin is motor PWM output.
    - PA7 is Flexiforce analog input.
*/

 #include <built_in.h>
/* ------- DEFINE VARIABLES --------*/
// Define variables 1 (mode = 0)
#define high_level        400
#define low_level         0
// Define variable 2  (mode = 1)
#define high_level2        4095
#define low_level2         400

#define analogIn GPIOA_IDR.B7
#define motorDirection GPIOE_ODR.B10
#define motorEnable GPIOE_ODR.B15    // new

#define EXTEND      0           // direction toward mechanical 0
#define CONTRACT    1           // direction away from mechanical 0


/* --------------------------- FUNCTION PROTOTYPES  ---------------------------- */
void motor_1_init();          //Initialize I/O for motor 1
void motor_1_pwm_init();      //Initialize PWM Timer config for motor 1
void ADC_AWD();               // ADC interrupt handler
void InitTimer3();            // Timer 3 init
void Timer3_interrupt();      // Timer 3 interrupt handler
int motorState = 1;           // Motor 1 state variable
int analogGo = 0;

int Pcontrol(int, int);
void moveFinger(int);
int getForce();
void Timer4_init();

int setP = 60;            // setpoint - what PV should be
int const MARGIN = 2;     // accuracy of PV - 2.5%
float const K = 5.0;      // proportion constant for P control

int MPV;                  // measured process variable
int dutyCycle;            // initial
float averageForceReading = 0.0;
unsigned int PWM_PERIOD;           // get period in ticks from PWM_Timer1_init

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
   
   // prepare     for digital output
   GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_15);
   motorDirection = CONTRACT;
   motorEnable = 0;        // enabled initially
   
   // set up 10 Hz timer
   Timer4_init();

   // set up PWM on PE9 @ 1 kHz
   //PWM_PERIOD = PWM_TIM1_Init(1000);
   //PWM_TIM1_Set_Duty(30*(PWM_PERIOD/100), _PWM_NON_INVERTED, _PWM_CHANNEL1);  // Set current duty for PWM_TIM1

   // set up ADC1
   ADC_Set_Input_Channel(_ADC_CHANNEL_7);                    // set up for Flexiforce input
   ADC_Set_Input_Channel(_ADC_CHANNEL_3);                    // set up for EMG input
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
   
   
   /************* AWD initializations ******************/
    //motor_1_init();                // Initialize hardware for motor 1
    motor_1_pwm_init();            // Initialize PWM for motor 1
    InitTimer3();                  // Timer3 init
    /* ------------ GPIO Initialization ------------ */

    GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP)); //LED PC13 for interrupt (output)
    GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_ALL); // LED port D (output)
    GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);  //Pin 1 (output)
    /* ------------ ADC Initialization ------------ */
    //ADC1_Init();
    ADC1_LTR = low_level;
    ADC1_HTR = high_level;
    /* ------------ AWD Initialization ------------ */
    ADC1_CR1bits.AWDEN = 1;      // Enable Analog watchdog on regular channels (enabled)
    ADC1_CR1bits.AWDSGL = 0;     // Enable the watchdog on a single channel in scan mode (disabled)
    ADC1_CR1bits.JAWDEN = 0;     // Analog watchdog enable on injected channels (disabled)
    ADC1_CR1bits.AWDIE = 1;      // Enable analog interrupt (enabled)
    NVIC_IntEnable(IVT_INT_ADC); // Enabling interrupt
   
   
   for(i = 0; i < 5; i++)
         MPV = getForce();   // set up the first 5 samples - HMMMM
   
   while(1)
   {
      if(~motorEnable 
          && sampleFlag
          && analogGo
      )
      {
               sampleFlag = 0;   // reset interrupt flag
               MPV = getForce();   // sample

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

               dutyCycle = Pcontrol(setP, MPV);

               moveFinger(dutyCycle);
               
            if(abs(MPV - setP) < MARGIN)
            {
                   moveFinger(0);       // stop the motor
                   sampleFlag = 0;
                   NVIC_IntDisable(IVT_INT_TIM4);                    // stop sampling
                   UART_Write_Text("\n** PV stabilized at ");
                   IntToStr(MPV, toStr);
                   UART1_Write_Text(ToStr);

                   /*setP = (rand() % 95) + 20;    // generate a new setpoint
                   UART_Write_Text("\n** New SP = ");   // display it
                   IntToStr(setP, toStr);*/
                   UART1_Write_Text(ToStr);
                   moveFinger(60);       // start the motor
                   NVIC_IntEnable(IVT_INT_TIM4);            // start sampling again
            }
      }
   }
}

/***************************** P control functions *****************/
int Pcontrol(int setP, int MPV)   // must return duty cycle which is an int
{
      if((setP-MPV) < 0)
           motorDirection = EXTEND; // handle direction change
      else
          motorDirection = CONTRACT;
          
      if(abs(setP-MPV) > 60)
           return 60;       // cap duty cycle
      else if(abs(setP-MPV) >= 10)
           return (int)(K*abs(setP - MPV));
      else 
           return 20;         // boost duty cycle
}

void moveFinger(int dutyCycle)
{
     PWM_TIM1_Set_Duty(dutyCycle*(PWM_PERIOD/100), _PWM_NON_INVERTED, _PWM_CHANNEL1);       // set new duty cycle
}

int getForce()
{
    unsigned measure;

    // Moving average over 5 samples
    measure = ADC1_Get_Sample(7);         // read analog value from channel 0
    averageForceReading = (((averageForceReading * 4) + measure) / 5);

    return (int)(averageForceReading*100/(3700-350));       //Converts read value to value between 0 and 100
}

void Timer4_init()
{
    RCC_APB1ENR.TIM4EN = 1;                                                     // Enable clock for timer 4
    TIM4_CR1.CEN = 0;                                                           // Disable timer/counter
    TIM4_PSC = 279;                                                             // Set timer 4 prescaler
    TIM4_ARR = 59999;                                                           // Set timer 4 overflow value
    NVIC_IntEnable(IVT_INT_TIM4);                                               // Enable timer 4 interrupt
    TIM4_DIER.UIE = 1;                                                          // Enable timer/counter
    TIM4_CR1.CEN = 1;                                                           // start 10 Hz timer
}


/*************************** AWD functions *******************/

 // ADC INTERRUPT HANDLER
void ADC_AWD() iv IVT_INT_ADC ics ICS_AUTO {
      ADC1_CR1bits.AWDIE = 0;       // Disabling analog interrupt (disable)
      ADC1_SRbits.AWD = 0;          // Reset status bit
      if(ADC1_HTR <= 1000) {
            TIM3_SR.UIF = 0;        // Clear timer 3 interrupt bit
            TIM3_CNT = 0x00;        // Reset timer value to 0
            ADC1_HTR = high_level2; // Set high threshold to MAX
            ADC1_LTR = low_level2;  // Set high threshold to 400
            TIM3_DIER.UIE = 1;      // CC1 Update Interrupt Enable
      }else {
            TIM3_DIER.UIE = 0;      // Disable timer interrupt
            ADC1_HTR = high_level;  // Set high threshold to 400
            ADC1_LTR = low_level;   // Set low threshold to 0
            }
      ADC1_CR1bits.AWDIE = 1;       //Enable analog interrupt (enabled)
}

// TIMER3 INTERRUPT ( 3 seconds )
void InitTimer3(){
     RCC_APB1ENR.TIM3EN = 1;        // Enable clock gating for timer module 3
     TIM3_CR1.CEN = 0;              // Disable timer/counter
     TIM3_PSC = 7874;              // Set timer 3 prescaler (need to determine value)
     TIM3_ARR = 63999;              // Set timer 3 overflow value at max
     NVIC_IntEnable(IVT_INT_TIM3);  // Enable timer 3 interrupt
     TIM3_CR1.CEN = 1;              // Enable timer/counter
}

// TIMER3 INTERRUPT HANDLER
void Timer3_interrupt() iv IVT_INT_TIM3 { // Interrupt handler if 6 s have past
     TIM3_SR.UIF = 0;                     // Clear timer 3 interrupt bit
     ADC1_HTR = high_level;               // Set high threshold to 400
     ADC1_LTR = low_level;                // Set low threshold to 0
     TIM3_DIER.UIE = 0;                   // Disable timer interrupt
     analogGo = ~analogGo;
}

// MOTOR 1 HARDWARE INIT
void motor_1_init() {
     GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);        //Enable digital output for enable pin (D0) and direction pin (D1)
     GPIOD_ODR.B0 = 0;                                                           //Turn on motor enable (active low)
     GPIOD_ODR.B1 = 1;                                                           //Set initial direction
}

// MOTOR 1 PWM INIT
void motor_1_pwm_init() {
     PWM_PERIOD = PWM_TIM1_Init(10000);                               // Set PWM base frequency
     PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);          // PWM duty cycle to "current_duty" on Timer 1, channel 1
     PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);       // Start PWM
}

