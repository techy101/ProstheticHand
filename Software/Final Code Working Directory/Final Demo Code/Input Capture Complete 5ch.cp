#line 1 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Matthew Position control working/Input Capture Complete 5ch.c"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/matthew position control working/defines.h"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/matthew position control working/system.h"





static const unsigned long MCU_FREQUENCY = 168000000;
static const unsigned long ENCODER_TIM_RELOAD = 65535;
static const unsigned long PWM_FREQ_HZ = 10000;
static const unsigned int ENCODER_TIM_PSC = 100;
static const unsigned int SAMPLE_TIM_RELOAD = 59999;
static const unsigned int SAMPLE_TIM_PSC = 279;
static const unsigned int TERMINAL_PRINT_THRESH = 5;





static unsigned int poll_flag;
static unsigned int terminal_print_count;
static int analogGo = 0;
static int goStatus = 0;




void init_GPIO();
void init_sample_timer();



void sample_timer_ISR();
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/matthew position control working/finger.h"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/matthew position control working/defines.h"
#line 32 "c:/handgitrepo/prosthetichand/software/final code working directory/matthew position control working/finger.h"
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



static const unsigned int NORMALIZATION_CONSTANT = 1;
static const unsigned long FULLY_CONTRACTED = 2700;
static const long FULLY_EXTENDED = 0;




static long double encoder_timer_period_ms;
static unsigned long tim2_overflow_count;
static unsigned long tim3_overflow_count;
static unsigned int pwm_period;
static int INITIAL_DIRECTION = 0;




static const int setP = 3000;
static const int MARGIN = 30;
static const float const K = 1000.0;
static unsigned int duty_cycle = 0;
static char toStr[ 15 ];









void init_finger(struct finger *);
void init_input_capture();
void init_finger_sensors();
void init_pointer_PWM();
void init_middle_PWM();
void init_ring_PWM();
void init_pinky_PWM();
void init_thumb_PWM();
void calc_timer_values(struct finger *fngr);
void calc_finger_state(struct finger *fngr);
void move_finger(struct finger *, unsigned int);
void print_finger_info(struct finger *fngr);
#line 106 "c:/handgitrepo/prosthetichand/software/final code working directory/matthew position control working/finger.h"
unsigned int Pcontrol_position(struct finger *, unsigned long, unsigned long);




void fingers_input_capture_ISR();
void thumb_input_capture_ISR();




static struct finger fngr_pointer;
static struct finger fngr_middle;
static struct finger fngr_ring;
static struct finger fngr_pinky;
static struct finger fngr_thumb;
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/matthew position control working/uart.h"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/matthew position control working/defines.h"
#line 32 "c:/handgitrepo/prosthetichand/software/final code working directory/matthew position control working/uart.h"
void init_UART();
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/matthew position control working/emg.h"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/matthew position control working/defines.h"
#line 31 "c:/handgitrepo/prosthetichand/software/final code working directory/matthew position control working/emg.h"
static const unsigned int EMG_TIMER_PSC = 7874;
static const unsigned int EMG_TIMER_RELOAD = 63999;



void init_emg();



void emg_timer_ISR();
void AWD_ISR();
void emg_override_ISR();
#line 17 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Matthew Position control working/Input Capture Complete 5ch.c"
void main() {

 INITIAL_DIRECTION =  0 ;


 init_UART();
 init_GPIO();


 init_emg();


 init_finger_sensors();


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


 init_sample_timer();


 init_input_capture();


 pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);
 PWM_TIM4_Init(PWM_FREQ_HZ);


 init_pointer_PWM();
 init_middle_PWM();
 init_ring_PWM();
 init_pinky_PWM();
 init_thumb_PWM();



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
