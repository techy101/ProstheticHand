/*
 * Project name:

 * Description:
     This code demonstrates how to use Timer 2 and it's interrupt.
     Program toggles LEDs on PORTE/H.

 * NOTES:
     - Turn on PORTE/H LED's at switch SW15
 */

// WAY #1

#define FNGR_POINTER_ENC_A                        GPIOA_IDR.B0           // Pin A0: Pointer finger encoder channel A (Tim2 CH1 input capture)
#define FNGR_POINTER_ENC_B                        GPIOA_IDR.B4           // Pin A4: Pointer finger encoder channel B (Direction only)

struct fngr_t {    // define a finger structure
      int a;
      int b;
};

struct fngr_t FNGR_PNTR;      // declare an instance

bit outa, outb;        // declare two bit variables to try reading IDR bits

void main() {
  GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_4);  // Enable digital input on PORTA bits
  UART1_init(115200);    // initialize UART
  Delay_ms(200);
  UART1_Write_Text("Begin. \n");
  
  FNGR_PNTR.a = FNGR_POINTER_ENC_A;      // assign the struct members
  FNGR_PNTR.b = FNGR_POINTER_ENC_B;
    
  outa = FNGR_POINTER_ENC_A;          // also assign the defined pin names to the bit variables
  outb = FNGR_POINTER_ENC_B;
  
  while(1)
  {
  // try to read pin values from finger struct
  if(FNGR_PNTR.a) //|| outa || GPIOA_IDR.B0)
   {      
          UART1_Write_Text("FNGR_PNTR: encoder A = 1 \n");   // didn't want to bother with print conversions
          Delay_ms(200);   // debounce
   }
  if(FNGR_PNTR.b)// || outb)   
  {
          UART1_Write_Text("FNGR_PNTR: encoder B = 1 \n");
          Delay_ms(200);
   }
  }
}