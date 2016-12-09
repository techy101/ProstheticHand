
unsigned int channel1_value;
unsigned int channel2_value;

unsigned int THRESHOLD = 100;

/* turn on LED switches for port D */

void main() {
        // configure 2 ports as output
        GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_LOW);  // Enable digital output on PORTD/L
        GPIOD_ODR = 0x0000;              // init all to 0

        // set up two adc channels
      //  ADC1_Init();
      //  ADC_Set_Input_Channel(_ADC_CHANNEL_7);                    // set up for 1 input - 16-bit ADC
        ADC_Set_Input_Channel(_ADC_CHANNEL_3);                    // set up for 2 input
        ADC1_Init();

        // init channel values
        channel1_value = 0;
        channel2_value = 0;
      //  delay_ms(5000);
  while(1)
  {
        //channel1_value = ADC1_Get_Sample(7);         // Pin A7 - Pointer Flexiforce
        channel2_value = ADC1_Get_Sample(3);         // Pin A1 - EMG signal

        delay_ms(100);                // wait a little between tests

        // toggle leds when you get a force value on a particular channel
     //   if(channel1_value >= THRESHOLD)                // some threshold
      //          GPIOD_ODR = channel1_value;              // Turn on D0
      //  else
      //          GPIOD_ODR.B0 = 0;              // Turn off D0

        if(channel2_value > THRESHOLD)                // some threshold
                GPIOD_ODR.B1 = 1;              // Turn on D1
        else
                GPIOD_ODR.B1 = 0;              // Turn off D1
        }
}