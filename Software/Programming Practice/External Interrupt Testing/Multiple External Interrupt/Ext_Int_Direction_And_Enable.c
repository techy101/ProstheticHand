/*
 * Project name:
     mExternal_interrupt (EXTI interrupt test x 2)

 * NOTES:
     - Pull down PortD10 and PortD11 pin (PortD three state pins)
     - Set Button Press Level for PortD on Vcc
 */

void EnableInt() iv IVT_INT_EXTI0 ics ICS_AUTO {
  EXTI_PR.B10 = 1;                     // clear flag
  GPIOE_ODR.B9 = ~GPIOE_ODR.B9;      // Toggle Enable(Pin)
}

void DirectionInt2() iv IVT_INT_EXTI1 ics ICS_AUTO {
  EXTI_PR.B11 = 1;                     // clear flag
  GPIOE_ODR.B10 = ~GPIOE_ODR.B10;    // Toggle Direction(Pin)
}

void main() {
  GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9 | _GPIO_PINMASK_10);  // Enable digital output on PE9 and PE10
  GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);  // Enable digital input through buttons D9 and D10
  GPIOE_ODR.B9 = 0;               // Enable motor
  GPIOE_ODR.B10 = 0;             // Start direction clockwise, ha
  
  SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
  SYSCFG_EXTICR1 = 0x00000033;         // Map external interrupt on PD0 and PD1         **Changed to 3300 from 0300 to (Ref Man p.294)
  EXTI_RTSR = 0x00000003;              // Set interrupt on Rising edge (PD10 and PD11)
  EXTI_FTSR = 0x00000000;              // Set Interrupt on Falling edge (none)
  EXTI_IMR |= 0x00000003;              // Unmask bits 10 and 11 to interrupt on those lines
  NVIC_IntEnable(IVT_INT_EXTI0);      //Enable external interrupt for direction pin
  NVIC_IntEnable(IVT_INT_EXTI1);      //Enable external interrupt for direction pin
  
  
  while(1)
          ;
  }