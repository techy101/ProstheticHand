/*
 * Project Name:
     SPI_T6963C_240x64 (SPI_Glcd Library demo for Toshiba's T6963 Controller)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110105:
       - initial release; Credits to Bruno Gavand.
 * Description:
     This code in intended to work with GLCD's based on TOSHIBA T6963C controller
     through SPI interface. Pressing buttons PJ0 .. PJ5 generates commands for text and graphic displaying.
     This parts may need a -15V power supply on Vee for LCD drive,
     a simple DC/DC converter can be made with a 2N2905, 220 µH self, diode & 47 µF cap,
     transistor base is driven with PWM through a current limiting resistor.
     This parts have a 8 Kb built-in display RAM, this allows 2 graphics panels
     and one text panel.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. modules:    mE ac:SPI_T6963C Glcd Adapter 240x64 on PORTD and PORTG
                      http://www.mikroe.com/en/tools/glcd/serial/toshiba/240x64/
                      T6963C display 240x64 pixels
                      http://www.mikroe.com/en/tools/components/#other
                      SmartADAPT Extra Development Board.
                      http://www.mikroe.com/add-on-boards/various/smartadapt/
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Put button press level (SW10) into Vcc position for PORTD and pull-down PORTD (board specific).
     - Use SmartADAPT Extra Development Board to mach the SPI pinout of STM32F107VC and Toshiba SPI adapter.
 */
#include "__SPIT6963C.h"

/*
 * bitmap pictures stored in ROM
 */
const code char mikroE_240x64_bmp[];
const code char einstein[];

// Port Expander module connections
sbit  SPExpanderRST at GPIOB_ODR.B0;
sbit  SPExpanderCS  at GPIOB_ODR.B1;
// End Port Expander module connections

