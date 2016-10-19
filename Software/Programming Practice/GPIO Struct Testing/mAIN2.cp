#line 1 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/GPIO Struct Testing/mAIN2.c"



struct GPIOX_t {
 unsigned long addr0;
 unsigned long addr1;
};

struct fngr_t {
 struct GPIOX_t * regLocation;
 char name[10];
 struct GPIOX_t * encoder_chan_a;
 struct GPIOX_t * encoder_chan_b;
 unsigned int direction_actual;
};

struct GPIOX_t * GPIOA_IDR_LOC = 0x40020000 + 0x10;

struct fngr_t Finger;

void readEncoderDirection(struct fngr_t * Finger);

void main() {
 GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_ALL);

 UART1_init(115200);
 Delay_ms(200);
 UART1_Write(0x10);
 UART1_Write(0x13);
 UART1_Write_Text("Begin. \n");

 Finger.regLocation = GPIOA_IDR_LOC;
 Finger.encoder_chan_a = GPIOA_IDR_LOC;
 Finger.encoder_chan_b = GPIOA_IDR_LOC;

 while(1) {
 readEncoderDirection(&Finger);
#line 46 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/GPIO Struct Testing/mAIN2.c"
 }
}



void readEncoderDirection(struct fngr_t * Finger)
{
 if(Finger->encoder_chan_a->addr0 & 0x1) {

 UART1_Write_Text("Encoder input from A0 received \n");
 Delay_ms(150);
 }

 if(Finger->encoder_chan_b->addr0 & 0x20) {
 UART1_Write_Text("Encoder input from A5 received \n");
 Delay_ms(150);
 }
}
