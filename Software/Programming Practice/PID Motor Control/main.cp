#line 1 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/main.c"

float Pcontrol(float PV);
float process(float, int);

float const setP = 100.0;
float const startP = 0.0;
int const K = 150;
float const margin = 10.0;

float PV;
int disturbance;
int i = 0;

char ToStr[15];

void main()
{
 PV = startP;
 disturbance = 150;
 process(PV, disturbance);
 srand(50);

 UART1_Init(115200);
 delay_ms(100);
 UART_Write_Text("\r\nStarted. ");

 UART1_Write_Text("\nNotes:");
 UART1_Write_Text("\n- process: PV = disturbance*((PV/disturbance) - 36)/577");
 UART1_Write_Text("\n- K = ");
 IntToStr(K, ToStr);
 UART1_Write_Text(ToStr);
 UART1_Write_Text("\n- setpoint = ");
 FloatToStr(setP, ToStr);
 UART1_Write_Text(ToStr);
 UART1_Write_Text("\n- margin = ");
 FloatToStr(margin, ToStr);
 UART1_Write_Text(ToStr);
 UART1_Write_Text("\n- disturbance = rand%990 \n");


 while(1)
 {
 PV = process(PV, disturbance);

 UART1_Write_Text("\nDisturbed PV = ");
 FloatToStr(PV, ToStr);
 UART1_Write_Text(ToStr);

 PV = PControl(PV);

 UART1_Write_Text("\nCorrected PV = ");
 FloatToStr(PV, ToStr);
 UART1_Write_Text(ToStr);

 if(abs(PV - setP) < margin) {
 UART_Write_Text("\n** PV stabilized. ");
 disturbance = rand()%990;

 UART_Write_Text("\nNew disturbance =  ");
 IntToStr(disturbance, ToStr);
 UART1_Write_Text(ToStr);
 UART1_Write_Text("\n");
 }
 delay_ms(500);
 }
}


float Pcontrol(float PV)
{
 return (-PV / K) + setP;
}

float process(float PV, int disturbance)
{

 return disturbance*((PV/disturbance) - 36)/577;
}
