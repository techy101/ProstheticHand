/*
 * Project name:
     SPI_Glcd (Demonstration of using Spi_Glcd Library)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110105:
       - initial release;
 * Description:
     This is a simple demonstration of the serial Glcd library routines:
     - Init and Clear (pattern fill)
     - Image display
     - Drawing shapes
     - Writing text
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    ac:SPI_GLCD
                      ac:SmartADAPT on PORTA
                      SmartADAPT Extra Development Board.
                      http://www.mikroe.com/add-on-boards/various/smartadapt/
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Use SmartADAPT to match the SPI1 pinout of the ARM and Serial
         Lcd/Glcd adapter. (board specific)
        -GLCD module require 5V power supply.
 */

const code char truck_bmp[1024];

// Port Expander module connections
sbit  SPExpanderRST at GPIOB_ODR.B0;
sbit  SPExpanderCS  at GPIOB_ODR.B1;
// End Port Expander module connections

void Delay2s(){                         // 2 seconds delay function
  Delay_ms(2000);
}

void main() {
  char counter;
  char *someText;

  // Initialize SPI module used with PortExpander
  SPI1_Init_Advanced(_SPI_FPCLK_DIV4, _SPI_MASTER  | _SPI_8_BIT |
                     _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                     _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI1_PB345);



  GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SWJ_JTAGDISABLE);

  SPI_Glcd_Init(0);                                        // Initialize Glcd via SPI
  SPI_Glcd_Fill(0x00);                                     // Clear Glcd
  Delay_ms(500);
  while(1) {
    SPI_Glcd_Image(truck_bmp);                             // Draw image
    Delay2s(); Delay2s();
    SPI_Glcd_fill(0x00);                                   // Clear GLCD
    SPI_Glcd_PartialImage(0,0,68,30,128,64,truck_bmp);     // Partial image
    Delay_ms(500);
    SPI_Glcd_PartialImage(24,16,68,30,128,64,truck_bmp);
    Delay_ms(500);
    SPI_Glcd_PartialImage(56,34,68,30,128,64,truck_bmp);
    Delay2s(); Delay2s();
    SPI_Glcd_Fill(0x00);                                   // Clear GLCD

    SPI_Glcd_Box(62,40,124,56,1);                          // Draw box
    SPI_Glcd_Rectangle(5,5,84,35,1);                       // Draw rectangle
    Delay_ms(1000);
    SPI_Glcd_Rectangle_Round_Edges(2,2,87,38,7,1);
    Delay_ms(1000);
    SPI_Glcd_Rectangle_Round_Edges_Fill(8,8,81,32,12,1);
    Delay_ms(1000);
    SPI_Glcd_Line(0, 0, 127, 63, 1);                       // Draw line
    Delay2s();

    for(counter = 5; counter < 60; counter+=5 ) {          // Draw horizontal and vertical lines
      Delay_ms(250);
      SPI_Glcd_V_Line(2, 54, counter, 1);
      SPI_Glcd_H_Line(2, 120, counter, 1);
    }
    Delay2s();

    SPI_Glcd_Fill(0x00);                                   // Clear Glcd
    SPI_Glcd_Set_Font(Font_Glcd_Character8x7, 8, 7, 32);   // Choose font, see __Lib_GLCDFonts.c in Uses folder
    SPI_Glcd_Write_Text("mikroE", 5, 7, 2);                // Write string

    for (counter = 1; counter <= 10; counter++)            // Draw circles
      SPI_Glcd_Circle(63,32, 3*counter, 1);
    Delay2s();

    SPI_Glcd_Circle_Fill(63,32, 30, 1);                    // Draw circles
    Delay2S();

    SPI_Glcd_Box(12,20, 70,63, 2);                         // Draw box
    Delay2s();

    SPI_Glcd_Fill(0xFF);                                   // Fill Glcd
    SPI_Glcd_Set_Font(Font_Glcd_Character8x7, 8, 7, 32);   // Change font
    someText = "8x7 Font";
    SPI_Glcd_Write_Text(someText, 5, 0, 2);                // Write string
    Delay2s();

    SPI_Glcd_Set_Font(Font_Glcd_System3x5, 3, 5, 32);      // Change font
    someText = "3X5 CAPITALS ONLY";
    SPI_Glcd_Write_Text(someText, 60, 2, 2);               // Write string
    Delay2s();

    SPI_Glcd_Set_Font(Font_Glcd_System5x7, 5, 7, 32);      // Change font
    someText = "5x7 Font";
    SPI_Glcd_Write_Text(someText, 5, 4, 2);                // Write string
    Delay2s();

    SPI_Glcd_Set_Font(Font_Glcd_5x7, 5, 7, 32);            // Change font
    someText = "5x7 Font (v2)";
    SPI_Glcd_Write_Text(someText, 5, 6, 2);                // Write string
    Delay2s();
  }
}