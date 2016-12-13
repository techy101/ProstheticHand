#line 1 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/main.c"
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
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/uart.h"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/defines.h"
#line 32 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/uart.h"
void init_UART();
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/emg.h"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/defines.h"
#line 31 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/emg.h"
extern const unsigned int EMG_TIMER_PSC;
extern const unsigned int EMG_TIMER_RELOAD;



void init_emg();



void emg_timer_ISR();
void AWD_ISR();
void emg_override_ISR();
#line 35 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/main.c"
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
#line 95 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/main.c"
void main() {

 INITIAL_DIRECTION =  1 ;


 init_UART();
 init_GPIO();


 init_emg();





 set_finger_name(&fngr_pointer);
#line 201 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/main.c"
}
