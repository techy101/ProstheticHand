/*
 * Project name:
     DAC (Demo on using mikroE's DAC library functions)
 * Copyright:
     (c) Mikroelektronika, 2013.
 * Revision History:
     20130805:
       - initial release;
 * Description:
     This is a simple demonstration of DAC library, which is being used for
     control of the ARM's DAC module. The module is initialized and started,
     DAC values can be changed using 2 buttons connected to pins PC6 and PC7.
     The changes can be monitored on the DAC output pins (PA4 and PA5).
 * Test configuration:
     MCU:             STM32F407VG
                      http://www.st.com/web/en/resource/technical/document/reference_manual/DM00031020.pdf
     Dev.Board:       EasyMx v7 for STM32 ® ARM ®
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 120.000MHz
     ext. modules:    no
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
   - Turn off all PORT LEDs except PORTC/L (board specific)
   - Pull-down PC6 and PC7 at PORTC/L (board specific)
   - Pull-up PORTC/L at SW10.
 */

unsigned int value;
unsigned long conf1;
unsigned long conf2;


void main() {
  GPIO_Digital_Input(&GPIOC_BASE,  _GPIO_PINMASK_6 | _GPIO_PINMASK_7);

  value = 0;
  DAC1_Init(_DAC_CH1_ENABLE | _DAC_CH2_ENABLE);

  while (1) {                                       // Endless loop

    if ((GPIOC_IDRbits.IDR7) && (value < 4095)) {   // If RC7 button is pressed
      value++;                                      //   increment value
    }
    else {
      if ((GPIOC_IDRbits.IDR6) && (value > 0)) {    // If RC6 button is pressed
        value--;                                    //   decrement value
      }
    }
//  8 Bit mode
/*
    conf1 = _DAC_8_BIT | _DAC_TRIGGER_SW;
    conf2 = _DAC_8_BIT | _DAC_TRIGGER_SW;
*/

    conf1 = _DAC_12_BIT | _DAC_TRIGGER_SW | _DAC_RIGHT_ALIGN;
    conf2 = _DAC_12_BIT | _DAC_TRIGGER_SW | _DAC_RIGHT_ALIGN;

    DAC1_Advanced_Ch1_Output(value, conf1);
    DAC1_Advanced_Ch2_Output(value, conf2);

//  used with dual channel mode
//    conf1 = _DAC_12_BIT | _DAC_TRIGGER_SW | _DAC_LEFT_ALIGN | _DAC_NOISE_WAVE | _DAC_MMAP_511;
//    conf2 = _DAC_12_BIT | _DAC_TRIGGER_SW | _DAC_LEFT_ALIGN | _DAC_NOISE_WAVE | _DAC_MMAP_127;
//
//    DAC1_Dual_Output(value, value, conf1, conf2);

    Delay_ms(1);
  }
}