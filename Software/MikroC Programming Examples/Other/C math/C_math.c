/*
 * Project name:       
     C_math (Demonstration of using C Math Library)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110105:
       - initial release;
 * Description:
     This program demonstrates usage of standard C math library routines. 
     Compile and run the code through software simulator.          
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
     - After compiling start Debugger (F9 key)
     - Add "doub" variable in watch window, change type to float
         and watch the changing values as you go through the code (F8 key).
*/
const float PI = 3.14159265358979;
float doub;

void main(){

  doub = fabs(-1.3);        // 1.300000E+000
  doub = fabs(-1.3e-5);     // 1.300000E-005
  doub = fabs(1241.3e+15);  // 1.241300E+018

  doub = acos(0.);          // 1.570796E+000
  doub = acos(0.5);         // 1.047198E+000
  doub = acos(1.0);         // 0.000000E+000
  doub = acos(-0.5);        // 2.094395E+000

  doub = asin(0.);          // 0.000000E+000
  doub = asin(0.5);         // 5.235987E-001
  doub = asin(1.0);         // 1.570796E+000
  doub = asin(-0.5);        //-5.235987E-001

  doub = atan(0.);          // 0.000000E+000
  doub = atan(0.5);         // 4.636476E-001
  doub = atan(1.0);         // 7.853981E-001
  doub = atan(-1.0);        //-7.853981E-001

  doub = atan2(5., 0.);     // 0.000000E+000
  doub = atan2(2., 1.);     // 4.636476E-001
  doub = atan2(10.,10.);    // 7.853981E-001
  doub = atan2(10., -10.);  //-7.853981E-001

  doub = ceil(0.5);         // 1.000000E+000
  doub = ceil(-0.5);        // 0.000000E+000
  doub = ceil(15.258);      // 1.600000E+001
  doub = ceil(-15.258);     //-1.500000E+001

  doub = floor(0.5);        // 0.000000E+000
  doub = floor(-0.5);       //-1.000000E+000
  doub = floor(15.258);     // 1.500000E+001
  doub = floor(-15.258);    //-1.600000E+001

  doub = cos(0.);           // 1.000000E+000
  doub = cos(PI/2.);        // 0.000000E+000
  doub = cos(PI/3.);        // 5.000001E-001
  doub = cos(-PI/3.);       // 5.000000E-001

  doub = cosh(0.);          // 1.000000E+000
  doub = cosh(PI/2.);       // 2.509178E+000
  doub = cosh(PI/3.);       // 1.600287E+000
  doub = cosh(-PI/3.);      // 1.600287E+000

  doub = exp(10.25);        // 2.828255E+004
  doub = exp(0.5);          // 1.648721E+000
  doub = exp(-0.5);         // 6.065307E-001

  doub = log10(100.);       // 2.000000E+000
  doub = log10(500.);       // 2.698970E+000
  doub = log10(-10.);       // 0.000000E+000

  doub = pow(10.,5.);       // 1.000001E+005
  doub = pow(10.,-0.5);     // 3.162278E-001
  doub = sin(0.);           // 0.000000E+000
  doub = sin(PI/2.);        // 1.000000E+000
  doub = sin(PI/6.);        // 5.000000E-001
  doub = sin(-PI/6.);       //-5.000000E-001
                                
  doub = sinh(0.);          // 0.000000E+000
  doub = sinh(PI/2.);       // 2.301299E+000
  doub = sinh(PI/6.);       // 5.478535E-001
  doub = sinh(-PI/6.);      //-5.478535E-001

  doub = sqrt(10000.);      // 1.000000E+002
  doub = sqrt(500.);        // 2.236068E+001
  doub = sqrt(-100.);       // 0.000000E+000

  doub = tan(-PI/2.);       // -infinite
  doub = tan(-PI/3.);       //-1.732051E+000
  doub = tan(PI/3.);        // 1.732051E+000
  doub = tan(0.);           // 0.000000E+000
  doub = tan(PI/4.);        // 1.000000E+000
  doub = tan(-PI/4.);       //-1.000000E+000

  doub = tanh(PI/2.);       // 9.171523E-001
  doub = tanh(0.);          // 0.000000E+000
  doub = tanh(PI/4.);       // 6.557942E-001
  doub = tanh(-PI/4.);      //-6.557942E-001
}