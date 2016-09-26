_main:
;AWD.c,184 :: 		void main() {
;AWD.c,185 :: 		GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_ALL);        // Set PORTD as output
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;AWD.c,186 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);                     // Choose ADC channel
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;AWD.c,188 :: 		GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_0 | _GPIO_PINMASK_1), (_GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO));
MOVS	R2, #65
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;AWD.c,189 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;AWD.c,191 :: 		ADC1_Init();                                               // Init
BL	_ADC1_Init+0
;AWD.c,192 :: 		ADC1_LTR = low_level;     //Setting max threshold
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;AWD.c,193 :: 		ADC1_HTR = high_level;    //Setting low threshold
MOVW	R1, #3695
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;AWD.c,194 :: 		ADC1_CR1bits.AWDIE = 1;   //Enable analog interrupt
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;AWD.c,195 :: 		ADC1_CR1bits.AWDEN = 1;    //Enable Analog watchdog on regular channels
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;AWD.c,205 :: 		while(1){
L_main0:
;AWD.c,207 :: 		if(ADC1_SRbits.AWD == 1){
MOVW	R1, #lo_addr(ADC1_SRbits+0)
MOVT	R1, #hi_addr(ADC1_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main2
;AWD.c,208 :: 		GPIOC_ODRbits.ODR13 ^= 1;
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;AWD.c,209 :: 		ADC1_SRbits.AWD = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;AWD.c,210 :: 		}
IT	AL
BAL	L_main3
L_main2:
;AWD.c,212 :: 		GPIOC_ODRbits.ODR13 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;AWD.c,213 :: 		}
L_main3:
;AWD.c,215 :: 		GPIOD_ODR = ADC1_Get_Sample(3);            // Get ADC value from corresponding channel
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R0, [R1, #0]
;AWD.c,216 :: 		Delay_ms(20);
MOVW	R7, #5886
MOVT	R7, #17
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;AWD.c,217 :: 		}
IT	AL
BAL	L_main0
;AWD.c,218 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
