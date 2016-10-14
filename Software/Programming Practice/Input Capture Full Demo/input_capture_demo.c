// Input capture demo
// 10/5/2016



// Simulated encoder input: A0
// External Interrupt to simulate poll: D10
// Interrupt timing pulse: E10


// Timer 2 overflows every 5 ms (Prescaler: 13; Preload ARR: 59999
// Should figure out how to calculate overflow time from PSC, ARR, and CLK values


#define UART_BAUD_RATE                                  115200                  // Baud rate for UART's
#define STR_MAX                                         15                     // Maximum char array size for UART strings

/*
double timer2_overflow_frequency;
double timer2_overflow_period_ms;
double timer2_tick_period_ms;

timer2_overflow_frequency = (double) MCU_FREQUENCY / ((ENCODER_TIM_PSC + 1) * (ENCODER_TIM_RELOAD + 1));
timer2_overflow_period_ms = (double) 100000 / timer2_overflow_frequency;
timer2_tick_period_ms = (double) timer2_overflow_period_ms / (ENCODER_TIM_RELOAD + 1);

*/



unsigned long MCU_FREQUENCY = 168000000;

//Constants
unsigned long ENCODER_TIM_OVERFLOW;                //in us
unsigned int ENCODER_TIM_PSC = 0;
unsigned long ENCODER_TIM_RELOAD = 65535;



// Global Variables
long double timer2_overflow_frequency;
long double timer2_overflow_period_ms;
long double timer2_tick_period_ms;
long double totalInputTime;

unsigned int poll_flag = 0;                                                     // Flag to alert main that a polling event occured
unsigned int print_counter = 0;
unsigned int overflowCount = 0;                                                 // Number of timer 2 overflows
unsigned int overflowCountTemp = 0;
long pulseTicks = 0;                                                   // Total time between previous input capture event and current one
unsigned long startTime = 0;                                                 // Timer value when the previous input capture event occured
long double totalOverflowTime;
long double endTime = 0;                                                  // Timer value for the current input capture event
long double inputPeriod;                                                        // Period of incoming input capture signal
long double inputFrequency;                                                     // Frequency of incoming input capture signal
long double timePerTick;                                                        // Time between timer pulses in ms
long inputEventCounter = 0;                                            // Total number of input capture events
char periodInText[STR_MAX];                                                          // String version of input signal period
char frequencyInText[STR_MAX];                                                       // String version of input signal frequency
char eventCounterInText[STR_MAX];                                                    // String version of input event counter
char ticksInText[STR_MAX];
char overflowsInText[STR_MAX];
char timePerTickInText[STR_MAX];
char totalOverflowTimeInText[STR_MAX];
char endTimeInText[STR_MAX];
//size_t stringLength;
char testOutput[STR_MAX];


// Function Prototypes
void init_timer3();
void Timer3_interrupt();
void timer2_interrupt();                                                        // Handler for timer 2 interrupt
void external_interrupt();                                                      // Handler for external interrupt
void init_tim2_input_capture();                                                 // Initialize input capture for Timer 2 Channel 1
void init_hardware();                                                           // Initialize GPIO's
void init_serial_comm();                                                        // Initialize UART communication


