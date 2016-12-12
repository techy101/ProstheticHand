#ifndef SYSTEM_H
#define SYSTEM_H

/*
Prosthetic Hand Senior Design Project
12/12/2016
Matthew Varas
Rachel Mertz
Donnell Jones

 * File name:
    system.h

 * Description:
    * Header file for user interface hardware and miscellaneous other settings
        * Sets up external interrupts for user buttons
        * Sets up LED's for user feedback
*/



/*************  Constants ***********/
extern const unsigned long MCU_FREQUENCY;            // Microcontroller clock speed in Hz
extern const unsigned long ENCODER_TIM_RELOAD;           // Auto Reload value for encoder CCP timers (16 bit register)
extern const unsigned long PWM_FREQ_HZ;                  // PWM base frequency
extern const unsigned int ENCODER_TIM_PSC;                 // Prescaler for encoder CCP timers
extern const unsigned int SAMPLE_TIM_RELOAD;             // Auto reload value for sampling timer (100ms)
extern const unsigned int SAMPLE_TIM_PSC;                  // Prescaler for sampling timer
extern const unsigned int TERMINAL_PRINT_THRESH;             // Number of polling events




/*************  Variables ***********/
extern unsigned int poll_flag;                                   // Flag to enter main loop
extern unsigned int terminal_print_count;                        // ** DEBUG ** Flag to print statistics to terminal (via UART)
extern int analogGo;
extern int goStatus;



/************ Function Prototypes ***********/
void init_GPIO();                                              // Initialization of MCU I/O
void init_sample_timer();                                        // Initialization of timer 11 (Used for fixed polling rate)


/************ Interrupt Handlers *************/
void sample_timer_ISR();                                         // Timer 11 ISR used for sampling




#endif