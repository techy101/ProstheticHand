#line 1 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Matthew Position control working/Input Capture Complete 5ch.c"
#line 119 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Matthew Position control working/Input Capture Complete 5ch.c"
unsigned long MCU_FREQUENCY = 168000000;
unsigned long ENCODER_TIM_RELOAD = 65535;
unsigned int ENCODER_TIM_PSC = 100;
unsigned int SAMPLE_TIM_RELOAD = 59999;
unsigned int SAMPLE_TIM_PSC = 279;
unsigned int TERMINAL_PRINT_THRESH = 5;


unsigned long PWM_FREQ_HZ = 10000;
int EXTEND = 1;
int CONTRACT = 0;
int INITIAL_DIRECTION = 0;
long FULLY_EXTENDED = 0;
unsigned long FULLY_CONTRACTED = 2700;
unsigned int NORMALIZATION_CONSTANT = 1;



long double encoder_timer_period_ms;
unsigned int poll_flag;
unsigned int terminal_print_count;
unsigned long tim2_overflow_count;
unsigned long tim3_overflow_count;
int analogGo = 0;
int goStatus = 0;


unsigned int pwm_period;



void timer2_ISR();
void timer3_ISR();
void init_GPIO();
void init_UART();
void init_input_capture();
void init_timer11();
void calc_finger_state(struct finger *fngr);
void print_finger_info(struct finger *fngr);
void calc_timer_values(struct finger *fngr);
void ADC_AWD();
void InitTimer5();
void Timer5_interrupt();


void init_pointer_PWM();
void init_middle_PWM();
void init_ring_PWM();
void init_pinky_PWM();
void init_thumb_PWM();


unsigned int Pcontrol_position(struct finger *, unsigned long, unsigned long);
void move_finger(struct finger *, unsigned int);

int setP = 3000;
int const MARGIN = 30;
float const K = 1000.0;
unsigned int duty_cycle = 0;
char toStr[ 15 ];



struct finger {
 char name[ 15 ];
 long position_temp;
 long position_actual;
 unsigned int direction_actual;


 unsigned int direction_desired;


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



void init_finger(struct finger *);



void main() {

 INITIAL_DIRECTION = EXTEND;


 init_UART();
 init_GPIO();


 pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);
 PWM_TIM4_Init(PWM_FREQ_HZ);


 init_pointer_PWM();
 init_middle_PWM();
 init_ring_PWM();
 init_pinky_PWM();
 init_thumb_PWM();


 InitTimer5();




 ADC_Set_Input_Channel(_ADC_CHANNEL_3);
 ADC1_Init();


 ADC1_LTR =  0 ;
 ADC1_HTR =  400 ;
 ADC1_CR2bits.CONT = 1;
 ADC1_SQR3bits.SQ1 = 3;
 ADC1_SQR3bits.SQ2 = 4;
 ADC1_CR1bits.AWDSGL = 1;
 ADC1_CR1 |= 3;
 ADC1_CR1bits.AWDEN = 1;
 ADC1_CR2bits.SWSTART = 1;
 ADC1_CR1bits.AWDIE = 1;
 NVIC_IntEnable(IVT_INT_ADC);


 strcpy(fngr_pointer.name, "fngr_pointer");
 strcpy(fngr_middle.name, "fngr_middle");
 strcpy(fngr_ring.name, "fngr_ring");
 strcpy(fngr_pinky.name, "fngr_pinky");
 strcpy(fngr_thumb.name, "fngr_thumb");


 init_finger(&fngr_pointer);
 init_finger(&fngr_middle);
 init_finger(&fngr_ring);
 init_finger(&fngr_pinky);
 init_finger(&fngr_thumb);


 UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
 delay_ms(500);


 init_timer11();
 init_input_capture();






 while(1) {


 if ( GPIOD_IDR.B11  == 0) {
 PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL1 );
 }
 else {
 PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL1 );
 }


 if ( GPIOD_IDR.B7  == 0) {
 PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL2 );
 }
 else {
 PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL2 );
 }


 if ( GPIOD_IDR.B1  == 0) {
 PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL3 );
 }
 else {
 PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL3 );
 }


 if ( GPIOD_IDR.B2  == 0) {
 PWM_TIM4_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL1 );
 }
 else {
 PWM_TIM4_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL1 );
 }



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