// Main Program
void main() {

     // Initializations
     init_hardware();                                                           // Initialize GPIO hardware
     init_timer3();
     init_tim2_input_capture();                                                 // Initialize input capture
     init_serial_comm();                                                        // Initialize UART1 (Wired)
     
     //UART Verification
     strncpy(testOutput, "\rProgram Has Started\n\r", STR_MAX);
     UART1_Write_Text(testOutput);


     while(1) {
        if (poll_flag && print_counter >= 15) {
           poll_flag = 0;                                                       // Clear state entry flag

 //double timer2_overflow_frequency;
//double timer2_overflow_period_ms;
//double timer2_tick_period_ms;

           totalOverflowTime = (long double) timer2_overflow_period_ms * overflowCountTemp;
           totalInputTime = (long double) endTime * timer2_tick_period_ms;
           inputPeriod = (long double) totalOverflowTime + totalInputTime;
           inputFrequency = (long double) 1 / inputPeriod;




          pulseTicks = ((long) (overflowCountTemp * (ENCODER_TIM_RELOAD)) + (endTime));
           //inputPeriod = (long double) pulseTicks * timePerTick;                      // Calculate period in ms
           //inputFrequency = 1000000.0 / inputPeriod;                            // Calculate frequency in Hz
           //totalOverflowTime = (long) overflowCountTemp * ENCODER_TIM_RELOAD;
 
           //Print values to terminal
           LongDoubleToStr(timer2_tick_period_ms, timePerTickInText);                                  // Convert number of overflows to a string
           UART1_Write_Text("Time per tick: ");
           UART1_Write_Text(timePerTickInText);
           UART1_Write_Text("\n\r");

           //Print values to terminal
           IntToStr(overflowCountTemp, overflowsInText);                                  // Convert number of overflows to a string
           UART1_Write_Text("Total number of timer overflows: ");
           UART1_Write_Text(overflowsInText);
           UART1_Write_Text("\n\r");
          
           //Print values to terminal
           LongDoubleToStr(totalOverflowTime, totalOverflowTimeInText);                                  // Convert number of overflows to a string
           UART1_Write_Text("Calculated Overflow Time : ");
           UART1_Write_Text(totalOverflowTimeInText);
           UART1_Write_Text("\n\r");
        
                   //Print values to terminal
           LongDoubleToStr(endTime, endTimeInText);                                  // Convert number of overflows to a string
           UART1_Write_Text("Time read from CCP1 Register: ");
           UART1_Write_Text(endTimeInText);
           UART1_Write_Text("\n\r");
        
           //Print values to terminal
           LongToStr(pulseTicks, ticksInText);                                  // Convert number of ticks to a string
           UART1_Write_Text("Total number of ticks between events: ");
           UART1_Write_Text(ticksInText);
           UART1_Write_Text("\n\r");
           
           LongDoubleToStr(inputPeriod, periodInText);                               // Convert period float to string
           UART1_Write_Text("Period of incoming signal (ms): ");
           UART1_Write_Text(periodInText);
           UART1_Write_Text("\n\r");

           LongDoubleToStr(inputFrequency, frequencyInText);                         // Convert Frequency float to string
           UART1_Write_Text("Frequency of incoming signal (Hz): ");
           UART1_Write_Text(frequencyInText);
           UART1_Write_Text("\n\r");
           
           LongToStr(inputEventCounter, eventCounterInText);                    // Convert input event counter long to string
           UART1_Write_Text("Number of input capture events: ");
           UART1_Write_Text(eventCounterInText);
           UART1_Write_Text("\n\n\n\r");

           inputEventCounter = 0;                                               // Reset input event counter for next
           print_counter = 0;
        }
        
        else if (poll_flag && !inputEventCounter) {
           UART1_Write_Text("No Events Detected\n\n\r");
           poll_flag = 0;
           inputEventCounter = 0;
        }
     }
}


//**********  Initialize input capture for Timer 2 Channel 1  **********
void init_tim2_input_capture() {

     RCC_APB1ENR.TIM2EN = 1;                                                    // Enable clock gating for timer module 2
     TIM2_CR1.CEN = 0;                                                          // Disable timer/counter
     TIM2_PSC = ENCODER_TIM_PSC;                                                // Set timer 2 prescaler (need to determine value)
     TIM2_ARR = ENCODER_TIM_RELOAD;                                             // Set timer 2 overflow value at max
     TIM2_CR1 |= 0x10;                                                          // Set counter direction as upcounting (DIR bit)
     TIM2_CCMR1_Input |= 0x01;                                                  // Set capture channel 1 as input (CC1S = 01)
     TIM2_CCER.CC1P = 1;                                                        // Set capture on rising edge event
     TIM2_CCER.CC1E = 1;                                                        // Enable capture on channel 1
     TIM2_DIER.CC1IE = 1;                                                       // Enable capture 1 interrupt
     TIM2_DIER.UIE = 1;                                                         // CC1 Update Interrupt Enable
     NVIC_IntEnable(IVT_INT_TIM2);                                              // Enable timer 2 interrupt
     //EnableInterrupts();                                                      // Probably unneeded due to previous line
     TIM2_CNT = 0x00;
     TIM2_CR1.CEN = 1;                                                          // Enable timer/counter

     timer2_overflow_frequency = (long double) MCU_FREQUENCY / ((ENCODER_TIM_PSC + 1) * (ENCODER_TIM_RELOAD + 1));
     timer2_overflow_period_ms = (long double) 100000 / timer2_overflow_frequency;
     timer2_tick_period_ms = (long double) timer2_overflow_period_ms / (ENCODER_TIM_RELOAD + 1);
 }

