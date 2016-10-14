
struct GPIOX_t {
   unsigned long addr0;   // used to access button A0
};

struct fngr_t {
     struct GPIOX_t * descriptive;
};

struct GPIOX_t * GPIOA_IDR_LOC = 0x40020000 + 0x10;

struct fngr_t Finger;

void doSomething(struct * Finger);

void main() {
  GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_4);  // Enable digital input on PORTA bits
  
  UART1_init(115200);    // initialize UART
  Delay_ms(200);
  UART1_Write_Text("Begin. \n");

  Finger.descriptive = GPIOA_IDR_LOC;
  
  while(1) {
  if(Finger.descriptive->addr0 & 0x1) {
     UART1_Write_Text("Button A0 pressed \n");
     Delay_ms(100);
  }
  if(Finger.descriptive->addr0 & 0x10) {
     UART1_Write_Text("Button A4 pressed \n");
     Delay_ms(100);
  }
  }
}



void doSomething(struct * Finger)
{
  if(Finger->descriptive->addr0 & 0x1) {
     UART1_Write_Text("Button A0 pressed \n");
     Delay_ms(100);
  }

  if(Finger->descriptive->addr0 & 0x10) {
     UART1_Write_Text("Button A4 pressed \n");
     Delay_ms(100);
  }
}






