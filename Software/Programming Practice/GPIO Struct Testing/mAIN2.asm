_main:
;mAIN2.c,14 :: 		void main() {
;mAIN2.c,15 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_4);  // Enable digital input on PORTA bits
MOVS	R1, #17
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;mAIN2.c,17 :: 		UART1_init(115200);    // initialize UART
MOV	R0, #115200
BL	_UART1_Init+0
;mAIN2.c,18 :: 		Delay_ms(200);
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;mAIN2.c,19 :: 		UART1_Write_Text("Begin. \n");
MOVW	R0, #lo_addr(?lstr1_mAIN2+0)
MOVT	R0, #hi_addr(?lstr1_mAIN2+0)
BL	_UART1_Write_Text+0
;mAIN2.c,21 :: 		Finger.descriptive = GPIOA_IDR_LOC;
MOVW	R0, #lo_addr(_GPIOA_IDR_LOC+0)
MOVT	R0, #hi_addr(_GPIOA_IDR_LOC+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Finger+0)
MOVT	R0, #hi_addr(_Finger+0)
STR	R1, [R0, #0]
;mAIN2.c,23 :: 		while(1) {
L_main2:
;mAIN2.c,24 :: 		if(Finger.descriptive->addr0 & 0x1) {
MOVW	R0, #lo_addr(_Finger+0)
MOVT	R0, #hi_addr(_Finger+0)
LDR	R0, [R0, #0]
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	EQ
BEQ	L_main4
;mAIN2.c,25 :: 		UART1_Write_Text("Button A0 pressed \n");
MOVW	R0, #lo_addr(?lstr2_mAIN2+0)
MOVT	R0, #hi_addr(?lstr2_mAIN2+0)
BL	_UART1_Write_Text+0
;mAIN2.c,26 :: 		Delay_ms(100);
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_main5:
SUBS	R7, R7, #1
BNE	L_main5
NOP
NOP
NOP
;mAIN2.c,27 :: 		}
L_main4:
;mAIN2.c,28 :: 		if(Finger.descriptive->addr0 & 0x10) {
MOVW	R0, #lo_addr(_Finger+0)
MOVT	R0, #hi_addr(_Finger+0)
LDR	R0, [R0, #0]
LDR	R0, [R0, #0]
AND	R0, R0, #16
CMP	R0, #0
IT	EQ
BEQ	L_main7
;mAIN2.c,29 :: 		UART1_Write_Text("Button A4 pressed \n");
MOVW	R0, #lo_addr(?lstr3_mAIN2+0)
MOVT	R0, #hi_addr(?lstr3_mAIN2+0)
BL	_UART1_Write_Text+0
;mAIN2.c,30 :: 		Delay_ms(100);
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
;mAIN2.c,31 :: 		}
L_main7:
;mAIN2.c,32 :: 		}
IT	AL
BAL	L_main2
;mAIN2.c,33 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
