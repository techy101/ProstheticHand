/*
 * Project name:
     Spi_Lcd8 (Simple demonstration of the SPI Lcd 8-bit Library functions)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111224:
       - initial release;
 * Description:
     The code prints text on Lcd (8-bit interface) via SPI interface
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    ac:SPI_LCD8 adapter, LCD 2x16
                      SmartADAPT ac:SmartADAPT Extra Development Board.
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Use SmartADAPT to match the SPI pinout of the STM32F107VC and
       Serial Lcd/Glcd adapter. (board specific)
 */
 
char *text = "mikroElektronika";

// Port Expander module connections
sbit  SPExpanderRST           at GPIOB_ODR.B0;
sbit  SPExpanderCS            at GPIOB_ODR.B1;
// End Port Expander module connections

char i;                              // Loop variable

void Move_Delay() {                  // Function used for text moving
  Delay_ms(500);                     // You can change the moving speed here
}

void main() {
  // Initialize SPI module used with PortExpander
  SPI1_Init_Advanced(_SPI_FPCLK_DIV4, _SPI_MASTER  | _SPI_8_BIT |
                     _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                     _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI1_PB345);

  GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SWJ_JTAGDISABLE);


  SPI_Lcd8_Config(0);                    // Initialize Lcd over SPI interface
  SPI_Lcd8_Cmd(_LCD_CLEAR);              // Clear display
  SPI_Lcd8_Cmd(_LCD_CURSOR_OFF);         // Turn cursor off
  SPI_Lcd8_Out(1,6, "mikroE");           // Print text to Lcd, 1st row, 6th column
  SPI_Lcd8_Chr_CP('!');                  // Append '!'
  SPI_Lcd8_Out(2,1, text);               // Print text to Lcd, 2nd row, 1st column

  // SPI_Lcd8_Out(3,1,"mikroE");         // For Lcd with more than two rows
  // SPI_Lcd8_Out(4,15,"mikroE");        // For Lcd with more than two rows

  Delay_ms(2000);

  // Moving text
  for(i=0; i<4; i++) {                   // Move text to the right 4 times
    SPI_Lcd8_Cmd(_LCD_SHIFT_RIGHT);
    Move_Delay();
  }

  while(1) {                             // Endless loop
    for(i=0; i<8; i++) {                 // Move text to the left 7 times
      SPI_Lcd8_Cmd(_LCD_SHIFT_LEFT);
      Move_Delay();
    }

    for(i=0; i<8; i++) {                 // Move text to the right 7 times
      SPI_Lcd8_Cmd(_LCD_SHIFT_RIGHT);
      Move_Delay();
    }
  }

}