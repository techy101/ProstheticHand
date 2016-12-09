_timer4_ISR:
;AWD.c,30 :: 		void timer4_ISR() iv IVT_INT_TIM4 {
;AWD.c,31 :: 		TIM4_SR.UIF = 0;                   // Clear timer 4 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SR+0)
MOVT	R0, #hi_addr(TIM4_SR+0)
STR	R1, [R0, #0]
;AWD.c,32 :: 		sampleFlag = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
STRH	R1, [R0, #0]
;AWD.c,33 :: 		}
L_end_timer4_ISR:
BX	LR
; end of _timer4_ISR
_main:
;AWD.c,36 :: 		void main() {
;AWD.c,37 :: 		motor_1_init();                // Initialize hardware for motor 1
BL	_motor_1_init+0
;AWD.c,38 :: 		motor_1_pwm_init();            // Initialize PWM for motor 1
BL	_motor_1_pwm_init+0
;AWD.c,39 :: 		InitTimer3();                  // Timer3 init
BL	_InitTimer3+0
;AWD.c,43 :: 		Timer4_init();
BL	_Timer4_init+0
;AWD.c,46 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP)); //LED PC13 for interrupt (output)
MOVW	R2, #20
MOVT	R2, #8
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;AWD.c,47 :: 		GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_ALL); // LED port D (output)
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;AWD.c,48 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);  //Pin 1 (output)
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;AWD.c,51 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);     // Set active ADC channels
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;AWD.c,52 :: 		ADC1_Init();                                                // Initialize ADC1
BL	_ADC1_Init+0
;AWD.c,55 :: 		ADC1_LTR = low_level;        // Set AWD guard window initial lower threshold
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;AWD.c,56 :: 		ADC1_HTR = high_level;       // Set AWD guard window initial upper threshold
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;AWD.c,57 :: 		ADC1_CR2bits.CONT = 1;       // Enable ADC1 continuous conversion mode
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;AWD.c,58 :: 		ADC1_SQR3bits.SQ1 = 3;       // Set first channel in continuous coversion sequence to channel 3
MOVS	R2, #3
MOVW	R1, #lo_addr(ADC1_SQR3bits+0)
MOVT	R1, #hi_addr(ADC1_SQR3bits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #0, #5
STRB	R0, [R1, #0]
;AWD.c,59 :: 		ADC1_SQR3bits.SQ2 = 4;       // Set second channel in continuous coversion sequence to channel 4 - NEW
MOVS	R2, #4
MOVW	R1, #lo_addr(ADC1_SQR3bits+0)
MOVT	R1, #hi_addr(ADC1_SQR3bits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #5, #5
STRH	R0, [R1, #0]
;AWD.c,60 :: 		ADC1_CR1bits.AWDSGL = 1;     // Enable single channel monitoring mode for AWD
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;AWD.c,61 :: 		ADC1_CR1 |= 3;               // Set channel 3 as the single monitored AWD channel
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
;AWD.c,62 :: 		ADC1_CR1bits.AWDEN = 1;      // Enable Analog watchdog on regular channels
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;AWD.c,63 :: 		ADC1_CR2bits.SWSTART = 1;    // Start ADC1 Conversions
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;AWD.c,64 :: 		ADC1_CR1bits.AWDIE = 1;      // Enable analog watchdog interrupt
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;AWD.c,65 :: 		NVIC_IntEnable(IVT_INT_ADC); // Enable global ADC interrupt
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;AWD.c,68 :: 		UART1_Init(115200);
MOV	R0, #115200
BL	_UART1_Init+0
;AWD.c,69 :: 		delay_ms(100);
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;AWD.c,70 :: 		UART1_Write_Text("\r\nStarted \n");
MOVW	R0, #lo_addr(?lstr1_AWD+0)
MOVT	R0, #hi_addr(?lstr1_AWD+0)
BL	_UART1_Write_Text+0
;AWD.c,72 :: 		while(1){
L_main2:
;AWD.c,73 :: 		if (analogGo) {
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;AWD.c,74 :: 		analogGo = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
STRH	R1, [R0, #0]
;AWD.c,75 :: 		goStatus = !goStatus;
MOVW	R1, #lo_addr(_goStatus+0)
MOVT	R1, #hi_addr(_goStatus+0)
LDRSH	R0, [R1, #0]
CMP	R0, #0
MOVW	R0, #0
BNE	L__main14
MOVS	R0, #1
L__main14:
UXTB	R0, R0
STRH	R0, [R1, #0]
;AWD.c,76 :: 		GPIOC_ODR.B13 = goStatus;
MOV	R0, R1
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;AWD.c,77 :: 		}
L_main4:
;AWD.c,78 :: 		if(sampleFlag)     // print Flexiforce values
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main5
;AWD.c,80 :: 		sampleFlag = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
STRH	R1, [R0, #0]
;AWD.c,81 :: 		MPV = ADC1_Get_Sample(4);         // read analog value from channel 4
MOVS	R0, #4
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_MPV+0)
MOVT	R1, #hi_addr(_MPV+0)
STRH	R0, [R1, #0]
;AWD.c,82 :: 		UART1_Write_Text("\n\nFlexiforce reading = ");
MOVW	R0, #lo_addr(?lstr2_AWD+0)
MOVT	R0, #hi_addr(?lstr2_AWD+0)
BL	_UART1_Write_Text+0
;AWD.c,83 :: 		IntToStr(MPV, ToStr);
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;AWD.c,84 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;AWD.c,85 :: 		}
L_main5:
;AWD.c,86 :: 		GPIOD_ODR = ADC1_Get_Sample(3); // Get ADC value from PA3
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;AWD.c,87 :: 		Delay_ms(20);
MOVW	R7, #5886
MOVT	R7, #17
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
;AWD.c,88 :: 		}
IT	AL
BAL	L_main2
;AWD.c,89 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Timer4_init:
;AWD.c,94 :: 		void Timer4_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;AWD.c,96 :: 		RCC_APB1ENR.TIM4EN = 1;                                                     // Enable clock for timer 4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;AWD.c,97 :: 		TIM4_CR1.CEN = 0;                                                           // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;AWD.c,98 :: 		TIM4_PSC = 279;                                                             // Set timer 4 prescaler
MOVW	R1, #279
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;AWD.c,99 :: 		TIM4_ARR = 59999;                                                           // Set timer 4 overflow value
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;AWD.c,100 :: 		NVIC_IntEnable(IVT_INT_TIM4);                                               // Enable timer 4 interrupt
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;AWD.c,101 :: 		TIM4_DIER.UIE = 1;                                                          // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_DIER+0)
MOVT	R0, #hi_addr(TIM4_DIER+0)
STR	R1, [R0, #0]
;AWD.c,102 :: 		TIM4_CR1.CEN = 1;                                                           // start 10 Hz timer
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;AWD.c,103 :: 		}
L_end_Timer4_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer4_init
_ADC_AWD:
;AWD.c,106 :: 		void ADC_AWD() iv IVT_INT_ADC ics ICS_AUTO {
;AWD.c,107 :: 		ADC1_CR1bits.AWDIE = 0;       // Disabling analog interrupt (disable)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;AWD.c,108 :: 		ADC1_SRbits.AWD = 0;          // Reset status bit
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;AWD.c,109 :: 		if(ADC1_HTR <= 1000) {
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
LDR	R0, [R0, #0]
CMP	R0, #1000
IT	HI
BHI	L_ADC_AWD8
;AWD.c,110 :: 		TIM3_SR.UIF = 0;        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;AWD.c,111 :: 		TIM3_CNT = 0x00;        // Reset timer value to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CNT+0)
MOVT	R0, #hi_addr(TIM3_CNT+0)
STR	R1, [R0, #0]
;AWD.c,112 :: 		ADC1_HTR = high_level2; // Set high threshold to MAX
MOVW	R1, #4095
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;AWD.c,113 :: 		ADC1_LTR = low_level2;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;AWD.c,114 :: 		TIM3_DIER.UIE = 1;      // CC1 Update Interrupt Enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;AWD.c,115 :: 		}else {
IT	AL
BAL	L_ADC_AWD9
L_ADC_AWD8:
;AWD.c,116 :: 		TIM3_DIER.UIE = 0;      // Disable timer interrupt
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;AWD.c,117 :: 		ADC1_HTR = high_level;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;AWD.c,118 :: 		ADC1_LTR = low_level;   // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;AWD.c,119 :: 		}
L_ADC_AWD9:
;AWD.c,120 :: 		ADC1_CR1bits.AWDIE = 1;       //Enable analog interrupt (enabled)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;AWD.c,121 :: 		}
L_end_ADC_AWD:
BX	LR
; end of _ADC_AWD
_InitTimer3:
;AWD.c,124 :: 		void InitTimer3(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;AWD.c,125 :: 		RCC_APB1ENR.TIM3EN = 1;        // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;AWD.c,126 :: 		TIM3_CR1.CEN = 0;              // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;AWD.c,127 :: 		TIM3_PSC = 7874;               // Set timer 3 prescaler (need to determine value)
MOVW	R1, #7874
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;AWD.c,128 :: 		TIM3_ARR = 63999;              // Set timer 3 overflow value at max
MOVW	R1, #63999
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;AWD.c,129 :: 		NVIC_IntEnable(IVT_INT_TIM3);  // Enable timer 3 interrupt
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;AWD.c,130 :: 		TIM3_CR1.CEN = 1;              // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;AWD.c,131 :: 		}
L_end_InitTimer3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer3
_Timer3_interrupt:
;AWD.c,134 :: 		void Timer3_interrupt() iv IVT_INT_TIM3 { // Interrupt handler if 6 s have past
;AWD.c,135 :: 		TIM3_SR.UIF = 0;                     // Clear timer 3 interrupt bit
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R2, [R0, #0]
;AWD.c,136 :: 		ADC1_HTR = high_level;               // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;AWD.c,137 :: 		ADC1_LTR = low_level;                // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;AWD.c,138 :: 		TIM3_DIER.UIE = 0;                   // Disable timer interrupt
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R2, [R0, #0]
;AWD.c,139 :: 		analogGo = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
STRH	R1, [R0, #0]
;AWD.c,140 :: 		}
L_end_Timer3_interrupt:
BX	LR
; end of _Timer3_interrupt
_motor_1_init:
;AWD.c,143 :: 		void motor_1_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;AWD.c,144 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);        //Enable digital output for enable pin (D0) and direction pin (D1)
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;AWD.c,145 :: 		GPIOD_ODR.B0 = 0;                                                           //Turn on motor enable (active low)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;AWD.c,146 :: 		GPIOD_ODR.B1 = 1;                                                           //Set initial direction
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;AWD.c,147 :: 		}
L_end_motor_1_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_init
_motor_1_pwm_init:
;AWD.c,150 :: 		void motor_1_pwm_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;AWD.c,151 :: 		pwm_period = PWM_TIM1_Init(10000);                               // Set PWM base frequency
MOVW	R0, #10000
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;AWD.c,152 :: 		PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);          // PWM duty cycle to "current_duty" on Timer 1, channel 1
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;AWD.c,153 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);       // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;AWD.c,154 :: 		}
L_end_motor_1_pwm_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_pwm_init
_motor_1_pwm_sweep:
;AWD.c,157 :: 		void motor_1_pwm_sweep() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;AWD.c,158 :: 		if(motorState){
MOVW	R0, #lo_addr(_motorState+0)
MOVT	R0, #hi_addr(_motorState+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_motor_1_pwm_sweep10
;AWD.c,159 :: 		PWM_TIM1_Set_Duty(10000, _PWM_NON_INVERTED, _PWM_CHANNEL1);  // Setting duty cycle to 10000
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #10000
BL	_PWM_TIM1_Set_Duty+0
;AWD.c,160 :: 		motorState = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_motorState+0)
MOVT	R0, #hi_addr(_motorState+0)
STRH	R1, [R0, #0]
;AWD.c,161 :: 		}else{
IT	AL
BAL	L_motor_1_pwm_sweep11
L_motor_1_pwm_sweep10:
;AWD.c,162 :: 		PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);      // Setting duty cycle to 0
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;AWD.c,163 :: 		motorState = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_motorState+0)
MOVT	R0, #hi_addr(_motorState+0)
STRH	R1, [R0, #0]
;AWD.c,164 :: 		}
L_motor_1_pwm_sweep11:
;AWD.c,165 :: 		}
L_end_motor_1_pwm_sweep:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_pwm_sweep
