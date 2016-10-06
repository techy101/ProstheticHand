#line 1 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Input Capture Full Demo/input_capture_demo.c"
#line 23 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Input Capture Full Demo/input_capture_demo.c"
unsigned int ENCODER_TIM_OVERFLOW = 5;
unsigned int ENCODER_TIM_PSC = 13;
unsigned int ENCODER_TIM_RELOAD = 59999;




unsigned int poll_flag = 0;
unsigned int overflowCount = 0;
unsigned long long pulseTicks = 0;
unsigned long startTime = 0;
unsigned long endTime = 0;
float inputPeriod = 0.0;
float inputFrequency = 0.0;
float timePerTick = 0.0;
unsigned long inputEventCounter = 0;
char periodInText[ 100 ];
char frequencyInText[ 100 ];
char eventCounterInText[ 100 ];
char ticksInText[ 100 ];
char overflowsInText[ 100 ];

char testOutput[ 100 ];



void timer2_interrupt();
void external_interrupt();
void init_tim2_input_capture();
void init_hardware();
void init_serial_comm();



void main() {


 init_hardware();
 init_tim2_input_capture();
 init_serial_comm();


 strncpy(testOutput, "\rProgram Has Started\n\r",  100 );
 UART1_Write_Text(testOutput);


 while(1) {
 if (poll_flag && inputEventCounter >= 100) {
 poll_flag = 0;


 inputPeriod = (float) pulseTicks * timePerTick;
 inputFrequency = 1000000.0 / inputPeriod;


 IntToStr(overflowCount, overflowsInText);
 UART1_Write_Text("Total number of timer overflows: ");
 UART1_Write_Text(overflowsInText);
 UART1_Write_Text("\n\r");


 LongLongUnsignedToStr(pulseTicks, ticksInText);
 UART1_Write_Text("Total number of ticks between events: ");
 UART1_Write_Text(ticksInText);
 UART1_Write_Text("\n\r");

 FloatToStr(inputPeriod, periodInText);
 UART1_Write_Text("Period of incoming signal (us): ");
 UART1_Write_Text(periodInText);
 UART1_Write_Text("\n\r");

 FloatToStr(inputFrequency, frequencyInText);
 UART1_Write_Text("Frequency of incoming signal (Hz): ");
 UART1_Write_Text(frequencyInText);
 UART1_Write_Text("\n\r");

 LongToStr(inputEventCounter, eventCounterInText);
 UART1_Write_Text("Number of input capture events: ");
 UART1_Write_Text(eventCounterInText);
 UART1_Write_Text("\n\n\n\r");

 inputEventCounter = 0;
 }

 else if (poll_flag && !inputEventCounter) {
 UART1_Write_Text("No Events Detected\n\n\r");
 poll_flag = 0;
 inputEventCounter = 0;
 }
 }
}



void init_tim2_input_capture() {

 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = ENCODER_TIM_PSC;
 TIM2_ARR = ENCODER_TIM_RELOAD;
 TIM2_CR1 |= 0x10;
 TIM2_CCMR1_Input |= 0x01;
 TIM2_CCER.CC1P = 1;
 TIM2_CCER.CC1E = 1;
 TIM2_DIER.CC1IE = 1;
 TIM2_DIER.UIE = 1;
 NVIC_IntEnable(IVT_INT_TIM2);
 EnableInterrupts();
 TIM2_CR1.CEN = 1;

 timePerTick = (float) (1000.0 * ENCODER_TIM_OVERFLOW) / ENCODER_TIM_RELOAD;
}



void timer2_interrupt() iv IVT_INT_TIM2 {

 NVIC_IntDisable(IVT_INT_TIM2);


 if(TIM2_SR.UIF == 1) {


 TIM2_SR.UIF = 0;
 overflowCount++;
 }

 if (TIM2_SR.CC1IF == 1) {


 TIM2_SR.CC1IF = 0;
 endTime = TIM2_CCR1;
 pulseTicks = (((long long) overflowCount * 59999) - startTime + endTime);
 startTime = endTime;
 overflowCount = 0;
 inputEventCounter++;
 }



 NVIC_IntEnable(IVT_INT_TIM2);

}



void external_interrupt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {

 EXTI_PR.B10 = 1;
 poll_flag = 1;

}



void init_hardware() {


 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);
 GPIOE_ODR.B10 = 0;


 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);


 GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10);
 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR3 = 0x00000300;
 EXTI_RTSR = 0x00000000;
 EXTI_FTSR = 0x00000400;
 EXTI_IMR |= 0x00000400;
 NVIC_IntEnable(IVT_INT_EXTI15_10);
}



void init_serial_comm() {

 UART1_Init( 115200 );
 Delay_ms(200);
}
