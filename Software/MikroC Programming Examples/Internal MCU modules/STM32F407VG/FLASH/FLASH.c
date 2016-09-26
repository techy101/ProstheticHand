/* Copyright:
     (c) Mikroelektronika, 2011.
 * Description:
     This is a simple demonstration how to use internal flash memory to
     store data. The data is being written starting from the given location;
     then, the same locations are read and the data is displayed on PORTD.
 * Test configuration:
     MCU:             STM32F407VG
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf
     Dev.Board:       EasyMx v7 for STM32 ® ARM ®
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 120.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Turn on PORTD/L and PORTD/H LEDs at SW15.
 */

#include <built_in.h>

unsigned long buff[255];
unsigned int  buff_int[32];
unsigned short buff_byte[32];
unsigned long i, tmp;
unsigned long Address = 0x08008000;
unsigned long Address2 = 0x08009000;
unsigned long* ptr;
unsigned int*  ptr_int;
unsigned short*  ptr_byte;

void main() {
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);    // digital output PORTD

  Delay_ms(500);

  for(i=0; i<=255; i++)
    buff[i] = i + (i<<24);

  FLASH_EraseSector(_FLASH_SECTOR_2);
  for(i=0; i<=255; i++)
    FLASH_Write_Word(_FLASH_SECTOR_2_ADDR + i*4, buff[i]);     // write buffer with 32 long words

  FLASH_Lock();

  // check High word
  ptr = (unsigned long*)_FLASH_SECTOR_2_ADDR;
  for(i=0; i<=255; i++) {
    tmp = *ptr;
    GPIOD_ODR = HiWord(tmp);
    Delay_ms(5);
    ptr++;
  }

  Delay_1sec();

  // check Low word
  ptr = (unsigned long*)_FLASH_SECTOR_2_ADDR;
  for(i=0; i<=255; i++) {
    tmp = *ptr;
    GPIOD_ODR = LoWord(tmp);
    Delay_ms(5);
    ptr++;
  }

  FLASH_Unlock();
  FLASH_EraseSector(_FLASH_SECTOR_2);

  for(i=0; i<=32; i++)
    buff_int[i] = i + (i<<8);

  for(i=0; i<=32; i++)
    FLASH_Write_HalfWord(_FLASH_SECTOR_2_ADDR + i*2, buff_int[i]);     // write buffer with 32 long words

  ptr_int = (unsigned int*)_FLASH_SECTOR_2_ADDR;
  for(i=0; i<=32; i++) {
    tmp = *ptr_int;
    GPIOD_ODR = tmp;
    Delay_ms(50);
    ptr_int++;
  }

  FLASH_EraseSector(_FLASH_SECTOR_2);

  for(i=0; i<=32; i++)
    buff_byte[i] = i;

  for(i=0; i<=32; i++)
    FLASH_Write_Byte(_FLASH_SECTOR_2_ADDR + i, buff_byte[i]);     // write buffer with 32 long words

  ptr_byte = (unsigned short*)_FLASH_SECTOR_2_ADDR;
  for(i=0; i<=32; i++) {
    tmp = *ptr_byte;
    GPIOD_ODR = tmp;
    Delay_ms(50);
    ptr_byte++;
  }

}