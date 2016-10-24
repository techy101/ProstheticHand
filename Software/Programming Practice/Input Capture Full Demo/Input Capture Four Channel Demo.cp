#line 1 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Input Capture Full Demo/Input Capture Four Channel Demo.c"
#line 40 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Input Capture Full Demo/Input Capture Four Channel Demo.c"
unsigned long MCU_FREQUENCY = 168000000;
unsigned long ENCODER_TIM_RELOAD = 65535;
unsigned int ENCODER_TIM_PSC = 100;
unsigned int TERMINAL_PRINT_THRESH = 40;



long double timer2_period_ms;
long double timer3_period_ms;
unsigned int poll_flag;
unsigned int terminal_print_count;
unsigned long overflow_count;
unsigned long tim2_overflow_count;
unsigned long tim3_overflow_count;



void timer2_ISR();
void timer3_ISR();
void init_GPIO();
void init_UART();
void init_input_capture();
void init_timer4();
void calc_finger_state(struct finger *fngr);
void print_finger_info(struct finger *fngr);
void calc_timer_values(struct finger *fngr);



struct finger {
 char name[ 15 ];
 long position_temp;
 long position_actual;
 unsigned int direction_actual;
 unsigned int enc_chan_b;
 unsigned long enc_start_time;
 unsigned long enc_end_time;
 unsigned long enc_delta_ticks;
 unsigned long enc_overflow_start;
 unsigned long enc_overflow_end;
 unsigned long enc_overflow_delta;
 unsigned long enc_overflow_ticks;
 unsigned long enc_total_ticks;
 unsigned long input_sig_frequency;
 long double input_sig_period;
};



struct finger fngr_pointer;
struct finger fngr_middle;
struct finger fngr_ring;
struct finger fngr_pinky;
struct finger fngr_thumb;



void main() {


 init_UART();
 init_GPIO();


 strcpy(fngr_pointer.name, "Pointer");
 strcpy(fngr_middle.name, "Middle");
 strcpy(fngr_ring.name, "Ring");
 strcpy(fngr_pinky.name, "Pinky");
 strcpy(fngr_thumb.name, "Thumb");


 UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
 delay_ms(500);


 init_timer4();
 init_input_capture();


 while(1) {

 if (poll_flag) {
 poll_flag = 0;
 calc_finger_state(&fngr_pointer);
 calc_finger_state(&fngr_middle);
 calc_finger_state(&fngr_ring);
 calc_finger_state(&fngr_pinky);
 calc_finger_state(&fngr_thumb);
 }

 if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {

 print_finger_info(&fngr_pointer);
 print_finger_info(&fngr_middle);
 print_finger_info(&fngr_ring);
 print_finger_info(&fngr_pinky);
 print_finger_info(&fngr_thumb);
 UART1_Write_Text("\n\n\n\n\n\n\n\r");
 }
 }
}









void timer2_ISR() iv IVT_INT_TIM2 {


 if(TIM2_SR.UIF == 1) {
 TIM2_SR.UIF = 0;
 tim2_overflow_count++;
 }


 if (TIM2_SR.CC1IF == 1) {
 fngr_thumb.enc_start_time = fngr_thumb.enc_end_time;
 fngr_thumb.enc_end_time = TIM2_CCR1;
 fngr_thumb.enc_overflow_start = fngr_thumb.enc_overflow_end;
 fngr_thumb.enc_overflow_end = tim2_overflow_count;
 fngr_thumb.enc_chan_b =  GPIOD_IDR.B4 ;
 fngr_thumb.position_temp++;
 }
}



void timer3_ISR() iv IVT_INT_TIM3 {

 GPIOD_ODR.B5 = 1;

 if(TIM3_SR.UIF == 1) {
 TIM3_SR.UIF = 0;
 tim3_overflow_count++;
 }


 if (TIM3_SR.CC1IF == 1) {
 fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;
 fngr_pointer.enc_end_time = TIM3_CCR1;
 fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;
 fngr_pointer.enc_overflow_end = tim3_overflow_count;
 fngr_pointer.enc_chan_b =  GPIOD_IDR.B0 ;
 fngr_pointer.position_temp++;
 }



 if (TIM3_SR.CC2IF == 1) {
 fngr_middle.enc_start_time = fngr_middle.enc_end_time;
 fngr_middle.enc_end_time = TIM3_CCR2;
 fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;
 fngr_middle.enc_overflow_end = tim3_overflow_count;
 fngr_middle.enc_chan_b =  GPIOD_IDR.B1 ;
 fngr_middle.position_temp++;
 }


 if (TIM3_SR.CC3IF == 1) {
 fngr_ring.enc_start_time = fngr_ring.enc_end_time;
 fngr_ring.enc_end_time = TIM3_CCR3;
 fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;
 fngr_ring.enc_overflow_end = tim3_overflow_count;
 fngr_ring.enc_chan_b =  GPIOD_IDR.B2 ;
 fngr_ring.position_temp++;
 }


 if (TIM3_SR.CC4IF == 1) {
 fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;
 fngr_pinky.enc_end_time = TIM3_CCR4;
 fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;
 fngr_pinky.enc_overflow_end = tim3_overflow_count;
 fngr_pinky.enc_chan_b =  GPIOD_IDR.B3 ;
 fngr_pinky.position_temp++;
 }

 GPIOD_ODR.B5 = 0;
}



