/*
 * Project name:
     PS2_Example (Demonstration on using PS/2 keyboard library)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111224:
       - initial release;
 * Description:
     In this example, key(s) pressed on the PS/2 keyboard are read and transferred
     to PC through serial port connection. Various basic keyboard activities are
     tested: "normal" keys, keys with <Shift> pressed, keys with <Caps Lock>
     pressed, numerical keypad ON/OFF and keys. The result is visible on PC, on
     USART Terminal tool.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
                      ac:EasyPS2
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Some keyboards with various multimedia attachments on them 
       tend to "choke" the communication by constantly sending
       requests on various multimedia objects status (volume, mouse pos. etc.).
       This may slow down the communication pace with the MCU.
     - Diodes off (SW15.4) and pull-ups on PS2 lines may be required.
     - Turn ON USB UART1 switches at SW12. (board specific).
 */


unsigned short keydata, special, down;
 
sbit PS2_Data_Input            at GPIOD_IDR.B0;
sbit PS2_Clock_Input           at GPIOD_IDR.B1;
sbit PS2_Clock_Output          at GPIOD_ODR.B1;



void main() {
  UART1_Init(56000);                                  // Initialize UART module at 56000 bps
  GPIO_Config(&GPIOE_BASE,0xff00,_GPIO_CFG_DIGITAL_OUTPUT);
  Ps2_Config();                                       // Init PS/2 Keyboard
  Delay_ms(100);                                      // Wait for keyboard to finish
  UART1_Write_Text("Ready");
  UART1_Write(10);                                    // Line Feed
  UART1_Write(13);                                    // Carriage return

  do {
    if (Ps2_Key_Read(&keydata, &special, &down)) {
      if (down && (keydata == 16)) {                  // Backspace
         UART1_Write(0x08);
      }
      else if (down && (keydata == 13)) {             // Enter
        UART1_Write('\r');                            // send carriage return to usart terminal
        //UART0_Write('\n');                          // uncomment this line if usart terminal also expects line feed
                                                      // for new line transition
      }
      else if (down && !special && keydata) {
        UART1_Write(keydata);                         // Send key to usart terminal
      }
    }
    Delay_ms(1);                                      // Debounce period
  } while (1);
}