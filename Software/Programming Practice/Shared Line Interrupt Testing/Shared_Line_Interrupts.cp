#line 1 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Programming Practice/Shared Line Interrupt Testing/Shared_Line_Interrupts.c"
#line 11 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Programming Practice/Shared Line Interrupt Testing/Shared_Line_Interrupts.c"
void interrupt_init() {
 GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_11 | _GPIO_PINMASK_12 | _GPIO_PINMASK_13);

 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR3 = 0x00003300;
 SYSCFG_EXTICR4 = 0x00003333;
 EXTI_RTSR = 0x0000FC00;
 EXTI_FTSR = 0x00000000;
 EXTI_IMR |= 0x0000FC00;
 NVIC_IntEnable(IVT_INT_EXTI15_10);
}

void ExtInt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
 if(EXTI_PR.B10 != 0)
 {
 GPIOE_ODR.B10 = ~GPIOE_IDR.B10;
 EXTI_PR.B10 = 1;
 }
 if(EXTI_PR.B11 != 0)
 {
 GPIOE_ODR.B11 = ~GPIOE_IDR.B11;
 EXTI_PR.B11 = 1;
 }
 if(EXTI_PR.B12 != 0)
 {
 GPIOE_ODR.B12 = ~GPIOE_IDR.B12;
 EXTI_PR.B12 = 1;
 }
 if(EXTI_PR.B13 != 0)
 {
 GPIOE_ODR.B13 = ~GPIOE_IDR.B13;
 EXTI_PR.B13 = 1;
 }
}

void main() {

 interrupt_init();

 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);
 GPIOE_ODR = 0x0000;

 while(1)
 ;
}
