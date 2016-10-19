
// these can be used in place of 0x1 and 0x20 in readEncoderdirection()
#define FNGR_POINTER_ENC_A       0x1        // PIN NUMBER of whichever port this specific signal is assigned to
#define FNGR_POINTER_ENC_B       0x20       // PIN NUMBER of whichever port this specific signal is assigned to
// idea: map all encoder A inputs to pins numbered 0, all encoder B inputs to pins numbered 1, etc.
// then we could just #define FNGR_ENC_A 0x1 and use that to check ANY encoder A
// don't pay too much attention to this it's just me typing out loud

struct GPIOX_t {
   unsigned long addr0;   // used to access the 15 available bits in GPIOA_IDR (15 high are reserved)
                          // could probably actually be unsigned int (size 2 bytes)
};

struct fngr_t {
     char name[10];
     struct GPIOX_t * encoder_chan_a;    // used to reference memory contents in GPIOx
     struct GPIOX_t * encoder_chan_b;    // used to reference memory contents in GPIOx
     unsigned int direction_actual;
};

struct GPIOX_t * GPIOA_IDR_LOC = 0x40020000 + 0x10;    // GPIOA_IDR location in memory

struct fngr_t Finger;

void readEncoderDirection(struct fngr_t * Finger);

void main() {
  GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_ALL);  // enable digital input on all PORTA bits
  
  UART1_init(115200);    // initialize UART
  Delay_ms(200);
  UART1_Write(0x10);
  UART1_Write(0x13);
  UART1_Write_Text("Begin. \n");

  Finger.encoder_chan_a = GPIOA_IDR_LOC;    // set memory reference to GPIOA_IDR
  Finger.encoder_chan_b = GPIOA_IDR_LOC;    //
  
  while(1) {
     readEncoderDirection(&Finger);          // poll for encoder input
  }
}

// essentially practice for passing a Finger into a function
void readEncoderDirection(struct fngr_t * Finger)
{ 
  // maybe:
  // if((Finger->encoder_chan_a->addr0 & 0x1) && (Finger->encoder_chan_b->addr0 & 0x10))
  // direction_actual = ...;
  if(Finger->encoder_chan_a->addr0 & 0x1) {    // check bit 0 of GPIOA_IDR (PA0)
     UART1_Write_Text("Encoder input from A0 received \n");
     Delay_ms(150);            // button debounce
  }

  if(Finger->encoder_chan_b->addr0 & 0x20) {       // check bit 5 of GPIOA_IDR (PA5)
     UART1_Write_Text("Encoder input from A5 received \n");
     Delay_ms(150);       // button debounce
  }
}