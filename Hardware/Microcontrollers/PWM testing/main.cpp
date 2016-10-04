#include "mbed.h"

PwmOut mypwm(PWM_OUT);
DigitalOut myled(LED1);

int maxSteps = 10000;           //Number of increment steps
int pwmSteps = 1;               //increment value in us
int pwmPeriod = 10;             //PWM period in ms
int timeDelay = 1000;           //Time to delay between increment steps
int pwmWidth;                   //Pulse width value to set in us

int main() {
    
    mypwm.period_ms(pwmPeriod);                         //Set PWM period in us
    
    while(1) 
    {
        pwmWidth = 0;                                   //Reset pulse width to 0
        mypwm.pulsewidth_us(pwmWidth);                  //Reset PWM pulse width
        wait(3);                                        //Time delay with output off
        myled = 1;                                      //Turn on LED to indicate active PWM        //DEBUG
        
        for(int i = 0; i <= maxSteps; i++)              //PWM increment 
        {
//          printf("PWM width(ms) = %d Step size = %d\n", pwmWidth, stepSize);                      //DEBUG
            pwmWidth += pwmSteps;                       //Increment width of PWM
            mypwm.pulsewidth_us(pwmWidth);              //Set pulse width
            wait_us(timeDelay);                         //Delay before next step
        }
        
        wait(3);                                        //Time delay with output on
        myled = 0;                                      //Turn off LED to indicate inactive PWM     //DEBUG
    }
}