/*
 * Project name:
     PrintOutExample (Sample usage of PrintOut() function)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110105:
       - initial release;
 * Description:
     Simple demonstration on usage of the PrintOut() function
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
     - Turn ON UART switches at SW12. (board specific)
 */

void PrintHandler(char c) {
  UART1_Write(c);
}

void main() {
  UART1_Init(56000);        // Initialize Uart at 56000 bps

  PrintOut(PrintHandler, "/*\r\n"
                         " * Project name:\r\n"
                         "     PrintOutExample (Sample usage of PrintOut() function)\r\n"
                         " * Copyright:\r\n"
                         "     (c) MikroElektronika, 2012.\r\n"
                         " * Revision History:\r\n"
                         "     20110105:\r\n"
                         "       - Initial release\r\n"
                         " * Description:\r\n"
                         "     Simple demonstration on usage of the PrintOut() function\r\n"
                         " * Test configuration:\r\n"
                         "     MCU:             STM32F107VC\r\n"
                         "                      http://www.st.com/internet/com/technical_resources/technical_literature/datasheet/cd00220364.pdf\r\n"
                         "     Dev.Board:       EasyMx v7 for STM32(R) ARM(R) \r\n"
                         "                      http://www.mikroe.com/easymx-pro/stm32/\r\n"
                         "     Oscillator:      Oscillator:      HSE-PLL, 72.000MHz\r\n"
                         "     Ext. Modules:    None.\r\n"
                         "     SW:              mikroC PRO for ARM\r\n"
                         "                      http://www.mikroe.com/mikroc/arm/\r\n"
                         " * NOTES:\r\n"
                         "     - Turn ON UART switches at SW12. (board specific)\r\n"
                         " */\r\n", Get_Fosc_kHz()/1000.);
}