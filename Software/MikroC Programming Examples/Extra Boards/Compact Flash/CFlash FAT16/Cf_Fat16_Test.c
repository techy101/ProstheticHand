/*
 * Project name:
     Cf_Fat16_Test (Demonstration of usage of Cf_Fat16 library)
 * Copyright:
     (c) Mikroelektronika, 2012.
 * Revision History:
     20111224:
       - initial release;
 * Description:
     This project consists of several blocks that demonstrate various aspects of
     usage of the Cf_Fat16 library. These are:
     - Creation of new file and writing down to it;
     - Opening existing file and re-writing it (writing from start-of-file);
     - Opening existing file and appending data to it (writing from end-of-file);
     - Opening a file and reading data from it (sending it to USART terminal);
     - Creating and modifying several files at once;
     - Reading file contents;
     - Deleting file(s);
     - Creating the swap file (see Help for details);
 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf
     Dev.Board:       EasyMx PRO v7 for STM32(R) ARM(R)
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    mE ac:C_Flash Board on PORTD/H (high byte = Control) and
                                             PORTD/L (low byte = Data)
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - Make sure that CF card is properly formatted (to FAT16 or just FAT)
       before testing it on this example.
     - Connect the USB cable and turn on USB UARTA switches at SW12. (board specific).
     - This example expects CF card to be inserted before reset, otherwise,
       the FAT_ERROR message is displayed.
     - For some CF cards external power supply may be required.
 */

// set compact flash pinout
unsigned long Cf_Data_Port_Input  at GPIOD_IDR;
unsigned long Cf_Data_Port_Output at GPIOD_ODR;

sbit CF_RDY at GPIOD_IDR.B15;
sbit CF_WE  at GPIOD_ODR.B14;
sbit CF_OE  at GPIOD_ODR.B13;
sbit CF_CD1 at GPIOD_IDR.B12;
sbit CF_CE1 at GPIOD_ODR.B11;
sbit CF_A2  at GPIOD_ODR.B10;
sbit CF_A1  at GPIOD_ODR.B9;
sbit CF_A0  at GPIOD_ODR.B8;
// end of cf pinout

const LINE_LEN = 39;
char err_txt[20]             = "FAT16 not found";
char file_contents[LINE_LEN] = "XX CF FAT16 library by Anton Rieckert\n";
char           filename[14]  = "MIKRO00x.TXT";          // File names
unsigned short loop, loop2;
unsigned long  i, size;
char           Buffer[512];

// UART1 write text and new line (carriage return + line feed)
void UART1_Write_Line(char *uart_text) {
  UART1_Write_Text(uart_text);
  UART1_Write(13);
  UART1_Write(10);
}

// Creates new file and writes some data to it
void M_Create_New_File() {
  filename[7] = 'A';
  Cf_Fat_Set_File_Date(2005,6,21,10,35,0);             // Set file date & time info
  Cf_Fat_Assign(&filename, 0xA0);                      // Find existing file or create a new one
  Cf_Fat_Rewrite();                                    // To clear file and start with new data
  for(loop = 1; loop <= 99; loop++) {
    UART1_Write('.');
    file_contents[0] = loop / 10 + 48;
    file_contents[1] = loop % 10 + 48;
    Cf_Fat_Write(file_contents, LINE_LEN-1);           // write data to the assigned file
  }
}

// Creates many new files and writes data to them
void M_Create_Multiple_Files() {
  for(loop2 = 'B'; loop2 <= 'Z'; loop2++) {
    UART1_Write(loop2);                                // signal the progress
    filename[7] = loop2;                               // set filename
    Cf_Fat_Set_File_Date(2005,6,21,10,35,0);           // Set file date & time info
    Cf_Fat_Assign(&filename, 0xA0);                    // find existing file or create a new one
    Cf_Fat_Rewrite();                                  // To clear file and start with new data
    for(loop = 1; loop <= 44; loop++) {
      file_contents[0] = loop / 10 + 48;
      file_contents[1] = loop % 10 + 48;
      Cf_Fat_Write(file_contents, LINE_LEN-1);         // write data to the assigned file
    }
  }
}

// Opens an existing file and rewrites it
void M_Open_File_Rewrite() {
  filename[7] = 'C';
  Cf_Fat_Assign(&filename, 0);
  Cf_Fat_Rewrite();
  for(loop = 1; loop <= 55; loop++) {
    file_contents[0] = loop / 10 + 48;
    file_contents[1] = loop % 10 + 48;
    Cf_Fat_Write(file_contents, LINE_LEN-1);           // write data to the assigned file
  }
}

