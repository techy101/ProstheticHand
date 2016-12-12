#include "system.h"

/*
Prosthetic Hand Senior Design Project
12/12/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * File name:
    system.c

 * Description:
    All functions and interrupt handlers related to user interface buttons
        and other miscellaneous functionality

*/


/**********************  GPIO Initialization  ***********************
/                                                                    /
/    Function Name: init_GPIO()                                     /
/    Return Type: None                                                    /
/                                                                    /
/    Arguments: None                                                    /
/                                                                    /
/    Description:                                                     /
/        This function performs initialization of user buttons,     /
/          feedback LED's, motor enable, and PCB buttons/LED's      /
/                                                                    /
/    Preconditions:                                                     /
/        None                                                            /
/                                                                    /
/    Postconditions:                                                     /
/        Pins are configured for mode buttons, mode LED's, motor    /
/          enable pin, and PCB buttons/LED's                        /
/                                                                    /
/*******************************************************************/
void init_GPIO() {
    // Configure motor direction pins
    GPIO_Config(&GPIOE_BASE, _GPIO_PINMASK_10, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);     // Pointer Direction Pin
    GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_10, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);     // Middle Direction Pin
    GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_13, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);     // Ring Direction Pin
    GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_8, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);      // Pinky Direction Pin
    GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_NO);     // Thumb Direction Pin

    // Configure User Interface Mode Buttons
    GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);    // Mode 1 button
    GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_7, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);     // Mode 2 button
    GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_1, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);     // Mode 3 button
    GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);    // Mode 4 button

    // Configure User Interface Mode LED's
    GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);   // Mode 1 LED
    GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_14, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);   // Mode 2 LED
    GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);   // Mode 3 LED
    GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_8, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);    // Mode 4 LED

    // Configure Global Motor Enable/Disable Pin
    GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);

    // Configure AWD Debug LED
    GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);                                            // For awd debug test
    
    // Configure misc PCB buttons
    GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);     // Wakeup Button (Unsure what to use for now)
    GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_4, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);     // User Defined Button (Unused)
    
    // Configure misc PCB LED's
    GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_8, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);    // System Active LED
    GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_7, _GPIO_CFG_DIGITAL_OUTPUT | _GPIO_CFG_PULL_DOWN);    // Low Battery LED (Unused)
}














/******************  Sample Timer Initialization  *******************
/                                                                    /
/    Function Name: initialize_uart1_wired()                            /
/    Return Type: None                                                    /
/                                                                    /
/    Arguments: None                                                    /
/                                                                    /
/    Description:                                                     /
/        This function performs initialization of UART 1 which is   /
/        used for wired FTDI adapter serial communication             /
/                                                                    /
/    Preconditions:                                                     /
/        None                                                            /
/                                                                    /
/    Postconditions:                                                     /
/        Wired serial communication via UART1 is configured and test/
/        message is sent to the terminal.                            /
/                                                                    /
/*******************************************************************/
// Initialize Sample Timer  - Timer 11 (Interrupts every 10ms to poll finger state)
void init_sample_timer() {

    RCC_APB2ENR.TIM11EN = 1;                         // Enable clock for timer 11
    TIM11_CR1.CEN = 0;                               // Disable timer/counter
    TIM11_PSC = SAMPLE_TIM_PSC;                      // Set timer 11 prescaler
    TIM11_ARR = SAMPLE_TIM_RELOAD;                   // Set timer 11 overflow value
    NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);      // Enable timer 11 interrupt
    TIM11_DIER.UIE = 1;                              // Timer 11 update interrupt enable
    TIM11_CR1.CEN = 1;                               // Enable timer/counter
}












/****************  Sample Timer Interrupt Handler  ******************
/                                                                    /
/    Description:                                                     /
/        These ISR's handle all encoder input capture and overflow   /
/        events for timers 2 and 3. These are capture channels for   /
/        motor encoder channel A on all fingers                             /
/                                                                    /
/    Preconditions:                                                     /
/        Timers 2 and 3 have been initialized                             /
/        Input capture channels have been configured                     /
/                                                                    /
/*******************************************************************/
// Interrupt handler for Timer 11 - Used to set sampling rate
void sample_timer_ISR() iv IVT_INT_TIM1_TRG_COM_TIM11 {
    TIM11_SR.UIF = 0;                                                           // Clear timer 11 interrupt flag
    poll_flag = 1;                                                              // Set poll flag for main loop
    terminal_print_count++;                                                     // Increment the debug print counter
}

















/****************  Mode Buttons Interrupt Handler  ******************
/                                                                    /
/    Description:                                                     /
/        These ISR's handle all encoder input capture and overflow   /
/        events for timers 2 and 3. These are capture channels for   /
/        motor encoder channel A on all fingers                             /
/                                                                    /
/    Preconditions:                                                     /
/        Timers 2 and 3 have been initialized                             /
/        Input capture channels have been configured                     /
/                                                                    /
/*******************************************************************/