/*
 * Project name:
     CFlash_Common (Basic use of Compact Flash common library)
 * Copyright:
     (c) Mikroelektronika, 2012.
 * Revision History:
     20111224:
       - initial release;
 * Description:
     This project is a simple demonstration of CF(Compact Flash) Library which
     shows how to use CF card ( http://en.wikipedia.org/wiki/Compact_flash )
     data accessing routines. With minor adjustments,
     this example should work with any other MCU.
     Data access routines need two ports for communication with CF card.
     Before write operation make sure that you do not overwrite boot or FAT
     sector, because it could make your card unreadable by a PC or by a digital
     photo camera.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    mE ac:C_Flash Board on PORTD/H (high byte = Control) and 
                                             PORTD/L (low byte = Data)
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Turn ON PORTE/H (high byte) LEDs at SW15.8 (board specific)
     - This example does NOT cover writing/reading of FILES on the CF media. This
       topic is covered in CF_FAT16 examples.
     - For some CF cards external power supply may be required.
 */
 
#include <built_in.h>

// set compact flash pinout
unsigned long Cf_Data_Port_Input  at GPIOD_IDR;
unsigned long Cf_Data_Port_Output at GPIOD_ODR;

sbit CF_RDY at GPIOD_IDR.B15;
sbit CF_WE  at GPIOD_ODR.B14;
sbit CF_OE  at GPIOD_ODR.B13;
sbit CF_CD1 at GPIOD_IDR.B12;
sbit CF_CE1 at GPIOD_ODR.B11;
sbit CF_A2  at GPIOD_ODR.B10;
sbit CF_A1  at GPIOD_ODR.B9;
sbit CF_A0  at GPIOD_ODR.B8;
// end of cf pinout

unsigned long SignalPort at GPIOE_ODR;

void InitCF() {
  Cf_Init();                              // initialize CF
  while (Cf_Detect() == 0)                // wait until CF card is inserted
    ;
  while (!CF_RDY)
    ;
  Delay_ms(2000);                         // wait for a while until the card is stabilized
}                                         //   period depends on used CF card

void TestBytes() {
  unsigned int i;

  ///// Write numbers 0..511 to sector 590
  Cf_Write_Init(590,1);                   // Initialize write at sector address 590
                                          //     for 1 sector
  Hi(SignalPort) = 0x03;                  // Notify that write has started
  Delay_ms(1000);
  for (i=0; i<=511; i++)                  // Write 512 bytes to sector 590
    Cf_Write_Byte(i);

  Hi(SignalPort) = 0x07;                  // Notify that write end and read start
  Delay_ms(1000);

  Cf_Read_Init(590,1);                    // Initialize read from sector address 590
                                          //    for 1 sector
  for (i=0; i<=511; i++) {                // Read 512 bytes from sector address 590
    Hi(SignalPort) = Cf_Read_Byte();      // Read one byte at time and display
                                          //    readings on signal port
    Delay_ms(5);                          // Wait for a while to see results
  }
  Delay_ms(1000);

  // Write numbers 511..0 to sector 590
  Cf_Write_Init(590,1);                   // Initialize write at sector address 590
                                          //     for 1 sector
  Hi(SignalPort) = 0x03;                  // Notify that write has started
  Delay_ms(1000);
  for (i=0; i<=511; i++)                  // Write 512 bytes to sector 590
    Cf_Write_Byte(511-i);

  Hi(SignalPort) = 0x07;                 // Notify that write end and read start
  Delay_ms(1000);

  Cf_Read_Init(590,1);                    // Initialize read from sector address 590
                                          //    for 1 sector
  for (i=0; i<=511; i++) {                // Read 512 bytes from sector address 590
    Hi(SignalPort) = Cf_Read_Byte();      // Read one byte at time and display
                                          //    readings on signal port
    Delay_ms(5);                          // Wait for a while to see results
  }
  Delay_ms(1000);
}

// Main program
void main() {
  GPIO_Digital_Output(&SignalPort, _GPIO_PINMASK_HIGH); // digital output

  Hi(SignalPort) = 0x01;                  // Notify test start
  InitCF();

  TestBytes();
  Hi(SignalPort) = 0x0F;                  // Notify test end
}