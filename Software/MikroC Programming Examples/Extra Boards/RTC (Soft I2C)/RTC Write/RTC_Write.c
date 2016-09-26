/*
 * Project name:
     RTC_Write (Demonstration on working with the RTC Module and Software I2C routines)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111224:
       - initial release;
 * Description:
      This project is simple demonstration how to set date and time on PCF8583
      RTC (real-time clock).
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    mE ac:RTC extra board on PORTD (board specific)
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
    - Pull-up I2C communication lines (RD3 and RD4)
       place SW4.3 and SW4.4 in upper position. (board specific)
    - Turn off PORT LEDs at SW15.4. (board specific)
    - In order to use the example, address pin A0 of PCF8583 must be set to 0V.
       (on mikroElektronika's RTC module this is done by default)
 */

// Software I2C connections
sbit Soft_I2C_Scl_Output    at GPIOD_ODR.B3;
sbit Soft_I2C_Scl_Input     at GPIOD_IDR.B3;
sbit Soft_I2C_Sda_Output    at GPIOD_ODR.B4;
sbit Soft_I2C_Sda_Input     at GPIOD_IDR.B4;
// End Software I2C connections

void main() {

  Soft_I2C_Init();       // Initialize full master mode
  Soft_I2C_Start();      // Issue start signal
  Delay_ms(10);
  Soft_I2C_Write(0xA0);  // Address PCF8583, see PCF8583 datasheet
  Soft_I2C_Write(0);     // Start from address 0 (configuration memory location)
  Soft_I2C_Write(0x80);  // Write 0x80 to configuration memory location (pause counter...)
  Soft_I2C_Write(0);     // Write 0 to cents memory location
  Soft_I2C_Write(0);     // Write 0 to seconds memory location
  Soft_I2C_Write(0x59);  // Write 0x59 to minutes memory location
  Soft_I2C_Write(0x23);  // Write 0x23 to hours memory location
  Soft_I2C_Write(0x31);  // Write 0x31 to year/date memory location
  Soft_I2C_Write(0x12);  // Write 0x12 to weekday/month memory location
  Soft_I2C_Stop();       // Issue stop signal

  Soft_I2C_Start();      // Issue start signal
  Soft_I2C_Write(0xA0);  // Address PCF8530
  Soft_I2C_Write(0);     // Start from address 0
  Soft_I2C_Write(0);     // Write 0 to configuration memory location (enable counting)
  Soft_I2C_Stop();       // Issue stop signal
}