// Input capture demo
// 10/5/2016



// Simulated encoder input: A0
// External Interrupt to simulate poll: D10
// Interrupt timing pulse: E10

// Timer 2 overflows every 1 second


#define TIMER_PRESCALER                                 2624
#define TIMER_RELOAD_VALUE                              63999
#define UART_BAUD_RATE                                  115200
#define STR_MAX                                         100




//TESTING AREA!!!


// Global Variables
unsigned int poll_flag = 0;                                                     // Flag to alert main that a polling event occured
unsigned int overflowCount = 0;                                                 // Number of timer 2 overflows
unsigned long totalTicks = 0;                                                   // Total time between previous input capture event and current one
unsigned long previousTime = 0;                                                 // Timer value when the previous input capture event occured
unsigned long presentTime = 0;                                                  // Timer value for the current input capture event
float inputPeriod = 0.0;                                                          // Period of incoming input capture signal
float inputFrequency = 0.0;                                                       // Frequency of incoming input capture signal
unsigned long inputEventCounter = 0;                                            // Total number of input capture events
char periodInText[15];                                                          // String version of input signal period
char frequencyInText[15];                                                       // String version of input signal frequency
char eventCounterInText[15];                                                    // String version of input event counter
//size_t stringLength;
char testOutput[STR_MAX];

// Function Prototypes
void timer2_interrupt();                                                        // Handler for timer 2 interrupt
void external_interrupt();                                                      // Handler for external interrupt
void init_tim2_input_capture();                                                 // Initialize input capture for Timer 2 Channel 1
void init_hardware();                                                           // Initialize GPIO's
void init_serial_comm();                                                        // Initialize UART communication


// Main Program
void main() {

     // Initializations
     init_hardware();                                                           // Initialize GPIO hardware
     init_tim2_input_capture();                                                 // Initialize input capture
     init_serial_comm();                                                        // Initialize UART1 (Wired)
     
     //UART Verification
     strncpy(testOutput, "\rProgram Has Started\n\r", STR_MAX);
     UART1_Write_Text(testOutput);


     while(1) {
        if (poll_flag && inputEventCounter) {
           poll_flag = 0;                                                       // Clear state entry flag

           inputPeriod = (totalTicks * 1000) / TIMER_RELOAD_VALUE;              // Calculate period in ms
           inputFrequency = 1000 / inputPeriod;                                 // Calculate frequency in Hz
           
           //Print values to terminal
           FloatToStr(totalTicks, periodInText);                               // Convert period float to string
           UART1_Write_Text("Total Ticks: ");
           UART1_Write_Text(periodInText);
           UART1_Write_Text("\n\r");

           FloatToStr(inputFrequency, frequencyInText);                         // Convert Frequency float to string
           UART1_Write_Text("Frequency of incoming signal: ");
           UART1_Write_Text(frequencyInText);
           UART1_Write_Text("\n\r");
           
           LongToStr(inputEventCounter, eventCounterInText);                    // Convert input event counter long to string
           UART1_Write_Text("Number of input capture events: ");
           UART1_Write_Text(eventCounterInText);
           UART1_Write_Text("\n\n\n\r");

           inputEventCounter = 0;                                               // Reset input event counter for next
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
     TIM2_PSC = TIMER_PRESCALER;                                                // Set timer 2 prescaler (need to determine value)
     TIM2_ARR = TIMER_RELOAD_VALUE;                                             // Set timer 2 overflow value at max
     TIM2_CR1 |= 0x10;                                                          // Set counter direction as upcounting (DIR bit)
     TIM2_CCMR1_Input |= 0x01;                                                  // Set capture channel 1 as input (CC1S = 01)
     TIM2_CCER.CC1P = 1;                                                        // Set capture on rising edge event
     TIM2_CCER.CC1E = 1;                                                        // Enable capture on channel 1
     TIM2_DIER.CC1IE = 1;                                                       // Enable capture 1 interrupt
     TIM2_DIER.UIE = 1;                                                         // CC1 Update Interrupt Enable
     NVIC_IntEnable(IVT_INT_TIM2);                                              // Enable timer 2 interrupt
     EnableInterrupts();                                                      // Probably unneeded due to previous line
     TIM2_CR1.CEN = 1;                                                          // Enable timer/counter
}                                                        


//**********  Interrupt handler for Timer 2  **********
void timer2_interrupt() iv IVT_INT_TIM2 {

     NVIC_IntDisable(IVT_INT_TIM2);                                             // Disable timer 2 interrupts
     GPIOE_ODR.B10 = 1;                                                         // ****DEBUG****

     if(TIM2_SR.UIF == 1) {                                                     // If timer 2 overflow event occured
        //UART1_Write_Text("In overflow handler\n\r");                          // ****DEBUG****
        TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
        overflowCount++;                                                        // Increment overflow counter
     }

     if (TIM2_SR.CC1IF == 1) {                                                  // If Input Capture event occured
      //GPIOE_ODR.B10 = 1;                                                      // ****DEBUG****
        //UART1_Write_Text("In capture event handler\n\r");                     // ****DEBUG****
        TIM2_SR.CC1IF = 0;                                                      // Clear input capture event bit
        presentTime = TIM2_CCR1;                                                // Read stored input capture time
        totalTicks = ((overflowCount << 16) - previousTime + presentTime);        // Calculate total ticks between input capture events
        previousTime = presentTime;                                             // Store time of latest input capture event for use in next instance
        overflowCount = 0;                                                      // Reset the overflow counter to 0
        inputEventCounter++;                                                    // Increment total input capture event counter
     }

     //TIM2_SR.CC1IF = 0;                                                       // Reset input capture event bit
     //TIM2_SR.UIF = 0;                                                         // Reset timer 2 interupt bit
     NVIC_IntEnable(IVT_INT_TIM2);                                              // Re-enable timer 2 interrupt
     GPIOE_ODR.B10 = 0;                                                         // Set handler timing pin low
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
     
     // Initialize input for external interrupt button
     GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10);                         // Enable digital output D10
     SYSCFGEN_bit = 1;                                                          // Enable clock for alternate pin functions
     SYSCFG_EXTICR3 = 0x00000300;                                               // Map external interrupt on PD10
     EXTI_RTSR = 0x00000000;                                                    // Set interrupt on Rising edge (none)
     EXTI_FTSR = 0x00000400;                                                    // Set Interrupt on Falling edge (PD10)
     EXTI_IMR |= 0x00000400;                                                    // Set mask to interrupt on bit 10
     NVIC_IntEnable(IVT_INT_EXTI15_10);                                             // Enable External interrupt
}


//**********  Initialize serial communications (Wired UART)  **********
void init_serial_comm() {

     UART1_Init(UART_BAUD_RATE);                                                // Configure UART 1
     Delay_ms(200);                                                             // Wait for UART to stabilize
}