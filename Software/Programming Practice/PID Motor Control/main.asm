_timer4_ISR:
;main.c,32 :: 		void timer4_ISR() iv IVT_INT_TIM4 {
;main.c,33 :: 		TIM4_SR.UIF = 0;                   // Clear timer 4 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SR+0)
MOVT	R0, #hi_addr(TIM4_SR+0)
STR	R1, [R0, #0]
;main.c,34 :: 		sampleFlag = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
STRH	R1, [R0, #0]
;main.c,35 :: 		}
L_end_timer4_ISR:
BX	LR
; end of _timer4_ISR
_EnableInt:
;main.c,38 :: 		void EnableInt() iv IVT_INT_EXTI0 ics ICS_AUTO {
;main.c,39 :: 		EXTI_PR.B0 = 1;                     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;main.c,40 :: 		motorEnable = ~motorEnable;         // toggle enable
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,41 :: 		}
L_end_EnableInt:
BX	LR
; end of _EnableInt
_main:
;main.c,44 :: 		void main()
;main.c,46 :: 		srand(50);
MOVS	R0, #50
BL	_srand+0
;main.c,49 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_14 | _GPIO_PINMASK_15);
MOVW	R1, #49152
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;main.c,50 :: 		motorDirection = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,51 :: 		motorEnable = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,54 :: 		GPIO_Analog_Input(&GPIOB_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Analog_Input+0
;main.c,57 :: 		RCC_APB1ENR.TIM4EN = 1;                                                     // Enable clock for timer 4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;main.c,58 :: 		TIM4_CR1.CEN = 0;                                                           // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;main.c,59 :: 		TIM4_PSC = 279;                                                             // Set timer 4 prescaler
MOVW	R1, #279
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;main.c,60 :: 		TIM4_ARR = 59999;                                                           // Set timer 4 overflow value
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;main.c,61 :: 		NVIC_IntEnable(IVT_INT_TIM4);                                               // Enable timer 4 interrupt
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;main.c,62 :: 		TIM4_DIER.UIE = 1;                                                          // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_DIER+0)
MOVT	R0, #hi_addr(TIM4_DIER+0)
STR	R1, [R0, #0]
;main.c,65 :: 		PWM_TIM1_Init(1000);
MOVW	R0, #1000
BL	_PWM_TIM1_Init+0
;main.c,66 :: 		PWM_TIM1_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL1);  // Set current duty for PWM_TIM4
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;main.c,69 :: 		SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;main.c,70 :: 		SYSCFG_EXTICR1 = 0x00000033;         // Map external interrupt on PD0 and PD1
MOVS	R1, #51
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;main.c,71 :: 		EXTI_RTSR = 0x00000001;              // Set interrupt on Rising edge (PD0)
MOVS	R1, #1
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;main.c,72 :: 		EXTI_FTSR = 0x00000000;              // Set Interrupt on Falling edge (none)
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;main.c,73 :: 		EXTI_IMR |= 0x00000001;              // Unmask bit 0 to interrupt on tht line
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;main.c,74 :: 		NVIC_IntEnable(IVT_INT_EXTI0);       //Enable external interrupt for enable pin
MOVW	R0, #22
BL	_NVIC_IntEnable+0
;main.c,77 :: 		UART1_Init(115200);
MOV	R0, #115200
BL	_UART1_Init+0
;main.c,78 :: 		delay_ms(100);
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
;main.c,79 :: 		UART_Write_Text("\r\nStarted. ");
MOVW	R0, #lo_addr(?lstr1_main+0)
MOVT	R0, #hi_addr(?lstr1_main+0)
BL	_UART_Write_Text+0
;main.c,82 :: 		UART1_Write_Text("\nNotes:");
MOVW	R0, #lo_addr(?lstr2_main+0)
MOVT	R0, #hi_addr(?lstr2_main+0)
BL	_UART1_Write_Text+0
;main.c,83 :: 		UART1_Write_Text("\n- K = ");
MOVW	R0, #lo_addr(?lstr3_main+0)
MOVT	R0, #hi_addr(?lstr3_main+0)
BL	_UART1_Write_Text+0
;main.c,84 :: 		FloatToStr(K, ToStr);
MOVW	R0, #52429
MOVT	R0, #16332
VMOV	S0, R0
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_FloatToStr+0
;main.c,85 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,86 :: 		UART1_Write_Text("\n- SP = ");
MOVW	R0, #lo_addr(?lstr4_main+0)
MOVT	R0, #hi_addr(?lstr4_main+0)
BL	_UART1_Write_Text+0
;main.c,87 :: 		IntToStr(setP, ToStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,88 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,89 :: 		UART1_Write_Text("\n- Margin = ");
MOVW	R0, #lo_addr(?lstr5_main+0)
MOVT	R0, #hi_addr(?lstr5_main+0)
BL	_UART1_Write_Text+0
;main.c,90 :: 		IntToStr(margin, ToStr);
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
MOVW	R0, #2
SXTH	R0, R0
BL	_IntToStr+0
;main.c,91 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,93 :: 		TIM4_CR1.CEN = 1;    // start 10 Hz timer
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;main.c,94 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;main.c,96 :: 		for(i = 0; i < 100; i++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main2:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #100
IT	GE
BGE	L_main3
;main.c,97 :: 		MPV = getForce();   // set up the first 100 samples
BL	_getForce+0
VMOV	S0, R0
VCVT.F32	#1, S0, S0
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
VSTR	#1, S0, [R0, #0]
;main.c,96 :: 		for(i = 0; i < 100; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;main.c,97 :: 		MPV = getForce();   // set up the first 100 samples
IT	AL
BAL	L_main2
L_main3:
;main.c,99 :: 		while(1)
L_main5:
;main.c,101 :: 		if(motorEnable)
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main7
;main.c,103 :: 		if(sampleFlag)
MOVW	R0, #lo_addr(_sampleFlag+0)
MOVT	R0, #hi_addr(_sampleFlag+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main8
;main.c,105 :: 		MPV = analogIn;
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
STR	R1, [R0, #0]
;main.c,106 :: 		FloatToStr(MPV, ToStr);
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_FloatToStr+0
;main.c,107 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,136 :: 		}
L_main8:
;main.c,137 :: 		}
L_main7:
;main.c,138 :: 		}
IT	AL
BAL	L_main5
;main.c,139 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Pcontrol:
;main.c,142 :: 		int Pcontrol(int setP, int MPV)   // must return duty cycle which is an int
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
;main.c,144 :: 		if((setP-MPV) < 0)
SUB	R2, R4, R5
SXTH	R2, R2
CMP	R2, #0
IT	GE
BGE	L_Pcontrol9
;main.c,145 :: 		motorDirection = ~motorDirection; // handle direction change
MOVW	R3, #lo_addr(GPIOE_ODR+0)
MOVT	R3, #hi_addr(GPIOE_ODR+0)
LDR	R2, [R3, #0]
EOR	R3, R2, #1
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
L_Pcontrol9:
;main.c,146 :: 		if(abs(setP-MPV) > 60)
SUB	R2, R4, R5
SXTH	R0, R2
BL	_abs+0
CMP	R0, #60
IT	LE
BLE	L_Pcontrol10
; setP end address is: 16 (R4)
; MPV end address is: 20 (R5)
;main.c,147 :: 		return 100;       // cap duty cycle
MOVS	R0, #100
SXTH	R0, R0
IT	AL
BAL	L_end_Pcontrol
L_Pcontrol10:
;main.c,148 :: 		else if(abs(setP-MPV) > 10)
; MPV start address is: 20 (R5)
; setP start address is: 16 (R4)
SUB	R2, R4, R5
SXTH	R0, R2
BL	_abs+0
CMP	R0, #10
IT	LE
BLE	L_Pcontrol12
;main.c,149 :: 		return (int)(K*abs(setP - MPV));
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
L_Pcontrol12:
;main.c,151 :: 		return 20;         // boost duty cycle
MOVS	R0, #20
SXTH	R0, R0
;main.c,152 :: 		}
L_end_Pcontrol:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pcontrol
_moveFinger:
;main.c,154 :: 		void moveFinger(int dutyCycle)
; dutyCycle start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; dutyCycle end address is: 0 (R0)
; dutyCycle start address is: 0 (R0)
;main.c,156 :: 		PWM_TIM1_Set_Duty(dutyCycle, _PWM_NON_INVERTED, _PWM_CHANNEL1);       // set new duty cycle
MOVS	R2, #0
MOVS	R1, #0
UXTH	R0, R0
; dutyCycle end address is: 0 (R0)
BL	_PWM_TIM1_Set_Duty+0
;main.c,157 :: 		}
L_end_moveFinger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _moveFinger
_getForce:
;main.c,159 :: 		int getForce()
;main.c,164 :: 		measure = analogIn;
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
; measure start address is: 8 (R2)
VLDR	#1, S2, [R0, #0]
;main.c,165 :: 		averageForceReading = (((averageForceReading * 99) + measure) / 100);
MOVW	R1, #lo_addr(_averageForceReading+0)
MOVT	R1, #hi_addr(_averageForceReading+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #0
MOVT	R0, #17094
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VADD.F32	S1, S0, S2
; measure end address is: 8 (R2)
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S1, S1, S0
VSTR	#1, S1, [R1, #0]
;main.c,167 :: 		return (int)(averageForceReading * 100);       //Converts read value to value between 0 and 100
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
;main.c,168 :: 		}
L_end_getForce:
BX	LR
; end of _getForce
