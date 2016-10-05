/*
 * Project name:
     Timer0_interrupt (Timer0 interrupt test)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111226:
       - Initial release;
 * Description:
     This code demonstrates how to use Timer 2 and it's interrupt.
     Program toggles LEDs on PORTE/H.
 * Test configuration:
 * Test configuration:
     MCU:             STM32F407VG
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf
     Dev.Board:       EasyMx v7 for STM32 ® ARM ®
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 120.000MHz
     Ext. Modules:    -
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Turn on PORTE/H LED's at switch SW15
 */



unsigned int overflow_count = 0;
unsigned long pulse_ticks = 0;
unsigned long start_time = 0;
unsigned long end_time = 0;

void init_tim2_input_capture() {
     RCC_APB1ENR.TIM2EN = 1;           //Enable clock gating for timer module 2
     TIM2_CR1.CEN = 0;                 //Disable timer/counter
     TIM2_PSC = 2563;                  //Set timer 2 prescaler (need to determine value)
     TIM2_ARR = 65522;                 //Set timer 2 overflow value at max
     TIM2_CR1.B4 = 0;                  //Set counter direction as upcounting  (DIR Bit)
     TIM2_CR1.B8 = 0;                  //Set counter to have no clock divider    (CKD Bits)
     TIM2_CR1.B9 = 0;                         //second bit of this
     TIM2_CCMR1_Input.B1 = 0;           //Set capture channel 1 as input   (CC1S = 01)
     TIM2_CCMR1_Input.B0 = 1;                 //Second bit of this
     TIM2_CCER.CC1P = 1;               //Set capture on rising edge event
     TIM2_CCER.CC1E = 1;               //Enable capture on channel 1
     TIM2_CCMR1_Input.B3 = 0;          //Disable Capture 1 input prescaler    (IC2PSC = 0)
     TIM2_CCMR1_Input.B2 = 0;                 //Second bit of this
     TIM2_CCMR1_Input.B7 = 0;          //Disable Capture 1 input filtering (IC1F = 0)
     TIM2_CCMR1_Input.B6 = 0;                    //Second bit of this
     TIM2_CCMR1_Input.B5 = 0;                    //Third bit of this
     TIM2_CCMR1_Input.B4 = 0;                    //Fourth bit of this
     TIM2_DIER.CC1IE = 1;              //Enable capture 1 interrupt
     TIM2_DIER.UIE = 1;                //CC1 Update Interrupt Enable
     NVIC_IntEnable(IVT_INT_TIM2);     //Enable timer 2 interrupt
     EnableInterrupts();               //Probably unneeded due to previous line
     TIM2_CR1.CEN = 1;                 //Enable timer/counter
}


void Timer2_interrupt() iv IVT_INT_TIM2 {
     NVIC_IntDisable(IVT_INT_TIM2);     //Disable timer 2 interrupt
     if(TIM2_SR.UIF == 1) {
          TIM2_SR.UIF = 0;                                   //Reset timer 2 interupt flag
          overflow_count++;                                  //Increment overflow counter
     }
     
     if (TIM2_SR.CC1IF == 1) {
          TIM2_SR.CC1IF = 0;                                 //Reset input capture event flag
          end_time = TIM2_CCR1;                              //Grab stored input capture time
          pulse_ticks = (overflow_count << 16) - start_time + end_time;    //Calculate total ticks between events
          start_time = end_time;
          overflow_count = 0;
          GPIOE_ODR = ~GPIOE_ODR;      // Toggle PORTE led's

          //Write number of pulse ticks since last event out to terminal
          //
          //
          //
          UART1_Write(0x30);      // this is all that works so far
          
          delay_ms(1000);
          GPIOE_ODR = ~GPIOE_ODR;
     }
     
          TIM2_SR.CC1IF = 0;                                 //Reset input capture event flag
          TIM2_SR.UIF = 0;                                   //Reset timer 2 interupt flag
          NVIC_IntEnable(IVT_INT_TIM2);

}

void main() {
  GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);  // Enable digital output on PORTE
  GPIOE_ODR = 0;
  GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);
  
  init_tim2_input_capture();

  UART1_Init(115200);
  Delay_ms(200);     // wait for UART1 to stabilize

  while(1)  ;
}