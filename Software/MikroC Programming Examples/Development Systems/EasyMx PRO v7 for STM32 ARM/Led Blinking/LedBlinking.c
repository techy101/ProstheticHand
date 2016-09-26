/* Project name:
     Led_Blinking (The simplest simple example)
 * Copyright:
     (c) Mikroelektronika, 2012.
 * Revision History:
       - initial release;
 * Description:
     Simple "Hello world" example for the world of ARM MCUs;
 * Test configuration:
     Device:          STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx v7 for STM(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
                      ac:LEDs
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Turn ON PORTA, PORTB, PORTC, PORTD, PORTE at SW15 (board specific).
 */

void main() {
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_ALL); // Set PORTA as digital output
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_ALL); // Set PORTB as digital output
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_ALL); // Set PORTC as digital output
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL); // Set PORTD as digital output
  GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL); // Set PORTE as digital output

  GPIOA_ODR = 0;
  GPIOB_ODR = 0;
  GPIOC_ODR = 0;
  GPIOD_ODR = 0;
  GPIOE_ODR = 0;

  while(1) {
    GPIOA_ODR = ~GPIOA_ODR; // Toggle PORTA
    GPIOB_ODR = ~GPIOB_ODR; // Toggle PORTB
    GPIOC_ODR = ~GPIOC_ODR; // Toggle PORTC
    GPIOD_ODR = ~GPIOD_ODR; // Toggle PORTD
    GPIOE_ODR = ~GPIOE_ODR; // Toggle PORTE
    Delay_ms(1000);
  }
}