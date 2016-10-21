#line 1 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Input Capture Full Demo/Input Capture Four Channel Demo.c"
#line 25 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Input Capture Full Demo/Input Capture Four Channel Demo.c"
unsigned long MCU_FREQUENCY = 168000000;
unsigned long ENCODER_TIM_RELOAD = 65535;
unsigned int ENCODER_TIM_PSC = 0;
unsigned int TERMINAL_PRINT_THRESH = 40;




long double timer2_period_ms;
unsigned int poll_flag;
unsigned int terminal_print_count;
unsigned long overflow_count;





void timer2_ISR();
void timer3_ISR();
void init_GPIO();
void init_UART();
void init_input_capture();
void init_timer3();
void calc_finger_state(struct finger *fngr);
void print_finger_info(struct finger *fngr);
void calc_timer_values(struct finger *fngr);







struct GPIOx_t {
 unsigned long addr0;
};






struct finger {
 struct GPIOx_t *reg_bit;
 char name[ 15 ];
 unsigned int direction_actual;
 unsigned int speed_actual;
 unsigned int enc_chan_a;
 unsigned int enc_chan_b;
 unsigned long enc_start_time;
 unsigned long enc_end_time;

 unsigned long enc_total_ticks;
 unsigned long enc_overflow_start;
 unsigned long enc_overflow_end;
 long double input_sig_period;
 long double input_sig_frequency;
 unsigned long enc_overflow_delta;
 unsigned long enc_overflow_ticks;
 unsigned long enc_delta_ticks;
 unsigned long position_actual;
};



 struct finger fngr_pointer;
 struct finger fngr_middle;
 struct finger fngr_ring;
 struct finger fngr_pinky;


 struct GPIOx_t * GPIOA_IDR_LOC = 0x40020000 + 0x10;





void main() {


 init_UART();
 init_GPIO();



 strcpy(fngr_pointer.name, "Pointer");
 strcpy(fngr_middle.name, "Middle");
 strcpy(fngr_ring.name, "Ring");
 strcpy(fngr_pinky.name, "Pinky");

 UART1_Write_Text("Test point 2\n\r");


 fngr_pointer.reg_bit = GPIOA_IDR_LOC;
 fngr_middle.reg_bit = GPIOA_IDR_LOC;
 fngr_ring.reg_bit = GPIOA_IDR_LOC;
 fngr_pinky.reg_bit = GPIOA_IDR_LOC;


 UART1_Write_Text("Test point 3\n\r");


 fngr_pointer.enc_chan_a =  0x00 ;
 fngr_pointer.enc_chan_b =  0x10 ;
 fngr_middle.enc_chan_a =  0x02 ;
 fngr_middle.enc_chan_b =  0x20 ;
 fngr_ring.enc_chan_a =  0x04 ;
 fngr_ring.enc_chan_b =  0x40 ;
 fngr_pinky.enc_chan_a =  0x08 ;
 fngr_pinky.enc_chan_b =  0x80 ;




 UART1_Write_Text("\n\n\rProgram Has Started!\n\n\r");
 delay_ms(500);


 init_timer3();
 init_input_capture();


 while(1) {

 if (poll_flag) {
 poll_flag = 0;
 calc_finger_state(&fngr_pointer);
 calc_finger_state(&fngr_middle);
 calc_finger_state(&fngr_ring);
 calc_finger_state(&fngr_pinky);

 }


 if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {

 print_finger_info(&fngr_pointer);
 print_finger_info(&fngr_middle);
 print_finger_info(&fngr_ring);
 print_finger_info(&fngr_pinky);
 }
 }
}









void timer2_ISR() iv IVT_INT_TIM2 {




 if(TIM2_SR.UIF == 1) {
 TIM2_SR.UIF = 0;
 overflow_count++;
 }


 if (TIM2_SR.CC1IF == 1) {
 fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;
 fngr_pointer.enc_end_time = TIM2_CCR1;
 fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;
 fngr_pointer.enc_overflow_end = overflow_count;
 fngr_pointer.position_actual++;
 }



 if (TIM2_SR.CC2IF == 1) {
 fngr_middle.enc_start_time = fngr_middle.enc_end_time;
 fngr_middle.enc_end_time = TIM2_CCR2;
 fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;
 fngr_middle.enc_overflow_end = overflow_count;
 fngr_middle.position_actual++;
 }


 if (TIM2_SR.CC3IF == 1) {
 fngr_ring.enc_start_time = fngr_ring.enc_end_time;
 fngr_ring.enc_end_time = TIM2_CCR3;
 fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;
 fngr_ring.enc_overflow_end = overflow_count;
 fngr_ring.position_actual++;
 }


 if (TIM2_SR.CC4IF == 1) {
 fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;
 fngr_pinky.enc_end_time = TIM2_CCR4;
 fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;
 fngr_pinky.enc_overflow_end = overflow_count;
 fngr_pinky.position_actual++;
 }


}



void timer3_ISR() iv IVT_INT_TIM3 {

 TIM3_SR.UIF = 0;
 poll_flag = 1;
 terminal_print_count++;
}








void init_GPIO() {


 GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7);
}




void init_UART() {

 UART1_Init( 115200 );
 Delay_ms(200);
 UART_Write_Text("\rUART Init Complete\r\n");
}




