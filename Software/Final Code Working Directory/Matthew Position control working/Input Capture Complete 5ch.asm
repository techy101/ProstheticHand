_main:
;Input Capture Complete 5ch.c,219 :: 		void main() {
SUB	SP, SP, #8
;Input Capture Complete 5ch.c,221 :: 		INITIAL_DIRECTION = EXTEND;
MOVW	R0, #lo_addr(_EXTEND+0)
MOVT	R0, #hi_addr(_EXTEND+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_INITIAL_DIRECTION+0)
MOVT	R0, #hi_addr(_INITIAL_DIRECTION+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,224 :: 		init_UART();                                                            // Configure and Initialize UART serial communications
BL	_init_UART+0
;Input Capture Complete 5ch.c,225 :: 		init_GPIO();                                                            // Configure MCU I/O
BL	_init_GPIO+0
;Input Capture Complete 5ch.c,228 :: 		pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);                                   // Set PWM base frequency to 10000 Hz
MOVW	R0, #lo_addr(_PWM_FREQ_HZ+0)
MOVT	R0, #hi_addr(_PWM_FREQ_HZ+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,229 :: 		PWM_TIM4_Init(PWM_FREQ_HZ);                                   // Set PWM base frequency to 10000 Hz
LDR	R0, [SP, #4]
LDR	R0, [R0, #0]
BL	_PWM_TIM4_Init+0
;Input Capture Complete 5ch.c,232 :: 		init_pointer_PWM();
BL	_init_pointer_PWM+0
;Input Capture Complete 5ch.c,233 :: 		init_middle_PWM();
BL	_init_middle_PWM+0
;Input Capture Complete 5ch.c,234 :: 		init_ring_PWM();
BL	_init_ring_PWM+0
;Input Capture Complete 5ch.c,235 :: 		init_pinky_PWM();
BL	_init_pinky_PWM+0
;Input Capture Complete 5ch.c,236 :: 		init_thumb_PWM();
BL	_init_thumb_PWM+0
;Input Capture Complete 5ch.c,239 :: 		InitTimer5();                  // Timer3 init
BL	_InitTimer5+0
;Input Capture Complete 5ch.c,244 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);     // Set active ADC channels
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,245 :: 		ADC1_Init();                                                // Initialize ADC1
BL	_ADC1_Init+0
;Input Capture Complete 5ch.c,248 :: 		ADC1_LTR = low_level;        // Set AWD guard window initial lower threshold
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,249 :: 		ADC1_HTR = high_level;       // Set AWD guard window initial upper threshold
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,250 :: 		ADC1_CR2bits.CONT = 1;       // Enable ADC1 continuous conversion mode
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,251 :: 		ADC1_SQR3bits.SQ1 = 3;       // Set first channel in continuous coversion sequence to channel 3
MOVS	R2, #3
MOVW	R1, #lo_addr(ADC1_SQR3bits+0)
MOVT	R1, #hi_addr(ADC1_SQR3bits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #0, #5
STRB	R0, [R1, #0]
;Input Capture Complete 5ch.c,252 :: 		ADC1_SQR3bits.SQ2 = 4;       // Set second channel in continuous coversion sequence to channel 4 - NEW
MOVS	R2, #4
MOVW	R1, #lo_addr(ADC1_SQR3bits+0)
MOVT	R1, #hi_addr(ADC1_SQR3bits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #5, #5
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,253 :: 		ADC1_CR1bits.AWDSGL = 1;     // Enable single channel monitoring mode for AWD
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,254 :: 		ADC1_CR1 |= 3;               // Set channel 3 as the single monitored AWD channel
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,255 :: 		ADC1_CR1bits.AWDEN = 1;      // Enable Analog watchdog on regular channels
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,256 :: 		ADC1_CR2bits.SWSTART = 1;    // Start ADC1 Conversions
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,257 :: 		ADC1_CR1bits.AWDIE = 1;      // Enable analog watchdog interrupt
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,258 :: 		NVIC_IntEnable(IVT_INT_ADC); // Enable global ADC interrupt
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,261 :: 		strcpy(fngr_pointer.name, "fngr_pointer");
MOVW	R0, #lo_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,262 :: 		strcpy(fngr_middle.name, "fngr_middle");
MOVW	R0, #lo_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,263 :: 		strcpy(fngr_ring.name, "fngr_ring");
MOVW	R0, #lo_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,264 :: 		strcpy(fngr_pinky.name, "fngr_pinky");
MOVW	R0, #lo_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,265 :: 		strcpy(fngr_thumb.name, "fngr_thumb");
MOVW	R0, #lo_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,268 :: 		init_finger(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,269 :: 		init_finger(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,270 :: 		init_finger(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,271 :: 		init_finger(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,272 :: 		init_finger(&fngr_thumb);
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,275 :: 		UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
MOVW	R0, #lo_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,276 :: 		delay_ms(500);
MOVW	R7, #16126
MOVT	R7, #427
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;Input Capture Complete 5ch.c,279 :: 		init_timer11();                                                         // Initialize timer 11, used for sampling
BL	_init_timer11+0
;Input Capture Complete 5ch.c,280 :: 		init_input_capture();                                                   // Initialize input capture channels
BL	_init_input_capture+0
;Input Capture Complete 5ch.c,287 :: 		while(1) {
L_main2:
;Input Capture Complete 5ch.c,290 :: 		if (GRAB_MODE_BUTTON == 0) {
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main4
;Input Capture Complete 5ch.c,291 :: 		PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,292 :: 		}
IT	AL
BAL	L_main5
L_main4:
;Input Capture Complete 5ch.c,294 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,295 :: 		}
L_main5:
;Input Capture Complete 5ch.c,298 :: 		if (PINCH_MODE_BUTTON == 0) {
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main6
;Input Capture Complete 5ch.c,299 :: 		PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,300 :: 		}
IT	AL
BAL	L_main7
L_main6:
;Input Capture Complete 5ch.c,302 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,303 :: 		}
L_main7:
;Input Capture Complete 5ch.c,306 :: 		if (POINT_MODE_BUTTON == 0) {
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main8
;Input Capture Complete 5ch.c,307 :: 		PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);
MOVS	R2, #2
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,308 :: 		}
IT	AL
BAL	L_main9
L_main8:
;Input Capture Complete 5ch.c,310 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,311 :: 		}
L_main9:
;Input Capture Complete 5ch.c,314 :: 		if (SHAKE_MODE_BUTTON == 0) {
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main10
;Input Capture Complete 5ch.c,315 :: 		PWM_TIM4_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM4_Set_Duty+0
;Input Capture Complete 5ch.c,316 :: 		}
IT	AL
BAL	L_main11
L_main10:
;Input Capture Complete 5ch.c,318 :: 		PWM_TIM4_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;Input Capture Complete 5ch.c,319 :: 		}
L_main11:
;Input Capture Complete 5ch.c,323 :: 		if (poll_flag) {                                                     // Calculate finger state values (Set by timer 3)
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main12
;Input Capture Complete 5ch.c,324 :: 		poll_flag = 0;                                                    // Clear flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,325 :: 		calc_finger_state(&fngr_pointer);                                 // Call state calculation function for each finger - equivalent of sampling
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_calc_finger_state+0
;Input Capture Complete 5ch.c,326 :: 		calc_finger_state(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_calc_finger_state+0
;Input Capture Complete 5ch.c,327 :: 		calc_finger_state(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_calc_finger_state+0
;Input Capture Complete 5ch.c,328 :: 		calc_finger_state(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_calc_finger_state+0
;Input Capture Complete 5ch.c,329 :: 		calc_finger_state(&fngr_thumb);
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_calc_finger_state+0
;Input Capture Complete 5ch.c,331 :: 		}
L_main12:
;Input Capture Complete 5ch.c,333 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main66
MOVW	R0, #lo_addr(_TERMINAL_PRINT_THRESH+0)
MOVT	R0, #hi_addr(_TERMINAL_PRINT_THRESH+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_terminal_print_count+0)
MOVT	R0, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L__main65
L__main64:
;Input Capture Complete 5ch.c,335 :: 		print_finger_info(&fngr_pointer);                                 // Print statistics to terminal for each finger
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,336 :: 		print_finger_info(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,337 :: 		print_finger_info(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,338 :: 		print_finger_info(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,339 :: 		print_finger_info(&fngr_thumb);
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,340 :: 		UART1_Write_Text("\n\n\n\n\n\n\n\r");
MOVW	R0, #lo_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,333 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
L__main66:
L__main65:
;Input Capture Complete 5ch.c,342 :: 		}
IT	AL
BAL	L_main2
;Input Capture Complete 5ch.c,346 :: 		} // Main ends here
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Pcontrol_position:
;Input Capture Complete 5ch.c,355 :: 		unsigned int Pcontrol_position(struct finger *fngr, unsigned long SP, unsigned long MPV)
; MPV start address is: 8 (R2)
; SP start address is: 4 (R1)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; MPV end address is: 8 (R2)
; SP end address is: 4 (R1)
; fngr end address is: 0 (R0)
; fngr start address is: 0 (R0)
; SP start address is: 4 (R1)
; MPV start address is: 8 (R2)
;Input Capture Complete 5ch.c,359 :: 		if((SP-MPV) < 0)                // moved past SP
SUB	R3, R1, R2
CMP	R3, #0
IT	CS
BCS	L_Pcontrol_position16
;Input Capture Complete 5ch.c,360 :: 		fngr->direction_desired = EXTEND;              // Move back
ADDW	R4, R0, #26
; fngr end address is: 0 (R0)
MOVW	R3, #lo_addr(_EXTEND+0)
MOVT	R3, #hi_addr(_EXTEND+0)
LDRSH	R3, [R3, #0]
STRH	R3, [R4, #0]
IT	AL
BAL	L_Pcontrol_position17
L_Pcontrol_position16:
;Input Capture Complete 5ch.c,362 :: 		fngr->direction_desired = CONTRACT;         // Keep going
; fngr start address is: 0 (R0)
ADDW	R4, R0, #26
; fngr end address is: 0 (R0)
MOVW	R3, #lo_addr(_CONTRACT+0)
MOVT	R3, #hi_addr(_CONTRACT+0)
LDRSH	R3, [R3, #0]
STRH	R3, [R4, #0]
L_Pcontrol_position17:
;Input Capture Complete 5ch.c,364 :: 		duty_cycle = K*abs(SP-MPV);    // proportional control
SUB	R3, R1, R2
; SP end address is: 4 (R1)
; MPV end address is: 8 (R2)
SXTH	R0, R3
BL	_abs+0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R3, #0
MOVT	R3, #17530
VMOV	S0, R3
VMUL.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
UXTH	R3, R3
; duty_cycle start address is: 0 (R0)
UXTH	R0, R3
;Input Capture Complete 5ch.c,366 :: 		if(duty_cycle > 100)
CMP	R3, #100
IT	LS
BLS	L_Pcontrol_position18
;Input Capture Complete 5ch.c,367 :: 		duty_cycle = 100;       // cap duty cycle
MOVS	R0, #100
IT	AL
BAL	L_Pcontrol_position19
L_Pcontrol_position18:
;Input Capture Complete 5ch.c,368 :: 		else if(duty_cycle < 20)
CMP	R0, #20
IT	CS
BCS	L__Pcontrol_position67
;Input Capture Complete 5ch.c,369 :: 		duty_cycle = 20;       // boost duty cycle
MOVS	R0, #20
; duty_cycle end address is: 0 (R0)
IT	AL
BAL	L_Pcontrol_position20
L__Pcontrol_position67:
;Input Capture Complete 5ch.c,368 :: 		else if(duty_cycle < 20)
;Input Capture Complete 5ch.c,369 :: 		duty_cycle = 20;       // boost duty cycle
L_Pcontrol_position20:
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
L_Pcontrol_position19:
;Input Capture Complete 5ch.c,371 :: 		return duty_cycle;
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
;Input Capture Complete 5ch.c,372 :: 		}
L_end_Pcontrol_position:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pcontrol_position
_move_finger:
;Input Capture Complete 5ch.c,376 :: 		void move_finger(struct finger *fngr, unsigned int duty_cycle)
; duty_cycle start address is: 4 (R1)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
UXTH	R6, R1
; duty_cycle end address is: 4 (R1)
; fngr end address is: 0 (R0)
; fngr start address is: 16 (R4)
; duty_cycle start address is: 24 (R6)
;Input Capture Complete 5ch.c,378 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0) {
MOVW	R2, #lo_addr(?lstr8_Input_32Capture_32Complete_325ch+0)
MOVT	R2, #hi_addr(?lstr8_Input_32Capture_32Complete_325ch+0)
MOV	R1, R2
MOV	R0, R4
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_finger21
; fngr end address is: 16 (R4)
;Input Capture Complete 5ch.c,379 :: 		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);       // set new duty cycle
MOVW	R2, #lo_addr(_pwm_period+0)
MOVT	R2, #hi_addr(_pwm_period+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R6, R2
; duty_cycle end address is: 24 (R6)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,380 :: 		}
IT	AL
BAL	L_move_finger22
L_move_finger21:
;Input Capture Complete 5ch.c,382 :: 		else if(strcmp(fngr->name, "fngr_middle") == 0) {
; duty_cycle start address is: 24 (R6)
; fngr start address is: 16 (R4)
MOVW	R2, #lo_addr(?lstr9_Input_32Capture_32Complete_325ch+0)
MOVT	R2, #hi_addr(?lstr9_Input_32Capture_32Complete_325ch+0)
MOV	R1, R2
MOV	R0, R4
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_finger23
; fngr end address is: 16 (R4)
;Input Capture Complete 5ch.c,383 :: 		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);
MOVW	R2, #lo_addr(_pwm_period+0)
MOVT	R2, #hi_addr(_pwm_period+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R6, R2
; duty_cycle end address is: 24 (R6)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #1
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,384 :: 		}
IT	AL
BAL	L_move_finger24
L_move_finger23:
;Input Capture Complete 5ch.c,386 :: 		else if(strcmp(fngr->name, "fngr_ring") == 0) {
; duty_cycle start address is: 24 (R6)
; fngr start address is: 16 (R4)
MOVW	R2, #lo_addr(?lstr10_Input_32Capture_32Complete_325ch+0)
MOVT	R2, #hi_addr(?lstr10_Input_32Capture_32Complete_325ch+0)
MOV	R1, R2
MOV	R0, R4
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_finger25
; fngr end address is: 16 (R4)
;Input Capture Complete 5ch.c,387 :: 		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);
MOVW	R2, #lo_addr(_pwm_period+0)
MOVT	R2, #hi_addr(_pwm_period+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R6, R2
; duty_cycle end address is: 24 (R6)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #2
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,388 :: 		}
IT	AL
BAL	L_move_finger26
L_move_finger25:
;Input Capture Complete 5ch.c,390 :: 		else if(strcmp(fngr->name, "fngr_pinky") == 0) {
; duty_cycle start address is: 24 (R6)
; fngr start address is: 16 (R4)
MOVW	R2, #lo_addr(?lstr11_Input_32Capture_32Complete_325ch+0)
MOVT	R2, #hi_addr(?lstr11_Input_32Capture_32Complete_325ch+0)
MOV	R1, R2
MOV	R0, R4
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_finger27
; fngr end address is: 16 (R4)
;Input Capture Complete 5ch.c,391 :: 		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, PINKY_PWM);
MOVW	R2, #lo_addr(_pwm_period+0)
MOVT	R2, #hi_addr(_pwm_period+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R6, R2
; duty_cycle end address is: 24 (R6)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #3
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,392 :: 		}
IT	AL
BAL	L_move_finger28
L_move_finger27:
;Input Capture Complete 5ch.c,394 :: 		else if(strcmp(fngr->name, "fngr_thumb") == 0) {
; duty_cycle start address is: 24 (R6)
; fngr start address is: 16 (R4)
MOVW	R2, #lo_addr(?lstr12_Input_32Capture_32Complete_325ch+0)
MOVT	R2, #hi_addr(?lstr12_Input_32Capture_32Complete_325ch+0)
MOV	R1, R2
MOV	R0, R4
; fngr end address is: 16 (R4)
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_finger29
;Input Capture Complete 5ch.c,395 :: 		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);
MOVW	R2, #lo_addr(_pwm_period+0)
MOVT	R2, #hi_addr(_pwm_period+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R6, R2
; duty_cycle end address is: 24 (R6)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,396 :: 		}
L_move_finger29:
L_move_finger28:
L_move_finger26:
L_move_finger24:
L_move_finger22:
;Input Capture Complete 5ch.c,397 :: 		}
L_end_move_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _move_finger
_timer2_ISR:
;Input Capture Complete 5ch.c,403 :: 		void timer2_ISR() iv IVT_INT_TIM2 {
;Input Capture Complete 5ch.c,406 :: 		if(TIM2_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR30
;Input Capture Complete 5ch.c,407 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,408 :: 		tim2_overflow_count++;                                                  // Increment timer 2 overflow counter
MOVW	R1, #lo_addr(_tim2_overflow_count+0)
MOVT	R1, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,409 :: 		}
L_timer2_ISR30:
;Input Capture Complete 5ch.c,413 :: 		if (TIM2_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR31
;Input Capture Complete 5ch.c,414 :: 		fngr_thumb.enc_start_time = fngr_thumb.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+36)
MOVT	R2, #hi_addr(_fngr_thumb+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+32)
MOVT	R0, #hi_addr(_fngr_thumb+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,415 :: 		fngr_thumb.enc_end_time = TIM2_CCR1;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,416 :: 		fngr_thumb.enc_overflow_start = fngr_thumb.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+48)
MOVT	R2, #hi_addr(_fngr_thumb+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+44)
MOVT	R0, #hi_addr(_fngr_thumb+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,417 :: 		fngr_thumb.enc_overflow_end = tim2_overflow_count;                      // Store number of timer 2 overflows for thumb
MOVW	R0, #lo_addr(_tim2_overflow_count+0)
MOVT	R0, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,418 :: 		fngr_thumb.enc_chan_b = THUMB_ENCODER_B;                               // Sample the second encoder channel (For direction)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_thumb+28)
MOVT	R0, #hi_addr(_fngr_thumb+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,419 :: 		fngr_thumb.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_thumb+16)
MOVT	R1, #hi_addr(_fngr_thumb+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,420 :: 		}
L_timer2_ISR31:
;Input Capture Complete 5ch.c,421 :: 		}
L_end_timer2_ISR:
BX	LR
; end of _timer2_ISR
_timer3_ISR:
;Input Capture Complete 5ch.c,425 :: 		void timer3_ISR() iv IVT_INT_TIM3 {
;Input Capture Complete 5ch.c,428 :: 		if(TIM3_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR32
;Input Capture Complete 5ch.c,429 :: 		TIM3_SR.UIF = 0;                                                        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,430 :: 		tim3_overflow_count++;                                                  // Increment timer 3 overflow counter
MOVW	R1, #lo_addr(_tim3_overflow_count+0)
MOVT	R1, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,431 :: 		}
L_timer3_ISR32:
;Input Capture Complete 5ch.c,434 :: 		if (TIM3_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR33
;Input Capture Complete 5ch.c,435 :: 		fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;                // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+36)
MOVT	R2, #hi_addr(_fngr_pointer+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+32)
MOVT	R0, #hi_addr(_fngr_pointer+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,436 :: 		fngr_pointer.enc_end_time = TIM3_CCR1;                                  // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR1+0)
MOVT	R0, #hi_addr(TIM3_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,437 :: 		fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;        // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+48)
MOVT	R2, #hi_addr(_fngr_pointer+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+44)
MOVT	R0, #hi_addr(_fngr_pointer+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,438 :: 		fngr_pointer.enc_overflow_end = tim3_overflow_count;                    // Store number of timer 3 overflows for Pointer finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,439 :: 		fngr_pointer.enc_chan_b = POINTER_ENCODER_B;                           // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+28)
MOVT	R0, #hi_addr(_fngr_pointer+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,440 :: 		fngr_pointer.position_temp++;                                           // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pointer+16)
MOVT	R1, #hi_addr(_fngr_pointer+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,441 :: 		}
L_timer3_ISR33:
;Input Capture Complete 5ch.c,445 :: 		if (TIM3_SR.CC2IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR34
;Input Capture Complete 5ch.c,446 :: 		fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+36)
MOVT	R2, #hi_addr(_fngr_middle+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+32)
MOVT	R0, #hi_addr(_fngr_middle+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,447 :: 		fngr_middle.enc_end_time = TIM3_CCR2;                                   // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR2+0)
MOVT	R0, #hi_addr(TIM3_CCR2+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,448 :: 		fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+48)
MOVT	R2, #hi_addr(_fngr_middle+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+44)
MOVT	R0, #hi_addr(_fngr_middle+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,449 :: 		fngr_middle.enc_overflow_end = tim3_overflow_count;                     // Store number of timer 3 overflows for Middle finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,450 :: 		fngr_middle.enc_chan_b = MIDDLE_ENCODER_B;                             // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_middle+28)
MOVT	R0, #hi_addr(_fngr_middle+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,451 :: 		fngr_middle.position_temp++;                                            // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_middle+16)
MOVT	R1, #hi_addr(_fngr_middle+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,452 :: 		}
L_timer3_ISR34:
;Input Capture Complete 5ch.c,455 :: 		if (TIM3_SR.CC3IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR35
;Input Capture Complete 5ch.c,456 :: 		fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+36)
MOVT	R2, #hi_addr(_fngr_ring+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+32)
MOVT	R0, #hi_addr(_fngr_ring+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,457 :: 		fngr_ring.enc_end_time = TIM3_CCR3;                                     // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR3+0)
MOVT	R0, #hi_addr(TIM3_CCR3+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,458 :: 		fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+48)
MOVT	R2, #hi_addr(_fngr_ring+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+44)
MOVT	R0, #hi_addr(_fngr_ring+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,459 :: 		fngr_ring.enc_overflow_end = tim3_overflow_count;                       // Store number of timer 3 overflows for Ring finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,460 :: 		fngr_ring.enc_chan_b = RING_ENCODER_B;                                 // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_ring+28)
MOVT	R0, #hi_addr(_fngr_ring+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,461 :: 		fngr_ring.position_temp++;                                              // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_ring+16)
MOVT	R1, #hi_addr(_fngr_ring+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,462 :: 		}
L_timer3_ISR35:
;Input Capture Complete 5ch.c,465 :: 		if (TIM3_SR.CC4IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR36
;Input Capture Complete 5ch.c,466 :: 		fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+36)
MOVT	R2, #hi_addr(_fngr_pinky+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+32)
MOVT	R0, #hi_addr(_fngr_pinky+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,467 :: 		fngr_pinky.enc_end_time = TIM3_CCR4;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR4+0)
MOVT	R0, #hi_addr(TIM3_CCR4+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,468 :: 		fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+48)
MOVT	R2, #hi_addr(_fngr_pinky+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+44)
MOVT	R0, #hi_addr(_fngr_pinky+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,469 :: 		fngr_pinky.enc_overflow_end = tim3_overflow_count;                      // Store number of timer 3 overflows for Pinky
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,470 :: 		fngr_pinky.enc_chan_b = PINKY_ENCODER_B;                               // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pinky+28)
MOVT	R0, #hi_addr(_fngr_pinky+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,471 :: 		fngr_pinky.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pinky+16)
MOVT	R1, #hi_addr(_fngr_pinky+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,472 :: 		}
L_timer3_ISR36:
;Input Capture Complete 5ch.c,473 :: 		}
L_end_timer3_ISR:
BX	LR
; end of _timer3_ISR
_timer11_ISR:
;Input Capture Complete 5ch.c,477 :: 		void timer11_ISR() iv IVT_INT_TIM1_TRG_COM_TIM11 {
;Input Capture Complete 5ch.c,479 :: 		TIM11_SR.UIF = 0;                                                           // Clear timer 11 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_SR+0)
MOVT	R0, #hi_addr(TIM11_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,480 :: 		poll_flag = 1;                                                              // Set poll flag for main loop
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,481 :: 		terminal_print_count++;                                                     // Increment the debug print counter
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,482 :: 		}
L_end_timer11_ISR:
BX	LR
; end of _timer11_ISR
_init_GPIO:
;Input Capture Complete 5ch.c,489 :: 		void init_GPIO() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,493 :: 		_GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #4096
;Input Capture Complete 5ch.c,492 :: 		GPIO_Config(&GPIOE_BASE,                                                    // Pointer Encoder Channel B
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
;Input Capture Complete 5ch.c,493 :: 		_GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,496 :: 		_GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #2048
;Input Capture Complete 5ch.c,495 :: 		GPIO_Config(&GPIOA_BASE,                                                    // Middle Encoder Channel B
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;Input Capture Complete 5ch.c,496 :: 		_GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,499 :: 		_GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #32768
;Input Capture Complete 5ch.c,498 :: 		GPIO_Config(&GPIOB_BASE,                                                    // Ring Encoder Channel B
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;Input Capture Complete 5ch.c,499 :: 		_GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,502 :: 		_GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #512
;Input Capture Complete 5ch.c,501 :: 		GPIO_Config(&GPIOD_BASE,                                                    // Pinky Encoder Channel B
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
;Input Capture Complete 5ch.c,502 :: 		_GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,505 :: 		_GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #2048
;Input Capture Complete 5ch.c,504 :: 		GPIO_Config(&GPIOC_BASE,                                                    // Thumb Encoder Channel B
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;Input Capture Complete 5ch.c,505 :: 		_GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,509 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                         // Pointer direction
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,510 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_10);                         // Middle direction
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,511 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_13);                         // Ring direction
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,512 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_8);                          // Pinky direction
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,513 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12);                         // Thumb direction
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,518 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);  // Mode 1 button
MOVW	R2, #322
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,519 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_7, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);       // Mode 2 button
MOVW	R2, #322
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,520 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_1, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);     // Mode 3 button
MOVW	R2, #322
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,521 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);    // Mode 4 button
MOVW	R2, #322
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,530 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);                          // Motor enable: may not use in this test
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,533 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);                          // For awd debug test
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,534 :: 		}
L_end_init_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_GPIO
_init_pointer_PWM:
;Input Capture Complete 5ch.c,538 :: 		void init_pointer_PWM( ) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,540 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);    // Set 70% duty on Timer 1, channel 1
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,541 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;Input Capture Complete 5ch.c,542 :: 		}
L_end_init_pointer_PWM:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_pointer_PWM
_init_middle_PWM:
;Input Capture Complete 5ch.c,545 :: 		void init_middle_PWM( ) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,547 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);    // Set 70% duty on Timer 1, channel 2
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,548 :: 		PWM_TIM1_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM1_CH2_PE11);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH2_PE11+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH2_PE11+0)
MOVS	R0, #1
BL	_PWM_TIM1_Start+0
;Input Capture Complete 5ch.c,549 :: 		}
L_end_init_middle_PWM:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_middle_PWM
_init_ring_PWM:
;Input Capture Complete 5ch.c,553 :: 		void init_ring_PWM( ) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,555 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);    // Set 70% duty on Timer 1, channel 3
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,556 :: 		PWM_TIM1_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM1_CH3_PE13);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH3_PE13+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH3_PE13+0)
MOVS	R0, #2
BL	_PWM_TIM1_Start+0
;Input Capture Complete 5ch.c,557 :: 		}
L_end_init_ring_PWM:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_ring_PWM
_init_pinky_PWM:
;Input Capture Complete 5ch.c,561 :: 		void init_pinky_PWM( ) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,563 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, PINKY_PWM);    // Set 70% duty on Timer 1, channel 4
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,564 :: 		PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PE14);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH4_PE14+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH4_PE14+0)
MOVS	R0, #3
BL	_PWM_TIM1_Start+0
;Input Capture Complete 5ch.c,565 :: 		}
L_end_init_pinky_PWM:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_pinky_PWM
_init_thumb_PWM:
;Input Capture Complete 5ch.c,569 :: 		void init_thumb_PWM( ) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,571 :: 		PWM_TIM4_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);    // Set 70% duty on Timer 4, channel 1
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;Input Capture Complete 5ch.c,572 :: 		PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;Input Capture Complete 5ch.c,573 :: 		}
L_end_init_thumb_PWM:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_thumb_PWM
_init_finger:
;Input Capture Complete 5ch.c,580 :: 		void init_finger(struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
; fngr end address is: 0 (R0)
; fngr start address is: 0 (R0)
;Input Capture Complete 5ch.c,581 :: 		fngr->position_actual = 0;
ADDW	R2, R0, #20
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Complete 5ch.c,582 :: 		fngr->direction_desired = INITIAL_DIRECTION;
ADDW	R2, R0, #26
; fngr end address is: 0 (R0)
MOVW	R1, #lo_addr(_INITIAL_DIRECTION+0)
MOVT	R1, #hi_addr(_INITIAL_DIRECTION+0)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,583 :: 		}
L_end_init_finger:
ADD	SP, SP, #4
BX	LR
; end of _init_finger
_init_UART:
;Input Capture Complete 5ch.c,586 :: 		void init_UART() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,588 :: 		UART1_Init(UART_BAUD_RATE);                                                 // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;Input Capture Complete 5ch.c,589 :: 		Delay_ms(200);                                                              // Wait for UART to stabilize
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_init_UART37:
SUBS	R7, R7, #1
BNE	L_init_UART37
NOP
NOP
NOP
;Input Capture Complete 5ch.c,590 :: 		UART_Write_Text("\rUART Init Complete\r\n");                                // *** DEBUG *** Print test statement to terminal
MOVW	R0, #lo_addr(?lstr13_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr13_Input_32Capture_32Complete_325ch+0)
BL	_UART_Write_Text+0
;Input Capture Complete 5ch.c,591 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_init_input_capture:
;Input Capture Complete 5ch.c,595 :: 		void init_input_capture() {
SUB	SP, SP, #24
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,599 :: 		RCC_APB1ENR.TIM3EN = 1;                                                     // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,600 :: 		TIM3_CR1.CEN = 0;                                                           // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,601 :: 		TIM3_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM3_CR2+0)
MOVT	R0, #hi_addr(TIM3_CR2+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,602 :: 		TIM3_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
STR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,603 :: 		TIM3_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
STR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,604 :: 		TIM3_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,608 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_6, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,609 :: 		TIM3_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,610 :: 		TIM3_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,611 :: 		TIM3_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,612 :: 		TIM3_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,613 :: 		TIM3_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,617 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_7, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,618 :: 		TIM3_CCMR1_Input |= 0x100;                                                  // Set capture channel 2 as input on TI2 (CC2S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,619 :: 		TIM3_CCER.CC2P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,620 :: 		TIM3_CCER.CC2NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,621 :: 		TIM3_CCER.CC2E = 1;                                                         // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,622 :: 		TIM3_DIER.CC2IE = 1;                                                        // Enable interrupt on capture channel 2
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,626 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_8, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,627 :: 		TIM3_CCMR2_Input |= 0x01;                                                   // Set capture channel 3 as input on TI3 (CC3S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,628 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,629 :: 		TIM3_CCER.CC3NP = 0;                                                         // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,630 :: 		TIM3_CCER.CC3E = 1;                                                         // Enable capture on channel 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,631 :: 		TIM3_DIER.CC3IE = 1;                                                        // Enable interrupt on capture channel 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,635 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_4, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,636 :: 		TIM3_CCMR2_Input |= 0x100;                                                  // Set capture channel 4 as input on TI4 (CC4S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,637 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,638 :: 		TIM3_CCER.CC3NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,639 :: 		TIM3_CCER.CC4E = 1;                                                         // Enable capture on channel 4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,640 :: 		TIM3_DIER.CC4IE = 1;                                                        // Enable interrupt on capture channel 4
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,644 :: 		RCC_APB1ENR.TIM2EN = 1;                                                     // Enable clock gating for timer module 5
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,645 :: 		TIM2_CR1.CEN = 0;                                                           // Disable timer/counter
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,646 :: 		TIM2_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM2_CR2+0)
MOVT	R0, #hi_addr(TIM2_CR2+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,647 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
LDR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,648 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
LDR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,649 :: 		TIM2_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,653 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_5, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM2 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #16
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,654 :: 		TIM2_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,655 :: 		TIM2_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,656 :: 		TIM2_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,657 :: 		TIM2_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,658 :: 		TIM2_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,662 :: 		TIM3_DIER.UIE = 1;                                                          // Enable overflow interrupt Timer 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,663 :: 		TIM2_DIER.UIE = 1;                                                          // Enable overflow interrupt for Timer 2
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,664 :: 		NVIC_IntEnable(IVT_INT_TIM3);                                               // Enable timer 3 ISR
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,665 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                               // Enable timer 2 ISR
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,666 :: 		TIM3_CR1.CEN = 1;                                                           // Enable timer 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,667 :: 		TIM2_CR1.CEN = 1;                                                           // Enable Timer 2
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,671 :: 		encoder_timer_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
LDR	R0, [SP, #20]
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
UXTH	R1, R1
MOVW	R0, #lo_addr(_MCU_FREQUENCY+0)
MOVT	R0, #hi_addr(_MCU_FREQUENCY+0)
LDR	R0, [R0, #0]
UDIV	R0, R0, R1
BL	__UnsignedIntegralToLongDouble+0
STRD	R0, R1, [SP, #12]
MOV	R0, #0
MOVW	R1, #16384
MOVT	R1, #16527
VMOV	S0, R0
VMOV	S1, R1
STRD	R2, R3, [SP, #4]
LDRD	R2, R3, [SP, #12]
VMOV	R0, S0
VMOV	R1, S1
BL	__Div_DP+0
LDRD	R2, R3, [SP, #4]
MOVW	R2, #lo_addr(_encoder_timer_period_ms+0)
MOVT	R2, #hi_addr(_encoder_timer_period_ms+0)
STRD	R0, R1, [R2, #0]
;Input Capture Complete 5ch.c,672 :: 		}
L_end_init_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _init_input_capture
_init_timer11:
;Input Capture Complete 5ch.c,677 :: 		void init_timer11() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,679 :: 		RCC_APB2ENR.TIM11EN = 1;                                                    // Enable clock for timer 11
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,680 :: 		TIM11_CR1.CEN = 0;                                                          // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,681 :: 		TIM11_PSC = SAMPLE_TIM_PSC;                                                 // Set timer 11 prescaler
MOVW	R0, #lo_addr(_SAMPLE_TIM_PSC+0)
MOVT	R0, #hi_addr(_SAMPLE_TIM_PSC+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM11_PSC+0)
MOVT	R0, #hi_addr(TIM11_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,682 :: 		TIM11_ARR = SAMPLE_TIM_RELOAD;                                              // Set timer 11 overflow value
MOVW	R0, #lo_addr(_SAMPLE_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_SAMPLE_TIM_RELOAD+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM11_ARR+0)
MOVT	R0, #hi_addr(TIM11_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,683 :: 		NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);                                 // Enable timer 11 interrupt
MOVW	R0, #42
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,684 :: 		TIM11_DIER.UIE = 1;                                                         // Timer 11 update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_DIER+0)
MOVT	R0, #hi_addr(TIM11_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,685 :: 		TIM11_CR1.CEN = 1;                                                          // Enable timer/counter
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,686 :: 		}
L_end_init_timer11:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_timer11
_calc_finger_state:
;Input Capture Complete 5ch.c,693 :: 		void calc_finger_state( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R9, R0
; fngr end address is: 0 (R0)
; fngr start address is: 36 (R9)
;Input Capture Complete 5ch.c,696 :: 		fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;
ADD	R3, R9, #52
ADD	R1, R9, #48
LDR	R2, [R1, #0]
ADD	R1, R9, #44
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,699 :: 		fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);
ADD	R3, R9, #56
ADD	R1, R9, #52
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R1, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R1, #0]
SUBS	R1, R1, #3
MULS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,702 :: 		fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;
ADD	R3, R9, #40
ADD	R1, R9, #36
LDR	R2, [R1, #0]
ADD	R1, R9, #32
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,705 :: 		fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;
ADD	R3, R9, #60
ADD	R1, R9, #56
LDR	R2, [R1, #0]
ADD	R1, R9, #40
LDR	R1, [R1, #0]
ADDS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,708 :: 		fngr->input_sig_period = (long double) fngr->enc_total_ticks * encoder_timer_period_ms;
ADD	R1, R9, #68
STR	R1, [SP, #4]
ADD	R1, R9, #60
LDR	R1, [R1, #0]
MOV	R0, R1
BL	__UnsignedIntegralToLongDouble+0
MOVW	R2, #lo_addr(_encoder_timer_period_ms+0)
MOVT	R2, #hi_addr(_encoder_timer_period_ms+0)
VLDR	#1, D0, [R2, #0]
VMOV	R2, S0
VMOV	R3, S1
BL	__Mul_DP+0
LDR	R2, [SP, #4]
STRD	R0, R1, [R2, #0]
;Input Capture Complete 5ch.c,711 :: 		fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
ADD	R1, R9, #64
STR	R1, [SP, #8]
ADD	R1, R9, #68
STR	R1, [SP, #4]
MOV	R1, #1000
VMOV	S0, R1
VMOV	R0, S0
BL	__UnsignedIntegralToLongDouble+0
LDR	R2, [SP, #4]
LDRD	R2, R3, [R2, #0]
BL	__Div_DP+0
BL	__LongDoubleToUnsignedIntegral+0
LDR	R1, [SP, #8]
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,712 :: 		if (fngr->input_sig_frequency > 1200.0 || fngr->input_sig_frequency < 10.0)           // NEW: Handles startup error
ADD	R1, R9, #64
LDR	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#0, S1, S1
MOVW	R1, #0
MOVT	R1, #17558
VMOV	S0, R1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GT
BGT	L__calc_finger_state63
ADD	R1, R9, #64
VLDR	#1, S0, [R1, #0]
VCVT.F32	#0, S1, S0
VMOV.F32	S0, #10
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L__calc_finger_state62
IT	AL
BAL	L_calc_finger_state41
L__calc_finger_state63:
L__calc_finger_state62:
;Input Capture Complete 5ch.c,713 :: 		fngr->input_sig_frequency = 0;
ADD	R2, R9, #64
MOVS	R1, #0
STR	R1, [R2, #0]
L_calc_finger_state41:
;Input Capture Complete 5ch.c,716 :: 		if (fngr->enc_chan_b == 1) {                                                // Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_calc_finger_state42
;Input Capture Complete 5ch.c,717 :: 		fngr->direction_actual = CONTRACT;
ADD	R2, R9, #24
MOVW	R1, #lo_addr(_CONTRACT+0)
MOVT	R1, #hi_addr(_CONTRACT+0)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,718 :: 		fngr->position_actual += (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
ADD	R3, R9, #20
ADD	R1, R9, #16
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_NORMALIZATION_CONSTANT+0)
MOVT	R1, #hi_addr(_NORMALIZATION_CONSTANT+0)
LDRH	R1, [R1, #0]
SDIV	R2, R2, R1
LDR	R1, [R3, #0]
ADDS	R1, R1, R2
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,719 :: 		}
IT	AL
BAL	L_calc_finger_state43
L_calc_finger_state42:
;Input Capture Complete 5ch.c,721 :: 		else if (fngr->enc_chan_b == 0) {                                           // Counter Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_calc_finger_state44
;Input Capture Complete 5ch.c,722 :: 		fngr->direction_actual = EXTEND;
ADD	R2, R9, #24
MOVW	R1, #lo_addr(_EXTEND+0)
MOVT	R1, #hi_addr(_EXTEND+0)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,723 :: 		fngr->position_actual -= (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
ADD	R3, R9, #20
ADD	R1, R9, #16
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_NORMALIZATION_CONSTANT+0)
MOVT	R1, #hi_addr(_NORMALIZATION_CONSTANT+0)
LDRH	R1, [R1, #0]
SDIV	R2, R2, R1
LDR	R1, [R3, #0]
SUB	R1, R1, R2
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,724 :: 		}
IT	AL
BAL	L_calc_finger_state45
L_calc_finger_state44:
;Input Capture Complete 5ch.c,727 :: 		fngr->direction_actual = 7;
ADD	R2, R9, #24
MOVS	R1, #7
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,728 :: 		}
L_calc_finger_state45:
L_calc_finger_state43:
;Input Capture Complete 5ch.c,732 :: 		if(fngr->position_actual >= FULLY_CONTRACTED) {  // don't run too far!
ADD	R1, R9, #20
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_FULLY_CONTRACTED+0)
MOVT	R1, #hi_addr(_FULLY_CONTRACTED+0)
LDR	R1, [R1, #0]
CMP	R2, R1
IT	CC
BCC	L_calc_finger_state46
;Input Capture Complete 5ch.c,733 :: 		fngr->direction_desired = EXTEND;
ADD	R2, R9, #26
MOVW	R1, #lo_addr(_EXTEND+0)
MOVT	R1, #hi_addr(_EXTEND+0)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,734 :: 		}
L_calc_finger_state46:
;Input Capture Complete 5ch.c,736 :: 		if(fngr->position_actual <= FULLY_EXTENDED) {
ADD	R1, R9, #20
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_FULLY_EXTENDED+0)
MOVT	R1, #hi_addr(_FULLY_EXTENDED+0)
LDR	R1, [R1, #0]
CMP	R2, R1
IT	GT
BGT	L_calc_finger_state47
;Input Capture Complete 5ch.c,737 :: 		fngr->direction_desired = CONTRACT;
ADD	R2, R9, #26
MOVW	R1, #lo_addr(_CONTRACT+0)
MOVT	R1, #hi_addr(_CONTRACT+0)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,738 :: 		}
L_calc_finger_state47:
;Input Capture Complete 5ch.c,740 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0) {
MOVW	R1, #lo_addr(?lstr14_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr14_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_calc_finger_state48
;Input Capture Complete 5ch.c,741 :: 		POINTER_DIRECTION = fngr->direction_desired;
ADD	R1, R9, #26
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,742 :: 		}
IT	AL
BAL	L_calc_finger_state49
L_calc_finger_state48:
;Input Capture Complete 5ch.c,744 :: 		else if(strcmp(fngr->name, "fngr_middle") == 0) {
MOVW	R1, #lo_addr(?lstr15_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr15_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_calc_finger_state50
;Input Capture Complete 5ch.c,745 :: 		MIDDLE_DIRECTION = fngr->direction_desired;
ADD	R1, R9, #26
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,746 :: 		}
IT	AL
BAL	L_calc_finger_state51
L_calc_finger_state50:
;Input Capture Complete 5ch.c,748 :: 		else if(strcmp(fngr->name, "fngr_ring") == 0) {
MOVW	R1, #lo_addr(?lstr16_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr16_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_calc_finger_state52
;Input Capture Complete 5ch.c,749 :: 		RING_DIRECTION = fngr->direction_desired;
ADD	R1, R9, #26
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,750 :: 		}
IT	AL
BAL	L_calc_finger_state53
L_calc_finger_state52:
;Input Capture Complete 5ch.c,752 :: 		else if(strcmp(fngr->name, "fngr_pinky") == 0) {
MOVW	R1, #lo_addr(?lstr17_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr17_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_calc_finger_state54
;Input Capture Complete 5ch.c,753 :: 		PINKY_DIRECTION = fngr->direction_desired;
ADD	R1, R9, #26
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,754 :: 		}
IT	AL
BAL	L_calc_finger_state55
L_calc_finger_state54:
;Input Capture Complete 5ch.c,756 :: 		else if(strcmp(fngr->name, "fngr_thumb") == 0) {
MOVW	R1, #lo_addr(?lstr18_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr18_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_calc_finger_state56
;Input Capture Complete 5ch.c,757 :: 		THUMB_DIRECTION = fngr->direction_desired;
ADD	R1, R9, #26
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,758 :: 		}
L_calc_finger_state56:
L_calc_finger_state55:
L_calc_finger_state53:
L_calc_finger_state51:
L_calc_finger_state49:
;Input Capture Complete 5ch.c,761 :: 		fngr->position_temp = 0;
ADD	R2, R9, #16
; fngr end address is: 36 (R9)
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Complete 5ch.c,762 :: 		}
L_end_calc_finger_state:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _calc_finger_state
_print_finger_info:
;Input Capture Complete 5ch.c,766 :: 		void print_finger_info( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #36
STR	LR, [SP, #0]
MOV	R7, R0
; fngr end address is: 0 (R0)
; fngr start address is: 28 (R7)
;Input Capture Complete 5ch.c,773 :: 		UART1_Write_Text("\n\rFinger Name: ");                                      //Print name of current finger to terminal
MOVW	R1, #lo_addr(?lstr19_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr19_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,774 :: 		UART1_Write_Text(fngr->name);
MOV	R0, R7
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,775 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr20_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr20_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,777 :: 		LongWordToStr(fngr->input_sig_frequency, frequency_text);                   // Print input capture signal frequency to terminal
ADD	R2, SP, #4
ADDW	R1, R7, #64
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;Input Capture Complete 5ch.c,778 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R1, #lo_addr(?lstr21_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr21_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,779 :: 		UART1_Write_Text(frequency_text);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,780 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr22_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr22_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,783 :: 		UART1_Write_Text("Direction of movement:             ");
MOVW	R1, #lo_addr(?lstr23_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr23_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,784 :: 		if(fngr->direction_actual == EXTEND)
ADDW	R1, R7, #24
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_EXTEND+0)
MOVT	R1, #hi_addr(_EXTEND+0)
LDRSH	R1, [R1, #0]
CMP	R2, R1
IT	NE
BNE	L_print_finger_info57
;Input Capture Complete 5ch.c,785 :: 		UART1_Write_Text("EXTEND ");
MOVW	R1, #lo_addr(?lstr24_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr24_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
IT	AL
BAL	L_print_finger_info58
L_print_finger_info57:
;Input Capture Complete 5ch.c,787 :: 		UART1_Write_Text("CONTRACT ");
MOVW	R1, #lo_addr(?lstr25_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr25_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
L_print_finger_info58:
;Input Capture Complete 5ch.c,789 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr26_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr26_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,791 :: 		LongToStr(fngr->position_actual, position_text);                            // Print total number of input events (position) to terminal
ADD	R2, SP, #19
ADDW	R1, R7, #20
; fngr end address is: 28 (R7)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongToStr+0
;Input Capture Complete 5ch.c,792 :: 		UART1_Write_Text("Position of finger:                ");
MOVW	R1, #lo_addr(?lstr27_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr27_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,793 :: 		UART1_Write_Text(position_text);
ADD	R1, SP, #19
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,794 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr28_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr28_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,796 :: 		terminal_print_count = 0;                                                   // Reset counter for terminal printing
MOVS	R2, #0
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
STRH	R2, [R1, #0]
;Input Capture Complete 5ch.c,797 :: 		}
L_end_print_finger_info:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _print_finger_info
_ADC_AWD:
;Input Capture Complete 5ch.c,803 :: 		void ADC_AWD() iv IVT_INT_ADC ics ICS_AUTO {
;Input Capture Complete 5ch.c,804 :: 		ADC1_CR1bits.AWDIE = 0;       // Disabling analog interrupt (disable)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,805 :: 		ADC1_SRbits.AWD = 0;          // Reset status bit
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,806 :: 		if(ADC1_HTR <= 1000) {
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
LDR	R0, [R0, #0]
CMP	R0, #1000
IT	HI
BHI	L_ADC_AWD59
;Input Capture Complete 5ch.c,807 :: 		TIM5_SR.UIF = 0;        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_SR+0)
MOVT	R0, #hi_addr(TIM5_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,808 :: 		TIM5_CNT = 0x00;        // Reset timer value to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM5_CNT+0)
MOVT	R0, #hi_addr(TIM5_CNT+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,809 :: 		ADC1_HTR = high_level2; // Set high threshold to MAX
MOVW	R1, #4095
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,810 :: 		ADC1_LTR = low_level2;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,811 :: 		TIM5_DIER.UIE = 1;      // CC1 Update Interrupt Enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,812 :: 		}else {
IT	AL
BAL	L_ADC_AWD60
L_ADC_AWD59:
;Input Capture Complete 5ch.c,813 :: 		TIM5_DIER.UIE = 0;      // Disable timer interrupt
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,814 :: 		ADC1_HTR = high_level;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,815 :: 		ADC1_LTR = low_level;   // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,816 :: 		}
L_ADC_AWD60:
;Input Capture Complete 5ch.c,817 :: 		ADC1_CR1bits.AWDIE = 1;       //Enable analog interrupt (enabled)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,818 :: 		}
L_end_ADC_AWD:
BX	LR
; end of _ADC_AWD
_InitTimer5:
;Input Capture Complete 5ch.c,822 :: 		void InitTimer5(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,823 :: 		RCC_APB1ENR.TIM5EN = 1;        // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,824 :: 		TIM5_CR1.CEN = 0;              // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,825 :: 		TIM5_PSC = 7874;               // Set timer 3 prescaler (need to determine value)
MOVW	R1, #7874
MOVW	R0, #lo_addr(TIM5_PSC+0)
MOVT	R0, #hi_addr(TIM5_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,826 :: 		TIM5_ARR = 63999;              // Set timer 3 overflow value at max
MOVW	R1, #63999
MOVW	R0, #lo_addr(TIM5_ARR+0)
MOVT	R0, #hi_addr(TIM5_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,827 :: 		NVIC_IntEnable(IVT_INT_TIM5);  // Enable timer 3 interrupt
MOVW	R0, #66
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,828 :: 		TIM5_CR1.CEN = 1;              // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,829 :: 		}
L_end_InitTimer5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer5
_Timer5_interrupt:
;Input Capture Complete 5ch.c,832 :: 		void Timer5_interrupt() iv IVT_INT_TIM5 { // Interrupt handler if 6 s have past
;Input Capture Complete 5ch.c,833 :: 		TIM5_SR.UIF = 0;                     // Clear timer 3 interrupt bit
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM5_SR+0)
MOVT	R0, #hi_addr(TIM5_SR+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,834 :: 		ADC1_HTR = high_level;               // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,835 :: 		ADC1_LTR = low_level;                // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,836 :: 		TIM5_DIER.UIE = 0;                   // Disable timer interrupt
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,837 :: 		analogGo = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,838 :: 		GPIOD_ODR.B1 = 1;                              //DEBUG
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,839 :: 		}
L_end_Timer5_interrupt:
BX	LR
; end of _Timer5_interrupt
