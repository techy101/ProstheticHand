/*
 * Project name:
     Soft_SPI (Driving external Digital-to-Analog converter)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111226:
       - initial release;
 * Description:
     This is a sample program which demonstrates the use of the Microchip's
     MCP4921 12-bit D/A converter with ARM MCUs. This device accepts digital
     input (number from 0..4095) and transforms it to the output voltage,
     ranging from 0..Vref. In this example the DAC communicates with MCU
     through the Soft_SPI communication.
     Buttons PC6 and PC7 are used to change value sent to DAC.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    mE ac:DAC extra board on PORTD
                      http://www.mikroe.com/add-on-boards/measurement/dac/
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Turn on MOSI - P5, SCK - P3, CS - P1 switches on DAC extra board
     - Place press level switch SW10 for PORTC in VCC position, and pull down on
       PC6 and PC7 at switch SW6
 */

// DAC module connections
sbit Chip_Select at GPIOD_ODR.B1;
sbit SoftSpi_CLK at GPIOD_ODR.B3;
sbit SoftSpi_SDI at GPIOD_IDR.B4;
sbit SoftSpi_SDO at GPIOD_ODR.B5;
// End DAC module connections

unsigned int value;

void InitMain() {
  GPIO_Digital_Input(&GPIOC_BASE,  _GPIO_PINMASK_6 | _GPIO_PINMASK_7); // Set PC6 and PC7 as digital input
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);                   // Set PD1 as digital output

  Chip_Select = 1;                       // Deselect DAC
  Soft_SPI_Init();                       // Initialize Soft_SPI
}

// DAC increments (0..4095) --> output voltage (0..Vref)
void DAC_Output(unsigned int valueDAC) {
  char temp;

  Chip_Select = 0;                       // Select DAC chip

  // Send High Byte
  temp = (valueDAC >> 8) & 0x0F;         // Store valueDAC[11..8] to temp[3..0]
  temp |= 0x30;                          // Define DAC setting, see MCP4921 datasheet
  Soft_SPI_Write(temp);                  // Send high byte via Soft SPI

  // Send Low Byte
  temp = valueDAC;                       // Store valueDAC[7..0] to temp[7..0]
  Soft_SPI_Write(temp);                  // Send low byte via Soft SPI

  Chip_Select = 1;                       // Deselect DAC chip
}

void main() {

  InitMain();                            // Perform main initialization

  value = 2048;                          // When program starts, DAC gives
                                         //   the output in the mid-range

  while (1) {                            // Endless loop

    if ((GPIOC_IDRbits.IDR7) && (value < 4095)) { // If PC7 button is pressed
      value++;                                    //   increment value
      }
    else {
      if ((GPIOC_IDRbits.IDR6) && (value > 0)) {  // If PC6 button is pressed
        value--;                                  //   decrement value
        }
      }

    DAC_Output(value);                   // Send value to DAC chip
    Delay_ms(1);                         // Slow down key repeat pace
  }
}