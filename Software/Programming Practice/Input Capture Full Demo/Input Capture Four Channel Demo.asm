_main:
;Input Capture Four Channel Demo.c,102 :: 		void main() {
;Input Capture Four Channel Demo.c,105 :: 		init_UART();
BL	_init_UART+0
;Input Capture Four Channel Demo.c,106 :: 		init_GPIO();
BL	_init_GPIO+0
;Input Capture Four Channel Demo.c,110 :: 		strcpy(fngr_pointer.name, "Pointer");
MOVW	R0, #lo_addr(?lstr1_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr1_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+4)
MOVT	R0, #hi_addr(_fngr_pointer+4)
BL	_strcpy+0
;Input Capture Four Channel Demo.c,111 :: 		strcpy(fngr_middle.name, "Middle");
MOVW	R0, #lo_addr(?lstr2_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr2_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_middle+4)
MOVT	R0, #hi_addr(_fngr_middle+4)
BL	_strcpy+0
;Input Capture Four Channel Demo.c,112 :: 		strcpy(fngr_ring.name, "Ring");
MOVW	R0, #lo_addr(?lstr3_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr3_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_ring+4)
MOVT	R0, #hi_addr(_fngr_ring+4)
BL	_strcpy+0
;Input Capture Four Channel Demo.c,113 :: 		strcpy(fngr_pinky.name, "Pinky");
MOVW	R0, #lo_addr(?lstr4_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr4_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pinky+4)
MOVT	R0, #hi_addr(_fngr_pinky+4)
BL	_strcpy+0
;Input Capture Four Channel Demo.c,115 :: 		UART1_Write_Text("Test point 2\n\r");
MOVW	R0, #lo_addr(?lstr5_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr5_Input_32Capture_32Four_32Channel_32Demo+0)
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,118 :: 		fngr_pointer.reg_bit = GPIOA_IDR_LOC;
MOVW	R2, #lo_addr(_GPIOA_IDR_LOC+0)
MOVT	R2, #hi_addr(_GPIOA_IDR_LOC+0)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,119 :: 		fngr_middle.reg_bit = GPIOA_IDR_LOC;
MOV	R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,120 :: 		fngr_ring.reg_bit = GPIOA_IDR_LOC;
MOV	R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,121 :: 		fngr_pinky.reg_bit = GPIOA_IDR_LOC;
MOV	R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,124 :: 		UART1_Write_Text("Test point 3\n\r");
MOVW	R0, #lo_addr(?lstr6_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr6_Input_32Capture_32Four_32Channel_32Demo+0)
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,127 :: 		fngr_pointer.enc_chan_a = FNGR_POINTER_ENC_A;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fngr_pointer+24)
MOVT	R0, #hi_addr(_fngr_pointer+24)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,128 :: 		fngr_pointer.enc_chan_b = FNGR_POINTER_ENC_B;
MOVS	R1, #16
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,129 :: 		fngr_middle.enc_chan_a = FNGR_MIDDLE_ENC_A;
MOVS	R1, #2
MOVW	R0, #lo_addr(_fngr_middle+24)
MOVT	R0, #hi_addr(_fngr_middle+24)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,130 :: 		fngr_middle.enc_chan_b = FNGR_MIDDLE_ENC_B;
MOVS	R1, #32
MOVW	R0, #lo_addr(_fngr_middle+26)
MOVT	R0, #hi_addr(_fngr_middle+26)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,131 :: 		fngr_ring.enc_chan_a = FNGR_RING_ENC_A;
MOVS	R1, #4
MOVW	R0, #lo_addr(_fngr_ring+24)
MOVT	R0, #hi_addr(_fngr_ring+24)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,132 :: 		fngr_ring.enc_chan_b = FNGR_RING_ENC_B;
MOVS	R1, #64
MOVW	R0, #lo_addr(_fngr_ring+26)
MOVT	R0, #hi_addr(_fngr_ring+26)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,133 :: 		fngr_pinky.enc_chan_a = FNGR_PINKY_ENC_A;
MOVS	R1, #8
MOVW	R0, #lo_addr(_fngr_pinky+24)
MOVT	R0, #hi_addr(_fngr_pinky+24)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,134 :: 		fngr_pinky.enc_chan_b = FNGR_PINKY_ENC_B;
MOVS	R1, #128
MOVW	R0, #lo_addr(_fngr_pinky+26)
MOVT	R0, #hi_addr(_fngr_pinky+26)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,139 :: 		UART1_Write_Text("\n\n\rProgram Has Started!\n\n\r");
MOVW	R0, #lo_addr(?lstr7_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr7_Input_32Capture_32Four_32Channel_32Demo+0)
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,140 :: 		delay_ms(500);
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
;Input Capture Four Channel Demo.c,143 :: 		init_timer3();
BL	_init_timer3+0
;Input Capture Four Channel Demo.c,144 :: 		init_input_capture();
BL	_init_input_capture+0
;Input Capture Four Channel Demo.c,147 :: 		while(1) {
L_main2:
;Input Capture Four Channel Demo.c,149 :: 		if (poll_flag) {                                              //Calculate finger state values
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;Input Capture Four Channel Demo.c,150 :: 		poll_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,151 :: 		calc_finger_state(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_calc_finger_state+0
;Input Capture Four Channel Demo.c,152 :: 		calc_finger_state(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_calc_finger_state+0
;Input Capture Four Channel Demo.c,153 :: 		calc_finger_state(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_calc_finger_state+0
;Input Capture Four Channel Demo.c,154 :: 		calc_finger_state(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_calc_finger_state+0
;Input Capture Four Channel Demo.c,156 :: 		}
L_main4:
;Input Capture Four Channel Demo.c,159 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {                                // Set number of polling events has occured => Print statistics to terminal
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main31
MOVW	R0, #lo_addr(_TERMINAL_PRINT_THRESH+0)
MOVT	R0, #hi_addr(_TERMINAL_PRINT_THRESH+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_terminal_print_count+0)
MOVT	R0, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L__main30
L__main29:
;Input Capture Four Channel Demo.c,161 :: 		print_finger_info(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_print_finger_info+0
;Input Capture Four Channel Demo.c,162 :: 		print_finger_info(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_print_finger_info+0
;Input Capture Four Channel Demo.c,163 :: 		print_finger_info(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_print_finger_info+0
;Input Capture Four Channel Demo.c,164 :: 		print_finger_info(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_print_finger_info+0
;Input Capture Four Channel Demo.c,159 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {                                // Set number of polling events has occured => Print statistics to terminal
L__main31:
L__main30:
;Input Capture Four Channel Demo.c,166 :: 		}
IT	AL
BAL	L_main2
;Input Capture Four Channel Demo.c,167 :: 		} // Main ends here
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_timer2_ISR:
;Input Capture Four Channel Demo.c,177 :: 		void timer2_ISR() iv IVT_INT_TIM2 {
;Input Capture Four Channel Demo.c,182 :: 		if(TIM2_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR8
;Input Capture Four Channel Demo.c,183 :: 		TIM2_SR.UIF = 0;                                                          // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,184 :: 		overflow_count++;                                                       // Increment overflow counter
MOVW	R1, #lo_addr(_overflow_count+0)
MOVT	R1, #hi_addr(_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,185 :: 		}
L_timer2_ISR8:
;Input Capture Four Channel Demo.c,188 :: 		if (TIM2_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR9
;Input Capture Four Channel Demo.c,189 :: 		fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;
MOVW	R2, #lo_addr(_fngr_pointer+32)
MOVT	R2, #hi_addr(_fngr_pointer+32)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+28)
MOVT	R0, #hi_addr(_fngr_pointer+28)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,190 :: 		fngr_pointer.enc_end_time = TIM2_CCR1;                                         // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,191 :: 		fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;
MOVW	R2, #lo_addr(_fngr_pointer+44)
MOVT	R2, #hi_addr(_fngr_pointer+44)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+40)
MOVT	R0, #hi_addr(_fngr_pointer+40)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,192 :: 		fngr_pointer.enc_overflow_end = overflow_count;                                                // Store number of timer 2 overflows for this finger
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,193 :: 		fngr_pointer.position_actual++;                                                // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pointer+76)
MOVT	R1, #hi_addr(_fngr_pointer+76)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,194 :: 		}
L_timer2_ISR9:
;Input Capture Four Channel Demo.c,198 :: 		if (TIM2_SR.CC2IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR10
;Input Capture Four Channel Demo.c,199 :: 		fngr_middle.enc_start_time = fngr_middle.enc_end_time;
MOVW	R2, #lo_addr(_fngr_middle+32)
MOVT	R2, #hi_addr(_fngr_middle+32)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+28)
MOVT	R0, #hi_addr(_fngr_middle+28)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,200 :: 		fngr_middle.enc_end_time = TIM2_CCR2;                                         // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR2+0)
MOVT	R0, #hi_addr(TIM2_CCR2+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,201 :: 		fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;
MOVW	R2, #lo_addr(_fngr_middle+44)
MOVT	R2, #hi_addr(_fngr_middle+44)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+40)
MOVT	R0, #hi_addr(_fngr_middle+40)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,202 :: 		fngr_middle.enc_overflow_end = overflow_count;                                                // Store number of timer 2 overflows for this finger
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,203 :: 		fngr_middle.position_actual++;                                                // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_middle+76)
MOVT	R1, #hi_addr(_fngr_middle+76)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,204 :: 		}
L_timer2_ISR10:
;Input Capture Four Channel Demo.c,207 :: 		if (TIM2_SR.CC3IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR11
;Input Capture Four Channel Demo.c,208 :: 		fngr_ring.enc_start_time = fngr_ring.enc_end_time;
MOVW	R2, #lo_addr(_fngr_ring+32)
MOVT	R2, #hi_addr(_fngr_ring+32)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+28)
MOVT	R0, #hi_addr(_fngr_ring+28)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,209 :: 		fngr_ring.enc_end_time = TIM2_CCR3;                                         // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR3+0)
MOVT	R0, #hi_addr(TIM2_CCR3+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,210 :: 		fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;
MOVW	R2, #lo_addr(_fngr_ring+44)
MOVT	R2, #hi_addr(_fngr_ring+44)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+40)
MOVT	R0, #hi_addr(_fngr_ring+40)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,211 :: 		fngr_ring.enc_overflow_end = overflow_count;                                                // Store number of timer 2 overflows for this finger
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,212 :: 		fngr_ring.position_actual++;                                                // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_ring+76)
MOVT	R1, #hi_addr(_fngr_ring+76)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,213 :: 		}
L_timer2_ISR11:
;Input Capture Four Channel Demo.c,216 :: 		if (TIM2_SR.CC4IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR12
;Input Capture Four Channel Demo.c,217 :: 		fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;
MOVW	R2, #lo_addr(_fngr_pinky+32)
MOVT	R2, #hi_addr(_fngr_pinky+32)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+28)
MOVT	R0, #hi_addr(_fngr_pinky+28)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,218 :: 		fngr_pinky.enc_end_time = TIM2_CCR4;                                         // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR4+0)
MOVT	R0, #hi_addr(TIM2_CCR4+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,219 :: 		fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;
MOVW	R2, #lo_addr(_fngr_pinky+44)
MOVT	R2, #hi_addr(_fngr_pinky+44)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+40)
MOVT	R0, #hi_addr(_fngr_pinky+40)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,220 :: 		fngr_pinky.enc_overflow_end = overflow_count;                                                // Store number of timer 2 overflows for this finger
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,221 :: 		fngr_pinky.position_actual++;                                                // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pinky+76)
MOVT	R1, #hi_addr(_fngr_pinky+76)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,222 :: 		}
L_timer2_ISR12:
;Input Capture Four Channel Demo.c,225 :: 		}
L_end_timer2_ISR:
BX	LR
; end of _timer2_ISR
_timer3_ISR:
;Input Capture Four Channel Demo.c,229 :: 		void timer3_ISR() iv IVT_INT_TIM3 {
;Input Capture Four Channel Demo.c,231 :: 		TIM3_SR.UIF = 0;                                                                                                                // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,232 :: 		poll_flag = 1;                                                                                                                        // Set poll flag for main loop
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,233 :: 		terminal_print_count++;                                                                                                        // Increment the print counter
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Input Capture Four Channel Demo.c,234 :: 		}
L_end_timer3_ISR:
BX	LR
; end of _timer3_ISR
_init_GPIO:
;Input Capture Four Channel Demo.c,243 :: 		void init_GPIO() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Four Channel Demo.c,246 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7);                                                   // ** DEBUG ** Set pin E10 low
MOVS	R1, #240
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Four Channel Demo.c,247 :: 		}
L_end_init_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_GPIO
_init_UART:
;Input Capture Four Channel Demo.c,252 :: 		void init_UART() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Four Channel Demo.c,254 :: 		UART1_Init(UART_BAUD_RATE);                                                       // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;Input Capture Four Channel Demo.c,255 :: 		Delay_ms(200);                                                                         // Wait for UART to stabilize
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_init_UART13:
SUBS	R7, R7, #1
BNE	L_init_UART13
NOP
NOP
NOP
;Input Capture Four Channel Demo.c,256 :: 		UART_Write_Text("\rUART Init Complete\r\n");
MOVW	R0, #lo_addr(?lstr8_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr8_Input_32Capture_32Four_32Channel_32Demo+0)
BL	_UART_Write_Text+0
;Input Capture Four Channel Demo.c,257 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_init_input_capture:
;Input Capture Four Channel Demo.c,262 :: 		void init_input_capture() {
SUB	SP, SP, #20
STR	LR, [SP, #0]
;Input Capture Four Channel Demo.c,265 :: 		RCC_APB1ENR.TIM2EN = 1;                                                 // Enable clock gating for timer module 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,266 :: 		TIM2_CR1.CEN = 0;                                                       // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,267 :: 		TIM2_CR2.TI1S = 0;                                                      // TIM2_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM2_CR2+0)
MOVT	R0, #hi_addr(TIM2_CR2+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,268 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                             // Set timer 2 prescaler
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
STR	R0, [SP, #12]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,269 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                          // Set timer 2 Auto Reload value
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,270 :: 		TIM2_CR1 |= 0x10;                                                       // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,273 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);             // Configure alternate function for A0 as Timer 2 Channel 1
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Four Channel Demo.c,274 :: 		TIM2_CCMR1_Input |= 0x01;                                               // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,275 :: 		TIM2_CCER.CC1P = 0;                                                     // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,276 :: 		TIM2_CCER.CC1NP = 0;
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,277 :: 		TIM2_CCER.CC1E = 1;                                                     // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,278 :: 		TIM2_DIER.CC1IE = 1;                                                    // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,281 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH2_PA1);             // Configure alternate function for pin A1 as Timer 2 Channel 2
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH2_PA1+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH2_PA1+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Four Channel Demo.c,282 :: 		TIM2_CCMR1_Input |= 0x100;                                              // Set capture channel 2 as input on TI2 (CC2S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,283 :: 		TIM2_CCER.CC2P = 0;                                                     // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,284 :: 		TIM2_CCER.CC2NP = 0;
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,285 :: 		TIM2_CCER.CC2E = 1;                                                     // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,286 :: 		TIM2_DIER.CC2IE = 1;                                                    // Enable interrupt on capture channel 2
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,289 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH3_PA2);             // Configure alternate function for pin A2 as Timer 2 Channel 3
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH3_PA2+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH3_PA2+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Four Channel Demo.c,290 :: 		TIM2_CCMR2_Input |= 0x01;                                               // Set capture channel 3 as input on TI3 (CC3S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,291 :: 		TIM2_CCER.CC3P = 0;                                                     // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,292 :: 		TIM2_CCER.CC3NP = 0;
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,293 :: 		TIM2_CCER.CC3E = 1;                                                     // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,294 :: 		TIM2_DIER.CC3IE = 1;                                                    // Enable interrupt on capture channel 3
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,297 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH4_PA3);             // Configure alternate function for pin A3 as Timer 2 Channel 4
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH4_PA3+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH4_PA3+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Four Channel Demo.c,298 :: 		TIM2_CCMR2_Input |= 0x100;                                              // Set capture channel 4 as input on TI4 (CC4S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM2_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,299 :: 		TIM2_CCER.CC3P = 0;                                                     // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,300 :: 		TIM2_CCER.CC3NP = 0;
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,301 :: 		TIM2_CCER.CC4E = 1;                                                     // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,302 :: 		TIM2_DIER.CC4IE = 1;                                                    // Enable interrupt on capture channel 4
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,305 :: 		TIM2_DIER.UIE = 1;                                                      // Enable overflow interrupt
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,306 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                           // Enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Input Capture Four Channel Demo.c,307 :: 		TIM2_CR1.CEN = 1;                                                       // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,310 :: 		timer2_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));        // Calculate period of TIM2_CLK in ms
LDR	R0, [SP, #12]
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
MOVW	R2, #lo_addr(_timer2_period_ms+0)
MOVT	R2, #hi_addr(_timer2_period_ms+0)
STRD	R0, R1, [R2, #0]
;Input Capture Four Channel Demo.c,311 :: 		}
L_end_init_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _init_input_capture
_init_timer3:
;Input Capture Four Channel Demo.c,316 :: 		void init_timer3() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Four Channel Demo.c,318 :: 		RCC_APB1ENR.TIM3EN = 1;                                                                                                        // Enable clock for timer 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,319 :: 		TIM3_CR1.CEN = 0;                                                                                                                // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,320 :: 		TIM3_PSC = 279;                                                                                                                        // Set timer 3 prescaler
MOVW	R1, #279
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,321 :: 		TIM3_ARR = 59999;                                                                                                                // Set timer 3 overflow value
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,322 :: 		NVIC_IntEnable(IVT_INT_TIM3);                                                                                        // Enable timer 3 interrupt
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;Input Capture Four Channel Demo.c,323 :: 		TIM3_DIER.UIE = 1;                                                                                                                // Timer 3 update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,324 :: 		TIM3_CR1.CEN = 1;                                                                                                                // Enable timer/counter
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,325 :: 		}
L_end_init_timer3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_timer3
_calc_finger_state:
;Input Capture Four Channel Demo.c,332 :: 		void calc_finger_state( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R9, R0
; fngr end address is: 0 (R0)
; fngr start address is: 36 (R9)
;Input Capture Four Channel Demo.c,336 :: 		fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;
ADD	R3, R9, #64
ADD	R1, R9, #44
LDR	R2, [R1, #0]
ADD	R1, R9, #40
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,339 :: 		fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);
ADD	R3, R9, #68
ADD	R1, R9, #64
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R1, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R1, #0]
SUBS	R1, R1, #3
MULS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,342 :: 		fngr->enc_delta_ticks = (unsigned long) fngr->enc_start_time - fngr->enc_end_time;
ADD	R3, R9, #72
ADD	R1, R9, #28
LDR	R2, [R1, #0]
ADD	R1, R9, #32
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,345 :: 		fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;
ADD	R3, R9, #36
ADD	R1, R9, #68
LDR	R2, [R1, #0]
ADD	R1, R9, #72
LDR	R1, [R1, #0]
ADDS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,348 :: 		fngr->input_sig_period = (long double) fngr->enc_total_ticks * timer2_period_ms;
ADD	R1, R9, #48
STR	R1, [SP, #4]
ADD	R1, R9, #36
LDR	R1, [R1, #0]
MOV	R0, R1
BL	__UnsignedIntegralToLongDouble+0
MOVW	R2, #lo_addr(_timer2_period_ms+0)
MOVT	R2, #hi_addr(_timer2_period_ms+0)
VLDR	#1, D0, [R2, #0]
VMOV	R2, S0
VMOV	R3, S1
BL	__Mul_DP+0
LDR	R2, [SP, #4]
STRD	R0, R1, [R2, #0]
;Input Capture Four Channel Demo.c,351 :: 		fngr->input_sig_frequency = (long double) 1000.0 / fngr->input_sig_period;
ADD	R1, R9, #56
STR	R1, [SP, #4]
ADD	R1, R9, #48
LDRD	R3, R4, [R1, #0]
MOV	R1, #0
MOVW	R2, #16384
MOVT	R2, #16527
VMOV	S0, R1
VMOV	S1, R2
MOV	R2, R3
MOV	R3, R4
VMOV	R0, S0
VMOV	R1, S1
BL	__Div_DP+0
LDR	R2, [SP, #4]
STRD	R0, R1, [R2, #0]
;Input Capture Four Channel Demo.c,355 :: 		if ((fngr->reg_bit->addr0 & fngr->enc_chan_a) && !(fngr->reg_bit->addr0 & fngr->enc_chan_b)) {
LDR	R1, [R9, #0]
LDR	R2, [R1, #0]
ADD	R1, R9, #24
LDRH	R1, [R1, #0]
AND	R1, R2, R1, LSL #0
CMP	R1, #0
IT	EQ
BEQ	L__calc_finger_state26
LDR	R1, [R9, #0]
LDR	R2, [R1, #0]
ADD	R1, R9, #26
LDRH	R1, [R1, #0]
AND	R1, R2, R1, LSL #0
CMP	R1, #0
IT	NE
BNE	L__calc_finger_state25
L__calc_finger_state24:
;Input Capture Four Channel Demo.c,356 :: 		fngr->direction_actual = 1;                                                                // Clockwise
ADD	R2, R9, #20
; fngr end address is: 36 (R9)
MOVS	R1, #1
STRH	R1, [R2, #0]
;Input Capture Four Channel Demo.c,357 :: 		}
IT	AL
BAL	L_calc_finger_state18
;Input Capture Four Channel Demo.c,355 :: 		if ((fngr->reg_bit->addr0 & fngr->enc_chan_a) && !(fngr->reg_bit->addr0 & fngr->enc_chan_b)) {
L__calc_finger_state26:
; fngr start address is: 36 (R9)
L__calc_finger_state25:
;Input Capture Four Channel Demo.c,359 :: 		else if (!(fngr->reg_bit->addr0 & fngr->enc_chan_a) && (fngr->reg_bit->addr0 & fngr->enc_chan_b)) {
LDR	R1, [R9, #0]
LDR	R2, [R1, #0]
ADD	R1, R9, #24
LDRH	R1, [R1, #0]
AND	R1, R2, R1, LSL #0
CMP	R1, #0
IT	NE
BNE	L__calc_finger_state28
LDR	R1, [R9, #0]
LDR	R2, [R1, #0]
ADD	R1, R9, #26
LDRH	R1, [R1, #0]
AND	R1, R2, R1, LSL #0
CMP	R1, #0
IT	EQ
BEQ	L__calc_finger_state27
L__calc_finger_state23:
;Input Capture Four Channel Demo.c,360 :: 		fngr->direction_actual = 0;                                                                // Counter Clockwise
ADD	R2, R9, #20
; fngr end address is: 36 (R9)
MOVS	R1, #0
STRH	R1, [R2, #0]
;Input Capture Four Channel Demo.c,361 :: 		}
IT	AL
BAL	L_calc_finger_state22
;Input Capture Four Channel Demo.c,359 :: 		else if (!(fngr->reg_bit->addr0 & fngr->enc_chan_a) && (fngr->reg_bit->addr0 & fngr->enc_chan_b)) {
L__calc_finger_state28:
; fngr start address is: 36 (R9)
L__calc_finger_state27:
;Input Capture Four Channel Demo.c,364 :: 		fngr->direction_actual = 7;                                                                // ERROR
ADD	R2, R9, #20
; fngr end address is: 36 (R9)
MOVS	R1, #7
STRH	R1, [R2, #0]
;Input Capture Four Channel Demo.c,365 :: 		}
L_calc_finger_state22:
L_calc_finger_state18:
;Input Capture Four Channel Demo.c,366 :: 		}
L_end_calc_finger_state:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _calc_finger_state
_print_finger_info:
;Input Capture Four Channel Demo.c,371 :: 		void print_finger_info( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #140
STR	LR, [SP, #0]
MOV	R12, R0
; fngr end address is: 0 (R0)
; fngr start address is: 48 (R12)
;Input Capture Four Channel Demo.c,385 :: 		UART1_Write_Text("\n\rFinger Name: ");                                                        //Print name of current finger to terminal
MOVW	R1, #lo_addr(?lstr9_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr9_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,386 :: 		UART1_Write_Text(fngr->name);
ADD	R1, R12, #4
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,387 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr10_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr10_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,389 :: 		LongDoubleToStr(timer2_period_ms, time_per_tick_text);                      // Print calculated time per tick to terminal
ADD	R3, SP, #4
MOVW	R1, #lo_addr(_timer2_period_ms+0)
MOVT	R1, #hi_addr(_timer2_period_ms+0)
LDRD	R1, R2, [R1, #0]
MOV	R0, R3
VMOV	S0, R1
VMOV	S1, R2
BL	_LongDoubleToStr+0
;Input Capture Four Channel Demo.c,390 :: 		UART1_Write_Text("Time per tick: ");
MOVW	R1, #lo_addr(?lstr11_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr11_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,391 :: 		UART1_Write_Text(time_per_tick_text);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,392 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr12_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr12_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,394 :: 		LongWordToStr(fngr->enc_overflow_delta, overflow_delta_text);              // Print number of timer 2 overflow events to terminal
ADD	R2, SP, #19
ADD	R1, R12, #64
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;Input Capture Four Channel Demo.c,395 :: 		UART1_Write_Text("Total number of timer overflows: ");
MOVW	R1, #lo_addr(?lstr13_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr13_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,396 :: 		UART1_Write_Text(overflow_delta_text);
ADD	R1, SP, #19
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,397 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr14_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr14_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,399 :: 		LongWordToStr(fngr->enc_overflow_ticks, overflow_time_text);        // Print total calculated time from timer 2 overflows to terminal
ADD	R2, SP, #34
ADD	R1, R12, #68
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;Input Capture Four Channel Demo.c,400 :: 		UART1_Write_Text("Calculated Overflow Ticks : ");
MOVW	R1, #lo_addr(?lstr15_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr15_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,401 :: 		UART1_Write_Text(overflow_time_text);
ADD	R1, SP, #34
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,402 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr16_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr16_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,404 :: 		LongWordToStr(fngr->enc_delta_ticks, enc_delta_ticks_text);         // Print input capture delta time to terminal
ADD	R2, SP, #49
ADD	R1, R12, #72
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;Input Capture Four Channel Demo.c,405 :: 		UART1_Write_Text("Input Capture Delta Ticks: ");
MOVW	R1, #lo_addr(?lstr17_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr17_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,406 :: 		UART1_Write_Text(enc_delta_ticks_text);
ADD	R1, SP, #49
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,407 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr18_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr18_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,409 :: 		LongWordToStr(fngr->enc_total_ticks, total_ticks_text);                     // Print total number of ticks between input capture events to terminal
ADD	R2, SP, #64
ADD	R1, R12, #36
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;Input Capture Four Channel Demo.c,410 :: 		UART1_Write_Text("Total timer ticks between input captures: ");
MOVW	R1, #lo_addr(?lstr19_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr19_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,411 :: 		UART1_Write_Text(total_ticks_text);
ADD	R1, SP, #64
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,412 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr20_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr20_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,414 :: 		LongDoubleToStr(fngr->input_sig_period, period_text);                                          // Print input capture signal period to terminal
ADD	R3, SP, #79
ADD	R1, R12, #48
LDRD	R1, R2, [R1, #0]
MOV	R0, R3
VMOV	S0, R1
VMOV	S1, R2
BL	_LongDoubleToStr+0
;Input Capture Four Channel Demo.c,415 :: 		UART1_Write_Text("Period of incoming signal (ms): ");
MOVW	R1, #lo_addr(?lstr21_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr21_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,416 :: 		UART1_Write_Text(period_text);
ADD	R1, SP, #79
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,417 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr22_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr22_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,419 :: 		LongDoubleToStr(fngr->input_sig_frequency, frequency_text);                                    // Print input capture signal frequency to terminal
ADD	R3, SP, #94
ADD	R1, R12, #56
LDRD	R1, R2, [R1, #0]
MOV	R0, R3
VMOV	S0, R1
VMOV	S1, R2
BL	_LongDoubleToStr+0
;Input Capture Four Channel Demo.c,420 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R1, #lo_addr(?lstr23_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr23_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,421 :: 		UART1_Write_Text(frequency_text);
ADD	R1, SP, #94
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,422 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr24_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr24_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,424 :: 		IntToStr(fngr->direction_actual, direction_text);                    // Print direction of movement to terminal
ADD	R2, SP, #124
ADD	R1, R12, #20
LDRH	R1, [R1, #0]
SXTH	R1, R1
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
;Input Capture Four Channel Demo.c,425 :: 		UART1_Write_Text("Direction of movement: ");
MOVW	R1, #lo_addr(?lstr25_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr25_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,426 :: 		UART1_Write_Text(direction_text);
ADD	R1, SP, #124
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,427 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr26_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr26_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,429 :: 		LongToStr(fngr->position_actual, position_text);               // Print total number of input events (position) to terminal
ADD	R2, SP, #109
ADD	R1, R12, #76
; fngr end address is: 48 (R12)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongToStr+0
;Input Capture Four Channel Demo.c,430 :: 		UART1_Write_Text("Position of finger: ");
MOVW	R1, #lo_addr(?lstr27_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr27_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,431 :: 		UART1_Write_Text(position_text);
ADD	R1, SP, #109
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,432 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr28_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr28_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,434 :: 		terminal_print_count = 0;                                                                                // Reset counter for terminal printing
MOVS	R2, #0
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
STRH	R2, [R1, #0]
;Input Capture Four Channel Demo.c,435 :: 		}
L_end_print_finger_info:
LDR	LR, [SP, #0]
ADD	SP, SP, #140
BX	LR
; end of _print_finger_info
