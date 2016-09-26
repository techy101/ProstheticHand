


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
     Add interrupts for motor toggle and direction toggle
     Motor enable interrupt will set "motor_enable_flag" high
     Motor direction interrupt will set "change_direction_flag" high
     All other functionality for these to work is in place, we just need the interrupt handlers
     

 * Pin Configuration
     PD0: All Motor Driver IC's Enable
     PD1: Motor 1 Direction Output
     PE9: Motor 1 PWM Output
     ??Button: Motor Enable Toggle Button
     ??Button: Motor 1 Direction Toggle Button

 * NOTES:
     Motor Direction:
        0: Clockwise
        1: Counter Clockwise

*/


//Function Prototypes
void motor_1_init();                             //Initialize I/O for motor 1
void motor_1_pwm_init();                         //Initialize PWM Timer config for motor 1
void motor_1_pwm_sweep();                        //Duty cycle sweep for motor 1
void motor_1_toggle_direction();                 //Toggle rotation direction for motor 1
void all_motors_toggle_enable();                 //Toggle enable pin on ALL motor drivers


//Global Variables
unsigned int current_duty = 0;                   //Currently set PWM duty cycle
unsigned int pwm_period;                         //Period in ms of PWM frequency
unsigned int pwm_frequency = 100;                //PWM frequency in Hz   (Set to 100Hz)
unsigned int change_direction_flag = 0;          //Flag to trigger motor direction change
unsigned int motor_enable_flag = 0;              //Flag to trigger motor enable toggle


void main() {
     //Initialization Routines
     motor_1_init();                             //Initialize hardware for motor 1
     motor_1_pwm_init();                         //Initialize PWM for motor 1

enable_TIM2(true);
     //Primary Loop
     while(1) {                                  //Infinite loop
          motor_1_pwm_sweep();                   //Call motor sweep function
          
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
     GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);        //Enable digital output for enable pin (D0) and direction pin (D1)
     GPIOD_ODR.B0 = 0;                                                           //Turn on motor enable (active low)
     GPIOD_ODR.B1 = 1;                                                           //Set initial direction
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
          change_direction_flag = 1;                                             //Set flag to trigger motor direction change
          delay_ms(50);                                                          //Delay 50ms to prevent hard direction change on motor gears
     }
     PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);          //Activate new duty cycle
}


//Change Direction
void motor_1_toggle_direction() {
     GPIOD_ODR.B1 = ~GPIOD_ODR.B1;                                               //Toggle motor rotation direction
     change_direction_flag = 0;                                                  //Disable change direction flag
}


//Motor Driver Enable Pin Toggle
void all_motors_toggle_enable() {
     GPIOD_ODR.B0 = ~GPIOD_ODR.B0;                                               //Toggle enable pins on ALL motor driver chips
     motor_enable_flag = 0;                                                      //Reset motor enable flag
}






//Interrupt Handlers