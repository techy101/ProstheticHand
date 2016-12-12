#include "defines.h"
#include "system.h"
#include "finger.h"
#include "uart.h"
#include "emg.h"



// Prosthetic Hand Senior Design Project
// Matthew Varas, Rachel Mertz, Donnell Jones
// 12/12/2016

// This program executes simple position control of up to five fingers


// Main Starts here 
void main() {

    INITIAL_DIRECTION = EXTEND;                                               // ****DEBUG****

    // Initialize General Hardware
    init_UART();                                                            // Configure and Initialize UART serial communications
    init_GPIO();                                                            // Configure MCU I/O

    // Initialize Electromyography
    init_emg();

    // Initialize force sensors
    init_finger_sensors();

    // Initialize Finger Struct Names
    strcpy(fngr_pointer.name, "fngr_pointer");
    strcpy(fngr_middle.name, "fngr_middle");
    strcpy(fngr_ring.name, "fngr_ring");
    strcpy(fngr_pinky.name, "fngr_pinky");
    strcpy(fngr_thumb.name, "fngr_thumb");

    // Set initial finger position to 0 and direction to CONTRACT         ***This will need to change once calibration is in place***
    init_finger(&fngr_pointer);
    init_finger(&fngr_middle);
    init_finger(&fngr_ring);
    init_finger(&fngr_pinky);
    init_finger(&fngr_thumb);

    // Program start terminal verification
    UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
    delay_ms(500);

    // Start Sample Timer
    init_sample_timer();                                                     // Initialize timer 11, used for sampling

    // Start Input Capture Timers
    init_input_capture();                                                   // Initialize input capture channels

    // Initialize PWM frequencies
    pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);                      // Set fingers PWM base frequency to 10000 Hz
    PWM_TIM4_Init(PWM_FREQ_HZ);                                   // Set thumb PWM base frequency to 10000 Hz

    // Start finger PWM
    init_pointer_PWM();
    init_middle_PWM();
    init_ring_PWM();
    init_pinky_PWM();
    init_thumb_PWM();


    // Infinite Loop
    while(1) {

        /************** Simple button control to prevent fingers from constantly running **************/
        // Activate pointer finger via mode button 1
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
        }


       /*if(analogGo) {*/
        if (poll_flag) {                                                     // Calculate finger state values (Set by timer 3)
             poll_flag = 0;                                                    // Clear flag
             calc_finger_state(&fngr_pointer);                                 // Call state calculation function for each finger - equivalent of sampling
             calc_finger_state(&fngr_middle);
             calc_finger_state(&fngr_ring);
             calc_finger_state(&fngr_pinky);
             calc_finger_state(&fngr_thumb);

        }

        // Print debug info to terminal if set number of samples have occured
        if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {
             print_finger_info(&fngr_pointer);
             print_finger_info(&fngr_middle);
             print_finger_info(&fngr_ring);
             print_finger_info(&fngr_pinky);
             print_finger_info(&fngr_thumb);
             UART1_Write_Text("\n\n\n\n\n\n\n\r");
           }
        }
    //}
} // Main ends here
