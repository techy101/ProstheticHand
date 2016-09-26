#line 1 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Programming Practice/External Interrupt Testing/Testing/Ext_Int_Direction_And_Enable.c"
#line 10 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Programming Practice/External Interrupt Testing/Testing/Ext_Int_Direction_And_Enable.c"
void DirectionInt2() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
 if((EXTI_PR & 0x00000800) != 0) {
 EXTI_PR.B11 = 1;
 GPIOE_ODR.B10 = ~GPIOE_ODR.B10;
 }

 if((EXTI_PR & 0x00001000) != 0){
 EXTI_PR.B11 = 1;
 GPIOE_ODR.B10 = ~GPIOE_ODR.B10;
 }
}


void main() {
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9 | _GPIO_PINMASK_10);
 GPIO_Digital_Input(&GPIOE_BASE, _GPIO_PINMASK_11 | _GPIO_PINMASK_12);
 GPIOE_ODR.B9 = 0;
 GPIOE_ODR.B10 = 0;

 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR3 = 0x00000300;

 EXTI_RTSR = 0x00000C00;
 EXTI_FTSR = 0x00000000;
 EXTI_IMR |= 0x00000C00;
 NVIC_IntEnable(IVT_INT_EXTI15_10);

 while(1)
 ;
 }
