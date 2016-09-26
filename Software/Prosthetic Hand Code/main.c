/*
Prosthetic Hand Senior Design Project
9/7/2016
Rachel Mertz
Matthew Varas
Donnell Jones

 * Project name:
     Single Motor Driver Test

 * Description:
     This is a functionality demo for the motor driver PWM and control signals.
     Eventually will include button-based interrupt control of direction and enable

 * New for this project:
     Motor enable/disable and direction changes are allowed through the
     configuration of GPIO pins PD0 and PD1, respectively.
     
 * To do:


 * Pin Configuration
     PE14: All Motor Driver IC's Enable
     PE15: Motor 1 Direction Output
     PE9: Motor 1 PWM Output
     D0 Button: Motor Enable Toggle Button
     D1 Button: Motor 1 Direction Toggle Button

 * NOTES:
     Motor Direction:
        0: Clockwise
        1: Counter Clockwise

*/
#define motor1Direction GPIOE_ODR.B15

//Function Prototypes
void motor_1_init();                             //Initialize I/O for motor 1
void motor_1_pwm_init();                         //Initialize PWM Timer config for motor 1
void motor_1_pwm_sweep();                        //Duty cycle sweep for motor 1
void motor_1_toggle_direction();                 //Toggle rotation direction for motor 1
void all_motors_toggle_enable();                 //Toggle enable pin on ALL motor drivers
void interrupt_init();
void UART_Wired_init();
void UART_BT_init();


//Global Variables
unsigned int current_duty = 0;                   //Currently set PWM duty cycle
unsigned int pwm_stopped = 0;                    //State of PWM generation enable
unsigned int pwm_period;                         //Period in ms of PWM frequency
unsigned int pwm_frequency = 100;                //PWM frequency in Hz   (Set to 100Hz)
unsigned int change_direction_flag = 0;          //Flag to trigger motor direction change
unsigned int motor_enable_flag = 0;              //Flag to trigger motor enable toggle
char uart_rd;                                    //Character read from UART interface

void main() {
     //Initialization Routines
     motor_1_init();                             //Initialize hardware for motor 1
     motor_1_pwm_init();                         //Initialize PWM for motor 1
     interrupt_init();                           //Initialize external hardware interrupts
     UART_Wired_init();
     UART_BT_init();
     NVIC_IntEnable(IVT_INT_USART1);
     NVIC_IntEnable(IVT_INT_USART2);
     SYSCFGEN_bit = 1;
     SYSCFG_EXTICR1=0b0010001000000000;
     EXTI_IMR = EXTI_IMR | 0b1100;
     EXTI_RTSR =  0b0;
     EXTI_FTSR = EXTI_RTSR | 0b1100;

     RXNEIE_USART1_CR1_bit =1;
     RXNEIE_USART2_CR1_bit =1;
     TCIE_bit = 1;
     TXEIE_bit = 1;
     //Primary Loop
     while(1) {                                  //Infinite loop
            motor_1_pwm_sweep();                 //Call motor sweep function
            
            if(change_direction_flag) {            //Check if it's time to change motor direction
                 motor_1_toggle_direction();       //Call motor direction change function
            }

            if(motor_enable_flag) {                //Check if motor enable button has been pressed
                 all_motors_toggle_enable();       //Call motor enable toggle function
            }

            delay_ms(1);                           //Delay for functionality
    }
}




//Functions

//Motor 1 Hardware Init
void motor_1_init() {
     GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_14 | _GPIO_PINMASK_15);        //Enable digital output for enable pin (D0) and direction pin (D1)
     GPIOE_ODR.B14 = 0;                                                           //Turn on motor enable (active low)
     GPIOE_ODR.B15 = 1;                                                           //Set initial direction
}
   
     
//Motor 1 PWM Init
void motor_1_pwm_init() {
     pwm_period = PWM_TIM1_Init(pwm_frequency);                                  //Set PWM base frequency to 100Hz
     PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);          //PWM duty cycle to "current_duty" on Timer 1, channel 1
     PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                  //Start PWM
}


//PWM Sweep
void motor_1_pwm_sweep() {
     if(current_duty < pwm_period) {                                             //Check duty cycle is < 100%
          current_duty += 10;                                                    //Increment duty cycle by 10ms
     }
     else {                                                                      //When maximum duty cycle reached
          current_duty = 0;                                                      //Reset duty cycle to 0
          //change_direction_flag = 1;                                             //Set flag to trigger motor direction change
          delay_ms(50);                                                          //Delay 50ms to prevent hard direction change on motor gears
     }
     PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);          //Activate new duty cycle
}


//Change Direction
void motor_1_toggle_direction() {
    // GPIOE_ODR.B15 = ~GPIOE_ODR.B15;                                               //Toggle motor rotation direction
     motor1Direction = ~motor1Direction;
     change_direction_flag = 0;                                                  //Disable change direction flag
     UART1_Write_Text("Direction changed\n");                                    //And send data via UART
     UART2_Write_Text("Direction changed\n");                                    //And send data via UART
}


