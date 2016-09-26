/*
 * Project name:
     Sprintf  
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110105:
       - initial release;
 * Description:
     This is a demonstration of the standard C library sprintf routine usage.
     Three different representations of the same floating poing number obtained 
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

float ww = -1.2587538e+1;
char  buffer[15];
char uart_rd;

void main(){

  UART1_Init(115200);

  Delay_ms(100); // Wait for UART module to stabilize
  UART1_Write_Text("Floating point number representation"); // Write message on UART

  sprintf(buffer, "%12e", ww);             // Format ww and store it to buffer
  UART1_Write_Text("\r\ne format:");       // Write message on UART
  UART1_Write_Text(buffer);                // Write buffer on UART

  sprintf(buffer, "%12f", ww);             // Format ww and store it to buffer
  UART1_Write_Text("\r\nf format:");       // Write message on UART
  UART1_Write_Text(buffer);                // Write buffer on UART
  
  sprintf(buffer, "%12g", ww);             // Format ww and store it to buffer
  UART1_Write_Text("\r\ng format:");       // Write message on UART
  UART1_Write_Text(buffer);                // Write buffer on UART

}