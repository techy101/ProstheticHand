#line 1 "C:/Users/SCSUS/Desktop/Final Demo Code/emg.c"
#line 1 "c:/users/scsus/desktop/final demo code/emg.h"
#line 1 "c:/users/scsus/desktop/final demo code/defines.h"
#line 31 "c:/users/scsus/desktop/final demo code/emg.h"
extern const unsigned int EMG_TIMER_PSC;
extern const unsigned int EMG_TIMER_RELOAD;



void init_emg();



void emg_timer_ISR();
void AWD_ISR();
void emg_override_ISR();
#line 1 "c:/users/scsus/desktop/final demo code/defines.h"
#line 1 "c:/users/scsus/desktop/final demo code/system.h"
#line 23 "c:/users/scsus/desktop/final demo code/system.h"
extern const unsigned long MCU_FREQUENCY;
extern const unsigned long ENCODER_TIM_RELOAD;
extern const unsigned long PWM_FREQ_HZ;
extern const unsigned int ENCODER_TIM_PSC;
extern const unsigned int SAMPLE_TIM_RELOAD;
extern const unsigned int SAMPLE_TIM_PSC;
extern const unsigned int TERMINAL_PRINT_THRESH;





extern unsigned int poll_flag;
extern unsigned int terminal_print_count;
extern int analogGo;
extern int goStatus;




void init_GPIO();
void init_sample_timer();



void sample_timer_ISR();
#line 40 "C:/Users/SCSUS/Desktop/Final Demo Code/emg.c"
void init_emg() {


 ADC1_LTR =  0 ;
 ADC1_HTR =  400 ;
 ADC1_CR2bits.CONT = 1;
 ADC1_SQR3bits.SQ1 = 3;
 ADC1_SQR3bits.SQ2 = 4;
 ADC1_CR1bits.AWDSGL = 1;
 ADC1_CR1 |= 3;
 ADC1_CR1bits.AWDEN = 1;
 ADC1_CR2bits.SWSTART = 1;
 ADC1_CR1bits.AWDIE = 1;
 NVIC_IntEnable(IVT_INT_ADC);


 RCC_APB1ENR.TIM5EN = 1;
 TIM5_CR1.CEN = 0;
 TIM5_PSC = EMG_TIMER_PSC;
 TIM5_ARR = EMG_TIMER_RELOAD;
 NVIC_IntEnable(IVT_INT_TIM5);
 TIM5_CR1.CEN = 1;
 GPIO_Digital_Output(&GPIOB_BASE,  GPIOB_ODR.B9 );
#line 71 "C:/Users/SCSUS/Desktop/Final Demo Code/emg.c"
}
#line 92 "C:/Users/SCSUS/Desktop/Final Demo Code/emg.c"
void AWD_ISR() iv IVT_INT_ADC ics ICS_AUTO {
 ADC1_CR1bits.AWDIE = 0;
 ADC1_SRbits.AWD = 0;
 if(ADC1_HTR <= 1000) {
 TIM5_SR.UIF = 0;
 TIM5_CNT = 0x00;
 ADC1_HTR =  4095 ;
 ADC1_LTR =  400 ;
 TIM5_DIER.UIE = 1;
 }
 else {
 TIM5_DIER.UIE = 0;
 ADC1_HTR =  400 ;
 ADC1_LTR =  0 ;
 }
 ADC1_CR1bits.AWDIE = 1;
}
#line 132 "C:/Users/SCSUS/Desktop/Final Demo Code/emg.c"
void emg_timer_ISR() iv IVT_INT_TIM5 {
 TIM5_SR.UIF = 0;
 ADC1_HTR =  400 ;
 ADC1_LTR =  0 ;
 TIM5_DIER.UIE = 0;
 analogGo = 1;
 goStatus = 1;
  GPIOB_ODR.B9  = 1;
}