//Motor Driver Enable Pin Toggle
void all_motors_toggle_enable() {
     GPIOE_ODR.B14 = ~GPIOE_ODR.B14;                                               //Toggle enable pins on ALL motor driver chips
     motor_enable_flag = 0;                                                      //Reset motor enable flag
     UART1_Write_Text("Motor Enable changed\n");                                    //And send data via UART
     UART2_Write_Text("Motor Enable changed\n");                                    //And send data via UART
}


//Initialization for Bluetooth and Wired UART

void UART_Wired_init() {
    UART1_Init(115200);              // Initialize UART module at 115200 bps
    Delay_ms(100);                  // Wait for UART module to stabilize

    UART1_Write_Text("Start FTDI Wired");
    UART1_Write(13);
    UART1_Write(10);
}

void UART_BT_init() {
    // Initialize UART module at 115200 bps
    UART2_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PD56);
    Delay_ms(100);                  // Wait for UART module to stabilize
    
    //UART2 interrupt initilization code here

    UART2_Write_Text("Start Bluetooth");
    UART2_Write(13);
    UART2_Write(10);
}


//Interrupt Handlers

void interrupt_init() {
    //GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9 | _GPIO_PINMASK_10);  // Enable digital output on PE9 and PE10
    GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);  // Enable digital input through buttons D0 and D1
    //GPIOE_ODR.B9 = 0;               // Enable motor
    //GPIOE_ODR.B10 = 0;             // Start direction clockwise, ha

    SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
    SYSCFG_EXTICR1 = 0x00000033;         // Map external interrupt on PD0 and PD1         **Changed to 3300 from 0300 to (Ref Man p.294)
    EXTI_RTSR = 0x00000003;              // Set interrupt on Rising edge (PD0 and PD1)
    EXTI_FTSR = 0x00000000;              // Set Interrupt on Falling edge (none)
    EXTI_IMR |= 0x00000003;              // Unmask bits 0 and 1 to interrupt on those lines
    NVIC_IntEnable(IVT_INT_EXTI0);      //Enable external interrupt for enable pin
    NVIC_IntEnable(IVT_INT_EXTI1);      //Enable external interrupt for direction pin
}

void EnableInt() iv IVT_INT_EXTI0 ics ICS_AUTO {
  EXTI_PR.B0 = 1;                     // clear flag
  motor_enable_flag = 1;    // Toggle Direction(Pin)
}

void DirectionInt() iv IVT_INT_EXTI1 ics ICS_AUTO {
  EXTI_PR.B1 = 1;                     // clear flag
  change_direction_flag = 1;
}

  void USART1_INT() iv IVT_INT_USART1 ics ICS_AUTO {
            if(UART1_Data_ready()) {      //If data is received from Wired UART
                uart_rd = UART1_Read();   //Read the received data

                if(uart_rd == 'd') {
                    change_direction_flag = 1;
                }

                else if(uart_rd == 'e') {
                    motor_enable_flag = 1;
                }

                else if(uart_rd == 's') {
                     if(pwm_stopped == 0) {
                          PWM_TIM1_Stop(_PWM_CHANNEL1);
                          pwm_stopped = 1;
                          UART1_Write_Text("PWM Stopped\n");                                    //And send data via UART
                          UART2_Write_Text("PWM Stopped\n");                                    //And send data via UART
                     }

                     else {
                          motor_1_pwm_init();
                          pwm_stopped = 0;
                          UART1_Write_Text("PWM Started\n");                                    //And send data via UART
                          UART2_Write_Text("PWM Started\n");                                    //And send data via UART
                     }
                }
            }

}

  void USART2_INT() iv IVT_INT_USART2 ics ICS_AUTO {
            if (UART2_Data_Ready()) {     //If data is received from Bluetooth UART
                 uart_rd = UART2_Read();  //Read the received data

                 if(uart_rd == 'd') {
                    change_direction_flag = 1;
                 }

                 else if(uart_rd == 'e') {
                    motor_enable_flag = 1;
                 }

                else if(uart_rd == 's') {
                     if(pwm_stopped == 0) {
                          PWM_TIM1_Stop(_PWM_CHANNEL1);
                          pwm_stopped = 1;
                          UART1_Write_Text("PWM Stopped\n");                                    //And send data via UART
                          UART2_Write_Text("PWM Stopped\n");                                    //And send data via UART
                     }

                     else {
                          motor_1_pwm_init();
                          pwm_stopped = 0;
                          UART1_Write_Text("PWM Started\n");                                    //And send data via UART
                          UART2_Write_Text("PWM Started\n");                                    //And send data via UART
                     }
                }
            }
}
