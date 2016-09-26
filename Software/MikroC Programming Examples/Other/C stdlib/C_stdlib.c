/*
 * Project name:
     C_Stdlib
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20110105:
       - initial release;
 * Description:
     This program demonstrates usage of standard C stdlib library routines. 
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
     - None.
 */

typedef struct divstruct {
  int quot;
  int rem;
} div_t;

typedef struct ldivstruct {
  long quot;
  long rem;
} ldiv_t;

typedef struct uldivstruct {
  unsigned long quot;
  unsigned long rem;
} uldiv_t;   

int res;
float doub;
long res_l;

div_t dt;
ldiv_t dl;
uldiv_t dul;

void main() {

  res = abs(12);
  res = abs(-12);
  res = abs(32767);
  res = abs(-32767);

  doub = atof("0.");
  doub = atof("-1.23");
  doub = atof("23.45e6");
  doub = atof("3E+10");
  doub = atof(".09E34");

  res = atoi("1");
  res = atoi("-1");
  res = atoi("1222");
  res = atoi("32000");
  res = atoi("-32560");

  res_l = atol("1");
  res_l = atol("-1");
  res_l = atol("1222");
  res_l = atol("32000");
  res_l = atol("-32560");

  res_l = atol("-2147483647");
  res_l = atol(" 2147483647");

  dt = div(1234,100);
  dl = ldiv(-123456, 1000);
  dul = uldiv(123456,1000);

  res_l = labs(-2147483647);
  res_l = labs(2147483647);
  res = min(123,67);
  res = max(12333,67);
  res = xtoi("-1F");
  res = xtoi("1FF");
  srand(9);
  while(1)
   res =  rand();
}