// Opens an existing file and appends data to it
//               (and alters the date/time stamp)
void M_Open_File_Append() {
   filename[7] = 'B';
   Cf_Fat_Assign(&filename, 0);
   Cf_Fat_Set_File_Date(2009, 1, 23, 17, 22, 0);
   Cf_Fat_Append();                                    // Prepare file for append
   Cf_Fat_Write(" for mikroElektronika 2009\n", 27);   // Write data to assigned file
}

// Opens an existing file, reads data from it and puts it to UART
void M_Open_File_Read() {
  char character;

  filename[7] = 'B';
  Cf_Fat_Assign(&filename, 0);
  Cf_Fat_Reset(&size);             // To read file, procedure returns size of file
  for (i = 1; i <= size; i++) {
    Cf_Fat_Read(&character);
    UART1_Write(character);        // Write data to UART
  }
}

// Deletes a file. If file doesn't exist, it will first be created
// and then deleted.
void M_Delete_File() {
  filename[7] = 'F';
  Cf_Fat_Assign(filename, 0);
  Cf_Fat_Delete();
}

// Tests whether file exists, and if so sends its creation date
// and file size via UART
void M_Test_File_Exist() {
  unsigned long  fsize;
  unsigned int   year;
  unsigned short month, day, hour, minute;
  unsigned char  outstr[12];

  filename[7] = 'B';       //uncomment this line to search for file that DOES exists
//  filename[7] = 'F';       //uncomment this line to search for file that DOES NOT exist
  if (Cf_Fat_Assign(filename, 0)) {
    //--- file has been found - get its date
    Cf_Fat_Get_File_Date(&year, &month, &day, &hour, &minute);
    UART1_Write_Text(" created: ");
    WordToStr(year, outstr);
    UART1_Write_Text(outstr);
    ByteToStr(month, outstr);
    UART1_Write_Text(outstr);
    WordToStr(day, outstr);
    UART1_Write_Text(outstr);
    WordToStr(hour, outstr);
    UART1_Write_Text(outstr);
    WordToStr(minute, outstr);
    UART1_Write_Text(outstr);

    //--- file has been found - get its modified date
    Cf_Fat_Get_File_Date_Modified(&year, &month, &day, &hour, &minute);
    UART1_Write_Text(" modified: ");
    WordToStr(year, outstr);
    UART1_Write_Text(outstr);
    ByteToStr(month, outstr);
    UART1_Write_Text(outstr);
    WordToStr(day, outstr);
    UART1_Write_Text(outstr);
    WordToStr(hour, outstr);
    UART1_Write_Text(outstr);
    WordToStr(minute, outstr);
    UART1_Write_Text(outstr);

    //--- get file size
    fsize = Cf_Fat_Get_File_Size();
    LongToStr((signed long)fsize, outstr);
    UART1_Write_Line(outstr);
  }
  else {
    //--- file was not found - signal it
    UART1_Write(0x55);
    Delay_ms(1000);
    UART1_Write(0x55);
  }
}


// Tries to create a swap file, whose size will be at least 100
// sectors (see Help for details)
void M_Create_Swap_File() {
  unsigned int i;

  for(i=0; i<512; i++)
    Buffer[i] = i;

  size = Cf_Fat_Get_Swap_File(5000, "mikroE.txt", 0x20);   // see help on this function for details

  if (size) {
    LongToStr((signed long)size, err_txt);
    UART1_Write_Line(err_txt);

    for(i=0; i<5000; i++) {
      Cf_Write_Sector(size++, Buffer);
      UART1_Write('.');
    }
  }
}

// Main. Uncomment the function(s) to test the desired operation(s)
void main() {
  #define COMPLETE_EXAMPLE            // comment this line to make simpler/smaller example

  // Initialize UART1 module
  UART1_Init(56000);
  Delay_ms(10);

  UART1_Write_Line("MCU-Started");    // MCU present report

  // use fat16 quick format instead of init routine if a formatting is needed
  // if (Cf_Fat_QuickFormat("DEV0") == 0) {
  if (Cf_Fat_Init() == 0) {
    Delay_ms(2000);                   // wait for a while until the card is stabilized
                                      //   period depends on used CF card
    //--- Test start
    UART1_Write_Line("Test Start.");
    //--- Test routines. Uncomment them one-by-one to test certain features
    M_Create_New_File();
    #ifdef COMPLETE_EXAMPLE
      M_Create_Multiple_Files();
      M_Open_File_Rewrite();
      M_Open_File_Append();
      M_Open_File_Read();
      M_Delete_File();
      M_Test_File_Exist();
      M_Create_Swap_File();
    #endif
    UART1_Write_Line("Test End.");
  }
  else {
    UART1_Write_Line(err_txt); // Note: Cf_Fat_Init tries to initialize a card more than once.
                               //       If card is not present, initialization may last longer (depending on clock speed)
  }
}