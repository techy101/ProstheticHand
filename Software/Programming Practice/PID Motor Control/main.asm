_main:
;main.c,16 :: 		void main()
;main.c,18 :: 		PV = startP;         // initially
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_PV+0)
MOVT	R0, #hi_addr(_PV+0)
VSTR	#1, S0, [R0, #0]
;main.c,19 :: 		disturbance = 150;
MOVS	R1, #150
SXTH	R1, R1
MOVW	R0, #lo_addr(_disturbance+0)
MOVT	R0, #hi_addr(_disturbance+0)
STRH	R1, [R0, #0]
;main.c,20 :: 		process(PV, disturbance);  // disturb the process variable
MOVW	R1, #150
SXTH	R1, R1
MOV	R0, #0
VMOV	S0, R0
SXTH	R0, R1
BL	_process+0
;main.c,21 :: 		srand(50);
MOVS	R0, #50
BL	_srand+0
;main.c,23 :: 		UART1_Init(115200);        // set up UART1
MOV	R0, #115200
BL	_UART1_Init+0
;main.c,24 :: 		delay_ms(100);
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
;main.c,25 :: 		UART_Write_Text("\r\nStarted. ");
MOVW	R0, #lo_addr(?lstr1_main+0)
MOVT	R0, #hi_addr(?lstr1_main+0)
BL	_UART_Write_Text+0
;main.c,27 :: 		UART1_Write_Text("\nNotes:");
MOVW	R0, #lo_addr(?lstr2_main+0)
MOVT	R0, #hi_addr(?lstr2_main+0)
BL	_UART1_Write_Text+0
;main.c,28 :: 		UART1_Write_Text("\n- process: PV = disturbance*((PV/disturbance) - 36)/577");
MOVW	R0, #lo_addr(?lstr3_main+0)
MOVT	R0, #hi_addr(?lstr3_main+0)
BL	_UART1_Write_Text+0
;main.c,29 :: 		UART1_Write_Text("\n- K = ");
MOVW	R0, #lo_addr(?lstr4_main+0)
MOVT	R0, #hi_addr(?lstr4_main+0)
BL	_UART1_Write_Text+0
;main.c,30 :: 		IntToStr(K, ToStr);
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
MOVW	R0, #150
SXTH	R0, R0
BL	_IntToStr+0
;main.c,31 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,32 :: 		UART1_Write_Text("\n- setpoint = ");
MOVW	R0, #lo_addr(?lstr5_main+0)
MOVT	R0, #hi_addr(?lstr5_main+0)
BL	_UART1_Write_Text+0
;main.c,33 :: 		FloatToStr(setP, ToStr);
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_FloatToStr+0
;main.c,34 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,35 :: 		UART1_Write_Text("\n- margin = ");
MOVW	R0, #lo_addr(?lstr6_main+0)
MOVT	R0, #hi_addr(?lstr6_main+0)
BL	_UART1_Write_Text+0
;main.c,36 :: 		FloatToStr(margin, ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
VMOV.F32	S0, #10
BL	_FloatToStr+0
;main.c,37 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,38 :: 		UART1_Write_Text("\n- disturbance = rand%990 \n");
MOVW	R0, #lo_addr(?lstr7_main+0)
MOVT	R0, #hi_addr(?lstr7_main+0)
BL	_UART1_Write_Text+0
;main.c,41 :: 		while(1)
L_main2:
;main.c,43 :: 		PV = process(PV, disturbance);        // disturb PV
MOVW	R0, #lo_addr(_disturbance+0)
MOVT	R0, #hi_addr(_disturbance+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_PV+0)
MOVT	R0, #hi_addr(_PV+0)
VLDR	#1, S0, [R0, #0]
SXTH	R0, R1
BL	_process+0
MOVW	R0, #lo_addr(_PV+0)
MOVT	R0, #hi_addr(_PV+0)
VSTR	#1, S0, [R0, #0]
;main.c,45 :: 		UART1_Write_Text("\nDisturbed PV = ");
MOVW	R0, #lo_addr(?lstr8_main+0)
MOVT	R0, #hi_addr(?lstr8_main+0)
BL	_UART1_Write_Text+0
;main.c,46 :: 		FloatToStr(PV, ToStr);
MOVW	R0, #lo_addr(_PV+0)
MOVT	R0, #hi_addr(_PV+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_FloatToStr+0
;main.c,47 :: 		UART1_Write_Text(ToStr);          // display current PV value
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,49 :: 		PV = PControl(PV);
MOVW	R0, #lo_addr(_PV+0)
MOVT	R0, #hi_addr(_PV+0)
VLDR	#1, S0, [R0, #0]
BL	_Pcontrol+0
MOVW	R0, #lo_addr(_PV+0)
MOVT	R0, #hi_addr(_PV+0)
VSTR	#1, S0, [R0, #0]
;main.c,51 :: 		UART1_Write_Text("\nCorrected PV = ");
MOVW	R0, #lo_addr(?lstr9_main+0)
MOVT	R0, #hi_addr(?lstr9_main+0)
BL	_UART1_Write_Text+0
;main.c,52 :: 		FloatToStr(PV, ToStr);
MOVW	R0, #lo_addr(_PV+0)
MOVT	R0, #hi_addr(_PV+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_FloatToStr+0
;main.c,53 :: 		UART1_Write_Text(ToStr);          // display current PV value
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,55 :: 		if(abs(PV - setP) < margin) {
MOVW	R0, #lo_addr(_PV+0)
MOVT	R0, #hi_addr(_PV+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VSUB.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
BL	_abs+0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #10
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GE
BGE	L_main4
;main.c,56 :: 		UART_Write_Text("\n** PV stabilized. ");
MOVW	R0, #lo_addr(?lstr10_main+0)
MOVT	R0, #hi_addr(?lstr10_main+0)
BL	_UART_Write_Text+0
;main.c,57 :: 		disturbance = rand()%990;
BL	_rand+0
MOVW	R2, #990
SXTH	R2, R2
SDIV	R1, R0, R2
MLS	R1, R2, R1, R0
MOVW	R0, #lo_addr(_disturbance+0)
MOVT	R0, #hi_addr(_disturbance+0)
STRH	R1, [R0, #0]
;main.c,59 :: 		UART_Write_Text("\nNew disturbance =  ");
MOVW	R0, #lo_addr(?lstr11_main+0)
MOVT	R0, #hi_addr(?lstr11_main+0)
BL	_UART_Write_Text+0
;main.c,60 :: 		IntToStr(disturbance, ToStr);
MOVW	R0, #lo_addr(_disturbance+0)
MOVT	R0, #hi_addr(_disturbance+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_ToStr+0)
MOVT	R1, #hi_addr(_ToStr+0)
BL	_IntToStr+0
;main.c,61 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_ToStr+0)
MOVT	R0, #hi_addr(_ToStr+0)
BL	_UART1_Write_Text+0
;main.c,62 :: 		UART1_Write_Text("\n");
MOVW	R0, #lo_addr(?lstr12_main+0)
MOVT	R0, #hi_addr(?lstr12_main+0)
BL	_UART1_Write_Text+0
;main.c,63 :: 		}
L_main4:
;main.c,64 :: 		delay_ms(500);  // print twice per second
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
;main.c,65 :: 		}
IT	AL
BAL	L_main2
;main.c,66 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Pcontrol:
;main.c,69 :: 		float Pcontrol(float PV)
; PV start address is: 0 (R0)
; PV end address is: 0 (R0)
; PV start address is: 0 (R0)
;main.c,71 :: 		return (-PV / K) + setP;
VNEG.F32	S1, S0
; PV end address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #17174
VMOV	S0, R1
VDIV.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17096
VMOV	S0, R1
VADD.F32	S0, S1, S0
;main.c,72 :: 		}
L_end_Pcontrol:
BX	LR
; end of _Pcontrol
_process:
;main.c,74 :: 		float process(float PV, int disturbance)
; disturbance start address is: 0 (R0)
; PV start address is: 0 (R0)
; disturbance end address is: 0 (R0)
; PV end address is: 0 (R0)
; PV start address is: 0 (R0)
; disturbance start address is: 0 (R0)
;main.c,77 :: 		return disturbance*((PV/disturbance) - 36)/577;
VMOV	S2, R0
VCVT.F32	#1, S2, S2
; disturbance end address is: 0 (R0)
VDIV.F32	S1, S0, S2
; PV end address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #16912
VMOV	S0, R1
VSUB.F32	S0, S1, S0
VMUL.F32	S1, S2, S0
MOVW	R1, #16384
MOVT	R1, #17424
VMOV	S0, R1
VDIV.F32	S0, S1, S0
;main.c,78 :: 		}
L_end_process:
BX	LR
; end of _process