unsigned int Pcontrol_position(struct finger *fngr, unsigned long SP, unsigned long MPV)
{
 unsigned int duty_cycle;

 if((SP-MPV) < 0)
 fngr->direction_desired = EXTEND;
 else
 fngr->direction_desired = CONTRACT;

 duty_cycle = K*abs(SP-MPV);

 if(duty_cycle > 100)
 duty_cycle = 100;
 else if(duty_cycle < 20)
 duty_cycle = 20;

 return duty_cycle;
}



void move_finger(struct finger *fngr, unsigned int duty_cycle)
{
 if(strcmp(fngr->name, "fngr_pointer") == 0) {
 PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL1 );
 }

 else if(strcmp(fngr->name, "fngr_middle") == 0) {
 PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL2 );
 }

 else if(strcmp(fngr->name, "fngr_ring") == 0) {
 PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL3 );
 }

 else if(strcmp(fngr->name, "fngr_pinky") == 0) {
 PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL4 );
 }

 else if(strcmp(fngr->name, "fngr_thumb") == 0) {
 PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL1 );
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
 fngr_thumb.enc_chan_b =  GPIOC_IDR.B11 ;
 fngr_thumb.position_temp++;
 }
}



void timer3_ISR() iv IVT_INT_TIM3 {


 if(TIM3_SR.UIF == 1) {
 TIM3_SR.UIF = 0;
 tim3_overflow_count++;
 }


 if (TIM3_SR.CC1IF == 1) {
 fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;
 fngr_pointer.enc_end_time = TIM3_CCR1;
 fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;
 fngr_pointer.enc_overflow_end = tim3_overflow_count;
 fngr_pointer.enc_chan_b =  GPIOE_IDR.B12 ;
 fngr_pointer.position_temp++;
 }



 if (TIM3_SR.CC2IF == 1) {
 fngr_middle.enc_start_time = fngr_middle.enc_end_time;
 fngr_middle.enc_end_time = TIM3_CCR2;
 fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;
 fngr_middle.enc_overflow_end = tim3_overflow_count;
 fngr_middle.enc_chan_b =  GPIOA_IDR.B11 ;
 fngr_middle.position_temp++;
 }


 if (TIM3_SR.CC3IF == 1) {
 fngr_ring.enc_start_time = fngr_ring.enc_end_time;
 fngr_ring.enc_end_time = TIM3_CCR3;
 fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;
 fngr_ring.enc_overflow_end = tim3_overflow_count;
 fngr_ring.enc_chan_b =  GPIOB_IDR.B15 ;
 fngr_ring.position_temp++;
 }


 if (TIM3_SR.CC4IF == 1) {
 fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;
 fngr_pinky.enc_end_time = TIM3_CCR4;
 fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;
 fngr_pinky.enc_overflow_end = tim3_overflow_count;
 fngr_pinky.enc_chan_b =  GPIOD_IDR.B9 ;
 fngr_pinky.position_temp++;
 }
}



void timer11_ISR() iv IVT_INT_TIM1_TRG_COM_TIM11 {

 TIM11_SR.UIF = 0;
 poll_flag = 1;
 terminal_print_count++;
}






void init_GPIO() {


 GPIO_Config(&GPIOE_BASE,
 _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

 GPIO_Config(&GPIOA_BASE,
 _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

 GPIO_Config(&GPIOB_BASE,
 _GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

 GPIO_Config(&GPIOD_BASE,
 _GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);

 GPIO_Config(&GPIOC_BASE,
 _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);



 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_10);
 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_13);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_8);
 GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12);




 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_7, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_1, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);








 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);


 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);
}



 void init_pointer_PWM( ) {

 PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL1 );
 PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);
 }


 void init_middle_PWM( ) {

 PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL2 );
 PWM_TIM1_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM1_CH2_PE11);
 }



 void init_ring_PWM( ) {

 PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL3 );
 PWM_TIM1_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM1_CH3_PE13);
 }



 void init_pinky_PWM( ) {

 PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL4 );
 PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PE14);
 }



 void init_thumb_PWM( ) {

 PWM_TIM4_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL1 );
 PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);
 }






 void init_finger(struct finger *fngr) {
 fngr->position_actual = 0;
 fngr->direction_desired = INITIAL_DIRECTION;
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



 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_6, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
 TIM3_CCMR1_Input |= 0x01;
 TIM3_CCER.CC1P = 0;
 TIM3_CCER.CC1NP = 0;
 TIM3_CCER.CC1E = 1;
 TIM3_DIER.CC1IE = 1;



 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_7, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
 TIM3_CCMR1_Input |= 0x100;
 TIM3_CCER.CC2P = 0;
 TIM3_CCER.CC2NP = 0;
 TIM3_CCER.CC2E = 1;
 TIM3_DIER.CC2IE = 1;



 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_8, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
 TIM3_CCMR2_Input |= 0x01;
 TIM3_CCER.CC3P = 0;
 TIM3_CCER.CC3NP = 0;
 TIM3_CCER.CC3E = 1;
 TIM3_DIER.CC3IE = 1;



 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_4, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
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



 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_5, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM2 | _GPIO_CFG_PULL_DOWN);
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



 encoder_timer_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
}




