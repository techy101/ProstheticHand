_main:
;main.c,95 :: 		void main() {
SUB	SP, SP, #4
;main.c,97 :: 		INITIAL_DIRECTION = CONTRACT;                                               // ****DEBUG****
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_INITIAL_DIRECTION+0)
MOVT	R0, #hi_addr(_INITIAL_DIRECTION+0)
STRH	R1, [R0, #0]
;main.c,100 :: 		init_UART();                                                            // Configure and Initialize UART serial communications
BL	_init_UART+0
;main.c,101 :: 		init_GPIO();                                                            // Configure MCU I/O
BL	_init_GPIO+0
;main.c,104 :: 		init_emg();
BL	_init_emg+0
;main.c,107 :: 		strcpy(fngr_pointer.name, "fngr_pointer");
MOVW	R0, #lo_addr(?lstr1_main+0)
MOVT	R0, #hi_addr(?lstr1_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_strcpy+0
;main.c,108 :: 		strcpy(fngr_middle.name, "fngr_middle");
MOVW	R0, #lo_addr(?lstr2_main+0)
MOVT	R0, #hi_addr(?lstr2_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_strcpy+0
;main.c,109 :: 		strcpy(fngr_ring.name, "fngr_ring");
MOVW	R0, #lo_addr(?lstr3_main+0)
MOVT	R0, #hi_addr(?lstr3_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_strcpy+0
;main.c,110 :: 		strcpy(fngr_pinky.name, "fngr_pinky");
MOVW	R0, #lo_addr(?lstr4_main+0)
MOVT	R0, #hi_addr(?lstr4_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_strcpy+0
;main.c,111 :: 		strcpy(fngr_thumb.name, "fngr_thumb");
MOVW	R0, #lo_addr(?lstr5_main+0)
MOVT	R0, #hi_addr(?lstr5_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_strcpy+0
;main.c,114 :: 		pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);                      // Set fingers PWM base frequency to 10000 Hz
MOVW	R0, #10000
MOVT	R0, #0
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;main.c,115 :: 		PWM_TIM4_Init(PWM_FREQ_HZ);                                   // Set thumb PWM base frequency to 10000 Hz
MOVW	R0, #10000
MOVT	R0, #0
BL	_PWM_TIM4_Init+0
;main.c,118 :: 		init_finger(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_init_finger+0
;main.c,119 :: 		init_finger(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_init_finger+0
;main.c,120 :: 		init_finger(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_init_finger+0
;main.c,121 :: 		init_finger(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_init_finger+0
;main.c,122 :: 		init_finger(&fngr_thumb);
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_init_finger+0
;main.c,125 :: 		init_sample_timer();
BL	_init_sample_timer+0
;main.c,128 :: 		init_input_capture();
BL	_init_input_capture+0
;main.c,131 :: 		activate_input_capture();
BL	_activate_input_capture+0
;main.c,134 :: 		UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
MOVW	R0, #lo_addr(?lstr6_main+0)
MOVT	R0, #hi_addr(?lstr6_main+0)
BL	_UART1_Write_Text+0
;main.c,135 :: 		delay_ms(500);
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
;main.c,138 :: 		while(1) {
L_main2:
;main.c,142 :: 		if (GRAB_MODE_BUTTON == 0) {
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main4
;main.c,143 :: 		PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;main.c,144 :: 		}
IT	AL
BAL	L_main5
L_main4:
;main.c,146 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);
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
;main.c,147 :: 		}
L_main5:
;main.c,150 :: 		if (PINCH_MODE_BUTTON == 0) {
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main6
;main.c,151 :: 		PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;main.c,152 :: 		}
IT	AL
BAL	L_main7
L_main6:
;main.c,154 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, MIDDLE_PWM);
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
;main.c,155 :: 		}
L_main7:
;main.c,158 :: 		if (POINT_MODE_BUTTON == 0) {
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main8
;main.c,159 :: 		PWM_TIM1_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);
MOVS	R2, #2
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM1_Set_Duty+0
;main.c,160 :: 		}
IT	AL
BAL	L_main9
L_main8:
;main.c,162 :: 		PWM_TIM1_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, RING_PWM);
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
;main.c,163 :: 		}
L_main9:
;main.c,166 :: 		if (SHAKE_MODE_BUTTON == 0) {
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main10
;main.c,167 :: 		PWM_TIM4_Set_Duty(0*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM4_Set_Duty+0
;main.c,168 :: 		}
IT	AL
BAL	L_main11
L_main10:
;main.c,170 :: 		PWM_TIM4_Set_Duty(100*(pwm_period/100), _PWM_NON_INVERTED, THUMB_PWM);
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
;main.c,171 :: 		}
L_main11:
;main.c,175 :: 		if (poll_flag == 1) {                                                     // Calculate finger state values (Set by timer 3)
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main12
;main.c,176 :: 		poll_flag = 0;                                                    // Clear flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;main.c,177 :: 		sample_finger(&fngr_pointer);                                 // Call state calculation function for each finger - equivalent of sampling
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_sample_finger+0
;main.c,178 :: 		sample_finger(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_sample_finger+0
;main.c,179 :: 		sample_finger(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_sample_finger+0
;main.c,180 :: 		sample_finger(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_sample_finger+0
;main.c,181 :: 		sample_finger(&fngr_thumb);
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_sample_finger+0
;main.c,183 :: 		}
L_main12:
;main.c,186 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main18
MOVW	R0, #lo_addr(_terminal_print_count+0)
MOVT	R0, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R0, #0]
CMP	R0, #5
IT	CC
BCC	L__main17
L__main16:
;main.c,187 :: 		print_finger_info(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_print_finger_info+0
;main.c,188 :: 		print_finger_info(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_print_finger_info+0
;main.c,189 :: 		print_finger_info(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_print_finger_info+0
;main.c,190 :: 		print_finger_info(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_print_finger_info+0
;main.c,191 :: 		print_finger_info(&fngr_thumb);
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_print_finger_info+0
;main.c,192 :: 		UART1_Write_Text("\n\n\n\n\n\n\n\r");
MOVW	R0, #lo_addr(?lstr7_main+0)
MOVT	R0, #hi_addr(?lstr7_main+0)
BL	_UART1_Write_Text+0
;main.c,186 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {
L__main18:
L__main17:
;main.c,194 :: 		}
IT	AL
BAL	L_main2
;main.c,196 :: 		} // Main ends here
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
