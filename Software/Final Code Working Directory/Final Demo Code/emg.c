#include "emg.h"
#include "defines.h"
#include "system.h"


/*
Prosthetic Hand Senior Design Project
12/12/2016
Matthew Varas
Donnell Jones
Rachel Mertz

 * File name:
    emg.c

 * Description:
    C file for all EMG related functions and interrupts
*/



/****************  Electromyography Initialization  *****************
/                                                                    /
/    Function Name: init_emg()                                            /
/    Return Type: None                                                    /
/                                                                    /
/    Description:                                                     /
/        This function performs all initialization of analog             /
/        watchdog, EMG timer, and EMG Override button                    /
/                                                                    /
/    Preconditions:                                                     /
/        None                                                            /
/                                                                    /
/    Postconditions:                                                     /
/        All EMG and AWD configurations are complete                     /
/        EMG Timer interrupt (UIE) is left disabled because it is    /
/        dealt with in the AWD interrupt handler.                    /
/                                                                    /
/*******************************************************************/
void init_emg() {

     /* ------------ Analog Watchdog Initialization ------------ */
     ADC1_LTR = low_level;                                       // Set AWD guard window initial lower threshold
     ADC1_HTR = high_level;                                      // Set AWD guard window initial upper threshold
     ADC1_CR2bits.CONT = 1;                                      // Enable ADC1 continuous conversion mode
     ADC1_SQR3bits.SQ1 = 3;                                      // Set first channel in continuous coversion sequence to channel 3
     ADC1_SQR3bits.SQ2 = 4;                                      // Set second channel in continuous coversion sequence to channel 4 - NEW
     ADC1_CR1bits.AWDSGL = 1;                                    // Enable single channel monitoring mode for AWD
     ADC1_CR1 |= 3;                                              // Set channel 3 as the single monitored AWD channel
     ADC1_CR1bits.AWDEN = 1;                                     // Enable Analog watchdog on regular channels
     ADC1_CR2bits.SWSTART = 1;                                   // Start ADC1 Conversions
     ADC1_CR1bits.AWDIE = 1;                                     // Enable analog watchdog interrupt
     NVIC_IntEnable(IVT_INT_ADC);                                // Enable global ADC interrupt

     /* ------------ EMG Timer (Timer 5) Initialization ------------ */
     RCC_APB1ENR.TIM5EN = 1;                                     // Enable clock gating for timer module 3
     TIM5_CR1.CEN = 0;                                           // Disable timer/counter
     TIM5_PSC = EMG_TIMER_PSC;                                   // Set timer 3 prescaler (need to determine value)
     TIM5_ARR = EMG_TIMER_RELOAD;                                // Set timer 3 overflow value at max
     NVIC_IntEnable(IVT_INT_TIM5);                               // Enable timer 3 interrupt
     TIM5_CR1.CEN = 1;                                           // Enable timer/counter
     GPIO_Digital_Output(&GPIOB_BASE, EMG_ACTIVE_LED);           // Initialize successful EMG indicator LED

     /* ------------ EMG Override Button (EXTI B3) Initialization ------------ */
/*GPIO_Digital_Input(&GPIOB_BASE, EMG_OVERRIDE_BUTTON);         // Enable digital input on B3
     SYSCFGEN_bit = 1;                                                 // Enable system config controller clock
     SYSCFG_EXTICR1bits.EXTI3 = 1;                                 // Map external interrupt 3 to port B
     EXTI_RTSRbits.TR3 = 1;                                         // Set interrupt on rising edge
     EXTI_IMRbits.MR3 = 1;                                         // Unmask bit 3 to enable external interrupt on line 3
     NVIC_IntEnable(IVT_INT_EXTI3);                              // Enable external interrupt B3 for EMG override button*/
}



/***************  Analog Watchdog Interrupt Handler  ****************
/                                                                    /
/    Function Name: AWD_ISR()                                            /
/    Interrupt Handler                                                    /
/                                                                    /
/    Description:                                                     /
/        This function handles code to execute when the EMG signal   /
/        monitored by the AWD moves outside the guarded zone             /
/                                                                    /
/    Preconditions:                                                     /
/        Signal monitored by AWD moved outside the guarded zone            /
/                                                                    /
/    Postconditions:                                                     /
/        Timer is armed if AWD is in initial state                     /
/        AWD is reset and timer disarmed is AWD is in armed state    /
/                                                                    /
/*******************************************************************/
void AWD_ISR() iv IVT_INT_ADC ics ICS_AUTO {
      ADC1_CR1bits.AWDIE = 0;       // Disabling analog interrupt (disable)
      ADC1_SRbits.AWD = 0;          // Reset status bit
      if(ADC1_HTR <= 1000) {        // Current EMG state is dormant
            TIM5_SR.UIF = 0;        // Clear timer 3 interrupt bit
            TIM5_CNT = 0x00;        // Reset timer value to 0
            ADC1_HTR = high_level2; // Set high threshold to MAX
            ADC1_LTR = low_level2;  // Set high threshold to 400
            TIM5_DIER.UIE = 1;      // CC1 Update Interrupt Enable
      }
      else {                        // Current EMG state is armed
            TIM5_DIER.UIE = 0;      // Disable timer interrupt
            ADC1_HTR = high_level;  // Set high threshold to 400
            ADC1_LTR = low_level;   // Set low threshold to 0
      }
      ADC1_CR1bits.AWDIE = 1;       //Enable analog interrupt (enabled)
}



/******************  EMG Timer Interrupt Handler  *******************
/                                                                    /
/    Function Name: emg_timer_ISR()                                    /
/    Interrupt Handler                                                     /
/                                                                    /
/    Description:                                                     /
/        This interrupt handler activates only if the EMG signal has /
/        crossed out of the inital AWD guard zone AND three seconds  /
/        have passed without the AWD signal falling out of the             /
/        armed guard zone. It resets the AWD thresholds to their     /
/        initial states and disables its own overflow interrupt            /
/                                                                    /
/    Preconditions:                                                     /
/        Three seconds have passed since timer was activated             /
/                                                                    /
/    Postconditions:                                                     /
/        AWD low and high thresholds are set to their initial states /
/        Emg timer (Timer 10) overflow interrupts are disabled             /
/                                                                    /
/*******************************************************************/
void emg_timer_ISR() iv IVT_INT_TIM5 {
     TIM5_SR.UIF = 0;                     // Clear timer 3 interrupt bit
     ADC1_HTR = high_level;               // Set high threshold to 400
     ADC1_LTR = low_level;                // Set low threshold to 0
     TIM5_DIER.UIE = 0;                   // Disable timer interrupt
     analogGo = 1;                        // System activation flag
     goStatus = 1;                        // Present system execution state flag
     EMG_ACTIVE_LED = 1;                  // Visual indicator of successful EMG execution
}