// Structure passing and pointer math demo
// Matthew Varas
// 10/14/2016

// This program demonstrates:
//    * Declaring a structure and its members
//    * Instantiating two structure instances
//    * Writing functions that accept a structure instance as an argument
//    * Passing structure instances into functions
//    * Performing logical tests on members (Specifically strings/character arrays)
//    * Modifing string/character array members
//    * Performing mathematical operations on instance members




#define UART_BAUD_RATE                                  115200                  // Baud rate for UART's
#define STR_MAX                                         50                     // Maximum char array size for UART strings


//**********  Global Variables  **********
char testOutput[STR_MAX];
char aInText[STR_MAX];
char bInText[STR_MAX];
char cInText[STR_MAX];



//**********  Functoin to Initialize serial communications (Wired UART)  **********
void init_serial_comm() {

  UART1_Init(UART_BAUD_RATE);                                                // Configure UART 1
  Delay_ms(200);                                                             // Wait for UART to stabilize
}



//**********  Define the finger type structure  **********
struct finger {
  char instance_name[STR_MAX];
  unsigned int a;
  unsigned int b;
  unsigned int c;
};

//**********  Instantiate two finger type structures  **********
struct finger testFinger1;
struct finger testFinger2;



//**********  Function to manipulate structure members  **********
void do_math(struct finger *fngr) {

  //Test for finger name and manipulate it
  if (strcmp(fngr->instance_name, "Finger 1") == 0) {
    strcpy(fngr->instance_name, "Finger 1 Altered");
  }

  if (strcmp(fngr->instance_name, "Finger 2") == 0) {
    strcpy(fngr->instance_name, "Finger 2 Altered");
  }

  //Manipulate values
  fngr->a += fngr->a;             //Add a to a
  fngr->b = fngr->a + fngr->b;    //Add a to b
  fngr->c = 25;                   //Change c to 25
}



//**********  Function to print structure members to terminal  **********
void print_values(struct finger *fngr) {

  //Print instance name to terminal
  UART1_Write_Text("Name = ");
  UART1_Write_Text(fngr->instance_name);
  UART1_Write_Text("\n\r");

  //Print values to terminal
  IntToStr(fngr->a, aInText);
  UART1_Write_Text("a = ");
  UART1_Write_Text(aInText);
  UART1_Write_Text("\n\r");

  //Print values to terminal
  IntToStr(fngr->b, bInText);
  UART1_Write_Text("b = ");
  UART1_Write_Text(bInText);
  UART1_Write_Text("\n\r");

  //Print values to terminal
  IntToStr(fngr->c, cInText);
  UART1_Write_Text("c = ");
  UART1_Write_Text(cInText);
  UART1_Write_Text("\n\n\n\r");
}


// Main Program
void main() {

  // Initializations
  init_serial_comm();                                                        // Initialize UART1 (Wired)

  //UART Verification
  strncpy(testOutput, "\rProgram Has Started\n\n\r", STR_MAX);
  UART1_Write_Text(testOutput);


  //Set Finger 1 member values
  strcpy(testFinger1.instance_name, "Finger 1");
  testFinger1.a = 5;
  testFinger1.b = 5;
  testFinger1.c = 5;

  //Set Finger 2 member values
  strcpy(testFinger2.instance_name, "Finger 2");
  testFinger2.a = 10;
  testFinger2.b = 10;
  testFinger2.c = 10;


  //Print out original values
  UART1_Write_Text("Finger 1 original values: \n\r");
  print_values(&testFinger1);
  UART1_Write_Text("Finger 2 original Values: \n\r");
  print_values(&testFinger2);

  //Manipulate structure values
  do_math(&testFinger1);
  do_math(&testFInger2);

  //Print out manipulated values
  UART1_Write_Text("Finger 1 changed values: \n\r");
  print_values(&testFinger1);
  UART1_Write_Text("Finger 2 changed Values: \n\r");
  print_values(&testFinger2);
}