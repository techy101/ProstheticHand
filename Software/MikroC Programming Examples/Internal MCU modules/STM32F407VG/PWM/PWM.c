/*
 * Project name:
     Pwm_Demo (Demo on using mikroE's PWM library functions)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110105:
       - initial release;
 * Description:
     This is a simple demonstration of PWM library, which is being used for
     control of the ARM's PWM module. The module is initialized and started,
     after which the PWM's Duty Ratios can be adjusted by means of 4 buttons
     connected to pins PA3, PA4, PA5 and PA6. The changes can be monitored on the PWM
     output pins (PE9 and PD13).
 * Test configuration:
     MCU:             STM32F407VG
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf
     Dev.Board:       EasyMx v7 for STM32 ® ARM ®
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 168.000MHz
     ext. modules:    no
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
   - Turn off all PORT LEDs except PORTE/H and PORTD/H at SW15. (board specific)
   - Pull-down PORTA/L at SW2, and put SW10.1 in VCC position (board specific)
 */

unsigned int current_duty, old_duty, current_duty1, old_duty1;
unsigned int pwm_period1, pwm_period2;

void InitMain() {
  GPIO_Digital_Input (&GPIOA_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6); // configure PORTA pins as input
}

void main() {

  InitMain();
  current_duty  = 100;                        // initial value for current_duty
  current_duty1 = 100;                        // initial value for current_duty1

  pwm_period1 = PWM_TIM1_Init(5000);
  pwm_period2 = PWM_TIM4_Init(5000);

  PWM_TIM1_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL1);  // Set current duty for PWM_TIM1
  PWM_TIM4_Set_Duty(current_duty1, _PWM_NON_INVERTED, _PWM_CHANNEL2);  // Set current duty for PWM_TIM4

  PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);
  PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);

  while (1) {                                // endless loop
    if (GPIOA_IDR.B3) {                // button on RA3 pressed
      Delay_ms(1);
      current_duty = current_duty + 5;       // increment current_duty
      if (current_duty > pwm_period1) {      // if we increase current_duty greater then possible pwm_period1 value
        current_duty = 0;                    // reset current_duty value to zero
      }
      PWM_TIM1_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL1); // set newly acquired duty ratio
     }

    if (GPIOA_IDR.B4) {                // button on RA4 pressed
      Delay_ms(1);
      current_duty = current_duty - 5;       // decrement current_duty
      if (current_duty > pwm_period1) {      // if we decrease current_duty greater then possible pwm_period1 value (overflow)
        current_duty = pwm_period1;          // set current_duty to max possible value
      }
      PWM_TIM1_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL1); // set newly acquired duty ratio
     }

    if (GPIOA_IDR.B5) {                // button on RA5 pressed
      Delay_ms(1);
      current_duty1 = current_duty1 + 5;     // increment current_duty
      if (current_duty1 > pwm_period2) {     // if we increase current_duty1 greater then possible pwm_period2 value
        current_duty1 = 0;                   // reset current_duty1 value to zero
      }
      PWM_TIM4_Set_Duty(current_duty1, _PWM_NON_INVERTED, _PWM_CHANNEL2);       // set newly acquired duty ratio
     }

    if (GPIOA_IDR.B6) {                // button on RA6 pressed
      Delay_ms(1);
      current_duty1 = current_duty1 - 5;     // decrement current_duty
      if (current_duty1 > pwm_period2) {     // if we decrease current_duty1 greater then possible pwm_period1 value (overflow)
        current_duty1 = pwm_period2;         // set current_duty to max possible value
      }
      PWM_TIM4_Set_Duty(current_duty1, _PWM_NON_INVERTED, _PWM_CHANNEL2);
     }

    Delay_ms(1);                             // slow down change pace a little
  }
}