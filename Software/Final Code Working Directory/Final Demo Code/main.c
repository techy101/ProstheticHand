#include "defines.h"
#include "system.h"
#include "finger.h"
#include "uart.h"
#include "emg.h"



// Prosthetic Hand Senior Design Project
// Matthew Varas, Rachel Mertz, Donnell Jones
// 12/12/2016

// This program executes simple position control of up to five fingers

/*struct finger {
    char name[STR_MAX];                                         // Name of finger
    long position_temp;                                         // Number of input capture events since last sample. Used for finger position
    long position_actual;                                       // Calculated position of finger
    unsigned int direction_actual;                              // Actual direction of motor movement as read from encoder
    unsigned int direction_desired;                             // Desired direction of movement of finger
    unsigned int enc_chan_b;                                    // Motor encoder channel b value. Used to test direction of movement
    unsigned long enc_start_time;                               // Value of encoder timer when previous capture event occured
    unsigned long enc_end_time;                                 // Value of encoder timer when current capture event occured
    unsigned long enc_delta_ticks;                              // Number of timer ticks between previous/current capture events (Minus overflows)
    unsigned long enc_overflow_start;                           // Value of timer overflow counter when previous capture event occured
    unsigned long enc_overflow_end;                             // Value of timer overflow counter when current capture event occured
    unsigned long enc_overflow_delta;                           // Calculated number of timer overflows between capture events
    unsigned long enc_overflow_ticks;                           // Total number of timer ticks for the timer overflows between events
    unsigned long enc_total_ticks;                              // Calculated total number of timer ticks between input capture events
    unsigned long input_sig_frequency;                          // Frequency of motor encoder signal (in Hz)
    long double input_sig_period;                               // Period of motor encoder signal (in ms)
};*/

/*************  System Constants ***********/
const unsigned long MCU_FREQUENCY = 168000000;            // Microcontroller clock speed in Hz
const unsigned long ENCODER_TIM_RELOAD = 65535;           // Auto Reload value for encoder CCP timers (16 bit register)
const unsigned long PWM_FREQ_HZ = 10000;                  // PWM base frequency

/*************  Finger Constants ***********/
const unsigned int NORMALIZATION_CONSTANT = 1;           // "Self-explanatory" - was 4
const unsigned long FULLY_CONTRACTED = 2700;             // Higher bound for position
const long FULLY_EXTENDED = 0;                           // Lower bound for position



/**************  Finger Global Variables  **************/
long double encoder_timer_period_ms;                     // Period in ms of timers used for motor encoder input capture
unsigned long tim2_overflow_count;                       // Overflow counter for fingers timer (timer 2)
unsigned long tim3_overflow_count;                       // Overflow counter for thumb timer (timer 3)
unsigned int pwm_period;                                 // Base timer period of PWM - needed for duty cycle calculations
int INITIAL_DIRECTION = 0;                               // ***DEBUG***



/************ Position Control Variables ***********/
const int setP = 3000;                                   // Setpoint - desired position. normalized for 0-1000 range. CHANGE TO 3000 AND TEST CONTROL FOR DEMO.
const int MARGIN = 30;                                   // Accuracy of PV - 1.5% from normalization constant
const float const K = 1000.0;                            // Proportion constant for P control
unsigned int duty_cycle = 0;                             // Initial PWM duty cycle
char toStr[STR_MAX];                                     // General variable for converting numbers to strings for terminal print


const unsigned int ENCODER_TIM_PSC = 100;                 // Prescaler for encoder CCP timers
const unsigned int SAMPLE_TIM_RELOAD = 59999;             // Auto reload value for sampling timer (100ms)
const unsigned int SAMPLE_TIM_PSC = 279;                  // Prescaler for sampling timer
const unsigned int TERMINAL_PRINT_THRESH = 5;             // Number of polling events


