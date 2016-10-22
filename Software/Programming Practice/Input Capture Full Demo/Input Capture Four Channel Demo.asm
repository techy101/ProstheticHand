_main:
;Input Capture Four Channel Demo.c,73 :: 		void main() {
;Input Capture Four Channel Demo.c,76 :: 		init_UART();
BL	_init_UART+0
;Input Capture Four Channel Demo.c,77 :: 		init_GPIO();
BL	_init_GPIO+0
;Input Capture Four Channel Demo.c,80 :: 		strcpy(fngr_pointer.name, "Pointer");
MOVW	R0, #lo_addr(?lstr1_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr1_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_strcpy+0
;Input Capture Four Channel Demo.c,81 :: 		strcpy(fngr_middle.name, "Middle");
MOVW	R0, #lo_addr(?lstr2_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr2_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_strcpy+0
;Input Capture Four Channel Demo.c,82 :: 		strcpy(fngr_ring.name, "Ring");
MOVW	R0, #lo_addr(?lstr3_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr3_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_strcpy+0
;Input Capture Four Channel Demo.c,83 :: 		strcpy(fngr_pinky.name, "Pinky");
MOVW	R0, #lo_addr(?lstr4_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr4_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_strcpy+0
;Input Capture Four Channel Demo.c,86 :: 		UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
MOVW	R0, #lo_addr(?lstr5_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr5_Input_32Capture_32Four_32Channel_32Demo+0)
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,87 :: 		delay_ms(500);
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
;Input Capture Four Channel Demo.c,90 :: 		init_timer3();
BL	_init_timer3+0
;Input Capture Four Channel Demo.c,91 :: 		init_input_capture();
BL	_init_input_capture+0
;Input Capture Four Channel Demo.c,94 :: 		while(1) {
L_main2:
;Input Capture Four Channel Demo.c,96 :: 		if (poll_flag) {                                                     // Calculate finger state values (Set by timer 3)
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;Input Capture Four Channel Demo.c,97 :: 		poll_flag = 0;                                                    // Clear flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,98 :: 		calc_finger_state(&fngr_pointer);                                 // Call state calculation function for each finger
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_calc_finger_state+0
;Input Capture Four Channel Demo.c,99 :: 		calc_finger_state(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_calc_finger_state+0
;Input Capture Four Channel Demo.c,100 :: 		calc_finger_state(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_calc_finger_state+0
;Input Capture Four Channel Demo.c,101 :: 		calc_finger_state(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_calc_finger_state+0
;Input Capture Four Channel Demo.c,103 :: 		}
L_main4:
;Input Capture Four Channel Demo.c,105 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
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
;Input Capture Four Channel Demo.c,107 :: 		print_finger_info(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_print_finger_info+0
;Input Capture Four Channel Demo.c,108 :: 		print_finger_info(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_print_finger_info+0
;Input Capture Four Channel Demo.c,109 :: 		print_finger_info(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_print_finger_info+0
;Input Capture Four Channel Demo.c,110 :: 		print_finger_info(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_print_finger_info+0
;Input Capture Four Channel Demo.c,111 :: 		UART1_Write_Text("\n\n\n\n\n\n\n\r");
MOVW	R0, #lo_addr(?lstr6_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr6_Input_32Capture_32Four_32Channel_32Demo+0)
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,105 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
L__main21:
L__main20:
;Input Capture Four Channel Demo.c,113 :: 		}
IT	AL
BAL	L_main2
;Input Capture Four Channel Demo.c,114 :: 		}       // Main ends here
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_timer2_ISR:
;Input Capture Four Channel Demo.c,124 :: 		void timer2_ISR() iv IVT_INT_TIM2 {
;Input Capture Four Channel Demo.c,127 :: 		if(TIM2_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR8
;Input Capture Four Channel Demo.c,128 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,129 :: 		overflow_count++;                                                       // Increment overflow counter
MOVW	R1, #lo_addr(_overflow_count+0)
MOVT	R1, #hi_addr(_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,130 :: 		}
L_timer2_ISR8:
;Input Capture Four Channel Demo.c,133 :: 		if (TIM2_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR9
;Input Capture Four Channel Demo.c,134 :: 		fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;                // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+32)
MOVT	R2, #hi_addr(_fngr_pointer+32)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+28)
MOVT	R0, #hi_addr(_fngr_pointer+28)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,135 :: 		fngr_pointer.enc_end_time = TIM2_CCR1;                                  // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,136 :: 		fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;        // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+44)
MOVT	R2, #hi_addr(_fngr_pointer+44)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+40)
MOVT	R0, #hi_addr(_fngr_pointer+40)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,137 :: 		fngr_pointer.enc_overflow_end = overflow_count;                         // Store number of timer 2 overflows for this finger
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,138 :: 		fngr_pointer.enc_chan_b = FNGR_POINTER_ENC_B;                           // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,139 :: 		fngr_pointer.position_temp++;                                           // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pointer+16)
MOVT	R1, #hi_addr(_fngr_pointer+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,140 :: 		}
L_timer2_ISR9:
;Input Capture Four Channel Demo.c,144 :: 		if (TIM2_SR.CC2IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR10
;Input Capture Four Channel Demo.c,145 :: 		fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+32)
MOVT	R2, #hi_addr(_fngr_middle+32)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+28)
MOVT	R0, #hi_addr(_fngr_middle+28)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,146 :: 		fngr_middle.enc_end_time = TIM2_CCR2;                                   // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR2+0)
MOVT	R0, #hi_addr(TIM2_CCR2+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,147 :: 		fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+44)
MOVT	R2, #hi_addr(_fngr_middle+44)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+40)
MOVT	R0, #hi_addr(_fngr_middle+40)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,148 :: 		fngr_middle.enc_overflow_end = overflow_count;                          // Store number of timer 2 overflows for this finger
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,149 :: 		fngr_pointer.enc_chan_b = FNGR_MIDDLE_ENC_B;                            // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,150 :: 		fngr_middle.position_actual++;                                          // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_middle+20)
MOVT	R1, #hi_addr(_fngr_middle+20)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,151 :: 		}
L_timer2_ISR10:
;Input Capture Four Channel Demo.c,154 :: 		if (TIM2_SR.CC3IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR11
;Input Capture Four Channel Demo.c,155 :: 		fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+32)
MOVT	R2, #hi_addr(_fngr_ring+32)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+28)
MOVT	R0, #hi_addr(_fngr_ring+28)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,156 :: 		fngr_ring.enc_end_time = TIM2_CCR3;                                     // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR3+0)
MOVT	R0, #hi_addr(TIM2_CCR3+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,157 :: 		fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+44)
MOVT	R2, #hi_addr(_fngr_ring+44)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+40)
MOVT	R0, #hi_addr(_fngr_ring+40)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,158 :: 		fngr_ring.enc_overflow_end = overflow_count;                            // Store number of timer 2 overflows for this finger
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,159 :: 		fngr_pointer.enc_chan_b = FNGR_RING_ENC_B;                              // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,160 :: 		fngr_ring.position_actual++;                                            // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_ring+20)
MOVT	R1, #hi_addr(_fngr_ring+20)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,161 :: 		}
L_timer2_ISR11:
;Input Capture Four Channel Demo.c,164 :: 		if (TIM2_SR.CC4IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR12
;Input Capture Four Channel Demo.c,165 :: 		fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+32)
MOVT	R2, #hi_addr(_fngr_pinky+32)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+28)
MOVT	R0, #hi_addr(_fngr_pinky+28)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,166 :: 		fngr_pinky.enc_end_time = TIM2_CCR4;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR4+0)
MOVT	R0, #hi_addr(TIM2_CCR4+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,167 :: 		fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+44)
MOVT	R2, #hi_addr(_fngr_pinky+44)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+40)
MOVT	R0, #hi_addr(_fngr_pinky+40)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,168 :: 		fngr_pinky.enc_overflow_end = overflow_count;                           // Store number of timer 2 overflows for this finger
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Four Channel Demo.c,169 :: 		fngr_pointer.enc_chan_b = FNGR_PINKY_ENC_B;                             // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,170 :: 		fngr_pinky.position_actual++;                                           // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pinky+20)
MOVT	R1, #hi_addr(_fngr_pinky+20)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Four Channel Demo.c,171 :: 		}
L_timer2_ISR12:
;Input Capture Four Channel Demo.c,172 :: 		}
L_end_timer2_ISR:
BX	LR
; end of _timer2_ISR
_timer3_ISR:
;Input Capture Four Channel Demo.c,176 :: 		void timer3_ISR() iv IVT_INT_TIM3 {
;Input Capture Four Channel Demo.c,178 :: 		TIM3_SR.UIF = 0;                                                            // Clear timer 3 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,179 :: 		poll_flag = 1;                                                              // Set poll flag for main loop
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Four Channel Demo.c,180 :: 		terminal_print_count++;                                                     // Increment the debug print counter
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Input Capture Four Channel Demo.c,181 :: 		}
L_end_timer3_ISR:
BX	LR
; end of _timer3_ISR
_init_GPIO:
;Input Capture Four Channel Demo.c,188 :: 		void init_GPIO() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Four Channel Demo.c,191 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7);
MOVS	R1, #240
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Four Channel Demo.c,192 :: 		GPIO_Digital_Output(&GPIOD_Base, _GPIO_PINMASK_1);                          // **DEBUG** For timing interrupt handler
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Four Channel Demo.c,193 :: 		}
L_end_init_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_GPIO
_init_UART:
;Input Capture Four Channel Demo.c,198 :: 		void init_UART() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Four Channel Demo.c,200 :: 		UART1_Init(UART_BAUD_RATE);                                                 // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;Input Capture Four Channel Demo.c,201 :: 		Delay_ms(200);                                                              // Wait for UART to stabilize
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
;Input Capture Four Channel Demo.c,202 :: 		UART_Write_Text("\rUART Init Complete\r\n");                                // Print test statement to terminal
MOVW	R0, #lo_addr(?lstr7_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R0, #hi_addr(?lstr7_Input_32Capture_32Four_32Channel_32Demo+0)
BL	_UART_Write_Text+0
;Input Capture Four Channel Demo.c,203 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_init_input_capture:
;Input Capture Four Channel Demo.c,208 :: 		void init_input_capture() {
SUB	SP, SP, #20
STR	LR, [SP, #0]
;Input Capture Four Channel Demo.c,211 :: 		RCC_APB1ENR.TIM2EN = 1;                                                 // Enable clock gating for timer module 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,212 :: 		TIM2_CR1.CEN = 0;                                                       // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,213 :: 		TIM2_CR2.TI1S = 0;                                                      // TIM2_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM2_CR2+0)
MOVT	R0, #hi_addr(TIM2_CR2+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,214 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                             // Set timer 2 prescaler
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
STR	R0, [SP, #12]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,215 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                          // Set timer 2 Auto Reload value
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,216 :: 		TIM2_CR1 |= 0x10;                                                       // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,219 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA0);             // Configure alternate function for A0 as Timer 2 Channel 1
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH1_PA0+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Four Channel Demo.c,220 :: 		TIM2_CCMR1_Input |= 0x01;                                               // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,221 :: 		TIM2_CCER.CC1P = 0;                                                     // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,222 :: 		TIM2_CCER.CC1NP = 0;
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,223 :: 		TIM2_CCER.CC1E = 1;                                                     // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,224 :: 		TIM2_DIER.CC1IE = 1;                                                    // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,227 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH2_PA1);             // Configure alternate function for pin A1 as Timer 2 Channel 2
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH2_PA1+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH2_PA1+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Four Channel Demo.c,228 :: 		TIM2_CCMR1_Input |= 0x100;                                              // Set capture channel 2 as input on TI2 (CC2S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,229 :: 		TIM2_CCER.CC2P = 0;                                                     // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,230 :: 		TIM2_CCER.CC2NP = 0;
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,231 :: 		TIM2_CCER.CC2E = 1;                                                     // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,232 :: 		TIM2_DIER.CC2IE = 1;                                                    // Enable interrupt on capture channel 2
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,235 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH3_PA2);             // Configure alternate function for pin A2 as Timer 2 Channel 3
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH3_PA2+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH3_PA2+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Four Channel Demo.c,236 :: 		TIM2_CCMR2_Input |= 0x01;                                               // Set capture channel 3 as input on TI3 (CC3S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,237 :: 		TIM2_CCER.CC3P = 0;                                                     // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,238 :: 		TIM2_CCER.CC3NP = 0;
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,239 :: 		TIM2_CCER.CC3E = 1;                                                     // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,240 :: 		TIM2_DIER.CC3IE = 1;                                                    // Enable interrupt on capture channel 3
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,243 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH4_PA3);             // Configure alternate function for pin A3 as Timer 2 Channel 4
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH4_PA3+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH4_PA3+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Four Channel Demo.c,244 :: 		TIM2_CCMR2_Input |= 0x100;                                              // Set capture channel 4 as input on TI4 (CC4S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM2_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,245 :: 		TIM2_CCER.CC3P = 0;                                                     // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,246 :: 		TIM2_CCER.CC3NP = 0;
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,247 :: 		TIM2_CCER.CC4E = 1;                                                     // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,248 :: 		TIM2_DIER.CC4IE = 1;                                                    // Enable interrupt on capture channel 4
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,251 :: 		TIM2_DIER.UIE = 1;                                                      // Enable overflow interrupt
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,252 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                           // Enable timer 2 interrupt
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Input Capture Four Channel Demo.c,253 :: 		TIM2_CR1.CEN = 1;                                                       // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,256 :: 		timer2_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
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
;Input Capture Four Channel Demo.c,257 :: 		}
L_end_init_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _init_input_capture
_init_timer3:
;Input Capture Four Channel Demo.c,262 :: 		void init_timer3() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Four Channel Demo.c,264 :: 		RCC_APB1ENR.TIM3EN = 1;                                                     // Enable clock for timer 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,265 :: 		TIM3_CR1.CEN = 0;                                                           // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,266 :: 		TIM3_PSC = 279;                                                             // Set timer 3 prescaler
MOVW	R1, #279
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,267 :: 		TIM3_ARR = 59999;                                                           // Set timer 3 overflow value
MOVW	R1, #59999
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,268 :: 		NVIC_IntEnable(IVT_INT_TIM3);                                               // Enable timer 3 interrupt
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;Input Capture Four Channel Demo.c,269 :: 		TIM3_DIER.UIE = 1;                                                          // Timer 3 update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,270 :: 		TIM3_CR1.CEN = 1;                                                           // Enable timer/counter
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Four Channel Demo.c,271 :: 		}
L_end_init_timer3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_timer3
_calc_finger_state:
;Input Capture Four Channel Demo.c,278 :: 		void calc_finger_state( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R9, R0
; fngr end address is: 0 (R0)
; fngr start address is: 36 (R9)
;Input Capture Four Channel Demo.c,281 :: 		fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;
ADD	R3, R9, #48
ADD	R1, R9, #44
LDR	R2, [R1, #0]
ADD	R1, R9, #40
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,284 :: 		fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);
ADD	R3, R9, #52
ADD	R1, R9, #48
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R1, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R1, #0]
SUBS	R1, R1, #3
MULS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,287 :: 		fngr->enc_delta_ticks = (unsigned long) fngr->enc_start_time - fngr->enc_end_time;
ADD	R3, R9, #36
ADD	R1, R9, #28
LDR	R2, [R1, #0]
ADD	R1, R9, #32
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,290 :: 		fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;
ADD	R3, R9, #56
ADD	R1, R9, #52
LDR	R2, [R1, #0]
ADD	R1, R9, #36
LDR	R1, [R1, #0]
ADDS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,293 :: 		fngr->input_sig_period = (long double) fngr->enc_total_ticks * timer2_period_ms;
ADD	R1, R9, #64
STR	R1, [SP, #4]
ADD	R1, R9, #56
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
;Input Capture Four Channel Demo.c,296 :: 		fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
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
;Input Capture Four Channel Demo.c,299 :: 		if (fngr->enc_chan_b == 1) {                                                // Clockwise
ADD	R1, R9, #26
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_calc_finger_state15
;Input Capture Four Channel Demo.c,300 :: 		fngr->direction_actual = 1;
ADD	R2, R9, #24
MOVS	R1, #1
STRH	R1, [R2, #0]
;Input Capture Four Channel Demo.c,301 :: 		fngr->position_actual += fngr->position_temp;                       // Calculate new position
ADD	R3, R9, #20
ADD	R1, R9, #16
LDR	R2, [R1, #0]
LDR	R1, [R3, #0]
ADDS	R1, R1, R2
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,302 :: 		}
IT	AL
BAL	L_calc_finger_state16
L_calc_finger_state15:
;Input Capture Four Channel Demo.c,304 :: 		else if (fngr->enc_chan_b == 0) {                                           // Counter Clockwise
ADD	R1, R9, #26
LDRH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_calc_finger_state17
;Input Capture Four Channel Demo.c,305 :: 		fngr->direction_actual = 0;
ADD	R2, R9, #24
MOVS	R1, #0
STRH	R1, [R2, #0]
;Input Capture Four Channel Demo.c,306 :: 		fngr->position_actual -= fngr->position_temp;                       // Calculate new position
ADD	R3, R9, #20
ADD	R1, R9, #16
LDR	R2, [R1, #0]
LDR	R1, [R3, #0]
SUB	R1, R1, R2
STR	R1, [R3, #0]
;Input Capture Four Channel Demo.c,307 :: 		}
IT	AL
BAL	L_calc_finger_state18
L_calc_finger_state17:
;Input Capture Four Channel Demo.c,310 :: 		fngr->direction_actual = 7;
ADD	R2, R9, #24
MOVS	R1, #7
STRH	R1, [R2, #0]
;Input Capture Four Channel Demo.c,311 :: 		}
L_calc_finger_state18:
L_calc_finger_state16:
;Input Capture Four Channel Demo.c,314 :: 		fngr->position_temp = 0;
ADD	R2, R9, #16
; fngr end address is: 36 (R9)
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Four Channel Demo.c,315 :: 		}
L_end_calc_finger_state:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _calc_finger_state
_print_finger_info:
;Input Capture Four Channel Demo.c,319 :: 		void print_finger_info( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #52
STR	LR, [SP, #0]
MOV	R8, R0
; fngr end address is: 0 (R0)
; fngr start address is: 32 (R8)
;Input Capture Four Channel Demo.c,326 :: 		UART1_Write_Text("\n\rFinger Name: ");                                      //Print name of current finger to terminal
MOVW	R1, #lo_addr(?lstr8_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr8_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,327 :: 		UART1_Write_Text(fngr->name);
MOV	R0, R8
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,328 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr9_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr9_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,330 :: 		LongWordToStr(fngr->input_sig_frequency, frequency_text);                   // Print input capture signal frequency to terminal
ADD	R2, SP, #4
ADD	R1, R8, #60
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;Input Capture Four Channel Demo.c,331 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R1, #lo_addr(?lstr10_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr10_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,332 :: 		UART1_Write_Text(frequency_text);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,333 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr11_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr11_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,335 :: 		IntToStr(fngr->direction_actual, direction_text);                           // Print direction of movement to terminal
ADD	R2, SP, #34
ADD	R1, R8, #24
LDRH	R1, [R1, #0]
SXTH	R1, R1
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
;Input Capture Four Channel Demo.c,336 :: 		UART1_Write_Text("Direction of movement:             ");
MOVW	R1, #lo_addr(?lstr12_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr12_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,337 :: 		UART1_Write_Text(direction_text);
ADD	R1, SP, #34
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,338 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr13_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr13_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,340 :: 		LongToStr(fngr->position_actual, position_text);                            // Print total number of input events (position) to terminal
ADD	R2, SP, #19
ADD	R1, R8, #20
; fngr end address is: 32 (R8)
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongToStr+0
;Input Capture Four Channel Demo.c,341 :: 		UART1_Write_Text("Position of finger:                ");
MOVW	R1, #lo_addr(?lstr14_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr14_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,342 :: 		UART1_Write_Text(position_text);
ADD	R1, SP, #19
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,343 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr15_Input_32Capture_32Four_32Channel_32Demo+0)
MOVT	R1, #hi_addr(?lstr15_Input_32Capture_32Four_32Channel_32Demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Four Channel Demo.c,345 :: 		terminal_print_count = 0;                                                   // Reset counter for terminal printing
MOVS	R2, #0
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
STRH	R2, [R1, #0]
;Input Capture Four Channel Demo.c,346 :: 		}
L_end_print_finger_info:
LDR	LR, [SP, #0]
ADD	SP, SP, #52
BX	LR
; end of _print_finger_info
