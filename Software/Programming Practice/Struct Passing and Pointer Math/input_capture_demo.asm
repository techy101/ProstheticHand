_init_serial_comm:
;input_capture_demo.c,18 :: 		void init_serial_comm() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;input_capture_demo.c,20 :: 		UART1_Init(UART_BAUD_RATE);                                                // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;input_capture_demo.c,21 :: 		Delay_ms(200);                                                             // Wait for UART to stabilize
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_init_serial_comm0:
SUBS	R7, R7, #1
BNE	L_init_serial_comm0
NOP
NOP
NOP
;input_capture_demo.c,22 :: 		}
L_end_init_serial_comm:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_serial_comm
_do_math:
;input_capture_demo.c,41 :: 		void do_math(struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R6, R0
; fngr end address is: 0 (R0)
; fngr start address is: 24 (R6)
;input_capture_demo.c,44 :: 		if (strcmp(fngr->instance_name, "Finger 1") == 0) {
MOVW	R1, #lo_addr(?lstr1_input_capture_demo+0)
MOVT	R1, #hi_addr(?lstr1_input_capture_demo+0)
MOV	R0, R6
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_do_math2
;input_capture_demo.c,45 :: 		strcpy(fngr->instance_name, "Finger 1 Altered");
MOVW	R1, #lo_addr(?lstr2_input_capture_demo+0)
MOVT	R1, #hi_addr(?lstr2_input_capture_demo+0)
MOV	R0, R6
BL	_strcpy+0
;input_capture_demo.c,46 :: 		}
L_do_math2:
;input_capture_demo.c,48 :: 		if (strcmp(fngr->instance_name, "Finger 2") == 0) {
MOVW	R1, #lo_addr(?lstr3_input_capture_demo+0)
MOVT	R1, #hi_addr(?lstr3_input_capture_demo+0)
MOV	R0, R6
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_do_math3
;input_capture_demo.c,49 :: 		strcpy(fngr->instance_name, "Finger 2 Altered");
MOVW	R1, #lo_addr(?lstr4_input_capture_demo+0)
MOVT	R1, #hi_addr(?lstr4_input_capture_demo+0)
MOV	R0, R6
BL	_strcpy+0
;input_capture_demo.c,50 :: 		}
L_do_math3:
;input_capture_demo.c,53 :: 		fngr->a += fngr->a;             //Add a to a
ADDW	R2, R6, #50
LDRH	R1, [R2, #0]
ADDS	R1, R1, R1
STRH	R1, [R2, #0]
;input_capture_demo.c,54 :: 		fngr->b = fngr->a + fngr->b;    //Add a to b
ADDW	R3, R6, #52
ADDW	R1, R6, #50
LDRH	R2, [R1, #0]
LDRH	R1, [R3, #0]
ADDS	R1, R2, R1
STRH	R1, [R3, #0]
;input_capture_demo.c,55 :: 		fngr->c = 25;                   //Change c to 25
ADDW	R2, R6, #54
; fngr end address is: 24 (R6)
MOVS	R1, #25
STRH	R1, [R2, #0]
;input_capture_demo.c,56 :: 		}
L_end_do_math:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _do_math
_print_values:
;input_capture_demo.c,61 :: 		void print_values(struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R8, R0
; fngr end address is: 0 (R0)
; fngr start address is: 32 (R8)
;input_capture_demo.c,64 :: 		UART1_Write_Text("Name = ");
MOVW	R1, #lo_addr(?lstr5_input_capture_demo+0)
MOVT	R1, #hi_addr(?lstr5_input_capture_demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;input_capture_demo.c,65 :: 		UART1_Write_Text(fngr->instance_name);
MOV	R0, R8
BL	_UART1_Write_Text+0
;input_capture_demo.c,66 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr6_input_capture_demo+0)
MOVT	R1, #hi_addr(?lstr6_input_capture_demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;input_capture_demo.c,69 :: 		IntToStr(fngr->a, aInText);
ADD	R1, R8, #50
LDRH	R1, [R1, #0]
SXTH	R1, R1
SXTH	R0, R1
MOVW	R1, #lo_addr(_aInText+0)
MOVT	R1, #hi_addr(_aInText+0)
BL	_IntToStr+0
;input_capture_demo.c,70 :: 		UART1_Write_Text("a = ");
MOVW	R1, #lo_addr(?lstr7_input_capture_demo+0)
MOVT	R1, #hi_addr(?lstr7_input_capture_demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;input_capture_demo.c,71 :: 		UART1_Write_Text(aInText);
MOVW	R0, #lo_addr(_aInText+0)
MOVT	R0, #hi_addr(_aInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,72 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr8_input_capture_demo+0)
MOVT	R1, #hi_addr(?lstr8_input_capture_demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;input_capture_demo.c,75 :: 		IntToStr(fngr->b, bInText);
ADD	R1, R8, #52
LDRH	R1, [R1, #0]
SXTH	R1, R1
SXTH	R0, R1
MOVW	R1, #lo_addr(_bInText+0)
MOVT	R1, #hi_addr(_bInText+0)
BL	_IntToStr+0
;input_capture_demo.c,76 :: 		UART1_Write_Text("b = ");
MOVW	R1, #lo_addr(?lstr9_input_capture_demo+0)
MOVT	R1, #hi_addr(?lstr9_input_capture_demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;input_capture_demo.c,77 :: 		UART1_Write_Text(bInText);
MOVW	R0, #lo_addr(_bInText+0)
MOVT	R0, #hi_addr(_bInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,78 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr10_input_capture_demo+0)
MOVT	R1, #hi_addr(?lstr10_input_capture_demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;input_capture_demo.c,81 :: 		IntToStr(fngr->c, cInText);
ADD	R1, R8, #54
; fngr end address is: 32 (R8)
LDRH	R1, [R1, #0]
SXTH	R1, R1
SXTH	R0, R1
MOVW	R1, #lo_addr(_cInText+0)
MOVT	R1, #hi_addr(_cInText+0)
BL	_IntToStr+0
;input_capture_demo.c,82 :: 		UART1_Write_Text("c = ");
MOVW	R1, #lo_addr(?lstr11_input_capture_demo+0)
MOVT	R1, #hi_addr(?lstr11_input_capture_demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;input_capture_demo.c,83 :: 		UART1_Write_Text(cInText);
MOVW	R0, #lo_addr(_cInText+0)
MOVT	R0, #hi_addr(_cInText+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,84 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr12_input_capture_demo+0)
MOVT	R1, #hi_addr(?lstr12_input_capture_demo+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;input_capture_demo.c,85 :: 		}
L_end_print_values:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _print_values
_main:
;input_capture_demo.c,89 :: 		void main() {
;input_capture_demo.c,92 :: 		init_serial_comm();                                                        // Initialize UART1 (Wired)
BL	_init_serial_comm+0
;input_capture_demo.c,95 :: 		strncpy(testOutput, "\rProgram Has Started\n\n\r", STR_MAX);
MOVW	R0, #lo_addr(?lstr13_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr13_input_capture_demo+0)
MOVS	R2, #50
SXTH	R2, R2
MOV	R1, R0
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
BL	_strncpy+0
;input_capture_demo.c,96 :: 		UART1_Write_Text(testOutput);
MOVW	R0, #lo_addr(_testOutput+0)
MOVT	R0, #hi_addr(_testOutput+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,100 :: 		strcpy(testFinger1.instance_name, "Finger 1");
MOVW	R0, #lo_addr(?lstr14_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr14_input_capture_demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_testFinger1+0)
MOVT	R0, #hi_addr(_testFinger1+0)
BL	_strcpy+0
;input_capture_demo.c,101 :: 		testFinger1.a = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_testFinger1+50)
MOVT	R0, #hi_addr(_testFinger1+50)
STRH	R1, [R0, #0]
;input_capture_demo.c,102 :: 		testFinger1.b = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_testFinger1+52)
MOVT	R0, #hi_addr(_testFinger1+52)
STRH	R1, [R0, #0]
;input_capture_demo.c,103 :: 		testFinger1.c = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_testFinger1+54)
MOVT	R0, #hi_addr(_testFinger1+54)
STRH	R1, [R0, #0]
;input_capture_demo.c,106 :: 		strcpy(testFinger2.instance_name, "Finger 2");
MOVW	R0, #lo_addr(?lstr15_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr15_input_capture_demo+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_testFinger2+0)
MOVT	R0, #hi_addr(_testFinger2+0)
BL	_strcpy+0
;input_capture_demo.c,107 :: 		testFinger2.a = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_testFinger2+50)
MOVT	R0, #hi_addr(_testFinger2+50)
STRH	R1, [R0, #0]
;input_capture_demo.c,108 :: 		testFinger2.b = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_testFinger2+52)
MOVT	R0, #hi_addr(_testFinger2+52)
STRH	R1, [R0, #0]
;input_capture_demo.c,109 :: 		testFinger2.c = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_testFinger2+54)
MOVT	R0, #hi_addr(_testFinger2+54)
STRH	R1, [R0, #0]
;input_capture_demo.c,113 :: 		UART1_Write_Text("Finger 1 original values: \n\r");
MOVW	R0, #lo_addr(?lstr16_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr16_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,114 :: 		print_values(&testFinger1);
MOVW	R0, #lo_addr(_testFinger1+0)
MOVT	R0, #hi_addr(_testFinger1+0)
BL	_print_values+0
;input_capture_demo.c,115 :: 		UART1_Write_Text("Finger 2 original Values: \n\r");
MOVW	R0, #lo_addr(?lstr17_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr17_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,116 :: 		print_values(&testFinger2);
MOVW	R0, #lo_addr(_testFinger2+0)
MOVT	R0, #hi_addr(_testFinger2+0)
BL	_print_values+0
;input_capture_demo.c,119 :: 		do_math(&testFinger1);
MOVW	R0, #lo_addr(_testFinger1+0)
MOVT	R0, #hi_addr(_testFinger1+0)
BL	_do_math+0
;input_capture_demo.c,120 :: 		do_math(&testFInger2);
MOVW	R0, #lo_addr(_testFinger2+0)
MOVT	R0, #hi_addr(_testFinger2+0)
BL	_do_math+0
;input_capture_demo.c,123 :: 		UART1_Write_Text("Finger 1 changed values: \n\r");
MOVW	R0, #lo_addr(?lstr18_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr18_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,124 :: 		print_values(&testFinger1);
MOVW	R0, #lo_addr(_testFinger1+0)
MOVT	R0, #hi_addr(_testFinger1+0)
BL	_print_values+0
;input_capture_demo.c,125 :: 		UART1_Write_Text("Finger 2 changed Values: \n\r");
MOVW	R0, #lo_addr(?lstr19_input_capture_demo+0)
MOVT	R0, #hi_addr(?lstr19_input_capture_demo+0)
BL	_UART1_Write_Text+0
;input_capture_demo.c,126 :: 		print_values(&testFinger2);
MOVW	R0, #lo_addr(_testFinger2+0)
MOVT	R0, #hi_addr(_testFinger2+0)
BL	_print_values+0
;input_capture_demo.c,127 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
