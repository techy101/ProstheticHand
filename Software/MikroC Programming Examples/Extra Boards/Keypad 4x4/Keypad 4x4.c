/*
 * Project name:
     Keypad_Test (Demonstration of usage of the Keypad Library)
 * Copyright:
     (c) MikroElektronika, 2005-2010
 * Revision History:
     20080930:
       - initial release;
     20111012;
       - revision (JK);
 * Description:
      A simple example of using the keypad library.
      It supports keypads with 1..4 rows and 1..4 columns. The code being
      returned by the Keypad_Key_Press() and Keypad_Key_Click() functions is
      in range from 1..16. In this example, the code returned by the keypad
      library functions is transformed into ASCII codes [0..9,A..F].
      In addition, a small single-byte counter displays in the second LCD row
      number of key presses.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    ac:Keypad_4x4_Board  module at PORTD/L (low byte)
                      ac:LCD_Adapter_Board module at PORTD/H (hi  byte)
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Pull-down PORTD/L (low byte) at SW8.
 */

unsigned short kp, cnt, oldstate = 0;
char txt[6];

// Keypad module connections
unsigned long keypadPort_Input  at GPIOD_IDR;
unsigned long keypadPort_Output at GPIOD_ODR;
// End Keypad module connections

// LCD module connections
sbit LCD_RS at GPIOD_ODR.B10;
sbit LCD_EN at GPIOD_ODR.B11;
sbit LCD_D4 at GPIOD_ODR.B12;
sbit LCD_D5 at GPIOD_ODR.B13;
sbit LCD_D6 at GPIOD_ODR.B14;
sbit LCD_D7 at GPIOD_ODR.B15;
// End LCD module connections

void main() {

  cnt = 0;                                 // Reset counter
  Keypad_Init();                           // Initialize Keypad
  Lcd_Init();                              // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);                     // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
  Lcd_Out(1, 1, "1");
  Lcd_Out(1, 1, "Key  :");                 // Write message text on LCD
  Lcd_Out(2, 1, "Times:");

  do {
    kp = 0;                                // Reset key code variable
    // Wait for key to be pressed and released
    do
      // kp = Keypad_Key_Press();          // Store key code in kp variable
      kp = Keypad_Key_Click();             // Store key code in kp variable
    while (!kp);
    
    // Prepare value for output, transform key to it's ASCII value
    switch (kp) {
      //case 10: kp = 42; break;  // '*'   // Uncomment this block for keypad4x3
      //case 11: kp = 48; break;  // '0'
      //case 12: kp = 35; break;  // '#'
      //default: kp += 48;

      case  1: kp = 49; break; // 1        // Uncomment this block for keypad4x4
      case  2: kp = 50; break; // 2
      case  3: kp = 51; break; // 3
      case  4: kp = 65; break; // A
      case  5: kp = 52; break; // 4
      case  6: kp = 53; break; // 5
      case  7: kp = 54; break; // 6
      case  8: kp = 66; break; // B
      case  9: kp = 55; break; // 7
      case 10: kp = 56; break; // 8
      case 11: kp = 57; break; // 9
      case 12: kp = 67; break; // C
      case 13: kp = 42; break; // *
      case 14: kp = 48; break; // 0
      case 15: kp = 35; break; // #
      case 16: kp = 68; break; // D

    }

    if (kp != oldstate) {                  // Pressed key differs from previous
      cnt = 1;
      oldstate = kp;
    }
    else {                                 // Pressed key is same as previous
      cnt++;
    }

    Lcd_Chr(1, 10, kp);                    // Print key ASCII value on LCD

    if (cnt == 255) {                      // If counter varialble overflow
      cnt = 0;
      Lcd_Out(2, 8, "   ");
    }

    ByteToStr(cnt, txt);                   // Transform counter value to string
    Lcd_Out(2, 8, txt);                    // Display counter value on LCD
  } while (1);
}