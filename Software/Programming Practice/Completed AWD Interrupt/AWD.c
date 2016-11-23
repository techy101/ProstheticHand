#include <built_in.h>
/* ------- DEFINE VARIABLES --------*/
// Define variables 1 (mode = 0)
#define high_level        400
#define low_level         0
// Define variable 2  (mode = 1)
#define high_level2        4095
#define low_level2         400

/* --------------------------- PROTOTYPE FUNCTIONS ---------------------------- */
void motor_1_init();          //Initialize I/O for motor 1
void motor_1_pwm_init();      //Initialize PWM Timer config for motor 1
void motor_1_pwm_sweep();     //Duty cycle sweep for motor 1
unsigned int pwm_period;      //Period in ms of PWM frequency
void ADC_AWD();               // ADC interrupt handler
void InitTimer3();            // Timer 3 init
void Timer3_interrupt();      // Timer 3 interrupt handler
int motorState = 1;           // Motor 1 state variable
int analogGo = 0;
int goStatus = 0;


/*- ---------------- for sampling and printing Flexiforce values -------------- */
int sampleFlag = 0;
unsigned int MPV;
char ToStr[15];
void Timer4_init();

 // 10 Hz timer handler
void timer4_ISR() iv IVT_INT_TIM4 {
    TIM4_SR.UIF = 0;                   // Clear timer 4 interrupt flag
    sampleFlag = 1;
}

/************************* MAIN *****************************/
void main() {
     motor_1_init();                // Initialize hardware for motor 1
     motor_1_pwm_init();            // Initialize PWM for motor 1
     InitTimer3();                  // Timer3 init
     
     UART1_Init(115200);
     delay_ms(100);
     UART1_Write_Text("\r\nStarted \n");
     
     // set up 10 Hz timer
     Timer4_init();
     
     /* ------------ GPIO Initialization ------------ */
     GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP)); //LED PC13 for interrupt (output)
     GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_ALL); // LED port D (output)
     GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);  //Pin 1 (output)
     
     /* ------------ ADC Initialization ------------ */
     ADC_Set_Input_Channel(_ADC_CHANNEL_4 | _ADC_CHANNEL_3);     // Set active ADC channels
     ADC1_Init();                                                // Initialize ADC1

     /* ------------ AWD Initialization ------------ */
     ADC1_LTR = low_level;        // Set AWD guard window initial lower threshold
     ADC1_HTR = high_level;       // Set AWD guard window initial upper threshold
     ADC1_CR2bits.CONT = 1;       // Enable ADC1 continuous conversion mode
     ADC1_SQR3bits.SQ1 = 3;       // Set first channel in continuous coversion sequence to channel 3
     ADC1_SQR3bits.SQ2 = 4;       // Set second channel in continuous coversion sequence to channel 4 - NEW
     ADC1_CR1bits.AWDSGL = 1;     // Enable single channel monitoring mode for AWD
     ADC1_CR1 |= 3;               // Set channel 3 as the single monitored AWD channel
     ADC1_CR1bits.AWDEN = 1;      // Enable Analog watchdog on regular channels
     ADC1_CR2bits.SWSTART = 1;    // Start ADC1 Conversions
     ADC1_CR1bits.AWDIE = 1;      // Enable analog watchdog interrupt
     NVIC_IntEnable(IVT_INT_ADC); // Enable global ADC interrupt
     
     
     while(1){
         if (analogGo) {
            analogGo = 0;
            goStatus = !goStatus;
            GPIOC_ODR.B13 = goStatus;
         }
         if(sampleFlag)     // print Flexiforce values
         {
            sampleFlag = 0;
            MPV = ADC1_Get_Sample(4);         // read analog value from channel 4
            UART1_Write_Text("\n\nFlexiforce reading = ");
            IntToStr(MPV, ToStr);
            UART1_Write_Text(ToStr);
         }
         GPIOD_ODR = ADC1_Get_Sample(3); // Get ADC value from PA3
         Delay_ms(20);
         }
 }
/************************** MAIN ENDS *****************************/


// 10 Hz SAMPLING TIMER INITIALIZATION
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
     TIM3_PSC = 7874;               // Set timer 3 prescaler (need to determine value)
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
     analogGo = 1;
}

// MOTOR 1 HARDWARE INIT
void motor_1_init() {
     GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);        //Enable digital output for enable pin (D0) and direction pin (D1)
     GPIOD_ODR.B0 = 0;                                                           //Turn on motor enable (active low)
     GPIOD_ODR.B1 = 1;                                                           //Set initial direction
}

// MOTOR 1 PWM INIT
void motor_1_pwm_init() {
     pwm_period = PWM_TIM1_Init(10000);                               // Set PWM base frequency
     PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);          // PWM duty cycle to "current_duty" on Timer 1, channel 1
     PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);       // Start PWM
}

//MOTOR 1 PWM FUNCTION
void motor_1_pwm_sweep() {
     if(motorState){
             PWM_TIM1_Set_Duty(10000, _PWM_NON_INVERTED, _PWM_CHANNEL1);  // Setting duty cycle to 10000
             motorState = 0;
     }else{
             PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);      // Setting duty cycle to 0
             motorState = 1;
     }
}