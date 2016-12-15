_main:
;Input Capture Complete 5ch.c,145 :: 		void main() {
SUB	SP, SP, #4
;Input Capture Complete 5ch.c,149 :: 		init_UART();                                                            // Configure and Initialize UART serial communications
BL	_init_UART+0
;Input Capture Complete 5ch.c,150 :: 		init_GPIO();                                                            // Configure MCU I/O
BL	_init_GPIO+0
;Input Capture Complete 5ch.c,151 :: 		init_pointer_PWM(0);                                                    // Set up PWM with 0% duty cycle
MOVS	R0, #0
BL	_init_pointer_PWM+0
;Input Capture Complete 5ch.c,153 :: 		while(1)
L_main0:
;Input Capture Complete 5ch.c,156 :: 		POINTER_DIRECTION = EXTEND;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,157 :: 		if(GRAB_MODE_BUTTON == 1)  // pressing the button runs the motor
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main2
;Input Capture Complete 5ch.c,158 :: 		move_pointer_finger(&fngr_pointer, 100);                                // Extend finger at 100% without position control - visually choose where it stops
MOVS	R1, #100
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_move_pointer_finger+0
IT	AL
BAL	L_main3
L_main2:
;Input Capture Complete 5ch.c,160 :: 		move_pointer_finger(&fngr_pointer, 0);
MOVS	R1, #0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_move_pointer_finger+0
L_main3:
;Input Capture Complete 5ch.c,161 :: 		}
IT	AL
BAL	L_main0
;Input Capture Complete 5ch.c,296 :: 		} // Main ends here
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Pcontrol_force:
;Input Capture Complete 5ch.c,305 :: 		unsigned int Pcontrol_force(struct finger *fngr, unsigned int SP, unsigned int MPV)
; MPV start address is: 8 (R2)
; SP start address is: 4 (R1)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
UXTH	R6, R1
UXTH	R7, R2
; MPV end address is: 8 (R2)
; SP end address is: 4 (R1)
; fngr end address is: 0 (R0)
; fngr start address is: 20 (R5)
; SP start address is: 24 (R6)
; MPV start address is: 28 (R7)
;Input Capture Complete 5ch.c,309 :: 		if((SP-MPV) < 0)                // moved past SP
SUB	R3, R6, R7
UXTH	R3, R3
CMP	R3, #0
IT	CS
BCS	L_Pcontrol_force4
;Input Capture Complete 5ch.c,310 :: 		fngr->direction_desired = EXTEND;              // Move back
ADDW	R4, R5, #26
MOVS	R3, #1
STRH	R3, [R4, #0]
IT	AL
BAL	L_Pcontrol_force5
L_Pcontrol_force4:
;Input Capture Complete 5ch.c,312 :: 		fngr->direction_desired = CONTRACT;         // Keep going
ADDW	R4, R5, #26
MOVS	R3, #0
STRH	R3, [R4, #0]
L_Pcontrol_force5:
;Input Capture Complete 5ch.c,314 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0)     {
MOVW	R3, #lo_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOVT	R3, #hi_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOV	R1, R3
MOV	R0, R5
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Pcontrol_force6
;Input Capture Complete 5ch.c,315 :: 		POINTER_DIRECTION = fngr->direction_desired;
ADDW	R3, R5, #26
; fngr end address is: 20 (R5)
LDRH	R4, [R3, #0]
MOVW	R3, #lo_addr(GPIOE_ODR+0)
MOVT	R3, #hi_addr(GPIOE_ODR+0)
STR	R4, [R3, #0]
;Input Capture Complete 5ch.c,316 :: 		}
L_Pcontrol_force6:
;Input Capture Complete 5ch.c,318 :: 		duty_cycle = FORCE_K*abs(SP-MPV);    // proportional control
SUB	R3, R6, R7
; SP end address is: 24 (R6)
; MPV end address is: 28 (R7)
SXTH	R0, R3
BL	_abs+0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R3, #lo_addr(_FORCE_K+0)
MOVT	R3, #hi_addr(_FORCE_K+0)
VLDR	#1, S0, [R3, #0]
VMUL.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
UXTH	R3, R3
; duty_cycle start address is: 0 (R0)
UXTH	R0, R3
;Input Capture Complete 5ch.c,320 :: 		if(duty_cycle > 100)
CMP	R3, #100
IT	LS
BLS	L_Pcontrol_force7
;Input Capture Complete 5ch.c,321 :: 		duty_cycle = 100;       // cap duty cycle
MOVS	R0, #100
IT	AL
BAL	L_Pcontrol_force8
L_Pcontrol_force7:
;Input Capture Complete 5ch.c,322 :: 		else if(duty_cycle < 20)
CMP	R0, #20
IT	CS
BCS	L__Pcontrol_force46
;Input Capture Complete 5ch.c,323 :: 		duty_cycle = 20;       // boost duty cycle
MOVS	R0, #20
; duty_cycle end address is: 0 (R0)
IT	AL
BAL	L_Pcontrol_force9
L__Pcontrol_force46:
;Input Capture Complete 5ch.c,322 :: 		else if(duty_cycle < 20)
;Input Capture Complete 5ch.c,323 :: 		duty_cycle = 20;       // boost duty cycle
L_Pcontrol_force9:
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
L_Pcontrol_force8:
;Input Capture Complete 5ch.c,325 :: 		return duty_cycle;
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
;Input Capture Complete 5ch.c,326 :: 		}
L_end_Pcontrol_force:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pcontrol_force
_move_pointer_finger:
;Input Capture Complete 5ch.c,330 :: 		void move_pointer_finger(struct finger *fngr, unsigned int duty_cycle)
; duty_cycle start address is: 4 (R1)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; duty_cycle end address is: 4 (R1)
; duty_cycle start address is: 4 (R1)
;Input Capture Complete 5ch.c,333 :: 		PWM_TIM1_Set_Duty(duty_cycle*(PWM_PERIOD_TIM1/100), _PWM_NON_INVERTED, POINTER_PWM);       // set new duty cycle
MOVW	R2, #lo_addr(_PWM_PERIOD_TIM1+0)
MOVT	R2, #hi_addr(_PWM_PERIOD_TIM1+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R1, R2
; duty_cycle end address is: 4 (R1)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,336 :: 		}
L_end_move_pointer_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _move_pointer_finger
_timer2_ISR:
;Input Capture Complete 5ch.c,342 :: 		void timer2_ISR() iv IVT_INT_TIM2 {
;Input Capture Complete 5ch.c,345 :: 		if(TIM2_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR10
;Input Capture Complete 5ch.c,346 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,347 :: 		tim2_overflow_count++;                                                  // Increment timer 2 overflow counter
MOVW	R1, #lo_addr(_tim2_overflow_count+0)
MOVT	R1, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,348 :: 		}
L_timer2_ISR10:
;Input Capture Complete 5ch.c,352 :: 		if (TIM2_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR11
;Input Capture Complete 5ch.c,353 :: 		fngr_thumb.enc_start_time = fngr_thumb.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+36)
MOVT	R2, #hi_addr(_fngr_thumb+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+32)
MOVT	R0, #hi_addr(_fngr_thumb+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,354 :: 		fngr_thumb.enc_end_time = TIM2_CCR1;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,355 :: 		fngr_thumb.enc_overflow_start = fngr_thumb.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+48)
MOVT	R2, #hi_addr(_fngr_thumb+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+44)
MOVT	R0, #hi_addr(_fngr_thumb+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,356 :: 		fngr_thumb.enc_overflow_end = tim2_overflow_count;                      // Store number of timer 2 overflows for thumb
MOVW	R0, #lo_addr(_tim2_overflow_count+0)
MOVT	R0, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,357 :: 		fngr_thumb.enc_chan_b = THUMB_ENCODER_B;                               // Sample the second encoder channel (For direction)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_thumb+28)
MOVT	R0, #hi_addr(_fngr_thumb+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,358 :: 		fngr_thumb.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_thumb+16)
MOVT	R1, #hi_addr(_fngr_thumb+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,359 :: 		}
L_timer2_ISR11:
;Input Capture Complete 5ch.c,360 :: 		}
L_end_timer2_ISR:
BX	LR
; end of _timer2_ISR
_timer3_ISR:
;Input Capture Complete 5ch.c,364 :: 		void timer3_ISR() iv IVT_INT_TIM3 {
;Input Capture Complete 5ch.c,367 :: 		if(TIM3_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR12
;Input Capture Complete 5ch.c,368 :: 		TIM3_SR.UIF = 0;                                                        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,369 :: 		tim3_overflow_count++;                                                  // Increment timer 3 overflow counter
MOVW	R1, #lo_addr(_tim3_overflow_count+0)
MOVT	R1, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,370 :: 		}
L_timer3_ISR12:
;Input Capture Complete 5ch.c,373 :: 		if (TIM3_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR13
;Input Capture Complete 5ch.c,374 :: 		fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;                // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+36)
MOVT	R2, #hi_addr(_fngr_pointer+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+32)
MOVT	R0, #hi_addr(_fngr_pointer+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,375 :: 		fngr_pointer.enc_end_time = TIM3_CCR1;                                  // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR1+0)
MOVT	R0, #hi_addr(TIM3_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,376 :: 		fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;        // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+48)
MOVT	R2, #hi_addr(_fngr_pointer+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+44)
MOVT	R0, #hi_addr(_fngr_pointer+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,377 :: 		fngr_pointer.enc_overflow_end = tim3_overflow_count;                    // Store number of timer 3 overflows for Pointer finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,378 :: 		fngr_pointer.enc_chan_b = POINTER_ENCODER_B;                           // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+28)
MOVT	R0, #hi_addr(_fngr_pointer+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,379 :: 		fngr_pointer.position_temp++;                                           // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pointer+16)
MOVT	R1, #hi_addr(_fngr_pointer+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,380 :: 		}
L_timer3_ISR13:
;Input Capture Complete 5ch.c,384 :: 		if (TIM3_SR.CC2IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR14
;Input Capture Complete 5ch.c,385 :: 		fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+36)
MOVT	R2, #hi_addr(_fngr_middle+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+32)
MOVT	R0, #hi_addr(_fngr_middle+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,386 :: 		fngr_middle.enc_end_time = TIM3_CCR2;                                   // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR2+0)
MOVT	R0, #hi_addr(TIM3_CCR2+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,387 :: 		fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+48)
MOVT	R2, #hi_addr(_fngr_middle+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+44)
MOVT	R0, #hi_addr(_fngr_middle+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,388 :: 		fngr_middle.enc_overflow_end = tim3_overflow_count;                     // Store number of timer 3 overflows for Middle finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,389 :: 		fngr_middle.enc_chan_b = MIDDLE_ENCODER_B;                             // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_middle+28)
MOVT	R0, #hi_addr(_fngr_middle+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,390 :: 		fngr_middle.position_temp++;                                            // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_middle+16)
MOVT	R1, #hi_addr(_fngr_middle+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,391 :: 		}
L_timer3_ISR14:
;Input Capture Complete 5ch.c,394 :: 		if (TIM3_SR.CC3IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR15
;Input Capture Complete 5ch.c,395 :: 		fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+36)
MOVT	R2, #hi_addr(_fngr_ring+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+32)
MOVT	R0, #hi_addr(_fngr_ring+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,396 :: 		fngr_ring.enc_end_time = TIM3_CCR3;                                     // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR3+0)
MOVT	R0, #hi_addr(TIM3_CCR3+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,397 :: 		fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+48)
MOVT	R2, #hi_addr(_fngr_ring+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+44)
MOVT	R0, #hi_addr(_fngr_ring+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,398 :: 		fngr_ring.enc_overflow_end = tim3_overflow_count;                       // Store number of timer 3 overflows for Ring finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,399 :: 		fngr_ring.enc_chan_b = RING_ENCODER_B;                                 // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_ring+28)
MOVT	R0, #hi_addr(_fngr_ring+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,400 :: 		fngr_ring.position_temp++;                                              // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_ring+16)
MOVT	R1, #hi_addr(_fngr_ring+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,401 :: 		}
L_timer3_ISR15:
;Input Capture Complete 5ch.c,404 :: 		if (TIM3_SR.CC4IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR16
;Input Capture Complete 5ch.c,405 :: 		fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+36)
MOVT	R2, #hi_addr(_fngr_pinky+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+32)
MOVT	R0, #hi_addr(_fngr_pinky+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,406 :: 		fngr_pinky.enc_end_time = TIM3_CCR4;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR4+0)
MOVT	R0, #hi_addr(TIM3_CCR4+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,407 :: 		fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+48)
MOVT	R2, #hi_addr(_fngr_pinky+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+44)
MOVT	R0, #hi_addr(_fngr_pinky+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,408 :: 		fngr_pinky.enc_overflow_end = tim3_overflow_count;                      // Store number of timer 3 overflows for Pinky
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,409 :: 		fngr_pinky.enc_chan_b = PINKY_ENCODER_B;                               // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pinky+28)
MOVT	R0, #hi_addr(_fngr_pinky+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,410 :: 		fngr_pinky.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pinky+16)
MOVT	R1, #hi_addr(_fngr_pinky+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,411 :: 		}
L_timer3_ISR16:
;Input Capture Complete 5ch.c,412 :: 		}
L_end_timer3_ISR:
BX	LR
; end of _timer3_ISR
_timer11_ISR:
;Input Capture Complete 5ch.c,416 :: 		void timer11_ISR() iv IVT_INT_TIM1_TRG_COM_TIM11 {
;Input Capture Complete 5ch.c,418 :: 		TIM11_SR.UIF = 0;                                                           // Clear timer 11 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_SR+0)
MOVT	R0, #hi_addr(TIM11_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,419 :: 		poll_flag = 1;                                                              // Set poll flag for main loop
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,420 :: 		terminal_print_count++;                                                     // Increment the debug print counter
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,421 :: 		}
L_end_timer11_ISR:
BX	LR
; end of _timer11_ISR
_init_GPIO:
;Input Capture Complete 5ch.c,428 :: 		void init_GPIO() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,433 :: 		_GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #4096
;Input Capture Complete 5ch.c,432 :: 		GPIO_Config(&GPIOE_BASE,                                                    // Pointer Encoder Channel B
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
;Input Capture Complete 5ch.c,433 :: 		_GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,436 :: 		_GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #2048
;Input Capture Complete 5ch.c,435 :: 		GPIO_Config(&GPIOA_BASE,                                                    // Middle Encoder Channel B
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;Input Capture Complete 5ch.c,436 :: 		_GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,439 :: 		_GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #32768
;Input Capture Complete 5ch.c,438 :: 		GPIO_Config(&GPIOB_BASE,                                                    // Ring Encoder Channel B
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;Input Capture Complete 5ch.c,439 :: 		_GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,442 :: 		_GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #512
;Input Capture Complete 5ch.c,441 :: 		GPIO_Config(&GPIOD_BASE,                                                    // Pinky Encoder Channel B
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
;Input Capture Complete 5ch.c,442 :: 		_GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,445 :: 		_GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #2048
;Input Capture Complete 5ch.c,444 :: 		GPIO_Config(&GPIOC_BASE,                                                    // Thumb Encoder Channel B
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;Input Capture Complete 5ch.c,445 :: 		_GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,448 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                         // Pointer direction
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,449 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_10);                         // Middle direction
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,450 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_13);                         // Ring direction
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,451 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_8);                          // Pinky direction
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,452 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12);                         // Thumb direction
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,453 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);                          // Motor enable: may not use in this test
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,456 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7 | _GPIO_PINMASK_9);
MOVW	R1, #640
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,459 :: 		GPIO_Digital_input(&GPIOD_BASE, _GPIO_PINMASK_3);		// Enable digital input on B3
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Complete 5ch.c,460 :: 		SYSCFGEN_bit = 1;					//Enable system config controller clock
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,461 :: 		SYSCFG_EXTICR1bits.EXTI3 = 3;		// Map external interrupt 3 to port B
MOVS	R2, #3
MOVW	R1, #lo_addr(SYSCFG_EXTICR1bits+0)
MOVT	R1, #hi_addr(SYSCFG_EXTICR1bits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #12, #4
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,462 :: 		EXTI_RTSRbits.TR3 = 1;				// Set interrupt on rising edge
MOVW	R0, #lo_addr(EXTI_RTSRbits+0)
MOVT	R0, #hi_addr(EXTI_RTSRbits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,463 :: 		EXTI_IMRbits.MR3 = 1;				// Unmask bit 3 to enable external interrupt on line 3
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,464 :: 		NVIC_IntEnable(IVT_INT_EXTI3);     //Enable external interrupt B3 for EMG override button
MOVW	R0, #25
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,466 :: 		}
L_end_init_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_GPIO
_init_pointer_PWM:
;Input Capture Complete 5ch.c,470 :: 		void init_pointer_PWM(unsigned int dutyCycle) {
; dutyCycle start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R5, R0
; dutyCycle end address is: 0 (R0)
; dutyCycle start address is: 20 (R5)
;Input Capture Complete 5ch.c,472 :: 		PWM_PERIOD_TIM1 = PWM_TIM1_Init(PWM_FREQ_HZ);                                   // Set PWM base frequency to 100 Hz
MOVW	R1, #lo_addr(_PWM_FREQ_HZ+0)
MOVT	R1, #hi_addr(_PWM_FREQ_HZ+0)
LDR	R1, [R1, #0]
MOV	R0, R1
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_PWM_PERIOD_TIM1+0)
MOVT	R1, #hi_addr(_PWM_PERIOD_TIM1+0)
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,473 :: 		PWM_TIM1_Set_Duty(dutyCycle*(PWM_PERIOD_TIM1/100), _PWM_NON_INVERTED, POINTER_PWM);    // Set duty on Timer 1, channel 1
MOVS	R1, #100
UDIV	R1, R0, R1
UXTH	R1, R1
MULS	R1, R5, R1
; dutyCycle end address is: 20 (R5)
MOVS	R2, #0
UXTH	R0, R1
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,474 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;Input Capture Complete 5ch.c,475 :: 		}
L_end_init_pointer_PWM:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_pointer_PWM
_init_finger:
;Input Capture Complete 5ch.c,479 :: 		void init_finger(struct finger *fngr)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R12, R0
; fngr end address is: 0 (R0)
; fngr start address is: 48 (R12)
;Input Capture Complete 5ch.c,481 :: 		fngr->position_actual = 0;
ADD	R2, R12, #20
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Complete 5ch.c,482 :: 		fngr->direction_desired = CONTRACT;
ADD	R2, R12, #26
MOVS	R1, #0
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,484 :: 		if (strcmp(fngr->name, "fngr_pointer") == 0) {
MOVW	R1, #lo_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger17
;Input Capture Complete 5ch.c,485 :: 		POINTER_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,486 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_7);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #128
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,487 :: 		}
IT	AL
BAL	L_init_finger18
L_init_finger17:
;Input Capture Complete 5ch.c,488 :: 		else if (strcmp(fngr->name, "fngr_middle") == 0) {
; fngr start address is: 48 (R12)
MOVW	R1, #lo_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger19
;Input Capture Complete 5ch.c,489 :: 		MIDDLE_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,490 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_9);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #512
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,491 :: 		}
IT	AL
BAL	L_init_finger20
L_init_finger19:
;Input Capture Complete 5ch.c,492 :: 		else if (strcmp(fngr->name, "fngr_ring") == 0) {
; fngr start address is: 48 (R12)
MOVW	R1, #lo_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger21
;Input Capture Complete 5ch.c,493 :: 		RING_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,494 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_11);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #2048
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,495 :: 		}
IT	AL
BAL	L_init_finger22
L_init_finger21:
;Input Capture Complete 5ch.c,496 :: 		else if (strcmp(fngr->name, "fngr_pinky") == 0) {
; fngr start address is: 48 (R12)
MOVW	R1, #lo_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger23
;Input Capture Complete 5ch.c,497 :: 		PINKY_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,498 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_13);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #8192
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,500 :: 		}
IT	AL
BAL	L_init_finger24
L_init_finger23:
;Input Capture Complete 5ch.c,501 :: 		else if (strcmp(fngr->name, "fngr_thumb") == 0) {
; fngr start address is: 48 (R12)
MOVW	R1, #lo_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger25
;Input Capture Complete 5ch.c,502 :: 		THUMB_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,503 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,504 :: 		}
L_init_finger25:
L_init_finger24:
L_init_finger22:
L_init_finger20:
L_init_finger18:
;Input Capture Complete 5ch.c,505 :: 		}
L_end_init_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_finger
_init_UART:
;Input Capture Complete 5ch.c,509 :: 		void init_UART() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,511 :: 		UART1_Init(UART_BAUD_RATE);                                                 // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;Input Capture Complete 5ch.c,512 :: 		Delay_ms(200);                                                              // Wait for UART to stabilize
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_init_UART26:
SUBS	R7, R7, #1
BNE	L_init_UART26
NOP
NOP
NOP
;Input Capture Complete 5ch.c,513 :: 		UART_Write_Text("\rUART Init Complete\r\n");                                // *** DEBUG *** Print test statement to terminal
MOVW	R0, #lo_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
BL	_UART_Write_Text+0
;Input Capture Complete 5ch.c,514 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_init_input_capture:
;Input Capture Complete 5ch.c,518 :: 		void init_input_capture() {
SUB	SP, SP, #24
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,522 :: 		RCC_APB1ENR.TIM3EN = 1;                                                     // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,523 :: 		TIM3_CR1.CEN = 0;                                                           // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,524 :: 		TIM3_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM3_CR2+0)
MOVT	R0, #hi_addr(TIM3_CR2+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,525 :: 		TIM3_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
STR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,526 :: 		TIM3_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
STR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,527 :: 		TIM3_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,531 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_6, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,532 :: 		TIM3_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,533 :: 		TIM3_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,534 :: 		TIM3_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,535 :: 		TIM3_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,536 :: 		TIM3_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,540 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_7, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,541 :: 		TIM3_CCMR1_Input |= 0x100;                                                  // Set capture channel 2 as input on TI2 (CC2S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,542 :: 		TIM3_CCER.CC2P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,543 :: 		TIM3_CCER.CC2NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,544 :: 		TIM3_CCER.CC2E = 1;                                                         // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,545 :: 		TIM3_DIER.CC2IE = 1;                                                        // Enable interrupt on capture channel 2
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,549 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_8, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,550 :: 		TIM3_CCMR2_Input |= 0x01;                                                   // Set capture channel 3 as input on TI3 (CC3S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,551 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,552 :: 		TIM3_CCER.CC3NP = 0;                                                         // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,553 :: 		TIM3_CCER.CC3E = 1;                                                         // Enable capture on channel 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,554 :: 		TIM3_DIER.CC3IE = 1;                                                        // Enable interrupt on capture channel 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,558 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_4, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,559 :: 		TIM3_CCMR2_Input |= 0x100;                                                  // Set capture channel 4 as input on TI4 (CC4S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,560 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,561 :: 		TIM3_CCER.CC3NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,562 :: 		TIM3_CCER.CC4E = 1;                                                         // Enable capture on channel 4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,563 :: 		TIM3_DIER.CC4IE = 1;                                                        // Enable interrupt on capture channel 4
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,567 :: 		RCC_APB1ENR.TIM2EN = 1;                                                     // Enable clock gating for timer module 5
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,568 :: 		TIM2_CR1.CEN = 0;                                                           // Disable timer/counter
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,569 :: 		TIM2_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM2_CR2+0)
MOVT	R0, #hi_addr(TIM2_CR2+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,570 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
LDR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,571 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
LDR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,572 :: 		TIM2_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,576 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_5, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM2 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #16
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,577 :: 		TIM2_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,578 :: 		TIM2_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,579 :: 		TIM2_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,580 :: 		TIM2_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,581 :: 		TIM2_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,585 :: 		TIM3_DIER.UIE = 1;                                                          // Enable overflow interrupt Timer 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,586 :: 		TIM2_DIER.UIE = 1;                                                          // Enable overflow interrupt for Timer 2
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,587 :: 		NVIC_IntEnable(IVT_INT_TIM3);                                               // Enable timer 3 ISR
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,588 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                               // Enable timer 2 ISR
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,589 :: 		TIM3_CR1.CEN = 1;                                                           // Enable timer 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,590 :: 		TIM2_CR1.CEN = 1;                                                           // Enable Timer 2
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,594 :: 		encoder_timer_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
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
;Input Capture Complete 5ch.c,595 :: 		}
L_end_init_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _init_input_capture
_init_timer11:
;Input Capture Complete 5ch.c,600 :: 		void init_timer11() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,602 :: 		RCC_APB2ENR.TIM11EN = 1;                                                    // Enable clock for timer 11
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,603 :: 		TIM11_CR1.CEN = 0;                                                          // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,604 :: 		TIM11_PSC = SAMPLE_TIM_PSC;                                                 // Set timer 11 prescaler
MOVW	R0, #lo_addr(_SAMPLE_TIM_PSC+0)
MOVT	R0, #hi_addr(_SAMPLE_TIM_PSC+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM11_PSC+0)
MOVT	R0, #hi_addr(TIM11_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,605 :: 		TIM11_ARR = SAMPLE_TIM_RELOAD;                                              // Set timer 11 overflow value
MOVW	R0, #lo_addr(_SAMPLE_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_SAMPLE_TIM_RELOAD+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM11_ARR+0)
MOVT	R0, #hi_addr(TIM11_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,606 :: 		NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);                                 // Enable timer 11 interrupt
MOVW	R0, #42
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,607 :: 		TIM11_DIER.UIE = 1;                                                         // Timer 11 update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_DIER+0)
MOVT	R0, #hi_addr(TIM11_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,608 :: 		TIM11_CR1.CEN = 1;                                                          // Enable timer/counter
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,609 :: 		}
L_end_init_timer11:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_timer11
_sample_finger:
;Input Capture Complete 5ch.c,616 :: 		void sample_finger( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R9, R0
; fngr end address is: 0 (R0)
; fngr start address is: 36 (R9)
;Input Capture Complete 5ch.c,619 :: 		fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;
ADD	R3, R9, #52
ADD	R1, R9, #48
LDR	R2, [R1, #0]
ADD	R1, R9, #44
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,622 :: 		fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);
ADD	R3, R9, #56
ADD	R1, R9, #52
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R1, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R1, #0]
SUBS	R1, R1, #3
MULS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,625 :: 		fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;
ADD	R3, R9, #40
ADD	R1, R9, #36
LDR	R2, [R1, #0]
ADD	R1, R9, #32
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,628 :: 		fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;
ADD	R3, R9, #60
ADD	R1, R9, #56
LDR	R2, [R1, #0]
ADD	R1, R9, #40
LDR	R1, [R1, #0]
ADDS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,631 :: 		fngr->input_sig_period = (long double) fngr->enc_total_ticks * encoder_timer_period_ms;
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
;Input Capture Complete 5ch.c,634 :: 		fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
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
;Input Capture Complete 5ch.c,635 :: 		if (fngr->input_sig_frequency > 20000.0)                                    // NEW: Handles startup error
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
BLE	L_sample_finger28
;Input Capture Complete 5ch.c,636 :: 		fngr->input_sig_frequency = 0;
ADD	R2, R9, #64
MOVS	R1, #0
STR	R1, [R2, #0]
L_sample_finger28:
;Input Capture Complete 5ch.c,639 :: 		if (fngr->enc_chan_b == 1) {                                                // Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_sample_finger29
;Input Capture Complete 5ch.c,640 :: 		fngr->direction_actual = CONTRACT;
ADD	R2, R9, #24
MOVS	R1, #0
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,641 :: 		fngr->position_actual += (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
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
;Input Capture Complete 5ch.c,642 :: 		}
IT	AL
BAL	L_sample_finger30
L_sample_finger29:
;Input Capture Complete 5ch.c,644 :: 		else if (fngr->enc_chan_b == 0) {                                           // Counter Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_sample_finger31
;Input Capture Complete 5ch.c,645 :: 		fngr->direction_actual = EXTEND;
ADD	R2, R9, #24
MOVS	R1, #1
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,646 :: 		fngr->position_actual -= (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
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
;Input Capture Complete 5ch.c,647 :: 		}
IT	AL
BAL	L_sample_finger32
L_sample_finger31:
;Input Capture Complete 5ch.c,650 :: 		fngr->direction_actual = 7;
ADD	R2, R9, #24
MOVS	R1, #7
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,651 :: 		}
L_sample_finger32:
L_sample_finger30:
;Input Capture Complete 5ch.c,664 :: 		fngr->position_temp = 0;
ADD	R2, R9, #16
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Complete 5ch.c,671 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0)   {
MOVW	R1, #lo_addr(?lstr8_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr8_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger33
;Input Capture Complete 5ch.c,672 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_POINTER_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #7
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,673 :: 		}
IT	AL
BAL	L_sample_finger34
L_sample_finger33:
;Input Capture Complete 5ch.c,674 :: 		else if (strcmp(fngr->name, "fngr_middle") == 0) {
; fngr start address is: 36 (R9)
MOVW	R1, #lo_addr(?lstr9_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr9_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger35
;Input Capture Complete 5ch.c,675 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_MIDDLE_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #9
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,676 :: 		}
IT	AL
BAL	L_sample_finger36
L_sample_finger35:
;Input Capture Complete 5ch.c,677 :: 		else if (strcmp(fngr->name, "fngr_ring") == 0) {
; fngr start address is: 36 (R9)
MOVW	R1, #lo_addr(?lstr10_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr10_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger37
;Input Capture Complete 5ch.c,678 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_RING_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #11
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,679 :: 		}
IT	AL
BAL	L_sample_finger38
L_sample_finger37:
;Input Capture Complete 5ch.c,680 :: 		else if (strcmp(fngr->name, "fngr_pinky") == 0) {
; fngr start address is: 36 (R9)
MOVW	R1, #lo_addr(?lstr11_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr11_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger39
;Input Capture Complete 5ch.c,681 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_PINKY_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #13
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,682 :: 		}
IT	AL
BAL	L_sample_finger40
L_sample_finger39:
;Input Capture Complete 5ch.c,683 :: 		else if (strcmp(fngr->name, "fngr_thumb") == 0) {
; fngr start address is: 36 (R9)
MOVW	R1, #lo_addr(?lstr12_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr12_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger41
;Input Capture Complete 5ch.c,684 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_THUMB_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,685 :: 		}
L_sample_finger41:
L_sample_finger40:
L_sample_finger38:
L_sample_finger36:
L_sample_finger34:
;Input Capture Complete 5ch.c,686 :: 		}
L_end_sample_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _sample_finger
_print_finger_info:
;Input Capture Complete 5ch.c,690 :: 		void print_finger_info( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #36
STR	LR, [SP, #0]
MOV	R8, R0
; fngr end address is: 0 (R0)
; fngr start address is: 32 (R8)
;Input Capture Complete 5ch.c,697 :: 		UART1_Write_Text("\n\rFinger Name: ");                                      //Print name of current finger to terminal
MOVW	R1, #lo_addr(?lstr13_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr13_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,698 :: 		UART1_Write_Text(fngr->name);
MOV	R0, R8
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,699 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr14_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr14_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,701 :: 		LongWordToStr(fngr->input_sig_frequency, frequency_text);                   // Print input capture signal frequency to terminal
ADD	R2, SP, #4
ADD	R1, R8, #64
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;Input Capture Complete 5ch.c,702 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R1, #lo_addr(?lstr15_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr15_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,703 :: 		UART1_Write_Text(frequency_text);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,704 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr16_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr16_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,707 :: 		UART1_Write_Text("Direction of movement:             ");
MOVW	R1, #lo_addr(?lstr17_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr17_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,708 :: 		if(fngr->direction_actual == EXTEND)
ADD	R1, R8, #24
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_print_finger_info42
;Input Capture Complete 5ch.c,709 :: 		UART1_Write_Text("EXTEND ");
MOVW	R1, #lo_addr(?lstr18_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr18_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
IT	AL
BAL	L_print_finger_info43
L_print_finger_info42:
;Input Capture Complete 5ch.c,711 :: 		UART1_Write_Text("CONTRACT ");
MOVW	R1, #lo_addr(?lstr19_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr19_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
L_print_finger_info43:
;Input Capture Complete 5ch.c,713 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr20_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr20_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,715 :: 		LongToStr(fngr->position_actual, position_text);                            // Print total number of input events (position) to terminal
ADD	R2, SP, #19
ADD	R1, R8, #20
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongToStr+0
;Input Capture Complete 5ch.c,716 :: 		UART1_Write_Text("Position of finger:                ");
MOVW	R1, #lo_addr(?lstr21_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr21_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,717 :: 		UART1_Write_Text(position_text);
ADD	R1, SP, #19
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,718 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr22_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr22_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,720 :: 		IntToStr(fngr->tip_force, toStr);                            // Print Flexiforce value (16-bit unsigned) to terminal
ADD	R1, R8, #76
; fngr end address is: 32 (R8)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOVW	R1, #lo_addr(_toStr+0)
MOVT	R1, #hi_addr(_toStr+0)
BL	_IntToStr+0
;Input Capture Complete 5ch.c,721 :: 		UART1_Write_Text("Force applied to tip of finger:                ");
MOVW	R1, #lo_addr(?lstr23_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr23_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,722 :: 		UART1_Write_Text(toStr);
MOVW	R0, #lo_addr(_toStr+0)
MOVT	R0, #hi_addr(_toStr+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,723 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr24_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr24_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,725 :: 		terminal_print_count = 0;                                                   // Reset counter for terminal printing
MOVS	R2, #0
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
STRH	R2, [R1, #0]
;Input Capture Complete 5ch.c,726 :: 		}
L_end_print_finger_info:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _print_finger_info
_InitTimer10:
;Input Capture Complete 5ch.c,732 :: 		void InitTimer10(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,733 :: 		RCC_APB2ENR.TIM10EN = 1;       		// Enable clock gating for timer 10
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,734 :: 		TIM10_CR1.CEN = 0;              		// Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM10_CR1+0)
MOVT	R0, #hi_addr(TIM10_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,735 :: 		TIM10_PSC = 7874;         	// Set timer 10 prescaler
MOVW	R1, #7874
MOVW	R0, #lo_addr(TIM10_PSC+0)
MOVT	R0, #hi_addr(TIM10_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,736 :: 		TIM10_ARR = 63999;      	// Set timer 10 overflow value
MOVW	R1, #63999
MOVW	R0, #lo_addr(TIM10_ARR+0)
MOVT	R0, #hi_addr(TIM10_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,737 :: 		NVIC_IntEnable(IVT_INT_TIM1_UP_TIM10); // Enable timer 10 interrupt
MOVW	R0, #41
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,738 :: 		TIM10_CR1.CEN = 1;              		// Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM10_CR1+0)
MOVT	R0, #hi_addr(TIM10_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,739 :: 		}
L_end_InitTimer10:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer10
_Timer10_interrupt:
;Input Capture Complete 5ch.c,742 :: 		void Timer10_interrupt() iv IVT_INT_TIM1_UP_TIM10 { // Interrupt handler if 3 s have past
;Input Capture Complete 5ch.c,743 :: 		EXTI_IMRbits.MR3 = 0;			    // mask bit 3 to disable external interrupt on line 3
MOVS	R3, #0
SXTB	R3, R3
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,744 :: 		EXTI_PR.B3 = 1;                                // Clear Interrupt Flag
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,745 :: 		TIM10_DIER.UIE = 0;                   	    // Disable timer 10 interrupt
MOVW	R0, #lo_addr(TIM10_DIER+0)
MOVT	R0, #hi_addr(TIM10_DIER+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,746 :: 		TIM10_SR.UIF = 0;                     	    // Clear timer 10 interrupt flag
MOVW	R0, #lo_addr(TIM10_SR+0)
MOVT	R0, #hi_addr(TIM10_SR+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,747 :: 		emg_override_status = 0;                       // State flag used for the EMG Override EXTI button handler
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_emg_override_status+0)
MOVT	R0, #hi_addr(_emg_override_status+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,748 :: 		analogGo = 1;                  //********************************** CONTROL FLAGS GO HERE!!! *******************************
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,749 :: 		goStatus = 1;                  //********************************** CONTROL FLAGS GO HERE!!! *******************************
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_goStatus+0)
MOVT	R0, #hi_addr(_goStatus+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,750 :: 		LOW_BATTERY_LED = ~LOW_BATTERY_LED;            // Toggle system state led (On = System is running, Off = System has been shut down via EMG Override)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,751 :: 		EMG_ACTIVE_LED = 0;                            // Clear EMG Override button indicator
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,752 :: 		EXTI_RTSRbits.TR3 = 1;                         // Enable rising edge trigger
MOVW	R0, #lo_addr(EXTI_RTSRbits+0)
MOVT	R0, #hi_addr(EXTI_RTSRbits+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,753 :: 		EXTI_FTSRbits.TR3 = 0;                         // Disable falling edge trigger
MOVW	R0, #lo_addr(EXTI_FTSRbits+0)
MOVT	R0, #hi_addr(EXTI_FTSRbits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,754 :: 		EXTI_IMRbits.MR3 = 1;			    // Unmask bit 3 to enable external interrupt on line 3
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,755 :: 		}
L_end_Timer10_interrupt:
BX	LR
; end of _Timer10_interrupt
_emg_override_ISR:
;Input Capture Complete 5ch.c,761 :: 		void emg_override_ISR() iv IVT_INT_EXTI3 {
;Input Capture Complete 5ch.c,763 :: 		EXTI_IMRbits.MR3 = 0;			    // mask bit 3 to Disable external interrupt on line 3
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,764 :: 		EXTI_PR.B3 = 1;                               // Clear Interrupt Flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,765 :: 		if(emg_override_status == 0) {                // Current system state is dormant
MOVW	R0, #lo_addr(_emg_override_status+0)
MOVT	R0, #hi_addr(_emg_override_status+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_emg_override_ISR44
;Input Capture Complete 5ch.c,766 :: 		TIM10_SR.UIF = 0;                       // Clear timer 5 interrupt bit
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM10_SR+0)
MOVT	R0, #hi_addr(TIM10_SR+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,767 :: 		TIM10_CNT = 0x00;                       // Reset timer value to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM10_CNT+0)
MOVT	R0, #hi_addr(TIM10_CNT+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,768 :: 		emg_override_status = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_emg_override_status+0)
MOVT	R0, #hi_addr(_emg_override_status+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,769 :: 		EXTI_RTSRbits.TR3 = 0;                  // Disable rising edge trigger
MOVW	R0, #lo_addr(EXTI_RTSRbits+0)
MOVT	R0, #hi_addr(EXTI_RTSRbits+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,770 :: 		EXTI_FTSRbits.TR3 = 1;                  // Enable falling edge trigger
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_FTSRbits+0)
MOVT	R0, #hi_addr(EXTI_FTSRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,771 :: 		TIM10_DIER.UIE = 1;                     // CC1 Update Interrupt Enable
MOVW	R0, #lo_addr(TIM10_DIER+0)
MOVT	R0, #hi_addr(TIM10_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,772 :: 		EMG_ACTIVE_LED = 1;                     // Notify button is held
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,773 :: 		}
IT	AL
BAL	L_emg_override_ISR45
L_emg_override_ISR44:
;Input Capture Complete 5ch.c,775 :: 		TIM10_DIER.UIE = 0;                     // Disable timer interrupt
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM10_DIER+0)
MOVT	R0, #hi_addr(TIM10_DIER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,776 :: 		emg_override_status = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_emg_override_status+0)
MOVT	R0, #hi_addr(_emg_override_status+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,777 :: 		EXTI_RTSRbits.TR3 = 1;                  // Enable rising edge trigger
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_RTSRbits+0)
MOVT	R0, #hi_addr(EXTI_RTSRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,778 :: 		EXTI_FTSRbits.TR3 = 0;                  // Disable falling edge trigger
MOVW	R0, #lo_addr(EXTI_FTSRbits+0)
MOVT	R0, #hi_addr(EXTI_FTSRbits+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,779 :: 		EMG_ACTIVE_LED = 0;                     // Notify button released
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,780 :: 		}
L_emg_override_ISR45:
;Input Capture Complete 5ch.c,781 :: 		EXTI_IMRbits.MR3 = 1;			    // Unmask bit 3 to enable external interrupt on line 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,782 :: 		}
L_end_emg_override_ISR:
BX	LR
; end of _emg_override_ISR
