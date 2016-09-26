/*
 * Project Name:
     T6963C_240x64 (GLCD Library demo for Toshiba's T6963 Controller)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111224:
       - initial release; Credits to Bruno Gavand.
 * Description:
     This code in intended to work with GLCD's based on TOSHIBA T6963C controller.
     Pressing buttons PA0 .. PA5 generates commands for text and graphic displaying.
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
     Ext. Modules:    mE ac:T6963C_240x64 Parallel Adapter on PORTD(Control) and PORTE(Data),
                      T6963C display 240x64 pixels
                      http://www.mikroe.com/en/tools/components/#other
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Put PORTE's BUTTON PRESS LEVEL switch (SW10) into Vcc (upper) position and
       pull-down PORTE(board specific).
 */

#include        "__T6963C.h"

// T6963C module connections
unsigned long T6963C_dataPort_Output at GPIOD_ODR;      // DATA port
unsigned long T6963C_dataPort_Input  at GPIOD_IDR;      // DATA port

sbit T6963C_ctrlwr            at GPIOD_ODR.B8; // WR write signal
sbit T6963C_ctrlrd            at GPIOD_ODR.B9; // RD read signal
sbit T6963C_ctrlcd            at GPIOD_ODR.B11; // CD command/data signal
sbit T6963C_ctrlrst           at GPIOD_ODR.B12; // RST reset signal

// Signals not used by library, they are set in main function
sbit T6963C_ctrlce            at GPIOD_ODR.B10; // CE signal
sbit T6963C_ctrlfs            at GPIOD_ODR.B13; // FS signal
// End T6963C module connections

// Pin masks
const CE_FS_PINS    = _GPIO_PINMASK_10 |
                      _GPIO_PINMASK_13;

const INPUT_BUTTONS = _GPIO_PINMASK_8 |
                      _GPIO_PINMASK_9 |
                      _GPIO_PINMASK_10 |
                      _GPIO_PINMASK_11 |
                      _GPIO_PINMASK_12 |
                      _GPIO_PINMASK_13 ;
// End Pin masks

/*
 * bitmap pictures stored in ROM
 */
const code char mikroE_240x64_bmp[];
const code char einstein[];


