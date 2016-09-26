/*
 * Project Name:
     Time_Demo (simplified c-like time library)
 * Copyright:
     (c) Mikroelektronika, 2009.
 * Revision History:
     20091106:
       - initial release; Author: Bruno Gavand.
 * Description  :
     Just run it in watch window and watch appropriate variables.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - None.
 */

#include        "__Time.h"

TimeStruct td1, td2;
long epoch;
long diff;

void main() {
  td1.ss = 0;
  td1.mn = 7;
  td1.hh = 17;
  td1.md = 23;
  td1.mo = 5;
  td1.yy = 2006;

  // What is the epoch of the date in ts ?
  epoch = Time_dateToEpoch(&td1);       //  1148404020


  // What date is epoch 1234567890 ?
  epoch = 1234567890;
  Time_epochToDate(epoch, &td2);       //  {30, 31, 23, 13, 4, 2, 2009}

  // How much seconds between this two dates ?
  diff = Time_dateDiff(&td1, &td2);    //  86163870
}