void main() {
  #define COMPLETE_EXAMPLE
  #define LINE_DEMO           // Uncomment to demonstrate line drawing routines
  #define FILL_DEMO           // Uncomment to demonstrate fill routines
  #define PARTIAL_IMAGE_DEMO  // Uncomment to demonstrate partial image routine

  char txt1[] = " EINSTEIN WOULD HAVE LIKED mE";
  char txt[] =  " GLCD LIBRARY DEMO, WELCOME !";
  char txt2[] = " Partial image demo!";

  unsigned char  panel;         // Current panel
  unsigned int   i;             // General purpose register
  unsigned char  curs;          // Cursor visibility
  unsigned int   cposx, cposy;  // Cursor x-y position
  unsigned short s;             // counter

 GPIO_Digital_Input(&GPIOD_BASE,0b00111111);


  // If Port Expander Library uses SPI1 module
  // Initialize SPI module used with PortExpander
 SPI1_Init_Advanced(_SPI_FPCLK_DIV8, _SPI_MASTER  | _SPI_8_BIT |
                     _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                     _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI1_PB345);

  GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SWJ_JTAGDISABLE);

   /*
   * init display for 240 pixel width and 64 pixel height
   * 8 bits character width
   * data bus on MCP23S17 portB
   * control bus on MCP23S17 portA
   * bit 0 is !WR
   * bit 1 is !RD
   * bit 3 is !CD
   * bit 4 is RST
   * chip enable, reverse on, 8x8 font internaly set in library
   */

  SPI_T6963C_Config(240, 64, 8, 0, 0, 1, 3, 4);
  Delay_ms(1000);

  /*
   * Enable both graphics and text display at the same time
   */
  SPI_T6963C_graphics(1);
  SPI_T6963C_text(1);

  panel = 0;
  i = 0;
  curs = 0;
  cposx = cposy = 0;
  /*
   * Text messages
   */
  SPI_T6963C_write_text(txt, 0, 0, SPI_T6963C_ROM_MODE_XOR);
  SPI_T6963C_write_text(txt1, 0, 7, SPI_T6963C_ROM_MODE_XOR);

  /*
   * Cursor
   */
  SPI_T6963C_cursor_height(8);       // 8 pixel height
  SPI_T6963C_set_cursor(0, 0);       // Move cursor to top left
  SPI_T6963C_cursor(0);              // Cursor off

  /*
   * Draw solid boxes
   */
  SPI_T6963C_box(0, 0, 239, 8, SPI_T6963C_WHITE);
  SPI_T6963C_box(0, 55, 239, 63, SPI_T6963C_WHITE);

  /*
   * Draw rectangles
   */
  #ifdef LINE_DEMO
    SPI_T6963C_rectangle(0, 0, 239, 63, SPI_T6963C_WHITE);
    SPI_T6963C_rectangle(20, 11, 219, 53, SPI_T6963C_WHITE);
    SPI_T6963C_rectangle(40, 21, 199, 43, SPI_T6963C_WHITE);
    SPI_T6963C_rectangle(60, 30, 179, 34, SPI_T6963C_WHITE);
  #endif

  /*
   * Draw rounded edge rectangle
   */
  #ifdef LINE_DEMO
    SPI_T6963C_Rectangle_Round_Edges(30,16, 209, 48, 12, SPI_T6963C_WHITE);
    SPI_T6963C_Rectangle_Round_Edges(50,25, 189, 39, 5, SPI_T6963C_WHITE);
  #endif

  /*
   * Draw filled rounded edge rectangle
   */
  #ifdef FILL_DEMO
    SPI_T6963C_Rectangle_Round_Edges_Fill(10, 10, 229, 53, 12, SPI_T6963C_WHITE);
    SPI_T6963C_Rectangle_Round_Edges_Fill(15, 15, 224, 49, 12, SPI_T6963C_BLACK);
    SPI_T6963C_Rectangle_Round_Edges_Fill(20, 20, 219, 44, 9, SPI_T6963C_WHITE);
    SPI_T6963C_Rectangle_Round_Edges_Fill(25, 25, 214, 39, 7, SPI_T6963C_BLACK);
    SPI_T6963C_Rectangle_Round_Edges_Fill(30, 30, 209, 34, 2, SPI_T6963C_WHITE);
  #endif

  /*
   * Draw a cross
   */
  #ifdef LINE_DEMO
    SPI_T6963C_line(0, 0, 239, 63, SPI_T6963C_WHITE);
    SPI_T6963C_line(0, 63, 239, 0, SPI_T6963C_WHITE);
  #endif

  /*
   * Draw circles
   */
  #ifdef LINE_DEMO
    SPI_T6963C_circle(120, 32, 10, SPI_T6963C_WHITE);
    SPI_T6963C_circle(120, 32, 30, SPI_T6963C_WHITE);
    SPI_T6963C_circle(120, 32, 50, SPI_T6963C_WHITE);
    SPI_T6963C_circle(120, 32, 70, SPI_T6963C_WHITE);
    SPI_T6963C_circle(120, 32, 90, SPI_T6963C_WHITE);
    SPI_T6963C_circle(120, 32, 110, SPI_T6963C_WHITE);
    SPI_T6963C_circle(120, 32, 130, SPI_T6963C_WHITE);
  #endif

  /*
   * Draw filled circles
   */
  #ifdef FILL_DEMO
    SPI_T6963C_circle_fill(120, 32, 40, SPI_T6963C_WHITE);
    SPI_T6963C_circle_fill(120, 32, 35, SPI_T6963C_BLACK);
    SPI_T6963C_circle_fill(120, 32, 30, SPI_T6963C_WHITE);
    SPI_T6963C_circle_fill(120, 32, 25, SPI_T6963C_BLACK);
    SPI_T6963C_circle_fill(120, 32, 20, SPI_T6963C_WHITE);
    SPI_T6963C_circle_fill(120, 32, 15, SPI_T6963C_BLACK);
    SPI_T6963C_circle_fill(120, 32, 10, SPI_T6963C_WHITE);
    SPI_T6963C_circle_fill(120, 32, 5, SPI_T6963C_BLACK);
  #endif

  Delay_ms(1000);
  SPI_T6963C_sprite(60, 0, einstein, 120, 64);  // Draw a sprite
  Delay_ms(1000);
  
  SPI_T6963C_setGrPanel(1);                     // Select other graphic panel
  SPI_T6963C_image(mikroE_240x64_bmp);
  SPI_T6963C_displayGrPanel(1);
  Delay_ms(1000);
  #ifdef PARTIAL_IMAGE_DEMO 
    SPI_T6963C_grFill(0);
    SPI_T6963C_PartialImage(0, 0, 64, 64, 240, 64, mikroE_240x64_bmp);   // Display partial image
    Delay_ms(1000);
    SPI_T6963C_graphics(0);
  #endif
  SPI_T6963C_image(mikroE_240x64_bmp);
  SPI_T6963C_graphics(1);
  SPI_T6963C_displayGrPanel(0);
  for(;;) {                                               // Endless loop
     /*
     * If PJ0 is pressed, display only graphic panel
     */
    if(GPIOD_IDR.B0) {
      SPI_T6963C_graphics(1);
      SPI_T6963C_text(0);
      Delay_ms(300);
      }
    #ifdef COMPLETE_EXAMPLE
      /*
       * If PJ1 is pressed, toggle the display between graphic panel 0 and graphic panel 1
       */
      else if(GPIOD_IDR.B1) {
        panel++;
        panel &= 1;
        SPI_T6963C_displayGrPanel(panel);
        Delay_ms(300);
        }
    #endif
    /*
     * If PJ2 is pressed, display only text panel
     */
    else if(GPIOD_IDR.B2) {
      SPI_T6963C_graphics(0);
      SPI_T6963C_text(1);
      Delay_ms(300);
      }

    /*
     * If PJ3 is pressed, display text and graphic panels
     */
    else if(GPIOD_IDR.B3) {
      SPI_T6963C_graphics(1);
      SPI_T6963C_text(1);
      Delay_ms(300);
      }

    /*
     * If PJ4 is pressed, change cursor
     */
    else if(GPIOD_IDR.B4) {
      curs++;
      if(curs == 3) curs = 0;
      switch(curs) {
        case 0:
          // no cursor
          SPI_T6963C_cursor(0);
          break;
        case 1:
          // blinking cursor
          SPI_T6963C_cursor(1);
          SPI_T6963C_cursor_blink(1);
          break;
        case 2:
          // non blinking cursor
          SPI_T6963C_cursor(1);
          SPI_T6963C_cursor_blink(0);
          break;
        }
      Delay_ms(300);
      }

    #ifdef PARTIAL_IMAGE_DEMO
    /*
     * If PJ5 is pressed, perform the "Partial image" demostration
     */
    else if(GPIOD_IDR.B5) {
      SPI_T6963C_setGrPanel(0);
      SPI_T6963C_setTxtPanel(0);
      SPI_T6963C_txtFill(0);
      SPI_T6963C_setGrPanel(1);
      SPI_T6963C_setTxtPanel(0);
      SPI_T6963C_graphics(1);
      SPI_T6963C_text(1);
      SPI_T6963C_displayGrPanel(1);
      SPI_T6963C_write_text(txt2, 5, 7, SPI_T6963C_ROM_MODE_XOR);
      Delay_1sec();

      for(s = 0; s < 3; s++){
         SPI_T6963C_grFill(0);
         SPI_T6963C_PartialImage(s*80 + 10, 0, 64, 64, 240, 64, mikroE_240x64_bmp); // Partial image
         Delay_ms(300);
       }

      SPI_T6963C_txtFill(0);
      SPI_T6963C_image(mikroE_240x64_bmp);
      SPI_T6963C_write_text(txt, 0, 0, SPI_T6963C_ROM_MODE_XOR);
      SPI_T6963C_write_text(txt1, 0, 7, SPI_T6963C_ROM_MODE_XOR);
    }
    #endif

    /*
     * Move cursor, even if not visible
     */
    cposx++;
    if(cposx == SPI_T6963C_txtCols) {
      cposx = 0;
      cposy++;
      if(cposy == SPI_T6963C_grHeight / SPI_T6963C_CHARACTER_HEIGHT) {
        cposy = 0;
        }
      }
    SPI_T6963C_set_cursor(cposx, cposy);

    Delay_ms(100);

    }
}