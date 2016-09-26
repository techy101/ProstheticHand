/*
 * Project name:
     mExternal_interrupt (EXTI interrupt test x 2)

 * NOTES:
     - Pull down PortD10 and PortD11 pin (PortD three state pins)
     - Set Button Press Level for PortD on Vcc
 */

void DirectionInt2() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
  if((EXTI_PR & 0x00000800) != 0) {                          //CHECKING PE11
  EXTI_PR.B11 = 1;                     // clear flag
  GPIOE_ODR.B10 = ~GPIOE_ODR.B10;    // Toggle Direction(Pin)
  }
  
  if((EXTI_PR & 0x00001000) != 0){            //CHECKING PE12
  EXTI_PR.B11 = 1;                     // clear flag
  GPIOE_ODR.B10 = ~GPIOE_ODR.B10;    // Toggle Direction(Pin)
  }
}


void main() {
  GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9 | _GPIO_PINMASK_10);  // Enable digital output on PE9 and PE10
  GPIO_Digital_Input(&GPIOE_BASE, _GPIO_PINMASK_11 | _GPIO_PINMASK_12);  // Enable digital input through buttons D9 and D10
  GPIOE_ODR.B9 = 0;               // Enable motor
  GPIOE_ODR.B10 = 0;             // Start direction clockwise, ha
  
  SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
  SYSCFG_EXTICR3 = 0x00000300;         // Map external interrupt on PD10 and PD11
  
  EXTI_RTSR = 0x00000C00;              // Set interrupt on Rising edge (PD10 and PD11)
  EXTI_FTSR = 0x00000000;              // Set Interrupt on Falling edge (none)
  EXTI_IMR |= 0x00000C00;              // Unmask bits 10 and 11 to interrupt on those lines
  NVIC_IntEnable(IVT_INT_EXTI15_10);   // Enable External interrupt

  while(1)
          ;
  }