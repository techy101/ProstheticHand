#line 1 "C:/Users/Rachel/Desktop/Dropbox/Senior Design Team Folder/Software/Programming Practice/CCP Testing/CCP_start.c"

unsigned int counterValue = 0;
unsigned int counterInterrupt = 0;



void InputCapture() iv IVT_INT_EXTI0 ics ICS_AUTO {
 TIM2_SR.B1 = 1;
 counterInterrupt = 1;
}

void main() {

 UART1_Init(115200);
 Delay_ms(100);
 UART1_Write_Text("Writing something... ");


 GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);









 TIM2_CCMR1_Input.B3 = 0;
 TIM2_CCMR1_Input.B2 = 1;


 TIM2_CCMR1_Input.B7 = 0;
 TIM2_CCMR1_Input.B6 = 0;
 TIM2_CCMR1_Input.B5 = 0;
 TIM2_CCMR1_Input.B4 = 0;


 TIM2_CCER.CC1NP = 0;
 TIM2_CCER.CC1P = 0;


 TIM2_CCMR1_Input.B3 = 0;
 TIM2_CCMR1_Input.B2 = 0;


 TIM2_CCER.CC1E = 1;


 TIM2_DIER.CC1IE = 1;


 UART1_Write_Text("Starting...");
 UART1_Write(13);
 UART1_Write(10);

 while(1)
 {
 if(counterInterrupt)
 {
 counterValue = TIM2_CNT;
 UART1_Write_Text("Count: ");
 UART1_Write(counterValue);
 counterInterrupt = 0;
 }
 }

}
