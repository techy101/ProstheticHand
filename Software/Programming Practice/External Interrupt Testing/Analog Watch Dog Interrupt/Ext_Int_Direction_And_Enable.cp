#line 1 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Programming Practice/External Interrupt Testing/Analog Watch Dog Interrupt/Ext_Int_Direction_And_Enable.c"



void setup();
unsigned int adc_avg(unsigned char no_of_samples, unsigned char channel);

void main()
{
 unsigned char s = 0;
 register unsigned int adc_data = 0;
 float v = 0.0;

 setup();

 while(1)
 {
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

 ADC1_init();
 ADC1_LTR =  400 ;
 ADC1_HTR =  3695 ;
 ADC1_CR1bits.AWDEN = 1;
}
