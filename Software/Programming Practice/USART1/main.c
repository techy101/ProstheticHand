char uart2_rd;
char uart1_rd;


  void USART1_INT() iv IVT_INT_USART1 ics ICS_AUTO {
        if(UART1_Data_ready()) {  // If data is received
          uart1_rd = UART1_Read();   // read the received data
           UART1_Write(uart1_rd);     // and send data via UART
        }
}

  void USART2_INT() iv IVT_INT_USART2 ics ICS_AUTO {
      if (UART2_Data_Ready()) {     // If data is received
         uart2_rd = UART2_Read();     // read the received data
         UART2_Write(uart2_rd);       // and send data via UART
    }
}


void main() {
   // ------------------------------- WIRED CONNECTION -------------------------------- //
  UART1_Init(115200);              // Initialize UART module at 115200 bps
  Delay_ms(100);                  // Wait for UART module to stabilize

  UART1_Write_Text("Start FTDI Wired");
  UART1_Write(13);
  UART1_Write(10);

  // ------------------------------- BLUETOOTH CONNECTION ----------------------------- //
  // Initialize UART module at 1152000 bps
  UART2_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PD56);
  Delay_ms(100);                  // Wait for UART module to stabilize

  UART2_Write_Text("Start Bluetooth");
  UART2_Write(13);
  UART2_Write(10);
  NVIC_IntEnable(IVT_INT_USART1);
  NVIC_IntEnable(IVT_INT_USART2);
  SYSCFGEN_bit = 1;
  SYSCFG_EXTICR1=0b0010001000000000;
  EXTI_IMR = EXTI_IMR | 0b1100;
  EXTI_RTSR =  0b0;
  EXTI_FTSR = EXTI_RTSR | 0b1100;
  
  RXNEIE_USART1_CR1_bit =1;
  RXNEIE_USART2_CR1_bit =1;
  TCIE_bit = 1;
  TXEIE_bit = 1;
  
  while (1) {                     // Endless loop
  

  }
}