/*
  Project name: Shared_Line_Interrupts
  
  Description:
  Enables external interrupts via PORTD buttons 10-13.
  These buttons will toggle the corresponding LEDs on PORTE.
*/

//Interrupt Handlers

void interrupt_init() {
    GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_11 | _GPIO_PINMASK_12 | _GPIO_PINMASK_13);  // Enable digital input using buttons D10-13

    SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
    SYSCFG_EXTICR3 = 0x00003300;         // Map external interrupts for PORTD on lines 10 and 11        **Changed to 3300 from 0300 to (Ref Man p.294)
    SYSCFG_EXTICR4 = 0x00003333;         // Map external interrupts for PORTD on lines 12-15
    EXTI_RTSR = 0x0000FC00;              // Set interrupt on Rising edge for lines 10-15
    EXTI_FTSR = 0x00000000;              // Set Interrupt on Falling edge (none)
    EXTI_IMR |= 0x0000FC00;              // Unmask bits 10-15 to interrupt on those lines
    NVIC_IntEnable(IVT_INT_EXTI15_10);      //Enable external interrupt for pins 10-15
}

void ExtInt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
     if(EXTI_PR.B10 != 0)
     {
      GPIOE_ODR.B10 = ~GPIOE_IDR.B10;       // Toggle the corresponding LED on PORTE
      EXTI_PR.B10 = 1;     // clear flag
     }
     if(EXTI_PR.B11 != 0)
     {
      GPIOE_ODR.B11 = ~GPIOE_IDR.B11;       // Toggle the corresponding LED on PORTE
      EXTI_PR.B11 = 1;     // clear flag
     }
     if(EXTI_PR.B12 != 0)
     {
      GPIOE_ODR.B12 = ~GPIOE_IDR.B12;       // Toggle the corresponding LED on PORTE
      EXTI_PR.B12 = 1;     // clear flag
     }
     if(EXTI_PR.B13 != 0)
     {
      GPIOE_ODR.B13 = ~GPIOE_IDR.B13;       // Toggle the corresponding LED on PORTE
      EXTI_PR.B13 = 1;     // clear flag
     }
}

void main() {

     interrupt_init();
     
     GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);  // Enable digital output on PORTE (LEDs)
     GPIOE_ODR = 0x0000;  // LEDs start off or on?
     
     while(1)
             ;
}