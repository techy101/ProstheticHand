#line 1 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/Timer Tick Period/TimerTickPeriod.c"

int print_flag = 0;
unsigned int overflow_count = 0;
unsigned int tick_count;
unsigned int tim4_leftover;
char tickCountInText[15];

void TIM3_timed() iv IVT_INT_TIM3 {
 TIM3_SR.UIF = 0;
 print_flag = 1;
}

void TIM4_run() iv IVT_INT_TIM4 {
 TIM4_SR.UIF = 0;
 overflow_count++;
}

void main() {
 UART1_init(115200);
 Delay_ms(200);


 RCC_APB1ENR.TIM3EN = 1;
 TIM3_CR1.CEN = 0;
 TIM3_PSC = 2563;
 TIM3_ARR = 65522;
 NVIC_IntEnable(IVT_INT_TIM3);
 TIM3_DIER.UIE = 1;


 RCC_APB1ENR.TIM4EN = 1;
 TIM4_CR1.CEN = 0;
 TIM4_PSC = 0;
 TIM4_ARR = 6;
 NVIC_IntEnable(IVT_INT_TIM4);
 TIM4_DIER.UIE = 1;

 TIM3_CR1.CEN = 1;
 TIM4_CR1.CEN = 1;

 while(1) {
 if(print_flag == 1) {
 tim4_leftover = TIM4_CNT;
 TIM3_CR1.CEN = 0;
 TIM4_CR1.CEN = 0;

 tick_count = 65536*overflow_count + tim4_leftover;
 IntToStr(tick_count, tickCountInText);
 UART1_Write_Text("Total timer ticks in one second: ");
 UART1_Write_Text(tickCountInText);
 UART1_Write_Text("\n\n");

 print_flag = 0;
 overflow_count = 0;

 TIM3_CR1.CEN = 1;
 TIM4_CR1.CEN = 1;
 }
 }
}
