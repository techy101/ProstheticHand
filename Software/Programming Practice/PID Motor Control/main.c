
float Pcontrol(float PV);
float process(float, int);

float const setP = 100.0;       // setpoint - what PV should be
float const startP = 0.0;       // initial value for PV
int const K = 150;              // proportion constant for P control
float const margin = 10.0;      // accuracy of PV

float PV;                       // process variable
int disturbance;                // modifies PV - random
int i = 0;

char ToStr[15];

void main()
{
   PV = startP;                 // initially
   disturbance = 150;
   process(PV, disturbance);    // disturb the process variable
   srand(50);
   
   UART1_Init(115200);          // set up UART1
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
       PV = process(PV, disturbance);        // disturb PV
       
       UART1_Write_Text("\nDisturbed PV = ");
       FloatToStr(PV, ToStr);
       UART1_Write_Text(ToStr);          // display current PV value
       
       PV = PControl(PV);
       
       UART1_Write_Text("\nCorrected PV = ");
       FloatToStr(PV, ToStr);
       UART1_Write_Text(ToStr);          // display current PV value

       if(abs(PV - setP) < margin) {
           UART_Write_Text("\n** PV stabilized. ");
           disturbance = rand()%990;
           
           UART_Write_Text("\nNew disturbance =  ");
           IntToStr(disturbance, ToStr);
           UART1_Write_Text(ToStr);
           UART1_Write_Text("\n");
       }
       delay_ms(500);             // print twice per second
   }
}


float Pcontrol(float PV)
{
      return (-PV / K) + setP;
}

float process(float PV, int disturbance)
{
       //return PV - disturbance;        // ANY OPERATION YOU WANT
       return disturbance*((PV/disturbance) - 36)/577;
}