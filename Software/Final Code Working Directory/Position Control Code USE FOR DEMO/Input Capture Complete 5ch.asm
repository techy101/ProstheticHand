_main:
;Input Capture Complete 5ch.c,152 :: 		void main() {
SUB	SP, SP, #4
;Input Capture Complete 5ch.c,155 :: 		init_UART();                                                            // Configure and Initialize UART serial communications
BL	_init_UART+0
;Input Capture Complete 5ch.c,156 :: 		init_GPIO();                                                            // Configure MCU I/O
BL	_init_GPIO+0
;Input Capture Complete 5ch.c,157 :: 		init_pointer_PWM();
BL	_init_pointer_PWM+0
;Input Capture Complete 5ch.c,160 :: 		strcpy(fngr_pointer.name, "fngr_pointer");
MOVW	R0, #lo_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,161 :: 		strcpy(fngr_middle.name, "fngr_middle");
MOVW	R0, #lo_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,162 :: 		strcpy(fngr_ring.name, "fngr_ring");
MOVW	R0, #lo_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,163 :: 		strcpy(fngr_pinky.name, "fngr_pinky");
MOVW	R0, #lo_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,164 :: 		strcpy(fngr_thumb.name, "fngr_thumb");
MOVW	R0, #lo_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,167 :: 		init_finger(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,170 :: 		UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
MOVW	R0, #lo_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,171 :: 		delay_ms(500);
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
;Input Capture Complete 5ch.c,174 :: 		init_timer11();                                                         // Initialize timer 11, used for sampling
BL	_init_timer11+0
;Input Capture Complete 5ch.c,175 :: 		init_input_capture();                                                   // Initialize input capture channels
BL	_init_input_capture+0
;Input Capture Complete 5ch.c,178 :: 		while(1) {
L_main2:
;Input Capture Complete 5ch.c,180 :: 		if (poll_flag) {                                                     // Calculate finger state values (Set by timer 3)
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;Input Capture Complete 5ch.c,181 :: 		poll_flag = 0;                                                    // Clear flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,182 :: 		calc_finger_state(&fngr_pointer);                                 // Call state calculation function for each finger - equivalent of sampling
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_calc_finger_state+0
;Input Capture Complete 5ch.c,220 :: 		}
L_main4:
;Input Capture Complete 5ch.c,222 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main34
MOVW	R0, #lo_addr(_TERMINAL_PRINT_THRESH+0)
MOVT	R0, #hi_addr(_TERMINAL_PRINT_THRESH+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_terminal_print_count+0)
MOVT	R0, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L__main33
L__main32:
;Input Capture Complete 5ch.c,224 :: 		print_finger_info(&fngr_pointer);                                 // Print statistics to terminal for each finger
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,229 :: 		UART1_Write_Text("\n\n\n\n\n\n\n\r");
MOVW	R0, #lo_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,222 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
L__main34:
L__main33:
;Input Capture Complete 5ch.c,231 :: 		}
IT	AL
BAL	L_main2
;Input Capture Complete 5ch.c,232 :: 		} // Main ends here
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Pcontrol_position:
;Input Capture Complete 5ch.c,241 :: 		unsigned int Pcontrol_position(struct finger *fngr, unsigned long SP, unsigned long MPV)
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
;Input Capture Complete 5ch.c,245 :: 		if((SP-MPV) < 0)                // moved past SP
SUB	R3, R1, R2
CMP	R3, #0
IT	CS
BCS	L_Pcontrol_position8
;Input Capture Complete 5ch.c,246 :: 		fngr->direction_desired = EXTEND;              // Move back
ADDW	R4, R0, #26
; fngr end address is: 0 (R0)
MOVW	R3, #lo_addr(_EXTEND+0)
MOVT	R3, #hi_addr(_EXTEND+0)
LDRSH	R3, [R3, #0]
STRH	R3, [R4, #0]
IT	AL
BAL	L_Pcontrol_position9
L_Pcontrol_position8:
;Input Capture Complete 5ch.c,248 :: 		fngr->direction_desired = CONTRACT;         // Keep going
; fngr start address is: 0 (R0)
ADDW	R4, R0, #26
; fngr end address is: 0 (R0)
MOVW	R3, #lo_addr(_CONTRACT+0)
MOVT	R3, #hi_addr(_CONTRACT+0)
LDRSH	R3, [R3, #0]
STRH	R3, [R4, #0]
L_Pcontrol_position9:
;Input Capture Complete 5ch.c,250 :: 		duty_cycle = K*abs(SP-MPV);    // proportional control
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
;Input Capture Complete 5ch.c,252 :: 		if(duty_cycle > 100)
CMP	R3, #100
IT	LS
BLS	L_Pcontrol_position10
;Input Capture Complete 5ch.c,253 :: 		duty_cycle = 100;       // cap duty cycle
MOVS	R0, #100
IT	AL
BAL	L_Pcontrol_position11
L_Pcontrol_position10:
;Input Capture Complete 5ch.c,254 :: 		else if(duty_cycle < 20)
CMP	R0, #20
IT	CS
BCS	L__Pcontrol_position35
;Input Capture Complete 5ch.c,255 :: 		duty_cycle = 20;       // boost duty cycle
MOVS	R0, #20
; duty_cycle end address is: 0 (R0)
IT	AL
BAL	L_Pcontrol_position12
L__Pcontrol_position35:
;Input Capture Complete 5ch.c,254 :: 		else if(duty_cycle < 20)
;Input Capture Complete 5ch.c,255 :: 		duty_cycle = 20;       // boost duty cycle
L_Pcontrol_position12:
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
L_Pcontrol_position11:
;Input Capture Complete 5ch.c,257 :: 		return duty_cycle;
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
;Input Capture Complete 5ch.c,258 :: 		}
L_end_Pcontrol_position:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pcontrol_position
_move_finger:
;Input Capture Complete 5ch.c,262 :: 		void move_finger(struct finger *fngr, unsigned int duty_cycle)
; duty_cycle start address is: 4 (R1)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R4, R1
; duty_cycle end address is: 4 (R1)
; fngr end address is: 0 (R0)
; fngr start address is: 0 (R0)
; duty_cycle start address is: 16 (R4)
;Input Capture Complete 5ch.c,264 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0)
MOVW	R2, #lo_addr(?lstr8_Input_32Capture_32Complete_325ch+0)
MOVT	R2, #hi_addr(?lstr8_Input_32Capture_32Complete_325ch+0)
MOV	R1, R2
; fngr end address is: 0 (R0)
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_finger13
;Input Capture Complete 5ch.c,265 :: 		PWM_TIM1_Set_Duty(duty_cycle*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);       // set new duty cycle
MOVW	R2, #lo_addr(_pwm_period+0)
MOVT	R2, #hi_addr(_pwm_period+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R4, R2
; duty_cycle end address is: 16 (R4)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #0
BL	_PWM_TIM1_Set_Duty+0
L_move_finger13:
;Input Capture Complete 5ch.c,268 :: 		}
L_end_move_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _move_finger
_timer2_ISR:
;Input Capture Complete 5ch.c,274 :: 		void timer2_ISR() iv IVT_INT_TIM2 {
;Input Capture Complete 5ch.c,277 :: 		if(TIM2_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR14
;Input Capture Complete 5ch.c,278 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,279 :: 		tim2_overflow_count++;                                                  // Increment timer 2 overflow counter
MOVW	R1, #lo_addr(_tim2_overflow_count+0)
MOVT	R1, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,280 :: 		}
L_timer2_ISR14:
;Input Capture Complete 5ch.c,284 :: 		if (TIM2_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR15
;Input Capture Complete 5ch.c,285 :: 		fngr_thumb.enc_start_time = fngr_thumb.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+36)
MOVT	R2, #hi_addr(_fngr_thumb+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+32)
MOVT	R0, #hi_addr(_fngr_thumb+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,286 :: 		fngr_thumb.enc_end_time = TIM2_CCR1;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,287 :: 		fngr_thumb.enc_overflow_start = fngr_thumb.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+48)
MOVT	R2, #hi_addr(_fngr_thumb+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+44)
MOVT	R0, #hi_addr(_fngr_thumb+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,288 :: 		fngr_thumb.enc_overflow_end = tim2_overflow_count;                      // Store number of timer 2 overflows for thumb
MOVW	R0, #lo_addr(_tim2_overflow_count+0)
MOVT	R0, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,289 :: 		fngr_thumb.enc_chan_b = FNGR_THUMB_ENC_B;                               // Sample the second encoder channel (For direction)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_thumb+28)
MOVT	R0, #hi_addr(_fngr_thumb+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,290 :: 		fngr_thumb.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_thumb+16)
MOVT	R1, #hi_addr(_fngr_thumb+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,291 :: 		}
L_timer2_ISR15:
;Input Capture Complete 5ch.c,292 :: 		}
L_end_timer2_ISR:
BX	LR
; end of _timer2_ISR
_timer3_ISR:
;Input Capture Complete 5ch.c,296 :: 		void timer3_ISR() iv IVT_INT_TIM3 {
;Input Capture Complete 5ch.c,299 :: 		if(TIM3_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR16
;Input Capture Complete 5ch.c,300 :: 		TIM3_SR.UIF = 0;                                                        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,301 :: 		tim3_overflow_count++;                                                  // Increment timer 3 overflow counter
MOVW	R1, #lo_addr(_tim3_overflow_count+0)
MOVT	R1, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,302 :: 		}
L_timer3_ISR16:
;Input Capture Complete 5ch.c,305 :: 		if (TIM3_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR17
;Input Capture Complete 5ch.c,306 :: 		fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;                // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+36)
MOVT	R2, #hi_addr(_fngr_pointer+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+32)
MOVT	R0, #hi_addr(_fngr_pointer+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,307 :: 		fngr_pointer.enc_end_time = TIM3_CCR1;                                  // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR1+0)
MOVT	R0, #hi_addr(TIM3_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,308 :: 		fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;        // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+48)
MOVT	R2, #hi_addr(_fngr_pointer+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+44)
MOVT	R0, #hi_addr(_fngr_pointer+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,309 :: 		fngr_pointer.enc_overflow_end = tim3_overflow_count;                    // Store number of timer 3 overflows for Pointer finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,310 :: 		fngr_pointer.enc_chan_b = FNGR_POINTER_ENC_B;                           // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+28)
MOVT	R0, #hi_addr(_fngr_pointer+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,311 :: 		fngr_pointer.position_temp++;                                           // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pointer+16)
MOVT	R1, #hi_addr(_fngr_pointer+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,312 :: 		}
L_timer3_ISR17:
;Input Capture Complete 5ch.c,316 :: 		if (TIM3_SR.CC2IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR18
;Input Capture Complete 5ch.c,317 :: 		fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+36)
MOVT	R2, #hi_addr(_fngr_middle+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+32)
MOVT	R0, #hi_addr(_fngr_middle+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,318 :: 		fngr_middle.enc_end_time = TIM3_CCR2;                                   // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR2+0)
MOVT	R0, #hi_addr(TIM3_CCR2+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,319 :: 		fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+48)
MOVT	R2, #hi_addr(_fngr_middle+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+44)
MOVT	R0, #hi_addr(_fngr_middle+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,320 :: 		fngr_middle.enc_overflow_end = tim3_overflow_count;                     // Store number of timer 3 overflows for Middle finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,321 :: 		fngr_middle.enc_chan_b = FNGR_MIDDLE_ENC_B;                             // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_middle+28)
MOVT	R0, #hi_addr(_fngr_middle+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,322 :: 		fngr_middle.position_temp++;                                            // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_middle+16)
MOVT	R1, #hi_addr(_fngr_middle+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,323 :: 		}
L_timer3_ISR18:
;Input Capture Complete 5ch.c,326 :: 		if (TIM3_SR.CC3IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR19
;Input Capture Complete 5ch.c,327 :: 		fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+36)
MOVT	R2, #hi_addr(_fngr_ring+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+32)
MOVT	R0, #hi_addr(_fngr_ring+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,328 :: 		fngr_ring.enc_end_time = TIM3_CCR3;                                     // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR3+0)
MOVT	R0, #hi_addr(TIM3_CCR3+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,329 :: 		fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+48)
MOVT	R2, #hi_addr(_fngr_ring+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+44)
MOVT	R0, #hi_addr(_fngr_ring+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,330 :: 		fngr_ring.enc_overflow_end = tim3_overflow_count;                       // Store number of timer 3 overflows for Ring finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,331 :: 		fngr_ring.enc_chan_b = FNGR_RING_ENC_B;                                 // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_ring+28)
MOVT	R0, #hi_addr(_fngr_ring+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,332 :: 		fngr_ring.position_temp++;                                              // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_ring+16)
MOVT	R1, #hi_addr(_fngr_ring+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,333 :: 		}
L_timer3_ISR19:
;Input Capture Complete 5ch.c,336 :: 		if (TIM3_SR.CC4IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR20
;Input Capture Complete 5ch.c,337 :: 		fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+36)
MOVT	R2, #hi_addr(_fngr_pinky+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+32)
MOVT	R0, #hi_addr(_fngr_pinky+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,338 :: 		fngr_pinky.enc_end_time = TIM3_CCR4;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR4+0)
MOVT	R0, #hi_addr(TIM3_CCR4+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,339 :: 		fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+48)
MOVT	R2, #hi_addr(_fngr_pinky+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+44)
MOVT	R0, #hi_addr(_fngr_pinky+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,340 :: 		fngr_pinky.enc_overflow_end = tim3_overflow_count;                      // Store number of timer 3 overflows for Pinky
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,341 :: 		fngr_pinky.enc_chan_b = FNGR_PINKY_ENC_B;                               // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pinky+28)
MOVT	R0, #hi_addr(_fngr_pinky+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,342 :: 		fngr_pinky.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pinky+16)
MOVT	R1, #hi_addr(_fngr_pinky+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,343 :: 		}
L_timer3_ISR20:
;Input Capture Complete 5ch.c,344 :: 		}
L_end_timer3_ISR:
BX	LR
; end of _timer3_ISR
_timer11_ISR:
;Input Capture Complete 5ch.c,348 :: 		void timer11_ISR() iv IVT_INT_TIM1_TRG_COM_TIM11 {
;Input Capture Complete 5ch.c,350 :: 		TIM11_SR.UIF = 0;                                                           // Clear timer 11 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_SR+0)
MOVT	R0, #hi_addr(TIM11_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,351 :: 		poll_flag = 1;                                                              // Set poll flag for main loop
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,352 :: 		terminal_print_count++;                                                     // Increment the debug print counter
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,353 :: 		}
L_end_timer11_ISR:
BX	LR
; end of _timer11_ISR
_init_GPIO:
;Input Capture Complete 5ch.c,360 :: 		void init_GPIO() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,363 :: 		GPIO_Digital_Input(&GPIOE_BASE, _GPIO_PINMASK_12);                          // Pointer motor encoder channel B
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Complete 5ch.c,364 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_11);                          // Middle motor encoder channel B
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Complete 5ch.c,365 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_15);                          // Ring motor encoder channel B
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Complete 5ch.c,366 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_9);                           // Pinky motor encoder channel B
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Complete 5ch.c,367 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_11);                          // Thumb motor encoder channel B
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,370 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                         // Pointer direction
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,371 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);                          // Motor enable: may not use in this test
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,372 :: 		}
L_end_init_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_GPIO
_init_pointer_PWM:
;Input Capture Complete 5ch.c,376 :: 		void init_pointer_PWM( ) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,378 :: 		pwm_period = PWM_TIM1_Init(PWM_FREQ_HZ);                                   // Set PWM base frequency to 100 Hz
MOVW	R0, #lo_addr(_PWM_FREQ_HZ+0)
MOVT	R0, #hi_addr(_PWM_FREQ_HZ+0)
LDR	R0, [R0, #0]
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,379 :: 		PWM_TIM1_Set_Duty(70*(pwm_period/100), _PWM_NON_INVERTED, POINTER_PWM);    // Set 70% duty on Timer 1, channel 1
MOVS	R1, #100
UDIV	R1, R0, R1
UXTH	R1, R1
MOVS	R0, #70
MULS	R0, R1, R0
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,380 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;Input Capture Complete 5ch.c,381 :: 		}
L_end_init_pointer_PWM:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_pointer_PWM
_init_finger:
;Input Capture Complete 5ch.c,385 :: 		void init_finger(struct finger *fngr)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
; fngr end address is: 0 (R0)
; fngr start address is: 0 (R0)
;Input Capture Complete 5ch.c,387 :: 		fngr->position_actual = 0;
ADDW	R2, R0, #20
; fngr end address is: 0 (R0)
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Complete 5ch.c,388 :: 		POINTER_DIRECTION = CONTRACT;        // skips over using POINTER_DIRECTION
MOVW	R1, #lo_addr(_CONTRACT+0)
MOVT	R1, #hi_addr(_CONTRACT+0)
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,389 :: 		}
L_end_init_finger:
ADD	SP, SP, #4
BX	LR
; end of _init_finger
_init_UART:
;Input Capture Complete 5ch.c,393 :: 		void init_UART() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,395 :: 		UART1_Init(UART_BAUD_RATE);                                                 // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;Input Capture Complete 5ch.c,396 :: 		Delay_ms(200);                                                              // Wait for UART to stabilize
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_init_UART21:
SUBS	R7, R7, #1
BNE	L_init_UART21
NOP
NOP
NOP
;Input Capture Complete 5ch.c,397 :: 		UART_Write_Text("\rUART Init Complete\r\n");                                // *** DEBUG *** Print test statement to terminal
MOVW	R0, #lo_addr(?lstr9_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr9_Input_32Capture_32Complete_325ch+0)
BL	_UART_Write_Text+0
;Input Capture Complete 5ch.c,398 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_init_input_capture:
;Input Capture Complete 5ch.c,402 :: 		void init_input_capture() {
SUB	SP, SP, #24
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,406 :: 		RCC_APB1ENR.TIM3EN = 1;                                                     // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,407 :: 		TIM3_CR1.CEN = 0;                                                           // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,408 :: 		TIM3_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM3_CR2+0)
MOVT	R0, #hi_addr(TIM3_CR2+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,409 :: 		TIM3_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
STR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,410 :: 		TIM3_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
STR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,411 :: 		TIM3_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,414 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH1_PC6);                 // Configure alternate function for C6 as Timer 3 Channel 1
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM3_CH1_PC6+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM3_CH1_PC6+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Complete 5ch.c,415 :: 		TIM3_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,416 :: 		TIM3_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,417 :: 		TIM3_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,418 :: 		TIM3_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,419 :: 		TIM3_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,422 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH2_PC7);                 // Configure alternate function for pin C7 as Timer 3 Channel 2
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM3_CH2_PC7+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM3_CH2_PC7+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Complete 5ch.c,423 :: 		TIM3_CCMR1_Input |= 0x100;                                                  // Set capture channel 2 as input on TI2 (CC2S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,424 :: 		TIM3_CCER.CC2P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,425 :: 		TIM3_CCER.CC2NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,426 :: 		TIM3_CCER.CC2E = 1;                                                         // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,427 :: 		TIM3_DIER.CC2IE = 1;                                                        // Enable interrupt on capture channel 2
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,430 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH3_PC8);                 // Configure alternate function for pin BC8 as Timer 3 Channel 3
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM3_CH3_PC8+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM3_CH3_PC8+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Complete 5ch.c,431 :: 		TIM3_CCMR2_Input |= 0x01;                                                   // Set capture channel 3 as input on TI3 (CC3S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,432 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,433 :: 		TIM3_CCER.CC3NP = 0;                                                         // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,434 :: 		TIM3_CCER.CC3E = 1;                                                         // Enable capture on channel 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,435 :: 		TIM3_DIER.CC3IE = 1;                                                        // Enable interrupt on capture channel 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,438 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH4_PC9);                 // Configure alternate function for pin C9 as Timer 3 Channel 4
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM3_CH4_PC9+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM3_CH4_PC9+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Complete 5ch.c,439 :: 		TIM3_CCMR2_Input |= 0x100;                                                  // Set capture channel 4 as input on TI4 (CC4S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,440 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,441 :: 		TIM3_CCER.CC3NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,442 :: 		TIM3_CCER.CC4E = 1;                                                         // Enable capture on channel 4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,443 :: 		TIM3_DIER.CC4IE = 1;                                                        // Enable interrupt on capture channel 4
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,447 :: 		RCC_APB1ENR.TIM2EN = 1;                                                     // Enable clock gating for timer module 5
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,448 :: 		TIM2_CR1.CEN = 0;                                                           // Disable timer/counter
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,449 :: 		TIM2_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM2_CR2+0)
MOVT	R0, #hi_addr(TIM2_CR2+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,450 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
LDR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,451 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
LDR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,452 :: 		TIM2_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,455 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA5);                 // Configure alternate function for A5 as Timer 2 Channel 1
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH1_PA5+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH1_PA5+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Complete 5ch.c,456 :: 		TIM2_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,457 :: 		TIM2_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,458 :: 		TIM2_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,459 :: 		TIM2_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,460 :: 		TIM2_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,464 :: 		TIM3_DIER.UIE = 1;                                                          // Enable overflow interrupt Timer 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,465 :: 		TIM2_DIER.UIE = 1;                                                          // Enable overflow interrupt for Timer 2
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,466 :: 		NVIC_IntEnable(IVT_INT_TIM3);                                               // Enable timer 3 ISR
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,467 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                               // Enable timer 2 ISR
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,468 :: 		TIM3_CR1.CEN = 1;                                                           // Enable timer 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,469 :: 		TIM2_CR1.CEN = 1;                                                           // Enable Timer 2
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,473 :: 		encoder_timer_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
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
;Input Capture Complete 5ch.c,474 :: 		}
L_end_init_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _init_input_capture
_init_timer11:
;Input Capture Complete 5ch.c,479 :: 		void init_timer11() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,481 :: 		RCC_APB2ENR.TIM11EN = 1;                                                    // Enable clock for timer 11
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,482 :: 		TIM11_CR1.CEN = 0;                                                          // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,483 :: 		TIM11_PSC = SAMPLE_TIM_PSC;                                                 // Set timer 11 prescaler
MOVW	R0, #lo_addr(_SAMPLE_TIM_PSC+0)
MOVT	R0, #hi_addr(_SAMPLE_TIM_PSC+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM11_PSC+0)
MOVT	R0, #hi_addr(TIM11_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,484 :: 		TIM11_ARR = SAMPLE_TIM_RELOAD;                                              // Set timer 11 overflow value
MOVW	R0, #lo_addr(_SAMPLE_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_SAMPLE_TIM_RELOAD+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM11_ARR+0)
MOVT	R0, #hi_addr(TIM11_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,485 :: 		NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);                                 // Enable timer 11 interrupt
MOVW	R0, #42
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,486 :: 		TIM11_DIER.UIE = 1;                                                         // Timer 11 update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_DIER+0)
MOVT	R0, #hi_addr(TIM11_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,487 :: 		TIM11_CR1.CEN = 1;                                                          // Enable timer/counter
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,488 :: 		}
L_end_init_timer11:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_timer11
_calc_finger_state:
;Input Capture Complete 5ch.c,495 :: 		void calc_finger_state( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R9, R0
; fngr end address is: 0 (R0)
; fngr start address is: 36 (R9)
;Input Capture Complete 5ch.c,498 :: 		fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;
ADD	R3, R9, #52
ADD	R1, R9, #48
LDR	R2, [R1, #0]
ADD	R1, R9, #44
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,501 :: 		fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);
ADD	R3, R9, #56
ADD	R1, R9, #52
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R1, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R1, #0]
SUBS	R1, R1, #3
MULS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,504 :: 		fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;
ADD	R3, R9, #40
ADD	R1, R9, #36
LDR	R2, [R1, #0]
ADD	R1, R9, #32
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,507 :: 		fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;
ADD	R3, R9, #60
ADD	R1, R9, #56
LDR	R2, [R1, #0]
ADD	R1, R9, #40
LDR	R1, [R1, #0]
ADDS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,510 :: 		fngr->input_sig_period = (long double) fngr->enc_total_ticks * encoder_timer_period_ms;
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
;Input Capture Complete 5ch.c,513 :: 		fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
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
;Input Capture Complete 5ch.c,514 :: 		if (fngr->input_sig_frequency > 20000.0)                                    // NEW: Handles startup error
ADD	R1, R9, #64
LDR	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#0, S1, S1
MOVW	R1, #16384
MOVT	R1, #18076
VMOV	S0, R1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_calc_finger_state23
;Input Capture Complete 5ch.c,515 :: 		fngr->input_sig_frequency = 0;
ADD	R2, R9, #64
MOVS	R1, #0
STR	R1, [R2, #0]
L_calc_finger_state23:
;Input Capture Complete 5ch.c,518 :: 		if (fngr->enc_chan_b == 1) {                                                // Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_calc_finger_state24
;Input Capture Complete 5ch.c,519 :: 		fngr->direction_actual = CONTRACT;
ADD	R2, R9, #24
MOVW	R1, #lo_addr(_CONTRACT+0)
MOVT	R1, #hi_addr(_CONTRACT+0)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,520 :: 		fngr->position_actual += (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
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
;Input Capture Complete 5ch.c,521 :: 		}
IT	AL
BAL	L_calc_finger_state25
L_calc_finger_state24:
;Input Capture Complete 5ch.c,523 :: 		else if (fngr->enc_chan_b == 0) {                                           // Counter Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_calc_finger_state26
;Input Capture Complete 5ch.c,524 :: 		fngr->direction_actual = EXTEND;
ADD	R2, R9, #24
MOVW	R1, #lo_addr(_EXTEND+0)
MOVT	R1, #hi_addr(_EXTEND+0)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,525 :: 		fngr->position_actual -= (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
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
;Input Capture Complete 5ch.c,526 :: 		}
IT	AL
BAL	L_calc_finger_state27
L_calc_finger_state26:
;Input Capture Complete 5ch.c,529 :: 		fngr->direction_actual = 7;
ADD	R2, R9, #24
MOVS	R1, #7
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,530 :: 		}
L_calc_finger_state27:
L_calc_finger_state25:
;Input Capture Complete 5ch.c,534 :: 		if(fngr->position_actual >= FULLY_CONTRACTED) {  // don't run too far!
ADD	R1, R9, #20
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_FULLY_CONTRACTED+0)
MOVT	R1, #hi_addr(_FULLY_CONTRACTED+0)
LDR	R1, [R1, #0]
CMP	R2, R1
IT	CC
BCC	L_calc_finger_state28
;Input Capture Complete 5ch.c,535 :: 		fngr->direction_desired = EXTEND;
ADD	R3, R9, #26
MOVW	R2, #lo_addr(_EXTEND+0)
MOVT	R2, #hi_addr(_EXTEND+0)
LDRSH	R1, [R2, #0]
STRH	R1, [R3, #0]
;Input Capture Complete 5ch.c,536 :: 		POINTER_DIRECTION = EXTEND;
MOV	R1, R2
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,537 :: 		}
L_calc_finger_state28:
;Input Capture Complete 5ch.c,539 :: 		if(fngr->position_actual <= FULLY_EXTENDED) {
ADD	R1, R9, #20
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_FULLY_EXTENDED+0)
MOVT	R1, #hi_addr(_FULLY_EXTENDED+0)
LDR	R1, [R1, #0]
CMP	R2, R1
IT	GT
BGT	L_calc_finger_state29
;Input Capture Complete 5ch.c,540 :: 		fngr->direction_desired = CONTRACT;
ADD	R3, R9, #26
MOVW	R2, #lo_addr(_CONTRACT+0)
MOVT	R2, #hi_addr(_CONTRACT+0)
LDRSH	R1, [R2, #0]
STRH	R1, [R3, #0]
;Input Capture Complete 5ch.c,541 :: 		POINTER_DIRECTION = CONTRACT;
MOV	R1, R2
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,542 :: 		}
L_calc_finger_state29:
;Input Capture Complete 5ch.c,545 :: 		fngr->position_temp = 0;
ADD	R2, R9, #16
; fngr end address is: 36 (R9)
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Complete 5ch.c,546 :: 		}
L_end_calc_finger_state:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _calc_finger_state
_print_finger_info:
;Input Capture Complete 5ch.c,550 :: 		void print_finger_info( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #36
STR	LR, [SP, #0]
MOV	R7, R0
; fngr end address is: 0 (R0)
; fngr start address is: 28 (R7)
;Input Capture Complete 5ch.c,557 :: 		UART1_Write_Text("\n\rFinger Name: ");                                      //Print name of current finger to terminal
MOVW	R1, #lo_addr(?lstr10_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr10_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,558 :: 		UART1_Write_Text(fngr->name);
MOV	R0, R7
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,559 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr11_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr11_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,561 :: 		LongWordToStr(fngr->input_sig_frequency, frequency_text);                   // Print input capture signal frequency to terminal
ADD	R2, SP, #4
ADDW	R1, R7, #64
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;Input Capture Complete 5ch.c,562 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R1, #lo_addr(?lstr12_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr12_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,563 :: 		UART1_Write_Text(frequency_text);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,564 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr13_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr13_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,567 :: 		UART1_Write_Text("Direction of movement:             ");
MOVW	R1, #lo_addr(?lstr14_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr14_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,568 :: 		if(fngr->direction_actual == EXTEND)
ADDW	R1, R7, #24
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_EXTEND+0)
MOVT	R1, #hi_addr(_EXTEND+0)
LDRSH	R1, [R1, #0]
CMP	R2, R1
IT	NE
BNE	L_print_finger_info30
;Input Capture Complete 5ch.c,569 :: 		UART1_Write_Text("EXTEND ");
MOVW	R1, #lo_addr(?lstr15_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr15_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
IT	AL
BAL	L_print_finger_info31
L_print_finger_info30:
;Input Capture Complete 5ch.c,571 :: 		UART1_Write_Text("CONTRACT ");
MOVW	R1, #lo_addr(?lstr16_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr16_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
L_print_finger_info31:
;Input Capture Complete 5ch.c,573 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr17_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr17_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,575 :: 		LongToStr(fngr->position_actual, position_text);                            // Print total number of input events (position) to terminal
ADD	R2, SP, #19
ADDW	R1, R7, #20
; fngr end address is: 28 (R7)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongToStr+0
;Input Capture Complete 5ch.c,576 :: 		UART1_Write_Text("Position of finger:                ");
MOVW	R1, #lo_addr(?lstr18_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr18_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,577 :: 		UART1_Write_Text(position_text);
ADD	R1, SP, #19
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,578 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr19_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr19_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,580 :: 		terminal_print_count = 0;                                                   // Reset counter for terminal printing
MOVS	R2, #0
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
STRH	R2, [R1, #0]
;Input Capture Complete 5ch.c,581 :: 		}
L_end_print_finger_info:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _print_finger_info