void init_timer11() {

 RCC_APB2ENR.TIM11EN = 1;
 TIM11_CR1.CEN = 0;
 TIM11_PSC = SAMPLE_TIM_PSC;
 TIM11_ARR = SAMPLE_TIM_RELOAD;
 NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);
 TIM11_DIER.UIE = 1;
 TIM11_CR1.CEN = 1;
}






void calc_finger_state( struct finger *fngr) {


 fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;


 fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);


 fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;


 fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;


 fngr->input_sig_period = (long double) fngr->enc_total_ticks * encoder_timer_period_ms;


 fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
 if (fngr->input_sig_frequency > 1200.0 || fngr->input_sig_frequency < 10.0)
 fngr->input_sig_frequency = 0;


 if (fngr->enc_chan_b == 1) {
 fngr->direction_actual = CONTRACT;
 fngr->position_actual += (fngr->position_temp / NORMALIZATION_CONSTANT);
 }

 else if (fngr->enc_chan_b == 0) {
 fngr->direction_actual = EXTEND;
 fngr->position_actual -= (fngr->position_temp / NORMALIZATION_CONSTANT);
 }

 else {
 fngr->direction_actual = 7;
 }



 if(fngr->position_actual >= FULLY_CONTRACTED) {
 fngr->direction_desired = EXTEND;
 }

 if(fngr->position_actual <= FULLY_EXTENDED) {
 fngr->direction_desired = CONTRACT;
 }

 if(strcmp(fngr->name, "fngr_pointer") == 0) {
  GPIOE_ODR.B10  = fngr->direction_desired;
 }

 else if(strcmp(fngr->name, "fngr_middle") == 0) {
  GPIOB_ODR.B10  = fngr->direction_desired;
 }

 else if(strcmp(fngr->name, "fngr_ring") == 0) {
  GPIOB_ODR.B13  = fngr->direction_desired;
 }

 else if(strcmp(fngr->name, "fngr_pinky") == 0) {
  GPIOD_ODR.B8  = fngr->direction_desired;
 }

 else if(strcmp(fngr->name, "fngr_thumb") == 0) {
  GPIOC_ODR.B12  = fngr->direction_desired;
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


 UART1_Write_Text("Direction of movement:             ");
 if(fngr->direction_actual == EXTEND)
 UART1_Write_Text("EXTEND ");
 else
 UART1_Write_Text("CONTRACT ");

 UART1_Write_Text("\n\r");

 LongToStr(fngr->position_actual, position_text);
 UART1_Write_Text("Position of finger:                ");
 UART1_Write_Text(position_text);
 UART1_Write_Text("\n\n\n\r");

 terminal_print_count = 0;
}





void ADC_AWD() iv IVT_INT_ADC ics ICS_AUTO {
 ADC1_CR1bits.AWDIE = 0;
 ADC1_SRbits.AWD = 0;
 if(ADC1_HTR <= 1000) {
 TIM5_SR.UIF = 0;
 TIM5_CNT = 0x00;
 ADC1_HTR =  4095 ;
 ADC1_LTR =  400 ;
 TIM5_DIER.UIE = 1;
 }else {
 TIM5_DIER.UIE = 0;
 ADC1_HTR =  400 ;
 ADC1_LTR =  0 ;
 }
 ADC1_CR1bits.AWDIE = 1;
}



void InitTimer5(){
 RCC_APB1ENR.TIM5EN = 1;
 TIM5_CR1.CEN = 0;
 TIM5_PSC = 7874;
 TIM5_ARR = 63999;
 NVIC_IntEnable(IVT_INT_TIM5);
 TIM5_CR1.CEN = 1;
}


void Timer5_interrupt() iv IVT_INT_TIM5 {
 TIM5_SR.UIF = 0;
 ADC1_HTR =  400 ;
 ADC1_LTR =  0 ;
 TIM5_DIER.UIE = 0;
 analogGo = 1;
 GPIOD_ODR.B1 = 1;
}
