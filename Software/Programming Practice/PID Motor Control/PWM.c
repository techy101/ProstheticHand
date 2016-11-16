/*
 * NOTES:
   - Turn off all PORT LEDs except PORTE/H and PORTD/H at SW15. (board specific)
   - Pull-down PORTA/L at SW2, and put SW10.1 in VCC position (board specific)
 */

unsigned int current_duty, old_duty = 0;
unsigned int pwm_period;

void InitMain() {
  GPIO_Digital_Input (&GPIOA_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4); // configure PORTA pins as input
}

void main() {

  InitMain();
  current_duty  = 100;                        // initial value for current_duty

  pwm_period = PWM_TIM1_Init(10000);

  PWM_TIM1_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL1);  // Set current duty for PWM_TIM1

  PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);

  while (1) {                                // endless loop
    if (GPIOA_IDR.B3) {                // button on RA3 pressed
      Delay_ms(1);
      current_duty = current_duty + 5;       // increment current_duty
      if (current_duty > pwm_period) {      // if we increase current_duty greater then possible pwm_period value
        current_duty = 0;                    // reset current_duty value to zero
      }
      PWM_TIM1_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL1); // set newly acquired duty ratio
     }

    if (GPIOA_IDR.B4) {                // button on RA4 pressed
      Delay_ms(1);
      current_duty = current_duty - 5;       // decrement current_duty
      if (current_duty > pwm_period) {      // if we decrease current_duty greater then possible pwm_period value (overflow)
        current_duty = pwm_period;          // set current_duty to max possible value
      }
      PWM_TIM1_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL1); // set newly acquired duty ratio
     }

     Delay_ms(1);                             // slow down change pace a little
  }
}