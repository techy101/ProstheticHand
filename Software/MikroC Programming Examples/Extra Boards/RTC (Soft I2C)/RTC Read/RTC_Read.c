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
                      LCD Adapter ac:LCD_Adapter extra board on PORTD (board specific)
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
    - Pull-up I2C communication lines (RD3 and RD4)
       place SW4.3 and SW4.4 in upper position. (board specific)
    - Turn off PORT LEDs at SW15.4. (board specific)
    - In order to use the example, address pin A0 of PCF8583 must be set to 0V.
       (on mikroElektronika's RTC module this is done by default)
 */

char seconds, minutes, hours, day, month, year;    // Global date/time variables

// Software I2C connections
sbit Soft_I2C_Scl_Output    at GPIOD_ODR.B3;
sbit Soft_I2C_Scl_Input     at GPIOD_IDR.B3;
sbit Soft_I2C_Sda_Output    at GPIOD_ODR.B4;
sbit Soft_I2C_Sda_Input     at GPIOD_IDR.B4;
// End Software I2C connections

// LCD module connections
sbit LCD_RS at GPIOD_ODR.B10;
sbit LCD_EN at GPIOD_ODR.B11;
sbit LCD_D4 at GPIOD_ODR.B12;
sbit LCD_D5 at GPIOD_ODR.B13;
sbit LCD_D6 at GPIOD_ODR.B14;
sbit LCD_D7 at GPIOD_ODR.B15;
// End LCD module connections


// End LCD module connections

//--------------------- Reads time and date information from RTC (PCF8583)
void Read_Time() {

  Soft_I2C_Start();               // Issue start signal
  Soft_I2C_Write(0xA0);           // Address PCF8583, see PCF8583 datasheet
  Soft_I2C_Write(2);              // Start from address 2
  Soft_I2C_Start();               // Issue repeated start signal
  Soft_I2C_Write(0xA1);           // Address PCF8583 for reading R/W=1

  seconds = Soft_I2C_Read(1);     // Read seconds byte
  minutes = Soft_I2C_Read(1);     // Read minutes byte
  hours = Soft_I2C_Read(1);       // Read hours byte
  day = Soft_I2C_Read(1);         // Read year/day byte
  month = Soft_I2C_Read(0);       // Read weekday/month byte
  Soft_I2C_Stop();                // Issue stop signal

}

//-------------------- Formats date and time
void Transform_Time() {
  seconds  =  ((seconds & 0xF0) >> 4)*10 + (seconds & 0x0F);  // Transform seconds
  minutes  =  ((minutes & 0xF0) >> 4)*10 + (minutes & 0x0F);  // Transform months
  hours    =  ((hours & 0xF0)  >> 4)*10  + (hours & 0x0F);    // Transform hours
  year     =   (day & 0xC0) >> 6;                             // Transform year
  day      =  ((day & 0x30) >> 4)*10    + (day & 0x0F);       // Transform day
  month    =  ((month & 0x10)  >> 4)*10 + (month & 0x0F);     // Transform month
}

//-------------------- Output values to LCD
void Display_Time() {

   Lcd_Chr(1, 6, (day / 10)   + 48);    // Print tens digit of day variable
   Lcd_Chr(1, 7, (day % 10)   + 48);    // Print oness digit of day variable
   Lcd_Chr(1, 9, (month / 10) + 48);
   Lcd_Chr(1,10, (month % 10) + 48);
   Lcd_Chr(1,15,  year        + 49);    // Print year vaiable + 1 (start from year 2011)

   Lcd_Chr(2, 6, (hours / 10)   + 48);
   Lcd_Chr(2, 7, (hours % 10)   + 48);
   Lcd_Chr(2, 9, (minutes / 10) + 48);
   Lcd_Chr(2,10, (minutes % 10) + 48);
   Lcd_Chr(2,12, (seconds / 10) + 48);
   Lcd_Chr(2,13, (seconds % 10) + 48);
}

//------------------ Performs project-wide init
void Init_Main() {
  Soft_I2C_Init();           // Initialize Soft I2C communication
  Lcd_Init();                // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
  Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn cursor off

  Lcd_Out(1,1,"Date:");      // Prepare and output static text on LCD
  Lcd_Chr(1,8,':');
  Lcd_Chr(1,11,':');
  Lcd_Out(2,1,"Time:");
  Lcd_Chr(2,8,':');
  Lcd_Chr(2,11,':');
  Lcd_Out(1,12,"201");

}

//----------------- Main procedure
void main() {

  Delay_ms(100);

  Init_Main();               // Perform initialization

  while (1) {                // Endless loop
    Read_Time();             // Read time from RTC(PCF8583)
    Transform_Time();        // Format date and time
    Display_Time();          // Prepare and display on LCD

    Delay_ms(1000);          // Wait 1 second
  }
}