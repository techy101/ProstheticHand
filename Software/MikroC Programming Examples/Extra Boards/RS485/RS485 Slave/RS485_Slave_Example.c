/*
 * Project name:
     RS485_Slave_Example (RS485 Library demo - Slave side)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111224:
       - initial release;
* Description:
     This is a simple demonstration on how to use the mikroC's RS485 library.
     It is being used in pair with the RS485_Master_Example project. Slave (this
     machine) initializes itself (on address 160) and waits to receive data from
     the master. Then it increments the first byte of received data and sends it
     back to the master. The data received is shown on PORTD, Error on receive
     and number of consecutive unsuccessful retries on PORTC.
     Several situations are shown here:
       - RS485 Slave Init sequence;
       - Data sending slave-to-master;
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

char dat[9];      // buffer for receving/sending messages
char i;

sbit  RS485_rxtx_pin  at GPIOA_ODR.B6;  // set transcieve pin

// Interrupt routine
void interrupt() iv IVT_INT_USART1 ics ICS_AUTO {
  RS485Slave_Receive(dat);
}

void main() {
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_ALL);
  GPIOC_ODR = 0;

  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
  GPIOD_ODR = 0;

  UART1_Init(19200);                // initialize UART1 module
  Delay_ms(100);
  
  USART1_CR1bits.RXNEIE  = 1;        // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART1);   // enable interrupt vector

  RS485Slave_Init(160);             // Intialize MCU as slave, address 160

  dat[0] = 0xAA;
  dat[1] = 0xF0;
  dat[2] = 0x0F;
  dat[4] = 0;                       // ensure that message received flag is 0
  dat[5] = 0;                       // ensure that error flag is 0
  dat[6] = 0;

  while (1) {
    if (dat[5])  {                  // if an error detected, signal it by
      GPIOC_ODR = 0xAA;             //   setting PORTC to 0xAA
      dat[5] = 0;
    }
    if (dat[4]) {                   // upon completed valid message receive
      dat[4] = 0;                   //   data[4] is set to 0xFF
      for (i = 1; i <= dat[3];i++){
        GPIOD_ODR = dat[i-1];
      }
      dat[0] = dat[0]+1;            // increment received dat[0]
      Delay_ms(1);
      RS485Slave_Send(dat,1);       //   and send it back to master
    }
  }
}