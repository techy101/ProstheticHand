
int Pcontrol(int, int);
void moveFinger(int, int, int);

int const setP = 100;       // setpoint - what PV should be
int const startP = 0;       // initial value for PV
int const K = 150;          // proportion constant for P control
int const margin = 10;      // accuracy of PV

int MPV;                    // measured process variable
int disturbance;            // modifies PV - random
int direction = 0;
int dutyCycle;
//int i = 0;

char ToStr[15];

void main()
{
   MPV = startP;              // will go away in hardware
   disturbance = 150;         // will go away in hardware

   srand(50);
   
   UART1_Init(115200);        // set up UART1
   delay_ms(100);
   UART_Write_Text("\r\nStarted. ");
   
   // stuff for logs
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
        // MPV = getForce();
        
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
   
       UART1_Write_Text("\nMoving finger...");
        
       moveFinger(dutyCycle, direction, disturbance);

       if(abs(MPV - setP) < margin) {
           UART_Write_Text("\n** PV stabilized. ");

           // generate a new disturbance
           disturbance = rand()%990;
           //UART_Write_Text("\nNew disturbance =  ");
           //IntToStr(disturbance, ToStr);
           //UART1_Write_Text(ToStr);
           //UART1_Write_Text("\n");
       }
       delay_ms(500);             // print twice per second
   }
}


int Pcontrol(int setP, int MPV)   // must return duty cycle which is an int
{
      return K*(setP - MPV);         // direction calibration...
}

void moveFinger(int dutyCycle, int direction, int disturbance)
{
       if(dutyCycle < 0)
           direction = ~direction;
       dutyCycle = abs(dutyCycle);
       //PWM(dutyCycle);          need to actually modify position
                                  // which would be time better spent
                                  // implementing
}