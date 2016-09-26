/*
 * Project name:
     Can_Spi_1st (CAN Network demonstration with mikroE's CAN-SPI module)
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20111224:
       - initial release;
 * Description:
     This project is a simple demonstration of using CAN-SPI module; with minor
     adjustments, it should work with any other MCU that has a SPI module.
     This code demonstrates how to use CANSPI library functions and procedures.
     It is used together with the Can_Spi_2nd example (on second MCU), and it can
     be used to test the connection of MCU to the CAN network.
     This node initiates the communication with the Can_2nd node by sending some
     data to its address. The 2nd node responds by sending back the data incre-
     mented by 1. This (1st) node then does the same and sends incremented data
     back to 2nd node, etc.
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    mikroE ac:CAN_SPI module
                      SmartADAPT ac:SmartADAPT Extra Development Board.
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Consult the CAN standard about CAN bus termination resistance.
     - Turn on LEDs on PORTD.
     - CAN SPI module may require 5V power supply
     - Use SmartADAPT board to adjust SPI pinout and/or 
       supply 5V for CAN SPI module if necessary
 */

unsigned char Can_Init_Flags, Can_Send_Flags, Can_Rcv_Flags; // can flags
unsigned char Rx_Data_Len;                                   // received data length in bytes
char RxTx_Data[8];                                           // can rx/tx data buffer
char Msg_Rcvd;                                               // reception flag
const long ID_1st = 12111, ID_2nd = 3;                       // node IDs
long Rx_ID;

// CANSPI module connections
sbit CanSpi_CS            at  GPIOB_ODR.B0;
sbit CanSpi_Rst           at  GPIOB_ODR.B2;
// End CANSPI module connections

void main() {

  // PORTD output for LEDs
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
  GPIOD_ODR = 0;

  Can_Init_Flags = 0;                                         //
  Can_Send_Flags = 0;                                         // clear flags
  Can_Rcv_Flags  = 0;                                         //

  Can_Send_Flags = _CANSPI_TX_PRIORITY_0 &                    // form value to be used
                   _CANSPI_TX_XTD_FRAME &                     // with CANSPIWrite
                   _CANSPI_TX_NO_RTR_FRAME;

  Can_Init_Flags = _CANSPI_CONFIG_SAMPLE_THRICE &             // form value to be used
                   _CANSPI_CONFIG_PHSEG2_PRG_ON &             // with CANSPIInit
                   _CANSPI_CONFIG_XTD_MSG &
                   _CANSPI_CONFIG_DBL_BUFFER_ON &
                   _CANSPI_CONFIG_VALID_XTD_MSG;

  // Initialize SPI1 module
   SPI1_Init_Advanced(_SPI_FPCLK_DIV8, _SPI_MASTER  | _SPI_8_BIT |
                     _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                     _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI1_PB345);

  GPIO_Alternate_Function_Enable(&_GPIO_MODULE_SWJ_JTAGDISABLE);


  CANSPIInitialize(1,3,3,3,1,Can_Init_Flags);                            // initialize external CANSPI module
  CANSPISetOperationMode(_CANSPI_MODE_CONFIG,0xFF);                      // set CONFIGURATION mode
  CANSPISetMask(_CANSPI_MASK_B1,-1,_CANSPI_CONFIG_XTD_MSG);              // set all mask1 bits to ones
  CANSPISetMask(_CANSPI_MASK_B2,-1,_CANSPI_CONFIG_XTD_MSG);              // set all mask2 bits to ones
  CANSPISetFilter(_CANSPI_FILTER_B2_F4,ID_2nd,_CANSPI_CONFIG_XTD_MSG);   // set id of filter B2_F4 to 2nd node ID

  CANSPISetOperationMode(_CANSPI_MODE_NORMAL,0xFF);                      // set NORMAL mode

  // Set initial data to be sent
  RxTx_Data[0] = 9;

  CANSPIWrite(ID_1st, RxTx_Data, 1, Can_Send_Flags);                            // send initial message

  while(1) {                                                                    // endless loop
    Msg_Rcvd = CANSPIRead(&Rx_ID , RxTx_Data , &Rx_Data_Len, &Can_Rcv_Flags);   // receive message
    if ((Rx_ID == ID_2nd) && Msg_Rcvd) {                                        // if message received check id
      GPIOD_ODR = RxTx_Data[0];                                                 // id correct, output data at PORTD
      RxTx_Data[0]++ ;                                                          // increment received data
      Delay_ms(10);
      CANSPIWrite(ID_1st, RxTx_Data, 1, Can_Send_Flags);                        // send incremented data back
    }
  }
}