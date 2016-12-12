_main:
;Input Capture Complete 5ch.c,17 :: 		void main() {
SUB	SP, SP, #4
;Input Capture Complete 5ch.c,19 :: 		INITIAL_DIRECTION = EXTEND;                                               // ****DEBUG****
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_INITIAL_DIRECTION+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_INITIAL_DIRECTION+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,22 :: 		init_UART();                                                            // Configure and Initialize UART serial communications
BL	_init_UART+0
;Input Capture Complete 5ch.c,23 :: 		init_GPIO();                                                            // Configure MCU I/O
BL	_init_GPIO+0
;Input Capture Complete 5ch.c,26 :: 		init_emg();
BL	_init_emg+0
;Input Capture Complete 5ch.c,29 :: 		init_finger_sensors();
BL	_init_finger_sensors+0
;Input Capture Complete 5ch.c,32 :: 		strcpy(fngr_pointer.name, "fngr_pointer");
MOVW	R0, #lo_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_pointer+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_pointer+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,33 :: 		strcpy(fngr_middle.name, "fngr_middle");
MOVW	R0, #lo_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_middle+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_middle+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,34 :: 		strcpy(fngr_ring.name, "fngr_ring");
MOVW	R0, #lo_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_ring+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_ring+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,35 :: 		strcpy(fngr_pinky.name, "fngr_pinky");
MOVW	R0, #lo_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_pinky+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_pinky+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,36 :: 		strcpy(fngr_thumb.name, "fngr_thumb");
MOVW	R0, #lo_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_thumb+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_thumb+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,39 :: 		init_finger(&fngr_pointer);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_pointer+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_pointer+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,40 :: 		init_finger(&fngr_middle);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_middle+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_middle+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,41 :: 		init_finger(&fngr_ring);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_ring+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_ring+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,42 :: 		init_finger(&fngr_pinky);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_pinky+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_pinky+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,43 :: 		init_finger(&fngr_thumb);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_thumb+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_thumb+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,46 :: 		UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
MOVW	R0, #lo_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,47 :: 		delay_ms(500);
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
;Input Capture Complete 5ch.c,50 :: 		init_sample_timer();                                                     // Initialize timer 11, used for sampling
BL	_init_sample_timer+0
;Input Capture Complete 5ch.c,53 :: 		init_input_capture();                                                   // Initialize input capture channels
BL	_init_input_capture+0
;Input Capture Complete 5ch.c,56 :: 		pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);                      // Set fingers PWM base frequency to 10000 Hz
MOVW	R0, #10000
MOVT	R0, #0
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(Input_32Capture_32Complete_325ch_pwm_period+0)
MOVT	R1, #hi_addr(Input_32Capture_32Complete_325ch_pwm_period+0)
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,57 :: 		PWM_TIM4_Init(PWM_FREQ_HZ);                                   // Set thumb PWM base frequency to 10000 Hz
MOVW	R0, #10000
MOVT	R0, #0
BL	_PWM_TIM4_Init+0
;Input Capture Complete 5ch.c,60 :: 		init_pointer_PWM();
BL	_init_pointer_PWM+0
;Input Capture Complete 5ch.c,61 :: 		init_middle_PWM();
BL	_init_middle_PWM+0
;Input Capture Complete 5ch.c,62 :: 		init_ring_PWM();
BL	_init_ring_PWM+0
;Input Capture Complete 5ch.c,63 :: 		init_pinky_PWM();
BL	_init_pinky_PWM+0
;Input Capture Complete 5ch.c,64 :: 		init_thumb_PWM();
BL	_init_thumb_PWM+0
;Input Capture Complete 5ch.c,68 :: 		while(1) {
L_main2:
;Input Capture Complete 5ch.c,72 :: 		if (GRAB_MODE_BUTTON == 0) {
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main4
;Input Capture Complete 5ch.c,73 :: 		PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,74 :: 		}
IT	AL
BAL	L_main5
L_main4:
;Input Capture Complete 5ch.c,76 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_pwm_period+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,77 :: 		}
L_main5:
;Input Capture Complete 5ch.c,80 :: 		if (PINCH_MODE_BUTTON == 0) {
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main6
;Input Capture Complete 5ch.c,81 :: 		PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,82 :: 		}
IT	AL
BAL	L_main7
L_main6:
;Input Capture Complete 5ch.c,84 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_pwm_period+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,85 :: 		}
L_main7:
;Input Capture Complete 5ch.c,88 :: 		if (POINT_MODE_BUTTON == 0) {
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main8
;Input Capture Complete 5ch.c,89 :: 		PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);
MOVS	R2, #2
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,90 :: 		}
IT	AL
BAL	L_main9
L_main8:
;Input Capture Complete 5ch.c,92 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_pwm_period+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,93 :: 		}
L_main9:
;Input Capture Complete 5ch.c,96 :: 		if (SHAKE_MODE_BUTTON == 0) {
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main10
;Input Capture Complete 5ch.c,97 :: 		PWM_TIM4_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM4_Set_Duty+0
;Input Capture Complete 5ch.c,98 :: 		}
IT	AL
BAL	L_main11
L_main10:
;Input Capture Complete 5ch.c,100 :: 		PWM_TIM4_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_pwm_period+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_pwm_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;Input Capture Complete 5ch.c,101 :: 		}
L_main11:
;Input Capture Complete 5ch.c,105 :: 		if (poll_flag) {                                                     // Calculate finger state values (Set by timer 3)
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_poll_flag+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main12
;Input Capture Complete 5ch.c,106 :: 		poll_flag = 0;                                                    // Clear flag
MOVS	R1, #0
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_poll_flag+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,107 :: 		calc_finger_state(&fngr_pointer);                                 // Call state calculation function for each finger - equivalent of sampling
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_pointer+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_pointer+0)
BL	_calc_finger_state+0
;Input Capture Complete 5ch.c,108 :: 		calc_finger_state(&fngr_middle);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_middle+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_middle+0)
BL	_calc_finger_state+0
;Input Capture Complete 5ch.c,109 :: 		calc_finger_state(&fngr_ring);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_ring+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_ring+0)
BL	_calc_finger_state+0
;Input Capture Complete 5ch.c,110 :: 		calc_finger_state(&fngr_pinky);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_pinky+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_pinky+0)
BL	_calc_finger_state+0
;Input Capture Complete 5ch.c,111 :: 		calc_finger_state(&fngr_thumb);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_thumb+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_thumb+0)
BL	_calc_finger_state+0
;Input Capture Complete 5ch.c,113 :: 		}
L_main12:
;Input Capture Complete 5ch.c,116 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_poll_flag+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main18
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_terminal_print_count+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_terminal_print_count+0)
LDRH	R0, [R0, #0]
CMP	R0, #5
IT	CC
BCC	L__main17
L__main16:
;Input Capture Complete 5ch.c,117 :: 		print_finger_info(&fngr_pointer);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_pointer+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_pointer+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,118 :: 		print_finger_info(&fngr_middle);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_middle+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_middle+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,119 :: 		print_finger_info(&fngr_ring);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_ring+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_ring+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,120 :: 		print_finger_info(&fngr_pinky);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_pinky+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_pinky+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,121 :: 		print_finger_info(&fngr_thumb);
MOVW	R0, #lo_addr(Input_32Capture_32Complete_325ch_fngr_thumb+0)
MOVT	R0, #hi_addr(Input_32Capture_32Complete_325ch_fngr_thumb+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,122 :: 		UART1_Write_Text("\n\n\n\n\n\n\n\r");
MOVW	R0, #lo_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,116 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {
L__main18:
L__main17:
;Input Capture Complete 5ch.c,124 :: 		}
IT	AL
BAL	L_main2
;Input Capture Complete 5ch.c,126 :: 		} // Main ends here
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