void init_input_capture() {


 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_CR2.TI1S = 0;
 TIM2_PSC = ENCODER_TIM_PSC;
 TIM2_ARR = ENCODER_TIM_RELOAD;
 TIM2_CR1 |= 0x10;


 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);
 TIM2_CCMR1_Input |= 0x01;
 TIM2_CCER.CC1P = 0;
 TIM2_CCER.CC1NP = 0;
 TIM2_CCER.CC1E = 1;
 TIM2_DIER.CC1IE = 1;


 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH2_PA1);
 TIM2_CCMR1_Input |= 0x100;
 TIM2_CCER.CC2P = 0;
 TIM2_CCER.CC2NP = 0;
 TIM2_CCER.CC2E = 1;
 TIM2_DIER.CC2IE = 1;


 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH3_PA2);
 TIM2_CCMR2_Input |= 0x01;
 TIM2_CCER.CC3P = 0;
 TIM2_CCER.CC3NP = 0;
 TIM2_CCER.CC3E = 1;
 TIM2_DIER.CC3IE = 1;


 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH4_PA3);
 TIM2_CCMR2_Input |= 0x100;
 TIM2_CCER.CC3P = 0;
 TIM2_CCER.CC3NP = 0;
 TIM2_CCER.CC4E = 1;
 TIM2_DIER.CC4IE = 1;


 TIM2_DIER.UIE = 1;
 NVIC_IntEnable(IVT_INT_TIM2);
 TIM2_CR1.CEN = 1;


 timer2_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
}




void init_timer3() {

 RCC_APB1ENR.TIM3EN = 1;
 TIM3_CR1.CEN = 0;
 TIM3_PSC = 279;
 TIM3_ARR = 59999;
 NVIC_IntEnable(IVT_INT_TIM3);
 TIM3_DIER.UIE = 1;
 TIM3_CR1.CEN = 1;
}






void calc_finger_state( struct finger *fngr) {



 fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;


 fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);


 fngr->enc_delta_ticks = (unsigned long) fngr->enc_start_time - fngr->enc_end_time;


 fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;


 fngr->input_sig_period = (long double) fngr->enc_total_ticks * timer2_period_ms;


 fngr->input_sig_frequency = (long double) 1000.0 / fngr->input_sig_period;



 if ((fngr->reg_bit->addr0 & fngr->enc_chan_a) && !(fngr->reg_bit->addr0 & fngr->enc_chan_b)) {
 fngr->direction_actual = 1;
 }

 else if (!(fngr->reg_bit->addr0 & fngr->enc_chan_a) && (fngr->reg_bit->addr0 & fngr->enc_chan_b)) {
 fngr->direction_actual = 0;
 }

 else {
 fngr->direction_actual = 7;
 }
}




void print_finger_info( struct finger *fngr) {


 char time_per_tick_text[ 15 ];
 char overflow_delta_text[ 15 ];
 char overflow_time_text[ 15 ];
 char enc_delta_ticks_text[ 15 ];
 char total_ticks_text[ 15 ];
 char period_text[ 15 ];
 char frequency_text[ 15 ];
 char position_text[ 15 ];
 char direction_text[ 15 ];


 UART1_Write_Text("\n\rFinger Name: ");
 UART1_Write_Text(fngr->name);
 UART1_Write_Text("\n\r");

 LongDoubleToStr(timer2_period_ms, time_per_tick_text);
 UART1_Write_Text("Time per tick: ");
 UART1_Write_Text(time_per_tick_text);
 UART1_Write_Text("\n\r");

 LongWordToStr(fngr->enc_overflow_delta, overflow_delta_text);
 UART1_Write_Text("Total number of timer overflows: ");
 UART1_Write_Text(overflow_delta_text);
 UART1_Write_Text("\n\r");

 LongWordToStr(fngr->enc_overflow_ticks, overflow_time_text);
 UART1_Write_Text("Calculated Overflow Ticks : ");
 UART1_Write_Text(overflow_time_text);
 UART1_Write_Text("\n\r");

 LongWordToStr(fngr->enc_delta_ticks, enc_delta_ticks_text);
 UART1_Write_Text("Input Capture Delta Ticks: ");
 UART1_Write_Text(enc_delta_ticks_text);
 UART1_Write_Text("\n\r");

 LongWordToStr(fngr->enc_total_ticks, total_ticks_text);
 UART1_Write_Text("Total timer ticks between input captures: ");
 UART1_Write_Text(total_ticks_text);
 UART1_Write_Text("\n\r");

 LongDoubleToStr(fngr->input_sig_period, period_text);
 UART1_Write_Text("Period of incoming signal (ms): ");
 UART1_Write_Text(period_text);
 UART1_Write_Text("\n\r");

 LongDoubleToStr(fngr->input_sig_frequency, frequency_text);
 UART1_Write_Text("Frequency of incoming signal (Hz): ");
 UART1_Write_Text(frequency_text);
 UART1_Write_Text("\n\r");

 IntToStr(fngr->direction_actual, direction_text);
 UART1_Write_Text("Direction of movement: ");
 UART1_Write_Text(direction_text);
 UART1_Write_Text("\n\r");

 LongToStr(fngr->position_actual, position_text);
 UART1_Write_Text("Position of finger: ");
 UART1_Write_Text(position_text);
 UART1_Write_Text("\n\n\n\r");

 terminal_print_count = 0;
}
