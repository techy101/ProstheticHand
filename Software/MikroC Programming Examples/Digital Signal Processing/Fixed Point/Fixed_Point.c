/*
 * Project name:
     Fixed_Point (Fixed point library test example)
 * Copyright:
     (c) MikroElektronika, 2012.
 * Description:
     This is a simple demonstration on Q15 and Q31 library functions.
     The examples should be self-explanatory, for more information
     please take a look at mikroC's Help.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     dev.board:       EasyMx v7 for STM32 ® ARM ®
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - None.
*/

int  Q15_1, Q15_2;
long Q31_1, Q31_2;

int   i;
long  l;
unsigned status;
float f;
char  stringQ15[19], stringQ31[35];

void main() {

  // Q15_Ftoi, Q31_Ftoi.........................................................
  f = 0.5;
  Q15_1 = Q15_Ftoi(f);                      // Q15_1 = 0x4000;
  Q31_1 = Q31_Ftoi(f);                      // Q31_1 = 0x40000000;
  f = 1.5;
  Q15_1 = Q15_Ftoi(f);                      // Q15_1 = 0x7FFF;
  Q31_1 = Q31_Ftoi(f);                      // Q31_1 = 0x7FFFFFF;
  f = -2.5;
  Q15_1 = Q15_Ftoi(f);                      // Q15_1 = 0x8000;
  Q31_1 = Q31_Ftoi(f);                      // Q31_1 = 0x80000000;

  // Q15_Itof, Q31_Itof.........................................................
  Q15_1 = 0x1000;
  f = Q15_Itof(Q15_1);                      // f = 0.125;
  Q31_1 = 0x08000000;
  f = Q31_Itof(Q31_1);                      // f = 0.0625;

  // Q15_Itoa, Q31_Itoa.........................................................
  Q15_1 = 0xFFFF;
  Q31_1 = 0x00000001;
  Q15_Itoa(Q15_1, stringQ15);                   // stgingQ15 = "-0.000030517578125"
  Q31_Itoa(Q31_1, stringQ31);                   // stringQ31 = " 0.0000000004656612873077392578125"

  // Q15_Atoi, Q31_Atoi.........................................................
  status = Q15_Atoi("+0.25", &Q15_1);                // Q15_1 = 0x2000; status = 0;
  status = Q31_Atoi("0.00001525878906", &Q31_1);     // Q31_1 = 0x00007FFF; status = 0;
  status = Q15_Atoi("        +0.7", &Q15_1);         // Q15_1 = 0x5999; status = 0;
  status = Q31_Atoi("+1.25", &Q31_1);                // status = 1;
  status = Q15_Atoi("mikroe.25", &Q15_1);            // status = 2;

  // Q15_Abs, Q31_Abs...........................................................
  Q15_1 = Q15_Abs(0x8000);                      // Q15_1 = 0x7FFF;
  Q15_1 = Q15_Abs(0xE000);                      // Q15_1 = 0X2000;
  Q31_1 = Q31_Abs(0x12345678);                  // Q31_1 = 0x12345678;
  Q31_1 = Q31_Abs(0xFEDCBA98);                  // Q31_1 = 0x01234568;

  // Q15_Add, Q31_Add...........................................................
  status = Q15_Add(0x2000, 0x4000, &Q15_1);          // Q15_1 = 0x6000; status = 0;
  status = Q15_Add(0x7000, 0x4000, &Q15_1);          // Q15_1 = 0x7FFF; status = 1;
  status = Q31_Add(0xE0000000, 0xC0000000, &Q31_1);  // Q31_1 = 0xA0000000; status = 0;
  status = Q31_Add(0xA0000000, 0xC0000000, &Q31_1);  // Q31_1 = 0x80000000; status = 1;

  // Q15_Sub, Q31_Sub...........................................................
  status = Q15_Sub(0x2000, 0x4000, &Q15_1);          // Q15_1 = 0xE000; status = 0;
  status = Q15_Sub(0x7000, 0xC000, &Q15_1);          // Q15_1 = 0x7FFF; status = 1;
  status = Q31_Sub(0xE0000000, 0xC0000000, &Q31_1);  // Q31_1 = 0x20000000; status = 0;
  status = Q31_Sub(0xA0000000, 0x40000000, &Q31_1);  // Q31_1 = 0x80000000; status = 1;

  // Q15_Cos, Q31_Cos...........................................................
  Q15_1 = Q15_Ftoi(0.5);
  Q15_2 = Q15_Cos (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = cos(0.5) = 0.877

  Q15_1 = Q15_Ftoi(1);
  Q15_2 = Q15_Cos (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = cos(1) = 0.540

  Q31_1 = Q31_Ftoi(0);
  Q31_2 = Q31_Cos (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = cos(0) = 1

  Q31_1 = Q31_Ftoi(-1);
  Q31_2 = Q31_Cos (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = cos(-1) = 0.540

  // Q15_Sin, Q31_Sin...........................................................
  Q15_1 = Q15_Ftoi(0.5);
  Q15_2 = Q15_Sin (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = sin(0.5) = 0.479

  Q15_1 = Q15_Ftoi(1);
  Q15_2 = Q15_Sin (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = sin(1) = 0.841

  Q31_1 = Q31_Ftoi(0);
  Q31_2 = Q31_Sin (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = sin(0) = 0

  Q31_1 = Q31_Ftoi(-1);
  Q31_2 = Q31_Sin (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = sin(-1) = -0.841

  // Q15_Tan, Q31_Tan...........................................................
  Q15_1 =Q15_Ftoi(0.5);
  Q15_2 = Q15_Tan (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = tan(0.5) = 0.546

  Q15_1 = Q15_Ftoi(0.78546);
  Q15_2 = Q15_Tan (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = tan(0.78546) = 0.999

  Q31_1 = Q31_Ftoi(0);
  Q31_2 = Q31_Tan (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = tan(0) = 0

  Q31_1 = Q31_Ftoi(-0.78530);
  Q31_2 = Q31_Tan (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = tan(-0.78546) = -0.999

  // Q15_Asin, Q31_Asin.........................................................
  Q15_1 = Q15_Ftoi(0.5);
  Q15_2 = Q15_Asin (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = asin(0.5) = 0.523

  Q15_1 = Q15_Ftoi(0.8416137);
  Q15_2 = Q15_Asin (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = asin(0.8416137) = 0.999

  Q31_1 = Q31_Ftoi(0);
  Q31_2 = Q31_Asin (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = asin(0) = 0

  Q31_1 = Q31_Ftoi(-0.841308);
  Q31_2 = Q31_Asin (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = asin(-0.8416137) = -0.999

  // Q15_Acos, Q31_Acos.........................................................
  Q15_1 = Q15_Ftoi(0.9);
  Q15_2 = Q15_Acos (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = acos(0.9) = 0.450

  Q15_1 = Q15_Ftoi(0.8);
  Q15_2 = Q15_Acos (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = acos(0.8) = 0.643

  Q31_1 = Q31_Ftoi(0.6);
  Q31_2 = Q31_Acos (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = acos(0.6) = 0.927

  Q31_1 = Q31_Ftoi(0.5403137);
  Q31_2 = Q31_Acos (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = acos(0.5403137) = 0.999

  // Q15_Atan, Q31_Atan.........................................................
  Q15_1 = Q15_Ftoi(0.5);
  Q15_2 = Q15_Atan (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = atan(0.5) = 0.463

  Q15_1 = Q15_Ftoi(1);
  Q15_2 = Q15_Atan (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = atan(1) = 0.791

  Q31_1 = Q31_Ftoi(0);
  Q31_2 = Q31_Atan (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = atan(0) = 0

  Q31_1 = Q31_Ftoi(-1);
  Q31_2 = Q31_Atan (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = atan(-1) = -0.791

  // Q15_Log, Q31_Log.........................................................
  Q15_1 = Q15_Ftoi(0.5);
  Q15_2 = Q15_Log (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = log(0.5) = -0.301

  Q15_1 = Q15_Ftoi(1);
  Q15_2 = Q15_Log (Q15_1);
  f = Q15_Itof(Q15_2);                          // f = log(1) = 0

  Q31_1 = Q31_Ftoi(0.3);
  Q31_2 = Q31_Log (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = log(0.3) = -0.523

  Q31_1 = Q31_Ftoi(0.1);
  Q31_2 = Q31_Log (Q31_1);
  f = Q31_Itof(Q31_2);                          // f = log(0.1) = -0.999

  //////////////////////////////////////////////////////////////////////////////
}