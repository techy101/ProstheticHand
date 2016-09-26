/*
 * Project name:
     Lcd_Custom_Test (Simple demonstration of the LCD Library functions)
 * Copyright:
     (c) mikroElektronika, 2009.
 * Revision History:
     20091030:
       - Initial release;
 * Description:
     This is a simple demonstration of LCD library functions. LCD is first
     initialized (PORTA, 4-bit data interface, default pin settings), then some
     text is written at the first and the second row.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    ac:LCD
                      ac:LCD_Adapter_Board on PORTD/L (low byte)
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES: 
     - None.
*/

// LCD module connections
sbit LCD_RS at GPIOD_ODR.B2;
sbit LCD_EN at GPIOD_ODR.B3;
sbit LCD_D4 at GPIOD_ODR.B4;
sbit LCD_D5 at GPIOD_ODR.B5;
sbit LCD_D6 at GPIOD_ODR.B6;
sbit LCD_D7 at GPIOD_ODR.B7;
// End LCD module connections

char txt1[] = "mikroElektronika";    
char txt2[] = "STM32";
char txt3[] = "Lcd4bit";
char txt4[] = "example";

char i;                              // Loop variable

void Move_Delay() {                  // Function used for text moving
  Delay_ms(750);                     // You can change the moving speed here
}

void main(){
  Lcd_Init();                        // Initialize LCD

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,6,txt3);                 // Write text in first row

  Lcd_Out(2,6,txt4);                 // Write text in second row
  Delay_ms(2000);
  Lcd_Cmd(_LCD_CLEAR);               // Clear display

  Lcd_Out(1,1,txt1);                 // Write text in first row
  Lcd_Out(2,4,txt2);                 // Write text in second row

  Delay_ms(2000);

  // Moving text
  for(i=0; i<4; i++) {               // Move text to the right 4 times
    Lcd_Cmd(_LCD_SHIFT_RIGHT);
    Move_Delay();
  }

  while(1) {                         // Endless loop
    for(i=0; i<7; i++) {             // Move text to the left 7 times
      Lcd_Cmd(_LCD_SHIFT_LEFT);
      Move_Delay();
    }

    for(i=0; i<7; i++) {             // Move text to the right 7 times
      Lcd_Cmd(_LCD_SHIFT_RIGHT);
      Move_Delay();
    }
  }
}