#line 1 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Programming Practice/External Interrupt Testing/Analog Watch Dog Interrupt/AWD.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 177 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Programming Practice/External Interrupt Testing/Analog Watch Dog Interrupt/AWD.c"
unsigned long adc_result = 0;
#line 184 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Programming Practice/External Interrupt Testing/Analog Watch Dog Interrupt/AWD.c"
void main() {
 GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_ALL);
 ADC_Set_Input_Channel(_ADC_CHANNEL_3);

 GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_0 | _GPIO_PINMASK_1), (_GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO));
 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));

 ADC1_Init();
 ADC1_LTR =  400 ;
 ADC1_HTR =  3695 ;
 ADC1_CR1bits.AWDIE = 1;
 ADC1_CR1bits.AWDEN = 1;
#line 205 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Programming Practice/External Interrupt Testing/Analog Watch Dog Interrupt/AWD.c"
 while(1){

 if(ADC1_SRbits.AWD == 1){
 GPIOC_ODRbits.ODR13 ^= 1;
 ADC1_SRbits.AWD = 0;
 }
 else{
 GPIOC_ODRbits.ODR13 = 0;
 }

 GPIOD_ODR = ADC1_Get_Sample(3);
 Delay_ms(20);
 }
 }
