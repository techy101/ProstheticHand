#line 1 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Force Control Code DEMO 12-15/Input Capture Complete 5ch.c"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/force control code demo 12-15/defines.h"
#line 44 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Force Control Code DEMO 12-15/Input Capture Complete 5ch.c"
unsigned long MCU_FREQUENCY = 168000000;
unsigned long ENCODER_TIM_RELOAD = 65535;
unsigned int ENCODER_TIM_PSC = 100;
unsigned int SAMPLE_TIM_RELOAD = 55999;
unsigned int SAMPLE_TIM_PSC = 2;
unsigned int TERMINAL_PRINT_THRESH = 500;
unsigned long PWM_FREQ_HZ = 10000;

unsigned int PWM_PERIOD_TIM1;
unsigned int PWM_PERIOD_TIM4;


long FULLY_EXTENDED = 0;
unsigned long FULLY_CONTRACTED = 3600;
unsigned int NORMALIZATION_CONSTANT = 1;



long double encoder_timer_period_ms;
unsigned int poll_flag;
unsigned int terminal_print_count;
unsigned long tim2_overflow_count;
unsigned long tim3_overflow_count;
int analogGo = 0;
int doShutdown = 0;
int emg_override_status;




void timer2_ISR();
void timer3_ISR();
void init_GPIO();
void init_UART();
void init_input_capture();
void init_timer11();
void sample_finger(struct finger *fngr);
void print_finger_info(struct finger *fngr);
void calc_timer_values(struct finger *fngr);

void InitTimer10();
void Timer10_interrupt();


void init_pointer_PWM(unsigned int);



unsigned int Pcontrol_force(struct finger *, unsigned int, unsigned int);
void move_pointer_finger(struct finger *, unsigned int);

int MARGIN = 250;
int setP;
int SP_LOW = 700;

float FORCE_K = 50.0;
unsigned int MPV;
unsigned int dutyCycle;
float pointer_average = 0.0;
int change_SP_flag;
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
 int tip_force;
};



struct finger fngr_pointer;
struct finger fngr_middle;
struct finger fngr_ring;
struct finger fngr_pinky;
struct finger fngr_thumb;



void init_finger(struct finger *);

unsigned int dirTrack;


void main() {


 init_UART();
 init_GPIO();
 init_pointer_PWM(0);
#line 166 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Force Control Code DEMO 12-15/Input Capture Complete 5ch.c"
 InitTimer10();



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

 setP = SP_LOW;
 change_SP_flag = 1;

  GPIOB_ODR.B7  = 0;


 ADC1_init();


 while(1) {

 if (poll_flag) {
 poll_flag = 0;
 sample_finger(&fngr_pointer);
 sample_finger(&fngr_middle);
 sample_finger(&fngr_ring);
 sample_finger(&fngr_pinky);
 sample_finger(&fngr_thumb);


 }


 if(analogGo && !doShutdown)
 {


 if(fngr_pointer.position_actual >= FULLY_CONTRACTED )
 doShutdown = 1;


 MPV = fngr_pointer.tip_force;

 dutyCycle = Pcontrol_force(&fngr_pointer, setP, MPV);
#line 234 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Force Control Code DEMO 12-15/Input Capture Complete 5ch.c"
  GPIOE_ODR.B10  = fngr_pointer.direction_desired;
#line 248 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Force Control Code DEMO 12-15/Input Capture Complete 5ch.c"
if(MPV > setP)
 {



 dutyCycle = Pcontrol_force(&fngr_pointer, setP, MPV);

 move_pointer_finger(&fngr_pointer, 0);



 }
 else
 move_pointer_finger(&fngr_pointer, dutyCycle);
#line 311 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Force Control Code DEMO 12-15/Input Capture Complete 5ch.c"
 }

 if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {

 dirTrack = fngr_pointer.direction_desired;
 UART1_Write_Text("Duty cycle returned is ");
 IntToStr(dutyCycle, toStr);
 UART1_Write_Text(toStr);
 UART1_Write_Text("\n\r");

 UART_Write_Text(" \n Setpoint is ");
 IntToStr(setP, toStr);
 UART1_Write_Text(ToStr);
 UART1_Write_Text("\n\r");
 print_finger_info(&fngr_pointer);
 print_finger_info(&fngr_middle);
 print_finger_info(&fngr_ring);
 print_finger_info(&fngr_pinky);
 print_finger_info(&fngr_thumb);
 UART1_Write_Text("\n\n\n\n\n\n\n\r");
 }


 if (doShutdown) {

 while(fngr_pointer.position_actual >= FULLY_EXTENDED) {
 sample_finger(&fngr_pointer);
 fngr_pointer.direction_desired =  1 ;
  GPIOE_ODR.B10  =  1 ;
 move_pointer_finger(&fngr_pointer, 100);
 }


 move_pointer_finger(&fngr_pointer, 0);
 analogGo = 0;
 doShutdown = 0;
  GPIOB_ODR.B7  = 0;
 fngr_pointer.position_actual = 2;
 }

 dirTrack = fngr_pointer.direction_desired;

 }
}








