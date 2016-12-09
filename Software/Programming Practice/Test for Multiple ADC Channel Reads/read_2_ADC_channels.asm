_main:
;read_2_ADC_channels.c,9 :: 		void main() {
SUB	SP, SP, #4
;read_2_ADC_channels.c,11 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_LOW);  // Enable digital output on PORTD/L
MOVW	R1, #255
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;read_2_ADC_channels.c,12 :: 		GPIOD_ODR = 0x0000;              // init all to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;read_2_ADC_channels.c,17 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);                    // set up for 2 input
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;read_2_ADC_channels.c,18 :: 		ADC1_Init();
BL	_ADC1_Init+0
;read_2_ADC_channels.c,21 :: 		channel1_value = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_channel1_value+0)
MOVT	R0, #hi_addr(_channel1_value+0)
STRH	R1, [R0, #0]
;read_2_ADC_channels.c,22 :: 		channel2_value = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_channel2_value+0)
MOVT	R0, #hi_addr(_channel2_value+0)
STRH	R1, [R0, #0]
;read_2_ADC_channels.c,24 :: 		while(1)
L_main0:
;read_2_ADC_channels.c,27 :: 		channel2_value = ADC1_Get_Sample(3);         // Pin A1 - EMG signal
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_channel2_value+0)
MOVT	R1, #hi_addr(_channel2_value+0)
STRH	R0, [R1, #0]
;read_2_ADC_channels.c,29 :: 		delay_ms(100);                // wait a little between tests
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;read_2_ADC_channels.c,37 :: 		if(channel2_value > THRESHOLD)                // some threshold
MOVW	R0, #lo_addr(_THRESHOLD+0)
MOVT	R0, #hi_addr(_THRESHOLD+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_channel2_value+0)
MOVT	R0, #hi_addr(_channel2_value+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	LS
BLS	L_main4
;read_2_ADC_channels.c,38 :: 		GPIOD_ODR.B1 = 1;              // Turn on D1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
IT	AL
BAL	L_main5
L_main4:
;read_2_ADC_channels.c,40 :: 		GPIOD_ODR.B1 = 0;              // Turn off D1
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
L_main5:
;read_2_ADC_channels.c,41 :: 		}
IT	AL
BAL	L_main0
;read_2_ADC_channels.c,42 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
