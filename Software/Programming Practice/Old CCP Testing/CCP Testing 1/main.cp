#line 1 "C:/Users/Rachel/Desktop/Dropbox/Senior Design Team Folder/Software/Programming Practice/CCP Testing 1/main.c"

unsigned int counterValue = 0;
unsigned int counterInterrupt = 0;
unsigned char *test;



void wrong() iv IVT_INT_EXTI0 ics ICS_AUTO {
 TIM2_SR.B1 = 1;
 UART1_Write_Text("Inside handler \n");
 counterInterrupt = 1;
}


void InputCapture() iv IVT_INT_TIM1_CC ics ICS_AUTO {

 TIM1_SR.CC1IF = 1;
 UART1_Write_Text("inside tim1_cc interrupt \n");
}


unsigned int pollingCounter = 0;


void main() {

 UART1_Init(115200);
 Delay_ms(100);


 GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_5);
#line 43 "C:/Users/Rachel/Desktop/Dropbox/Senior Design Team Folder/Software/Programming Practice/CCP Testing 1/main.c"
 TIM1_CCMR1_Input.B1 = 0;
 TIM1_CCMR1_Input.B0 = 1;


 TIM1_CCMR1_Input.B7 = 0;
 TIM1_CCMR1_Input.B6 = 0;
 TIM1_CCMR1_Input.B5 = 0;
 TIM1_CCMR1_Input.B4 = 0;


 TIM1_CCER.CC1NP = 0;
 TIM1_CCER.CC1P = 0;


 TIM1_CCMR1_Input.B3 = 0;
 TIM1_CCMR1_Input.B2 = 0;


 TIM1_CCER.CC1E = 1;


 TIM1_DIER.CC1IE = 1;

 SYSCFGEN_bit = 1;


 TIM1_CR1.CEN = 1;


 UART1_Write_Text("Starting...");
 UART1_Write(13);
 UART1_Write(10);






 while(1)
 {
 if(GPIOA_IDR.B5) {
 Delay_ms(150);
 UART1_Write_Text("button A5 pressed \n");
 TIM1_EGR.B1 = 1;
 test |= TIM1_EGR.B1;
 if(test == 1)
 UART1_Write_Text("test = 1 \n ");
 else if(test == 0)
 UART1_Write_Text("test = 0 \n");
 else
 UART1_Write_Text("something else happened \n");
 if(TIM1_SR.CC1IF == 1) {
 UART1_Write_Text("You win! \n");
 TIM1_SR.CC1IF = 0;

 }
 }
#line 114 "C:/Users/Rachel/Desktop/Dropbox/Senior Design Team Folder/Software/Programming Practice/CCP Testing 1/main.c"
 }

}
