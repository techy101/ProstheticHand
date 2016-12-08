#line 1 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/Test for Multiple ADC Channel Reads/read_2_ADC_channels.c"

unsigned channel1_value;
unsigned channel2_value;

unsigned THRESHOLD = 32000;



void main() {

 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_LOW);
 GPIOD_ODR = 0x0000;


 ADC_Set_Input_Channel(_ADC_CHANNEL_7);
 ADC_Set_Input_Channel(_ADC_CHANNEL_3);
 ADC1_Init();


 channel1_value = 0;
 channel2_value = 0;

 while(1)
 {
 channel1_value = ADC1_Get_Sample(7);
 channel2_value = ADC1_Get_Sample(3);

 delay_ms(100);


 if(channel1_value > THRESHOLD)
 GPIOD_ODR.B0 = 1;
 else
 GPIOD_ODR.B0 = 0;

 if(channel2_value > THRESHOLD)
 GPIOD_ODR.B1 = 1;
 else
 GPIOD_ODR.B1 = 0;
 }
}
