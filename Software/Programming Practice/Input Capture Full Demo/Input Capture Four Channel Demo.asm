_main:
;Input Capture Four Channel Demo.c,88 :: 		void main() {
;Input Capture Four Channel Demo.c,91 :: 		init_UART();
BL	_init_UART+0
;Input Capture Four Channel Demo.c,92 :: 		init_GPIO();
BL	_init_GPIO+0
;Input Capture Four Channel Demo.c,95 :: 		strcpy(fngr_pointer.name, "Pointer");
MOVW	R0, #lo_addr(?lstr1_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr1_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_strcpy+0
;Input Capture Four Channel Demo.c,96 :: 		strcpy(fngr_middle.name, "Middle");
MOVW	R0, #lo_addr(?lstr2_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr2_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_strcpy+0
;Input Capture Four Channel Demo.c,97 :: 		strcpy(fngr_ring.name, "Ring");
MOVW	R0, #lo_addr(?lstr3_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr3_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_strcpy+0
;Input Capture Four Channel Demo.c,98 :: 		strcpy(fngr_pinky.name, "Pinky");
MOVW	R0, #lo_addr(?lstr4_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr4_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_strcpy+0
;Input Capture Four Channel Demo.c,101 :: 		UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
MOVW	R0, #lo_addr(?lstr5_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr5_Input_32Capture_32Four_32Channel_32Demo+0)
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,102 :: 		delay_ms(500);
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
;Input Capture Four Channel Demo.c,105 :: 		init_timer4();
BL	_init_timer4+0
;Input Capture Four Channel Demo.c,106 :: 		init_input_capture();
BL	_init_input_capture+0
;Input Capture Four Channel Demo.c,109 :: 		while(1) {
L_main2:
;Input Capture Four Channel Demo.c,111 :: 		if (poll_flag) {                                                     // Calculate finger state values (Set by timer 3)
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;Input Capture Four Channel Demo.c,112 :: 		poll_flag = 0;                                                    // Clear flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,113 :: 		calc_finger_state(&fngr_pointer);                                 // Call state calculation function for each finger
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_calc_finger_state+0
;Input Capture Four Channel Demo.c,114 :: 		calc_finger_state(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_calc_finger_state+0
;Input Capture Four Channel Demo.c,115 :: 		calc_finger_state(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_calc_finger_state+0
;Input Capture Four Channel Demo.c,116 :: 		calc_finger_state(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_calc_finger_state+0
;Input Capture Four Channel Demo.c,118 :: 		}
L_main4:
;Input Capture Four Channel Demo.c,120 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main21
MOVW	R0, #lo_addr(_TERMINAL_PRINT_THRESH+0)
MOVT	R0, #hi_addr(_TERMINAL_PRINT_THRESH+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_terminal_print_count+0)
MOVT	R0, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L__main20
L__main19:
;Input Capture Four Channel Demo.c,122 :: 		print_finger_info(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_print_finger_info+0
;Input Capture Four Channel Demo.c,123 :: 		print_finger_info(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_print_finger_info+0
;Input Capture Four Channel Demo.c,124 :: 		print_finger_info(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_print_finger_info+0
;Input Capture Four Channel Demo.c,125 :: 		print_finger_info(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_print_finger_info+0
;Input Capture Four Channel Demo.c,126 :: 		UART1_Write_Text("\n\n\n\n\n\n\n\r");
MOVW	R0, #lo_addr(?lstr6_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr6_Input_32Capture_32Four_32Channel_32Demo+0)
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,120 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
L__main21:
L__main20:
;Input Capture Four Channel Demo.c,128 :: 		}
IT	AL
BAL	L_main2
;Input Capture Four Channel Demo.c,129 :: 		}       // Main ends here
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_timer3_ISR:
;Input Capture Four Channel Demo.c,191 :: 		void timer3_ISR() iv IVT_INT_TIM3 {
;Input Capture Four Channel Demo.c,194 :: 		if(TIM3_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR8
;Input Capture Four Channel Demo.c,195 :: 		TIM3_SR.UIF = 0;                                                        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,196 :: 		overflow_count++;                                                       // Increment overflow counter
MOVW	R1, #lo_addr(_overflow_count+0)
MOVT	R1, #hi_addr(_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,197 :: 		}
L_timer3_ISR8:
;Input Capture Four Channel Demo.c,200 :: 		if (TIM3_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR9
;Input Capture Four Channel Demo.c,201 :: 		fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;                // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+32)
MOVT	R2, #hi_addr(_fngr_pointer+32)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+28)
MOVT	R0, #hi_addr(_fngr_pointer+28)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,202 :: 		fngr_pointer.enc_end_time = TIM3_CCR1;                                  // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR1+0)
MOVT	R0, #hi_addr(TIM3_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,203 :: 		fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;        // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+44)
MOVT	R2, #hi_addr(_fngr_pointer+44)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+40)
MOVT	R0, #hi_addr(_fngr_pointer+40)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,204 :: 		fngr_pointer.enc_overflow_end = overflow_count;                         // Store number of timer 3 overflows for this finger
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,205 :: 		fngr_pointer.enc_chan_b = FNGR_POINTER_ENC_B;                           // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,206 :: 		fngr_pointer.position_temp++;                                           // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pointer+16)
MOVT	R1, #hi_addr(_fngr_pointer+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,207 :: 		}
L_timer3_ISR9:
;Input Capture Four Channel Demo.c,211 :: 		if (TIM3_SR.CC2IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR10
;Input Capture Four Channel Demo.c,212 :: 		fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+32)
MOVT	R2, #hi_addr(_fngr_middle+32)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+28)
MOVT	R0, #hi_addr(_fngr_middle+28)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,213 :: 		fngr_middle.enc_end_time = TIM3_CCR2;                                   // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR2+0)
MOVT	R0, #hi_addr(TIM3_CCR2+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,214 :: 		fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+44)
MOVT	R2, #hi_addr(_fngr_middle+44)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+40)
MOVT	R0, #hi_addr(_fngr_middle+40)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,215 :: 		fngr_middle.enc_overflow_end = overflow_count;                          // Store number of timer 3 overflows for this finger
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,216 :: 		fngr_middle.enc_chan_b = FNGR_MIDDLE_ENC_B;                            // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_middle+26)
MOVT	R0, #hi_addr(_fngr_middle+26)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,217 :: 		fngr_middle.position_temp++;                                          // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_middle+16)
MOVT	R1, #hi_addr(_fngr_middle+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,218 :: 		}
L_timer3_ISR10:
;Input Capture Four Channel Demo.c,221 :: 		if (TIM3_SR.CC3IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR11
;Input Capture Four Channel Demo.c,222 :: 		fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+32)
MOVT	R2, #hi_addr(_fngr_ring+32)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+28)
MOVT	R0, #hi_addr(_fngr_ring+28)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,223 :: 		fngr_ring.enc_end_time = TIM3_CCR3;                                     // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR3+0)
MOVT	R0, #hi_addr(TIM3_CCR3+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,224 :: 		fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+44)
MOVT	R2, #hi_addr(_fngr_ring+44)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+40)
MOVT	R0, #hi_addr(_fngr_ring+40)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,225 :: 		fngr_ring.enc_overflow_end = overflow_count;                            // Store number of timer 3 overflows for this finger
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,226 :: 		fngr_ring.enc_chan_b = FNGR_RING_ENC_B;                              // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_ring+26)
MOVT	R0, #hi_addr(_fngr_ring+26)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,227 :: 		fngr_ring.position_temp++;                                            // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_ring+16)
MOVT	R1, #hi_addr(_fngr_ring+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,228 :: 		}
L_timer3_ISR11:
;Input Capture Four Channel Demo.c,231 :: 		if (TIM3_SR.CC4IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR12
;Input Capture Four Channel Demo.c,232 :: 		fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+32)
MOVT	R2, #hi_addr(_fngr_pinky+32)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+28)
MOVT	R0, #hi_addr(_fngr_pinky+28)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,233 :: 		fngr_pinky.enc_end_time = TIM3_CCR4;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR4+0)
MOVT	R0, #hi_addr(TIM3_CCR4+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,234 :: 		fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+44)
MOVT	R2, #hi_addr(_fngr_pinky+44)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+40)
MOVT	R0, #hi_addr(_fngr_pinky+40)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,235 :: 		fngr_pinky.enc_overflow_end = overflow_count;                           // Store number of timer 3 overflows for this finger
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,236 :: 		fngr_pinky.enc_chan_b = FNGR_PINKY_ENC_B;                             // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pinky+26)
MOVT	R0, #hi_addr(_fngr_pinky+26)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,237 :: 		fngr_pinky.position_temp++;                                           // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pinky+16)
MOVT	R1, #hi_addr(_fngr_pinky+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,238 :: 		}
L_timer3_ISR12:
;Input Capture Four Channel Demo.c,239 :: 		}
L_end_timer3_ISR:
BX	LR
; end of _timer3_ISR
_timer4_ISR:
;Input Capture Four Channel Demo.c,243 :: 		void timer4_ISR() iv IVT_INT_TIM4 {
;Input Capture Four Channel Demo.c,245 :: 		TIM4_SR.UIF = 0;                                                            // Clear timer 4 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SR+0)
MOVT	R0, #hi_addr(TIM4_SR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,246 :: 		poll_flag = 1;                                                              // Set poll flag for main loop
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,247 :: 		terminal_print_count++;                                                     // Increment the debug print counter
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Input Capture Four Channel Demo.c,248 :: 		}
L_end_timer4_ISR:
BX	LR
; end of _timer4_ISR
_init_GPIO:
;Input Capture Four Channel Demo.c,255 :: 		void init_GPIO() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Four Channel Demo.c,258 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3);
MOVS	R1, #15
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Four Channel Demo.c,259 :: 		GPIO_Digital_Output(&GPIOD_Base, _GPIO_PINMASK_5);                          // **DEBUG** For timing interrupt handler
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Four Channel Demo.c,260 :: 		}
L_end_init_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_GPIO
_init_UART:
;Input Capture Four Channel Demo.c,265 :: 		void init_UART() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Four Channel Demo.c,267 :: 		UART1_Init(UART_BAUD_RATE);                                                 // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;Input Capture Four Channel Demo.c,268 :: 		Delay_ms(200);                                                              // Wait for UART to stabilize
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
;Input Capture Four Channel Demo.c,269 :: 		UART_Write_Text("\rUART Init Complete\r\n");                                // Print test statement to terminal
MOVW	R0, #lo_addr(?lstr7_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr7_Input_32Capture_32Four_32Channel_32Demo+0)
BL	_UART_Write_Text+0
;Input Capture Four Channel Demo.c,270 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_init_input_capture:
;Input Capture Four Channel Demo.c,274 :: 		void init_input_capture() {
SUB	SP, SP, #20
STR	LR, [SP, #0]
;Input Capture Four Channel Demo.c,277 :: 		RCC_APB1ENR.TIM3EN = 1;                                                 // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,278 :: 		TIM3_CR1.CEN = 0;                                                       // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,279 :: 		TIM3_CR2.TI1S = 0;                                                      // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM3_CR2+0)
MOVT	R0, #hi_addr(TIM3_CR2+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,280 :: 		TIM3_PSC = ENCODER_TIM_PSC;                                             // Set timer 3 prescaler
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
STR	R0, [SP, #12]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,281 :: 		TIM3_ARR = ENCODER_TIM_RELOAD;                                          // Set timer 3 Auto Reload value
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,282 :: 		TIM3_CR1 |= 0;                                                          // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,285 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH1_PA6);             // Configure alternate function for A6 as Timer 3 Channel 1
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM3_CH1_PA6+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM3_CH1_PA6+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Four Channel Demo.c,286 :: 		TIM3_CCMR1_Input |= 0x01;                                               // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,287 :: 		TIM3_CCER.CC1P = 0;                                                     // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,288 :: 		TIM3_CCER.CC1NP = 0;
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,289 :: 		TIM3_CCER.CC1E = 1;                                                     // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,290 :: 		TIM3_DIER.CC1IE = 1;                                                    // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,293 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH2_PC7);             // Configure alternate function for pin C7 as Timer 3 Channel 2
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM3_CH2_PC7+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM3_CH2_PC7+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Four Channel Demo.c,294 :: 		TIM3_CCMR1_Input |= 0x100;                                              // Set capture channel 2 as input on TI2 (CC2S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,295 :: 		TIM3_CCER.CC2P = 0;                                                     // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,296 :: 		TIM3_CCER.CC2NP = 0;
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,297 :: 		TIM3_CCER.CC2E = 1;                                                     // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,298 :: 		TIM3_DIER.CC2IE = 1;                                                    // Enable interrupt on capture channel 2
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,301 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH3_PB0);             // Configure alternate function for pin B0 as Timer 3 Channel 3
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM3_CH3_PB0+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM3_CH3_PB0+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Four Channel Demo.c,302 :: 		TIM3_CCMR2_Input |= 0x01;                                               // Set capture channel 3 as input on TI3 (CC3S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,303 :: 		TIM3_CCER.CC3P = 0;                                                     // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,304 :: 		TIM3_CCER.CC3NP = 0;
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,305 :: 		TIM3_CCER.CC3E = 1;                                                     // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,306 :: 		TIM3_DIER.CC3IE = 1;                                                    // Enable interrupt on capture channel 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,309 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH4_PB1);             // Configure alternate function for pin B1 as Timer 3 Channel 4
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM3_CH4_PB1+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM3_CH4_PB1+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Four Channel Demo.c,310 :: 		TIM3_CCMR2_Input |= 0x100;                                              // Set capture channel 4 as input on TI4 (CC4S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,311 :: 		TIM3_CCER.CC3P = 0;                                                     // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,312 :: 		TIM3_CCER.CC3NP = 0;
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,313 :: 		TIM3_CCER.CC4E = 1;                                                     // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,314 :: 		TIM3_DIER.CC4IE = 1;                                                    // Enable interrupt on capture channel 4
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,317 :: 		TIM3_DIER.UIE = 1;                                                      // Enable overflow interrupt
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,318 :: 		NVIC_IntEnable(IVT_INT_TIM3);                                           // Enable timer 2 interrupt
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;Input Capture Four Channel Demo.c,319 :: 		TIM3_CR1.CEN = 1;                                                       // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,322 :: 		timer3_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
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
MOVW	R2, #lo_addr(_timer3_period_ms+0)
MOVT	R2, #hi_addr(_timer3_period_ms+0)
STRD	R0, R1, [R2, #0]
;Input Capture Four Channel Demo.c,323 :: 		}
L_end_init_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _init_input_capture
_init_timer4:
;Input Capture Four Channel Demo.c,328 :: 		void init_timer4() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Four Channel Demo.c,330 :: 		RCC_APB1ENR.TIM4EN = 1;                                                     // Enable clock for timer 4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,331 :: 		TIM4_CR1.CEN = 0;                                                           // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,332 :: 		TIM4_PSC = 279;                                                             // Set timer 4 prescaler
MOVW	R1, #279
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,333 :: 		TIM4_ARR = 59999;                                                           // Set timer 4 overflow value
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,334 :: 		NVIC_IntEnable(IVT_INT_TIM4);                                               // Enable timer 4 interrupt
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;Input Capture Four Channel Demo.c,335 :: 		TIM4_DIER.UIE = 1;                                                          // Timer 4 update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_DIER+0)
MOVT	R0, #hi_addr(TIM4_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,336 :: 		TIM4_CR1.CEN = 1;                                                           // Enable timer/counter
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,337 :: 		}
L_end_init_timer4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_timer4
_calc_finger_state:
;Input Capture Four Channel Demo.c,344 :: 		void calc_finger_state( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R9, R0
; fngr end address is: 0 (R0)
; fngr start address is: 36 (R9)
;Input Capture Four Channel Demo.c,347 :: 		fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;
ADD	R3, R9, #48
ADD	R1, R9, #44
LDR	R2, [R1, #0]
ADD	R1, R9, #40
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,350 :: 		fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);
ADD	R3, R9, #52
ADD	R1, R9, #48
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R1, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R1, #0]
SUBS	R1, R1, #3
MULS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,353 :: 		fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;
ADD	R3, R9, #36
ADD	R1, R9, #32
LDR	R2, [R1, #0]
ADD	R1, R9, #28
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,356 :: 		fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;
ADD	R3, R9, #56
ADD	R1, R9, #52
LDR	R2, [R1, #0]
ADD	R1, R9, #36
LDR	R1, [R1, #0]
ADDS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,359 :: 		fngr->input_sig_period = (long double) fngr->enc_total_ticks * timer3_period_ms;
ADD	R1, R9, #64
STR	R1, [SP, #4]
ADD	R1, R9, #56
LDR	R1, [R1, #0]
MOV	R0, R1
BL	__UnsignedIntegralToLongDouble+0
MOVW	R2, #lo_addr(_timer3_period_ms+0)
MOVT	R2, #hi_addr(_timer3_period_ms+0)
VLDR	#1, D0, [R2, #0]
VMOV	R2, S0
VMOV	R3, S1
BL	__Mul_DP+0
LDR	R2, [SP, #4]
STRD	R0, R1, [R2, #0]
;Input Capture Four Channel Demo.c,362 :: 		fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
ADD	R1, R9, #60
STR	R1, [SP, #8]
ADD	R1, R9, #64
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
;Input Capture Four Channel Demo.c,365 :: 		if (fngr->enc_chan_b == 1) {                                                // Clockwise
ADD	R1, R9, #26
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_calc_finger_state15
;Input Capture Four Channel Demo.c,366 :: 		fngr->direction_actual = 1;
ADD	R2, R9, #24
MOVS	R1, #1
STRH	R1, [R2, #0]
;Input Capture Four Channel Demo.c,367 :: 		fngr->position_actual += fngr->position_temp;                       // Calculate new position
ADD	R3, R9, #20
ADD	R1, R9, #16
LDR	R2, [R1, #0]
LDR	R1, [R3, #0]
ADDS	R1, R1, R2
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,368 :: 		}
IT	AL
BAL	L_calc_finger_state16
L_calc_finger_state15:
;Input Capture Four Channel Demo.c,370 :: 		else if (fngr->enc_chan_b == 0) {                                           // Counter Clockwise
ADD	R1, R9, #26
LDRH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_calc_finger_state17
;Input Capture Four Channel Demo.c,371 :: 		fngr->direction_actual = 0;
ADD	R2, R9, #24
MOVS	R1, #0
STRH	R1, [R2, #0]
;Input Capture Four Channel Demo.c,372 :: 		fngr->position_actual -= fngr->position_temp;                       // Calculate new position
ADD	R3, R9, #20
ADD	R1, R9, #16
LDR	R2, [R1, #0]
LDR	R1, [R3, #0]
SUB	R1, R1, R2
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,373 :: 		}
IT	AL
BAL	L_calc_finger_state18
L_calc_finger_state17:
;Input Capture Four Channel Demo.c,376 :: 		fngr->direction_actual = 7;
ADD	R2, R9, #24
MOVS	R1, #7
STRH	R1, [R2, #0]
;Input Capture Four Channel Demo.c,377 :: 		}
L_calc_finger_state18:
L_calc_finger_state16:
;Input Capture Four Channel Demo.c,380 :: 		fngr->position_temp = 0;
ADD	R2, R9, #16
; fngr end address is: 36 (R9)
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Four Channel Demo.c,381 :: 		}
L_end_calc_finger_state:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _calc_finger_state
_print_finger_info:
;Input Capture Four Channel Demo.c,385 :: 		void print_finger_info( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #52
STR	LR, [SP, #0]
MOV	R8, R0
; fngr end address is: 0 (R0)
; fngr start address is: 32 (R8)
;Input Capture Four Channel Demo.c,392 :: 		UART1_Write_Text("\n\rFinger Name: ");                                      //Print name of current finger to terminal
MOVW	R1, #lo_addr(?lstr8_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr8_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,393 :: 		UART1_Write_Text(fngr->name);
MOV	R0, R8
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,394 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr9_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr9_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,396 :: 		LongWordToStr(fngr->input_sig_frequency, frequency_text);                   // Print input capture signal frequency to terminal
ADD	R2, SP, #4
ADD	R1, R8, #60
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;Input Capture Four Channel Demo.c,397 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R1, #lo_addr(?lstr10_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr10_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,398 :: 		UART1_Write_Text(frequency_text);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,399 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr11_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr11_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,401 :: 		IntToStr(fngr->direction_actual, direction_text);                           // Print direction of movement to terminal
ADD	R2, SP, #34
ADD	R1, R8, #24
LDRH	R1, [R1, #0]
SXTH	R1, R1
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
;Input Capture Four Channel Demo.c,402 :: 		UART1_Write_Text("Direction of movement:             ");
MOVW	R1, #lo_addr(?lstr12_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr12_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,403 :: 		UART1_Write_Text(direction_text);
ADD	R1, SP, #34
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,404 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr13_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr13_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,406 :: 		LongToStr(fngr->position_actual, position_text);                            // Print total number of input events (position) to terminal
ADD	R2, SP, #19
ADD	R1, R8, #20
; fngr end address is: 32 (R8)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongToStr+0
;Input Capture Four Channel Demo.c,407 :: 		UART1_Write_Text("Position of finger:                ");
MOVW	R1, #lo_addr(?lstr14_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr14_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,408 :: 		UART1_Write_Text(position_text);
ADD	R1, SP, #19
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,409 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr15_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr15_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,411 :: 		terminal_print_count = 0;                                                   // Reset counter for terminal printing
MOVS	R2, #0
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
STRH	R2, [R1, #0]
;Input Capture Four Channel Demo.c,412 :: 		}
L_end_print_finger_info:
LDR	LR, [SP, #0]
ADD	SP, SP, #52
BX	LR
; end of _print_finger_info
