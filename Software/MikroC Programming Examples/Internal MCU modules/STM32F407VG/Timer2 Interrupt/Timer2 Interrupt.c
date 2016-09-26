/*
 * Project name:
     Timer0_interrupt (Timer0 interrupt test)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111226:
       - Initial release;
 * Description:
     This code demonstrates how to use Timer 2 and it's interrupt.
     Program toggles LEDs on PORTE/H.
 * Test configuration:
 * Test configuration:
     MCU:             STM32F407VG
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf
     Dev.Board:       EasyMx v7 for STM32 ® ARM ®
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 120.000MHz
     Ext. Modules:    -
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Turn on PORTE/H LED's at switch SW15
 */

void Timer2_interrupt() iv IVT_INT_TIM2 {
  TIM2_SR.UIF = 0;
  GPIOE_ODR = ~GPIOE_ODR;      // Toggle PORTE led's
}

void main() {
  GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);  // Enable digital output on PORTE
  GPIOE_ODR = 0;

  RCC_APB1ENR.TIM2EN = 1;       // Enable clock gating for timer module 2
  TIM2_CR1.CEN = 0;             // Disable timer
  TIM2_PSC = 2563;              // Set timer prescaler.
  TIM2_ARR = 65522;
  NVIC_IntEnable(IVT_INT_TIM2); // Enable timer interrupt
  TIM2_DIER.UIE = 1;            // Update interrupt enable
  TIM2_CR1.CEN = 1;             // Enable timer

  while(1)  ;
}