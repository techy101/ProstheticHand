#line 1 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Input Capture Full Demo/input_capture_demo.c"
#line 25 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Input Capture Full Demo/input_capture_demo.c"
unsigned int poll_flag = 0;
unsigned int overflowCount = 0;
unsigned long totalTicks = 0;
unsigned long previousTime = 0;
unsigned long presentTime = 0;
float inputPeriod = 0.0;
float inputFrequency = 0.0;
unsigned long inputEventCounter = 0;
char periodInText[15];
char frequencyInText[15];
char eventCounterInText[15];

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
 if (poll_flag && inputEventCounter) {
 poll_flag = 0;

 inputPeriod = (totalTicks * 1000) /  63999 ;
 inputFrequency = 1000 / inputPeriod;


 FloatToStr(totalTicks, periodInText);
 UART1_Write_Text("Total Ticks: ");
 UART1_Write_Text(periodInText);
 UART1_Write_Text("\n\r");

 FloatToStr(inputFrequency, frequencyInText);
 UART1_Write_Text("Frequency of incoming signal: ");
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
 TIM2_PSC =  2624 ;
 TIM2_ARR =  63999 ;
 TIM2_CR1 |= 0x10;
 TIM2_CCMR1_Input |= 0x01;
 TIM2_CCER.CC1P = 1;
 TIM2_CCER.CC1E = 1;
 TIM2_DIER.CC1IE = 1;
 TIM2_DIER.UIE = 1;
 NVIC_IntEnable(IVT_INT_TIM2);
 EnableInterrupts();
 TIM2_CR1.CEN = 1;
}



void timer2_interrupt() iv IVT_INT_TIM2 {

 NVIC_IntDisable(IVT_INT_TIM2);
 GPIOE_ODR.B10 = 1;

 if(TIM2_SR.UIF == 1) {

 TIM2_SR.UIF = 0;
 overflowCount++;
 }

 if (TIM2_SR.CC1IF == 1) {


 TIM2_SR.CC1IF = 0;
 presentTime = TIM2_CCR1;
 totalTicks = ((overflowCount << 16) - previousTime + presentTime);
 previousTime = presentTime;
 overflowCount = 0;
 inputEventCounter++;
 }



 NVIC_IntEnable(IVT_INT_TIM2);
 GPIOE_ODR.B10 = 0;
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
