#line 1 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Programming Practice/External Interrupt Testing/Multiple External Interrupt/Ext_Int_Direction_And_Enable.c"
#line 10 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Programming Practice/External Interrupt Testing/Multiple External Interrupt/Ext_Int_Direction_And_Enable.c"
void EnableInt() iv IVT_INT_EXTI0 ics ICS_AUTO {
 EXTI_PR.B10 = 1;
 GPIOE_ODR.B9 = ~GPIOE_ODR.B9;
}

void DirectionInt2() iv IVT_INT_EXTI1 ics ICS_AUTO {
 EXTI_PR.B11 = 1;
 GPIOE_ODR.B10 = ~GPIOE_ODR.B10;
}

void main() {
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9 | _GPIO_PINMASK_10);
 GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
 GPIOE_ODR.B9 = 0;
 GPIOE_ODR.B10 = 0;

 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR1 = 0x00000033;
 EXTI_RTSR = 0x00000003;
 EXTI_FTSR = 0x00000000;
 EXTI_IMR |= 0x00000003;
 NVIC_IntEnable(IVT_INT_EXTI0);
 NVIC_IntEnable(IVT_INT_EXTI1);


 while(1)
 ;
 }