/* --------------------------- EMG Constants ---------------------------- */
const unsigned int EMG_TIMER_PSC = 7874;                                 // Prescaler value for EMG timer (Timer 5) (3s)
const unsigned int EMG_TIMER_RELOAD = 63999;                         // Auto reload value for EMG timer (Timer 5) (3s)







unsigned int poll_flag;                                   // Flag to enter main loop
unsigned int terminal_print_count;                        // ** DEBUG ** Flag to print statistics to terminal (via UART)
int analogGo = 0;
int goStatus = 0;
 
 
    /************ Instantiate Finger Structs ***********/
/*struct finger fngr_pointer;                 // COMMENTED BY RACHEL
struct finger fngr_middle;
struct finger fngr_ring;
struct finger fngr_pinky;
struct finger fngr_thumb;*/
 


// Main Starts here 
void main() {

    INITIAL_DIRECTION = CONTRACT;                                               // ****DEBUG****

    // Initialize General Hardware
    init_UART();                                                            // Configure and Initialize UART serial communications
    init_GPIO();                                                            // Configure MCU I/O

    // Initialize Electromyography
    init_emg();
    
    // Test 1
    //fngr_pointer.position_temp = 0;       // direct access - NEW by RM
    
    // Test 2
    set_finger_name(&fngr_pointer);           // NEW by RM

    // Initialize Finger Struct Names
/*strcpy(fngr_pointer.name, "fngr_pointer");
    strcpy(fngr_middle.name, "fngr_middle");
    strcpy(fngr_ring.name, "fngr_ring");
    strcpy(fngr_pinky.name, "fngr_pinky");
    strcpy(fngr_thumb.name, "fngr_thumb");*/

/*// Initialize PWM frequencies
    pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);                      // Set fingers PWM base frequency to 10000 Hz
    PWM_TIM4_Init(PWM_FREQ_HZ);                                   // Set thumb PWM base frequency to 10000 Hz

    // Initialize all finger hardware, initial values, and start PWM
    init_finger(&fngr_pointer);
    init_finger(&fngr_middle);
    init_finger(&fngr_ring);
    init_finger(&fngr_pinky);
    init_finger(&fngr_thumb);

    // Start Sample Timer (Timer 11)
    init_sample_timer();

    // Configure input capture timers and hardware
    init_input_capture();

    // Start input capture timers
    activate_input_capture();*/

/*// Program start terminal verification
    UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
    delay_ms(500);*/

/*// Infinite Loop
    while(1) {*/

        /************** Simple button control to prevent fingers from constantly running **************/
/*// Activate pointer finger via mode button 1
        if (GRAB_MODE_BUTTON == 0) {
           PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);
        }
        else {
           PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);
        }

        // Activate middle finger via mode button 2
        if (PINCH_MODE_BUTTON == 0) {
           PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);
        }
        else {
           PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);
        }

        // Activate ring finger via mode button 3
        if (POINT_MODE_BUTTON == 0) {
           PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);
        }
        else {
           PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);
        }

        // Activate Thumb via mode button 4
        if (SHAKE_MODE_BUTTON == 0) {
           PWM_TIM4_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);
        }
        else {
             PWM_TIM4_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);
        }*/


       /*if(analogGo) {*/
/*if (poll_flag == 1) {                                                     // Calculate finger state values (Set by timer 3)
             poll_flag = 0;                                                    // Clear flag
             sample_finger(&fngr_pointer);                                 // Call state calculation function for each finger - equivalent of sampling
             sample_finger(&fngr_middle);
             sample_finger(&fngr_ring);
             sample_finger(&fngr_pinky);
             sample_finger(&fngr_thumb);

        }*/

/*// Print debug info to terminal if set number of samples have occured
        if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {
             print_finger_info(&fngr_pointer);
             print_finger_info(&fngr_middle);
             print_finger_info(&fngr_ring);
             print_finger_info(&fngr_pinky);
             print_finger_info(&fngr_thumb);
             UART1_Write_Text("\n\n\n\n\n\n\n\r");
           }*/
       /*}*/
} // Main ends here