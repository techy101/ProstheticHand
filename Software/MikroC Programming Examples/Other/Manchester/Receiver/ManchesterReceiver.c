/*
 * Project name:
     ManchesterReceiver (Demonstration on usage of Manchester code library functions)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110105:
       - initial release;
 * Description:
     This code shows how to use Manchester Library for receiving data. The
     example works in conjuction with Transmitter example which sends the word
     "mikroElektronika" using Manchester encoding. During the receive process,
     message letters are being written on the LCD.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     ext. modules:    ac:LCD
                      ac:LCD_Adapter_Board on PORTD
                      Superhet receiver on some household-use frequency
                      (e.g. 433MHz) - OPTIONAL
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - If you decide to try this example(s) with transmitter/receiver modules,
       make sure that both transmitter and a receiver work on the same frequency.
 */

// LCD module connections
sbit LCD_RS at GPIOD_ODR.B2;
sbit LCD_EN at GPIOD_ODR.B3;
sbit LCD_D4 at GPIOD_ODR.B4;
sbit LCD_D5 at GPIOD_ODR.B5;
sbit LCD_D6 at GPIOD_ODR.B6;
sbit LCD_D7 at GPIOD_ODR.B7;
// End LCD module connections


// Manchester module connections
sbit MANRXPIN at GPIOE_IDR.B8;
sbit MANTXPIN at GPIOE_ODR.B9;
// End Manchester module connections

unsigned int error;
char ErrorCount, chr_counter, byte_rcvd;

void main() {

  ErrorCount = 0;
  chr_counter = 0;

  Lcd_Init();                                     // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);                            // Clear LCD display

  Man_Receive_Init();                             // Initialize Receiver

  while (1) {                                     // Endless loop

      Lcd_Cmd(_LCD_FIRST_ROW);                    // Move cursor to the 1st row

      while (1) {                                 // Wait for the "start" byte
        byte_rcvd = Man_Receive(&error);          // Attempt byte receive
        if (byte_rcvd == 0x0B)                    // "Start" byte, see Transmitter example
          break;                                  // We got the starting sequence
        if (error)                                // Exit so we do not loop forever
          break;
        }

      do
        {
          byte_rcvd = Man_Receive(&error);        // Attempt byte receive
          if (error) {                            // If error occured
            Lcd_Chr_CP('?');                      // Write question mark on LCD
            ErrorCount++;                         // Update error counter
            if (ErrorCount > 20) {                // In case of multiple errors
              Man_Synchro();                      // Try to synchronize again
              //Man_Receive_Init();               // Alternative, try to Initialize Receiver again
              ErrorCount = 0;                     // Reset error counter
              }
            }

          else {                                  // No error occured
            if (byte_rcvd != 0x0E) {              // If "End" byte was received(see Transmitter example)
                                                  // do not write anymore received byte on LCD
              Lcd_Chr_CP(byte_rcvd);              // else write character on LCD
              chr_counter++;                      // Counts how many chars have been written on LCD
              if (chr_counter == 25) {            // If there were more then 25 characters
                                                  // synchronization is off
                Lcd_Cmd(_LCD_CLEAR);              // Clear the LCD of garbled communication
                Man_Synchro();                    // Try to synchronize again
              }
            }
            else
              chr_counter = 0;                    // reset chr_counter
          }

          Delay_ms(25);
        }
      while (byte_rcvd != 0x0E);                  // If "End" byte was received exit do loop
   }
}