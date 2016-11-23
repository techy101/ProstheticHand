_timer4_ISR:
;main.c,55 :: 		void timer4_ISR() iv IVT_INT_TIM4 {
;main.c,56 :: 		TIM4_SR.UIF = 0;                   // Clear timer 4 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SR+0)
MOVT	R0, #hi_addr(TIM4_SR+0)
STR	R1, [R0, #0]
;main.c,57 :: 		sampleFlag = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
STRH	R1, [R0, #0]
;main.c,58 :: 		}
L_end_timer4_ISR:
BX	LR
; end of _timer4_ISR
_main:
;main.c,61 :: 		void main()
SUB	SP, SP, #4
;main.c,63 :: 		srand(50);
MOVS	R0, #50
BL	_srand+0
;main.c,66 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_15);
MOVW	R1, #33792
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;main.c,67 :: 		motorDirection = CONTRACT;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,68 :: 		motorEnable = 0;        // enabled initially
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,71 :: 		Timer4_init();
BL	_Timer4_init+0
;main.c,78 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3 | _ADC_CHANNEL_7); // 7 for Flexi, 3 for EMG
MOVS	R0, #136
BL	_ADC_Set_Input_Channel+0
;main.c,79 :: 		ADC1_Init();
BL	_ADC1_Init+0
;main.c,82 :: 		UART1_Init(115200);
MOV	R0, #115200
BL	_UART1_Init+0
;main.c,83 :: 		delay_ms(100);
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
;main.c,84 :: 		UART_Write_Text("\r\nStarted. ");
MOVW	R0, #lo_addr(?lstr1_main+0)
MOVT	R0, #hi_addr(?lstr1_main+0)
BL	_UART_Write_Text+0
;main.c,87 :: 		UART1_Write_Text("\nNotes:");
MOVW	R0, #lo_addr(?lstr2_main+0)
MOVT	R0, #hi_addr(?lstr2_main+0)
BL	_UART1_Write_Text+0
;main.c,88 :: 		UART1_Write_Text("\n- K = ");
MOVW	R0, #lo_addr(?lstr3_main+0)
MOVT	R0, #hi_addr(?lstr3_main+0)
BL	_UART1_Write_Text+0
;main.c,89 :: 		FloatToStr(K, ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
VMOV.F32	S0, #5
BL	_FloatToStr+0
;main.c,90 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,91 :: 		UART1_Write_Text("\n- SP = ");
MOVW	R0, #lo_addr(?lstr4_main+0)
MOVT	R0, #hi_addr(?lstr4_main+0)
BL	_UART1_Write_Text+0
;main.c,92 :: 		IntToStr(setP, ToStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,93 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,94 :: 		UART1_Write_Text("\n- Margin = ");
MOVW	R0, #lo_addr(?lstr5_main+0)
MOVT	R0, #hi_addr(?lstr5_main+0)
BL	_UART1_Write_Text+0
;main.c,95 :: 		IntToStr(margin, ToStr);
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
MOVW	R0, #2
SXTH	R0, R0
BL	_IntToStr+0
;main.c,96 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,101 :: 		motor_1_pwm_init();            // Initialize PWM for motor 1
BL	_motor_1_pwm_init+0
;main.c,102 :: 		InitTimer3();                  // Timer3 init
BL	_InitTimer3+0
;main.c,105 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP)); //LED PC13 for interrupt (output)
MOVW	R2, #20
MOVT	R2, #8
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;main.c,106 :: 		GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_ALL); // LED port D (output)
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;main.c,107 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);  //Pin 1 (output)
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;main.c,110 :: 		ADC1_LTR = low_level;
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;main.c,111 :: 		ADC1_HTR = high_level;
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;main.c,114 :: 		ADC1_CR1bits.AWDCH = 3;          // Set AWD channel to ADC1 Channel 3                         **Added by Matthew 11/23
MOVS	R2, #3
MOVW	R1, #lo_addr(ADC1_CR1bits+0)
MOVT	R1, #hi_addr(ADC1_CR1bits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #0, #5
STRB	R0, [R1, #0]
;main.c,115 :: 		ADC1_CR1bits.AWDEN = 1;      // Enable Analog watchdog on regular channels (enabled)
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R2, [R0, #0]
;main.c,116 :: 		ADC1_CR1bits.AWDSGL = 1;     // Enable the watchdog on a single channel in scan mode      **Changed from 0 to 1 by Matthew 11/23
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R2, [R0, #0]
;main.c,117 :: 		ADC1_CR1bits.JAWDEN = 0;     // Analog watchdog enable on injected channels (disabled)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;main.c,118 :: 		ADC1_CR1bits.AWDIE = 1;      // Enable analog interrupt (enabled)
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R2, [R0, #0]
;main.c,119 :: 		NVIC_IntEnable(IVT_INT_ADC); // Enabling interrupt
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;main.c,122 :: 		for(i = 0; i < 5; i++)
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
;main.c,123 :: 		MPV = getForce();   // set up the first 5 samples - HMMMM
BL	_getForce+0
MOVW	R1, #lo_addr(_MPV+0)
MOVT	R1, #hi_addr(_MPV+0)
STRH	R0, [R1, #0]
;main.c,122 :: 		for(i = 0; i < 5; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;main.c,123 :: 		MPV = getForce();   // set up the first 5 samples - HMMMM
IT	AL
BAL	L_main2
L_main3:
;main.c,125 :: 		while(1)
L_main5:
;main.c,127 :: 		if(~motorEnable && sampleFlag && analogGo) {
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
UXTB	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L__main22
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main21
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main20
L__main19:
;main.c,129 :: 		analogGo = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
STRH	R1, [R0, #0]
;main.c,130 :: 		sampleFlag = 0;   // reset interrupt flag
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
STRH	R1, [R0, #0]
;main.c,131 :: 		MPV = getForce();   // sample
BL	_getForce+0
MOVW	R1, #lo_addr(_MPV+0)
MOVT	R1, #hi_addr(_MPV+0)
STRH	R0, [R1, #0]
;main.c,133 :: 		UART1_Write_Text("\n\nCurrent force = ");
MOVW	R0, #lo_addr(?lstr6_main+0)
MOVT	R0, #hi_addr(?lstr6_main+0)
BL	_UART1_Write_Text+0
;main.c,134 :: 		IntToStr(MPV, ToStr);
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,135 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,137 :: 		UART1_Write_Text("\nPID control returns ");
MOVW	R0, #lo_addr(?lstr7_main+0)
MOVT	R0, #hi_addr(?lstr7_main+0)
BL	_UART1_Write_Text+0
;main.c,138 :: 		IntToStr(dutyCycle, toStr);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,139 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,141 :: 		UART1_Write_Text("\nDirection = ");
MOVW	R0, #lo_addr(?lstr8_main+0)
MOVT	R0, #hi_addr(?lstr8_main+0)
BL	_UART1_Write_Text+0
;main.c,142 :: 		IntToStr(motorDirection, ToStr);
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,143 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,145 :: 		UART1_Write_Text("\nSetpoint = ");
MOVW	R0, #lo_addr(?lstr9_main+0)
MOVT	R0, #hi_addr(?lstr9_main+0)
BL	_UART1_Write_Text+0
;main.c,146 :: 		IntToStr(setP, ToStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,147 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,149 :: 		dutyCycle = Pcontrol(setP, MPV);
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
BL	_Pcontrol+0
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
STRH	R0, [R1, #0]
;main.c,151 :: 		moveFinger(dutyCycle);
BL	_moveFinger+0
;main.c,153 :: 		if(abs(MPV - setP) < MARGIN)
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
;main.c,155 :: 		moveFinger(0);       // stop the motor
MOVS	R0, #0
SXTH	R0, R0
BL	_moveFinger+0
;main.c,156 :: 		sampleFlag = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
STRH	R1, [R0, #0]
;main.c,157 :: 		NVIC_IntDisable(IVT_INT_TIM4);                    // stop sampling
MOVW	R0, #46
BL	_NVIC_IntDisable+0
;main.c,158 :: 		UART_Write_Text("\n** PV stabilized at ");
MOVW	R0, #lo_addr(?lstr10_main+0)
MOVT	R0, #hi_addr(?lstr10_main+0)
BL	_UART_Write_Text+0
;main.c,159 :: 		IntToStr(MPV, toStr);
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,160 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,166 :: 		moveFinger(60);       // start the motor
MOVS	R0, #60
SXTH	R0, R0
BL	_moveFinger+0
;main.c,167 :: 		NVIC_IntEnable(IVT_INT_TIM4);            // start sampling again
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;main.c,168 :: 		}
L_main10:
;main.c,127 :: 		if(~motorEnable && sampleFlag && analogGo) {
L__main22:
L__main21:
L__main20:
;main.c,170 :: 		}
IT	AL
BAL	L_main5
;main.c,171 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Pcontrol:
;main.c,174 :: 		int Pcontrol(int setP, int MPV)   // must return duty cycle which is an int
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
;main.c,176 :: 		if((setP-MPV) < 0)
SUB	R2, R4, R5
SXTH	R2, R2
CMP	R2, #0
IT	GE
BGE	L_Pcontrol11
;main.c,177 :: 		motorDirection = EXTEND; // handle direction change
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
IT	AL
BAL	L_Pcontrol12
L_Pcontrol11:
;main.c,179 :: 		motorDirection = CONTRACT;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
L_Pcontrol12:
;main.c,181 :: 		if(abs(setP-MPV) > 60)
SUB	R2, R4, R5
SXTH	R0, R2
BL	_abs+0
CMP	R0, #60
IT	LE
BLE	L_Pcontrol13
; setP end address is: 16 (R4)
; MPV end address is: 20 (R5)
;main.c,182 :: 		return 60;       // cap duty cycle
MOVS	R0, #60
SXTH	R0, R0
IT	AL
BAL	L_end_Pcontrol
L_Pcontrol13:
;main.c,183 :: 		else if(abs(setP-MPV) >= 10)
; MPV start address is: 20 (R5)
; setP start address is: 16 (R4)
SUB	R2, R4, R5
SXTH	R0, R2
BL	_abs+0
CMP	R0, #10
IT	LT
BLT	L_Pcontrol15
;main.c,184 :: 		return (int)(K*abs(setP - MPV));
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
SXTH	R2, R2
SXTH	R0, R2
IT	AL
BAL	L_end_Pcontrol
L_Pcontrol15:
;main.c,186 :: 		return 20;         // boost duty cycle
MOVS	R0, #20
SXTH	R0, R0
;main.c,187 :: 		}
L_end_Pcontrol:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pcontrol
_moveFinger:
;main.c,189 :: 		void moveFinger(int dutyCycle)
; dutyCycle start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; dutyCycle end address is: 0 (R0)
; dutyCycle start address is: 0 (R0)
;main.c,191 :: 		PWM_TIM1_Set_Duty(dutyCycle*(PWM_PERIOD/100), _PWM_NON_INVERTED, _PWM_CHANNEL1);       // set new duty cycle
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
;main.c,192 :: 		}
L_end_moveFinger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _moveFinger
_getForce:
;main.c,194 :: 		int getForce()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,199 :: 		measure = ADC1_Get_Sample(7);         // read analog value from channel 0
MOVS	R0, #7
BL	_ADC1_Get_Sample+0
;main.c,200 :: 		averageForceReading = (((averageForceReading * 4) + measure) / 5);
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
;main.c,202 :: 		return (int)(averageForceReading*100/(3700-350));       //Converts read value to value between 0 and 100
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
;main.c,203 :: 		}
L_end_getForce:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _getForce
_Timer4_init:
;main.c,205 :: 		void Timer4_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,207 :: 		RCC_APB1ENR.TIM4EN = 1;                                                     // Enable clock for timer 4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;main.c,208 :: 		TIM4_CR1.CEN = 0;                                                           // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;main.c,209 :: 		TIM4_PSC = 279;                                                             // Set timer 4 prescaler
MOVW	R1, #279
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;main.c,210 :: 		TIM4_ARR = 59999;                                                           // Set timer 4 overflow value
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;main.c,211 :: 		NVIC_IntEnable(IVT_INT_TIM4);                                               // Enable timer 4 interrupt
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;main.c,212 :: 		TIM4_DIER.UIE = 1;                                                          // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_DIER+0)
MOVT	R0, #hi_addr(TIM4_DIER+0)
STR	R1, [R0, #0]
;main.c,213 :: 		TIM4_CR1.CEN = 1;                                                           // start 10 Hz timer
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;main.c,214 :: 		}
L_end_Timer4_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer4_init
_ADC_AWD:
;main.c,220 :: 		void ADC_AWD() iv IVT_INT_ADC ics ICS_AUTO {
;main.c,221 :: 		ADC1_CR1bits.AWDIE = 0;       // Disabling analog interrupt (disable)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;main.c,222 :: 		ADC1_SRbits.AWD = 0;          // Reset status bit
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;main.c,223 :: 		if(ADC1_HTR <= 1000) {
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
LDR	R0, [R0, #0]
CMP	R0, #1000
IT	HI
BHI	L_ADC_AWD17
;main.c,224 :: 		TIM3_SR.UIF = 0;        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;main.c,225 :: 		TIM3_CNT = 0x00;        // Reset timer value to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CNT+0)
MOVT	R0, #hi_addr(TIM3_CNT+0)
STR	R1, [R0, #0]
;main.c,226 :: 		ADC1_HTR = high_level2; // Set high threshold to MAX
MOVW	R1, #4095
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;main.c,227 :: 		ADC1_LTR = low_level2;  // Set low threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;main.c,228 :: 		TIM3_DIER.UIE = 1;      // CC1 Update Interrupt Enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;main.c,229 :: 		}else {
IT	AL
BAL	L_ADC_AWD18
L_ADC_AWD17:
;main.c,230 :: 		TIM3_DIER.UIE = 0;      // Disable timer interrupt
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;main.c,231 :: 		ADC1_HTR = high_level;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;main.c,232 :: 		ADC1_LTR = low_level;   // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;main.c,233 :: 		}
L_ADC_AWD18:
;main.c,234 :: 		ADC1_CR1bits.AWDIE = 1;       //Enable analog interrupt (enabled)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;main.c,235 :: 		}
L_end_ADC_AWD:
BX	LR
; end of _ADC_AWD
_InitTimer3:
;main.c,238 :: 		void InitTimer3(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,239 :: 		RCC_APB1ENR.TIM3EN = 1;        // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;main.c,240 :: 		TIM3_CR1.CEN = 0;              // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;main.c,241 :: 		TIM3_PSC = 7874;              // Set timer 3 prescaler (need to determine value)
MOVW	R1, #7874
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;main.c,242 :: 		TIM3_ARR = 63999;              // Set timer 3 overflow value at max
MOVW	R1, #63999
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;main.c,243 :: 		NVIC_IntEnable(IVT_INT_TIM3);  // Enable timer 3 interrupt
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;main.c,244 :: 		TIM3_CR1.CEN = 1;              // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;main.c,245 :: 		}
L_end_InitTimer3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer3
_Timer3_interrupt:
;main.c,248 :: 		void Timer3_interrupt() iv IVT_INT_TIM3 { // Interrupt handler if 6 s have past
;main.c,249 :: 		TIM3_SR.UIF = 0;                     // Clear timer 3 interrupt bit
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R2, [R0, #0]
;main.c,250 :: 		ADC1_HTR = high_level;               // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;main.c,251 :: 		ADC1_LTR = low_level;                // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;main.c,252 :: 		TIM3_DIER.UIE = 0;                   // Disable timer interrupt
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R2, [R0, #0]
;main.c,253 :: 		analogGo = !analogGo;
MOVW	R1, #lo_addr(_analogGo+0)
MOVT	R1, #hi_addr(_analogGo+0)
LDRSH	R0, [R1, #0]
CMP	R0, #0
MOVW	R0, #0
BNE	L__Timer3_interrupt33
MOVS	R0, #1
L__Timer3_interrupt33:
UXTB	R0, R0
STRH	R0, [R1, #0]
;main.c,254 :: 		}
L_end_Timer3_interrupt:
BX	LR
; end of _Timer3_interrupt
_motor_1_init:
;main.c,257 :: 		void motor_1_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,258 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);        //Enable digital output for enable pin (D0) and direction pin (D1)
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;main.c,259 :: 		GPIOD_ODR.B0 = 0;                                                           //Turn on motor enable (active low)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;main.c,260 :: 		GPIOD_ODR.B1 = 1;                                                           //Set initial direction
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;main.c,261 :: 		}
L_end_motor_1_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_init
_motor_1_pwm_init:
;main.c,264 :: 		void motor_1_pwm_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,265 :: 		PWM_PERIOD = PWM_TIM1_Init(10000);                               // Set PWM base frequency
MOVW	R0, #10000
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_PWM_PERIOD+0)
MOVT	R1, #hi_addr(_PWM_PERIOD+0)
STRH	R0, [R1, #0]
;main.c,266 :: 		PWM_TIM1_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);          // PWM duty cycle to "current_duty" on Timer 1, channel 1
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;main.c,267 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);       // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;main.c,268 :: 		}
L_end_motor_1_pwm_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_pwm_init
