/*
 * Project name:
     ADC Demo (Display the result of ADC on LEDs)
 * Copyright:
     (c) Mikroelektronika, 2005-2012.
 * Revision History:
     20081218:
       - initial release;
 * Description:
      A simple example of using the ADC library.
      ADC results are displayed on PORTH and PORTJ.
 * Test configuration:
     Device:          STM32F107VC    
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx v7 for STM32 Æ ARM Æ
                      http://www.mikroe.com/easymx-pro/stm32/
                      ac:ADC
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for ARM
'                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Turn on PORTD LEDs.
     - To simulate analog input on ADC channel 3, use on-board potentiometer P1
       by connecting jumper J9 (board specific) to PA3(ADC channel 3 input).
 */
 
#include <built_in.h>

#define high_level       3695
#define low_level         400


unsigned long adc_result = 0;

void main() {
 GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_ALL);        // Set PORTD as output
 ADC_Set_Input_Channel(_ADC_CHANNEL_3);                     // Set ADC channel 3 as an analog input
 ADC1_Init();                                               // Init

 ADC1_LTR = low_level;
 ADC1_HTR = high_level;

 Delay_ms(100);
 while(1) {

          if(ADC1_SRbits.AWD == 1){
            GPIOD_ODR = ADC1_Get_Sample(3);  // Get ADC value from corresponding channel   
            ADC1_SRbits.AWD = 0;
          } 
          else{
            GPIOC_ODR = 0;
          }                   
   Delay_ms(20);
 }
}