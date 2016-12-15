_main:
;Input Capture Complete 5ch.c,147 :: 		void main() {
SUB	SP, SP, #12
;Input Capture Complete 5ch.c,150 :: 		init_UART();                                                            // Configure and Initialize UART serial communications
BL	_init_UART+0
;Input Capture Complete 5ch.c,151 :: 		init_GPIO();                                                            // Configure MCU I/O
BL	_init_GPIO+0
;Input Capture Complete 5ch.c,152 :: 		init_pointer_PWM(0);                                                    // Set up PWM with 0% duty cycle
MOVS	R0, #0
BL	_init_pointer_PWM+0
;Input Capture Complete 5ch.c,166 :: 		InitTimer10();                  // Timer3 init
BL	_InitTimer10+0
;Input Capture Complete 5ch.c,170 :: 		strcpy(fngr_pointer.name, "fngr_pointer");
MOVW	R0, #lo_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,171 :: 		strcpy(fngr_middle.name, "fngr_middle");
MOVW	R0, #lo_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,172 :: 		strcpy(fngr_ring.name, "fngr_ring");
MOVW	R0, #lo_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,173 :: 		strcpy(fngr_pinky.name, "fngr_pinky");
MOVW	R0, #lo_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,174 :: 		strcpy(fngr_thumb.name, "fngr_thumb");
MOVW	R0, #lo_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,177 :: 		init_finger(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,178 :: 		init_finger(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,179 :: 		init_finger(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,180 :: 		init_finger(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,181 :: 		init_finger(&fngr_thumb);
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,186 :: 		UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
MOVW	R0, #lo_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,187 :: 		delay_ms(500);
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
;Input Capture Complete 5ch.c,190 :: 		init_timer11();                                                         // Initialize timer 11, used for sampling
BL	_init_timer11+0
;Input Capture Complete 5ch.c,191 :: 		init_input_capture();                                                   // Initialize input capture channels
BL	_init_input_capture+0
;Input Capture Complete 5ch.c,193 :: 		setP = SP_LOW;                                                          // Medium touch to begin
MOVW	R0, #lo_addr(_SP_LOW+0)
MOVT	R0, #hi_addr(_SP_LOW+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,194 :: 		change_SP_flag = 1;                                                     // Light touch next time
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_change_SP_flag+0)
MOVT	R0, #hi_addr(_change_SP_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,196 :: 		LOW_BATTERY_LED = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,199 :: 		ADC1_init();
BL	_ADC1_Init+0
;Input Capture Complete 5ch.c,202 :: 		while(1) {
L_main2:
;Input Capture Complete 5ch.c,204 :: 		if (poll_flag) {                             // system is running and doesn't need to go through shutoff
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;Input Capture Complete 5ch.c,205 :: 		poll_flag = 0;                                                    // Clear flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,206 :: 		sample_finger(&fngr_pointer);                                     // Call state calculation function for each finger - equivalent of sampling
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,207 :: 		sample_finger(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,208 :: 		sample_finger(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,209 :: 		sample_finger(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,210 :: 		sample_finger(&fngr_thumb);
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,213 :: 		}
L_main4:
;Input Capture Complete 5ch.c,216 :: 		if(analogGo && !doShutdown)         // if the system is running and still needs to go through the shutoff procedure
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main66
MOVW	R0, #lo_addr(_doShutdown+0)
MOVT	R0, #hi_addr(_doShutdown+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__main65
L__main64:
;Input Capture Complete 5ch.c,220 :: 		if(fngr_pointer.position_actual >= FULLY_CONTRACTED )
MOVW	R0, #lo_addr(_FULLY_CONTRACTED+0)
MOVT	R0, #hi_addr(_FULLY_CONTRACTED+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+20)
MOVT	R0, #hi_addr(_fngr_pointer+20)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L_main8
;Input Capture Complete 5ch.c,221 :: 		doShutdown = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_doShutdown+0)
MOVT	R0, #hi_addr(_doShutdown+0)
STRH	R1, [R0, #0]
L_main8:
;Input Capture Complete 5ch.c,224 :: 		MPV = fngr_pointer.tip_force;                                     // Store the sampled value locally
MOVW	R2, #lo_addr(_fngr_pointer+76)
MOVT	R2, #hi_addr(_fngr_pointer+76)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
STR	R0, [SP, #8]
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,226 :: 		dutyCycle = Pcontrol_force(&fngr_pointer, setP, MPV);  // apply P control; input is finger, SP, MPV
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
STR	R0, [SP, #4]
LDRSH	R0, [R0, #0]
UXTH	R2, R1
UXTH	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_Pcontrol_force+0
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,234 :: 		POINTER_DIRECTION = fngr_pointer.direction_desired;
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,248 :: 		if(MPV > setP)       // stabilizing - MARGIN should be small
LDR	R0, [SP, #4]
LDRSH	R1, [R0, #0]
LDR	R0, [SP, #8]
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	LS
BLS	L_main9
;Input Capture Complete 5ch.c,253 :: 		dutyCycle = Pcontrol_force(&fngr_pointer, setP, MPV);  // apply P control; input is finger, SP, MPV
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
UXTH	R2, R1
UXTH	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_Pcontrol_force+0
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,255 :: 		move_pointer_finger(&fngr_pointer, 0);
MOVS	R1, #0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_move_pointer_finger+0
;Input Capture Complete 5ch.c,259 :: 		}
IT	AL
BAL	L_main10
L_main9:
;Input Capture Complete 5ch.c,261 :: 		move_pointer_finger(&fngr_pointer, dutyCycle);                 // apply duty cycle
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRH	R0, [R0, #0]
UXTH	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_move_pointer_finger+0
L_main10:
;Input Capture Complete 5ch.c,216 :: 		if(analogGo && !doShutdown)         // if the system is running and still needs to go through the shutoff procedure
L__main66:
L__main65:
;Input Capture Complete 5ch.c,313 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main68
MOVW	R0, #lo_addr(_TERMINAL_PRINT_THRESH+0)
MOVT	R0, #hi_addr(_TERMINAL_PRINT_THRESH+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_terminal_print_count+0)
MOVT	R0, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L__main67
L__main63:
;Input Capture Complete 5ch.c,315 :: 		dirTrack = fngr_pointer.direction_desired;
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dirTrack+0)
MOVT	R0, #hi_addr(_dirTrack+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,316 :: 		UART1_Write_Text("Duty cycle returned is ");
MOVW	R0, #lo_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,317 :: 		IntToStr(dutyCycle, toStr);                                       // Print
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_toStr+0)
MOVT	R1, #hi_addr(_toStr+0)
BL	_IntToStr+0
;Input Capture Complete 5ch.c,318 :: 		UART1_Write_Text(toStr);
MOVW	R0, #lo_addr(_toStr+0)
MOVT	R0, #hi_addr(_toStr+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,319 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr8_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr8_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,321 :: 		UART_Write_Text(" \n Setpoint is ");   // display it
MOVW	R0, #lo_addr(?lstr9_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr9_Input_32Capture_32Complete_325ch+0)
BL	_UART_Write_Text+0
;Input Capture Complete 5ch.c,322 :: 		IntToStr(setP, toStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_toStr+0)
MOVT	R1, #hi_addr(_toStr+0)
BL	_IntToStr+0
;Input Capture Complete 5ch.c,323 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_toStr+0)
MOVT	R0, #hi_addr(_toStr+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,324 :: 		UART1_Write_Text("\n\r");
MOVW	R0, #lo_addr(?lstr10_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr10_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,325 :: 		print_finger_info(&fngr_pointer);                                 // Print statistics to terminal for each finger     - PUT BACK IN
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,326 :: 		print_finger_info(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,327 :: 		print_finger_info(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,328 :: 		print_finger_info(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,329 :: 		print_finger_info(&fngr_thumb);
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,330 :: 		UART1_Write_Text("\n\n\n\n\n\n\n\r");                             //PUT BACK IN
MOVW	R0, #lo_addr(?lstr11_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr11_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,313 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
L__main68:
L__main67:
;Input Capture Complete 5ch.c,334 :: 		if (doShutdown) {
MOVW	R0, #lo_addr(_doShutdown+0)
MOVT	R0, #hi_addr(_doShutdown+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main14
;Input Capture Complete 5ch.c,336 :: 		while(fngr_pointer.position_actual >= FULLY_EXTENDED) {                // Loop until finger is fully extended again
L_main15:
MOVW	R0, #lo_addr(_FULLY_EXTENDED+0)
MOVT	R0, #hi_addr(_FULLY_EXTENDED+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+20)
MOVT	R0, #hi_addr(_fngr_pointer+20)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	LT
BLT	L_main16
;Input Capture Complete 5ch.c,337 :: 		sample_finger(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,338 :: 		fngr_pointer.direction_desired = EXTEND;          // could move these two lines out in front of while
MOVS	R1, #1
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,339 :: 		POINTER_DIRECTION = EXTEND;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,340 :: 		move_pointer_finger(&fngr_pointer, 100);                          // Run finger back
MOVS	R1, #100
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_move_pointer_finger+0
;Input Capture Complete 5ch.c,341 :: 		}
IT	AL
BAL	L_main15
L_main16:
;Input Capture Complete 5ch.c,344 :: 		move_pointer_finger(&fngr_pointer, 0);                                // Stop the motor - wait for analogGo again
MOVS	R1, #0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_move_pointer_finger+0
;Input Capture Complete 5ch.c,345 :: 		analogGo = 0;                                                                // Set the system to be inactive
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,346 :: 		doShutdown = 0;                                                        // Disable shutdown flag since shutdown routine has been completed
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_doShutdown+0)
MOVT	R0, #hi_addr(_doShutdown+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,347 :: 		LOW_BATTERY_LED = 0;                                                        // Turn off LED to indicate system is now inactive
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,348 :: 		fngr_pointer.position_actual = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_fngr_pointer+20)
MOVT	R0, #hi_addr(_fngr_pointer+20)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,349 :: 		}
L_main14:
;Input Capture Complete 5ch.c,351 :: 		dirTrack = fngr_pointer.direction_desired;
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dirTrack+0)
MOVT	R0, #hi_addr(_dirTrack+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,353 :: 		}
IT	AL
BAL	L_main2
;Input Capture Complete 5ch.c,354 :: 		} // Main ends here
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Pcontrol_force:
;Input Capture Complete 5ch.c,363 :: 		unsigned int Pcontrol_force(struct finger *fngr, unsigned int SP, unsigned int mpv)
; mpv start address is: 8 (R2)
; SP start address is: 4 (R1)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; mpv end address is: 8 (R2)
; SP end address is: 4 (R1)
; fngr end address is: 0 (R0)
; fngr start address is: 0 (R0)
; SP start address is: 4 (R1)
; mpv start address is: 8 (R2)
;Input Capture Complete 5ch.c,367 :: 		if((SP-mpv) <= 0) {                // moved past SP
SUB	R3, R1, R2
UXTH	R3, R3
CMP	R3, #0
IT	HI
BHI	L_Pcontrol_force17
;Input Capture Complete 5ch.c,368 :: 		fngr->direction_desired = EXTEND;
ADDW	R4, R0, #26
; fngr end address is: 0 (R0)
MOVS	R3, #1
STRH	R3, [R4, #0]
;Input Capture Complete 5ch.c,370 :: 		}
IT	AL
BAL	L_Pcontrol_force18
L_Pcontrol_force17:
;Input Capture Complete 5ch.c,372 :: 		fngr->direction_desired = CONTRACT;         // Keep going
; fngr start address is: 0 (R0)
ADDW	R4, R0, #26
; fngr end address is: 0 (R0)
MOVS	R3, #0
STRH	R3, [R4, #0]
L_Pcontrol_force18:
;Input Capture Complete 5ch.c,378 :: 		duty_cycle = FORCE_K*abs(SP-mpv);    // proportional control
SUB	R3, R1, R2
; SP end address is: 4 (R1)
; mpv end address is: 8 (R2)
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
;Input Capture Complete 5ch.c,380 :: 		if(duty_cycle > 100)
CMP	R3, #100
IT	LS
BLS	L_Pcontrol_force19
;Input Capture Complete 5ch.c,381 :: 		duty_cycle = 100;       // cap duty cycle
MOVS	R0, #100
IT	AL
BAL	L_Pcontrol_force20
L_Pcontrol_force19:
;Input Capture Complete 5ch.c,382 :: 		else if(duty_cycle < 20)
CMP	R0, #20
IT	CS
BCS	L__Pcontrol_force62
;Input Capture Complete 5ch.c,383 :: 		duty_cycle = 0;       // boost duty cycle
MOVS	R0, #0
; duty_cycle end address is: 0 (R0)
IT	AL
BAL	L_Pcontrol_force21
L__Pcontrol_force62:
;Input Capture Complete 5ch.c,382 :: 		else if(duty_cycle < 20)
;Input Capture Complete 5ch.c,383 :: 		duty_cycle = 0;       // boost duty cycle
L_Pcontrol_force21:
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
L_Pcontrol_force20:
;Input Capture Complete 5ch.c,385 :: 		return duty_cycle;
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
;Input Capture Complete 5ch.c,386 :: 		}
L_end_Pcontrol_force:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pcontrol_force
_move_pointer_finger:
;Input Capture Complete 5ch.c,390 :: 		void move_pointer_finger(struct finger *fngr, unsigned int duty_cycle)
; duty_cycle start address is: 4 (R1)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; duty_cycle end address is: 4 (R1)
; duty_cycle start address is: 4 (R1)
;Input Capture Complete 5ch.c,393 :: 		PWM_TIM1_Set_Duty(duty_cycle*(PWM_PERIOD_TIM1/100), _PWM_NON_INVERTED, POINTER_PWM);       // set new duty cycle
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
;Input Capture Complete 5ch.c,396 :: 		}
L_end_move_pointer_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _move_pointer_finger
_timer2_ISR:
;Input Capture Complete 5ch.c,402 :: 		void timer2_ISR() iv IVT_INT_TIM2 {
;Input Capture Complete 5ch.c,405 :: 		if(TIM2_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR22
;Input Capture Complete 5ch.c,406 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,407 :: 		tim2_overflow_count++;                                                  // Increment timer 2 overflow counter
MOVW	R1, #lo_addr(_tim2_overflow_count+0)
MOVT	R1, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,408 :: 		}
L_timer2_ISR22:
;Input Capture Complete 5ch.c,412 :: 		if (TIM2_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR23
;Input Capture Complete 5ch.c,413 :: 		fngr_thumb.enc_start_time = fngr_thumb.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+36)
MOVT	R2, #hi_addr(_fngr_thumb+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+32)
MOVT	R0, #hi_addr(_fngr_thumb+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,414 :: 		fngr_thumb.enc_end_time = TIM2_CCR1;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,415 :: 		fngr_thumb.enc_overflow_start = fngr_thumb.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+48)
MOVT	R2, #hi_addr(_fngr_thumb+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+44)
MOVT	R0, #hi_addr(_fngr_thumb+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,416 :: 		fngr_thumb.enc_overflow_end = tim2_overflow_count;                      // Store number of timer 2 overflows for thumb
MOVW	R0, #lo_addr(_tim2_overflow_count+0)
MOVT	R0, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,417 :: 		fngr_thumb.enc_chan_b = THUMB_ENCODER_B;                               // Sample the second encoder channel (For direction)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_thumb+28)
MOVT	R0, #hi_addr(_fngr_thumb+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,418 :: 		fngr_thumb.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_thumb+16)
MOVT	R1, #hi_addr(_fngr_thumb+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,419 :: 		}
L_timer2_ISR23:
;Input Capture Complete 5ch.c,420 :: 		}
L_end_timer2_ISR:
BX	LR
; end of _timer2_ISR
_timer3_ISR:
;Input Capture Complete 5ch.c,424 :: 		void timer3_ISR() iv IVT_INT_TIM3 {
;Input Capture Complete 5ch.c,427 :: 		if(TIM3_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR24
;Input Capture Complete 5ch.c,428 :: 		TIM3_SR.UIF = 0;                                                        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,429 :: 		tim3_overflow_count++;                                                  // Increment timer 3 overflow counter
MOVW	R1, #lo_addr(_tim3_overflow_count+0)
MOVT	R1, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,430 :: 		}
L_timer3_ISR24:
;Input Capture Complete 5ch.c,433 :: 		if (TIM3_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR25
;Input Capture Complete 5ch.c,434 :: 		fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;                // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+36)
MOVT	R2, #hi_addr(_fngr_pointer+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+32)
MOVT	R0, #hi_addr(_fngr_pointer+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,435 :: 		fngr_pointer.enc_end_time = TIM3_CCR1;                                  // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR1+0)
MOVT	R0, #hi_addr(TIM3_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,436 :: 		fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;        // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+48)
MOVT	R2, #hi_addr(_fngr_pointer+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+44)
MOVT	R0, #hi_addr(_fngr_pointer+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,437 :: 		fngr_pointer.enc_overflow_end = tim3_overflow_count;                    // Store number of timer 3 overflows for Pointer finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,438 :: 		fngr_pointer.enc_chan_b = POINTER_ENCODER_B;                           // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+28)
MOVT	R0, #hi_addr(_fngr_pointer+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,439 :: 		fngr_pointer.position_temp++;                                           // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pointer+16)
MOVT	R1, #hi_addr(_fngr_pointer+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,440 :: 		}
L_timer3_ISR25:
;Input Capture Complete 5ch.c,444 :: 		if (TIM3_SR.CC2IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR26
;Input Capture Complete 5ch.c,445 :: 		fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+36)
MOVT	R2, #hi_addr(_fngr_middle+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+32)
MOVT	R0, #hi_addr(_fngr_middle+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,446 :: 		fngr_middle.enc_end_time = TIM3_CCR2;                                   // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR2+0)
MOVT	R0, #hi_addr(TIM3_CCR2+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,447 :: 		fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+48)
MOVT	R2, #hi_addr(_fngr_middle+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+44)
MOVT	R0, #hi_addr(_fngr_middle+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,448 :: 		fngr_middle.enc_overflow_end = tim3_overflow_count;                     // Store number of timer 3 overflows for Middle finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,449 :: 		fngr_middle.enc_chan_b = MIDDLE_ENCODER_B;                             // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_middle+28)
MOVT	R0, #hi_addr(_fngr_middle+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,450 :: 		fngr_middle.position_temp++;                                            // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_middle+16)
MOVT	R1, #hi_addr(_fngr_middle+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,451 :: 		}
L_timer3_ISR26:
;Input Capture Complete 5ch.c,454 :: 		if (TIM3_SR.CC3IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR27
;Input Capture Complete 5ch.c,455 :: 		fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+36)
MOVT	R2, #hi_addr(_fngr_ring+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+32)
MOVT	R0, #hi_addr(_fngr_ring+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,456 :: 		fngr_ring.enc_end_time = TIM3_CCR3;                                     // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR3+0)
MOVT	R0, #hi_addr(TIM3_CCR3+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,457 :: 		fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+48)
MOVT	R2, #hi_addr(_fngr_ring+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+44)
MOVT	R0, #hi_addr(_fngr_ring+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,458 :: 		fngr_ring.enc_overflow_end = tim3_overflow_count;                       // Store number of timer 3 overflows for Ring finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,459 :: 		fngr_ring.enc_chan_b = RING_ENCODER_B;                                 // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_ring+28)
MOVT	R0, #hi_addr(_fngr_ring+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,460 :: 		fngr_ring.position_temp++;                                              // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_ring+16)
MOVT	R1, #hi_addr(_fngr_ring+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,461 :: 		}
L_timer3_ISR27:
;Input Capture Complete 5ch.c,464 :: 		if (TIM3_SR.CC4IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR28
;Input Capture Complete 5ch.c,465 :: 		fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+36)
MOVT	R2, #hi_addr(_fngr_pinky+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+32)
MOVT	R0, #hi_addr(_fngr_pinky+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,466 :: 		fngr_pinky.enc_end_time = TIM3_CCR4;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR4+0)
MOVT	R0, #hi_addr(TIM3_CCR4+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,467 :: 		fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+48)
MOVT	R2, #hi_addr(_fngr_pinky+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+44)
MOVT	R0, #hi_addr(_fngr_pinky+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,468 :: 		fngr_pinky.enc_overflow_end = tim3_overflow_count;                      // Store number of timer 3 overflows for Pinky
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,469 :: 		fngr_pinky.enc_chan_b = PINKY_ENCODER_B;                               // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pinky+28)
MOVT	R0, #hi_addr(_fngr_pinky+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,470 :: 		fngr_pinky.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pinky+16)
MOVT	R1, #hi_addr(_fngr_pinky+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,471 :: 		}
L_timer3_ISR28:
;Input Capture Complete 5ch.c,472 :: 		}
L_end_timer3_ISR:
BX	LR
; end of _timer3_ISR
_timer11_ISR:
;Input Capture Complete 5ch.c,476 :: 		void timer11_ISR() iv IVT_INT_TIM1_TRG_COM_TIM11 {
;Input Capture Complete 5ch.c,478 :: 		TIM11_SR.UIF = 0;                                                           // Clear timer 11 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_SR+0)
MOVT	R0, #hi_addr(TIM11_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,479 :: 		poll_flag = 1;                                                              // Set poll flag for main loop
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,480 :: 		terminal_print_count++;                                                     // Increment the debug print counter
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,481 :: 		}
L_end_timer11_ISR:
BX	LR
; end of _timer11_ISR
_init_GPIO:
;Input Capture Complete 5ch.c,488 :: 		void init_GPIO() {
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
;Input Capture Complete 5ch.c,508 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                         // Pointer direction
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,509 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_10);                         // Middle direction
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,510 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_13);                         // Ring direction
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,511 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_8);                          // Pinky direction
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,512 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12);                         // Thumb direction
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,513 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);                          // Motor enable: may not use in this test
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,516 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_7 | _GPIO_PINMASK_9);
MOVW	R1, #640
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,519 :: 		GPIO_Digital_input(&GPIOD_BASE, _GPIO_PINMASK_3);                // Enable digital input on B3
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Complete 5ch.c,520 :: 		SYSCFGEN_bit = 1;                                        //Enable system config controller clock
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,521 :: 		SYSCFG_EXTICR1bits.EXTI3 = 3;                // Map external interrupt 3 to port B
MOVS	R2, #3
MOVW	R1, #lo_addr(SYSCFG_EXTICR1bits+0)
MOVT	R1, #hi_addr(SYSCFG_EXTICR1bits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #12, #4
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,522 :: 		EXTI_RTSRbits.TR3 = 1;                                // Set interrupt on rising edge
MOVW	R0, #lo_addr(EXTI_RTSRbits+0)
MOVT	R0, #hi_addr(EXTI_RTSRbits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,523 :: 		EXTI_IMRbits.MR3 = 1;                                // Unmask bit 3 to enable external interrupt on line 3
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,524 :: 		NVIC_IntEnable(IVT_INT_EXTI3);     //Enable external interrupt B3 for EMG override button
MOVW	R0, #25
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,526 :: 		}
L_end_init_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_GPIO
_init_pointer_PWM:
;Input Capture Complete 5ch.c,530 :: 		void init_pointer_PWM(unsigned int dutyCycle) {
; dutyCycle start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R5, R0
; dutyCycle end address is: 0 (R0)
; dutyCycle start address is: 20 (R5)
;Input Capture Complete 5ch.c,532 :: 		PWM_PERIOD_TIM1 = PWM_TIM1_Init(PWM_FREQ_HZ);                                   // Set PWM base frequency to 100 Hz
MOVW	R1, #lo_addr(_PWM_FREQ_HZ+0)
MOVT	R1, #hi_addr(_PWM_FREQ_HZ+0)
LDR	R1, [R1, #0]
MOV	R0, R1
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_PWM_PERIOD_TIM1+0)
MOVT	R1, #hi_addr(_PWM_PERIOD_TIM1+0)
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,533 :: 		PWM_TIM1_Set_Duty(dutyCycle*(PWM_PERIOD_TIM1/100), _PWM_NON_INVERTED, POINTER_PWM);    // Set duty on Timer 1, channel 1
MOVS	R1, #100
UDIV	R1, R0, R1
UXTH	R1, R1
MULS	R1, R5, R1
; dutyCycle end address is: 20 (R5)
MOVS	R2, #0
UXTH	R0, R1
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,534 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;Input Capture Complete 5ch.c,535 :: 		}
L_end_init_pointer_PWM:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_pointer_PWM
_init_finger:
;Input Capture Complete 5ch.c,539 :: 		void init_finger(struct finger *fngr)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R12, R0
; fngr end address is: 0 (R0)
; fngr start address is: 48 (R12)
;Input Capture Complete 5ch.c,541 :: 		fngr->position_actual = 0;
ADD	R2, R12, #20
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Complete 5ch.c,543 :: 		fngr->direction_desired = CONTRACT;
ADD	R2, R12, #26
MOVS	R1, #0
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,545 :: 		if (strcmp(fngr->name, "fngr_pointer") == 0) {
MOVW	R1, #lo_addr(?lstr12_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr12_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger29
;Input Capture Complete 5ch.c,546 :: 		POINTER_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,547 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_7);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #128
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,548 :: 		}
IT	AL
BAL	L_init_finger30
L_init_finger29:
;Input Capture Complete 5ch.c,549 :: 		else if (strcmp(fngr->name, "fngr_middle") == 0) {
; fngr start address is: 48 (R12)
MOVW	R1, #lo_addr(?lstr13_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr13_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger31
;Input Capture Complete 5ch.c,550 :: 		MIDDLE_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,551 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_9);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #512
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,552 :: 		}
IT	AL
BAL	L_init_finger32
L_init_finger31:
;Input Capture Complete 5ch.c,553 :: 		else if (strcmp(fngr->name, "fngr_ring") == 0) {
; fngr start address is: 48 (R12)
MOVW	R1, #lo_addr(?lstr14_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr14_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger33
;Input Capture Complete 5ch.c,554 :: 		RING_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,555 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_11);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #2048
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,556 :: 		}
IT	AL
BAL	L_init_finger34
L_init_finger33:
;Input Capture Complete 5ch.c,557 :: 		else if (strcmp(fngr->name, "fngr_pinky") == 0) {
; fngr start address is: 48 (R12)
MOVW	R1, #lo_addr(?lstr15_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr15_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger35
;Input Capture Complete 5ch.c,558 :: 		PINKY_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,559 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_13);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #8192
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,561 :: 		}
IT	AL
BAL	L_init_finger36
L_init_finger35:
;Input Capture Complete 5ch.c,562 :: 		else if (strcmp(fngr->name, "fngr_thumb") == 0) {
; fngr start address is: 48 (R12)
MOVW	R1, #lo_addr(?lstr16_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr16_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger37
;Input Capture Complete 5ch.c,563 :: 		THUMB_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,564 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,565 :: 		}
L_init_finger37:
L_init_finger36:
L_init_finger34:
L_init_finger32:
L_init_finger30:
;Input Capture Complete 5ch.c,566 :: 		}
L_end_init_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_finger
_init_UART:
;Input Capture Complete 5ch.c,570 :: 		void init_UART() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,572 :: 		UART1_Init(UART_BAUD_RATE);                                                 // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;Input Capture Complete 5ch.c,573 :: 		Delay_ms(200);                                                              // Wait for UART to stabilize
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_init_UART38:
SUBS	R7, R7, #1
BNE	L_init_UART38
NOP
NOP
NOP
;Input Capture Complete 5ch.c,574 :: 		UART_Write_Text("\rUART Init Complete\r\n");                                // *** DEBUG *** Print test statement to terminal
MOVW	R0, #lo_addr(?lstr17_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr17_Input_32Capture_32Complete_325ch+0)
BL	_UART_Write_Text+0
;Input Capture Complete 5ch.c,575 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_init_input_capture:
;Input Capture Complete 5ch.c,579 :: 		void init_input_capture() {
SUB	SP, SP, #24
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,583 :: 		RCC_APB1ENR.TIM3EN = 1;                                                     // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,584 :: 		TIM3_CR1.CEN = 0;                                                           // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,585 :: 		TIM3_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM3_CR2+0)
MOVT	R0, #hi_addr(TIM3_CR2+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,586 :: 		TIM3_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
STR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,587 :: 		TIM3_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
STR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,588 :: 		TIM3_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,592 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_6, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,593 :: 		TIM3_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,594 :: 		TIM3_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,595 :: 		TIM3_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,596 :: 		TIM3_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,597 :: 		TIM3_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,601 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_7, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,602 :: 		TIM3_CCMR1_Input |= 0x100;                                                  // Set capture channel 2 as input on TI2 (CC2S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,603 :: 		TIM3_CCER.CC2P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,604 :: 		TIM3_CCER.CC2NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,605 :: 		TIM3_CCER.CC2E = 1;                                                         // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,606 :: 		TIM3_DIER.CC2IE = 1;                                                        // Enable interrupt on capture channel 2
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,610 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_8, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,611 :: 		TIM3_CCMR2_Input |= 0x01;                                                   // Set capture channel 3 as input on TI3 (CC3S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,612 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,613 :: 		TIM3_CCER.CC3NP = 0;                                                         // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,614 :: 		TIM3_CCER.CC3E = 1;                                                         // Enable capture on channel 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,615 :: 		TIM3_DIER.CC3IE = 1;                                                        // Enable interrupt on capture channel 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,619 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_4, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,620 :: 		TIM3_CCMR2_Input |= 0x100;                                                  // Set capture channel 4 as input on TI4 (CC4S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,621 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,622 :: 		TIM3_CCER.CC3NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,623 :: 		TIM3_CCER.CC4E = 1;                                                         // Enable capture on channel 4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,624 :: 		TIM3_DIER.CC4IE = 1;                                                        // Enable interrupt on capture channel 4
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,628 :: 		RCC_APB1ENR.TIM2EN = 1;                                                     // Enable clock gating for timer module 5
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,629 :: 		TIM2_CR1.CEN = 0;                                                           // Disable timer/counter
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,630 :: 		TIM2_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM2_CR2+0)
MOVT	R0, #hi_addr(TIM2_CR2+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,631 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
LDR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,632 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
LDR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,633 :: 		TIM2_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,637 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_5, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM2 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #16
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,638 :: 		TIM2_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,639 :: 		TIM2_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,640 :: 		TIM2_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,641 :: 		TIM2_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,642 :: 		TIM2_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,646 :: 		TIM3_DIER.UIE = 1;                                                          // Enable overflow interrupt Timer 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,647 :: 		TIM2_DIER.UIE = 1;                                                          // Enable overflow interrupt for Timer 2
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,648 :: 		NVIC_IntEnable(IVT_INT_TIM3);                                               // Enable timer 3 ISR
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,649 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                               // Enable timer 2 ISR
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,650 :: 		TIM3_CR1.CEN = 1;                                                           // Enable timer 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,651 :: 		TIM2_CR1.CEN = 1;                                                           // Enable Timer 2
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,655 :: 		encoder_timer_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
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
;Input Capture Complete 5ch.c,656 :: 		}
L_end_init_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _init_input_capture
_init_timer11:
;Input Capture Complete 5ch.c,661 :: 		void init_timer11() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,663 :: 		RCC_APB2ENR.TIM11EN = 1;                                                    // Enable clock for timer 11
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,664 :: 		TIM11_CR1.CEN = 0;                                                          // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,665 :: 		TIM11_PSC = SAMPLE_TIM_PSC;                                                 // Set timer 11 prescaler
MOVW	R0, #lo_addr(_SAMPLE_TIM_PSC+0)
MOVT	R0, #hi_addr(_SAMPLE_TIM_PSC+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM11_PSC+0)
MOVT	R0, #hi_addr(TIM11_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,666 :: 		TIM11_ARR = SAMPLE_TIM_RELOAD;                                              // Set timer 11 overflow value
MOVW	R0, #lo_addr(_SAMPLE_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_SAMPLE_TIM_RELOAD+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM11_ARR+0)
MOVT	R0, #hi_addr(TIM11_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,667 :: 		NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);                                 // Enable timer 11 interrupt
MOVW	R0, #42
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,668 :: 		TIM11_DIER.UIE = 1;                                                         // Timer 11 update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_DIER+0)
MOVT	R0, #hi_addr(TIM11_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,669 :: 		TIM11_CR1.CEN = 1;                                                          // Enable timer/counter
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,670 :: 		}
L_end_init_timer11:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_timer11
_sample_finger:
;Input Capture Complete 5ch.c,677 :: 		void sample_finger( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R9, R0
; fngr end address is: 0 (R0)
; fngr start address is: 36 (R9)
;Input Capture Complete 5ch.c,680 :: 		fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;
ADD	R3, R9, #52
ADD	R1, R9, #48
LDR	R2, [R1, #0]
ADD	R1, R9, #44
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,683 :: 		fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);
ADD	R3, R9, #56
ADD	R1, R9, #52
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R1, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R1, #0]
SUBS	R1, R1, #3
MULS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,686 :: 		fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;
ADD	R3, R9, #40
ADD	R1, R9, #36
LDR	R2, [R1, #0]
ADD	R1, R9, #32
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,689 :: 		fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;
ADD	R3, R9, #60
ADD	R1, R9, #56
LDR	R2, [R1, #0]
ADD	R1, R9, #40
LDR	R1, [R1, #0]
ADDS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,692 :: 		fngr->input_sig_period = (long double) fngr->enc_total_ticks * encoder_timer_period_ms;
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
;Input Capture Complete 5ch.c,695 :: 		fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
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
;Input Capture Complete 5ch.c,696 :: 		if (fngr->input_sig_frequency > 20000.0)                                    // NEW: Handles startup error
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
BLE	L_sample_finger40
;Input Capture Complete 5ch.c,697 :: 		fngr->input_sig_frequency = 0;
ADD	R2, R9, #64
MOVS	R1, #0
STR	R1, [R2, #0]
L_sample_finger40:
;Input Capture Complete 5ch.c,700 :: 		if (fngr->enc_chan_b == 1) {                                                // Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_sample_finger41
;Input Capture Complete 5ch.c,701 :: 		fngr->direction_actual = CONTRACT;
ADD	R2, R9, #24
MOVS	R1, #0
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,702 :: 		fngr->position_actual += (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
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
;Input Capture Complete 5ch.c,703 :: 		}
IT	AL
BAL	L_sample_finger42
L_sample_finger41:
;Input Capture Complete 5ch.c,705 :: 		else if (fngr->enc_chan_b == 0) {                                           // Counter Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_sample_finger43
;Input Capture Complete 5ch.c,706 :: 		fngr->direction_actual = EXTEND;
ADD	R2, R9, #24
MOVS	R1, #1
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,707 :: 		fngr->position_actual -= (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
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
;Input Capture Complete 5ch.c,708 :: 		}
IT	AL
BAL	L_sample_finger44
L_sample_finger43:
;Input Capture Complete 5ch.c,711 :: 		fngr->direction_actual = 7;
ADD	R2, R9, #24
MOVS	R1, #7
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,712 :: 		}
L_sample_finger44:
L_sample_finger42:
;Input Capture Complete 5ch.c,725 :: 		fngr->position_temp = 0;
ADD	R2, R9, #16
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Complete 5ch.c,732 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0)   {
MOVW	R1, #lo_addr(?lstr18_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr18_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger45
;Input Capture Complete 5ch.c,733 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_POINTER_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #9
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,734 :: 		}
IT	AL
BAL	L_sample_finger46
L_sample_finger45:
;Input Capture Complete 5ch.c,735 :: 		else if (strcmp(fngr->name, "fngr_middle") == 0) {
; fngr start address is: 36 (R9)
MOVW	R1, #lo_addr(?lstr19_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr19_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger47
;Input Capture Complete 5ch.c,736 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_MIDDLE_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #9
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,737 :: 		}
IT	AL
BAL	L_sample_finger48
L_sample_finger47:
;Input Capture Complete 5ch.c,738 :: 		else if (strcmp(fngr->name, "fngr_ring") == 0) {
; fngr start address is: 36 (R9)
MOVW	R1, #lo_addr(?lstr20_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr20_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger49
;Input Capture Complete 5ch.c,739 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_RING_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #11
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,740 :: 		}
IT	AL
BAL	L_sample_finger50
L_sample_finger49:
;Input Capture Complete 5ch.c,741 :: 		else if (strcmp(fngr->name, "fngr_pinky") == 0) {
; fngr start address is: 36 (R9)
MOVW	R1, #lo_addr(?lstr21_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr21_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger51
;Input Capture Complete 5ch.c,742 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_PINKY_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #13
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,743 :: 		}
IT	AL
BAL	L_sample_finger52
L_sample_finger51:
;Input Capture Complete 5ch.c,744 :: 		else if (strcmp(fngr->name, "fngr_thumb") == 0) {
; fngr start address is: 36 (R9)
MOVW	R1, #lo_addr(?lstr22_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr22_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger53
;Input Capture Complete 5ch.c,745 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_THUMB_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,746 :: 		}
L_sample_finger53:
L_sample_finger52:
L_sample_finger50:
L_sample_finger48:
L_sample_finger46:
;Input Capture Complete 5ch.c,747 :: 		}
L_end_sample_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _sample_finger
_print_finger_info:
;Input Capture Complete 5ch.c,751 :: 		void print_finger_info( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #36
STR	LR, [SP, #0]
MOV	R8, R0
; fngr end address is: 0 (R0)
; fngr start address is: 32 (R8)
;Input Capture Complete 5ch.c,758 :: 		UART1_Write_Text("\n\rFinger Name: ");                                      //Print name of current finger to terminal
MOVW	R1, #lo_addr(?lstr23_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr23_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,759 :: 		UART1_Write_Text(fngr->name);
MOV	R0, R8
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,760 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr24_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr24_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,762 :: 		LongWordToStr(fngr->input_sig_frequency, frequency_text);                   // Print input capture signal frequency to terminal
ADD	R2, SP, #4
ADD	R1, R8, #64
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;Input Capture Complete 5ch.c,763 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R1, #lo_addr(?lstr25_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr25_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,764 :: 		UART1_Write_Text(frequency_text);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,765 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr26_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr26_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,768 :: 		UART1_Write_Text("Direction of movement:             ");
MOVW	R1, #lo_addr(?lstr27_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr27_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,769 :: 		if(fngr->direction_actual == EXTEND)
ADD	R1, R8, #24
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_print_finger_info54
;Input Capture Complete 5ch.c,770 :: 		UART1_Write_Text("EXTEND ");
MOVW	R1, #lo_addr(?lstr28_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr28_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
IT	AL
BAL	L_print_finger_info55
L_print_finger_info54:
;Input Capture Complete 5ch.c,772 :: 		UART1_Write_Text("CONTRACT ");
MOVW	R1, #lo_addr(?lstr29_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr29_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
L_print_finger_info55:
;Input Capture Complete 5ch.c,774 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr30_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr30_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,777 :: 		UART1_Write_Text("Direction desired:             ");
MOVW	R1, #lo_addr(?lstr31_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr31_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,778 :: 		if(fngr->direction_desired == EXTEND)
ADD	R1, R8, #26
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_print_finger_info56
;Input Capture Complete 5ch.c,779 :: 		UART1_Write_Text("EXTEND ");
MOVW	R1, #lo_addr(?lstr32_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr32_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
IT	AL
BAL	L_print_finger_info57
L_print_finger_info56:
;Input Capture Complete 5ch.c,781 :: 		UART1_Write_Text("CONTRACT ");
MOVW	R1, #lo_addr(?lstr33_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr33_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
L_print_finger_info57:
;Input Capture Complete 5ch.c,783 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr34_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr34_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,786 :: 		LongToStr(fngr->position_actual, position_text);                            // Print total number of input events (position) to terminal
ADD	R2, SP, #19
ADD	R1, R8, #20
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongToStr+0
;Input Capture Complete 5ch.c,787 :: 		UART1_Write_Text("Position of finger:                ");
MOVW	R1, #lo_addr(?lstr35_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr35_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,788 :: 		UART1_Write_Text(position_text);
ADD	R1, SP, #19
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,789 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr36_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr36_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,791 :: 		IntToStr(fngr->tip_force, toStr);                            // Print Flexiforce value (16-bit unsigned) to terminal
ADD	R1, R8, #76
; fngr end address is: 32 (R8)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOVW	R1, #lo_addr(_toStr+0)
MOVT	R1, #hi_addr(_toStr+0)
BL	_IntToStr+0
;Input Capture Complete 5ch.c,792 :: 		UART1_Write_Text("Force applied to tip of finger:                ");
MOVW	R1, #lo_addr(?lstr37_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr37_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,793 :: 		UART1_Write_Text(toStr);
MOVW	R0, #lo_addr(_toStr+0)
MOVT	R0, #hi_addr(_toStr+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,794 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr38_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr38_Input_32Capture_32Complete_325ch+0)
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
_InitTimer10:
;Input Capture Complete 5ch.c,803 :: 		void InitTimer10(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,804 :: 		RCC_APB2ENR.TIM10EN = 1;                       // Enable clock gating for timer 10
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,805 :: 		TIM10_CR1.CEN = 0;                              // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM10_CR1+0)
MOVT	R0, #hi_addr(TIM10_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,806 :: 		TIM10_PSC = 7874;                 // Set timer 10 prescaler
MOVW	R1, #7874
MOVW	R0, #lo_addr(TIM10_PSC+0)
MOVT	R0, #hi_addr(TIM10_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,807 :: 		TIM10_ARR = 63999;              // Set timer 10 overflow value
MOVW	R1, #63999
MOVW	R0, #lo_addr(TIM10_ARR+0)
MOVT	R0, #hi_addr(TIM10_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,808 :: 		NVIC_IntEnable(IVT_INT_TIM1_UP_TIM10); // Enable timer 10 interrupt
MOVW	R0, #41
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,809 :: 		TIM10_CR1.CEN = 1;                              // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM10_CR1+0)
MOVT	R0, #hi_addr(TIM10_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,810 :: 		}
L_end_InitTimer10:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer10
_Timer10_interrupt:
;Input Capture Complete 5ch.c,818 :: 		void Timer10_interrupt() iv IVT_INT_TIM1_UP_TIM10 { // Interrupt handler if 3 s have past
;Input Capture Complete 5ch.c,820 :: 		EXTI_IMRbits.MR3 = 0;                        // mask bit 3 to disable external interrupt on line 3
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,821 :: 		EXTI_PR.B3 = 1;                                    // Clear Interrupt Flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,822 :: 		TIM10_DIER.UIE = 0;                           // Disable timer 10 interrupt
MOVW	R0, #lo_addr(TIM10_DIER+0)
MOVT	R0, #hi_addr(TIM10_DIER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,823 :: 		TIM10_SR.UIF = 0;                             // Clear timer 10 interrupt flag
MOVW	R0, #lo_addr(TIM10_SR+0)
MOVT	R0, #hi_addr(TIM10_SR+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,824 :: 		EXTI_RTSRbits.TR3 = 1;                      // Enable rising edge trigger
MOVW	R0, #lo_addr(EXTI_RTSRbits+0)
MOVT	R0, #hi_addr(EXTI_RTSRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,825 :: 		EXTI_FTSRbits.TR3 = 0;                      // Disable falling edge trigger
MOVW	R0, #lo_addr(EXTI_FTSRbits+0)
MOVT	R0, #hi_addr(EXTI_FTSRbits+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,826 :: 		EXTI_IMRbits.MR3 = 1;                        // Unmask bit 3 to enable external interrupt on line 3
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,827 :: 		EMG_ACTIVE_LED = 0;                         // Clear EMG Override button indicator
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,828 :: 		emg_override_status = 0;                        // Put the EMG override handler back into dormant state
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_emg_override_status+0)
MOVT	R0, #hi_addr(_emg_override_status+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,831 :: 		if (!analogGo) {                                // If system is current inactive
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Timer10_interrupt58
;Input Capture Complete 5ch.c,832 :: 		doShutdown = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_doShutdown+0)
MOVT	R0, #hi_addr(_doShutdown+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,833 :: 		analogGo = 1;                        // Flag to indicate the system should run
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,834 :: 		LOW_BATTERY_LED = 1;                            // Turn on the system state LED to indicate system is now running
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,835 :: 		}
IT	AL
BAL	L_Timer10_interrupt59
L_Timer10_interrupt58:
;Input Capture Complete 5ch.c,838 :: 		doShutdown = 1;                                // Send the shutdown command.
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_doShutdown+0)
MOVT	R0, #hi_addr(_doShutdown+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,839 :: 		analogGo = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,841 :: 		}
L_Timer10_interrupt59:
;Input Capture Complete 5ch.c,842 :: 		}
L_end_Timer10_interrupt:
BX	LR
; end of _Timer10_interrupt
_emg_override_ISR:
;Input Capture Complete 5ch.c,848 :: 		void emg_override_ISR() iv IVT_INT_EXTI3 {
;Input Capture Complete 5ch.c,850 :: 		EXTI_IMRbits.MR3 = 0;                            // mask bit 3 to Disable external interrupt on line 3
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,851 :: 		EXTI_PR.B3 = 1;                               // Clear Interrupt Flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,852 :: 		if(emg_override_status == 0) {                // Current system state is dormant
MOVW	R0, #lo_addr(_emg_override_status+0)
MOVT	R0, #hi_addr(_emg_override_status+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_emg_override_ISR60
;Input Capture Complete 5ch.c,853 :: 		TIM10_SR.UIF = 0;                       // Clear timer 5 interrupt bit
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM10_SR+0)
MOVT	R0, #hi_addr(TIM10_SR+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,854 :: 		TIM10_CNT = 0x00;                       // Reset timer value to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM10_CNT+0)
MOVT	R0, #hi_addr(TIM10_CNT+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,855 :: 		emg_override_status = 1;                // Turn on system so it waits for analogGo from Timer 10 interrupt
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_emg_override_status+0)
MOVT	R0, #hi_addr(_emg_override_status+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,856 :: 		EXTI_RTSRbits.TR3 = 0;                  // Disable rising edge trigger
MOVW	R0, #lo_addr(EXTI_RTSRbits+0)
MOVT	R0, #hi_addr(EXTI_RTSRbits+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,857 :: 		EXTI_FTSRbits.TR3 = 1;                  // Enable falling edge trigger
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_FTSRbits+0)
MOVT	R0, #hi_addr(EXTI_FTSRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,858 :: 		TIM10_DIER.UIE = 1;                     // CC1 Update Interrupt Enable
MOVW	R0, #lo_addr(TIM10_DIER+0)
MOVT	R0, #hi_addr(TIM10_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,859 :: 		EMG_ACTIVE_LED = 1;                     // Notify button is held
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,861 :: 		}
IT	AL
BAL	L_emg_override_ISR61
L_emg_override_ISR60:
;Input Capture Complete 5ch.c,863 :: 		TIM10_DIER.UIE = 0;                     // Disable timer interrupt
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM10_DIER+0)
MOVT	R0, #hi_addr(TIM10_DIER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,864 :: 		emg_override_status = 0;                // Turn off system
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_emg_override_status+0)
MOVT	R0, #hi_addr(_emg_override_status+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,865 :: 		EXTI_RTSRbits.TR3 = 1;                  // Enable rising edge trigger
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_RTSRbits+0)
MOVT	R0, #hi_addr(EXTI_RTSRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,866 :: 		EXTI_FTSRbits.TR3 = 0;                  // Disable falling edge trigger
MOVW	R0, #lo_addr(EXTI_FTSRbits+0)
MOVT	R0, #hi_addr(EXTI_FTSRbits+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,867 :: 		EMG_ACTIVE_LED = 0;                     // Notify button released
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,868 :: 		analogGo = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,869 :: 		doShutdown = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_doShutdown+0)
MOVT	R0, #hi_addr(_doShutdown+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,870 :: 		}
L_emg_override_ISR61:
;Input Capture Complete 5ch.c,871 :: 		EXTI_IMRbits.MR3 = 1;                            // Unmask bit 3 to enable external interrupt on line 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,872 :: 		}
L_end_emg_override_ISR:
BX	LR
; end of _emg_override_ISR
