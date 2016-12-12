#line 1 "C:/Users/SCSUS/Desktop/Final Demo Code/main.c"
#line 1 "c:/users/scsus/desktop/final demo code/defines.h"
#line 1 "c:/users/scsus/desktop/final demo code/system.h"
#line 23 "c:/users/scsus/desktop/final demo code/system.h"
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
#line 1 "c:/users/scsus/desktop/final demo code/finger.h"
#line 1 "c:/users/scsus/desktop/final demo code/defines.h"
#line 32 "c:/users/scsus/desktop/final demo code/finger.h"
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



extern const unsigned int NORMALIZATION_CONSTANT;
extern const unsigned long FULLY_CONTRACTED;
extern const long FULLY_EXTENDED;




extern long double encoder_timer_period_ms;
extern unsigned long tim2_overflow_count;
extern unsigned long tim3_overflow_count;
extern unsigned int pwm_period;
extern int INITIAL_DIRECTION;




extern const int setP;
extern const int MARGIN;
extern const float const K;
extern unsigned int duty_cycle;
extern char toStr[ 15 ];









void init_input_capture();
void activate_input_capture();
void init_finger(struct finger *fngr);
void sample_finger(struct finger *fngr);
void move_finger(struct finger *, unsigned int);
void print_finger_info(struct finger *fngr);
#line 100 "c:/users/scsus/desktop/final demo code/finger.h"
unsigned int Pcontrol_position(struct finger *, unsigned long, unsigned long);




void fingers_input_capture_ISR();
void thumb_input_capture_ISR();




extern struct fngr_pointer;
extern struct fngr_middle;
extern struct fngr_ring;
extern struct fngr_pinky;
extern struct fngr_thumb;
#line 1 "c:/users/scsus/desktop/final demo code/uart.h"
#line 1 "c:/users/scsus/desktop/final demo code/defines.h"
#line 32 "c:/users/scsus/desktop/final demo code/uart.h"
void init_UART();
#line 1 "c:/users/scsus/desktop/final demo code/emg.h"
#line 1 "c:/users/scsus/desktop/final demo code/defines.h"
#line 31 "c:/users/scsus/desktop/final demo code/emg.h"
extern const unsigned int EMG_TIMER_PSC;
extern const unsigned int EMG_TIMER_RELOAD;



void init_emg();



void emg_timer_ISR();
void AWD_ISR();
void emg_override_ISR();
#line 35 "C:/Users/SCSUS/Desktop/Final Demo Code/main.c"
const unsigned long MCU_FREQUENCY = 168000000;
const unsigned long ENCODER_TIM_RELOAD = 65535;
const unsigned long PWM_FREQ_HZ = 10000;


const unsigned int NORMALIZATION_CONSTANT = 1;
const unsigned long FULLY_CONTRACTED = 2700;
const long FULLY_EXTENDED = 0;




long double encoder_timer_period_ms;
unsigned long tim2_overflow_count;
unsigned long tim3_overflow_count;
unsigned int pwm_period;
int INITIAL_DIRECTION = 0;




const int setP = 3000;
const int MARGIN = 30;
const float const K = 1000.0;
unsigned int duty_cycle = 0;
char toStr[ 15 ];


const unsigned int ENCODER_TIM_PSC = 100;
const unsigned int SAMPLE_TIM_RELOAD = 59999;
const unsigned int SAMPLE_TIM_PSC = 279;
const unsigned int TERMINAL_PRINT_THRESH = 5;



const unsigned int EMG_TIMER_PSC = 7874;
const unsigned int EMG_TIMER_RELOAD = 63999;







unsigned int poll_flag;
unsigned int terminal_print_count;
int analogGo = 0;
int goStatus = 0;



struct finger fngr_pointer;
struct finger fngr_middle;
struct finger fngr_ring;
struct finger fngr_pinky;
struct finger fngr_thumb;




void main() {

 INITIAL_DIRECTION =  1 ;


 init_UART();
 init_GPIO();


 init_emg();


 strcpy(fngr_pointer.name, "fngr_pointer");
 strcpy(fngr_middle.name, "fngr_middle");
 strcpy(fngr_ring.name, "fngr_ring");
 strcpy(fngr_pinky.name, "fngr_pinky");
 strcpy(fngr_thumb.name, "fngr_thumb");


 pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);
 PWM_TIM4_Init(PWM_FREQ_HZ);


 init_finger(&fngr_pointer);
 init_finger(&fngr_middle);
 init_finger(&fngr_ring);
 init_finger(&fngr_pinky);
 init_finger(&fngr_thumb);


 init_sample_timer();


 init_input_capture();


 activate_input_capture();


 UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
 delay_ms(500);


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



 if (poll_flag == 1) {
 poll_flag = 0;
 sample_finger(&fngr_pointer);
 sample_finger(&fngr_middle);
 sample_finger(&fngr_ring);
 sample_finger(&fngr_pinky);
 sample_finger(&fngr_thumb);

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
