/*
 * Project name:
     EXTI_interrupt (EXTI interrupt test)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111226:
       - Initial release;
 * Description:
     This code demonstrates how to use External Interrupt on PD10.
     PD10 is external interrupt pin for click1 socket.
     Program toggles LEDs on PORTE.
 * Test configuration:
     MCU:             STM32F407VG
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf
     dev.board:       EasyMX PRO for STM32
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSI-PLL, 140.000MHz
     Ext. Modules:    -
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Turn on PORTE LED's at switch SW15
     - Pull down PortD10 pin (PortD three state pin)
     - Set Button Press Level for PortD on Vcc
 */
 
void ExtInt() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
  EXTI_PR.B10 = 1;                     // clear flag
  GPIOE_ODR = ~GPIOE_IDR;              // Togle PORTE
}

void main() {
  GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH);  // Enable digital output on PORTE
  GPIOE_ODR = 0xAAAA;
  GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10);

  SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
  SYSCFG_EXTICR3 = 0x00000300;         // Map external interrupt on PD10
  EXTI_RTSR = 0x00000000;              // Set interrupt on Rising edge (none)
  EXTI_FTSR = 0x00000400;              // Set Interrupt on Falling edge (PD10)
  EXTI_IMR |= 0x00000400;              // Set mask
  NVIC_IntEnable(IVT_INT_EXTI15_10);   // Enable External interrupt

  while(1)                             // Infinite loop
    ;
}