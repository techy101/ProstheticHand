/*
 * Project name:
     Vectors (Vectors library test example)
 * Copyright:
     (c) MikroElektronika, 2013.
 * Description:
     This is a simple demonstration on Vector library functions.
     The examples should be self-explanatory, for more information
     please take a look at mikroC's Help.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/reference_manual/CD00171190.pdf
     dev.board:       EasyMx v7 for STM32 ® ARM ®
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - None.
*/

int Q15_1[4] = {0xC000, 0x2000, 0xF000, 0x0800};
//                -0.5;   0.25; -0.125; 0.0625;
int Q15_2[4] = {0x999A, 0x3333, 0xE666, 0x0CCD};
//             ~(-0.8);   ~0.4; ~(-0.2);  ~0.1;

long Q31_1[4] = {0xC0000000, 0x20000000, 0xF0000000, 0x08000000};
//                     -0.5;       0.25;     -0.125;     0.0625;
long Q31_2[4] = {0x999A0000, 0x33330000, 0xE6660000, 0x0CCD0000};
//                  ~(-0.8);       ~0.4;    ~(-0.2);       ~0.1;

int  Q15_Out[7], i, N;
long Q31_Out[7], l;
unsigned scale, index;

void main() {
  N = 4;
  Vector_Abs16(Q15_Out, Q15_1, N);
  // Q15_Out = {0x4000, 0x2000, 0x1000, 0x0800}

  Vector_Add16(Q15_Out, Q15_1, Q15_2, N);
  // Q15_Out = {0x599A, 0x5333, 0xD666, 0x14CD}
  // Q15_Out[0] = 0x5333 -> overflow

  Vector_AddC32(Q31_Out, Q31_1, 0xC0000000, N);
  // Q31_Out = {0x80000000, 0xE0000000, 0xB0000000, 0xC8000000}

  scale = 2;
  l = Vector_Dotp32(Q31_1, Q31_2, N, scale);
  // l = 1/(2^scale) * sum_k(Q31_1[k]*Q31_2[k]) = 0x10FFF400 <- 0.1328125

  Vector_Mul16(Q15_Out, Q15_1, Q15_2, N);
  // Q15_Out = {0x3333, 0x0CCC, 0x0333, 0x00CC}

  Vector_Sub16(Q15_Out, Q15_1, Q15_2, N);
  // Q15_Out = {0x2666, 0xECCD, 0x099A, 0xFB33}

  scale = 3;
  i = Vector_Sum_Squares16(Q15_1, N, scale);
  // i = 1/(2^scale)*sum_K(Q15_1[k]^2) = 0x0550 <- 0.0415039

  Vector_Set16(Q15_Out, N, 0xA0A0);
  // Q15_Out = {0xA0A0, 0xA0A0, 0xA0A0, 0xA0A0}

  i = Vector_Min16(Q15_1, N, &index);
  // i = 0xC000; index = 0;

  l = Vector_Max32(Q31_1, N, &index);
  // l = 0x20000000; index = 1;

  Vector_Negate16(Q15_Out, Q15_1, N);
  // Q15_Out = {0x4000, 0xE000, 0x1000, 0xF800}

  Vector_Correlate32(Q31_Out, Q31_1, 3, Q31_2, 2);
  // Q31_Out = {0x0CCCC000, 0xE0002000, Ox3FFFC000, 0xE6668000}


  Vector_Convolve16(Q15_Out, Q15_1, 4, Q15_2, 3);
  // Q15_Out = {0x3333, 0xCCCD, 0x2666, 0xECCC, 0x0666, 0xFE66}

}