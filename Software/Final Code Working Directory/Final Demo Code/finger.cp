#line 1 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/finger.c"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/finger.h"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/defines.h"
#line 56 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/finger.h"
extern struct finger {
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


extern struct finger fngr_pointer;
extern struct finger fngr_middle;
extern struct finger fngr_ring;
extern struct finger fngr_pinky;
extern struct finger fngr_thumb;
#line 93 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/finger.h"
extern const unsigned int NORMALIZATION_CONSTANT;
extern const unsigned long FULLY_CONTRACTED;
extern const long FULLY_EXTENDED;




extern long double encoder_timer_period_ms;
extern unsigned long tim2_overflow_count;
extern unsigned long tim3_overflow_count;
extern unsigned int pwm_period;
extern int INITIAL_DIRECTION;




extern const int position_setP;
extern const int POSITION_MARGIN;
extern const float const position_K;


extern unsigned int duty_cycle;
extern char toStr[ 15 ];



extern const int force_setP;
extern const int FORCE_MARGIN;
extern const float const force_K;




void init_input_capture();
void activate_input_capture();
void init_finger(struct finger *fngr);
void sample_finger(struct finger *fngr);
void move_finger(struct finger *, unsigned int);
void print_finger_info(struct finger *fngr);



void set_finger_name(struct finger *fngr);








unsigned int Pcontrol_position(struct finger *, unsigned long, unsigned long);
unsigned int Pcontrol_force(struct finger *, unsigned int, unsigned int);




void fingers_input_capture_ISR();
void thumb_input_capture_ISR();
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/defines.h"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/system.h"
#line 23 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/system.h"
extern const unsigned long MCU_FREQUENCY;
extern const unsigned long ENCODER_TIM_RELOAD;
extern const unsigned long PWM_FREQ_HZ;
extern const unsigned int ENCODER_TIM_PSC;
extern const unsigned int SAMPLE_TIM_RELOAD;
extern const unsigned int SAMPLE_TIM_PSC;
extern const unsigned int TERMINAL_PRINT_THRESH;





extern unsigned int poll_flag;
extern unsigned int terminal_print_count;
extern int analogGo;
extern int goStatus;




void init_GPIO();
void init_sample_timer();



void sample_timer_ISR();
#line 27 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/finger.c"
void set_finger_name(struct finger *fngr) {
#line 32 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/finger.c"
 strcpy(fngr->name, "fngr_pointer");
}
#line 55 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/finger.c"
void init_input_capture() {



 RCC_APB1ENR.TIM3EN = 1;
 TIM3_CR1.CEN = 0;
 TIM3_CR2.TI1S = 0;
 TIM3_PSC = ENCODER_TIM_PSC;
 TIM3_ARR = ENCODER_TIM_RELOAD;
 TIM3_CR1 |= 0;


 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_CR2.TI1S = 0;
 TIM2_PSC = ENCODER_TIM_PSC;
 TIM2_ARR = ENCODER_TIM_RELOAD;
 TIM2_CR1 |= 0;


 encoder_timer_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
}
#line 95 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/finger.c"
void activate_input_capture() {

 TIM3_DIER.UIE = 1;
 TIM2_DIER.UIE = 1;
 NVIC_IntEnable(IVT_INT_TIM3);
 NVIC_IntEnable(IVT_INT_TIM2);
 TIM3_CR1.CEN = 1;
 TIM2_CR1.CEN = 1;
}
#line 122 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/finger.c"
void init_finger(struct finger *fngr) {


 if (strcmp(fngr->name, "fngr_pointer") == 0) {

 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_6, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
 TIM3_CCMR1_Input |= 0x01;
 TIM3_CCER.CC1P = 0;
 TIM3_CCER.CC1NP = 0;
 TIM3_CCER.CC1E = 1;
 TIM3_DIER.CC1IE = 1;


 GPIO_Config(&GPIOE_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);


 PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL1 );
 PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);


 ADC_Set_Input_Channel(_ADC_CHANNEL_7);


 ADC_Set_Input_Channel(_ADC_CHANNEL_4);


 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_14, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);





 }

 else if (strcmp(fngr->name, "fngr_middle") == 0) {

 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_7, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
 TIM3_CCMR1_Input |= 0x100;
 TIM3_CCER.CC2P = 0;
 TIM3_CCER.CC2NP = 0;
 TIM3_CCER.CC2E = 1;
 TIM3_DIER.CC2IE = 1;


 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);


 PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL2 );
 PWM_TIM1_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM1_CH2_PE11);


 ADC_Set_Input_Channel(_ADC_CHANNEL_9);


 ADC_Set_Input_Channel(_ADC_CHANNEL_8);
 }


 else if (strcmp(fngr->name, "fngr_ring") == 0) {

 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_8, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
 TIM3_CCMR2_Input |= 0x01;
 TIM3_CCER.CC3P = 0;
 TIM3_CCER.CC3NP = 0;
 TIM3_CCER.CC3E = 1;
 TIM3_DIER.CC3IE = 1;


 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);


 PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL3 );
 PWM_TIM1_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM1_CH3_PE13);


 ADC_Set_Input_Channel(_ADC_CHANNEL_11);


 ADC_Set_Input_Channel(_ADC_CHANNEL_10);
 }


 else if (strcmp(fngr->name, "fngr_pinky") == 0) {

 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_4, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
 TIM3_CCMR2_Input |= 0x100;
 TIM3_CCER.CC3P = 0;
 TIM3_CCER.CC3NP = 0;
 TIM3_CCER.CC4E = 1;
 TIM3_DIER.CC4IE = 1;


 GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);


 PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL4 );
 PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PE14);


 ADC_Set_Input_Channel(_ADC_CHANNEL_13);


 ADC_Set_Input_Channel(_ADC_CHANNEL_12);
 }


 else if (strcmp(fngr->name, "fngr_thumb") == 0) {

 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_5, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM2 | _GPIO_CFG_PULL_DOWN);
 TIM2_CCMR1_Input |= 0x01;
 TIM2_CCER.CC1P = 0;
 TIM2_CCER.CC1NP = 0;
 TIM2_CCER.CC1E = 1;
 TIM2_DIER.CC1IE = 1;


 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);


 PWM_TIM4_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED,  _PWM_CHANNEL1 );
 PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);


 ADC_Set_Input_Channel(_ADC_CHANNEL_3);


 ADC_Set_Input_Channel(_ADC_CHANNEL_2);
 }


 fngr->position_actual = 0;
 fngr->direction_desired = INITIAL_DIRECTION;
}
#line 279 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/finger.c"
void sample_finger( struct finger *fngr) {


 fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;


 fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);


 fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;


 fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;


 fngr->input_sig_period = (long double) fngr->enc_total_ticks * encoder_timer_period_ms;


 fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
 if (fngr->input_sig_frequency > 1200.0 || fngr->input_sig_frequency < 10.0)
 fngr->input_sig_frequency = 0;


 if (fngr->enc_chan_b == 1) {
 fngr->direction_actual =  1 ;
 fngr->position_actual += (fngr->position_temp / NORMALIZATION_CONSTANT);
 }

 else if (fngr->enc_chan_b == 0) {
 fngr->direction_actual =  0 ;
 fngr->position_actual -= (fngr->position_temp / NORMALIZATION_CONSTANT);
 }

 else {
 fngr->direction_actual = 7;
 }



 if(fngr->position_actual >= FULLY_CONTRACTED) {
 fngr->direction_desired =  0 ;
 }

 if(fngr->position_actual <= FULLY_EXTENDED) {
 fngr->direction_desired =  1 ;
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
#line 372 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/finger.c"
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
#line 416 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/finger.c"
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
 if(fngr->direction_actual ==  0 )
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
#line 478 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/finger.c"
unsigned int Pcontrol_position(struct finger *fngr, unsigned long SP, unsigned long MPV)
{
 unsigned int duty_cycle;

 if((SP-MPV) < 0)
 fngr->direction_desired =  0 ;
 else
 fngr->direction_desired =  1 ;

 duty_cycle = position_K*abs(SP-MPV);

 if(duty_cycle > 100)
 duty_cycle = 100;
 else if(duty_cycle < 20)
 duty_cycle = 20;

 return duty_cycle;
}
#line 521 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/finger.c"
unsigned int Pcontrol_force(struct finger *fngr, unsigned int SP, unsigned int MPV)
{
 unsigned int duty_cycle;

 if((SP-MPV) < 0)
 fngr->direction_desired =  0 ;
 else
 fngr->direction_desired =  1 ;

 duty_cycle = force_K*abs(SP-MPV);

 if(duty_cycle > 100)
 duty_cycle = 100;
 else if(duty_cycle < 20)
 duty_cycle = 20;

 return duty_cycle;
}
#line 569 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/finger.c"
void thumb_input_capture_ISR() iv IVT_INT_TIM3 {


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



void fingers_input_capture_ISR() iv IVT_INT_TIM2 {


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
