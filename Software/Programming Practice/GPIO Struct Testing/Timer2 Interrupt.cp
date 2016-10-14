#line 1 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/GPIO Struct Testing/Timer2 Interrupt.c"
#line 17 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/GPIO Struct Testing/Timer2 Interrupt.c"
struct fngr_t {
 int a;
 int b;
};

 struct fngr_t FNGR_PNTR {};
 FNGR_PNTR.a =  GPIOA_IDR.B0 ;
 FNGR_PNTR.b =  GPIOA_IDR.B4 ;




void main() {
 GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_4);
 UART1_init(115200);
 Delay_ms(200);

 while(1)
 {

 if(FNGR_PNTR.a == 1)
 UART1_Write_Text("FNGR_PNTR: encoder A = 1");
 if(FNGR_PNTR.b == 1)
 UART1_Write_Text("FNGR_PNTR: encoder B = 1");
 }
}