unsigned int Pcontrol_force(struct finger *fngr, unsigned int SP, unsigned int mpv)
{
 unsigned int duty_cycle;

 if((SP-mpv) <= 0) {
 fngr->direction_desired =  1 ;

 }
 else
 fngr->direction_desired =  0 ;





 duty_cycle = FORCE_K*abs(SP-mpv);

 if(duty_cycle > 100)
 duty_cycle = 100;
 else if(duty_cycle < 20)
 duty_cycle = 0;

 return duty_cycle;
}



void move_pointer_finger(struct finger *fngr, unsigned int duty_cycle)
{

 PWM_TIM1_Set_Duty(duty_cycle*(PWM_PERIOD_TIM1/100), _PWM_NON_INVERTED,  _PWM_CHANNEL1 );


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
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);


 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7 | _GPIO_PINMASK_9);


 GPIO_Digital_input(&GPIOD_BASE, _GPIO_PINMASK_3);
 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR1bits.EXTI3 = 3;
 EXTI_RTSRbits.TR3 = 1;
 EXTI_IMRbits.MR3 = 1;
 NVIC_IntEnable(IVT_INT_EXTI3);

}



 void init_pointer_PWM(unsigned int dutyCycle) {

 PWM_PERIOD_TIM1 = PWM_TIM1_Init(PWM_FREQ_HZ);
 PWM_TIM1_Set_Duty(dutyCycle*(PWM_PERIOD_TIM1/100), _PWM_NON_INVERTED,  _PWM_CHANNEL1 );
 PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);
 }



 void init_finger(struct finger *fngr)
 {
 fngr->position_actual = 0;

 fngr->direction_desired =  0 ;

 if (strcmp(fngr->name, "fngr_pointer") == 0) {
  GPIOE_ODR.B10  = fngr->direction_desired;
 ADC_Set_Input_Channel(_ADC_CHANNEL_7);
 }
 else if (strcmp(fngr->name, "fngr_middle") == 0) {
  GPIOB_ODR.B10  = fngr->direction_desired;
 ADC_Set_Input_Channel(_ADC_CHANNEL_9);
 }
 else if (strcmp(fngr->name, "fngr_ring") == 0) {
  GPIOB_ODR.B13  = fngr->direction_desired;
 ADC_Set_Input_Channel(_ADC_CHANNEL_11);
 }
 else if (strcmp(fngr->name, "fngr_pinky") == 0) {
  GPIOD_ODR.B8  = fngr->direction_desired;
 ADC_Set_Input_Channel(_ADC_CHANNEL_13);

 }
 else if (strcmp(fngr->name, "fngr_thumb") == 0) {
  GPIOC_ODR.B12  = fngr->direction_desired;
 ADC_Set_Input_Channel(_ADC_CHANNEL_3);
 }
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






void sample_finger( struct finger *fngr) {


 fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;


 fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);


 fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;


 fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;


 fngr->input_sig_period = (long double) fngr->enc_total_ticks * encoder_timer_period_ms;


 fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
 if (fngr->input_sig_frequency > 20000.0)
 fngr->input_sig_frequency = 0;


 if (fngr->enc_chan_b == 1) {
 fngr->direction_actual =  0 ;
 fngr->position_actual += (fngr->position_temp / NORMALIZATION_CONSTANT);
 }

 else if (fngr->enc_chan_b == 0) {
 fngr->direction_actual =  1 ;
 fngr->position_actual -= (fngr->position_temp / NORMALIZATION_CONSTANT);
 }

 else {
 fngr->direction_actual = 7;
 }
#line 725 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Force Control Code DEMO 12-15/Input Capture Complete 5ch.c"
 fngr->position_temp = 0;






 if(strcmp(fngr->name, "fngr_pointer") == 0) {
 fngr->tip_force = ADC1_Get_Sample( 9 );
 }
 else if (strcmp(fngr->name, "fngr_middle") == 0) {
 fngr->tip_force = ADC1_Get_Sample( 9 );
 }
 else if (strcmp(fngr->name, "fngr_ring") == 0) {
 fngr->tip_force = ADC1_Get_Sample( 11 );
 }
 else if (strcmp(fngr->name, "fngr_pinky") == 0) {
 fngr->tip_force = ADC1_Get_Sample( 13 );
 }
 else if (strcmp(fngr->name, "fngr_thumb") == 0) {
 fngr->tip_force = ADC1_Get_Sample( 3 );
 }
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
 if(fngr->direction_actual ==  1 )
 UART1_Write_Text("EXTEND ");
 else
 UART1_Write_Text("CONTRACT ");

 UART1_Write_Text("\n\r");


 UART1_Write_Text("Direction desired:             ");
 if(fngr->direction_desired ==  1 )
 UART1_Write_Text("EXTEND ");
 else
 UART1_Write_Text("CONTRACT ");

 UART1_Write_Text("\n\r");


 LongToStr(fngr->position_actual, position_text);
 UART1_Write_Text("Position of finger:                ");
 UART1_Write_Text(position_text);
 UART1_Write_Text("\n\n\n\r");

 IntToStr(fngr->tip_force, toStr);
 UART1_Write_Text("Force applied to tip of finger:                ");
 UART1_Write_Text(toStr);
 UART1_Write_Text("\n\n\n\r");

 terminal_print_count = 0;
}





