#line 1 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/GPIO Struct Testing/main.c"
#line 17 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/GPIO Struct Testing/main.c"
struct fngr_t {
 int a;
 int b;
};

struct fngr_t FNGR_PNTR;

bit outa, outb;

void main() {
 GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_4);
 UART1_init(115200);
 Delay_ms(200);
 UART1_Write_Text("Begin. \n");

 FNGR_PNTR.a =  GPIOA_IDR.B0 ;
 FNGR_PNTR.b =  GPIOA_IDR.B4 ;

 outa =  GPIOA_IDR.B0 ;
 outb =  GPIOA_IDR.B4 ;

 while(1)
 {

 if(FNGR_PNTR.a)
 {
 UART1_Write_Text("FNGR_PNTR: encoder A = 1 \n");
 Delay_ms(200);
 }
 if(FNGR_PNTR.b)
 {
 UART1_Write_Text("FNGR_PNTR: encoder B = 1 \n");
 Delay_ms(200);
 }
 }
}
