#line 1 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Input Capture Full Demo/input_capture_demo.c"
#line 19 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Input Capture Full Demo/input_capture_demo.c"
unsigned long ENCODER_TIM_OVERFLOW;





long double timer_period_ms;
unsigned long clk_freq = 168000000;
unsigned long tim_arr = 65535;
unsigned int tim_psc = 100;
unsigned long tim_ticks_remain;
unsigned long old_tim_ticks_remain;
unsigned long tim_overflow_ticks;
long double input_sig_freq;
long double input_sig_period;
unsigned long tim_ticks_total;



long double timer2_overflow_frequency;
long double timer2_overflow_period_ms;
long double timer2_tick_period_ms;
long double totalInputTime;

unsigned int poll_flag = 0;
unsigned int print_counter = 0;
unsigned int overflowCount = 0;
unsigned int overflowCountTemp = 0;
long pulseTicks = 0;
unsigned long startTime = 0;
long double totalOverflowTime;
long double endTime = 0;
long double inputPeriod;
long double inputFrequency;
long double timePerTick;
long inputEventCounter = 0;
char periodInText[ 15 ];
char frequencyInText[ 15 ];
char eventCounterInText[ 15 ];
char ticksInText[ 15 ];
char overflowsInText[ 15 ];
char timePerTickInText[ 15 ];
char totalOverflowTimeInText[ 15 ];
char endTimeInText[ 15 ];

char testOutput[ 15 ];



void init_timer3();
void Timer3_interrupt();
void timer2_interrupt();
void external_interrupt();
void init_tim2_input_capture();
void init_hardware();
void init_serial_comm();



void main() {


 init_hardware();
 init_timer3();
 init_tim2_input_capture();
 init_serial_comm();


 strncpy(testOutput, "\rProgram Has Started\n\r",  15 );
 UART1_Write_Text(testOutput);


 while(1) {
 if (poll_flag && print_counter >= 15) {
 poll_flag = 0;



 tim_overflow_ticks = (unsigned long) overflowCountTemp * (tim_arr);
 tim_ticks_total = (unsigned long) (old_tim_ticks_remain) - (tim_ticks_remain) + tim_overflow_ticks;
 input_sig_period = (long double) tim_ticks_total * timer_period_ms;
 input_sig_freq = (long double) 1000.0 / input_sig_period;




 LongDoubleToStr(timer_period_ms, timePerTickInText);
 UART1_Write_Text("Time per tick: ");
 UART1_Write_Text(timePerTickInText);
 UART1_Write_Text("\n\r");


 IntToStr(overflowCountTemp, overflowsInText);
 UART1_Write_Text("Total number of timer overflows: ");
 UART1_Write_Text(overflowsInText);
 UART1_Write_Text("\n\r");


 LongWordToStr(tim_overflow_ticks, totalOverflowTimeInText);
 UART1_Write_Text("Total Overflow Ticks : ");
 UART1_Write_Text(totalOverflowTimeInText);
 UART1_Write_Text("\n\r");


 LongWordToStr(tim_ticks_remain, endTimeInText);
 UART1_Write_Text("Time read from CCP1 Register: ");
 UART1_Write_Text(endTimeInText);
 UART1_Write_Text("\n\r");


 LongWordToStr(tim_ticks_total, ticksInText);
 UART1_Write_Text("Total number of ticks between events: ");
 UART1_Write_Text(ticksInText);
 UART1_Write_Text("\n\r");

 LongDoubleToStr(input_sig_period, periodInText);
 UART1_Write_Text("Period of incoming signal (ms): ");
 UART1_Write_Text(periodInText);
 UART1_Write_Text("\n\r");

 LongDoubleToStr(input_sig_freq, frequencyInText);
 UART1_Write_Text("Frequency of incoming signal (Hz): ");
 UART1_Write_Text(frequencyInText);
 UART1_Write_Text("\n\r");

 LongToStr(inputEventCounter, eventCounterInText);
 UART1_Write_Text("Number of input capture events: ");
 UART1_Write_Text(eventCounterInText);
 UART1_Write_Text("\n\n\n\r");

 inputEventCounter = 0;
 print_counter = 0;
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
 TIM2_PSC = tim_psc;
 TIM2_ARR = tim_arr;
 TIM2_CR1 |= 0x10;
 TIM2_CCMR1_Input |= 0x01;
 TIM2_CCER.CC1P = 1;
 TIM2_CCER.CC1E = 1;
 TIM2_DIER.CC1IE = 1;
 TIM2_DIER.UIE = 1;
 NVIC_IntEnable(IVT_INT_TIM2);

 TIM2_CNT = 0x00;
 TIM2_CR1.CEN = 1;



 timer_period_ms = (long double) 1000.0 / (clk_freq / (tim_psc + 1));


 }


void timer2_interrupt() iv IVT_INT_TIM2 {



 if(TIM2_SR.UIF == 1) {
 TIM2_SR.UIF = 0;
 overflowCount++;
 }

 if (TIM2_SR.CC1IF == 1) {

 old_tim_ticks_remain = tim_ticks_remain;
 tim_ticks_remain = TIM2_CCR1;
 overflowCountTemp = overflowCount;
 overflowCount = 0;
 inputEventCounter++;
 }





}



void external_interrupt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {

 EXTI_PR.B10 = 1;
 poll_flag = 1;

}



void init_hardware() {


 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);
 GPIOE_ODR.B10 = 0;


 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);
#line 241 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Input Capture Full Demo/input_capture_demo.c"
}



void init_serial_comm() {

 UART1_Init( 115200 );
 Delay_ms(200);
}



void init_timer3(){
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