void InitTimer10(){
 RCC_APB2ENR.TIM10EN = 1;
 TIM10_CR1.CEN = 0;
 TIM10_PSC = 7874;
 TIM10_ARR = 63999;
 NVIC_IntEnable(IVT_INT_TIM1_UP_TIM10);
 TIM10_CR1.CEN = 1;
}







void Timer10_interrupt() iv IVT_INT_TIM1_UP_TIM10 {

 EXTI_IMRbits.MR3 = 0;
 EXTI_PR.B3 = 1;
 TIM10_DIER.UIE = 0;
 TIM10_SR.UIF = 0;
 EXTI_RTSRbits.TR3 = 1;
 EXTI_FTSRbits.TR3 = 0;
 EXTI_IMRbits.MR3 = 1;
  GPIOB_ODR.B9  = 0;
 emg_override_status = 0;


 if (!analogGo) {
 doShutdown = 0;
 analogGo = 1;
  GPIOB_ODR.B7  = 1;
 }

 else {
 doShutdown = 1;
 analogGo = 0;

}
}





void emg_override_ISR() iv IVT_INT_EXTI3 {

 EXTI_IMRbits.MR3 = 0;
 EXTI_PR.B3 = 1;
 if(emg_override_status == 0) {
 TIM10_SR.UIF = 0;
 TIM10_CNT = 0x00;
 emg_override_status = 1;
 EXTI_RTSRbits.TR3 = 0;
 EXTI_FTSRbits.TR3 = 1;
 TIM10_DIER.UIE = 1;
  GPIOB_ODR.B9  = 1;

 }
 else {
 TIM10_DIER.UIE = 0;
 emg_override_status = 0;
 EXTI_RTSRbits.TR3 = 1;
 EXTI_FTSRbits.TR3 = 0;
  GPIOB_ODR.B9  = 0;
 analogGo = 0;
 doShutdown = 1;
 }
 EXTI_IMRbits.MR3 = 1;
}
