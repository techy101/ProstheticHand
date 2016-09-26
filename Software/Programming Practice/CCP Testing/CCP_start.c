
unsigned int counterValue = 0;
unsigned int counterInterrupt = 0;


//Interrupt handler for IC (button press)
void InputCapture() iv IVT_INT_EXTI0 ics ICS_AUTO {
     TIM2_SR.B1 = 1;   // clear flag?
     counterInterrupt = 1;
}

void main() {

  UART1_Init(115200);             // Initialize UART module at 115200 bps
  Delay_ms(100);                  // Wait for UART module to stabilize
  UART1_Write_Text("Writing something... ");

  // Enable digital input through buttons D0 and D1
  GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);


  //Configure timer to capture counter value in
  //TIM2_CCR1 when TI1 input rises
  //Reference:     STM32F40&VG.c file for register names
  //               Ref Manual ch. 18.4 for bit functions
  //               Ref Manual section 18.3.5 for input capture mode
  
  //Select active timer input (TI1, CC channel 1)
  TIM2_CCMR1_Input.B1 = 0;	// changed from B3 and B2 set - that was PSC config!
  TIM2_CCMR1_Input.B0 = 1;
  
  //Program needed input filter duration  (IC1F; none)
  TIM2_CCMR1_Input.B7 = 0;
  TIM2_CCMR1_Input.B6 = 0;
  TIM2_CCMR1_Input.B5 = 0;
  TIM2_CCMR1_Input.B4 = 0;
  
  //Select edge of active transition on TI1 (rising edge)
  TIM2_CCER.CC1NP = 0;
  TIM2_CCER.CC1P = 0;
  
  //Disable input prescaler (capture every event)
  TIM2_CCMR1_Input.B3 = 0;
  TIM2_CCMR1_Input.B2 = 0;
  
  //Enable capture from counter
  TIM2_CCER.CC1E = 1;
 
  //Enable counter interrupt request?
  TIM2_DIER.CC1IE = 1;
 
  //Ready for input!
    UART1_Write_Text("Starting...");
    UART1_Write(13);
    UART1_Write(10);
  
    while(1)
    {
       if(counterInterrupt)
       {
          counterValue = TIM2_CNT;      // read the counter value
          UART1_Write_Text("Count: ");  // display it
          UART1_Write(counterValue);
          counterInterrupt = 0;
       }
    }
  
}