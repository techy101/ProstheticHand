/*
 * Project name:
     Matrix (Matrices library test example)
 * Copyright:
     (c) MikroElektronika, 2013.
 * Description:
     This is a simple demonstration on Matrices library functions.
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

int Q15_1[3][3] = { {0x1000, 0x2000, 0x3000},
                    {0x4000, 0x5000, 0x6000},
                    {0x7000, 0x8000, 0x9000} };

int Q15_2[3][3] = { {0x9000, 0x8000, 0x7000},
                    {0x6000, 0x5000, 0x4000},
                    {0x3000, 0x2000, 0x1000} };

int Q15_Out[3][3];

void main() {
  Matrix_Transpose16(Q15_1, Q15_Out, 3, 3);
  // Q15_Out = ( 0x1000, 0x4000, 0x7000,
  //             0x2000, 0x5000, 0x8000,
  //             0x3000, 0x6000, 0x9000 )

  Matrix_Subtract16(Q15_1, Q15_2, Q15_Out, 3, 3);
  // Q15_Out = ( 0x8000, 0xA000, 0xC000,
  //             0xE000, 0x0000, 0x2000,
  //             0x4000, 0x6000, 0x8000 )
  // Overflow : Q15_Out[0][0], Q15[0][1]...

  Matrix_Add16(Q15_1, Q15_2, Q15_Out, 3, 3);
  // Q15_Out = ( 0xA000, 0xA000, 0xA000,
  //             0xA000, 0xA000, 0xA000,
  //             0xA000, 0xA000, 0xA000 )
  // Overflow : Q15_Out[0][2], Q15[1][0]...

  Matrix_Scale16(0x4000, Q15_1, Q15_Out, 3, 3);
  // Q15_Out = ( 0x0800, 0x1000, 0x1800,
  //             0x2000, 0x2800, 0x3000,
  //             0x3800, 0xC000, 0xC800 )

  Matrix_Multiply16(Q15_1, Q15_2, Q15_Out, 3, 3, 3);
  // Q15_Out = ( 0x1C00, 0x1000, 0x2400,
  //             0x2800, 0x0A00, 0x6C00,  `
  //             0x1400, 0x2400, 0x1400 )
  // Overflow : Q15_Out[2][0], Q15[2][1]

}