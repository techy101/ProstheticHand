#line 1 "C:/Users/SCSUS/Dropbox/Senior Design Team Folder/Software/Programming Practice/USART1/main.c"
char uart2_rd;
char uart1_rd;


 void USART1_INT() iv IVT_INT_USART1 ics ICS_AUTO {
 if(UART1_Data_ready()) {
 uart1_rd = UART1_Read();
 UART1_Write(uart1_rd);
 }
}

 void USART2_INT() iv IVT_INT_USART2 ics ICS_AUTO {
 if (UART2_Data_Ready()) {
 uart2_rd = UART2_Read();
 UART2_Write(uart2_rd);
 }
}




void main() {

 UART1_Init(115200);
 Delay_ms(100);

 UART1_Write_Text("Start FTDI Wired");
 UART1_Write(13);
 UART1_Write(10);



 UART2_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PD56);
 Delay_ms(100);

 UART2_Write_Text("Start Bluetooth");
 UART2_Write(13);
 UART2_Write(10);
 NVIC_IntEnable(IVT_INT_USART1);
 NVIC_IntEnable(IVT_INT_USART2);
 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR1=0b0010001000000000;
 EXTI_IMR = EXTI_IMR | 0b1100;
 EXTI_RTSR = 0b0;
 EXTI_FTSR = EXTI_RTSR | 0b1100;

 RXNEIE_USART1_CR1_bit =1;
 RXNEIE_USART2_CR1_bit =1;
 TCIE_bit = 1;
 TXEIE_bit = 1;

 while (1) {


}
}
