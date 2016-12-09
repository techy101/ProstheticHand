#line 1 "C:/HandGitRepo/ProstheticHand/Software/Programming Practice/Test for Multiple ADC Channel Reads/read_2_ADC_channels.c"

unsigned int channel1_value;
unsigned int channel2_value;

unsigned int THRESHOLD = 200;



void main() {

 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_LOW);





 ADC_Set_Input_Channel(_ADC_CHANNEL_1);
 ADC1_Init();


 channel1_value = 0;
 channel2_value = 0;

 while(1)
 {

 channel2_value = ADC1_Get_Sample(1);

 delay_ms(100);







 if(channel2_value > THRESHOLD)
 GPIOD_ODR.B1 = 1;
 else
 GPIOD_ODR.B1 = 0;
 }
}
