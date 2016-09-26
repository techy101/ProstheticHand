/*sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;

#define high_level       3695
#define low_level         400

void setup();
unsigned int adc_avg(unsigned char no_of_samples, unsigned char channel);
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);
float map(float v, float x_min, float x_max, float y_min, float y_max);

void main()
{
   unsigned char s = 0;
   register unsigned int adc_data = 0;
   float v = 0.0;

   setup();

   while(1)
   {
       for(s = 0; s < 4; s++)
       {
             adc_data = adc_avg(20, 3);
       }

       if(ADC1_SRbits.AWD == 1)
       {
           GPIOC_ODRbits.ODR13 ^= 1;
           ADC1_SRbits.AWD = 0;
       }
       else
       {
           GPIOC_ODRbits.ODR13 = 0;
       }
       delay_ms(400);
   };
}

void setup()
{
   GPIO_Clk_Enable(&GPIOA_BASE);
   GPIO_Clk_Enable(&GPIOB_BASE);
   GPIO_Clk_Enable(&GPIOC_BASE);
   GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_0 | _GPIO_PINMASK_1), (_GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO));
   GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
  // ADC_Set_Input_Channel(_ADC_CHANNEL_3);

   ADC1_init();
   ADC1_LTR = low_level;
   ADC1_HTR = high_level;
   ADC1_CR1bits.AWDEN = 1;
   //ADC1_CR1bits.AWDCH = 0x11;

   LCD_Init();
   LCD_Cmd(_LCD_CLEAR);
   LCD_Cmd(_LCD_CURSOR_OFF);

   lcd_out(1, 1, "A0:");
   lcd_out(2, 1, "A1:");
   lcd_out(1, 15, "mV");
   lcd_out(2, 15, "mV");
}

unsigned int adc_avg(unsigned char no_of_samples, unsigned char channel)
{
     register unsigned long avg = 0;
     unsigned char samples = no_of_samples;

     while(samples > 0)
     {
         avg += ADC1_Get_Sample(channel);
         samples--;
     }
     avg /= no_of_samples;

     return avg;
}

void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
{
    unsigned char tmp = 0;

    tmp = (value / 1000);
    lcd_chr(y_pos, x_pos, (tmp + 48));
    tmp = ((value / 100) % 10);
    lcd_chr_cp((tmp + 48));
    tmp = ((value / 10) % 10);
    lcd_chr_cp((tmp + 48));
    tmp = (value % 10);
    lcd_chr_cp((tmp + 48));
}

float map(float v, float x_min, float x_max, float y_min, float y_max)
{
   return (y_min + (((y_max - y_min)/(x_max - x_min)) * (v - x_min)));
}
*/











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
                      
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for ARM
'                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Turn on PORTD LEDs.
     - To simulate analog input on ADC channel 3, use on-board potentiometer P1
       by connecting jumper J9 (board specific) to PA3(ADC channel 3 input).
 */
 /*
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
*/



#include <built_in.h>
#define high_level       3695
#define low_level         400
unsigned long adc_result = 0;

 /* void ADC_AWD() iv IVT_INT_WWDG ics ICS_AUTO {
       GPIOC_ODRbits.ODR13 ^= 1;
       ADC1_SRbits.AWD = 0;
}
  */
void main() {
     GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_ALL);        // Set PORTD as output
     ADC_Set_Input_Channel(_ADC_CHANNEL_3);                     // Choose ADC channel
     
     GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_0 | _GPIO_PINMASK_1), (_GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO));
     GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));

     ADC1_Init();                                               // Init
     ADC1_LTR = low_level;     //Setting max threshold
     ADC1_HTR = high_level;    //Setting low threshold
     ADC1_CR1bits.AWDIE = 1;   //Enable analog interrupt
     ADC1_CR1bits.AWDEN = 1;    //Enable Analog watchdog on regular channels
     /*
     ADC1_CR1bits.AWDSGL = 0;
     ADC1_CR1bits.JAWDEN = 0;
     ADC1_CR1bits.SCAN = 1;
     ADC1_CR1bits.OVRIE = 1;   //Enable overrun interrupt
    */

     //NVIC_IntEnable(IVT_INT_WWDG);

     while(1){
     
              if(ADC1_SRbits.AWD == 1){
              GPIOC_ODRbits.ODR13 ^= 1;
              ADC1_SRbits.AWD = 0;
              }
              else{
                GPIOC_ODRbits.ODR13 = 0;
                }
                
                GPIOD_ODR = ADC1_Get_Sample(3);            // Get ADC value from corresponding channel
                Delay_ms(20);
         }
 }