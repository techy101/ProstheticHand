
unsigned int counterValue = 0;
unsigned int counterInterrupt = 0;
unsigned char *test;


//Interrupt handler for IC (button press)
void wrong() iv IVT_INT_EXTI0 ics ICS_AUTO {
     TIM2_SR.B1 = 1;   // clear flag?
     UART1_Write_Text("Inside handler \n");
     counterInterrupt = 1;
}


void InputCapture() iv IVT_INT_TIM1_CC ics ICS_AUTO {
     //clear flag. later will be cleared by reading tim1_ccr1
     TIM1_SR.CC1IF = 1;
     UART1_Write_Text("inside tim1_cc interrupt \n");
}


unsigned int pollingCounter = 0;


void main() {

  UART1_Init(115200);             // Initialize UART module at 115200 bps
  Delay_ms(100);                  // Wait for UART module to stabilize

  // Enable digital input through PA5 button
  GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_5);

  //GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA5);   //hmmm...  NEW
  //not available on tim1 and tim8?

  //Configure timer to capture counter value in
  //TIM1_CCR1 when TI1 input rises
  //Reference:     STM32F40&VG.c file for register names
  //               Ref Manual ch. 18.4 for bit functions
  //               Ref Manual section 18.3.5 for input capture mode

  //Select active timer input (TI1, CC channel 1)
  TIM1_CCMR1_Input.B1 = 0;
  TIM1_CCMR1_Input.B0 = 1;

  //Program needed input filter duration  (IC1F; none)
  TIM1_CCMR1_Input.B7 = 0;
  TIM1_CCMR1_Input.B6 = 0;
  TIM1_CCMR1_Input.B5 = 0;
  TIM1_CCMR1_Input.B4 = 0;

  //Select edge of active transition on TI1 (rising edge)
  TIM1_CCER.CC1NP = 0;
  TIM1_CCER.CC1P = 0;

  //Disable input prescaler (capture every event)
  TIM1_CCMR1_Input.B3 = 0;
  TIM1_CCMR1_Input.B2 = 0;

  //Enable capture from counter ito cpture register
  TIM1_CCER.CC1E = 1;

  //Enable counter interrupt request?
  TIM1_DIER.CC1IE = 1;

  SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions... for luck
  //NVIC_IntEnable(IVT_INT_TIM1_CC);   // Enable CCP interrupt on timer 1                 NEW
  
   TIM1_CR1.CEN = 1; // enable counter

  //Ready for input!
    UART1_Write_Text("Starting...");
    UART1_Write(13);
    UART1_Write(10);

    //turn off LEDs on A9 and 10   ... ?
   // GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_9 | _GPIO_PINMASK_10);
    //GPIOE_ODR.B9 = 0;
   // GPIOE_ODR.B10 = 0;
    
    while(1)
    {
     if(GPIOA_IDR.B5)  {    //PA5 was pressed
        Delay_ms(150);      //debounce
        UART1_Write_Text("button A5 pressed \n");
        TIM1_EGR.B1 = 1;    // generate a cc event on timer 1, channel 1
        test = (unsigned char *)(hex ref address);
        
        if(test == 1)
                UART1_Write_Text("test = 1 \n ");
        else if(test == 0)
            UART1_Write_Text("test = 0 \n");
        else
            UART1_Write_Text("something else happened \n");
       if(TIM1_SR.CC1IF == 1) {      // interrupt flag on cc1 was set
           UART1_Write_Text("You win! \n");
           TIM1_SR.CC1IF = 0;    // clear flag
           //counterValue = TIM1_CCR1;      // or read stored counter value
       }
     }
      /*
     delay_ms(5000); 
          counterValue = 0;
          counterValue = TIM1_CCR1;      // read the counter value
          UART1_Write_Text("Counter value: ");  // display it
          if(counterValue != 0)
                          UART1_Write_Text("We got something...");
          else
              UART1_Write_Text("Nothing.");
              
          UART1_Write(test);
          UART1_Write(counterValue);
          UART1_Write_Text("\n");
          */
    }

}