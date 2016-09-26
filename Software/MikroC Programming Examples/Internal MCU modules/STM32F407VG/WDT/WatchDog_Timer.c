/*
 * Project name:
     WatchDog_Timer (Demonstration of the Watchdog Timer usage)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Description:
     This code demonstrates how to use hardware controlled Watchdog timer.
 * Test configuration:
     MCU:             STM32F407VG
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf
     Dev.Board:       EasyMx v7 for STM32 ® ARM ®
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 168.000MHz
     Ext. Modules:    -
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Turn ON PORTD/L LEDs at SW15.
*/

void main() {
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);  // Enable digital output on PORTJ

  GPIOD_ODR = 0;
  Delay_ms(1000);
  GPIOD_ODR = 0xFF;
  Delay_ms(1000);

  RCC_APB1ENR.B11 = 1;            // Enable clock gating for Watchdog Timer 0 module

  WWDG_CFR = 1;                   // Write window value to be compared to the downcounter
  WWDG_CR = 0b10000000;           // Enable the watchdog

  while (1)                       // Endless loop, WatchDog_Timer will reset ARM
    ;
}