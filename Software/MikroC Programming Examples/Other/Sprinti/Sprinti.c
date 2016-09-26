/*
 * Project name:
     Sprinti
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110105:
       - initial release;
 * Description:
     This is a demonstration of the standard C library sprinti routine usage.
     Two different representations of the same integer number obtained
     by using the sprintf routine are sent via UART.
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
     - Turn ON UARTA switches at SW12. (board specific)
 */

unsigned int int_no = 30000;
char  buffer[15];

void main(){

  UART1_Init(115200);

  UART1_Write_Text("Integer number representation"); // Write message on UART

  sprinti(buffer, "%10d", int_no);                   // Format int_no and store it to buffer
  UART1_Write_Text("\r\nd format:");                 // Write message on UART
  UART1_Write_Text(buffer);                          // Write buffer on UART (decimal format)

  sprinti(buffer, "%10x", int_no);                   // Format int_no and store it to buffer
  UART1_Write_Text("\r\nx format:");                 // Write message on UART
  UART1_Write_Text(buffer);                          // Write buffer on UART (hex format)

  sprinti(buffer, "%10o", int_no);                   // Format int_no and store it to buffer
  UART1_Write_Text("\r\no format:");                 // Write message on UART
  UART1_Write_Text(buffer);                          // Write buffer on UART (octal format)
}