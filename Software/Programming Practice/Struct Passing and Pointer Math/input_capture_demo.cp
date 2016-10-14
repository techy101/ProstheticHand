#line 1 "C:/Users/SCSUS/Desktop/hwpointertest/input_capture_demo.c"









char testOutput[ 50 ];
char aInText[ 50 ];
char bInText[ 50 ];
char cInText[ 50 ];




void init_serial_comm() {

 UART1_Init( 115200 );
 Delay_ms(200);
}




struct finger {
 char instance_name[ 50 ];
 unsigned int a;
 unsigned int b;
 unsigned int c;
};


struct finger testFinger1;
struct finger testFinger2;




void do_math(struct finger *fngr) {


 if (strcmp(fngr->instance_name, "Finger 1") == 0) {
 strcpy(fngr->instance_name, "Finger 1 Altered");
 }

 if (strcmp(fngr->instance_name, "Finger 2") == 0) {
 strcpy(fngr->instance_name, "Finger 2 Altered");
 }


 fngr->a += fngr->a;
 fngr->b = fngr->a + fngr->b;
 fngr->c = 25;
}




void print_values(struct finger *fngr) {


 UART1_Write_Text("Name = ");
 UART1_Write_Text(fngr->instance_name);
 UART1_Write_Text("\n\r");


 IntToStr(fngr->a, aInText);
 UART1_Write_Text("a = ");
 UART1_Write_Text(aInText);
 UART1_Write_Text("\n\r");


 IntToStr(fngr->b, bInText);
 UART1_Write_Text("b = ");
 UART1_Write_Text(bInText);
 UART1_Write_Text("\n\r");


 IntToStr(fngr->c, cInText);
 UART1_Write_Text("c = ");
 UART1_Write_Text(cInText);
 UART1_Write_Text("\n\n\n\r");
}



void main() {


 init_serial_comm();


 strncpy(testOutput, "\rProgram Has Started\n\n\r",  50 );
 UART1_Write_Text(testOutput);



 strcpy(testFinger1.instance_name, "Finger 1");
 testFinger1.a = 5;
 testFinger1.b = 5;
 testFinger1.c = 5;


 strcpy(testFinger2.instance_name, "Finger 2");
 testFinger2.a = 10;
 testFinger2.b = 10;
 testFinger2.c = 10;



 UART1_Write_Text("Finger 1 original values: \n\r");
 print_values(&testFinger1);
 UART1_Write_Text("Finger 2 original Values: \n\r");
 print_values(&testFinger2);


 do_math(&testFinger1);
 do_math(&testFInger2);


 UART1_Write_Text("Finger 1 changed values: \n\r");
 print_values(&testFinger1);
 UART1_Write_Text("Finger 2 changed Values: \n\r");
 print_values(&testFinger2);
}
