#line 1 "C:/Users/Rachel/Documents/GitHub/ProstheticHand/Software/Programming Practice/PID Motor Control/mAIN2.c"


void process(float, float);

float const SP = 100.0;
float const K = 10.0;

float PV;
float margin = 1.0;
float disturbance;

char PVToStr[15];

void main()
{
 disturbance = 67.5;
 PV = disturbance;

 UART1_Init(115200);
 delay_ms(100);

 while(true)
 {
 FloatToStr(PV, PVToStr);
 UART_Write(PVToStr);
 if(PV > (SP - margin))
 PV = K*(SP - PV);
 else {
 UART_Write_Text("\nPV stabilized. ");
 UART_Write_Text("\nEnter disturbance: ");
 if(UART_Data_Ready())
 disturbance = UART_Read();
 }

 delay_ms(500);
 }
}


void process(float PV, float disturbance)
{
 PV = PV - disturbance;

}
