_main:
;main.c,26 :: 		void main() {
;main.c,27 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_4);  // Enable digital input on PORTA bits
MOVS	R1, #17
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;main.c,28 :: 		UART1_init(115200);    // initialize UART
MOV	R0, #115200
BL	_UART1_Init+0
;main.c,29 :: 		Delay_ms(200);
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
;main.c,30 :: 		UART1_Write_Text("Begin. \n");
MOVW	R0, #lo_addr(?lstr1_main+0)
MOVT	R0, #hi_addr(?lstr1_main+0)
BL	_UART1_Write_Text+0
;main.c,32 :: 		FNGR_PNTR.a = FNGR_POINTER_ENC_A;      // assign the struct members
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_FNGR_PNTR+0)
MOVT	R0, #hi_addr(_FNGR_PNTR+0)
STRH	R1, [R0, #0]
;main.c,33 :: 		FNGR_PNTR.b = FNGR_POINTER_ENC_B;
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_FNGR_PNTR+2)
MOVT	R0, #hi_addr(_FNGR_PNTR+2)
STRH	R1, [R0, #0]
;main.c,35 :: 		outa = FNGR_POINTER_ENC_A;          // also assign the defined pin names to the bit variables
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_outa+0)
MOVT	R0, #hi_addr(_outa+0)
STR	R1, [R0, #0]
;main.c,36 :: 		outb = FNGR_POINTER_ENC_B;
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_outb+0)
MOVT	R0, #hi_addr(_outb+0)
STR	R1, [R0, #0]
;main.c,38 :: 		while(1)
L_main2:
;main.c,41 :: 		if(FNGR_PNTR.a) //|| outa || GPIOA_IDR.B0)
MOVW	R0, #lo_addr(_FNGR_PNTR+0)
MOVT	R0, #hi_addr(_FNGR_PNTR+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;main.c,43 :: 		UART1_Write_Text("FNGR_PNTR: encoder A = 1 \n");   // didn't want to bother with print conversions
MOVW	R0, #lo_addr(?lstr2_main+0)
MOVT	R0, #hi_addr(?lstr2_main+0)
BL	_UART1_Write_Text+0
;main.c,44 :: 		Delay_ms(200);   // debounce
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_main5:
SUBS	R7, R7, #1
BNE	L_main5
NOP
NOP
NOP
;main.c,45 :: 		}
L_main4:
;main.c,46 :: 		if(FNGR_PNTR.b)// || outb)
MOVW	R0, #lo_addr(_FNGR_PNTR+2)
MOVT	R0, #hi_addr(_FNGR_PNTR+2)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main7
;main.c,48 :: 		UART1_Write_Text("FNGR_PNTR: encoder B = 1 \n");
MOVW	R0, #lo_addr(?lstr3_main+0)
MOVT	R0, #hi_addr(?lstr3_main+0)
BL	_UART1_Write_Text+0
;main.c,49 :: 		Delay_ms(200);
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
;main.c,50 :: 		}
L_main7:
;main.c,51 :: 		}
IT	AL
BAL	L_main2
;main.c,52 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
