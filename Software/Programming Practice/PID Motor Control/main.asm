_Timer3_interrupt:
;main.c,74 :: 		void Timer3_interrupt() iv IVT_INT_TIM3 { // Interrupt handler if 6 seconds have passed
;main.c,75 :: 		TIM3_SR.UIF = 0;                     // Clear timer 3 interrupt bit
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R2, [R0, #0]
;main.c,76 :: 		ADC1_HTR = high_level;               // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;main.c,77 :: 		ADC1_LTR = low_level;                // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;main.c,78 :: 		TIM3_DIER.UIE = 0;                   // Disable timer interrupt
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R2, [R0, #0]
;main.c,79 :: 		analogGo = ~analogGo;                                        // Change  motor state
MOVW	R1, #lo_addr(_analogGo+0)
MOVT	R1, #hi_addr(_analogGo+0)
LDRSH	R0, [R1, #0]
MVN	R0, R0
STRH	R0, [R1, #0]
;main.c,80 :: 		}
L_end_Timer3_interrupt:
BX	LR
; end of _Timer3_interrupt
_Timer4_interrupt:
;main.c,83 :: 		void Timer4_interrupt() iv IVT_INT_TIM4 {
;main.c,84 :: 		TIM4_SR.UIF = 0;                   // Clear timer 4 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SR+0)
MOVT	R0, #hi_addr(TIM4_SR+0)
STR	R1, [R0, #0]
;main.c,85 :: 		sampleFlag = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
STRH	R1, [R0, #0]
;main.c,86 :: 		}
L_end_Timer4_interrupt:
BX	LR
; end of _Timer4_interrupt
_ADC_AWD:
;main.c,89 :: 		void ADC_AWD() iv IVT_INT_ADC ics ICS_AUTO {
;main.c,90 :: 		ADC1_CR1bits.AWDIE = 0;       // Disabling analog interrupt (disable)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;main.c,91 :: 		ADC1_SRbits.AWD = 0;          // Reset status bit
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;main.c,92 :: 		if(ADC1_HTR <= 1000)
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
LDR	R0, [R0, #0]
CMP	R0, #1000
IT	HI
BHI	L_ADC_AWD0
;main.c,94 :: 		TIM3_SR.UIF = 0;        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;main.c,95 :: 		TIM3_CNT = 0x00;        // Reset timer value to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CNT+0)
MOVT	R0, #hi_addr(TIM3_CNT+0)
STR	R1, [R0, #0]
;main.c,96 :: 		ADC1_HTR = high_level2; // Set high threshold to MAX
MOVW	R1, #4095
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;main.c,97 :: 		ADC1_LTR = low_level2;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;main.c,98 :: 		TIM3_DIER.UIE = 1;      // CC1 Update Interrupt Enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;main.c,99 :: 		}
IT	AL
BAL	L_ADC_AWD1
L_ADC_AWD0:
;main.c,102 :: 		TIM3_DIER.UIE = 0;      // Disable timer interrupt
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;main.c,103 :: 		ADC1_HTR = high_level;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;main.c,104 :: 		ADC1_LTR = low_level;   // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;main.c,105 :: 		}
L_ADC_AWD1:
;main.c,106 :: 		ADC1_CR1bits.AWDIE = 1;       //Enable analog interrupt (enabled)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;main.c,107 :: 		}
L_end_ADC_AWD:
BX	LR
; end of _ADC_AWD
_main:
;main.c,111 :: 		void main()
;main.c,113 :: 		srand(50);
MOVS	R0, #50
BL	_srand+0
;main.c,115 :: 		motor_1_init();                // Initialize hardware for motor 1
BL	_motor_1_init+0
;main.c,116 :: 		motor_1_pwm_init();            // Initialize PWM for motor 1 - base frequency 10 kHz
BL	_motor_1_pwm_init+0
;main.c,117 :: 		InitTimer3();                  // Timer3 init (3 seconds)
BL	_InitTimer3+0
;main.c,118 :: 		InitTimer4();                                  // 10 Hz Timer4 init                                                         // Enable timer/counter
BL	_InitTimer4+0
;main.c,120 :: 		ADC_setup();                                        // For Flexiforce read
BL	_ADC_setup+0
;main.c,121 :: 		UART1_init_and_log();                // yeh
BL	_UART1_init_and_log+0
;main.c,123 :: 		for(i = 0; i < 5; i++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main2:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #5
IT	GE
BGE	L_main3
;main.c,124 :: 		MPV = getForce();   // set up the first 5 Flexiforce samples - may be unnecessary
BL	_getForce+0
MOVW	R1, #lo_addr(_MPV+0)
MOVT	R1, #hi_addr(_MPV+0)
STRH	R0, [R1, #0]
;main.c,123 :: 		for(i = 0; i < 5; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;main.c,124 :: 		MPV = getForce();   // set up the first 5 Flexiforce samples - may be unnecessary
IT	AL
BAL	L_main2
L_main3:
;main.c,129 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;main.c,130 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP)); //LED PC13 for interrupt (output)
MOVW	R2, #20
MOVT	R2, #8
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;main.c,131 :: 		GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_ALL); // LED port D (output)
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;main.c,132 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);  // Pin 1 (output)
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;main.c,134 :: 		ADC1_Init();
BL	_ADC1_Init+0
;main.c,135 :: 		ADC1_LTR = low_level;
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;main.c,136 :: 		ADC1_HTR = high_level;
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;main.c,138 :: 		ADC1_CR1bits.AWDEN = 1;      // Enable Analog watchdog on regular channels (enabled)
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R2, [R0, #0]
;main.c,139 :: 		ADC1_CR1bits.AWDSGL = 0;     // Enable the watchdog on a single channel in scan mode (disabled)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;main.c,140 :: 		ADC1_CR1bits.JAWDEN = 0;     // Analog watchdog enable on injected channels (disabled)
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;main.c,141 :: 		ADC1_CR1bits.AWDIE = 1;      // Enable analog interrupt (enabled)
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R2, [R0, #0]
;main.c,142 :: 		NVIC_IntEnable(IVT_INT_ADC); // Enabling interrupt
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;main.c,146 :: 		while(1)
L_main5:
;main.c,148 :: 		GPIOD_ODR = ADC1_Get_Sample(3); // Get ADC value from PA3 (voltage knob) and put it on LEDs
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;main.c,152 :: 		&& sampleFlag)                 // All the stars must align...
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__main23
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main22
L__main21:
;main.c,154 :: 		sampleFlag = 0;   // reset interrupt flag
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
STRH	R1, [R0, #0]
;main.c,155 :: 		MPV = getForce();   // sample
BL	_getForce+0
MOVW	R1, #lo_addr(_MPV+0)
MOVT	R1, #hi_addr(_MPV+0)
STRH	R0, [R1, #0]
;main.c,156 :: 		dutyCycle = Pcontrol(setP, MPV);
SXTH	R1, R0
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
BL	_Pcontrol+0
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
STRH	R0, [R1, #0]
;main.c,157 :: 		moveFinger(dutyCycle);
BL	_moveFinger+0
;main.c,159 :: 		UART_print_values();                // Print important values
BL	_UART_print_values+0
;main.c,161 :: 		if(abs(MPV - setP) < MARGIN)
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRSH	R0, [R0, #0]
SUB	R0, R0, R1
BL	_abs+0
CMP	R0, #2
IT	GE
BGE	L_main10
;main.c,165 :: 		moveFinger(0);       // stop the motor
MOVS	R0, #0
BL	_moveFinger+0
;main.c,166 :: 		sampleFlag = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
STRH	R1, [R0, #0]
;main.c,167 :: 		NVIC_IntDisable(IVT_INT_TIM4);                        // Stop sampling
MOVW	R0, #46
BL	_NVIC_IntDisable+0
;main.c,168 :: 		UART_Write_Text("\n** PV stabilized at ");
MOVW	R0, #lo_addr(?lstr1_main+0)
MOVT	R0, #hi_addr(?lstr1_main+0)
BL	_UART_Write_Text+0
;main.c,169 :: 		IntToStr(MPV, toStr);
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,170 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,176 :: 		moveFinger(100);                                               // Start the motor
MOVS	R0, #100
BL	_moveFinger+0
;main.c,177 :: 		NVIC_IntEnable(IVT_INT_TIM4);            // Start Timer4 again
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;main.c,178 :: 		MPV = getForce();                                                   // Sample to break out of stabilization
BL	_getForce+0
MOVW	R1, #lo_addr(_MPV+0)
MOVT	R1, #hi_addr(_MPV+0)
STRH	R0, [R1, #0]
;main.c,185 :: 		}
L_main10:
;main.c,152 :: 		&& sampleFlag)                 // All the stars must align...
L__main23:
L__main22:
;main.c,187 :: 		}
IT	AL
BAL	L_main5
;main.c,188 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Pcontrol:
;main.c,196 :: 		unsigned int Pcontrol(int setP, int MPV)   // must return duty cycle which is an int
; MPV start address is: 4 (R1)
; setP start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
SXTH	R4, R0
SXTH	R5, R1
; MPV end address is: 4 (R1)
; setP end address is: 0 (R0)
; setP start address is: 16 (R4)
; MPV start address is: 20 (R5)
;main.c,198 :: 		if((setP-MPV) < 0)
SUB	R2, R4, R5
SXTH	R2, R2
CMP	R2, #0
IT	GE
BGE	L_Pcontrol11
;main.c,199 :: 		motorDirection = EXTEND; // handle direction change
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
IT	AL
BAL	L_Pcontrol12
L_Pcontrol11:
;main.c,201 :: 		motorDirection = CONTRACT;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
L_Pcontrol12:
;main.c,203 :: 		if(abs(setP-MPV) > 60)
SUB	R2, R4, R5
SXTH	R0, R2
BL	_abs+0
CMP	R0, #60
IT	LE
BLE	L_Pcontrol13
; setP end address is: 16 (R4)
; MPV end address is: 20 (R5)
;main.c,204 :: 		return 100;       // cap duty cycle
MOVS	R0, #100
IT	AL
BAL	L_end_Pcontrol
L_Pcontrol13:
;main.c,205 :: 		else if(abs(setP-MPV) >= 10)
; MPV start address is: 20 (R5)
; setP start address is: 16 (R4)
SUB	R2, R4, R5
SXTH	R0, R2
BL	_abs+0
CMP	R0, #10
IT	LT
BLT	L_Pcontrol15
;main.c,206 :: 		return (unsigned int)(K*abs(setP - MPV));
SUB	R2, R4, R5
; setP end address is: 16 (R4)
; MPV end address is: 20 (R5)
SXTH	R0, R2
BL	_abs+0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #5
VMUL.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
UXTH	R2, R2
UXTH	R0, R2
IT	AL
BAL	L_end_Pcontrol
L_Pcontrol15:
;main.c,208 :: 		return 0;         // boost duty cycle
MOVS	R0, #0
;main.c,209 :: 		}
L_end_Pcontrol:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pcontrol
_moveFinger:
;main.c,211 :: 		void moveFinger(unsigned int dutyCycle)
; dutyCycle start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; dutyCycle end address is: 0 (R0)
; dutyCycle start address is: 0 (R0)
;main.c,213 :: 		PWM_TIM1_Set_Duty((dutyCycle*(PWM_PERIOD/100)), _PWM_NON_INVERTED, _PWM_CHANNEL1);       // set new duty cycle
MOVW	R1, #lo_addr(_PWM_PERIOD+0)
MOVT	R1, #hi_addr(_PWM_PERIOD+0)
LDRH	R2, [R1, #0]
MOVS	R1, #100
UDIV	R1, R2, R1
UXTH	R1, R1
MULS	R1, R0, R1
; dutyCycle end address is: 0 (R0)
MOVS	R2, #0
UXTH	R0, R1
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;main.c,214 :: 		}
L_end_moveFinger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _moveFinger
_getForce:
;main.c,216 :: 		int getForce()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,221 :: 		measure = ADC2_Get_Sample(3);         // read analog value from channel 3
MOVS	R0, #3
BL	_ADC2_Get_Sample+0
;main.c,222 :: 		averageForceReading = (((averageForceReading * 4) + measure) / 5);
MOVW	R1, #lo_addr(_averageForceReading+0)
MOVT	R1, #hi_addr(_averageForceReading+0)
VLDR	#1, S1, [R1, #0]
VMOV.F32	S0, #4
VMUL.F32	S1, S1, S0
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VADD.F32	S1, S1, S0
VMOV.F32	S0, #5
VDIV.F32	S1, S1, S0
VSTR	#1, S1, [R1, #0]
;main.c,224 :: 		return (int)(averageForceReading*100/(3700-350));       //Converts read value to value between 0 and 100
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #24576
MOVT	R0, #17745
VMOV	S0, R0
VDIV.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
;main.c,225 :: 		}
L_end_getForce:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _getForce
_InitTimer3:
;main.c,231 :: 		void InitTimer3(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,232 :: 		RCC_APB1ENR.TIM3EN = 1;        // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;main.c,233 :: 		TIM3_CR1.CEN = 0;              // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;main.c,234 :: 		TIM3_PSC = 7874;               // Set timer 3 prescaler (need to determine value)
MOVW	R1, #7874
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;main.c,235 :: 		TIM3_ARR = 63999;              // Set timer 3 overflow value at max
MOVW	R1, #63999
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;main.c,236 :: 		NVIC_IntEnable(IVT_INT_TIM3);  // Enable timer 3 interrupt
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;main.c,237 :: 		TIM3_CR1.CEN = 1;              // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;main.c,238 :: 		}
L_end_InitTimer3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer3
_ADC_setup:
;main.c,241 :: 		void ADC_setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,244 :: 		ADC2_Init();
BL	_ADC2_Init+0
;main.c,245 :: 		}
L_end_ADC_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ADC_setup
_UART1_init_and_log:
;main.c,248 :: 		void UART1_init_and_log()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,251 :: 		UART1_Init(115200);
MOV	R0, #115200
BL	_UART1_Init+0
;main.c,252 :: 		delay_ms(100);
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_UART1_init_and_log17:
SUBS	R7, R7, #1
BNE	L_UART1_init_and_log17
NOP
NOP
NOP
;main.c,253 :: 		UART_Write_Text("\r\nStarted. ");
MOVW	R0, #lo_addr(?lstr2_main+0)
MOVT	R0, #hi_addr(?lstr2_main+0)
BL	_UART_Write_Text+0
;main.c,256 :: 		UART1_Write_Text("\nNotes:");
MOVW	R0, #lo_addr(?lstr3_main+0)
MOVT	R0, #hi_addr(?lstr3_main+0)
BL	_UART1_Write_Text+0
;main.c,257 :: 		UART1_Write_Text("\n- K = ");
MOVW	R0, #lo_addr(?lstr4_main+0)
MOVT	R0, #hi_addr(?lstr4_main+0)
BL	_UART1_Write_Text+0
;main.c,258 :: 		FloatToStr(K, ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
VMOV.F32	S0, #5
BL	_FloatToStr+0
;main.c,259 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,260 :: 		UART1_Write_Text("\n- SP = ");
MOVW	R0, #lo_addr(?lstr5_main+0)
MOVT	R0, #hi_addr(?lstr5_main+0)
BL	_UART1_Write_Text+0
;main.c,261 :: 		IntToStr(setP, ToStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,262 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,263 :: 		UART1_Write_Text("\n- MARGIN = ");
MOVW	R0, #lo_addr(?lstr6_main+0)
MOVT	R0, #hi_addr(?lstr6_main+0)
BL	_UART1_Write_Text+0
;main.c,264 :: 		IntToStr(MARGIN, ToStr);
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
MOVW	R0, #2
SXTH	R0, R0
BL	_IntToStr+0
;main.c,265 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,266 :: 		UART1_Write_Text("\n- PWM period = ");
MOVW	R0, #lo_addr(?lstr7_main+0)
MOVT	R0, #hi_addr(?lstr7_main+0)
BL	_UART1_Write_Text+0
;main.c,267 :: 		IntToStr(PWM_PERIOD, ToStr);
MOVW	R0, #lo_addr(_PWM_PERIOD+0)
MOVT	R0, #hi_addr(_PWM_PERIOD+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,268 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,269 :: 		}
L_end_UART1_init_and_log:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UART1_init_and_log
_UART_print_values:
;main.c,272 :: 		void UART_print_values()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,274 :: 		UART1_Write_Text("\n\nCurrent force = ");
MOVW	R0, #lo_addr(?lstr8_main+0)
MOVT	R0, #hi_addr(?lstr8_main+0)
BL	_UART1_Write_Text+0
;main.c,275 :: 		IntToStr(MPV, ToStr);
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,276 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,278 :: 		UART1_Write_Text("\nPID control returns ");
MOVW	R0, #lo_addr(?lstr9_main+0)
MOVT	R0, #hi_addr(?lstr9_main+0)
BL	_UART1_Write_Text+0
;main.c,279 :: 		IntToStr(dutyCycle, toStr);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,280 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,282 :: 		UART1_Write_Text("\nDirection = ");
MOVW	R0, #lo_addr(?lstr10_main+0)
MOVT	R0, #hi_addr(?lstr10_main+0)
BL	_UART1_Write_Text+0
;main.c,283 :: 		if(motorDirection == EXTEND)
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_UART_print_values19
;main.c,284 :: 		UART1_Write_Text("EXTEND");
MOVW	R0, #lo_addr(?lstr11_main+0)
MOVT	R0, #hi_addr(?lstr11_main+0)
BL	_UART1_Write_Text+0
IT	AL
BAL	L_UART_print_values20
L_UART_print_values19:
;main.c,286 :: 		UART1_Write_Text("CONTRACT");
MOVW	R0, #lo_addr(?lstr12_main+0)
MOVT	R0, #hi_addr(?lstr12_main+0)
BL	_UART1_Write_Text+0
L_UART_print_values20:
;main.c,288 :: 		UART1_Write_Text("\nSetpoint = ");
MOVW	R0, #lo_addr(?lstr13_main+0)
MOVT	R0, #hi_addr(?lstr13_main+0)
BL	_UART1_Write_Text+0
;main.c,289 :: 		IntToStr(setP, ToStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,290 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,291 :: 		}
L_end_UART_print_values:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UART_print_values
_motor_1_init:
;main.c,294 :: 		void motor_1_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,295 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_14 | _GPIO_PINMASK_15);                // motorDirection & motorEnable
MOVW	R1, #49152
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;main.c,296 :: 		motorDirection = CONTRACT;        // Contracts initially
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,297 :: 		motorEnable = 0;                // Enabled initially                                                           //Set initial direction
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,298 :: 		}
L_end_motor_1_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_init
_motor_1_pwm_init:
;main.c,301 :: 		void motor_1_pwm_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,302 :: 		PWM_PERIOD = PWM_TIM1_Init(PWM_FREQUENCY);                       // Set PWM base frequency
MOVW	R0, #10000
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_PWM_PERIOD+0)
MOVT	R1, #hi_addr(_PWM_PERIOD+0)
STRH	R0, [R1, #0]
;main.c,303 :: 		PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);          // PWM duty cycle to "current_duty" on Timer 1, channel 1
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;main.c,304 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);       // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;main.c,305 :: 		}
L_end_motor_1_pwm_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_pwm_init
_InitTimer4:
;main.c,308 :: 		void InitTimer4(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,309 :: 		RCC_APB1ENR.TIM4EN = 1;           // Enable clock for timer 4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;main.c,310 :: 		TIM4_CR1.CEN = 0;                 // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;main.c,311 :: 		TIM4_PSC = 279;                   // Set timer 4 prescaler
MOVW	R1, #279
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;main.c,312 :: 		TIM4_ARR = 59999;                 // Set timer 4 overflow value
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;main.c,313 :: 		NVIC_IntEnable(IVT_INT_TIM4);     // Enable timer 4 interrupt
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;main.c,314 :: 		TIM4_DIER.UIE = 1;                // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_DIER+0)
MOVT	R0, #hi_addr(TIM4_DIER+0)
STR	R1, [R0, #0]
;main.c,315 :: 		TIM4_CR1.CEN = 1;                  // Start timer
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;main.c,316 :: 		}
L_end_InitTimer4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer4
