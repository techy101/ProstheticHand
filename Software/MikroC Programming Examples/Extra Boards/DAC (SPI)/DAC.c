/*
 * Project name:
     SPI (Driving external Digital-to-Analog converter)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110105:
       - initial release;
 * Description:
     This is a sample program which demonstrates the use of the Microchip's
     MCP4921 12-bit D/A converter with ARM MCUs. This device accepts digital
     input (number from 0..4095) and transforms it to the output voltage,
     ranging from 0..Vref. In this example the DAC communicates with MCU
     through the SPI communication.
     Buttons RC6 and RC7 are used to change value sent to DAC.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     ext. modules:    ac:DAC_SPI
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
      - JTAG I/O jumpers:
         TDO  to PB3 position
         TRST to PB4 position
     -  DAC Board switches:
         MOSI = P5
         SCK  = P3
         CS   = P1
     - Pull-down PORTC.6 and PORTC.7 at SW6. (board specific)
       Place switches PC6 and PC7 to lower position.
     - Place press level switch SW10 for PORTC in VCC (upper) position. (board specific)
 */

// DAC module connections
sbit Chip_Select at GPIOB_ODR.B1;
// End DAC module connections

unsigned int value;

void InitMain() {
  // Set RC0 and RC1 pins as input
  GPIO_Digital_Input(&GPIOC_BASE,  _GPIO_PINMASK_6 | _GPIO_PINMASK_7);
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);     // Set CS# pin as Output
  Chip_Select = 1;                                       // Deselect DAC

  // Use SPI1 module at PORTB[3:5]
  SPI1_Init_Advanced(_SPI_FPCLK_DIV4, _SPI_MASTER | _SPI_8_BIT |
                     _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                     _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI1_PB345);

  GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SWJ_JTAGDISABLE);
}

// DAC increments (0..4095) --> output voltage (0..Vref)
void DAC_Output(unsigned int valueDAC) {
  char temp;

  Chip_Select = 0;                       // Select DAC chip

  // Send High Byte
  temp = (valueDAC >> 8) & 0x0F;         // Store valueDAC[11..8] to temp[3..0]
  temp |= 0x30;                          // Define DAC setting, see MCP4921 datasheet
  SPI1_Write(temp);                      // Send high byte via SPI

  // Send Low Byte
  temp = valueDAC;                       // Store valueDAC[7..0] to temp[7..0]
  SPI1_Write(temp);                      // Send low byte via SPI

  Chip_Select = 1;                       // Deselect DAC chip
}

void main() {

  InitMain();                            // Perform main initialization

  value = 2048;                          // When program starts, DAC gives
                                         //   the output in the mid-range

  while (1) {                            // Endless loop

    if ((GPIOC_IDRbits.IDR7) && (value < 4095)) {   // If RC7 button is pressed
      value++;                                      //   increment value
    }
    else {
      if ((GPIOC_IDRbits.IDR6) && (value > 0)) {    // If RC6 button is pressed
        value--;                                    //   decrement value
        }
    }

    DAC_Output(value);                   // Send value to DAC chip
    Delay_ms(1);                         // Slow down key repeat pace
  }
}