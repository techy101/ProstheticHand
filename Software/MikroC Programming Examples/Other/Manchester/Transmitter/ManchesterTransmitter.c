/*
 * Project name:
     ManchesterTransmitter (Demonstration on usage of Manchester code library functions)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110105:
       - initial release;
 * Description:
     This code shows how to use Manchester Library for sending data. The
     example works in conjuction with Receiver example. This node sends the
     word "mikroElektronika" using Manchester encoding.
* Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    No.
                      Superhet transmitter on some household-use frequency
                      (e.g. 433MHz) - OPTIONAL
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - If you decide to try this example(s) with transmitter/receiver modules,
       make sure that both transmitter and a receiver work on the same frequency!
 */

// Manchester module connections
sbit MANRXPIN at GPIOE_IDR.B8;
sbit MANTXPIN at GPIOE_ODR.B9;
// End Manchester module connections

char index, character;
char s1[] = "mikroElektronika";

void main() {

  Man_Send_Init();                 // Initialize transmitter

  while (1) {                      // Endless loop
    Man_Send(0x0B);                // Send "start" byte
    Delay_ms(100);                 // Wait for a while

    character = s1[0];             // Take first char from string
    index = 0;                     // Initialize index variable
    while (character) {            // String ends with zero
      Man_Send(character);         // Send character
      Delay_ms(90);                // Wait for a while
      index++;                     // Increment index variable
      character = s1[index];       // Take next char from string
    }
    Man_Send(0x0E);                // Send "end" byte
    Delay_ms(1000);
  }
}