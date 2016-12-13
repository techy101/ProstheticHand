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
;main.c,110 :: 		set_finger_name(&fngr_pointer);           // NEW by RM
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_set_finger_name+0
;main.c,201 :: 		} // Main ends here
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
