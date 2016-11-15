_timer4_ISR:
;main.c,37 :: 		void timer4_ISR() iv IVT_INT_TIM4 {
;main.c,38 :: 		TIM4_SR.UIF = 0;                   // Clear timer 4 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SR+0)
MOVT	R0, #hi_addr(TIM4_SR+0)
STR	R1, [R0, #0]
;main.c,39 :: 		sampleFlag = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
STRH	R1, [R0, #0]
;main.c,40 :: 		}
L_end_timer4_ISR:
BX	LR
; end of _timer4_ISR
_main:
;main.c,43 :: 		void main()
;main.c,45 :: 		srand(50);
MOVS	R0, #50
BL	_srand+0
;main.c,48 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_14);
MOVW	R1, #16384
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;main.c,49 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;main.c,50 :: 		motorDirection = CONTRACT;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R2, [R0, #0]
;main.c,51 :: 		motorEnable = 0;        // enabled initially
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;main.c,54 :: 		RCC_APB1ENR.TIM4EN = 1;                                                     // Enable clock for timer 4
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R2, [R0, #0]
;main.c,55 :: 		TIM4_CR1.CEN = 0;                                                           // Disable timer/counter
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;main.c,56 :: 		TIM4_PSC = 279;                                                             // Set timer 4 prescaler
MOVW	R1, #279
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;main.c,57 :: 		TIM4_ARR = 59999;                                                           // Set timer 4 overflow value
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;main.c,58 :: 		NVIC_IntEnable(IVT_INT_TIM4);                                               // Enable timer 4 interrupt
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;main.c,59 :: 		TIM4_DIER.UIE = 1;                                                          // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_DIER+0)
MOVT	R0, #hi_addr(TIM4_DIER+0)
STR	R1, [R0, #0]
;main.c,62 :: 		PWM_TIM1_Init(1000);
MOVW	R0, #1000
BL	_PWM_TIM1_Init+0
;main.c,63 :: 		PWM_TIM1_Set_Duty(30, _PWM_NON_INVERTED, _PWM_CHANNEL1);  // Set current duty for PWM_TIM1
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #30
BL	_PWM_TIM1_Set_Duty+0
;main.c,66 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_0);
MOVW	R0, #1
BL	_ADC_Set_Input_Channel+0
;main.c,67 :: 		ADC1_Init();
BL	_ADC1_Init+0
;main.c,70 :: 		UART1_Init(115200);
MOV	R0, #115200
BL	_UART1_Init+0
;main.c,71 :: 		delay_ms(100);
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
;main.c,72 :: 		UART_Write_Text("\r\nStarted. ");
MOVW	R0, #lo_addr(?lstr1_main+0)
MOVT	R0, #hi_addr(?lstr1_main+0)
BL	_UART_Write_Text+0
;main.c,75 :: 		UART1_Write_Text("\nNotes:");
MOVW	R0, #lo_addr(?lstr2_main+0)
MOVT	R0, #hi_addr(?lstr2_main+0)
BL	_UART1_Write_Text+0
;main.c,76 :: 		UART1_Write_Text("\n- K = ");
MOVW	R0, #lo_addr(?lstr3_main+0)
MOVT	R0, #hi_addr(?lstr3_main+0)
BL	_UART1_Write_Text+0
;main.c,77 :: 		FloatToStr(K, ToStr);
MOVW	R0, #52429
MOVT	R0, #16332
VMOV	S0, R0
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_FloatToStr+0
;main.c,78 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,79 :: 		UART1_Write_Text("\n- SP = ");
MOVW	R0, #lo_addr(?lstr4_main+0)
MOVT	R0, #hi_addr(?lstr4_main+0)
BL	_UART1_Write_Text+0
;main.c,80 :: 		IntToStr(setP, ToStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,81 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,82 :: 		UART1_Write_Text("\n- Margin = ");
MOVW	R0, #lo_addr(?lstr5_main+0)
MOVT	R0, #hi_addr(?lstr5_main+0)
BL	_UART1_Write_Text+0
;main.c,83 :: 		IntToStr(margin, ToStr);
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
MOVW	R0, #4
SXTH	R0, R0
BL	_IntToStr+0
;main.c,84 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,86 :: 		TIM4_CR1.CEN = 1;    // start 10 Hz timer
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;main.c,87 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;main.c,89 :: 		for(i = 0; i < 5; i++)
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
;main.c,90 :: 		MPV = getForce();   // set up the first 5 samples - HMMMM
BL	_getForce+0
MOVW	R1, #lo_addr(_MPV+0)
MOVT	R1, #hi_addr(_MPV+0)
STRH	R0, [R1, #0]
;main.c,89 :: 		for(i = 0; i < 5; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;main.c,90 :: 		MPV = getForce();   // set up the first 5 samples - HMMMM
IT	AL
BAL	L_main2
L_main3:
;main.c,92 :: 		while(1)
L_main5:
;main.c,94 :: 		if(~motorEnable)                 // active low
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
UXTB	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L_main7
;main.c,96 :: 		if(sampleFlag)
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main8
;main.c,98 :: 		if(abs(MPV - setP) >= margin)
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRSH	R0, [R0, #0]
SUB	R0, R0, R1
BL	_abs+0
CMP	R0, #4
IT	LT
BLT	L_main9
;main.c,100 :: 		sampleFlag = 0;   // reset interrupt flag
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
STRH	R1, [R0, #0]
;main.c,101 :: 		MPV = getForce();   // sample
BL	_getForce+0
MOVW	R1, #lo_addr(_MPV+0)
MOVT	R1, #hi_addr(_MPV+0)
STRH	R0, [R1, #0]
;main.c,103 :: 		UART1_Write_Text("\n\nCurrent force = ");
MOVW	R0, #lo_addr(?lstr6_main+0)
MOVT	R0, #hi_addr(?lstr6_main+0)
BL	_UART1_Write_Text+0
;main.c,104 :: 		IntToStr(MPV, ToStr);
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,105 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,107 :: 		dutyCycle = Pcontrol(setP, MPV);
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
;main.c,109 :: 		UART1_Write_Text("\nPID control returns ");
MOVW	R0, #lo_addr(?lstr7_main+0)
MOVT	R0, #hi_addr(?lstr7_main+0)
BL	_UART1_Write_Text+0
;main.c,110 :: 		IntToStr(dutyCycle, toStr);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,111 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,113 :: 		UART1_Write_Text("\nDirection = ");
MOVW	R0, #lo_addr(?lstr8_main+0)
MOVT	R0, #hi_addr(?lstr8_main+0)
BL	_UART1_Write_Text+0
;main.c,114 :: 		IntToStr(motorDirection, ToStr);
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,115 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,117 :: 		UART1_Write_Text("\nSetpoint = ");
MOVW	R0, #lo_addr(?lstr9_main+0)
MOVT	R0, #hi_addr(?lstr9_main+0)
BL	_UART1_Write_Text+0
;main.c,118 :: 		IntToStr(setP, ToStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,119 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,121 :: 		moveFinger(dutyCycle);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
BL	_moveFinger+0
;main.c,122 :: 		}
IT	AL
BAL	L_main10
L_main9:
;main.c,125 :: 		myFlag = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_myFlag+0)
MOVT	R0, #hi_addr(_myFlag+0)
STRH	R1, [R0, #0]
;main.c,126 :: 		if(stabilized == 2)  // must stabilize for three cycles - for larger margin of error
MOVW	R0, #lo_addr(_stabilized+0)
MOVT	R0, #hi_addr(_stabilized+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_main11
;main.c,128 :: 		moveFinger(0);       // stop the motor
MOVS	R0, #0
SXTH	R0, R0
BL	_moveFinger+0
;main.c,129 :: 		PWM_TIM1_Stop(_PWM_CHANNEL1);                       // stop PWM
MOVS	R0, #0
BL	_PWM_TIM1_Stop+0
;main.c,130 :: 		TIM1_CR1.CEN = 0;                                   // stop the PWM timer
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM1_CR1+0)
MOVT	R0, #hi_addr(TIM1_CR1+0)
STR	R1, [R0, #0]
;main.c,131 :: 		sampleFlag = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
STRH	R1, [R0, #0]
;main.c,132 :: 		NVIC_IntDisable(IVT_INT_TIM4);                    // stop sampling
MOVW	R0, #46
BL	_NVIC_IntDisable+0
;main.c,133 :: 		UART_Write_Text("\n** PV stabilized at ");
MOVW	R0, #lo_addr(?lstr10_main+0)
MOVT	R0, #hi_addr(?lstr10_main+0)
BL	_UART_Write_Text+0
;main.c,134 :: 		IntToStr(MPV, toStr);
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
;main.c,137 :: 		delay_ms(2000);         // observe stabilization for two seconds
MOVW	R7, #64510
MOVT	R7, #1708
NOP
NOP
L_main12:
SUBS	R7, R7, #1
BNE	L_main12
NOP
NOP
NOP
;main.c,139 :: 		setP = (rand() % 95) + 20;    // generate a new setpoint
BL	_rand+0
MOVS	R2, #95
SXTH	R2, R2
SDIV	R1, R0, R2
MLS	R1, R2, R1, R0
SXTH	R1, R1
ADDS	R1, #20
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
STRH	R1, [R0, #0]
;main.c,140 :: 		UART_Write_Text("\n** New SP = ");   // display it
MOVW	R0, #lo_addr(?lstr11_main+0)
MOVT	R0, #hi_addr(?lstr11_main+0)
BL	_UART_Write_Text+0
;main.c,141 :: 		IntToStr(setP, toStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,142 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,143 :: 		moveFinger(60);       // start the motor
MOVS	R0, #60
SXTH	R0, R0
BL	_moveFinger+0
;main.c,144 :: 		TIM1_CR1.CEN = 1;                    // start the PWM timer
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM1_CR1+0)
MOVT	R0, #hi_addr(TIM1_CR1+0)
STR	R1, [R0, #0]
;main.c,145 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);      // restart PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;main.c,146 :: 		NVIC_IntEnable(IVT_INT_TIM4);            // start sampling again
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;main.c,147 :: 		stabilized = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_stabilized+0)
MOVT	R0, #hi_addr(_stabilized+0)
STRH	R1, [R0, #0]
;main.c,148 :: 		myFlag = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_myFlag+0)
MOVT	R0, #hi_addr(_myFlag+0)
STRH	R1, [R0, #0]
;main.c,149 :: 		}
IT	AL
BAL	L_main14
L_main11:
;main.c,152 :: 		stabilized++;    // wait 3 cycles for stabilization
MOVW	R1, #lo_addr(_stabilized+0)
MOVT	R1, #hi_addr(_stabilized+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;main.c,153 :: 		}
L_main14:
;main.c,154 :: 		}
L_main10:
;main.c,155 :: 		}
L_main8:
;main.c,156 :: 		}
L_main7:
;main.c,157 :: 		}
IT	AL
BAL	L_main5
;main.c,158 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Pcontrol:
;main.c,161 :: 		int Pcontrol(int setP, int MPV)   // must return duty cycle which is an int
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
;main.c,163 :: 		if((setP-MPV) < 0)
SUB	R2, R4, R5
SXTH	R2, R2
CMP	R2, #0
IT	GE
BGE	L_Pcontrol15
;main.c,164 :: 		motorDirection = EXTEND; // handle direction change
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
IT	AL
BAL	L_Pcontrol16
L_Pcontrol15:
;main.c,166 :: 		motorDirection = CONTRACT;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
L_Pcontrol16:
;main.c,168 :: 		if(abs(setP-MPV) > 60)
SUB	R2, R4, R5
SXTH	R0, R2
BL	_abs+0
CMP	R0, #60
IT	LE
BLE	L_Pcontrol17
; setP end address is: 16 (R4)
; MPV end address is: 20 (R5)
;main.c,169 :: 		return 80;       // cap duty cycle
MOVS	R0, #80
SXTH	R0, R0
IT	AL
BAL	L_end_Pcontrol
L_Pcontrol17:
;main.c,170 :: 		else if(abs(setP-MPV) >= 10)
; MPV start address is: 20 (R5)
; setP start address is: 16 (R4)
SUB	R2, R4, R5
SXTH	R0, R2
BL	_abs+0
CMP	R0, #10
IT	LT
BLT	L_Pcontrol19
;main.c,171 :: 		return (int)(K*abs(setP - MPV));
SUB	R2, R4, R5
; setP end address is: 16 (R4)
; MPV end address is: 20 (R5)
SXTH	R0, R2
BL	_abs+0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R2, #52429
MOVT	R2, #16332
VMOV	S0, R2
VMUL.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
SXTH	R0, R2
IT	AL
BAL	L_end_Pcontrol
L_Pcontrol19:
;main.c,173 :: 		return 20;         // boost duty cycle
MOVS	R0, #20
SXTH	R0, R0
;main.c,174 :: 		}
L_end_Pcontrol:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pcontrol
_moveFinger:
;main.c,176 :: 		void moveFinger(int dutyCycle)
; dutyCycle start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; dutyCycle end address is: 0 (R0)
; dutyCycle start address is: 0 (R0)
;main.c,178 :: 		if(!myFlag)
MOVW	R1, #lo_addr(_myFlag+0)
MOVT	R1, #hi_addr(_myFlag+0)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_moveFinger21
;main.c,179 :: 		PWM_TIM1_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL1);       // set new duty cycle
MOVS	R2, #0
MOVS	R1, #0
UXTH	R0, R0
; dutyCycle end address is: 0 (R0)
BL	_PWM_TIM1_Set_Duty+0
L_moveFinger21:
;main.c,180 :: 		}
L_end_moveFinger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _moveFinger
_getForce:
;main.c,182 :: 		int getForce()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,187 :: 		measure = ADC1_Get_Sample(0);         // read analog value from channel 0
MOVS	R0, #0
BL	_ADC1_Get_Sample+0
;main.c,188 :: 		averageForceReading = (((averageForceReading * 4) + measure) / 5);
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
;main.c,190 :: 		return (int)(averageForceReading*100/(3700-350));       //Converts read value to value between 0 and 100
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
;main.c,191 :: 		}
L_end_getForce:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _getForce