//**********  Interrupt handler for Timer 2  **********
void timer2_interrupt() iv IVT_INT_TIM2 {
     TIM2_CNT = 0x00;
     NVIC_IntDisable(IVT_INT_TIM2);                                             // Disable timer 2 interrupts

     if(TIM2_SR.UIF == 1) {                                                     // If timer 2 overflow event occured
        TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
        overflowCount++;                                                        // Increment overflow counter
     }

     if (TIM2_SR.CC1IF == 1) {                                                  // If Input Capture event occured
        TIM2_SR.CC1IF = 0;                                                      // Clear input capture event bit
        endTime = TIM2_CCR1;                                                // Read stored input capture time

        overflowCountTemp = overflowCount;
        overflowCount = 0;                                                      // Reset the overflow counter to 0
        inputEventCounter++;                                                    // Increment total input capture event counter
     }

     //TIM2_SR.CC1IF = 0;                                                       // Reset input capture event bit
     //TIM2_SR.UIF = 0;                                                         // Reset timer 2 interupt bit
     NVIC_IntEnable(IVT_INT_TIM2);                                              // Re-enable timer 2 interrupt
     //GPIOE_ODR.B10 = 0;                                                         // Set handler timing pin low
}


//**********  Handler for External Interrupt  **********
void external_interrupt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {

     EXTI_PR.B10 = 1;                                                           // Clear external interrupt bit
     poll_flag = 1;                                                             // Set poll flag for main
     //UART1_Write_Text("Inside external interrupt handler");                   // ****DEBUG****
}


//*********  Initialize GPIO's and external interrupt  **********
void init_hardware() {

     // Initialize Output Pin
     GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                        // Enable digital output on E10
     GPIOE_ODR.B10 = 0;                                                         // Set pin E10 low
     
     //Initialize AF for timer 2 channel 1
     GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);
     
     /* Initialize input for external interrupt button
     GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10);                         // Enable digital output D10
     SYSCFGEN_bit = 1;                                                          // Enable clock for alternate pin functions
     SYSCFG_EXTICR3 = 0x00000300;                                               // Map external interrupt on PD10
     EXTI_RTSR = 0x00000000;                                                    // Set interrupt on Rising edge (none)
     EXTI_FTSR = 0x00000400;                                                    // Set Interrupt on Falling edge (PD10)
     EXTI_IMR |= 0x00000400;                                                    // Set mask to interrupt on bit 10
     NVIC_IntEnable(IVT_INT_EXTI15_10);                                             // Enable External interrupt
     */
}


//**********  Initialize serial communications (Wired UART)  **********
void init_serial_comm() {

     UART1_Init(UART_BAUD_RATE);                                                // Configure UART 1
     Delay_ms(200);                                                             // Wait for UART to stabilize
}



void init_timer3(){                                                              // Interrupts every 100ms
  RCC_APB1ENR.TIM3EN = 1;
  TIM3_CR1.CEN = 0;
  TIM3_PSC = 279;
  TIM3_ARR = 59999;
  NVIC_IntEnable(IVT_INT_TIM3);
  TIM3_DIER.UIE = 1;
  TIM3_CR1.CEN = 1;
}

void Timer3_interrupt() iv IVT_INT_TIM3 {
  TIM3_SR.UIF = 0;
  poll_flag = 1;
  print_counter++;
}