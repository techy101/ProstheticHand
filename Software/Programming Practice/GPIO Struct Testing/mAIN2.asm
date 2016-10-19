_main:
;mAIN2.c,23 :: 		void main() {
;mAIN2.c,24 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_ALL);  // Enable digital input on all PORTA bits
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;mAIN2.c,26 :: 		UART1_init(115200);    // initialize UART
MOV	R0, #115200
BL	_UART1_Init+0
;mAIN2.c,27 :: 		Delay_ms(200);
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
;mAIN2.c,28 :: 		UART1_Write(0x10);
MOVS	R0, #16
BL	_UART1_Write+0
;mAIN2.c,29 :: 		UART1_Write(0x13);
MOVS	R0, #19
BL	_UART1_Write+0
;mAIN2.c,30 :: 		UART1_Write_Text("Begin. \n");
MOVW	R0, #lo_addr(?lstr1_mAIN2+0)
MOVT	R0, #hi_addr(?lstr1_mAIN2+0)
BL	_UART1_Write_Text+0
;mAIN2.c,32 :: 		Finger.regLocation = GPIOA_IDR_LOC;
MOVW	R2, #lo_addr(_GPIOA_IDR_LOC+0)
MOVT	R2, #hi_addr(_GPIOA_IDR_LOC+0)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_Finger+0)
MOVT	R0, #hi_addr(_Finger+0)
STR	R1, [R0, #0]
;mAIN2.c,33 :: 		Finger.encoder_chan_a = GPIOA_IDR_LOC;
MOV	R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Finger+16)
MOVT	R0, #hi_addr(_Finger+16)
STR	R1, [R0, #0]
;mAIN2.c,34 :: 		Finger.encoder_chan_b = GPIOA_IDR_LOC;
MOV	R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Finger+20)
MOVT	R0, #hi_addr(_Finger+20)
STR	R1, [R0, #0]
;mAIN2.c,36 :: 		while(1) {
L_main2:
;mAIN2.c,37 :: 		readEncoderDirection(&Finger);
MOVW	R0, #lo_addr(_Finger+0)
MOVT	R0, #hi_addr(_Finger+0)
BL	_readEncoderDirection+0
;mAIN2.c,46 :: 		}
IT	AL
BAL	L_main2
;mAIN2.c,47 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_readEncoderDirection:
;mAIN2.c,51 :: 		void readEncoderDirection(struct fngr_t * Finger)
; Finger start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R7, R0
; Finger end address is: 0 (R0)
; Finger start address is: 28 (R7)
;mAIN2.c,53 :: 		if(Finger->encoder_chan_a->addr0 & 0x1) {    // hmmmm
ADDW	R1, R7, #16
LDR	R1, [R1, #0]
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_readEncoderDirection4
;mAIN2.c,55 :: 		UART1_Write_Text("Encoder input from A0 received \n");
MOVW	R1, #lo_addr(?lstr2_mAIN2+0)
MOVT	R1, #hi_addr(?lstr2_mAIN2+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;mAIN2.c,56 :: 		Delay_ms(150);
STR	R7, [SP, #4]
MOVW	R7, #11390
MOVT	R7, #128
NOP
NOP
L_readEncoderDirection5:
SUBS	R7, R7, #1
BNE	L_readEncoderDirection5
NOP
NOP
NOP
LDR	R7, [SP, #4]
;mAIN2.c,57 :: 		}
L_readEncoderDirection4:
;mAIN2.c,59 :: 		if(Finger->encoder_chan_b->addr0 & 0x20) {
ADDW	R1, R7, #20
; Finger end address is: 28 (R7)
LDR	R1, [R1, #0]
LDR	R1, [R1, #0]
AND	R1, R1, #32
CMP	R1, #0
IT	EQ
BEQ	L_readEncoderDirection7
;mAIN2.c,60 :: 		UART1_Write_Text("Encoder input from A5 received \n");
MOVW	R1, #lo_addr(?lstr3_mAIN2+0)
MOVT	R1, #hi_addr(?lstr3_mAIN2+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;mAIN2.c,61 :: 		Delay_ms(150);
MOVW	R7, #11390
MOVT	R7, #128
NOP
NOP
L_readEncoderDirection8:
SUBS	R7, R7, #1
BNE	L_readEncoderDirection8
NOP
NOP
NOP
;mAIN2.c,62 :: 		}
L_readEncoderDirection7:
;mAIN2.c,63 :: 		}
L_end_readEncoderDirection:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _readEncoderDirection
