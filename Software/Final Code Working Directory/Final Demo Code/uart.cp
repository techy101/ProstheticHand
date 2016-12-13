#line 1 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/uart.c"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/uart.h"
#line 1 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/defines.h"
#line 32 "c:/handgitrepo/prosthetichand/software/final code working directory/final demo code/uart.h"
void init_UART();
#line 37 "C:/HandGitRepo/ProstheticHand/Software/Final Code Working Directory/Final Demo Code/uart.c"
void init_UART() {

 UART1_Init( 115200 );
 Delay_ms(200);
 UART_Write_Text("\rUART Init Complete\r\n");


 UART2_Init_Advanced( 115200 , _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PD56);
 Delay_ms(100);
 UART2_Write_Text("Bluetooth UART Started\r\n");
}
