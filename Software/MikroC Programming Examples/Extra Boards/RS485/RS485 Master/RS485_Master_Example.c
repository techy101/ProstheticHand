/*
 * Project name:
     RS485_Master_Example (RS485 Library demo - Master side)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111224:
       - initial release;
 * Description:
     This is a simple demonstration on how to use the mikroC's RS485 library.
     It is being used in pair with the RS485_Slave_Example project. Master (this
     machine) initiates communication with slave by sending 1 byte of data to
     the slave with designated slave address (160). The slave accepts data,
     increments it and sends it back to the master.
     The data received is shown on PORTD, Error on receive on PORTE.
     Several situations are shown here:
       - RS485 Master Init sequence;
       - Data sending master-to-slave with designated slave address;
       - Data sending master-to-slave with broadcast slave address (50);
       - Handling of unsuccessful master-slave communication (connection reset);
     Also shown here, but not strictly related to RS485 library, is:
       - Function calling from the interrupt routine - which data is to be saved,
         and how.
     For further explanations on RS485 library, please consult the mikroC Help.
 * Test configuration:
     Device:          STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    ac:RS485 on PORTA
                      SmartADAPT Extra Development Board.
                      http://www.mikroe.com/add-on-boards/various/smartadapt/
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Initialize the UART module before performing RS485 init.
     - RS485 module is connected to PORTA, i.e. where the UART module is.
     - Turn on LEDs on PORTD and PORTC switches at SW15. (board specific)
 */

char dat[10];               // buffer for receving/sending messages
char i,j;

sbit  RS485_rxtx_pin  at GPIOA_ODR.B6;  // set transcieve pin

// Interrupt routine
void interrupt() iv IVT_INT_USART1 ics ICS_AUTO {
  RS485Master_Receive(dat);
}

 void main(){
  long cnt = 0;

  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_ALL);
  GPIOC_ODR = 0;

  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
  GPIOD_ODR = 0;

  UART1_Init(19200);               // initialize UART1 module
  Delay_ms(100);
  
  RS485Master_Init();              // initialize MCU as Master

  USART1_CR1bits.RXNEIE = 1;       // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART1);  // enable interrupt vector

  dat[0] = 0xAA;
  dat[1] = 0xF0;
  dat[2] = 0x0F;
  dat[4] = 0;                      // ensure that message received flag is 0
  dat[5] = 0;                      // ensure that error flag is 0
  dat[6] = 0;

  RS485Master_Send(dat, 1, 160);

  while (1) {
                                       // upon completed valid message receiving
                                       //   data[4] is set to 255
    cnt++;
    if (dat[5]) {                      // if an error detected, signal it
      GPIOC_ODR = 0xAA;                //   by setting PORTC to 0xAA
    }
    if (dat[4]) {                      // if message received successfully
      cnt = 0;
      dat[4] = 0;                      // clear message received flag
      j = dat[3];
      for (i = 1; i <= dat[3]; i++) {  // show data on PORTD
        GPIOD_ODR = dat[i-1];
      }                                // increment received dat[0]
      dat[0] = dat[0]+1;               // send back to master
      Delay_ms(1);
      RS485Master_Send(dat,1,160);

    }
    if (cnt > 100000) {
      GPIOC_ODR ++;
      cnt = 0;
      RS485Master_Send(dat,1,160);
      if (GPIOC_ODR > 10)            // if sending failed 10 times
        RS485Master_Send(dat,1,50);    //   send message on broadcast address
    }
  }
}