/*
 * Project name:
     Soft_UART (Demonstration of using Soft UART library routines) 
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111224:
       - initial release;
 * Description:
     This code demonstrates how to use software UART library routines.
     Upon receiving data via RS232, MCU immediately sends it back to the sender.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Turn ON USB UART1 switches at SW12. (board specific)
*/

char i, error, byte_read;  // Auxiliary variables

void main() {

  error = Soft_UART_Init(&GPIOA_ODR, 10, 9, 115200, 0); // Initialize Soft UART at 56000 bps
  if (error > 0) {
    GPIOD_ODR = error;                            // Signalize Init error
    while(1);                                     // Stop program
  }
  Delay_ms(100);


  for (i = 'z'; i >= 'A'; i--) {                  // Send bytes from 'z' downto 'A'
    Soft_UART_Write(i);
    Delay_ms(100);
  }

  while(1) {                                      // Endless loop
    byte_read = Soft_UART_Read(&error);           // Read byte, then test error flag
    if (error)                                    // If error was detected
      GPIOD_ODR = error;                    //   signal it on PORTD
    else
      Soft_UART_Write(byte_read);                 // If error was not detected, return byte read
    }
}