void timer4_ISR() iv IVT_INT_TIM4 {

 TIM4_SR.UIF = 0;
 poll_flag = 1;
 terminal_print_count++;
}






void init_GPIO() {


 GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
 GPIO_Digital_Output(&GPIOD_Base, _GPIO_PINMASK_5);
}




void init_UART() {

 UART1_Init( 115200 );
 Delay_ms(200);
 UART_Write_Text("\rUART Init Complete\r\n");
}



void init_input_capture() {




 RCC_APB1ENR.TIM3EN = 1;
 TIM3_CR1.CEN = 0;
 TIM3_CR2.TI1S = 0;
 TIM3_PSC = ENCODER_TIM_PSC;
 TIM3_ARR = ENCODER_TIM_RELOAD;
 TIM3_CR1 |= 0;


 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH1_PA6);
 TIM3_CCMR1_Input |= 0x01;
 TIM3_CCER.CC1P = 0;
 TIM3_CCER.CC1NP = 0;
 TIM3_CCER.CC1E = 1;
 TIM3_DIER.CC1IE = 1;


 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH2_PC7);
 TIM3_CCMR1_Input |= 0x100;
 TIM3_CCER.CC2P = 0;
 TIM3_CCER.CC2NP = 0;
 TIM3_CCER.CC2E = 1;
 TIM3_DIER.CC2IE = 1;


 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH3_PB0);
 TIM3_CCMR2_Input |= 0x01;
 TIM3_CCER.CC3P = 0;
 TIM3_CCER.CC3NP = 0;
 TIM3_CCER.CC3E = 1;
 TIM3_DIER.CC3IE = 1;


 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH4_PB1);
 TIM3_CCMR2_Input |= 0x100;
 TIM3_CCER.CC3P = 0;
 TIM3_CCER.CC3NP = 0;
 TIM3_CCER.CC4E = 1;
 TIM3_DIER.CC4IE = 1;



 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_CR2.TI1S = 0;
 TIM2_PSC = ENCODER_TIM_PSC;
 TIM2_ARR = ENCODER_TIM_RELOAD;
 TIM2_CR1 |= 0;


 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA5);
 TIM2_CCMR1_Input |= 0x01;
 TIM2_CCER.CC1P = 0;
 TIM2_CCER.CC1NP = 0;
 TIM2_CCER.CC1E = 1;
 TIM2_DIER.CC1IE = 1;



 TIM3_DIER.UIE = 1;
 TIM2_DIER.UIE = 1;
 NVIC_IntEnable(IVT_INT_TIM3);
 NVIC_IntEnable(IVT_INT_TIM2);
 TIM3_CR1.CEN = 1;
 TIM2_CR1.CEN = 1;


 timer3_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
}




void init_timer4() {

 RCC_APB1ENR.TIM4EN = 1;
 TIM4_CR1.CEN = 0;
 TIM4_PSC = 279;
 TIM4_ARR = 59999;
 NVIC_IntEnable(IVT_INT_TIM4);
 TIM4_DIER.UIE = 1;
 TIM4_CR1.CEN = 1;
}






void calc_finger_state( struct finger *fngr) {


 fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;


 fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);


 fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;


 fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;


 fngr->input_sig_period = (long double) fngr->enc_total_ticks * timer3_period_ms;


 fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;


 if (fngr->enc_chan_b == 1) {
 fngr->direction_actual = 1;
 fngr->position_actual += fngr->position_temp;
 }

 else if (fngr->enc_chan_b == 0) {
 fngr->direction_actual = 0;
 fngr->position_actual -= fngr->position_temp;
 }

 else {
 fngr->direction_actual = 7;
 }


 fngr->position_temp = 0;
}



void print_finger_info( struct finger *fngr) {


 char frequency_text[ 15 ];
 char position_text[ 15 ];
 char direction_text[ 15 ];

 UART1_Write_Text("\n\rFinger Name: ");
 UART1_Write_Text(fngr->name);
 UART1_Write_Text("\n\r");

 LongWordToStr(fngr->input_sig_frequency, frequency_text);
 UART1_Write_Text("Frequency of incoming signal (Hz): ");
 UART1_Write_Text(frequency_text);
 UART1_Write_Text("\n\r");

 IntToStr(fngr->direction_actual, direction_text);
 UART1_Write_Text("Direction of movement:             ");
 UART1_Write_Text(direction_text);
 UART1_Write_Text("\n\r");

 LongToStr(fngr->position_actual, position_text);
 UART1_Write_Text("Position of finger:                ");
 UART1_Write_Text(position_text);
 UART1_Write_Text("\n\n\n\r");

 terminal_print_count = 0;
}
