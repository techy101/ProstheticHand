stm32f4xx_rtc___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_rtc___DSB
stm32f4xx_rtc___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_rtc___WFI
stm32f4xx_rtc___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_rtc___WFE
stm32f4xx_rtc___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_rtc___REV
stm32f4xx_rtc_NVIC_SetPriorityGrouping:
;core_cm4.h,1046 :: 		static __INLINE void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
; PriorityGroup start address is: 0 (R0)
; PriorityGroup end address is: 0 (R0)
; PriorityGroup start address is: 0 (R0)
;core_cm4.h,1049 :: 		uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07);               /* only values 0..7 are used          */
AND	R4, R0, #7
; PriorityGroup end address is: 0 (R0)
;core_cm4.h,1052 :: 		reg_value &= ~(SCB_AIRCR_VECTKEY_Msk | SCB_AIRCR_PRIGROUP_Msk);             /* clear bits to change               */
MOVW	R3, #60684
MOVT	R3, #57344
LDR	R2, [R3, #0]
MOVW	R1, #63743
MOVT	R1, #0
ANDS	R2, R1
;core_cm4.h,1054 :: 		((uint32_t)0x5FA << SCB_AIRCR_VECTKEY_Pos) |
MOVW	R1, #0
MOVT	R1, #1530
ORRS	R2, R1
;core_cm4.h,1055 :: 		(PriorityGroupTmp << 8));                                     /* Insert write key and priorty group */
LSLS	R1, R4, #8
ORR	R1, R2, R1, LSL #0
;core_cm4.h,1056 :: 		SCB->AIRCR =  reg_value;
STR	R1, [R3, #0]
;core_cm4.h,1057 :: 		}
L_end_NVIC_SetPriorityGrouping:
BX	LR
; end of stm32f4xx_rtc_NVIC_SetPriorityGrouping
stm32f4xx_rtc_NVIC_GetPriorityGrouping:
;core_cm4.h,1067 :: 		static __INLINE uint32_t NVIC_GetPriorityGrouping(void)
;core_cm4.h,1069 :: 		return ((SCB->AIRCR & SCB_AIRCR_PRIGROUP_Msk) >> SCB_AIRCR_PRIGROUP_Pos);   /* read priority grouping field */
MOVW	R0, #60684
MOVT	R0, #57344
LDR	R0, [R0, #0]
AND	R0, R0, #1792
LSRS	R0, R0, #8
;core_cm4.h,1070 :: 		}
L_end_NVIC_GetPriorityGrouping:
BX	LR
; end of stm32f4xx_rtc_NVIC_GetPriorityGrouping
stm32f4xx_rtc_NVIC_EnableIRQ:
;core_cm4.h,1080 :: 		static __INLINE void NVIC_EnableIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1083 :: 		NVIC->ISER[(uint32_t)((int32_t)IRQn) >> 5] = (uint32_t)(1 << ((uint32_t)((int32_t)IRQn) & (uint32_t)0x1F)); /* enable interrupt */
SXTB	R1, R0
LSRS	R1, R1, #5
LSLS	R2, R1, #2
MOVW	R1, #57600
MOVT	R1, #57344
ADDS	R3, R1, R2
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R2, R1, #31
MOVS	R1, #1
LSLS	R1, R2
STR	R1, [R3, #0]
;core_cm4.h,1084 :: 		}
L_end_NVIC_EnableIRQ:
BX	LR
; end of stm32f4xx_rtc_NVIC_EnableIRQ
stm32f4xx_rtc_NVIC_DisableIRQ:
;core_cm4.h,1094 :: 		static __INLINE void NVIC_DisableIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1096 :: 		NVIC->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* disable interrupt */
SXTB	R1, R0
LSRS	R1, R1, #5
LSLS	R2, R1, #2
MOVW	R1, #57728
MOVT	R1, #57344
ADDS	R3, R1, R2
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R2, R1, #31
MOVS	R1, #1
LSLS	R1, R2
STR	R1, [R3, #0]
;core_cm4.h,1097 :: 		}
L_end_NVIC_DisableIRQ:
BX	LR
; end of stm32f4xx_rtc_NVIC_DisableIRQ
stm32f4xx_rtc_NVIC_GetPendingIRQ:
;core_cm4.h,1109 :: 		static __INLINE uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1111 :: 		return((uint32_t) ((NVIC->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0)); /* Return 1 if pending else 0 */
SXTB	R1, R0
LSRS	R1, R1, #5
LSLS	R2, R1, #2
MOVW	R1, #57856
MOVT	R1, #57344
ADDS	R1, R1, R2
LDR	R3, [R1, #0]
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R2, R1, #31
MOVS	R1, #1
LSLS	R1, R2
AND	R1, R3, R1, LSL #0
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_rtc_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_rtc_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_rtc_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_rtc_NVIC_GetPendingIRQ1
L_stm32f4xx_rtc_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_rtc_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_rtc_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_rtc_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_rtc_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_rtc_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_rtc_NVIC_GetPendingIRQ
stm32f4xx_rtc_NVIC_SetPendingIRQ:
;core_cm4.h,1122 :: 		static __INLINE void NVIC_SetPendingIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1124 :: 		NVIC->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* set interrupt pending */
SXTB	R1, R0
LSRS	R1, R1, #5
LSLS	R2, R1, #2
MOVW	R1, #57856
MOVT	R1, #57344
ADDS	R3, R1, R2
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R2, R1, #31
MOVS	R1, #1
LSLS	R1, R2
STR	R1, [R3, #0]
;core_cm4.h,1125 :: 		}
L_end_NVIC_SetPendingIRQ:
BX	LR
; end of stm32f4xx_rtc_NVIC_SetPendingIRQ
stm32f4xx_rtc_NVIC_ClearPendingIRQ:
;core_cm4.h,1135 :: 		static __INLINE void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1137 :: 		NVIC->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F)); /* Clear pending interrupt */
SXTB	R1, R0
LSRS	R1, R1, #5
LSLS	R2, R1, #2
MOVW	R1, #57984
MOVT	R1, #57344
ADDS	R3, R1, R2
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R2, R1, #31
MOVS	R1, #1
LSLS	R1, R2
STR	R1, [R3, #0]
;core_cm4.h,1138 :: 		}
L_end_NVIC_ClearPendingIRQ:
BX	LR
; end of stm32f4xx_rtc_NVIC_ClearPendingIRQ
stm32f4xx_rtc_NVIC_GetActive:
;core_cm4.h,1148 :: 		static __INLINE uint32_t NVIC_GetActive(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1150 :: 		return((uint32_t)((NVIC->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0)); /* Return 1 if active else 0 */
SXTB	R1, R0
LSRS	R1, R1, #5
LSLS	R2, R1, #2
MOVW	R1, #58112
MOVT	R1, #57344
ADDS	R1, R1, R2
LDR	R3, [R1, #0]
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R2, R1, #31
MOVS	R1, #1
LSLS	R1, R2
AND	R1, R3, R1, LSL #0
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_rtc_NVIC_GetActive2
; ?FLOC__stm32f4xx_rtc_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_rtc_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_rtc_NVIC_GetActive3
L_stm32f4xx_rtc_NVIC_GetActive2:
; ?FLOC__stm32f4xx_rtc_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_rtc_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_rtc_NVIC_GetActive3:
; ?FLOC__stm32f4xx_rtc_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_rtc_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_rtc_NVIC_GetActive
stm32f4xx_rtc_NVIC_SetPriority:
;core_cm4.h,1165 :: 		static __INLINE void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
; priority start address is: 4 (R1)
; IRQn start address is: 0 (R0)
; priority end address is: 4 (R1)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
; priority start address is: 4 (R1)
;core_cm4.h,1167 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_rtc_NVIC_SetPriority4
;core_cm4.h,1168 :: 		SCB->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xff); } /* set Priority for Cortex-M  System Interrupts */
SXTB	R2, R0
; IRQn end address is: 0 (R0)
AND	R2, R2, #15
SUBS	R3, R2, #4
MOVW	R2, #60696
MOVT	R2, #57344
ADDS	R3, R2, R3
LSLS	R2, R1, #4
; priority end address is: 4 (R1)
AND	R2, R2, #255
STRB	R2, [R3, #0]
IT	AL
BAL	L_stm32f4xx_rtc_NVIC_SetPriority5
L_stm32f4xx_rtc_NVIC_SetPriority4:
;core_cm4.h,1170 :: 		NVIC->IP[(uint32_t)(IRQn)] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xff);    }        /* set Priority for device specific Interrupts  */
; priority start address is: 4 (R1)
; IRQn start address is: 0 (R0)
SXTB	R3, R0
; IRQn end address is: 0 (R0)
MOVW	R2, #58368
MOVT	R2, #57344
ADDS	R3, R2, R3
LSLS	R2, R1, #4
; priority end address is: 4 (R1)
AND	R2, R2, #255
STRB	R2, [R3, #0]
L_stm32f4xx_rtc_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_rtc_NVIC_SetPriority
stm32f4xx_rtc_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_rtc_NVIC_GetPriority6
;core_cm4.h,1190 :: 		return((uint32_t)(SCB->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 - __NVIC_PRIO_BITS)));  } /* get priority for Cortex-M  system interrupts */
SXTB	R1, R0
; IRQn end address is: 0 (R0)
AND	R1, R1, #15
SUBS	R2, R1, #4
MOVW	R1, #60696
MOVT	R1, #57344
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
LSRS	R1, R1, #4
UXTB	R1, R1
MOV	R0, R1
IT	AL
BAL	L_end_NVIC_GetPriority
L_stm32f4xx_rtc_NVIC_GetPriority6:
;core_cm4.h,1192 :: 		return((uint32_t)(NVIC->IP[(uint32_t)(IRQn)]           >> (8 - __NVIC_PRIO_BITS)));  } /* get priority for device specific interrupts  */
; IRQn start address is: 0 (R0)
SXTB	R2, R0
; IRQn end address is: 0 (R0)
MOVW	R1, #58368
MOVT	R1, #57344
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
LSRS	R1, R1, #4
UXTB	R1, R1
MOV	R0, R1
;core_cm4.h,1193 :: 		}
L_end_NVIC_GetPriority:
BX	LR
; end of stm32f4xx_rtc_NVIC_GetPriority
stm32f4xx_rtc_NVIC_EncodePriority:
;core_cm4.h,1210 :: 		static __INLINE uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
; SubPriority start address is: 8 (R2)
; PreemptPriority start address is: 4 (R1)
; PriorityGroup start address is: 0 (R0)
; SubPriority end address is: 8 (R2)
; PreemptPriority end address is: 4 (R1)
; PriorityGroup end address is: 0 (R0)
; PriorityGroup start address is: 0 (R0)
; PreemptPriority start address is: 4 (R1)
; SubPriority start address is: 8 (R2)
;core_cm4.h,1212 :: 		uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);          /* only values 0..7 are used          */
AND	R3, R0, #7
; PriorityGroup end address is: 0 (R0)
; PriorityGroupTmp start address is: 16 (R4)
MOV	R4, R3
;core_cm4.h,1216 :: 		PreemptPriorityBits = ((7 - PriorityGroupTmp) > __NVIC_PRIO_BITS) ? __NVIC_PRIO_BITS : 7 - PriorityGroupTmp;
RSB	R3, R3, #7
CMP	R3, #4
IT	LS
BLS	L_stm32f4xx_rtc_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_rtc_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_rtc_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_rtc_NVIC_EncodePriority9
L_stm32f4xx_rtc_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_rtc_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_rtc_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_rtc_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_rtc_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_rtc_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_rtc_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_rtc_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_rtc_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_rtc_NVIC_EncodePriority11
L_stm32f4xx_rtc_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_rtc_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_rtc_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_rtc_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_rtc_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOVS	R3, #1
LSLS	R3, R0
; PreemptPriorityBits end address is: 0 (R0)
SUBS	R3, R3, #1
AND	R3, R1, R3, LSL #0
; PreemptPriority end address is: 4 (R1)
LSL	R4, R3, R5
;core_cm4.h,1221 :: 		((SubPriority     & ((1 << (SubPriorityBits    )) - 1)))
MOVS	R3, #1
LSLS	R3, R5
; ?FLOC__stm32f4xx_rtc_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_rtc_NVIC_EncodePriority
stm32f4xx_rtc_NVIC_DecodePriority:
;core_cm4.h,1240 :: 		static __INLINE void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority)
; pSubPriority start address is: 12 (R3)
; pPreemptPriority start address is: 8 (R2)
; PriorityGroup start address is: 4 (R1)
; Priority start address is: 0 (R0)
; pSubPriority end address is: 12 (R3)
; pPreemptPriority end address is: 8 (R2)
; PriorityGroup end address is: 4 (R1)
; Priority end address is: 0 (R0)
; Priority start address is: 0 (R0)
; PriorityGroup start address is: 4 (R1)
; pPreemptPriority start address is: 8 (R2)
; pSubPriority start address is: 12 (R3)
;core_cm4.h,1242 :: 		uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);          /* only values 0..7 are used          */
AND	R4, R1, #7
; PriorityGroup end address is: 4 (R1)
; PriorityGroupTmp start address is: 20 (R5)
MOV	R5, R4
;core_cm4.h,1246 :: 		PreemptPriorityBits = ((7 - PriorityGroupTmp) > __NVIC_PRIO_BITS) ? __NVIC_PRIO_BITS : 7 - PriorityGroupTmp;
RSB	R4, R4, #7
CMP	R4, #4
IT	LS
BLS	L_stm32f4xx_rtc_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_rtc_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_rtc_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_rtc_NVIC_DecodePriority13
L_stm32f4xx_rtc_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_rtc_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_rtc_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_rtc_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_rtc_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_rtc_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_rtc_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_rtc_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_rtc_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_rtc_NVIC_DecodePriority15
L_stm32f4xx_rtc_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_rtc_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_rtc_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_rtc_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_rtc_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_rtc_NVIC_DecodePriority?T140 end address is: 16 (R4)
MOVS	R4, #1
LSLS	R4, R1
; PreemptPriorityBits end address is: 4 (R1)
SUBS	R4, R4, #1
AND	R4, R5, R4, LSL #0
STR	R4, [R2, #0]
; pPreemptPriority end address is: 8 (R2)
;core_cm4.h,1250 :: 		*pSubPriority     = (Priority                   ) & ((1 << (SubPriorityBits    )) - 1);
MOVS	R4, #1
LSLS	R4, R6
; SubPriorityBits end address is: 24 (R6)
SUBS	R4, R4, #1
AND	R4, R0, R4, LSL #0
; Priority end address is: 0 (R0)
STR	R4, [R3, #0]
; pSubPriority end address is: 12 (R3)
;core_cm4.h,1251 :: 		}
L_end_NVIC_DecodePriority:
BX	LR
; end of stm32f4xx_rtc_NVIC_DecodePriority
stm32f4xx_rtc_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_rtc___DSB+0
;core_cm4.h,1263 :: 		(SCB->AIRCR & SCB_AIRCR_PRIGROUP_Msk) |
MOVW	R2, #60684
MOVT	R2, #57344
LDR	R0, [R2, #0]
AND	R1, R0, #1792
MOVW	R0, #0
MOVT	R0, #1530
ORRS	R0, R1
;core_cm4.h,1264 :: 		SCB_AIRCR_SYSRESETREQ_Msk);                   /* Keep priority group unchanged */
ORR	R0, R0, #4
STR	R0, [R2, #0]
;core_cm4.h,1265 :: 		__DSB();                                                     /* Ensure completion of memory access */
BL	stm32f4xx_rtc___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_rtc_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_rtc_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_rtc_NVIC_SystemReset
stm32f4xx_rtc_SysTick_Config:
;core_cm4.h,1290 :: 		static __INLINE uint32_t SysTick_Config(uint32_t ticks)
; ticks start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ticks end address is: 0 (R0)
; ticks start address is: 0 (R0)
;core_cm4.h,1292 :: 		if (ticks > SysTick_LOAD_RELOAD_Msk)  return (1);            /* Reload value impossible */
MVN	R1, #-16777216
CMP	R0, R1
IT	LS
BLS	L_stm32f4xx_rtc_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_rtc_SysTick_Config18:
;core_cm4.h,1294 :: 		SysTick->LOAD  = (ticks & SysTick_LOAD_RELOAD_Msk) - 1;      /* set reload register */
; ticks start address is: 0 (R0)
MVN	R1, #-16777216
AND	R1, R0, R1, LSL #0
; ticks end address is: 0 (R0)
SUBS	R2, R1, #1
MOVW	R1, #57364
MOVT	R1, #57344
STR	R2, [R1, #0]
;core_cm4.h,1295 :: 		NVIC_SetPriority (SysTick_IRQn, (1<<__NVIC_PRIO_BITS) - 1);  /* set Priority for Cortex-M0 System Interrupts */
MOV	R1, #15
MOVS	R0, #-1
SXTB	R0, R0
BL	stm32f4xx_rtc_NVIC_SetPriority+0
;core_cm4.h,1296 :: 		SysTick->VAL   = 0;                                          /* Load the SysTick Counter Value */
MOV	R2, #0
MOVW	R1, #57368
MOVT	R1, #57344
STR	R2, [R1, #0]
;core_cm4.h,1299 :: 		SysTick_CTRL_ENABLE_Msk;                    /* Enable SysTick IRQ and SysTick Timer */
MOV	R2, #7
MOVW	R1, #57360
MOVT	R1, #57344
STR	R2, [R1, #0]
;core_cm4.h,1300 :: 		return (0);                                                  /* Function successful */
MOV	R0, #0
;core_cm4.h,1301 :: 		}
L_end_SysTick_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_rtc_SysTick_Config
stm32f4xx_rtc_ITM_SendChar:
;core_cm4.h,1328 :: 		static __INLINE uint32_t ITM_SendChar (uint32_t ch)
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
;core_cm4.h,1330 :: 		if ((CoreDebug->DEMCR & CoreDebug_DEMCR_TRCENA_Msk)  &&      /* Trace enabled */
MOVW	R1, #60924
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #16777216
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_rtc_ITM_SendChar183
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_rtc_ITM_SendChar184
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_rtc_ITM_SendChar185
L_stm32f4xx_rtc_ITM_SendChar179:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_rtc_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_rtc_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_rtc_ITM_SendChar22
L_stm32f4xx_rtc_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_rtc_ITM_SendChar182
L_stm32f4xx_rtc_ITM_SendChar183:
L_stm32f4xx_rtc_ITM_SendChar182:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_rtc_ITM_SendChar181
L_stm32f4xx_rtc_ITM_SendChar184:
L_stm32f4xx_rtc_ITM_SendChar181:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_rtc_ITM_SendChar180
L_stm32f4xx_rtc_ITM_SendChar185:
L_stm32f4xx_rtc_ITM_SendChar180:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_rtc_ITM_SendChar
stm32f4xx_rtc_ITM_ReceiveChar:
;core_cm4.h,1350 :: 		static __INLINE int32_t ITM_ReceiveChar (void) {
SUB	SP, SP, #4
;core_cm4.h,1351 :: 		int32_t ch = -1;                           /* no character available */
MOV	R0, #-1
STR	R0, [SP, #0]
;core_cm4.h,1353 :: 		if (ITM_RxBuffer != ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	EQ
BEQ	L_stm32f4xx_rtc_ITM_ReceiveChar24
;core_cm4.h,1354 :: 		ch = ITM_RxBuffer;
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R0, [R0, #0]
STR	R0, [SP, #0]
;core_cm4.h,1355 :: 		ITM_RxBuffer = ITM_RXBUFFER_EMPTY;       /* ready for next character */
MOVW	R1, #23205
MOVT	R1, #23205
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
STR	R1, [R0, #0]
;core_cm4.h,1356 :: 		}
L_stm32f4xx_rtc_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_rtc_ITM_ReceiveChar
stm32f4xx_rtc_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_rtc_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_rtc_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_rtc_ITM_CheckChar
_RTC_DeInit:
;stm32f4xx_rtc.c,373 :: 		ErrorStatus RTC_DeInit(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f4xx_rtc.c,375 :: 		__IO uint32_t wutcounter = 0x00;
; wutcounter start address is: 12 (R3)
MOV	R3, #0
;stm32f4xx_rtc.c,376 :: 		uint32_t wutwfstatus = 0x00;
;stm32f4xx_rtc.c,377 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,380 :: 		RTC->WPR = 0xCA;
MOV	R0, #202
MOVW	R1, #10276
MOVT	R1, #16384
STR	R0, [R1, #0]
;stm32f4xx_rtc.c,381 :: 		RTC->WPR = 0x53;
MOV	R0, #83
STR	R0, [R1, #0]
;stm32f4xx_rtc.c,384 :: 		if (RTC_EnterInitMode() == ERROR)
BL	_RTC_EnterInitMode+0
CMP	R0, #0
IT	NE
BNE	L_RTC_DeInit27
; wutcounter end address is: 12 (R3)
;stm32f4xx_rtc.c,386 :: 		status = ERROR;
; status start address is: 8 (R2)
MOVS	R2, #0
;stm32f4xx_rtc.c,387 :: 		}
; status end address is: 8 (R2)
IT	AL
BAL	L_RTC_DeInit28
L_RTC_DeInit27:
;stm32f4xx_rtc.c,391 :: 		RTC->TR = (uint32_t)0x00000000;
; wutcounter start address is: 12 (R3)
MOV	R1, #0
MOVW	R0, #10240
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,392 :: 		RTC->DR = (uint32_t)0x00002101;
MOVW	R1, #8449
MOVT	R1, #0
MOVW	R0, #10244
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,394 :: 		RTC->CR &= (uint32_t)0x00000007;
MOVW	R1, #10248
MOVT	R1, #16384
LDR	R0, [R1, #0]
AND	R0, R0, #7
STR	R0, [R1, #0]
; wutcounter end address is: 12 (R3)
MOV	R2, R3
;stm32f4xx_rtc.c,397 :: 		do
L_RTC_DeInit29:
;stm32f4xx_rtc.c,399 :: 		wutwfstatus = RTC->ISR & RTC_ISR_WUTWF;
; wutcounter start address is: 8 (R2)
MOVW	R0, #10252
MOVT	R0, #16384
LDR	R0, [R0, #0]
AND	R0, R0, #4
; wutwfstatus start address is: 4 (R1)
MOV	R1, R0
;stm32f4xx_rtc.c,400 :: 		wutcounter++;
ADDS	R0, R2, #1
MOV	R2, R0
;stm32f4xx_rtc.c,401 :: 		} while((wutcounter != INITMODE_TIMEOUT) && (wutwfstatus == 0x00));
CMP	R2, #65536
IT	EQ
BEQ	L__RTC_DeInit194
CMP	R1, #0
IT	NE
BNE	L__RTC_DeInit193
; wutwfstatus end address is: 4 (R1)
; wutcounter end address is: 8 (R2)
IT	AL
BAL	L_RTC_DeInit29
L__RTC_DeInit194:
L__RTC_DeInit193:
;stm32f4xx_rtc.c,403 :: 		if ((RTC->ISR & RTC_ISR_WUTWF) == RESET)
MOVW	R0, #10252
MOVT	R0, #16384
LDR	R0, [R0, #0]
AND	R0, R0, #4
CMP	R0, #0
IT	NE
BNE	L_RTC_DeInit34
;stm32f4xx_rtc.c,405 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,406 :: 		}
UXTB	R2, R0
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_DeInit35
L_RTC_DeInit34:
;stm32f4xx_rtc.c,410 :: 		RTC->CR &= (uint32_t)0x00000000;
MOVW	R1, #10248
MOVT	R1, #16384
LDR	R0, [R1, #0]
AND	R0, R0, #0
STR	R0, [R1, #0]
;stm32f4xx_rtc.c,411 :: 		RTC->WUTR = (uint32_t)0x0000FFFF;
MOVW	R1, #65535
MOVT	R1, #0
MOVW	R0, #10260
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,412 :: 		RTC->PRER = (uint32_t)0x007F00FF;
MOVW	R1, #255
MOVT	R1, #127
MOVW	R0, #10256
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,413 :: 		RTC->CALIBR = (uint32_t)0x00000000;
MOV	R1, #0
MOVW	R0, #10264
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,414 :: 		RTC->ALRMAR = (uint32_t)0x00000000;
MOV	R1, #0
MOVW	R0, #10268
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,415 :: 		RTC->ALRMBR = (uint32_t)0x00000000;
MOV	R1, #0
MOVW	R0, #10272
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,416 :: 		RTC->SHIFTR = (uint32_t)0x00000000;
MOV	R1, #0
MOVW	R0, #10284
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,417 :: 		RTC->CALR = (uint32_t)0x00000000;
MOV	R1, #0
MOVW	R0, #10300
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,418 :: 		RTC->ALRMASSR = (uint32_t)0x00000000;
MOV	R1, #0
MOVW	R0, #10308
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,419 :: 		RTC->ALRMBSSR = (uint32_t)0x00000000;
MOV	R1, #0
MOVW	R0, #10312
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,422 :: 		RTC->ISR = (uint32_t)0x00000000;
MOV	R1, #0
MOVW	R0, #10252
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,425 :: 		RTC->TAFCR = 0x00000000;
MOV	R1, #0
MOVW	R0, #10304
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,427 :: 		if(RTC_WaitForSynchro() == ERROR)
BL	_RTC_WaitForSynchro+0
CMP	R0, #0
IT	NE
BNE	L_RTC_DeInit36
;stm32f4xx_rtc.c,429 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,430 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_DeInit37
L_RTC_DeInit36:
;stm32f4xx_rtc.c,433 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,434 :: 		}
L_RTC_DeInit37:
;stm32f4xx_rtc.c,435 :: 		}
; status start address is: 0 (R0)
UXTB	R2, R0
; status end address is: 0 (R0)
L_RTC_DeInit35:
;stm32f4xx_rtc.c,436 :: 		}
; status start address is: 8 (R2)
; status end address is: 8 (R2)
L_RTC_DeInit28:
;stm32f4xx_rtc.c,439 :: 		RTC->WPR = 0xFF;
; status start address is: 8 (R2)
MOV	R1, #255
MOVW	R0, #10276
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,441 :: 		return status;
UXTB	R0, R2
; status end address is: 8 (R2)
;stm32f4xx_rtc.c,442 :: 		}
L_end_RTC_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RTC_DeInit
_RTC_Init:
;stm32f4xx_rtc.c,455 :: 		ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
; RTC_InitStruct start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
; RTC_InitStruct end address is: 0 (R0)
; RTC_InitStruct start address is: 16 (R4)
;stm32f4xx_rtc.c,457 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,465 :: 		RTC->WPR = 0xCA;
MOV	R1, #202
MOVW	R2, #10276
MOVT	R2, #16384
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,466 :: 		RTC->WPR = 0x53;
MOV	R1, #83
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,469 :: 		if (RTC_EnterInitMode() == ERROR)
BL	_RTC_EnterInitMode+0
CMP	R0, #0
IT	NE
BNE	L_RTC_Init38
; RTC_InitStruct end address is: 16 (R4)
;stm32f4xx_rtc.c,471 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,472 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_Init39
L_RTC_Init38:
;stm32f4xx_rtc.c,476 :: 		RTC->CR &= ((uint32_t)~(RTC_CR_FMT));
; RTC_InitStruct start address is: 16 (R4)
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #64
ANDS	R2, R1
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,478 :: 		RTC->CR |=  ((uint32_t)(RTC_InitStruct->RTC_HourFormat));
LDR	R1, [R4, #0]
ORR	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,481 :: 		RTC->PRER = (uint32_t)(RTC_InitStruct->RTC_SynchPrediv);
ADDW	R1, R4, #8
LDR	R3, [R1, #0]
MOVW	R2, #10256
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_rtc.c,482 :: 		RTC->PRER |= (uint32_t)(RTC_InitStruct->RTC_AsynchPrediv << 16);
ADDS	R1, R4, #4
; RTC_InitStruct end address is: 16 (R4)
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORR	R1, R3, R1, LSL #0
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,485 :: 		RTC_ExitInitMode();
BL	_RTC_ExitInitMode+0
;stm32f4xx_rtc.c,487 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,488 :: 		}
L_RTC_Init39:
;stm32f4xx_rtc.c,490 :: 		RTC->WPR = 0xFF;
; status start address is: 0 (R0)
MOV	R2, #255
MOVW	R1, #10276
MOVT	R1, #16384
STR	R2, [R1, #0]
;stm32f4xx_rtc.c,492 :: 		return status;
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,493 :: 		}
L_end_RTC_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RTC_Init
_RTC_StructInit:
;stm32f4xx_rtc.c,501 :: 		void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
; RTC_InitStruct start address is: 0 (R0)
; RTC_InitStruct end address is: 0 (R0)
; RTC_InitStruct start address is: 0 (R0)
;stm32f4xx_rtc.c,504 :: 		RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,507 :: 		RTC_InitStruct->RTC_AsynchPrediv = (uint32_t)0x7F;
ADDS	R2, R0, #4
MOV	R1, #127
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,510 :: 		RTC_InitStruct->RTC_SynchPrediv = (uint32_t)0xFF;
ADDW	R2, R0, #8
; RTC_InitStruct end address is: 0 (R0)
MOV	R1, #255
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,511 :: 		}
L_end_RTC_StructInit:
BX	LR
; end of _RTC_StructInit
_RTC_WriteProtectionCmd:
;stm32f4xx_rtc.c,523 :: 		void RTC_WriteProtectionCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_rtc.c,528 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_RTC_WriteProtectionCmd40
; NewState end address is: 0 (R0)
;stm32f4xx_rtc.c,531 :: 		RTC->WPR = 0xFF;
MOV	R2, #255
MOVW	R1, #10276
MOVT	R1, #16384
STR	R2, [R1, #0]
;stm32f4xx_rtc.c,532 :: 		}
IT	AL
BAL	L_RTC_WriteProtectionCmd41
L_RTC_WriteProtectionCmd40:
;stm32f4xx_rtc.c,536 :: 		RTC->WPR = 0xCA;
MOV	R1, #202
MOVW	R2, #10276
MOVT	R2, #16384
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,537 :: 		RTC->WPR = 0x53;
MOV	R1, #83
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,538 :: 		}
L_RTC_WriteProtectionCmd41:
;stm32f4xx_rtc.c,539 :: 		}
L_end_RTC_WriteProtectionCmd:
BX	LR
; end of _RTC_WriteProtectionCmd
_RTC_EnterInitMode:
;stm32f4xx_rtc.c,550 :: 		ErrorStatus RTC_EnterInitMode(void)
;stm32f4xx_rtc.c,552 :: 		__IO uint32_t initcounter = 0x00;
; initcounter start address is: 8 (R2)
MOV	R2, #0
;stm32f4xx_rtc.c,553 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,554 :: 		uint32_t initstatus = 0x00;
;stm32f4xx_rtc.c,557 :: 		if ((RTC->ISR & RTC_ISR_INITF) == (uint32_t)RESET)
MOVW	R0, #10252
MOVT	R0, #16384
LDR	R0, [R0, #0]
AND	R0, R0, #64
CMP	R0, #0
IT	NE
BNE	L_RTC_EnterInitMode42
;stm32f4xx_rtc.c,560 :: 		RTC->ISR = (uint32_t)RTC_INIT_MASK;
MOV	R1, #-1
MOVW	R0, #10252
MOVT	R0, #16384
STR	R1, [R0, #0]
; initcounter end address is: 8 (R2)
;stm32f4xx_rtc.c,563 :: 		do
L_RTC_EnterInitMode43:
;stm32f4xx_rtc.c,565 :: 		initstatus = RTC->ISR & RTC_ISR_INITF;
; initcounter start address is: 8 (R2)
MOVW	R0, #10252
MOVT	R0, #16384
LDR	R0, [R0, #0]
AND	R0, R0, #64
; initstatus start address is: 4 (R1)
MOV	R1, R0
;stm32f4xx_rtc.c,566 :: 		initcounter++;
ADDS	R0, R2, #1
MOV	R2, R0
;stm32f4xx_rtc.c,567 :: 		} while((initcounter != INITMODE_TIMEOUT) && (initstatus == 0x00));
CMP	R2, #65536
IT	EQ
BEQ	L__RTC_EnterInitMode188
CMP	R1, #0
IT	NE
BNE	L__RTC_EnterInitMode187
; initstatus end address is: 4 (R1)
; initcounter end address is: 8 (R2)
IT	AL
BAL	L_RTC_EnterInitMode43
L__RTC_EnterInitMode188:
L__RTC_EnterInitMode187:
;stm32f4xx_rtc.c,569 :: 		if ((RTC->ISR & RTC_ISR_INITF) != RESET)
MOVW	R0, #10252
MOVT	R0, #16384
LDR	R0, [R0, #0]
AND	R0, R0, #64
CMP	R0, #0
IT	EQ
BEQ	L_RTC_EnterInitMode48
;stm32f4xx_rtc.c,571 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_rtc.c,572 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_EnterInitMode49
L_RTC_EnterInitMode48:
;stm32f4xx_rtc.c,575 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,576 :: 		}
L_RTC_EnterInitMode49:
;stm32f4xx_rtc.c,577 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_EnterInitMode50
L_RTC_EnterInitMode42:
;stm32f4xx_rtc.c,580 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,581 :: 		}
L_RTC_EnterInitMode50:
;stm32f4xx_rtc.c,583 :: 		return (status);
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,584 :: 		}
L_end_RTC_EnterInitMode:
BX	LR
; end of _RTC_EnterInitMode
_RTC_ExitInitMode:
;stm32f4xx_rtc.c,595 :: 		void RTC_ExitInitMode(void)
;stm32f4xx_rtc.c,598 :: 		RTC->ISR &= (uint32_t)~RTC_ISR_INIT;
MOVW	R2, #10252
MOVT	R2, #16384
LDR	R1, [R2, #0]
MVN	R0, #128
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;stm32f4xx_rtc.c,599 :: 		}
L_end_RTC_ExitInitMode:
BX	LR
; end of _RTC_ExitInitMode
_RTC_WaitForSynchro:
;stm32f4xx_rtc.c,617 :: 		ErrorStatus RTC_WaitForSynchro(void)
;stm32f4xx_rtc.c,619 :: 		__IO uint32_t synchrocounter = 0;
; synchrocounter start address is: 12 (R3)
MOV	R3, #0
;stm32f4xx_rtc.c,620 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,621 :: 		uint32_t synchrostatus = 0x00;
;stm32f4xx_rtc.c,624 :: 		RTC->WPR = 0xCA;
MOV	R0, #202
MOVW	R1, #10276
MOVT	R1, #16384
STR	R0, [R1, #0]
;stm32f4xx_rtc.c,625 :: 		RTC->WPR = 0x53;
MOV	R0, #83
STR	R0, [R1, #0]
;stm32f4xx_rtc.c,628 :: 		RTC->ISR &= (uint32_t)RTC_RSF_MASK;
MOVW	R2, #10252
MOVT	R2, #16384
LDR	R1, [R2, #0]
MVN	R0, #160
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
; synchrocounter end address is: 12 (R3)
MOV	R2, R3
;stm32f4xx_rtc.c,631 :: 		do
L_RTC_WaitForSynchro51:
;stm32f4xx_rtc.c,633 :: 		synchrostatus = RTC->ISR & RTC_ISR_RSF;
; synchrocounter start address is: 8 (R2)
MOVW	R0, #10252
MOVT	R0, #16384
LDR	R0, [R0, #0]
AND	R0, R0, #32
; synchrostatus start address is: 4 (R1)
MOV	R1, R0
;stm32f4xx_rtc.c,634 :: 		synchrocounter++;
ADDS	R0, R2, #1
MOV	R2, R0
;stm32f4xx_rtc.c,635 :: 		} while((synchrocounter != SYNCHRO_TIMEOUT) && (synchrostatus == 0x00));
CMP	R2, #131072
IT	EQ
BEQ	L__RTC_WaitForSynchro191
CMP	R1, #0
IT	NE
BNE	L__RTC_WaitForSynchro190
; synchrostatus end address is: 4 (R1)
; synchrocounter end address is: 8 (R2)
IT	AL
BAL	L_RTC_WaitForSynchro51
L__RTC_WaitForSynchro191:
L__RTC_WaitForSynchro190:
;stm32f4xx_rtc.c,637 :: 		if ((RTC->ISR & RTC_ISR_RSF) != RESET)
MOVW	R0, #10252
MOVT	R0, #16384
LDR	R0, [R0, #0]
AND	R0, R0, #32
CMP	R0, #0
IT	EQ
BEQ	L_RTC_WaitForSynchro56
;stm32f4xx_rtc.c,639 :: 		status = SUCCESS;
; status start address is: 8 (R2)
MOVS	R2, #1
;stm32f4xx_rtc.c,640 :: 		}
; status end address is: 8 (R2)
IT	AL
BAL	L_RTC_WaitForSynchro57
L_RTC_WaitForSynchro56:
;stm32f4xx_rtc.c,643 :: 		status = ERROR;
; status start address is: 8 (R2)
MOVS	R2, #0
; status end address is: 8 (R2)
;stm32f4xx_rtc.c,644 :: 		}
L_RTC_WaitForSynchro57:
;stm32f4xx_rtc.c,647 :: 		RTC->WPR = 0xFF;
; status start address is: 8 (R2)
MOV	R1, #255
MOVW	R0, #10276
MOVT	R0, #16384
STR	R1, [R0, #0]
;stm32f4xx_rtc.c,649 :: 		return (status);
UXTB	R0, R2
; status end address is: 8 (R2)
;stm32f4xx_rtc.c,650 :: 		}
L_end_RTC_WaitForSynchro:
BX	LR
; end of _RTC_WaitForSynchro
_RTC_RefClockCmd:
;stm32f4xx_rtc.c,660 :: 		ErrorStatus RTC_RefClockCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R3, R0
; NewState end address is: 0 (R0)
; NewState start address is: 12 (R3)
;stm32f4xx_rtc.c,662 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,668 :: 		RTC->WPR = 0xCA;
MOV	R1, #202
MOVW	R2, #10276
MOVT	R2, #16384
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,669 :: 		RTC->WPR = 0x53;
MOV	R1, #83
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,672 :: 		if (RTC_EnterInitMode() == ERROR)
BL	_RTC_EnterInitMode+0
CMP	R0, #0
IT	NE
BNE	L_RTC_RefClockCmd58
; NewState end address is: 12 (R3)
;stm32f4xx_rtc.c,674 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,675 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_RefClockCmd59
L_RTC_RefClockCmd58:
;stm32f4xx_rtc.c,678 :: 		if (NewState != DISABLE)
; NewState start address is: 12 (R3)
CMP	R3, #0
IT	EQ
BEQ	L_RTC_RefClockCmd60
; NewState end address is: 12 (R3)
;stm32f4xx_rtc.c,681 :: 		RTC->CR |= RTC_CR_REFCKON;
MOVW	R2, #10248
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORR	R1, R1, #16
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,682 :: 		}
IT	AL
BAL	L_RTC_RefClockCmd61
L_RTC_RefClockCmd60:
;stm32f4xx_rtc.c,686 :: 		RTC->CR &= ~RTC_CR_REFCKON;
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #16
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,687 :: 		}
L_RTC_RefClockCmd61:
;stm32f4xx_rtc.c,689 :: 		RTC_ExitInitMode();
BL	_RTC_ExitInitMode+0
;stm32f4xx_rtc.c,691 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,692 :: 		}
L_RTC_RefClockCmd59:
;stm32f4xx_rtc.c,695 :: 		RTC->WPR = 0xFF;
; status start address is: 0 (R0)
MOV	R2, #255
MOVW	R1, #10276
MOVT	R1, #16384
STR	R2, [R1, #0]
;stm32f4xx_rtc.c,697 :: 		return status;
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,698 :: 		}
L_end_RTC_RefClockCmd:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RTC_RefClockCmd
_RTC_BypassShadowCmd:
;stm32f4xx_rtc.c,708 :: 		void RTC_BypassShadowCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_rtc.c,714 :: 		RTC->WPR = 0xCA;
MOV	R1, #202
MOVW	R2, #10276
MOVT	R2, #16384
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,715 :: 		RTC->WPR = 0x53;
MOV	R1, #83
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,717 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_RTC_BypassShadowCmd62
; NewState end address is: 0 (R0)
;stm32f4xx_rtc.c,720 :: 		RTC->CR |= (uint8_t)RTC_CR_BYPSHAD;
MOVW	R2, #10248
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORR	R1, R1, #32
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,721 :: 		}
IT	AL
BAL	L_RTC_BypassShadowCmd63
L_RTC_BypassShadowCmd62:
;stm32f4xx_rtc.c,725 :: 		RTC->CR &= (uint8_t)~RTC_CR_BYPSHAD;
MOVW	R2, #10248
MOVT	R2, #16384
LDR	R1, [R2, #0]
AND	R1, R1, #223
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,726 :: 		}
L_RTC_BypassShadowCmd63:
;stm32f4xx_rtc.c,729 :: 		RTC->WPR = 0xFF;
MOV	R2, #255
MOVW	R1, #10276
MOVT	R1, #16384
STR	R2, [R1, #0]
;stm32f4xx_rtc.c,730 :: 		}
L_end_RTC_BypassShadowCmd:
BX	LR
; end of _RTC_BypassShadowCmd
_RTC_SetTime:
;stm32f4xx_rtc.c,763 :: 		ErrorStatus RTC_SetTime(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_TimeStruct)
; RTC_TimeStruct start address is: 4 (R1)
; RTC_Format start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R5, R0
MOV	R4, R1
; RTC_TimeStruct end address is: 4 (R1)
; RTC_Format end address is: 0 (R0)
; RTC_Format start address is: 20 (R5)
; RTC_TimeStruct start address is: 16 (R4)
;stm32f4xx_rtc.c,765 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rtc.c,766 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,771 :: 		if (RTC_Format == RTC_Format_BIN)
CMP	R5, #0
IT	NE
BNE	L_RTC_SetTime64
;stm32f4xx_rtc.c,773 :: 		if ((RTC->CR & RTC_CR_FMT) != (uint32_t)RESET)
MOVW	R2, #10248
MOVT	R2, #16384
LDR	R2, [R2, #0]
AND	R2, R2, #64
CMP	R2, #0
IT	EQ
BEQ	L_RTC_SetTime65
;stm32f4xx_rtc.c,777 :: 		}
IT	AL
BAL	L_RTC_SetTime66
L_RTC_SetTime65:
;stm32f4xx_rtc.c,780 :: 		RTC_TimeStruct->RTC_H12 = 0x00;
ADDS	R3, R4, #3
MOVS	R2, #0
STRB	R2, [R3, #0]
;stm32f4xx_rtc.c,782 :: 		}
L_RTC_SetTime66:
;stm32f4xx_rtc.c,785 :: 		}
IT	AL
BAL	L_RTC_SetTime67
L_RTC_SetTime64:
;stm32f4xx_rtc.c,788 :: 		if ((RTC->CR & RTC_CR_FMT) != (uint32_t)RESET)
MOVW	R2, #10248
MOVT	R2, #16384
LDR	R2, [R2, #0]
AND	R2, R2, #64
CMP	R2, #0
IT	EQ
BEQ	L_RTC_SetTime68
;stm32f4xx_rtc.c,790 :: 		tmpreg = RTC_Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
LDRB	R2, [R4, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
;stm32f4xx_rtc.c,793 :: 		}
IT	AL
BAL	L_RTC_SetTime69
L_RTC_SetTime68:
;stm32f4xx_rtc.c,796 :: 		RTC_TimeStruct->RTC_H12 = 0x00;
ADDS	R3, R4, #3
MOVS	R2, #0
STRB	R2, [R3, #0]
;stm32f4xx_rtc.c,798 :: 		}
L_RTC_SetTime69:
;stm32f4xx_rtc.c,801 :: 		}
L_RTC_SetTime67:
;stm32f4xx_rtc.c,804 :: 		if (RTC_Format != RTC_Format_BIN)
CMP	R5, #0
IT	EQ
BEQ	L_RTC_SetTime70
; RTC_Format end address is: 20 (R5)
;stm32f4xx_rtc.c,809 :: 		((uint32_t)(RTC_TimeStruct->RTC_H12) << 16));
LDRB	R2, [R4, #0]
LSLS	R3, R2, #16
ADDS	R2, R4, #1
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
ORRS	R3, R2
ADDS	R2, R4, #2
LDRB	R2, [R2, #0]
ORRS	R3, R2
ADDS	R2, R4, #3
; RTC_TimeStruct end address is: 16 (R4)
LDRB	R2, [R2, #0]
LSLS	R2, R2, #16
ORR	R4, R3, R2, LSL #0
; tmpreg start address is: 16 (R4)
;stm32f4xx_rtc.c,810 :: 		}
; tmpreg end address is: 16 (R4)
IT	AL
BAL	L_RTC_SetTime71
L_RTC_SetTime70:
;stm32f4xx_rtc.c,816 :: 		(((uint32_t)RTC_TimeStruct->RTC_H12) << 16));
; RTC_TimeStruct start address is: 16 (R4)
LDRB	R2, [R4, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_ByteToBcd2+0
UXTB	R2, R0
LSLS	R2, R2, #16
STR	R2, [SP, #4]
ADDS	R2, R4, #1
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_ByteToBcd2+0
UXTB	R2, R0
LSLS	R3, R2, #8
LDR	R2, [SP, #4]
ORRS	R2, R3
STR	R2, [SP, #4]
ADDS	R2, R4, #2
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_ByteToBcd2+0
UXTB	R3, R0
LDR	R2, [SP, #4]
ORR	R3, R2, R3, LSL #0
ADDS	R2, R4, #3
; RTC_TimeStruct end address is: 16 (R4)
LDRB	R2, [R2, #0]
LSLS	R2, R2, #16
ORR	R4, R3, R2, LSL #0
; tmpreg start address is: 16 (R4)
; tmpreg end address is: 16 (R4)
;stm32f4xx_rtc.c,817 :: 		}
L_RTC_SetTime71:
;stm32f4xx_rtc.c,820 :: 		RTC->WPR = 0xCA;
; tmpreg start address is: 16 (R4)
MOV	R2, #202
MOVW	R3, #10276
MOVT	R3, #16384
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,821 :: 		RTC->WPR = 0x53;
MOV	R2, #83
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,824 :: 		if (RTC_EnterInitMode() == ERROR)
BL	_RTC_EnterInitMode+0
CMP	R0, #0
IT	NE
BNE	L_RTC_SetTime72
; tmpreg end address is: 16 (R4)
;stm32f4xx_rtc.c,826 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,827 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_SetTime73
L_RTC_SetTime72:
;stm32f4xx_rtc.c,831 :: 		RTC->TR = (uint32_t)(tmpreg & RTC_TR_RESERVED_MASK);
; tmpreg start address is: 16 (R4)
MOVW	R2, #32639
MOVT	R2, #127
AND	R3, R4, R2, LSL #0
; tmpreg end address is: 16 (R4)
MOVW	R2, #10240
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_rtc.c,834 :: 		RTC_ExitInitMode();
BL	_RTC_ExitInitMode+0
;stm32f4xx_rtc.c,837 :: 		if ((RTC->CR & RTC_CR_BYPSHAD) == RESET)
MOVW	R2, #10248
MOVT	R2, #16384
LDR	R2, [R2, #0]
AND	R2, R2, #32
CMP	R2, #0
IT	NE
BNE	L_RTC_SetTime74
;stm32f4xx_rtc.c,839 :: 		if (RTC_WaitForSynchro() == ERROR)
BL	_RTC_WaitForSynchro+0
CMP	R0, #0
IT	NE
BNE	L_RTC_SetTime75
;stm32f4xx_rtc.c,841 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,842 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_SetTime76
L_RTC_SetTime75:
;stm32f4xx_rtc.c,845 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,846 :: 		}
L_RTC_SetTime76:
;stm32f4xx_rtc.c,847 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_SetTime77
L_RTC_SetTime74:
;stm32f4xx_rtc.c,850 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,851 :: 		}
L_RTC_SetTime77:
;stm32f4xx_rtc.c,852 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
L_RTC_SetTime73:
;stm32f4xx_rtc.c,854 :: 		RTC->WPR = 0xFF;
; status start address is: 0 (R0)
MOV	R3, #255
MOVW	R2, #10276
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_rtc.c,856 :: 		return status;
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,857 :: 		}
L_end_RTC_SetTime:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RTC_SetTime
_RTC_TimeStructInit:
;stm32f4xx_rtc.c,866 :: 		void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
; RTC_TimeStruct start address is: 0 (R0)
; RTC_TimeStruct end address is: 0 (R0)
; RTC_TimeStruct start address is: 0 (R0)
;stm32f4xx_rtc.c,869 :: 		RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
ADDS	R2, R0, #3
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_rtc.c,870 :: 		RTC_TimeStruct->RTC_Hours = 0;
MOVS	R1, #0
STRB	R1, [R0, #0]
;stm32f4xx_rtc.c,871 :: 		RTC_TimeStruct->RTC_Minutes = 0;
ADDS	R2, R0, #1
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_rtc.c,872 :: 		RTC_TimeStruct->RTC_Seconds = 0;
ADDS	R2, R0, #2
; RTC_TimeStruct end address is: 0 (R0)
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_rtc.c,873 :: 		}
L_end_RTC_TimeStructInit:
BX	LR
; end of _RTC_TimeStructInit
_RTC_GetTime:
;stm32f4xx_rtc.c,885 :: 		void RTC_GetTime(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_TimeStruct)
; RTC_TimeStruct start address is: 4 (R1)
; RTC_Format start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R4, R1
; RTC_TimeStruct end address is: 4 (R1)
; RTC_Format end address is: 0 (R0)
; RTC_Format start address is: 0 (R0)
; RTC_TimeStruct start address is: 16 (R4)
;stm32f4xx_rtc.c,887 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rtc.c,893 :: 		tmpreg = (uint32_t)(RTC->TR & RTC_TR_RESERVED_MASK);
MOVW	R2, #10240
MOVT	R2, #16384
LDR	R3, [R2, #0]
MOVW	R2, #32639
MOVT	R2, #127
AND	R2, R3, R2, LSL #0
; tmpreg start address is: 4 (R1)
MOV	R1, R2
;stm32f4xx_rtc.c,896 :: 		RTC_TimeStruct->RTC_Hours = (uint8_t)((tmpreg & (RTC_TR_HT | RTC_TR_HU)) >> 16);
AND	R2, R2, #4128768
LSRS	R2, R2, #16
UXTB	R2, R2
STRB	R2, [R4, #0]
;stm32f4xx_rtc.c,897 :: 		RTC_TimeStruct->RTC_Minutes = (uint8_t)((tmpreg & (RTC_TR_MNT | RTC_TR_MNU)) >>8);
ADDS	R3, R4, #1
AND	R2, R1, #32512
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;stm32f4xx_rtc.c,898 :: 		RTC_TimeStruct->RTC_Seconds = (uint8_t)(tmpreg & (RTC_TR_ST | RTC_TR_SU));
ADDS	R3, R4, #2
AND	R2, R1, #127
UXTB	R2, R2
STRB	R2, [R3, #0]
;stm32f4xx_rtc.c,899 :: 		RTC_TimeStruct->RTC_H12 = (uint8_t)((tmpreg & (RTC_TR_PM)) >> 16);
ADDS	R3, R4, #3
AND	R2, R1, #4194304
; tmpreg end address is: 4 (R1)
LSRS	R2, R2, #16
UXTB	R2, R2
STRB	R2, [R3, #0]
;stm32f4xx_rtc.c,902 :: 		if (RTC_Format == RTC_Format_BIN)
CMP	R0, #0
IT	NE
BNE	L_RTC_GetTime78
; RTC_Format end address is: 0 (R0)
;stm32f4xx_rtc.c,905 :: 		RTC_TimeStruct->RTC_Hours = (uint8_t)RTC_Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
MOV	R2, R4
STR	R2, [SP, #4]
LDRB	R2, [R4, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R2, [SP, #4]
STRB	R0, [R2, #0]
;stm32f4xx_rtc.c,906 :: 		RTC_TimeStruct->RTC_Minutes = (uint8_t)RTC_Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
ADDS	R2, R4, #1
STR	R2, [SP, #4]
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R2, [SP, #4]
STRB	R0, [R2, #0]
;stm32f4xx_rtc.c,907 :: 		RTC_TimeStruct->RTC_Seconds = (uint8_t)RTC_Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
ADDS	R2, R4, #2
; RTC_TimeStruct end address is: 16 (R4)
STR	R2, [SP, #4]
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R2, [SP, #4]
STRB	R0, [R2, #0]
;stm32f4xx_rtc.c,908 :: 		}
L_RTC_GetTime78:
;stm32f4xx_rtc.c,909 :: 		}
L_end_RTC_GetTime:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RTC_GetTime
_RTC_GetSubSecond:
;stm32f4xx_rtc.c,918 :: 		uint32_t RTC_GetSubSecond(void)
;stm32f4xx_rtc.c,920 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rtc.c,928 :: 		return (tmpreg);
MOVW	R0, #10280
MOVT	R0, #16384
LDR	R0, [R0, #0]
;stm32f4xx_rtc.c,929 :: 		}
L_end_RTC_GetSubSecond:
BX	LR
; end of _RTC_GetSubSecond
_RTC_SetDate:
;stm32f4xx_rtc.c,943 :: 		ErrorStatus RTC_SetDate(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct)
; RTC_DateStruct start address is: 4 (R1)
; RTC_Format start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R6, R0
MOV	R5, R1
; RTC_DateStruct end address is: 4 (R1)
; RTC_Format end address is: 0 (R0)
; RTC_Format start address is: 24 (R6)
; RTC_DateStruct start address is: 20 (R5)
;stm32f4xx_rtc.c,945 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rtc.c,946 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,951 :: 		if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & 0x10) == 0x10))
CMP	R6, #0
IT	NE
BNE	L__RTC_SetDate197
ADDS	R2, R5, #1
LDRB	R2, [R2, #0]
AND	R2, R2, #16
CMP	R2, #16
IT	NE
BNE	L__RTC_SetDate196
L__RTC_SetDate195:
;stm32f4xx_rtc.c,953 :: 		RTC_DateStruct->RTC_Month = (RTC_DateStruct->RTC_Month & (uint32_t)~(0x10)) + 0x0A;
ADDS	R4, R5, #1
LDRB	R3, [R4, #0]
MVN	R2, #16
AND	R2, R3, R2, LSL #0
ADDS	R2, #10
STRB	R2, [R4, #0]
;stm32f4xx_rtc.c,951 :: 		if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & 0x10) == 0x10))
L__RTC_SetDate197:
L__RTC_SetDate196:
;stm32f4xx_rtc.c,955 :: 		if (RTC_Format == RTC_Format_BIN)
CMP	R6, #0
IT	NE
BNE	L_RTC_SetDate82
;stm32f4xx_rtc.c,960 :: 		}
IT	AL
BAL	L_RTC_SetDate83
L_RTC_SetDate82:
;stm32f4xx_rtc.c,964 :: 		tmpreg = RTC_Bcd2ToByte(RTC_DateStruct->RTC_Month);
ADDS	R2, R5, #1
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
;stm32f4xx_rtc.c,966 :: 		tmpreg = RTC_Bcd2ToByte(RTC_DateStruct->RTC_Date);
ADDS	R2, R5, #2
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
;stm32f4xx_rtc.c,968 :: 		}
L_RTC_SetDate83:
;stm32f4xx_rtc.c,972 :: 		if (RTC_Format != RTC_Format_BIN)
CMP	R6, #0
IT	EQ
BEQ	L_RTC_SetDate84
; RTC_Format end address is: 24 (R6)
;stm32f4xx_rtc.c,977 :: 		(((uint32_t)RTC_DateStruct->RTC_WeekDay) << 13));
ADDS	R2, R5, #3
LDRB	R2, [R2, #0]
UXTB	R4, R2
LSLS	R4, R4, #16
ADDS	R2, R5, #1
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
ORRS	R4, R2
ADDS	R2, R5, #2
LDRB	R2, [R2, #0]
ORRS	R4, R2
LDRB	R2, [R5, #0]
; RTC_DateStruct end address is: 20 (R5)
LSLS	R2, R2, #13
ORRS	R4, R2
; tmpreg start address is: 16 (R4)
;stm32f4xx_rtc.c,978 :: 		}
; tmpreg end address is: 16 (R4)
IT	AL
BAL	L_RTC_SetDate85
L_RTC_SetDate84:
;stm32f4xx_rtc.c,984 :: 		((uint32_t)RTC_DateStruct->RTC_WeekDay << 13));
; RTC_DateStruct start address is: 20 (R5)
ADDS	R2, R5, #3
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_ByteToBcd2+0
UXTB	R2, R0
LSLS	R2, R2, #16
STR	R2, [SP, #4]
ADDS	R2, R5, #1
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_ByteToBcd2+0
UXTB	R2, R0
LSLS	R3, R2, #8
LDR	R2, [SP, #4]
ORRS	R2, R3
STR	R2, [SP, #4]
ADDS	R2, R5, #2
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_ByteToBcd2+0
UXTB	R3, R0
LDR	R2, [SP, #4]
ORR	R4, R2, R3, LSL #0
LDRB	R2, [R5, #0]
; RTC_DateStruct end address is: 20 (R5)
LSLS	R2, R2, #13
ORRS	R4, R2
; tmpreg start address is: 16 (R4)
; tmpreg end address is: 16 (R4)
;stm32f4xx_rtc.c,985 :: 		}
L_RTC_SetDate85:
;stm32f4xx_rtc.c,988 :: 		RTC->WPR = 0xCA;
; tmpreg start address is: 16 (R4)
MOV	R2, #202
MOVW	R3, #10276
MOVT	R3, #16384
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,989 :: 		RTC->WPR = 0x53;
MOV	R2, #83
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,992 :: 		if (RTC_EnterInitMode() == ERROR)
BL	_RTC_EnterInitMode+0
CMP	R0, #0
IT	NE
BNE	L_RTC_SetDate86
; tmpreg end address is: 16 (R4)
;stm32f4xx_rtc.c,994 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,995 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_SetDate87
L_RTC_SetDate86:
;stm32f4xx_rtc.c,999 :: 		RTC->DR = (uint32_t)(tmpreg & RTC_DR_RESERVED_MASK);
; tmpreg start address is: 16 (R4)
MOVW	R2, #65343
MOVT	R2, #255
AND	R3, R4, R2, LSL #0
; tmpreg end address is: 16 (R4)
MOVW	R2, #10244
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_rtc.c,1002 :: 		RTC_ExitInitMode();
BL	_RTC_ExitInitMode+0
;stm32f4xx_rtc.c,1005 :: 		if ((RTC->CR & RTC_CR_BYPSHAD) == RESET)
MOVW	R2, #10248
MOVT	R2, #16384
LDR	R2, [R2, #0]
AND	R2, R2, #32
CMP	R2, #0
IT	NE
BNE	L_RTC_SetDate88
;stm32f4xx_rtc.c,1007 :: 		if (RTC_WaitForSynchro() == ERROR)
BL	_RTC_WaitForSynchro+0
CMP	R0, #0
IT	NE
BNE	L_RTC_SetDate89
;stm32f4xx_rtc.c,1009 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,1010 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_SetDate90
L_RTC_SetDate89:
;stm32f4xx_rtc.c,1013 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1014 :: 		}
L_RTC_SetDate90:
;stm32f4xx_rtc.c,1015 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_SetDate91
L_RTC_SetDate88:
;stm32f4xx_rtc.c,1018 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1019 :: 		}
L_RTC_SetDate91:
;stm32f4xx_rtc.c,1020 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
L_RTC_SetDate87:
;stm32f4xx_rtc.c,1022 :: 		RTC->WPR = 0xFF;
; status start address is: 0 (R0)
MOV	R3, #255
MOVW	R2, #10276
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_rtc.c,1024 :: 		return status;
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1025 :: 		}
L_end_RTC_SetDate:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RTC_SetDate
_RTC_DateStructInit:
;stm32f4xx_rtc.c,1034 :: 		void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
; RTC_DateStruct start address is: 0 (R0)
; RTC_DateStruct end address is: 0 (R0)
; RTC_DateStruct start address is: 0 (R0)
;stm32f4xx_rtc.c,1037 :: 		RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
MOVS	R1, #1
STRB	R1, [R0, #0]
;stm32f4xx_rtc.c,1038 :: 		RTC_DateStruct->RTC_Date = 1;
ADDS	R2, R0, #2
MOVS	R1, #1
STRB	R1, [R2, #0]
;stm32f4xx_rtc.c,1039 :: 		RTC_DateStruct->RTC_Month = RTC_Month_January;
ADDS	R2, R0, #1
MOVS	R1, #1
STRB	R1, [R2, #0]
;stm32f4xx_rtc.c,1040 :: 		RTC_DateStruct->RTC_Year = 0;
ADDS	R2, R0, #3
; RTC_DateStruct end address is: 0 (R0)
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_rtc.c,1041 :: 		}
L_end_RTC_DateStructInit:
BX	LR
; end of _RTC_DateStructInit
_RTC_GetDate:
;stm32f4xx_rtc.c,1053 :: 		void RTC_GetDate(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct)
; RTC_DateStruct start address is: 4 (R1)
; RTC_Format start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R4, R1
; RTC_DateStruct end address is: 4 (R1)
; RTC_Format end address is: 0 (R0)
; RTC_Format start address is: 0 (R0)
; RTC_DateStruct start address is: 16 (R4)
;stm32f4xx_rtc.c,1055 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rtc.c,1061 :: 		tmpreg = (uint32_t)(RTC->DR & RTC_DR_RESERVED_MASK);
MOVW	R2, #10244
MOVT	R2, #16384
LDR	R3, [R2, #0]
MOVW	R2, #65343
MOVT	R2, #255
AND	R2, R3, R2, LSL #0
; tmpreg start address is: 4 (R1)
MOV	R1, R2
;stm32f4xx_rtc.c,1064 :: 		RTC_DateStruct->RTC_Year = (uint8_t)((tmpreg & (RTC_DR_YT | RTC_DR_YU)) >> 16);
ADDS	R3, R4, #3
AND	R2, R2, #16711680
LSRS	R2, R2, #16
UXTB	R2, R2
STRB	R2, [R3, #0]
;stm32f4xx_rtc.c,1065 :: 		RTC_DateStruct->RTC_Month = (uint8_t)((tmpreg & (RTC_DR_MT | RTC_DR_MU)) >> 8);
ADDS	R3, R4, #1
AND	R2, R1, #7936
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;stm32f4xx_rtc.c,1066 :: 		RTC_DateStruct->RTC_Date = (uint8_t)(tmpreg & (RTC_DR_DT | RTC_DR_DU));
ADDS	R3, R4, #2
AND	R2, R1, #63
UXTB	R2, R2
STRB	R2, [R3, #0]
;stm32f4xx_rtc.c,1067 :: 		RTC_DateStruct->RTC_WeekDay = (uint8_t)((tmpreg & (RTC_DR_WDU)) >> 13);
AND	R2, R1, #57344
; tmpreg end address is: 4 (R1)
LSRS	R2, R2, #13
UXTB	R2, R2
STRB	R2, [R4, #0]
;stm32f4xx_rtc.c,1070 :: 		if (RTC_Format == RTC_Format_BIN)
CMP	R0, #0
IT	NE
BNE	L_RTC_GetDate92
; RTC_Format end address is: 0 (R0)
;stm32f4xx_rtc.c,1073 :: 		RTC_DateStruct->RTC_Year = (uint8_t)RTC_Bcd2ToByte(RTC_DateStruct->RTC_Year);
ADDS	R2, R4, #3
STR	R2, [SP, #4]
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R2, [SP, #4]
STRB	R0, [R2, #0]
;stm32f4xx_rtc.c,1074 :: 		RTC_DateStruct->RTC_Month = (uint8_t)RTC_Bcd2ToByte(RTC_DateStruct->RTC_Month);
ADDS	R2, R4, #1
STR	R2, [SP, #4]
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R2, [SP, #4]
STRB	R0, [R2, #0]
;stm32f4xx_rtc.c,1075 :: 		RTC_DateStruct->RTC_Date = (uint8_t)RTC_Bcd2ToByte(RTC_DateStruct->RTC_Date);
ADDS	R2, R4, #2
; RTC_DateStruct end address is: 16 (R4)
STR	R2, [SP, #4]
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R2, [SP, #4]
STRB	R0, [R2, #0]
;stm32f4xx_rtc.c,1076 :: 		}
L_RTC_GetDate92:
;stm32f4xx_rtc.c,1077 :: 		}
L_end_RTC_GetDate:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RTC_GetDate
_RTC_SetAlarm:
;stm32f4xx_rtc.c,1113 :: 		void RTC_SetAlarm(uint32_t RTC_Format, uint32_t RTC_Alarm, RTC_AlarmTypeDef* RTC_AlarmStruct)
; RTC_AlarmStruct start address is: 8 (R2)
; RTC_Alarm start address is: 4 (R1)
; RTC_Format start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R7, R0
MOV	R5, R1
MOV	R6, R2
; RTC_AlarmStruct end address is: 8 (R2)
; RTC_Alarm end address is: 4 (R1)
; RTC_Format end address is: 0 (R0)
; RTC_Format start address is: 28 (R7)
; RTC_Alarm start address is: 20 (R5)
; RTC_AlarmStruct start address is: 24 (R6)
;stm32f4xx_rtc.c,1115 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rtc.c,1123 :: 		if (RTC_Format == RTC_Format_BIN)
CMP	R7, #0
IT	NE
BNE	L_RTC_SetAlarm93
;stm32f4xx_rtc.c,1125 :: 		if ((RTC->CR & RTC_CR_FMT) != (uint32_t)RESET)
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R3, [R3, #0]
AND	R3, R3, #64
CMP	R3, #0
IT	EQ
BEQ	L_RTC_SetAlarm94
;stm32f4xx_rtc.c,1129 :: 		}
IT	AL
BAL	L_RTC_SetAlarm95
L_RTC_SetAlarm94:
;stm32f4xx_rtc.c,1132 :: 		RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = 0x00;
ADDS	R4, R6, #3
MOVS	R3, #0
STRB	R3, [R4, #0]
;stm32f4xx_rtc.c,1134 :: 		}
L_RTC_SetAlarm95:
;stm32f4xx_rtc.c,1138 :: 		if(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_Date)
ADDW	R3, R6, #8
LDR	R3, [R3, #0]
CMP	R3, #0
IT	NE
BNE	L_RTC_SetAlarm96
;stm32f4xx_rtc.c,1141 :: 		}
IT	AL
BAL	L_RTC_SetAlarm97
L_RTC_SetAlarm96:
;stm32f4xx_rtc.c,1145 :: 		}
L_RTC_SetAlarm97:
;stm32f4xx_rtc.c,1146 :: 		}
IT	AL
BAL	L_RTC_SetAlarm98
L_RTC_SetAlarm93:
;stm32f4xx_rtc.c,1149 :: 		if ((RTC->CR & RTC_CR_FMT) != (uint32_t)RESET)
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R3, [R3, #0]
AND	R3, R3, #64
CMP	R3, #0
IT	EQ
BEQ	L_RTC_SetAlarm99
;stm32f4xx_rtc.c,1151 :: 		tmpreg = RTC_Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
LDRB	R3, [R6, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
;stm32f4xx_rtc.c,1154 :: 		}
IT	AL
BAL	L_RTC_SetAlarm100
L_RTC_SetAlarm99:
;stm32f4xx_rtc.c,1157 :: 		RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = 0x00;
ADDS	R4, R6, #3
MOVS	R3, #0
STRB	R3, [R4, #0]
;stm32f4xx_rtc.c,1159 :: 		}
L_RTC_SetAlarm100:
;stm32f4xx_rtc.c,1164 :: 		if(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_Date)
ADDW	R3, R6, #8
LDR	R3, [R3, #0]
CMP	R3, #0
IT	NE
BNE	L_RTC_SetAlarm101
;stm32f4xx_rtc.c,1166 :: 		tmpreg = RTC_Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
ADDW	R3, R6, #12
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
;stm32f4xx_rtc.c,1168 :: 		}
IT	AL
BAL	L_RTC_SetAlarm102
L_RTC_SetAlarm101:
;stm32f4xx_rtc.c,1171 :: 		tmpreg = RTC_Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
ADDW	R3, R6, #12
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
;stm32f4xx_rtc.c,1173 :: 		}
L_RTC_SetAlarm102:
;stm32f4xx_rtc.c,1174 :: 		}
L_RTC_SetAlarm98:
;stm32f4xx_rtc.c,1177 :: 		if (RTC_Format != RTC_Format_BIN)
CMP	R7, #0
IT	EQ
BEQ	L_RTC_SetAlarm103
; RTC_Format end address is: 28 (R7)
;stm32f4xx_rtc.c,1185 :: 		((uint32_t)RTC_AlarmStruct->RTC_AlarmMask));
LDRB	R3, [R6, #0]
UXTB	R0, R3
LSLS	R0, R0, #16
ADDS	R3, R6, #1
LDRB	R3, [R3, #0]
LSLS	R3, R3, #8
ORRS	R0, R3
ADDS	R3, R6, #2
LDRB	R3, [R3, #0]
ORRS	R0, R3
ADDS	R3, R6, #3
LDRB	R3, [R3, #0]
LSLS	R3, R3, #16
ORRS	R0, R3
ADDW	R3, R6, #12
LDRB	R3, [R3, #0]
LSLS	R3, R3, #24
ORRS	R0, R3
ADDW	R3, R6, #8
LDR	R3, [R3, #0]
ORRS	R0, R3
ADDS	R3, R6, #4
; RTC_AlarmStruct end address is: 24 (R6)
LDR	R3, [R3, #0]
ORRS	R0, R3
; tmpreg start address is: 0 (R0)
;stm32f4xx_rtc.c,1186 :: 		}
; tmpreg end address is: 0 (R0)
IT	AL
BAL	L_RTC_SetAlarm104
L_RTC_SetAlarm103:
;stm32f4xx_rtc.c,1195 :: 		((uint32_t)RTC_AlarmStruct->RTC_AlarmMask));
; RTC_AlarmStruct start address is: 24 (R6)
LDRB	R3, [R6, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_ByteToBcd2+0
UXTB	R3, R0
LSLS	R3, R3, #16
STR	R3, [SP, #4]
ADDS	R3, R6, #1
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_ByteToBcd2+0
UXTB	R3, R0
LSLS	R4, R3, #8
LDR	R3, [SP, #4]
ORRS	R3, R4
STR	R3, [SP, #4]
ADDS	R3, R6, #2
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_ByteToBcd2+0
UXTB	R4, R0
LDR	R3, [SP, #4]
ORR	R4, R3, R4, LSL #0
ADDS	R3, R6, #3
LDRB	R3, [R3, #0]
LSLS	R3, R3, #16
ORR	R3, R4, R3, LSL #0
STR	R3, [SP, #4]
ADDW	R3, R6, #12
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_ByteToBcd2+0
UXTB	R3, R0
LSLS	R4, R3, #24
LDR	R3, [SP, #4]
ORR	R0, R3, R4, LSL #0
ADDW	R3, R6, #8
LDR	R3, [R3, #0]
ORRS	R0, R3
ADDS	R3, R6, #4
; RTC_AlarmStruct end address is: 24 (R6)
LDR	R3, [R3, #0]
ORRS	R0, R3
; tmpreg start address is: 0 (R0)
; tmpreg end address is: 0 (R0)
;stm32f4xx_rtc.c,1196 :: 		}
L_RTC_SetAlarm104:
;stm32f4xx_rtc.c,1199 :: 		RTC->WPR = 0xCA;
; tmpreg start address is: 0 (R0)
MOV	R3, #202
MOVW	R4, #10276
MOVT	R4, #16384
STR	R3, [R4, #0]
;stm32f4xx_rtc.c,1200 :: 		RTC->WPR = 0x53;
MOV	R3, #83
STR	R3, [R4, #0]
;stm32f4xx_rtc.c,1203 :: 		if (RTC_Alarm == RTC_Alarm_A)
CMP	R5, #256
IT	NE
BNE	L_RTC_SetAlarm105
; RTC_Alarm end address is: 20 (R5)
;stm32f4xx_rtc.c,1205 :: 		RTC->ALRMAR = (uint32_t)tmpreg;
MOVW	R3, #10268
MOVT	R3, #16384
STR	R0, [R3, #0]
; tmpreg end address is: 0 (R0)
;stm32f4xx_rtc.c,1206 :: 		}
IT	AL
BAL	L_RTC_SetAlarm106
L_RTC_SetAlarm105:
;stm32f4xx_rtc.c,1209 :: 		RTC->ALRMBR = (uint32_t)tmpreg;
; tmpreg start address is: 0 (R0)
MOVW	R3, #10272
MOVT	R3, #16384
STR	R0, [R3, #0]
; tmpreg end address is: 0 (R0)
;stm32f4xx_rtc.c,1210 :: 		}
L_RTC_SetAlarm106:
;stm32f4xx_rtc.c,1213 :: 		RTC->WPR = 0xFF;
MOV	R4, #255
MOVW	R3, #10276
MOVT	R3, #16384
STR	R4, [R3, #0]
;stm32f4xx_rtc.c,1214 :: 		}
L_end_RTC_SetAlarm:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RTC_SetAlarm
_RTC_AlarmStructInit:
;stm32f4xx_rtc.c,1224 :: 		void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
; RTC_AlarmStruct start address is: 0 (R0)
; RTC_AlarmStruct end address is: 0 (R0)
; RTC_AlarmStruct start address is: 0 (R0)
;stm32f4xx_rtc.c,1227 :: 		RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
ADDS	R2, R0, #3
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_rtc.c,1228 :: 		RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
MOVS	R1, #0
STRB	R1, [R0, #0]
;stm32f4xx_rtc.c,1229 :: 		RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
ADDS	R2, R0, #1
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_rtc.c,1230 :: 		RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
ADDS	R2, R0, #2
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_rtc.c,1233 :: 		RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1234 :: 		RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
ADDW	R2, R0, #12
MOVS	R1, #1
STRB	R1, [R2, #0]
;stm32f4xx_rtc.c,1237 :: 		RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_None;
ADDS	R2, R0, #4
; RTC_AlarmStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1238 :: 		}
L_end_RTC_AlarmStructInit:
BX	LR
; end of _RTC_AlarmStructInit
_RTC_GetAlarm:
;stm32f4xx_rtc.c,1254 :: 		void RTC_GetAlarm(uint32_t RTC_Format, uint32_t RTC_Alarm, RTC_AlarmTypeDef* RTC_AlarmStruct)
; RTC_AlarmStruct start address is: 8 (R2)
; RTC_Alarm start address is: 4 (R1)
; RTC_Format start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R5, R2
; RTC_AlarmStruct end address is: 8 (R2)
; RTC_Alarm end address is: 4 (R1)
; RTC_Format end address is: 0 (R0)
; RTC_Format start address is: 0 (R0)
; RTC_Alarm start address is: 4 (R1)
; RTC_AlarmStruct start address is: 20 (R5)
;stm32f4xx_rtc.c,1256 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rtc.c,1263 :: 		if (RTC_Alarm == RTC_Alarm_A)
CMP	R1, #256
IT	NE
BNE	L_RTC_GetAlarm107
; RTC_Alarm end address is: 4 (R1)
;stm32f4xx_rtc.c,1265 :: 		tmpreg = (uint32_t)(RTC->ALRMAR);
MOVW	R3, #10268
MOVT	R3, #16384
; tmpreg start address is: 4 (R1)
LDR	R1, [R3, #0]
;stm32f4xx_rtc.c,1266 :: 		}
; tmpreg end address is: 4 (R1)
IT	AL
BAL	L_RTC_GetAlarm108
L_RTC_GetAlarm107:
;stm32f4xx_rtc.c,1269 :: 		tmpreg = (uint32_t)(RTC->ALRMBR);
MOVW	R3, #10272
MOVT	R3, #16384
; tmpreg start address is: 4 (R1)
LDR	R1, [R3, #0]
; tmpreg end address is: 4 (R1)
;stm32f4xx_rtc.c,1270 :: 		}
L_RTC_GetAlarm108:
;stm32f4xx_rtc.c,1274 :: 		RTC_ALRMAR_HU)) >> 16);
; tmpreg start address is: 4 (R1)
AND	R3, R1, #4128768
LSRS	R3, R3, #16
STRB	R3, [R5, #0]
;stm32f4xx_rtc.c,1276 :: 		RTC_ALRMAR_MNU)) >> 8);
ADDS	R4, R5, #1
AND	R3, R1, #32512
LSRS	R3, R3, #8
STRB	R3, [R4, #0]
;stm32f4xx_rtc.c,1278 :: 		RTC_ALRMAR_SU));
ADDS	R4, R5, #2
AND	R3, R1, #127
STRB	R3, [R4, #0]
;stm32f4xx_rtc.c,1279 :: 		RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (uint32_t)((tmpreg & RTC_ALRMAR_PM) >> 16);
ADDS	R4, R5, #3
AND	R3, R1, #4194304
LSRS	R3, R3, #16
STRB	R3, [R4, #0]
;stm32f4xx_rtc.c,1280 :: 		RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint32_t)((tmpreg & (RTC_ALRMAR_DT | RTC_ALRMAR_DU)) >> 24);
ADDW	R4, R5, #12
AND	R3, R1, #1056964608
LSRS	R3, R3, #24
STRB	R3, [R4, #0]
;stm32f4xx_rtc.c,1281 :: 		RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (uint32_t)(tmpreg & RTC_ALRMAR_WDSEL);
ADDW	R4, R5, #8
AND	R3, R1, #1073741824
STR	R3, [R4, #0]
;stm32f4xx_rtc.c,1282 :: 		RTC_AlarmStruct->RTC_AlarmMask = (uint32_t)(tmpreg & RTC_AlarmMask_All);
ADDS	R4, R5, #4
AND	R3, R1, #-2139062144
; tmpreg end address is: 4 (R1)
STR	R3, [R4, #0]
;stm32f4xx_rtc.c,1284 :: 		if (RTC_Format == RTC_Format_BIN)
CMP	R0, #0
IT	NE
BNE	L_RTC_GetAlarm109
; RTC_Format end address is: 0 (R0)
;stm32f4xx_rtc.c,1287 :: 		RTC_AlarmTime.RTC_Hours);
MOV	R3, R5
STR	R3, [SP, #4]
LDRB	R3, [R5, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R3, [SP, #4]
STRB	R0, [R3, #0]
;stm32f4xx_rtc.c,1289 :: 		RTC_AlarmTime.RTC_Minutes);
ADDS	R3, R5, #1
STR	R3, [SP, #4]
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R3, [SP, #4]
STRB	R0, [R3, #0]
;stm32f4xx_rtc.c,1291 :: 		RTC_AlarmTime.RTC_Seconds);
ADDS	R3, R5, #2
STR	R3, [SP, #4]
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R3, [SP, #4]
STRB	R0, [R3, #0]
;stm32f4xx_rtc.c,1292 :: 		RTC_AlarmStruct->RTC_AlarmDateWeekDay = RTC_Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
ADDW	R3, R5, #12
; RTC_AlarmStruct end address is: 20 (R5)
STR	R3, [SP, #4]
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R3, [SP, #4]
STRB	R0, [R3, #0]
;stm32f4xx_rtc.c,1293 :: 		}
L_RTC_GetAlarm109:
;stm32f4xx_rtc.c,1294 :: 		}
L_end_RTC_GetAlarm:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RTC_GetAlarm
_RTC_AlarmCmd:
;stm32f4xx_rtc.c,1308 :: 		ErrorStatus RTC_AlarmCmd(uint32_t RTC_Alarm, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RTC_Alarm start address is: 0 (R0)
UXTB	R4, R1
; NewState end address is: 4 (R1)
; RTC_Alarm end address is: 0 (R0)
; RTC_Alarm start address is: 0 (R0)
; NewState start address is: 16 (R4)
;stm32f4xx_rtc.c,1310 :: 		__IO uint32_t alarmcounter = 0x00;
; alarmcounter start address is: 4 (R1)
MOV	R1, #0
;stm32f4xx_rtc.c,1311 :: 		uint32_t alarmstatus = 0x00;
;stm32f4xx_rtc.c,1312 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,1319 :: 		RTC->WPR = 0xCA;
MOV	R2, #202
MOVW	R3, #10276
MOVT	R3, #16384
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,1320 :: 		RTC->WPR = 0x53;
MOV	R2, #83
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,1323 :: 		if (NewState != DISABLE)
CMP	R4, #0
IT	EQ
BEQ	L_RTC_AlarmCmd110
; NewState end address is: 16 (R4)
; alarmcounter end address is: 4 (R1)
;stm32f4xx_rtc.c,1325 :: 		RTC->CR |= (uint32_t)RTC_Alarm;
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R2, [R3, #0]
ORRS	R2, R0
; RTC_Alarm end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,1327 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_rtc.c,1328 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_AlarmCmd111
L_RTC_AlarmCmd110:
;stm32f4xx_rtc.c,1332 :: 		RTC->CR &= (uint32_t)~RTC_Alarm;
; alarmcounter start address is: 4 (R1)
; RTC_Alarm start address is: 0 (R0)
MVN	R4, R0
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
; RTC_Alarm end address is: 0 (R0)
; alarmcounter end address is: 4 (R1)
;stm32f4xx_rtc.c,1335 :: 		do
L_RTC_AlarmCmd112:
;stm32f4xx_rtc.c,1337 :: 		alarmstatus = RTC->ISR & (RTC_Alarm >> 8);
; alarmcounter start address is: 4 (R1)
; RTC_Alarm start address is: 0 (R0)
LSRS	R3, R0, #8
MOVW	R2, #10252
MOVT	R2, #16384
LDR	R2, [R2, #0]
ANDS	R2, R3
; alarmstatus start address is: 12 (R3)
MOV	R3, R2
;stm32f4xx_rtc.c,1338 :: 		alarmcounter++;
ADDS	R2, R1, #1
MOV	R1, R2
;stm32f4xx_rtc.c,1339 :: 		} while((alarmcounter != INITMODE_TIMEOUT) && (alarmstatus == 0x00));
CMP	R1, #65536
IT	EQ
BEQ	L__RTC_AlarmCmd200
CMP	R3, #0
IT	NE
BNE	L__RTC_AlarmCmd199
; alarmstatus end address is: 12 (R3)
; alarmcounter end address is: 4 (R1)
IT	AL
BAL	L_RTC_AlarmCmd112
L__RTC_AlarmCmd200:
L__RTC_AlarmCmd199:
;stm32f4xx_rtc.c,1341 :: 		if ((RTC->ISR & (RTC_Alarm >> 8)) == RESET)
LSRS	R3, R0, #8
; RTC_Alarm end address is: 0 (R0)
MOVW	R2, #10252
MOVT	R2, #16384
LDR	R2, [R2, #0]
ANDS	R2, R3
CMP	R2, #0
IT	NE
BNE	L_RTC_AlarmCmd117
;stm32f4xx_rtc.c,1343 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,1344 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_AlarmCmd118
L_RTC_AlarmCmd117:
;stm32f4xx_rtc.c,1347 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1348 :: 		}
L_RTC_AlarmCmd118:
;stm32f4xx_rtc.c,1349 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
L_RTC_AlarmCmd111:
;stm32f4xx_rtc.c,1352 :: 		RTC->WPR = 0xFF;
; status start address is: 0 (R0)
MOV	R3, #255
MOVW	R2, #10276
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_rtc.c,1354 :: 		return status;
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1355 :: 		}
L_end_RTC_AlarmCmd:
BX	LR
; end of _RTC_AlarmCmd
_RTC_AlarmSubSecondConfig:
;stm32f4xx_rtc.c,1402 :: 		void RTC_AlarmSubSecondConfig(uint32_t RTC_Alarm, uint32_t RTC_AlarmSubSecondValue, uint32_t RTC_AlarmSubSecondMask)
; RTC_AlarmSubSecondMask start address is: 8 (R2)
; RTC_AlarmSubSecondValue start address is: 4 (R1)
; RTC_Alarm start address is: 0 (R0)
; RTC_AlarmSubSecondMask end address is: 8 (R2)
; RTC_AlarmSubSecondValue end address is: 4 (R1)
; RTC_Alarm end address is: 0 (R0)
; RTC_Alarm start address is: 0 (R0)
; RTC_AlarmSubSecondValue start address is: 4 (R1)
; RTC_AlarmSubSecondMask start address is: 8 (R2)
;stm32f4xx_rtc.c,1404 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rtc.c,1412 :: 		RTC->WPR = 0xCA;
MOV	R3, #202
MOVW	R4, #10276
MOVT	R4, #16384
STR	R3, [R4, #0]
;stm32f4xx_rtc.c,1413 :: 		RTC->WPR = 0x53;
MOV	R3, #83
STR	R3, [R4, #0]
;stm32f4xx_rtc.c,1416 :: 		tmpreg = (uint32_t) (uint32_t)(RTC_AlarmSubSecondValue) | (uint32_t)(RTC_AlarmSubSecondMask);
ORR	R3, R1, R2, LSL #0
; RTC_AlarmSubSecondValue end address is: 4 (R1)
; RTC_AlarmSubSecondMask end address is: 8 (R2)
; tmpreg start address is: 4 (R1)
MOV	R1, R3
;stm32f4xx_rtc.c,1418 :: 		if (RTC_Alarm == RTC_Alarm_A)
CMP	R0, #256
IT	NE
BNE	L_RTC_AlarmSubSecondConfig119
; RTC_Alarm end address is: 0 (R0)
;stm32f4xx_rtc.c,1421 :: 		RTC->ALRMASSR = tmpreg;
MOVW	R3, #10308
MOVT	R3, #16384
STR	R1, [R3, #0]
; tmpreg end address is: 4 (R1)
;stm32f4xx_rtc.c,1422 :: 		}
IT	AL
BAL	L_RTC_AlarmSubSecondConfig120
L_RTC_AlarmSubSecondConfig119:
;stm32f4xx_rtc.c,1426 :: 		RTC->ALRMBSSR = tmpreg;
; tmpreg start address is: 4 (R1)
MOVW	R3, #10312
MOVT	R3, #16384
STR	R1, [R3, #0]
; tmpreg end address is: 4 (R1)
;stm32f4xx_rtc.c,1427 :: 		}
L_RTC_AlarmSubSecondConfig120:
;stm32f4xx_rtc.c,1430 :: 		RTC->WPR = 0xFF;
MOV	R4, #255
MOVW	R3, #10276
MOVT	R3, #16384
STR	R4, [R3, #0]
;stm32f4xx_rtc.c,1432 :: 		}
L_end_RTC_AlarmSubSecondConfig:
BX	LR
; end of _RTC_AlarmSubSecondConfig
_RTC_GetAlarmSubSecond:
;stm32f4xx_rtc.c,1443 :: 		uint32_t RTC_GetAlarmSubSecond(uint32_t RTC_Alarm)
; RTC_Alarm start address is: 0 (R0)
; RTC_Alarm end address is: 0 (R0)
; RTC_Alarm start address is: 0 (R0)
;stm32f4xx_rtc.c,1445 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rtc.c,1448 :: 		if (RTC_Alarm == RTC_Alarm_A)
CMP	R0, #256
IT	NE
BNE	L_RTC_GetAlarmSubSecond121
; RTC_Alarm end address is: 0 (R0)
;stm32f4xx_rtc.c,1450 :: 		tmpreg = (uint32_t)((RTC->ALRMASSR) & RTC_ALRMASSR_SS);
MOVW	R1, #10308
MOVT	R1, #16384
LDR	R2, [R1, #0]
MOVW	R1, #32767
MOVT	R1, #0
AND	R0, R2, R1, LSL #0
; tmpreg start address is: 0 (R0)
;stm32f4xx_rtc.c,1451 :: 		}
; tmpreg end address is: 0 (R0)
IT	AL
BAL	L_RTC_GetAlarmSubSecond122
L_RTC_GetAlarmSubSecond121:
;stm32f4xx_rtc.c,1454 :: 		tmpreg = (uint32_t)((RTC->ALRMBSSR) & RTC_ALRMBSSR_SS);
MOVW	R1, #10312
MOVT	R1, #16384
LDR	R2, [R1, #0]
MOVW	R1, #32767
MOVT	R1, #0
AND	R0, R2, R1, LSL #0
; tmpreg start address is: 0 (R0)
; tmpreg end address is: 0 (R0)
;stm32f4xx_rtc.c,1455 :: 		}
L_RTC_GetAlarmSubSecond122:
;stm32f4xx_rtc.c,1457 :: 		return (tmpreg);
; tmpreg start address is: 0 (R0)
; tmpreg end address is: 0 (R0)
;stm32f4xx_rtc.c,1458 :: 		}
L_end_RTC_GetAlarmSubSecond:
BX	LR
; end of _RTC_GetAlarmSubSecond
_RTC_WakeUpClockConfig:
;stm32f4xx_rtc.c,1492 :: 		void RTC_WakeUpClockConfig(uint32_t RTC_WakeUpClock)
; RTC_WakeUpClock start address is: 0 (R0)
; RTC_WakeUpClock end address is: 0 (R0)
; RTC_WakeUpClock start address is: 0 (R0)
;stm32f4xx_rtc.c,1498 :: 		RTC->WPR = 0xCA;
MOV	R1, #202
MOVW	R4, #10276
MOVT	R4, #16384
STR	R1, [R4, #0]
;stm32f4xx_rtc.c,1499 :: 		RTC->WPR = 0x53;
MOV	R1, #83
STR	R1, [R4, #0]
;stm32f4xx_rtc.c,1502 :: 		RTC->CR &= (uint32_t)~RTC_CR_WUCKSEL;
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #7
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,1505 :: 		RTC->CR |= (uint32_t)RTC_WakeUpClock;
ORRS	R1, R0
; RTC_WakeUpClock end address is: 0 (R0)
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,1508 :: 		RTC->WPR = 0xFF;
MOV	R1, #255
STR	R1, [R4, #0]
;stm32f4xx_rtc.c,1509 :: 		}
L_end_RTC_WakeUpClockConfig:
BX	LR
; end of _RTC_WakeUpClockConfig
_RTC_SetWakeUpCounter:
;stm32f4xx_rtc.c,1519 :: 		void RTC_SetWakeUpCounter(uint32_t RTC_WakeUpCounter)
; RTC_WakeUpCounter start address is: 0 (R0)
; RTC_WakeUpCounter end address is: 0 (R0)
; RTC_WakeUpCounter start address is: 0 (R0)
;stm32f4xx_rtc.c,1525 :: 		RTC->WPR = 0xCA;
MOV	R1, #202
MOVW	R2, #10276
MOVT	R2, #16384
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1526 :: 		RTC->WPR = 0x53;
MOV	R1, #83
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1529 :: 		RTC->WUTR = (uint32_t)RTC_WakeUpCounter;
MOVW	R1, #10260
MOVT	R1, #16384
STR	R0, [R1, #0]
; RTC_WakeUpCounter end address is: 0 (R0)
;stm32f4xx_rtc.c,1532 :: 		RTC->WPR = 0xFF;
MOV	R1, #255
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1533 :: 		}
L_end_RTC_SetWakeUpCounter:
BX	LR
; end of _RTC_SetWakeUpCounter
_RTC_GetWakeUpCounter:
;stm32f4xx_rtc.c,1540 :: 		uint32_t RTC_GetWakeUpCounter(void)
;stm32f4xx_rtc.c,1543 :: 		return ((uint32_t)(RTC->WUTR & RTC_WUTR_WUT));
MOVW	R0, #10260
MOVT	R0, #16384
LDR	R1, [R0, #0]
MOVW	R0, #65535
MOVT	R0, #0
AND	R0, R1, R0, LSL #0
;stm32f4xx_rtc.c,1544 :: 		}
L_end_RTC_GetWakeUpCounter:
BX	LR
; end of _RTC_GetWakeUpCounter
_RTC_WakeUpCmd:
;stm32f4xx_rtc.c,1552 :: 		ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
UXTB	R3, R0
; NewState end address is: 0 (R0)
; NewState start address is: 12 (R3)
;stm32f4xx_rtc.c,1554 :: 		__IO uint32_t wutcounter = 0x00;
; wutcounter start address is: 0 (R0)
MOV	R0, #0
;stm32f4xx_rtc.c,1555 :: 		uint32_t wutwfstatus = 0x00;
;stm32f4xx_rtc.c,1556 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,1562 :: 		RTC->WPR = 0xCA;
MOV	R1, #202
MOVW	R2, #10276
MOVT	R2, #16384
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1563 :: 		RTC->WPR = 0x53;
MOV	R1, #83
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1565 :: 		if (NewState != DISABLE)
CMP	R3, #0
IT	EQ
BEQ	L_RTC_WakeUpCmd123
; NewState end address is: 12 (R3)
; wutcounter end address is: 0 (R0)
;stm32f4xx_rtc.c,1568 :: 		RTC->CR |= (uint32_t)RTC_CR_WUTE;
MOVW	R2, #10248
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORR	R1, R1, #1024
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1569 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_rtc.c,1570 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_WakeUpCmd124
L_RTC_WakeUpCmd123:
;stm32f4xx_rtc.c,1574 :: 		RTC->CR &= (uint32_t)~RTC_CR_WUTE;
; wutcounter start address is: 0 (R0)
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #1024
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
; wutcounter end address is: 0 (R0)
MOV	R2, R0
;stm32f4xx_rtc.c,1576 :: 		do
L_RTC_WakeUpCmd125:
;stm32f4xx_rtc.c,1578 :: 		wutwfstatus = RTC->ISR & RTC_ISR_WUTWF;
; wutcounter start address is: 8 (R2)
MOVW	R1, #10252
MOVT	R1, #16384
LDR	R1, [R1, #0]
AND	R1, R1, #4
; wutwfstatus start address is: 0 (R0)
MOV	R0, R1
;stm32f4xx_rtc.c,1579 :: 		wutcounter++;
ADDS	R1, R2, #1
MOV	R2, R1
;stm32f4xx_rtc.c,1580 :: 		} while((wutcounter != INITMODE_TIMEOUT) && (wutwfstatus == 0x00));
CMP	R2, #65536
IT	EQ
BEQ	L__RTC_WakeUpCmd203
CMP	R0, #0
IT	NE
BNE	L__RTC_WakeUpCmd202
; wutwfstatus end address is: 0 (R0)
; wutcounter end address is: 8 (R2)
IT	AL
BAL	L_RTC_WakeUpCmd125
L__RTC_WakeUpCmd203:
L__RTC_WakeUpCmd202:
;stm32f4xx_rtc.c,1582 :: 		if ((RTC->ISR & RTC_ISR_WUTWF) == RESET)
MOVW	R1, #10252
MOVT	R1, #16384
LDR	R1, [R1, #0]
AND	R1, R1, #4
CMP	R1, #0
IT	NE
BNE	L_RTC_WakeUpCmd130
;stm32f4xx_rtc.c,1584 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,1585 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_WakeUpCmd131
L_RTC_WakeUpCmd130:
;stm32f4xx_rtc.c,1588 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1589 :: 		}
L_RTC_WakeUpCmd131:
;stm32f4xx_rtc.c,1590 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
L_RTC_WakeUpCmd124:
;stm32f4xx_rtc.c,1593 :: 		RTC->WPR = 0xFF;
; status start address is: 0 (R0)
MOV	R2, #255
MOVW	R1, #10276
MOVT	R1, #16384
STR	R2, [R1, #0]
;stm32f4xx_rtc.c,1595 :: 		return status;
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1596 :: 		}
L_end_RTC_WakeUpCmd:
BX	LR
; end of _RTC_WakeUpCmd
_RTC_DayLightSavingConfig:
;stm32f4xx_rtc.c,1629 :: 		void RTC_DayLightSavingConfig(uint32_t RTC_DayLightSaving, uint32_t RTC_StoreOperation)
; RTC_StoreOperation start address is: 4 (R1)
; RTC_DayLightSaving start address is: 0 (R0)
; RTC_StoreOperation end address is: 4 (R1)
; RTC_DayLightSaving end address is: 0 (R0)
; RTC_DayLightSaving start address is: 0 (R0)
; RTC_StoreOperation start address is: 4 (R1)
;stm32f4xx_rtc.c,1636 :: 		RTC->WPR = 0xCA;
MOV	R2, #202
MOVW	R5, #10276
MOVT	R5, #16384
STR	R2, [R5, #0]
;stm32f4xx_rtc.c,1637 :: 		RTC->WPR = 0x53;
MOV	R2, #83
STR	R2, [R5, #0]
;stm32f4xx_rtc.c,1640 :: 		RTC->CR &= (uint32_t)~(RTC_CR_BCK);
MOVW	R4, #10248
MOVT	R4, #16384
LDR	R3, [R4, #0]
MVN	R2, #262144
ANDS	R3, R2
STR	R3, [R4, #0]
;stm32f4xx_rtc.c,1643 :: 		RTC->CR |= (uint32_t)(RTC_DayLightSaving | RTC_StoreOperation);
ORR	R2, R0, R1, LSL #0
; RTC_DayLightSaving end address is: 0 (R0)
; RTC_StoreOperation end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_rtc.c,1646 :: 		RTC->WPR = 0xFF;
MOV	R2, #255
STR	R2, [R5, #0]
;stm32f4xx_rtc.c,1647 :: 		}
L_end_RTC_DayLightSavingConfig:
BX	LR
; end of _RTC_DayLightSavingConfig
_RTC_GetStoreOperation:
;stm32f4xx_rtc.c,1656 :: 		uint32_t RTC_GetStoreOperation(void)
;stm32f4xx_rtc.c,1658 :: 		return (RTC->CR & RTC_CR_BCK);
MOVW	R0, #10248
MOVT	R0, #16384
LDR	R0, [R0, #0]
AND	R0, R0, #262144
;stm32f4xx_rtc.c,1659 :: 		}
L_end_RTC_GetStoreOperation:
BX	LR
; end of _RTC_GetStoreOperation
_RTC_OutputConfig:
;stm32f4xx_rtc.c,1695 :: 		void RTC_OutputConfig(uint32_t RTC_Output, uint32_t RTC_OutputPolarity)
; RTC_OutputPolarity start address is: 4 (R1)
; RTC_Output start address is: 0 (R0)
; RTC_OutputPolarity end address is: 4 (R1)
; RTC_Output end address is: 0 (R0)
; RTC_Output start address is: 0 (R0)
; RTC_OutputPolarity start address is: 4 (R1)
;stm32f4xx_rtc.c,1702 :: 		RTC->WPR = 0xCA;
MOV	R2, #202
MOVW	R5, #10276
MOVT	R5, #16384
STR	R2, [R5, #0]
;stm32f4xx_rtc.c,1703 :: 		RTC->WPR = 0x53;
MOV	R2, #83
STR	R2, [R5, #0]
;stm32f4xx_rtc.c,1706 :: 		RTC->CR &= (uint32_t)~(RTC_CR_OSEL | RTC_CR_POL);
MOVW	R4, #10248
MOVT	R4, #16384
LDR	R3, [R4, #0]
MVN	R2, #7340032
ANDS	R3, R2
STR	R3, [R4, #0]
;stm32f4xx_rtc.c,1709 :: 		RTC->CR |= (uint32_t)(RTC_Output | RTC_OutputPolarity);
ORR	R2, R0, R1, LSL #0
; RTC_Output end address is: 0 (R0)
; RTC_OutputPolarity end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_rtc.c,1712 :: 		RTC->WPR = 0xFF;
MOV	R2, #255
STR	R2, [R5, #0]
;stm32f4xx_rtc.c,1713 :: 		}
L_end_RTC_OutputConfig:
BX	LR
; end of _RTC_OutputConfig
_RTC_CoarseCalibConfig:
;stm32f4xx_rtc.c,1749 :: 		ErrorStatus RTC_CoarseCalibConfig(uint32_t RTC_CalibSign, uint32_t Value)
; Value start address is: 4 (R1)
; RTC_CalibSign start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
MOV	R5, R1
; Value end address is: 4 (R1)
; RTC_CalibSign end address is: 0 (R0)
; RTC_CalibSign start address is: 16 (R4)
; Value start address is: 20 (R5)
;stm32f4xx_rtc.c,1751 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,1758 :: 		RTC->WPR = 0xCA;
MOV	R2, #202
MOVW	R3, #10276
MOVT	R3, #16384
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,1759 :: 		RTC->WPR = 0x53;
MOV	R2, #83
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,1762 :: 		if (RTC_EnterInitMode() == ERROR)
BL	_RTC_EnterInitMode+0
CMP	R0, #0
IT	NE
BNE	L_RTC_CoarseCalibConfig132
; RTC_CalibSign end address is: 16 (R4)
; Value end address is: 20 (R5)
;stm32f4xx_rtc.c,1764 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,1765 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_CoarseCalibConfig133
L_RTC_CoarseCalibConfig132:
;stm32f4xx_rtc.c,1769 :: 		RTC->CALIBR = (uint32_t)(RTC_CalibSign | Value);
; Value start address is: 20 (R5)
; RTC_CalibSign start address is: 16 (R4)
ORR	R3, R4, R5, LSL #0
; RTC_CalibSign end address is: 16 (R4)
; Value end address is: 20 (R5)
MOVW	R2, #10264
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_rtc.c,1771 :: 		RTC_ExitInitMode();
BL	_RTC_ExitInitMode+0
;stm32f4xx_rtc.c,1773 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1774 :: 		}
L_RTC_CoarseCalibConfig133:
;stm32f4xx_rtc.c,1777 :: 		RTC->WPR = 0xFF;
; status start address is: 0 (R0)
MOV	R3, #255
MOVW	R2, #10276
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_rtc.c,1779 :: 		return status;
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1780 :: 		}
L_end_RTC_CoarseCalibConfig:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RTC_CoarseCalibConfig
_RTC_CoarseCalibCmd:
;stm32f4xx_rtc.c,1790 :: 		ErrorStatus RTC_CoarseCalibCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R3, R0
; NewState end address is: 0 (R0)
; NewState start address is: 12 (R3)
;stm32f4xx_rtc.c,1792 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,1798 :: 		RTC->WPR = 0xCA;
MOV	R1, #202
MOVW	R2, #10276
MOVT	R2, #16384
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1799 :: 		RTC->WPR = 0x53;
MOV	R1, #83
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1802 :: 		if (RTC_EnterInitMode() == ERROR)
BL	_RTC_EnterInitMode+0
CMP	R0, #0
IT	NE
BNE	L_RTC_CoarseCalibCmd134
; NewState end address is: 12 (R3)
;stm32f4xx_rtc.c,1804 :: 		status =  ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,1805 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_CoarseCalibCmd135
L_RTC_CoarseCalibCmd134:
;stm32f4xx_rtc.c,1808 :: 		if (NewState != DISABLE)
; NewState start address is: 12 (R3)
CMP	R3, #0
IT	EQ
BEQ	L_RTC_CoarseCalibCmd136
; NewState end address is: 12 (R3)
;stm32f4xx_rtc.c,1811 :: 		RTC->CR |= (uint32_t)RTC_CR_DCE;
MOVW	R2, #10248
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORR	R1, R1, #128
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1812 :: 		}
IT	AL
BAL	L_RTC_CoarseCalibCmd137
L_RTC_CoarseCalibCmd136:
;stm32f4xx_rtc.c,1816 :: 		RTC->CR &= (uint32_t)~RTC_CR_DCE;
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #128
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,1817 :: 		}
L_RTC_CoarseCalibCmd137:
;stm32f4xx_rtc.c,1819 :: 		RTC_ExitInitMode();
BL	_RTC_ExitInitMode+0
;stm32f4xx_rtc.c,1821 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1822 :: 		}
L_RTC_CoarseCalibCmd135:
;stm32f4xx_rtc.c,1825 :: 		RTC->WPR = 0xFF;
; status start address is: 0 (R0)
MOV	R2, #255
MOVW	R1, #10276
MOVT	R1, #16384
STR	R2, [R1, #0]
;stm32f4xx_rtc.c,1827 :: 		return status;
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1828 :: 		}
L_end_RTC_CoarseCalibCmd:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RTC_CoarseCalibCmd
_RTC_CalibOutputCmd:
;stm32f4xx_rtc.c,1836 :: 		void RTC_CalibOutputCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_rtc.c,1842 :: 		RTC->WPR = 0xCA;
MOV	R1, #202
MOVW	R2, #10276
MOVT	R2, #16384
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1843 :: 		RTC->WPR = 0x53;
MOV	R1, #83
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1845 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_RTC_CalibOutputCmd138
; NewState end address is: 0 (R0)
;stm32f4xx_rtc.c,1848 :: 		RTC->CR |= (uint32_t)RTC_CR_COE;
MOVW	R2, #10248
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORR	R1, R1, #8388608
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,1849 :: 		}
IT	AL
BAL	L_RTC_CalibOutputCmd139
L_RTC_CalibOutputCmd138:
;stm32f4xx_rtc.c,1853 :: 		RTC->CR &= (uint32_t)~RTC_CR_COE;
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #8388608
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,1854 :: 		}
L_RTC_CalibOutputCmd139:
;stm32f4xx_rtc.c,1857 :: 		RTC->WPR = 0xFF;
MOV	R2, #255
MOVW	R1, #10276
MOVT	R1, #16384
STR	R2, [R1, #0]
;stm32f4xx_rtc.c,1858 :: 		}
L_end_RTC_CalibOutputCmd:
BX	LR
; end of _RTC_CalibOutputCmd
_RTC_CalibOutputConfig:
;stm32f4xx_rtc.c,1868 :: 		void RTC_CalibOutputConfig(uint32_t RTC_CalibOutput)
; RTC_CalibOutput start address is: 0 (R0)
; RTC_CalibOutput end address is: 0 (R0)
; RTC_CalibOutput start address is: 0 (R0)
;stm32f4xx_rtc.c,1874 :: 		RTC->WPR = 0xCA;
MOV	R1, #202
MOVW	R4, #10276
MOVT	R4, #16384
STR	R1, [R4, #0]
;stm32f4xx_rtc.c,1875 :: 		RTC->WPR = 0x53;
MOV	R1, #83
STR	R1, [R4, #0]
;stm32f4xx_rtc.c,1878 :: 		RTC->CR &= (uint32_t)~(RTC_CR_COSEL);
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #524288
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,1881 :: 		RTC->CR |= (uint32_t)RTC_CalibOutput;
ORRS	R1, R0
; RTC_CalibOutput end address is: 0 (R0)
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,1884 :: 		RTC->WPR = 0xFF;
MOV	R1, #255
STR	R1, [R4, #0]
;stm32f4xx_rtc.c,1885 :: 		}
L_end_RTC_CalibOutputConfig:
BX	LR
; end of _RTC_CalibOutputConfig
_RTC_SmoothCalibConfig:
;stm32f4xx_rtc.c,1906 :: 		uint32_t RTC_SmouthCalibMinusPulsesValue)
; recalpfcount start address is: 8 (R2)
; RTC_SmoothCalibPlusPulses start address is: 4 (R1)
SUB	SP, SP, #8
;stm32f4xx_rtc.c,1909 :: 		uint32_t recalpfcount = 0;
;stm32f4xx_rtc.c,1906 :: 		uint32_t RTC_SmouthCalibMinusPulsesValue)
STR	R0, [SP, #0]
;stm32f4xx_rtc.c,1909 :: 		uint32_t recalpfcount = 0;
;stm32f4xx_rtc.c,1906 :: 		uint32_t RTC_SmouthCalibMinusPulsesValue)
STR	R2, [SP, #4]
; recalpfcount end address is: 8 (R2)
; RTC_SmoothCalibPlusPulses end address is: 4 (R1)
; RTC_SmoothCalibPlusPulses start address is: 4 (R1)
;stm32f4xx_rtc.c,1908 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,1909 :: 		uint32_t recalpfcount = 0;
; recalpfcount start address is: 8 (R2)
MOV	R2, #0
;stm32f4xx_rtc.c,1917 :: 		RTC->WPR = 0xCA;
MOV	R3, #202
MOVW	R4, #10276
MOVT	R4, #16384
STR	R3, [R4, #0]
;stm32f4xx_rtc.c,1918 :: 		RTC->WPR = 0x53;
MOV	R3, #83
STR	R3, [R4, #0]
;stm32f4xx_rtc.c,1921 :: 		if ((RTC->ISR & RTC_ISR_RECALPF) != RESET)
MOVW	R3, #10252
MOVT	R3, #16384
LDR	R3, [R3, #0]
AND	R3, R3, #65536
CMP	R3, #0
IT	EQ
BEQ	L__RTC_SmoothCalibConfig207
; RTC_SmoothCalibPlusPulses end address is: 4 (R1)
; recalpfcount end address is: 8 (R2)
MOV	R0, R2
MOV	R2, R1
;stm32f4xx_rtc.c,1924 :: 		while (((RTC->ISR & RTC_ISR_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
L_RTC_SmoothCalibConfig141:
; recalpfcount start address is: 0 (R0)
; RTC_SmoothCalibPlusPulses start address is: 8 (R2)
MOVW	R3, #10252
MOVT	R3, #16384
LDR	R3, [R3, #0]
AND	R3, R3, #65536
CMP	R3, #0
IT	EQ
BEQ	L__RTC_SmoothCalibConfig206
CMP	R0, #131072
IT	EQ
BEQ	L__RTC_SmoothCalibConfig205
L__RTC_SmoothCalibConfig204:
;stm32f4xx_rtc.c,1926 :: 		recalpfcount++;
ADDS	R3, R0, #1
; recalpfcount end address is: 0 (R0)
; recalpfcount start address is: 12 (R3)
;stm32f4xx_rtc.c,1927 :: 		}
; recalpfcount end address is: 12 (R3)
MOV	R0, R3
IT	AL
BAL	L_RTC_SmoothCalibConfig141
;stm32f4xx_rtc.c,1924 :: 		while (((RTC->ISR & RTC_ISR_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
L__RTC_SmoothCalibConfig206:
L__RTC_SmoothCalibConfig205:
;stm32f4xx_rtc.c,1928 :: 		}
MOV	R0, R2
IT	AL
BAL	L_RTC_SmoothCalibConfig140
; RTC_SmoothCalibPlusPulses end address is: 8 (R2)
L__RTC_SmoothCalibConfig207:
;stm32f4xx_rtc.c,1921 :: 		if ((RTC->ISR & RTC_ISR_RECALPF) != RESET)
MOV	R0, R1
;stm32f4xx_rtc.c,1928 :: 		}
L_RTC_SmoothCalibConfig140:
;stm32f4xx_rtc.c,1931 :: 		if ((RTC->ISR & RTC_ISR_RECALPF) == RESET)
; RTC_SmoothCalibPlusPulses start address is: 0 (R0)
MOVW	R3, #10252
MOVT	R3, #16384
LDR	R3, [R3, #0]
AND	R3, R3, #65536
CMP	R3, #0
IT	NE
BNE	L_RTC_SmoothCalibConfig145
;stm32f4xx_rtc.c,1934 :: 		RTC->CALR = (uint32_t)((uint32_t)RTC_SmoothCalibPeriod | (uint32_t)RTC_SmoothCalibPlusPulses | (uint32_t)RTC_SmouthCalibMinusPulsesValue);
LDR	R3, [SP, #0]
ORR	R4, R3, R0, LSL #0
; RTC_SmoothCalibPlusPulses end address is: 0 (R0)
LDR	R3, [SP, #4]
ORRS	R4, R3
MOVW	R3, #10300
MOVT	R3, #16384
STR	R4, [R3, #0]
;stm32f4xx_rtc.c,1936 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_rtc.c,1937 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_SmoothCalibConfig146
L_RTC_SmoothCalibConfig145:
;stm32f4xx_rtc.c,1940 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1941 :: 		}
L_RTC_SmoothCalibConfig146:
;stm32f4xx_rtc.c,1944 :: 		RTC->WPR = 0xFF;
; status start address is: 0 (R0)
MOV	R4, #255
MOVW	R3, #10276
MOVT	R3, #16384
STR	R4, [R3, #0]
;stm32f4xx_rtc.c,1946 :: 		return (ErrorStatus)(status);
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,1947 :: 		}
L_end_RTC_SmoothCalibConfig:
ADD	SP, SP, #8
BX	LR
; end of _RTC_SmoothCalibConfig
_RTC_TimeStampCmd:
;stm32f4xx_rtc.c,1980 :: 		void RTC_TimeStampCmd(uint32_t RTC_TimeStampEdge, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RTC_TimeStampEdge start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RTC_TimeStampEdge end address is: 0 (R0)
; RTC_TimeStampEdge start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rtc.c,1982 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rtc.c,1989 :: 		tmpreg = (uint32_t)(RTC->CR & (uint32_t)~(RTC_CR_TSEDGE | RTC_CR_TSE));
MOVW	R2, #10248
MOVT	R2, #16384
LDR	R3, [R2, #0]
MOVW	R2, #63479
MOVT	R2, #65535
AND	R2, R3, R2, LSL #0
; tmpreg start address is: 12 (R3)
MOV	R3, R2
;stm32f4xx_rtc.c,1992 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RTC_TimeStampCmd147
; NewState end address is: 4 (R1)
;stm32f4xx_rtc.c,1994 :: 		tmpreg |= (uint32_t)(RTC_TimeStampEdge | RTC_CR_TSE);
ORR	R2, R0, #2048
; RTC_TimeStampEdge end address is: 0 (R0)
ORR	R0, R3, R2, LSL #0
; tmpreg end address is: 12 (R3)
; tmpreg start address is: 0 (R0)
;stm32f4xx_rtc.c,1995 :: 		}
; tmpreg end address is: 0 (R0)
IT	AL
BAL	L_RTC_TimeStampCmd148
L_RTC_TimeStampCmd147:
;stm32f4xx_rtc.c,1998 :: 		tmpreg |= (uint32_t)(RTC_TimeStampEdge);
; tmpreg start address is: 12 (R3)
; RTC_TimeStampEdge start address is: 0 (R0)
ORR	R0, R3, R0, LSL #0
; RTC_TimeStampEdge end address is: 0 (R0)
; tmpreg end address is: 12 (R3)
; tmpreg start address is: 0 (R0)
; tmpreg end address is: 0 (R0)
;stm32f4xx_rtc.c,1999 :: 		}
L_RTC_TimeStampCmd148:
;stm32f4xx_rtc.c,2002 :: 		RTC->WPR = 0xCA;
; tmpreg start address is: 0 (R0)
MOV	R2, #202
MOVW	R3, #10276
MOVT	R3, #16384
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2003 :: 		RTC->WPR = 0x53;
MOV	R2, #83
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2006 :: 		RTC->CR = (uint32_t)tmpreg;
MOVW	R2, #10248
MOVT	R2, #16384
STR	R0, [R2, #0]
; tmpreg end address is: 0 (R0)
;stm32f4xx_rtc.c,2009 :: 		RTC->WPR = 0xFF;
MOV	R2, #255
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2010 :: 		}
L_end_RTC_TimeStampCmd:
BX	LR
; end of _RTC_TimeStampCmd
_RTC_GetTimeStamp:
;stm32f4xx_rtc.c,2025 :: 		RTC_DateTypeDef* RTC_StampDateStruct)
; RTC_StampDateStruct start address is: 8 (R2)
; RTC_StampTimeStruct start address is: 4 (R1)
; RTC_Format start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R6, R1
MOV	R7, R2
; RTC_StampDateStruct end address is: 8 (R2)
; RTC_StampTimeStruct end address is: 4 (R1)
; RTC_Format end address is: 0 (R0)
; RTC_Format start address is: 0 (R0)
; RTC_StampTimeStruct start address is: 24 (R6)
; RTC_StampDateStruct start address is: 28 (R7)
;stm32f4xx_rtc.c,2027 :: 		uint32_t tmptime = 0, tmpdate = 0;
;stm32f4xx_rtc.c,2033 :: 		tmptime = (uint32_t)(RTC->TSTR & RTC_TR_RESERVED_MASK);
MOVW	R3, #10288
MOVT	R3, #16384
LDR	R4, [R3, #0]
MOVW	R3, #32639
MOVT	R3, #127
AND	R5, R4, R3, LSL #0
; tmptime start address is: 4 (R1)
MOV	R1, R5
;stm32f4xx_rtc.c,2034 :: 		tmpdate = (uint32_t)(RTC->TSDR & RTC_DR_RESERVED_MASK);
MOVW	R3, #10292
MOVT	R3, #16384
LDR	R4, [R3, #0]
MOVW	R3, #65343
MOVT	R3, #255
AND	R3, R4, R3, LSL #0
; tmpdate start address is: 8 (R2)
MOV	R2, R3
;stm32f4xx_rtc.c,2037 :: 		RTC_StampTimeStruct->RTC_Hours = (uint8_t)((tmptime & (RTC_TR_HT | RTC_TR_HU)) >> 16);
AND	R3, R5, #4128768
LSRS	R3, R3, #16
UXTB	R3, R3
STRB	R3, [R6, #0]
;stm32f4xx_rtc.c,2038 :: 		RTC_StampTimeStruct->RTC_Minutes = (uint8_t)((tmptime & (RTC_TR_MNT | RTC_TR_MNU)) >> 8);
ADDS	R4, R6, #1
AND	R3, R1, #32512
LSRS	R3, R3, #8
UXTB	R3, R3
STRB	R3, [R4, #0]
;stm32f4xx_rtc.c,2039 :: 		RTC_StampTimeStruct->RTC_Seconds = (uint8_t)(tmptime & (RTC_TR_ST | RTC_TR_SU));
ADDS	R4, R6, #2
AND	R3, R1, #127
UXTB	R3, R3
STRB	R3, [R4, #0]
;stm32f4xx_rtc.c,2040 :: 		RTC_StampTimeStruct->RTC_H12 = (uint8_t)((tmptime & (RTC_TR_PM)) >> 16);
ADDS	R4, R6, #3
AND	R3, R1, #4194304
; tmptime end address is: 4 (R1)
LSRS	R3, R3, #16
UXTB	R3, R3
STRB	R3, [R4, #0]
;stm32f4xx_rtc.c,2043 :: 		RTC_StampDateStruct->RTC_Year = 0;
ADDS	R4, R7, #3
MOVS	R3, #0
STRB	R3, [R4, #0]
;stm32f4xx_rtc.c,2044 :: 		RTC_StampDateStruct->RTC_Month = (uint8_t)((tmpdate & (RTC_DR_MT | RTC_DR_MU)) >> 8);
ADDS	R4, R7, #1
AND	R3, R2, #7936
LSRS	R3, R3, #8
UXTB	R3, R3
STRB	R3, [R4, #0]
;stm32f4xx_rtc.c,2045 :: 		RTC_StampDateStruct->RTC_Date = (uint8_t)(tmpdate & (RTC_DR_DT | RTC_DR_DU));
ADDS	R4, R7, #2
AND	R3, R2, #63
UXTB	R3, R3
STRB	R3, [R4, #0]
;stm32f4xx_rtc.c,2046 :: 		RTC_StampDateStruct->RTC_WeekDay = (uint8_t)((tmpdate & (RTC_DR_WDU)) >> 13);
AND	R3, R2, #57344
; tmpdate end address is: 8 (R2)
LSRS	R3, R3, #13
UXTB	R3, R3
STRB	R3, [R7, #0]
;stm32f4xx_rtc.c,2049 :: 		if (RTC_Format == RTC_Format_BIN)
CMP	R0, #0
IT	NE
BNE	L_RTC_GetTimeStamp149
; RTC_Format end address is: 0 (R0)
;stm32f4xx_rtc.c,2052 :: 		RTC_StampTimeStruct->RTC_Hours = (uint8_t)RTC_Bcd2ToByte(RTC_StampTimeStruct->RTC_Hours);
MOV	R3, R6
STR	R3, [SP, #4]
LDRB	R3, [R6, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R3, [SP, #4]
STRB	R0, [R3, #0]
;stm32f4xx_rtc.c,2053 :: 		RTC_StampTimeStruct->RTC_Minutes = (uint8_t)RTC_Bcd2ToByte(RTC_StampTimeStruct->RTC_Minutes);
ADDS	R3, R6, #1
STR	R3, [SP, #4]
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R3, [SP, #4]
STRB	R0, [R3, #0]
;stm32f4xx_rtc.c,2054 :: 		RTC_StampTimeStruct->RTC_Seconds = (uint8_t)RTC_Bcd2ToByte(RTC_StampTimeStruct->RTC_Seconds);
ADDS	R3, R6, #2
; RTC_StampTimeStruct end address is: 24 (R6)
STR	R3, [SP, #4]
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R3, [SP, #4]
STRB	R0, [R3, #0]
;stm32f4xx_rtc.c,2057 :: 		RTC_StampDateStruct->RTC_Month = (uint8_t)RTC_Bcd2ToByte(RTC_StampDateStruct->RTC_Month);
ADDS	R3, R7, #1
STR	R3, [SP, #4]
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R3, [SP, #4]
STRB	R0, [R3, #0]
;stm32f4xx_rtc.c,2058 :: 		RTC_StampDateStruct->RTC_Date = (uint8_t)RTC_Bcd2ToByte(RTC_StampDateStruct->RTC_Date);
ADDS	R3, R7, #2
STR	R3, [SP, #4]
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R3, [SP, #4]
STRB	R0, [R3, #0]
;stm32f4xx_rtc.c,2059 :: 		RTC_StampDateStruct->RTC_WeekDay = (uint8_t)RTC_Bcd2ToByte(RTC_StampDateStruct->RTC_WeekDay);
MOV	R3, R7
STR	R3, [SP, #4]
LDRB	R3, [R7, #0]
; RTC_StampDateStruct end address is: 28 (R7)
UXTB	R0, R3
BL	stm32f4xx_rtc_RTC_Bcd2ToByte+0
LDR	R3, [SP, #4]
STRB	R0, [R3, #0]
;stm32f4xx_rtc.c,2060 :: 		}
L_RTC_GetTimeStamp149:
;stm32f4xx_rtc.c,2061 :: 		}
L_end_RTC_GetTimeStamp:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RTC_GetTimeStamp
_RTC_GetTimeStampSubSecond:
;stm32f4xx_rtc.c,2068 :: 		uint32_t RTC_GetTimeStampSubSecond(void)
;stm32f4xx_rtc.c,2071 :: 		return (uint32_t)(RTC->TSSSR);
MOVW	R0, #10296
MOVT	R0, #16384
LDR	R0, [R0, #0]
;stm32f4xx_rtc.c,2072 :: 		}
L_end_RTC_GetTimeStampSubSecond:
BX	LR
; end of _RTC_GetTimeStampSubSecond
_RTC_TamperTriggerConfig:
;stm32f4xx_rtc.c,2103 :: 		void RTC_TamperTriggerConfig(uint32_t RTC_Tamper, uint32_t RTC_TamperTrigger)
; RTC_TamperTrigger start address is: 4 (R1)
; RTC_Tamper start address is: 0 (R0)
; RTC_TamperTrigger end address is: 4 (R1)
; RTC_Tamper end address is: 0 (R0)
; RTC_Tamper start address is: 0 (R0)
; RTC_TamperTrigger start address is: 4 (R1)
;stm32f4xx_rtc.c,2109 :: 		if (RTC_TamperTrigger == RTC_TamperTrigger_RisingEdge)
CMP	R1, #0
IT	NE
BNE	L_RTC_TamperTriggerConfig150
; RTC_TamperTrigger end address is: 4 (R1)
;stm32f4xx_rtc.c,2112 :: 		RTC->TAFCR &= (uint32_t)((uint32_t)~(RTC_Tamper << 1));
LSLS	R2, R0, #1
; RTC_Tamper end address is: 0 (R0)
MVN	R4, R2
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2113 :: 		}
IT	AL
BAL	L_RTC_TamperTriggerConfig151
L_RTC_TamperTriggerConfig150:
;stm32f4xx_rtc.c,2117 :: 		RTC->TAFCR |= (uint32_t)(RTC_Tamper << 1);
; RTC_Tamper start address is: 0 (R0)
LSLS	R4, R0, #1
; RTC_Tamper end address is: 0 (R0)
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
ORRS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2118 :: 		}
L_RTC_TamperTriggerConfig151:
;stm32f4xx_rtc.c,2119 :: 		}
L_end_RTC_TamperTriggerConfig:
BX	LR
; end of _RTC_TamperTriggerConfig
_RTC_TamperCmd:
;stm32f4xx_rtc.c,2129 :: 		void RTC_TamperCmd(uint32_t RTC_Tamper, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RTC_Tamper start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RTC_Tamper end address is: 0 (R0)
; RTC_Tamper start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rtc.c,2135 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RTC_TamperCmd152
; NewState end address is: 4 (R1)
;stm32f4xx_rtc.c,2138 :: 		RTC->TAFCR |= (uint32_t)RTC_Tamper;
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
ORRS	R2, R0
; RTC_Tamper end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2139 :: 		}
IT	AL
BAL	L_RTC_TamperCmd153
L_RTC_TamperCmd152:
;stm32f4xx_rtc.c,2143 :: 		RTC->TAFCR &= (uint32_t)~RTC_Tamper;
; RTC_Tamper start address is: 0 (R0)
MVN	R4, R0
; RTC_Tamper end address is: 0 (R0)
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2144 :: 		}
L_RTC_TamperCmd153:
;stm32f4xx_rtc.c,2145 :: 		}
L_end_RTC_TamperCmd:
BX	LR
; end of _RTC_TamperCmd
_RTC_TamperFilterConfig:
;stm32f4xx_rtc.c,2160 :: 		void RTC_TamperFilterConfig(uint32_t RTC_TamperFilter)
; RTC_TamperFilter start address is: 0 (R0)
; RTC_TamperFilter end address is: 0 (R0)
; RTC_TamperFilter start address is: 0 (R0)
;stm32f4xx_rtc.c,2166 :: 		RTC->TAFCR &= (uint32_t)~(RTC_TAFCR_TAMPFLT);
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #6144
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2169 :: 		RTC->TAFCR |= (uint32_t)RTC_TamperFilter;
ORRS	R1, R0
; RTC_TamperFilter end address is: 0 (R0)
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2170 :: 		}
L_end_RTC_TamperFilterConfig:
BX	LR
; end of _RTC_TamperFilterConfig
_RTC_TamperSamplingFreqConfig:
;stm32f4xx_rtc.c,2194 :: 		void RTC_TamperSamplingFreqConfig(uint32_t RTC_TamperSamplingFreq)
; RTC_TamperSamplingFreq start address is: 0 (R0)
; RTC_TamperSamplingFreq end address is: 0 (R0)
; RTC_TamperSamplingFreq start address is: 0 (R0)
;stm32f4xx_rtc.c,2200 :: 		RTC->TAFCR &= (uint32_t)~(RTC_TAFCR_TAMPFREQ);
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #1792
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2203 :: 		RTC->TAFCR |= (uint32_t)RTC_TamperSamplingFreq;
ORRS	R1, R0
; RTC_TamperSamplingFreq end address is: 0 (R0)
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2204 :: 		}
L_end_RTC_TamperSamplingFreqConfig:
BX	LR
; end of _RTC_TamperSamplingFreqConfig
_RTC_TamperPinsPrechargeDuration:
;stm32f4xx_rtc.c,2217 :: 		void RTC_TamperPinsPrechargeDuration(uint32_t RTC_TamperPrechargeDuration)
; RTC_TamperPrechargeDuration start address is: 0 (R0)
; RTC_TamperPrechargeDuration end address is: 0 (R0)
; RTC_TamperPrechargeDuration start address is: 0 (R0)
;stm32f4xx_rtc.c,2223 :: 		RTC->TAFCR &= (uint32_t)~(RTC_TAFCR_TAMPPRCH);
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #24576
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2226 :: 		RTC->TAFCR |= (uint32_t)RTC_TamperPrechargeDuration;
ORRS	R1, R0
; RTC_TamperPrechargeDuration end address is: 0 (R0)
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2227 :: 		}
L_end_RTC_TamperPinsPrechargeDuration:
BX	LR
; end of _RTC_TamperPinsPrechargeDuration
_RTC_TimeStampOnTamperDetectionCmd:
;stm32f4xx_rtc.c,2237 :: 		void RTC_TimeStampOnTamperDetectionCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_rtc.c,2242 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_RTC_TimeStampOnTamperDetectionCmd154
; NewState end address is: 0 (R0)
;stm32f4xx_rtc.c,2245 :: 		RTC->TAFCR |= (uint32_t)RTC_TAFCR_TAMPTS;
MOVW	R2, #10304
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORR	R1, R1, #128
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,2246 :: 		}
IT	AL
BAL	L_RTC_TimeStampOnTamperDetectionCmd155
L_RTC_TimeStampOnTamperDetectionCmd154:
;stm32f4xx_rtc.c,2250 :: 		RTC->TAFCR &= (uint32_t)~RTC_TAFCR_TAMPTS;
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #128
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2251 :: 		}
L_RTC_TimeStampOnTamperDetectionCmd155:
;stm32f4xx_rtc.c,2252 :: 		}
L_end_RTC_TimeStampOnTamperDetectionCmd:
BX	LR
; end of _RTC_TimeStampOnTamperDetectionCmd
_RTC_TamperPullUpCmd:
;stm32f4xx_rtc.c,2260 :: 		void RTC_TamperPullUpCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_rtc.c,2265 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_RTC_TamperPullUpCmd156
; NewState end address is: 0 (R0)
;stm32f4xx_rtc.c,2268 :: 		RTC->TAFCR &= (uint32_t)~RTC_TAFCR_TAMPPUDIS;
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #32768
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2269 :: 		}
IT	AL
BAL	L_RTC_TamperPullUpCmd157
L_RTC_TamperPullUpCmd156:
;stm32f4xx_rtc.c,2273 :: 		RTC->TAFCR |= (uint32_t)RTC_TAFCR_TAMPPUDIS;
MOVW	R2, #10304
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORR	R1, R1, #32768
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,2274 :: 		}
L_RTC_TamperPullUpCmd157:
;stm32f4xx_rtc.c,2275 :: 		}
L_end_RTC_TamperPullUpCmd:
BX	LR
; end of _RTC_TamperPullUpCmd
_RTC_WriteBackupRegister:
;stm32f4xx_rtc.c,2301 :: 		void RTC_WriteBackupRegister(uint32_t RTC_BKP_DR, uint32_t Data)
; Data start address is: 4 (R1)
; RTC_BKP_DR start address is: 0 (R0)
; Data end address is: 4 (R1)
; RTC_BKP_DR end address is: 0 (R0)
; RTC_BKP_DR start address is: 0 (R0)
; Data start address is: 4 (R1)
;stm32f4xx_rtc.c,2303 :: 		__IO uint32_t tmp = 0;
;stm32f4xx_rtc.c,2308 :: 		tmp = RTC_BASE + 0x50;
; tmp start address is: 12 (R3)
MOVW	R3, #10320
MOVT	R3, #16384
;stm32f4xx_rtc.c,2309 :: 		tmp += (RTC_BKP_DR * 4);
LSLS	R2, R0, #2
; RTC_BKP_DR end address is: 0 (R0)
ADDS	R2, R3, R2
; tmp end address is: 12 (R3)
; tmp start address is: 0 (R0)
MOV	R0, R2
;stm32f4xx_rtc.c,2312 :: 		*(__IO uint32_t *)tmp = (uint32_t)Data;
MOV	R2, R0
; tmp end address is: 0 (R0)
STR	R1, [R2, #0]
; Data end address is: 4 (R1)
;stm32f4xx_rtc.c,2313 :: 		}
L_end_RTC_WriteBackupRegister:
BX	LR
; end of _RTC_WriteBackupRegister
_RTC_ReadBackupRegister:
;stm32f4xx_rtc.c,2322 :: 		uint32_t RTC_ReadBackupRegister(uint32_t RTC_BKP_DR)
; RTC_BKP_DR start address is: 0 (R0)
; RTC_BKP_DR end address is: 0 (R0)
; RTC_BKP_DR start address is: 0 (R0)
;stm32f4xx_rtc.c,2324 :: 		__IO uint32_t tmp = 0;
;stm32f4xx_rtc.c,2329 :: 		tmp = RTC_BASE + 0x50;
; tmp start address is: 8 (R2)
MOVW	R2, #10320
MOVT	R2, #16384
;stm32f4xx_rtc.c,2330 :: 		tmp += (RTC_BKP_DR * 4);
LSLS	R1, R0, #2
; RTC_BKP_DR end address is: 0 (R0)
ADDS	R1, R2, R1
; tmp end address is: 8 (R2)
; tmp start address is: 0 (R0)
MOV	R0, R1
;stm32f4xx_rtc.c,2333 :: 		return (*(__IO uint32_t *)tmp);
MOV	R1, R0
; tmp end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
;stm32f4xx_rtc.c,2334 :: 		}
L_end_RTC_ReadBackupRegister:
BX	LR
; end of _RTC_ReadBackupRegister
_RTC_TamperPinSelection:
;stm32f4xx_rtc.c,2362 :: 		void RTC_TamperPinSelection(uint32_t RTC_TamperPin)
; RTC_TamperPin start address is: 0 (R0)
; RTC_TamperPin end address is: 0 (R0)
; RTC_TamperPin start address is: 0 (R0)
;stm32f4xx_rtc.c,2367 :: 		RTC->TAFCR &= (uint32_t)~(RTC_TAFCR_TAMPINSEL);
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #65536
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2368 :: 		RTC->TAFCR |= (uint32_t)(RTC_TamperPin);
ORRS	R1, R0
; RTC_TamperPin end address is: 0 (R0)
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2369 :: 		}
L_end_RTC_TamperPinSelection:
BX	LR
; end of _RTC_TamperPinSelection
_RTC_TimeStampPinSelection:
;stm32f4xx_rtc.c,2379 :: 		void RTC_TimeStampPinSelection(uint32_t RTC_TimeStampPin)
; RTC_TimeStampPin start address is: 0 (R0)
; RTC_TimeStampPin end address is: 0 (R0)
; RTC_TimeStampPin start address is: 0 (R0)
;stm32f4xx_rtc.c,2384 :: 		RTC->TAFCR &= (uint32_t)~(RTC_TAFCR_TSINSEL);
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #131072
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2385 :: 		RTC->TAFCR |= (uint32_t)(RTC_TimeStampPin);
ORRS	R1, R0
; RTC_TimeStampPin end address is: 0 (R0)
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2386 :: 		}
L_end_RTC_TimeStampPinSelection:
BX	LR
; end of _RTC_TimeStampPinSelection
_RTC_OutputTypeConfig:
;stm32f4xx_rtc.c,2398 :: 		void RTC_OutputTypeConfig(uint32_t RTC_OutputType)
; RTC_OutputType start address is: 0 (R0)
; RTC_OutputType end address is: 0 (R0)
; RTC_OutputType start address is: 0 (R0)
;stm32f4xx_rtc.c,2403 :: 		RTC->TAFCR &= (uint32_t)~(RTC_TAFCR_ALARMOUTTYPE);
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #262144
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2404 :: 		RTC->TAFCR |= (uint32_t)(RTC_OutputType);
ORRS	R1, R0
; RTC_OutputType end address is: 0 (R0)
STR	R1, [R3, #0]
;stm32f4xx_rtc.c,2405 :: 		}
L_end_RTC_OutputTypeConfig:
BX	LR
; end of _RTC_OutputTypeConfig
_RTC_SynchroShiftConfig:
;stm32f4xx_rtc.c,2436 :: 		ErrorStatus RTC_SynchroShiftConfig(uint32_t RTC_ShiftAdd1S, uint32_t RTC_ShiftSubFS)
; RTC_ShiftSubFS start address is: 4 (R1)
; RTC_ShiftAdd1S start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; RTC_ShiftSubFS end address is: 4 (R1)
; RTC_ShiftAdd1S end address is: 0 (R0)
; RTC_ShiftAdd1S start address is: 0 (R0)
; RTC_ShiftSubFS start address is: 4 (R1)
;stm32f4xx_rtc.c,2438 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rtc.c,2439 :: 		uint32_t shpfcount = 0;
; shpfcount start address is: 16 (R4)
MOV	R4, #0
;stm32f4xx_rtc.c,2446 :: 		RTC->WPR = 0xCA;
MOV	R2, #202
MOVW	R3, #10276
MOVT	R3, #16384
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2447 :: 		RTC->WPR = 0x53;
MOV	R2, #83
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2450 :: 		if ((RTC->ISR & RTC_ISR_SHPF) != RESET)
MOVW	R2, #10252
MOVT	R2, #16384
LDR	R2, [R2, #0]
AND	R2, R2, #8
CMP	R2, #0
IT	EQ
BEQ	L__RTC_SynchroShiftConfig211
; shpfcount end address is: 16 (R4)
; RTC_ShiftSubFS end address is: 4 (R1)
; RTC_ShiftAdd1S end address is: 0 (R0)
MOV	R3, R4
;stm32f4xx_rtc.c,2453 :: 		while (((RTC->ISR & RTC_ISR_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
L_RTC_SynchroShiftConfig159:
; shpfcount start address is: 12 (R3)
; RTC_ShiftSubFS start address is: 4 (R1)
; RTC_ShiftAdd1S start address is: 0 (R0)
MOVW	R2, #10252
MOVT	R2, #16384
LDR	R2, [R2, #0]
AND	R2, R2, #8
CMP	R2, #0
IT	EQ
BEQ	L__RTC_SynchroShiftConfig210
CMP	R3, #4096
IT	EQ
BEQ	L__RTC_SynchroShiftConfig209
L__RTC_SynchroShiftConfig208:
;stm32f4xx_rtc.c,2455 :: 		shpfcount++;
ADDS	R3, R3, #1
;stm32f4xx_rtc.c,2456 :: 		}
; shpfcount end address is: 12 (R3)
IT	AL
BAL	L_RTC_SynchroShiftConfig159
;stm32f4xx_rtc.c,2453 :: 		while (((RTC->ISR & RTC_ISR_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
L__RTC_SynchroShiftConfig210:
L__RTC_SynchroShiftConfig209:
;stm32f4xx_rtc.c,2457 :: 		}
STR	R1, [SP, #4]
; RTC_ShiftAdd1S end address is: 0 (R0)
MOV	R1, R0
LDR	R0, [SP, #4]
IT	AL
BAL	L_RTC_SynchroShiftConfig158
; RTC_ShiftSubFS end address is: 4 (R1)
L__RTC_SynchroShiftConfig211:
;stm32f4xx_rtc.c,2450 :: 		if ((RTC->ISR & RTC_ISR_SHPF) != RESET)
STR	R0, [SP, #4]
MOV	R0, R1
LDR	R1, [SP, #4]
;stm32f4xx_rtc.c,2457 :: 		}
L_RTC_SynchroShiftConfig158:
;stm32f4xx_rtc.c,2460 :: 		if ((RTC->ISR & RTC_ISR_SHPF) == RESET)
; RTC_ShiftSubFS start address is: 0 (R0)
; RTC_ShiftAdd1S start address is: 4 (R1)
MOVW	R2, #10252
MOVT	R2, #16384
LDR	R2, [R2, #0]
AND	R2, R2, #8
CMP	R2, #0
IT	NE
BNE	L_RTC_SynchroShiftConfig163
;stm32f4xx_rtc.c,2463 :: 		if((RTC->CR & RTC_CR_REFCKON) == RESET)
MOVW	R2, #10248
MOVT	R2, #16384
LDR	R2, [R2, #0]
AND	R2, R2, #16
CMP	R2, #0
IT	NE
BNE	L_RTC_SynchroShiftConfig164
;stm32f4xx_rtc.c,2466 :: 		RTC->SHIFTR = (uint32_t)(uint32_t)(RTC_ShiftSubFS) | (uint32_t)(RTC_ShiftAdd1S);
ORR	R3, R0, R1, LSL #0
; RTC_ShiftSubFS end address is: 0 (R0)
; RTC_ShiftAdd1S end address is: 4 (R1)
MOVW	R2, #10284
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_rtc.c,2468 :: 		if(RTC_WaitForSynchro() == ERROR)
BL	_RTC_WaitForSynchro+0
CMP	R0, #0
IT	NE
BNE	L_RTC_SynchroShiftConfig165
;stm32f4xx_rtc.c,2470 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_rtc.c,2471 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_SynchroShiftConfig166
L_RTC_SynchroShiftConfig165:
;stm32f4xx_rtc.c,2474 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,2475 :: 		}
L_RTC_SynchroShiftConfig166:
;stm32f4xx_rtc.c,2476 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_SynchroShiftConfig167
L_RTC_SynchroShiftConfig164:
;stm32f4xx_rtc.c,2479 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,2480 :: 		}
L_RTC_SynchroShiftConfig167:
;stm32f4xx_rtc.c,2481 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_RTC_SynchroShiftConfig168
L_RTC_SynchroShiftConfig163:
;stm32f4xx_rtc.c,2484 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,2485 :: 		}
L_RTC_SynchroShiftConfig168:
;stm32f4xx_rtc.c,2488 :: 		RTC->WPR = 0xFF;
; status start address is: 0 (R0)
MOV	R3, #255
MOVW	R2, #10276
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_rtc.c,2490 :: 		return (ErrorStatus)(status);
; status end address is: 0 (R0)
;stm32f4xx_rtc.c,2491 :: 		}
L_end_RTC_SynchroShiftConfig:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RTC_SynchroShiftConfig
_RTC_ITConfig:
;stm32f4xx_rtc.c,2555 :: 		void RTC_ITConfig(uint32_t RTC_IT, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RTC_IT start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RTC_IT end address is: 0 (R0)
; RTC_IT start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rtc.c,2562 :: 		RTC->WPR = 0xCA;
MOV	R2, #202
MOVW	R3, #10276
MOVT	R3, #16384
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2563 :: 		RTC->WPR = 0x53;
MOV	R2, #83
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2565 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RTC_ITConfig169
; NewState end address is: 4 (R1)
;stm32f4xx_rtc.c,2568 :: 		RTC->CR |= (uint32_t)(RTC_IT & ~RTC_TAFCR_TAMPIE);
MVN	R2, #4
AND	R4, R0, R2, LSL #0
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R2, [R3, #0]
ORRS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2570 :: 		RTC->TAFCR |= (uint32_t)(RTC_IT & RTC_TAFCR_TAMPIE);
AND	R4, R0, #4
; RTC_IT end address is: 0 (R0)
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
ORRS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2571 :: 		}
IT	AL
BAL	L_RTC_ITConfig170
L_RTC_ITConfig169:
;stm32f4xx_rtc.c,2575 :: 		RTC->CR &= (uint32_t)~(RTC_IT & (uint32_t)~RTC_TAFCR_TAMPIE);
; RTC_IT start address is: 0 (R0)
MVN	R2, #4
AND	R2, R0, R2, LSL #0
MVN	R4, R2
MOVW	R3, #10248
MOVT	R3, #16384
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2577 :: 		RTC->TAFCR &= (uint32_t)~(RTC_IT & RTC_TAFCR_TAMPIE);
AND	R2, R0, #4
; RTC_IT end address is: 0 (R0)
MVN	R4, R2
MOVW	R3, #10304
MOVT	R3, #16384
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rtc.c,2578 :: 		}
L_RTC_ITConfig170:
;stm32f4xx_rtc.c,2580 :: 		RTC->WPR = 0xFF;
MOV	R3, #255
MOVW	R2, #10276
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_rtc.c,2581 :: 		}
L_end_RTC_ITConfig:
BX	LR
; end of _RTC_ITConfig
_RTC_GetFlagStatus:
;stm32f4xx_rtc.c,2603 :: 		FlagStatus RTC_GetFlagStatus(uint32_t RTC_FLAG)
; RTC_FLAG start address is: 0 (R0)
; RTC_FLAG end address is: 0 (R0)
; RTC_FLAG start address is: 0 (R0)
;stm32f4xx_rtc.c,2605 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_rtc.c,2606 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rtc.c,2612 :: 		tmpreg = (uint32_t)(RTC->ISR & RTC_FLAGS_MASK);
MOVW	R1, #10252
MOVT	R1, #16384
LDR	R2, [R1, #0]
MOVW	R1, #16255
MOVT	R1, #1
AND	R1, R2, R1, LSL #0
;stm32f4xx_rtc.c,2615 :: 		if ((tmpreg & RTC_FLAG) != (uint32_t)RESET)
ANDS	R1, R0
; RTC_FLAG end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_RTC_GetFlagStatus171
;stm32f4xx_rtc.c,2617 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_rtc.c,2618 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_RTC_GetFlagStatus172
L_RTC_GetFlagStatus171:
;stm32f4xx_rtc.c,2621 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_rtc.c,2622 :: 		}
L_RTC_GetFlagStatus172:
;stm32f4xx_rtc.c,2623 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_rtc.c,2624 :: 		}
L_end_RTC_GetFlagStatus:
BX	LR
; end of _RTC_GetFlagStatus
_RTC_ClearFlag:
;stm32f4xx_rtc.c,2639 :: 		void RTC_ClearFlag(uint32_t RTC_FLAG)
; RTC_FLAG start address is: 0 (R0)
; RTC_FLAG end address is: 0 (R0)
; RTC_FLAG start address is: 0 (R0)
;stm32f4xx_rtc.c,2645 :: 		RTC->ISR = (uint32_t)((uint32_t)(~((RTC_FLAG | RTC_ISR_INIT)& 0x0000FFFF) | (uint32_t)(RTC->ISR & RTC_ISR_INIT)));
ORR	R2, R0, #128
; RTC_FLAG end address is: 0 (R0)
MOVW	R1, #65535
MOVT	R1, #0
AND	R1, R2, R1, LSL #0
MVN	R3, R1
MOVW	R2, #10252
MOVT	R2, #16384
LDR	R1, [R2, #0]
AND	R1, R1, #128
ORR	R1, R3, R1, LSL #0
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,2646 :: 		}
L_end_RTC_ClearFlag:
BX	LR
; end of _RTC_ClearFlag
_RTC_GetITStatus:
;stm32f4xx_rtc.c,2659 :: 		ITStatus RTC_GetITStatus(uint32_t RTC_IT)
; RTC_IT start address is: 0 (R0)
; RTC_IT end address is: 0 (R0)
; RTC_IT start address is: 0 (R0)
;stm32f4xx_rtc.c,2661 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_rtc.c,2662 :: 		uint32_t tmpreg = 0, enablestatus = 0;
;stm32f4xx_rtc.c,2668 :: 		tmpreg = (uint32_t)(RTC->TAFCR & (RTC_TAFCR_TAMPIE));
MOVW	R1, #10304
MOVT	R1, #16384
LDR	R1, [R1, #0]
AND	R3, R1, #4
;stm32f4xx_rtc.c,2671 :: 		enablestatus = (uint32_t)((RTC->CR & RTC_IT) | (tmpreg & (RTC_IT >> 15)));
MOVW	R1, #10248
MOVT	R1, #16384
LDR	R1, [R1, #0]
AND	R2, R1, R0, LSL #0
LSRS	R1, R0, #15
AND	R1, R3, R1, LSL #0
ORR	R3, R2, R1, LSL #0
;stm32f4xx_rtc.c,2674 :: 		tmpreg = (uint32_t)((RTC->ISR & (uint32_t)(RTC_IT >> 4)));
LSRS	R2, R0, #4
; RTC_IT end address is: 0 (R0)
MOVW	R1, #10252
MOVT	R1, #16384
LDR	R1, [R1, #0]
ANDS	R1, R2
; tmpreg start address is: 0 (R0)
MOV	R0, R1
;stm32f4xx_rtc.c,2677 :: 		if ((enablestatus != (uint32_t)RESET) && ((tmpreg & 0x0000FFFF) != (uint32_t)RESET))
CMP	R3, #0
IT	EQ
BEQ	L__RTC_GetITStatus214
MOVW	R1, #65535
MOVT	R1, #0
AND	R1, R0, R1, LSL #0
; tmpreg end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L__RTC_GetITStatus213
L__RTC_GetITStatus212:
;stm32f4xx_rtc.c,2679 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_rtc.c,2680 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_RTC_GetITStatus176
;stm32f4xx_rtc.c,2677 :: 		if ((enablestatus != (uint32_t)RESET) && ((tmpreg & 0x0000FFFF) != (uint32_t)RESET))
L__RTC_GetITStatus214:
L__RTC_GetITStatus213:
;stm32f4xx_rtc.c,2683 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_rtc.c,2684 :: 		}
L_RTC_GetITStatus176:
;stm32f4xx_rtc.c,2685 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_rtc.c,2686 :: 		}
L_end_RTC_GetITStatus:
BX	LR
; end of _RTC_GetITStatus
_RTC_ClearITPendingBit:
;stm32f4xx_rtc.c,2699 :: 		void RTC_ClearITPendingBit(uint32_t RTC_IT)
; RTC_IT start address is: 0 (R0)
; RTC_IT end address is: 0 (R0)
; RTC_IT start address is: 0 (R0)
;stm32f4xx_rtc.c,2701 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rtc.c,2707 :: 		tmpreg = (uint32_t)(RTC_IT >> 4);
LSRS	R1, R0, #4
; RTC_IT end address is: 0 (R0)
;stm32f4xx_rtc.c,2710 :: 		RTC->ISR = (uint32_t)((uint32_t)(~((tmpreg | RTC_ISR_INIT)& 0x0000FFFF) | (uint32_t)(RTC->ISR & RTC_ISR_INIT)));
ORR	R2, R1, #128
MOVW	R1, #65535
MOVT	R1, #0
AND	R1, R2, R1, LSL #0
MVN	R3, R1
MOVW	R2, #10252
MOVT	R2, #16384
LDR	R1, [R2, #0]
AND	R1, R1, #128
ORR	R1, R3, R1, LSL #0
STR	R1, [R2, #0]
;stm32f4xx_rtc.c,2711 :: 		}
L_end_RTC_ClearITPendingBit:
BX	LR
; end of _RTC_ClearITPendingBit
stm32f4xx_rtc_RTC_ByteToBcd2:
;stm32f4xx_rtc.c,2722 :: 		static uint8_t RTC_ByteToBcd2(uint8_t Value)
; Value start address is: 0 (R0)
; Value end address is: 0 (R0)
; Value start address is: 0 (R0)
;stm32f4xx_rtc.c,2724 :: 		uint8_t bcdhigh = 0;
; bcdhigh start address is: 8 (R2)
MOVS	R2, #0
; bcdhigh end address is: 8 (R2)
; Value end address is: 0 (R0)
;stm32f4xx_rtc.c,2726 :: 		while (Value >= 10)
L_stm32f4xx_rtc_RTC_ByteToBcd2177:
; bcdhigh start address is: 8 (R2)
; Value start address is: 0 (R0)
CMP	R0, #10
IT	LT
BLT	L_stm32f4xx_rtc_RTC_ByteToBcd2178
;stm32f4xx_rtc.c,2728 :: 		bcdhigh++;
ADDS	R2, R2, #1
UXTB	R2, R2
;stm32f4xx_rtc.c,2729 :: 		Value -= 10;
SUBW	R1, R0, #10
UXTB	R0, R1
;stm32f4xx_rtc.c,2730 :: 		}
IT	AL
BAL	L_stm32f4xx_rtc_RTC_ByteToBcd2177
L_stm32f4xx_rtc_RTC_ByteToBcd2178:
;stm32f4xx_rtc.c,2732 :: 		return  ((uint8_t)(bcdhigh << 4) | Value);
LSLS	R1, R2, #4
; bcdhigh end address is: 8 (R2)
UXTB	R1, R1
ORRS	R1, R0
; Value end address is: 0 (R0)
UXTB	R0, R1
;stm32f4xx_rtc.c,2733 :: 		}
L_end_RTC_ByteToBcd2:
BX	LR
; end of stm32f4xx_rtc_RTC_ByteToBcd2
stm32f4xx_rtc_RTC_Bcd2ToByte:
;stm32f4xx_rtc.c,2740 :: 		static uint8_t RTC_Bcd2ToByte(uint8_t Value)
; Value start address is: 0 (R0)
; Value end address is: 0 (R0)
; Value start address is: 0 (R0)
;stm32f4xx_rtc.c,2742 :: 		uint8_t tmp = 0;
;stm32f4xx_rtc.c,2743 :: 		tmp = ((uint8_t)(Value & (uint8_t)0xF0) >> (uint8_t)0x4) * 10;
AND	R1, R0, #240
UXTB	R1, R1
LSRS	R2, R1, #4
UXTB	R2, R2
MOV	R1, #10
MULS	R1, R2, R1
;stm32f4xx_rtc.c,2744 :: 		return (tmp + (Value & (uint8_t)0x0F));
AND	R2, R0, #15
UXTB	R2, R2
; Value end address is: 0 (R0)
UXTB	R1, R1
ADDS	R1, R1, R2
UXTB	R0, R1
;stm32f4xx_rtc.c,2745 :: 		}
L_end_RTC_Bcd2ToByte:
BX	LR
; end of stm32f4xx_rtc_RTC_Bcd2ToByte