void main() {
  #define COMPLETE_EXAMPLE
  #define LINE_DEMO             // Uncomment to demonstrate line drawing routines
  #define FILL_DEMO             // Uncomment to demonstrate fill routines
  #define PARTIAL_IMAGE_DEMO    // Uncomment to demonstrate partial image routine

  char txt1[] = " EINSTEIN WOULD HAVE LIKED mE";
  char txt[]  = " GLCD LIBRARY DEMO, WELCOME !";
  char txt2[] = "Partial image demo!";

  unsigned char  panel;         // Current panel
  unsigned int   i;             // General purpose register
  unsigned char  curs;          // Cursor visibility
  unsigned int   cposx, cposy;  // Cursor x-y position
  unsigned short s;             // counter
  
  // input buttons
  GPIO_Digital_Input(&GPIOE_BASE, INPUT_BUTTONS);
              
  // configure CE and FS pins, others will be configured by the T6963C library
  GPIO_Digital_Output(&GPIOD_BASE, CE_FS_PINS);

  T6963C_ctrlce = 0;            // Enable T6963C
  T6963C_ctrlfs = 0;            // Font Select 8x8

  // Initialize T6963C
  T6963C_init(240, 64, 8);

  /*
   * Enable both graphics and text display at the same time
   */
  T6963C_graphics(1);
  T6963C_text(1);

  panel = 0;
  i = 0;
  curs = 0;
  cposx = cposy = 0;
  
  /*
   * Text messages
   */
  T6963C_write_text(txt,  0, 0, T6963C_ROM_MODE_XOR);
  T6963C_write_text(txt1, 0, 7, T6963C_ROM_MODE_XOR);

  /*
   * Cursor
   */
  T6963C_cursor_height(8);       // 8 pixel height
  T6963C_set_cursor(0, 0);       // Move cursor to top left
  T6963C_cursor(0);              // Cursor off

  /*
   * Draw solid boxes
   */
  T6963C_box(0,  0, 239,  8, T6963C_WHITE);
  T6963C_box(0, 55, 239, 63, T6963C_WHITE);

  /*
   * Draw rectangles
   */
  #ifdef LINE_DEMO
    T6963C_rectangle(0,   0, 239, 63, T6963C_WHITE);
    T6963C_rectangle(20, 11, 219, 53, T6963C_WHITE);
    T6963C_rectangle(40, 21, 199, 43, T6963C_WHITE);
    T6963C_rectangle(60, 30, 179, 34, T6963C_WHITE);
  #endif

  /*
   * Draw rounded edge rectangle
   */
  #ifdef LINE_DEMO
    T6963C_Rectangle_Round_Edges(30,16, 209, 48, 12, T6963C_WHITE);
    T6963C_Rectangle_Round_Edges(50,25, 189, 39,  5, T6963C_WHITE);
  #endif

  /*
   * Draw filled rounded edge rectangle
   */
  #ifdef FILL_DEMO
    T6963C_Rectangle_Round_Edges_Fill(10, 10, 229, 53, 12, T6963C_WHITE);
    T6963C_Rectangle_Round_Edges_Fill(15, 15, 224, 49, 12, T6963C_BLACK);
    T6963C_Rectangle_Round_Edges_Fill(20, 20, 219, 44,  9, T6963C_WHITE);
    T6963C_Rectangle_Round_Edges_Fill(25, 25, 214, 39,  7, T6963C_BLACK);
    T6963C_Rectangle_Round_Edges_Fill(30, 30, 209, 34,  2, T6963C_WHITE);
  #endif

  /*
   * Draw a cross
   */
  #ifdef LINE_DEMO
    T6963C_line(0,  0, 239, 63, T6963C_WHITE);
    T6963C_line(0, 63, 239,  0, T6963C_WHITE);
  #endif

  /*
   * Draw circles
   */
  #ifdef LINE_DEMO
    T6963C_circle(120, 32,  10, T6963C_WHITE);
    T6963C_circle(120, 32,  30, T6963C_WHITE);
    T6963C_circle(120, 32,  50, T6963C_WHITE);
    T6963C_circle(120, 32,  70, T6963C_WHITE);
    T6963C_circle(120, 32,  90, T6963C_WHITE);
    T6963C_circle(120, 32, 110, T6963C_WHITE);
    T6963C_circle(120, 32, 130, T6963C_WHITE);
  #endif

  /*
   * Draw filled circles
   */
  #ifdef FILL_DEMO
    T6963C_circle_fill(120, 32, 40, T6963C_WHITE);
    T6963C_circle_fill(120, 32, 35, T6963C_BLACK);
    T6963C_circle_fill(120, 32, 30, T6963C_WHITE);
    T6963C_circle_fill(120, 32, 25, T6963C_BLACK);
    T6963C_circle_fill(120, 32, 20, T6963C_WHITE);
    T6963C_circle_fill(120, 32, 15, T6963C_BLACK);
    T6963C_circle_fill(120, 32, 10, T6963C_WHITE);
    T6963C_circle_fill(120, 32,  5, T6963C_BLACK);
  #endif

  Delay_ms(1000);
  T6963C_sprite(60, 0, einstein, 120, 64);     // Draw a sprite
  Delay_ms(1000);

  T6963C_setGrPanel(1);                        // Select other graphic panel

  T6963C_image(mikroE_240x64_bmp);
  T6963C_displayGrPanel(1);
  Delay_ms(1000);
  #ifdef PARTIAL_IMAGE_DEMO
    T6963C_grFill(0);
    T6963C_PartialImage(0, 0, 64, 64, 240, 64, mikroE_240x64_bmp);   // Display partial image
    Delay_ms(1000);
    T6963C_graphics(0);
  #endif
  T6963C_image(mikroE_240x64_bmp);
  T6963C_graphics(1);
  T6963C_displayGrPanel(0);

  for(;;) { // Endless loop

    /*
     * If RE8 is pressed, display only graphic panel
     */
    if(GPIOE_IDR.B8) {
      T6963C_graphics(1);
      T6963C_text(0);
      Delay_ms(300);
      }
    #ifdef COMPLETE_EXAMPLE
      /*
       * If RE9 is pressed, toggle the display between graphic panel 0 and graphic panel 1
       */
      else if(GPIOE_IDR.B9) {
        panel++;
        panel &= 1;
        T6963C_displayGrPanel(panel);
        Delay_ms(300);
        }
    #endif
    /*
     * If RE10 is pressed, display only text panel
     */
    else if(GPIOE_IDR.B10) {
      T6963C_graphics(0);
      T6963C_text(1);
      Delay_ms(300);
      }

    /*
     * If RE11 is pressed, display text and graphic panels
     */
    else if(GPIOE_IDR.B11) {
      T6963C_graphics(1);
      T6963C_text(1);
      Delay_ms(300);
      }
    /*
     * If RE12 is pressed, change cursor
     */
    else if(GPIOE_IDR.B12) {
      curs++;
      if(curs == 3) curs = 0;
      switch(curs) {
        case 0:
          // no cursor
          T6963C_cursor(0);
          break;
        case 1:
          // blinking cursor
          T6963C_cursor(1);
          T6963C_cursor_blink(1);
          break;
        case 2:
          // non blinking cursor
          T6963C_cursor(1);
          T6963C_cursor_blink(0);
          break;
        }
      Delay_ms(300);
      }

    #ifdef PARTIAL_IMAGE_DEMO
     /*
     * If RA5 is pressed, perform the "Partial image" demostration
     */
    else if(GPIOE_IDR.B13) {
      T6963C_setGrPanel(0);
      T6963C_setTxtPanel(0);
      T6963C_txtFill(0);
      T6963C_setGrPanel(1);
      T6963C_setTxtPanel(0);
      T6963C_graphics(1);
      T6963C_text(1);
      T6963C_displayGrPanel(1);
      T6963C_write_text(txt2, 5, 7, T6963C_ROM_MODE_XOR);
      Delay_1sec();

      for(s = 0; s < 3; s++){
         T6963C_grFill(0);
         T6963C_PartialImage(s*80 + 10, 0, 64, 64, 240, 64, mikroE_240x64_bmp); // Partial image
         Delay_ms(500);
       }

      T6963C_txtFill(0);
      T6963C_image(mikroE_240x64_bmp);
      T6963C_write_text(txt, 0, 0, T6963C_ROM_MODE_XOR);
      T6963C_write_text(txt1, 0, 7, T6963C_ROM_MODE_XOR);
    }
    #endif

    /*
     * Move cursor, even if not visible
     */
    cposx++;
    if(cposx == T6963C_txtCols) {
      cposx = 0;
      cposy++;
      if(cposy == T6963C_grHeight / T6963C_CHARACTER_HEIGHT) {
        cposy = 0;
        }
      }
    T6963C_set_cursor(cposx, cposy);

    Delay_ms(100);
    }
}