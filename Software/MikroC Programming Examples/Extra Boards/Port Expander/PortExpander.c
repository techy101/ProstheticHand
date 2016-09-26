/*
 * Project name:
     PortExpander (Demonstration of the Port Expander library routines)
 * Copyright:
     (c) Mikroelektronika, 2009.
 * Revision History:
     20091106:
       - initial release;
 * Description:
     This project is simple demonstration how to use Port Expander Library functions.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    mE ac:Port_Expander board
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - JTAG I/O jumpers:
         TDO  to PB3 position
         TRST to PB4 position
     - Turn on PORTD LEDs at SW15.7 (board specific).
     - Use Port Expander board's ARM interface connector.
 */

// Port Expander module connections
sbit  SPExpanderRST           at GPIOB_ODR.B0;
sbit  SPExpanderCS            at GPIOB_ODR.B1;
// End Port Expander module connections

unsigned int i = 0;

void main() {
  // PORTD output for LEDs
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL); // digital output

  // Port Expander uses SPI1 module at PORTB[3:5]
  SPI1_Init_Advanced(_SPI_FPCLK_DIV4, _SPI_MASTER | _SPI_8_BIT |
                     _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                     _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI1_PB345);

  GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SWJ_JTAGDISABLE);

  Expander_Init(0);                      // Initialize Port Expander

  Expander_Set_DirectionPortA(0, 0x00);  // Set Expander's PORTA to be output

  Expander_Set_DirectionPortB(0,0xFF);   // Set Expander's PORTB to be input
  Expander_Set_PullUpsPortB(0,0xFF);     // Set pull-ups to all of the Expander's PORTB pins

  while(1) {                             // Endless loop
    Expander_Write_PortA(0, i++);        // Write i to expander's PORTA
    GPIOD_ODR = Expander_Read_PortB(0);  // Read expander's PORTB and write it to LEDs
    Delay_ms(75);
  }

}