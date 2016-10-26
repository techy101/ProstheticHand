_main:
;main.c,18 :: 		void main()
;main.c,20 :: 		MPV = startP;              // will go away in hardware
MOVW	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
STRH	R1, [R0, #0]
;main.c,21 :: 		disturbance = 150;         // will go away in hardware
MOVS	R1, #150
SXTH	R1, R1
MOVW	R0, #lo_addr(_disturbance+0)
MOVT	R0, #hi_addr(_disturbance+0)
STRH	R1, [R0, #0]
;main.c,23 :: 		srand(50);
MOVS	R0, #50
BL	_srand+0
;main.c,25 :: 		UART1_Init(115200);        // set up UART1
MOV	R0, #115200
BL	_UART1_Init+0
;main.c,26 :: 		delay_ms(100);
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;main.c,27 :: 		UART_Write_Text("\r\nStarted. ");
MOVW	R0, #lo_addr(?lstr1_main+0)
MOVT	R0, #hi_addr(?lstr1_main+0)
BL	_UART_Write_Text+0
;main.c,30 :: 		UART1_Write_Text("\nNotes:");
MOVW	R0, #lo_addr(?lstr2_main+0)
MOVT	R0, #hi_addr(?lstr2_main+0)
BL	_UART1_Write_Text+0
;main.c,31 :: 		UART1_Write_Text("\n- K = ");
MOVW	R0, #lo_addr(?lstr3_main+0)
MOVT	R0, #hi_addr(?lstr3_main+0)
BL	_UART1_Write_Text+0
;main.c,32 :: 		IntToStr(K, ToStr);
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
MOVW	R0, #150
SXTH	R0, R0
BL	_IntToStr+0
;main.c,33 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,34 :: 		UART1_Write_Text("\n- SP = ");
MOVW	R0, #lo_addr(?lstr4_main+0)
MOVT	R0, #hi_addr(?lstr4_main+0)
BL	_UART1_Write_Text+0
;main.c,35 :: 		FloatToStr(setP, ToStr);
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_FloatToStr+0
;main.c,36 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,37 :: 		UART1_Write_Text("\n- Margin = ");
MOVW	R0, #lo_addr(?lstr5_main+0)
MOVT	R0, #hi_addr(?lstr5_main+0)
BL	_UART1_Write_Text+0
;main.c,38 :: 		FloatToStr(margin, ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
VMOV.F32	S0, #10
BL	_FloatToStr+0
;main.c,39 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,40 :: 		UART1_Write_Text("\n- disturbance = rand%990 \n");
MOVW	R0, #lo_addr(?lstr6_main+0)
MOVT	R0, #hi_addr(?lstr6_main+0)
BL	_UART1_Write_Text+0
;main.c,42 :: 		while(1)
L_main2:
;main.c,46 :: 		UART1_Write_Text("\nCurrent position = ");
MOVW	R0, #lo_addr(?lstr7_main+0)
MOVT	R0, #hi_addr(?lstr7_main+0)
BL	_UART1_Write_Text+0
;main.c,47 :: 		IntToStr(MPV, ToStr);
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,48 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,50 :: 		dutyCycle = Pcontrol(setP, MPV);
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRSH	R0, [R0, #0]
SXTH	R1, R0
MOVW	R0, #100
SXTH	R0, R0
BL	_Pcontrol+0
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
STRH	R0, [R1, #0]
;main.c,52 :: 		UART1_Write_Text("\nPID control returns ");
MOVW	R0, #lo_addr(?lstr8_main+0)
MOVT	R0, #hi_addr(?lstr8_main+0)
BL	_UART1_Write_Text+0
;main.c,53 :: 		IntToStr(dutyCycle, toStr);
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,54 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,56 :: 		UART1_Write_Text("\nDirection = ");
MOVW	R0, #lo_addr(?lstr9_main+0)
MOVT	R0, #hi_addr(?lstr9_main+0)
BL	_UART1_Write_Text+0
;main.c,57 :: 		IntToStr(direction, ToStr);
MOVW	R0, #lo_addr(_direction+0)
MOVT	R0, #hi_addr(_direction+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,58 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,60 :: 		UART1_Write_Text("Moving finger...");
MOVW	R0, #lo_addr(?lstr10_main+0)
MOVT	R0, #hi_addr(?lstr10_main+0)
BL	_UART1_Write_Text+0
;main.c,62 :: 		moveFinger(dutyCycle, direction, disturbance);
MOVW	R0, #lo_addr(_disturbance+0)
MOVT	R0, #hi_addr(_disturbance+0)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_direction+0)
MOVT	R0, #hi_addr(_direction+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyCycle+0)
MOVT	R0, #hi_addr(_dutyCycle+0)
LDRSH	R0, [R0, #0]
BL	_moveFinger+0
;main.c,64 :: 		if(abs(MPV - setP) < margin) {
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRSH	R0, [R0, #0]
SUBS	R0, #100
BL	_abs+0
CMP	R0, #10
IT	GE
BGE	L_main4
;main.c,65 :: 		UART_Write_Text("\n** PV stabilized. ");
MOVW	R0, #lo_addr(?lstr11_main+0)
MOVT	R0, #hi_addr(?lstr11_main+0)
BL	_UART_Write_Text+0
;main.c,68 :: 		disturbance = rand()%990;
BL	_rand+0
MOVW	R2, #990
SXTH	R2, R2
SDIV	R1, R0, R2
MLS	R1, R2, R1, R0
MOVW	R0, #lo_addr(_disturbance+0)
MOVT	R0, #hi_addr(_disturbance+0)
STRH	R1, [R0, #0]
;main.c,73 :: 		}
L_main4:
;main.c,74 :: 		delay_ms(500);             // print twice per second
MOVW	R7, #16126
MOVT	R7, #427
NOP
NOP
L_main5:
SUBS	R7, R7, #1
BNE	L_main5
NOP
NOP
NOP
;main.c,75 :: 		}
IT	AL
BAL	L_main2
;main.c,76 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Pcontrol:
;main.c,79 :: 		int Pcontrol(int setP, int MPV)   // must return duty cycle which is an int
; MPV start address is: 4 (R1)
; setP start address is: 0 (R0)
; MPV end address is: 4 (R1)
; setP end address is: 0 (R0)
; setP start address is: 0 (R0)
; MPV start address is: 4 (R1)
;main.c,81 :: 		return K*(setP - MPV);         // direction calibration...
SUB	R3, R0, R1
SXTH	R3, R3
; setP end address is: 0 (R0)
; MPV end address is: 4 (R1)
MOVW	R2, #150
SXTH	R2, R2
MULS	R2, R3, R2
SXTH	R0, R2
;main.c,82 :: 		}
L_end_Pcontrol:
BX	LR
; end of _Pcontrol
_moveFinger:
;main.c,84 :: 		void moveFinger(int dutyCycle, int direction, int disturbance)
; dutyCycle start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; dutyCycle end address is: 0 (R0)
; dutyCycle start address is: 0 (R0)
;main.c,86 :: 		if(dutyCycle < 0)
CMP	R0, #0
IT	GE
BGE	L_moveFinger7
;main.c,87 :: 		direction = ~direction;
L_moveFinger7:
;main.c,88 :: 		dutyCycle = abs(dutyCycle);
; dutyCycle end address is: 0 (R0)
BL	_abs+0
;main.c,89 :: 		MPV += abs(dutyCycle);
BL	_abs+0
MOVW	R4, #lo_addr(_MPV+0)
MOVT	R4, #hi_addr(_MPV+0)
LDRSH	R3, [R4, #0]
ADDS	R3, R3, R0
STRH	R3, [R4, #0]
;main.c,90 :: 		}
L_end_moveFinger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _moveFinger
