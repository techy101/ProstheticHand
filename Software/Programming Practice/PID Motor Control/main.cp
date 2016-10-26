#line 1 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"

int Pcontrol(int, int);
void moveFinger(int, int, int);

int const setP = 100;
int const startP = 0;
int const K = 150;
int const margin = 10;

int MPV;
int disturbance;
int direction = 0;
int dutyCycle;


char ToStr[15];

void main()
{
 MPV = startP;
 disturbance = 150;

 srand(50);

 UART1_Init(115200);
 delay_ms(100);
 UART_Write_Text("\r\nStarted. ");


 UART1_Write_Text("\nNotes:");
 UART1_Write_Text("\n- K = ");
 IntToStr(K, ToStr);
 UART1_Write_Text(ToStr);
 UART1_Write_Text("\n- SP = ");
 FloatToStr(setP, ToStr);
 UART1_Write_Text(ToStr);
 UART1_Write_Text("\n- Margin = ");
 FloatToStr(margin, ToStr);
 UART1_Write_Text(ToStr);
 UART1_Write_Text("\n- disturbance = rand%990 \n");

 while(1)
 {


 UART1_Write_Text("\nCurrent position = ");
 IntToStr(MPV, ToStr);
 UART1_Write_Text(ToStr);

 dutyCycle = Pcontrol(setP, MPV);

 UART1_Write_Text("\nPID control returns ");
 IntToStr(dutyCycle, toStr);
 UART1_Write_Text(ToStr);

 UART1_Write_Text("\nDirection = ");
 IntToStr(direction, ToStr);
 UART1_Write_Text(ToStr);

 UART1_Write_Text("Moving finger...");

 moveFinger(dutyCycle, direction, disturbance);

 if(abs(MPV - setP) < margin) {
 UART_Write_Text("\n** PV stabilized. ");


 disturbance = rand()%990;




 }
 delay_ms(500);
 }
}


int Pcontrol(int setP, int MPV)
{
 return K*(setP - MPV);
}

void moveFinger(int dutyCycle, int direction, int disturbance)
{
 if(dutyCycle < 0)
 direction = ~direction;
 dutyCycle = abs(dutyCycle);
 MPV += abs(dutyCycle);
}
