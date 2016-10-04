stm32f4xx_cryp___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_cryp___DSB
stm32f4xx_cryp___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_cryp___WFI
stm32f4xx_cryp___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_cryp___WFE
stm32f4xx_cryp___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_cryp___REV
stm32f4xx_cryp_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_cryp_NVIC_SetPriorityGrouping
stm32f4xx_cryp_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_cryp_NVIC_GetPriorityGrouping
stm32f4xx_cryp_NVIC_EnableIRQ:
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
; end of stm32f4xx_cryp_NVIC_EnableIRQ
stm32f4xx_cryp_NVIC_DisableIRQ:
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
; end of stm32f4xx_cryp_NVIC_DisableIRQ
stm32f4xx_cryp_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_cryp_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_cryp_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_cryp_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_cryp_NVIC_GetPendingIRQ1
L_stm32f4xx_cryp_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_cryp_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_cryp_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_cryp_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_cryp_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_cryp_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_cryp_NVIC_GetPendingIRQ
stm32f4xx_cryp_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_cryp_NVIC_SetPendingIRQ
stm32f4xx_cryp_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_cryp_NVIC_ClearPendingIRQ
stm32f4xx_cryp_NVIC_GetActive:
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
BEQ	L_stm32f4xx_cryp_NVIC_GetActive2
; ?FLOC__stm32f4xx_cryp_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_cryp_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_cryp_NVIC_GetActive3
L_stm32f4xx_cryp_NVIC_GetActive2:
; ?FLOC__stm32f4xx_cryp_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_cryp_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_cryp_NVIC_GetActive3:
; ?FLOC__stm32f4xx_cryp_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_cryp_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_cryp_NVIC_GetActive
stm32f4xx_cryp_NVIC_SetPriority:
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
BGE	L_stm32f4xx_cryp_NVIC_SetPriority4
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
BAL	L_stm32f4xx_cryp_NVIC_SetPriority5
L_stm32f4xx_cryp_NVIC_SetPriority4:
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
L_stm32f4xx_cryp_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_cryp_NVIC_SetPriority
stm32f4xx_cryp_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_cryp_NVIC_GetPriority6
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
L_stm32f4xx_cryp_NVIC_GetPriority6:
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
; end of stm32f4xx_cryp_NVIC_GetPriority
stm32f4xx_cryp_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_cryp_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_cryp_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_cryp_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_cryp_NVIC_EncodePriority9
L_stm32f4xx_cryp_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_cryp_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_cryp_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_cryp_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_cryp_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_cryp_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_cryp_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_cryp_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_cryp_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_cryp_NVIC_EncodePriority11
L_stm32f4xx_cryp_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_cryp_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_cryp_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_cryp_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_cryp_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_cryp_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_cryp_NVIC_EncodePriority
stm32f4xx_cryp_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_cryp_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_cryp_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_cryp_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_cryp_NVIC_DecodePriority13
L_stm32f4xx_cryp_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_cryp_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_cryp_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_cryp_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_cryp_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_cryp_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_cryp_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_cryp_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_cryp_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_cryp_NVIC_DecodePriority15
L_stm32f4xx_cryp_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_cryp_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_cryp_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_cryp_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_cryp_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_cryp_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_cryp_NVIC_DecodePriority
stm32f4xx_cryp_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_cryp___DSB+0
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
BL	stm32f4xx_cryp___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_cryp_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_cryp_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_cryp_NVIC_SystemReset
stm32f4xx_cryp_SysTick_Config:
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
BLS	L_stm32f4xx_cryp_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_cryp_SysTick_Config18:
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
BL	stm32f4xx_cryp_NVIC_SetPriority+0
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
; end of stm32f4xx_cryp_SysTick_Config
stm32f4xx_cryp_ITM_SendChar:
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
BEQ	L_stm32f4xx_cryp_ITM_SendChar55
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_cryp_ITM_SendChar56
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_cryp_ITM_SendChar57
L_stm32f4xx_cryp_ITM_SendChar51:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_cryp_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_cryp_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_cryp_ITM_SendChar22
L_stm32f4xx_cryp_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_cryp_ITM_SendChar54
L_stm32f4xx_cryp_ITM_SendChar55:
L_stm32f4xx_cryp_ITM_SendChar54:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_cryp_ITM_SendChar53
L_stm32f4xx_cryp_ITM_SendChar56:
L_stm32f4xx_cryp_ITM_SendChar53:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_cryp_ITM_SendChar52
L_stm32f4xx_cryp_ITM_SendChar57:
L_stm32f4xx_cryp_ITM_SendChar52:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_cryp_ITM_SendChar
stm32f4xx_cryp_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_cryp_ITM_ReceiveChar24
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
L_stm32f4xx_cryp_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_cryp_ITM_ReceiveChar
stm32f4xx_cryp_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_cryp_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_cryp_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_cryp_ITM_CheckChar
_CRYP_DeInit:
;stm32f4xx_cryp.c,221 :: 		void CRYP_DeInit(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f4xx_cryp.c,224 :: 		RCC_AHB2PeriphResetCmd(RCC_AHB2Periph_CRYP, ENABLE);
MOVS	R1, #1
MOV	R0, #16
BL	_RCC_AHB2PeriphResetCmd+0
;stm32f4xx_cryp.c,227 :: 		RCC_AHB2PeriphResetCmd(RCC_AHB2Periph_CRYP, DISABLE);
MOVS	R1, #0
MOV	R0, #16
BL	_RCC_AHB2PeriphResetCmd+0
;stm32f4xx_cryp.c,228 :: 		}
L_end_CRYP_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _CRYP_DeInit
_CRYP_Init:
;stm32f4xx_cryp.c,237 :: 		void CRYP_Init(CRYP_InitTypeDef* CRYP_InitStruct)
; CRYP_InitStruct start address is: 0 (R0)
; CRYP_InitStruct end address is: 0 (R0)
; CRYP_InitStruct start address is: 0 (R0)
;stm32f4xx_cryp.c,245 :: 		CRYP->CR &= ~CRYP_CR_ALGOMODE;
MOVW	R4, #0
MOVT	R4, #20486
LDR	R2, [R4, #0]
MVN	R1, #56
ANDS	R2, R1
STR	R2, [R4, #0]
;stm32f4xx_cryp.c,246 :: 		CRYP->CR |= CRYP_InitStruct->CRYP_AlgoMode;
ADDS	R3, R0, #2
LDRH	R1, [R3, #0]
ORRS	R2, R1
STR	R2, [R4, #0]
;stm32f4xx_cryp.c,249 :: 		CRYP->CR &= ~CRYP_CR_DATATYPE;
MVN	R1, #192
ANDS	R2, R1
STR	R2, [R4, #0]
;stm32f4xx_cryp.c,250 :: 		CRYP->CR |= CRYP_InitStruct->CRYP_DataType;
ADDS	R1, R0, #4
LDRH	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
STR	R1, [R4, #0]
;stm32f4xx_cryp.c,253 :: 		if ((CRYP_InitStruct->CRYP_AlgoMode == CRYP_AlgoMode_AES_ECB) ||
LDRH	R1, [R3, #0]
;stm32f4xx_cryp.c,254 :: 		(CRYP_InitStruct->CRYP_AlgoMode == CRYP_AlgoMode_AES_CBC) ||
CMP	R1, #32
IT	EQ
BEQ	L__CRYP_Init62
ADDS	R1, R0, #2
LDRH	R1, [R1, #0]
CMP	R1, #40
IT	EQ
BEQ	L__CRYP_Init61
;stm32f4xx_cryp.c,255 :: 		(CRYP_InitStruct->CRYP_AlgoMode == CRYP_AlgoMode_AES_CTR) ||
ADDS	R1, R0, #2
LDRH	R1, [R1, #0]
CMP	R1, #48
IT	EQ
BEQ	L__CRYP_Init60
;stm32f4xx_cryp.c,256 :: 		(CRYP_InitStruct->CRYP_AlgoMode == CRYP_AlgoMode_AES_Key))
ADDS	R1, R0, #2
LDRH	R1, [R1, #0]
CMP	R1, #56
IT	EQ
BEQ	L__CRYP_Init59
IT	AL
BAL	L_CRYP_Init29
;stm32f4xx_cryp.c,254 :: 		(CRYP_InitStruct->CRYP_AlgoMode == CRYP_AlgoMode_AES_CBC) ||
L__CRYP_Init62:
L__CRYP_Init61:
;stm32f4xx_cryp.c,255 :: 		(CRYP_InitStruct->CRYP_AlgoMode == CRYP_AlgoMode_AES_CTR) ||
L__CRYP_Init60:
;stm32f4xx_cryp.c,256 :: 		(CRYP_InitStruct->CRYP_AlgoMode == CRYP_AlgoMode_AES_Key))
L__CRYP_Init59:
;stm32f4xx_cryp.c,259 :: 		CRYP->CR &= ~CRYP_CR_KEYSIZE;
MOVW	R3, #0
MOVT	R3, #20486
LDR	R2, [R3, #0]
MVN	R1, #768
ANDS	R2, R1
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,262 :: 		been prepared */
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_cryp.c,263 :: 		}
L_CRYP_Init29:
;stm32f4xx_cryp.c,266 :: 		CRYP->CR &= ~CRYP_CR_ALGODIR;
MOVW	R3, #0
MOVT	R3, #20486
LDR	R2, [R3, #0]
MVN	R1, #4
ANDS	R2, R1
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,267 :: 		CRYP->CR |= CRYP_InitStruct->CRYP_AlgoDir;
LDRH	R1, [R0, #0]
; CRYP_InitStruct end address is: 0 (R0)
ORR	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_cryp.c,268 :: 		}
L_end_CRYP_Init:
BX	LR
; end of _CRYP_Init
_CRYP_StructInit:
;stm32f4xx_cryp.c,276 :: 		void CRYP_StructInit(CRYP_InitTypeDef* CRYP_InitStruct)
; CRYP_InitStruct start address is: 0 (R0)
; CRYP_InitStruct end address is: 0 (R0)
; CRYP_InitStruct start address is: 0 (R0)
;stm32f4xx_cryp.c,279 :: 		CRYP_InitStruct->CRYP_AlgoDir = CRYP_AlgoDir_Encrypt;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f4xx_cryp.c,282 :: 		CRYP_InitStruct->CRYP_AlgoMode = CRYP_AlgoMode_TDES_ECB;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_cryp.c,285 :: 		CRYP_InitStruct->CRYP_DataType = CRYP_DataType_32b;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_cryp.c,288 :: 		CRYP_InitStruct->CRYP_KeySize = CRYP_KeySize_128b;
ADDS	R2, R0, #6
; CRYP_InitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_cryp.c,289 :: 		}
L_end_CRYP_StructInit:
BX	LR
; end of _CRYP_StructInit
_CRYP_KeyInit:
;stm32f4xx_cryp.c,298 :: 		void CRYP_KeyInit(CRYP_KeyInitTypeDef* CRYP_KeyInitStruct)
; CRYP_KeyInitStruct start address is: 0 (R0)
; CRYP_KeyInitStruct end address is: 0 (R0)
; CRYP_KeyInitStruct start address is: 0 (R0)
;stm32f4xx_cryp.c,301 :: 		CRYP->K0LR = CRYP_KeyInitStruct->CRYP_Key0Left;
LDR	R2, [R0, #0]
MOVW	R1, #32
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,302 :: 		CRYP->K0RR = CRYP_KeyInitStruct->CRYP_Key0Right;
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
MOVW	R1, #36
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,303 :: 		CRYP->K1LR = CRYP_KeyInitStruct->CRYP_Key1Left;
ADDW	R1, R0, #8
LDR	R2, [R1, #0]
MOVW	R1, #40
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,304 :: 		CRYP->K1RR = CRYP_KeyInitStruct->CRYP_Key1Right;
ADDW	R1, R0, #12
LDR	R2, [R1, #0]
MOVW	R1, #44
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,305 :: 		CRYP->K2LR = CRYP_KeyInitStruct->CRYP_Key2Left;
ADDW	R1, R0, #16
LDR	R2, [R1, #0]
MOVW	R1, #48
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,306 :: 		CRYP->K2RR = CRYP_KeyInitStruct->CRYP_Key2Right;
ADDW	R1, R0, #20
LDR	R2, [R1, #0]
MOVW	R1, #52
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,307 :: 		CRYP->K3LR = CRYP_KeyInitStruct->CRYP_Key3Left;
ADDW	R1, R0, #24
LDR	R2, [R1, #0]
MOVW	R1, #56
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,308 :: 		CRYP->K3RR = CRYP_KeyInitStruct->CRYP_Key3Right;
ADDW	R1, R0, #28
; CRYP_KeyInitStruct end address is: 0 (R0)
LDR	R2, [R1, #0]
MOVW	R1, #60
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,309 :: 		}
L_end_CRYP_KeyInit:
BX	LR
; end of _CRYP_KeyInit
_CRYP_KeyStructInit:
;stm32f4xx_cryp.c,317 :: 		void CRYP_KeyStructInit(CRYP_KeyInitTypeDef* CRYP_KeyInitStruct)
; CRYP_KeyInitStruct start address is: 0 (R0)
; CRYP_KeyInitStruct end address is: 0 (R0)
; CRYP_KeyInitStruct start address is: 0 (R0)
;stm32f4xx_cryp.c,319 :: 		CRYP_KeyInitStruct->CRYP_Key0Left  = 0;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_cryp.c,320 :: 		CRYP_KeyInitStruct->CRYP_Key0Right = 0;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_cryp.c,321 :: 		CRYP_KeyInitStruct->CRYP_Key1Left  = 0;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_cryp.c,322 :: 		CRYP_KeyInitStruct->CRYP_Key1Right = 0;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_cryp.c,323 :: 		CRYP_KeyInitStruct->CRYP_Key2Left  = 0;
ADDW	R2, R0, #16
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_cryp.c,324 :: 		CRYP_KeyInitStruct->CRYP_Key2Right = 0;
ADDW	R2, R0, #20
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_cryp.c,325 :: 		CRYP_KeyInitStruct->CRYP_Key3Left  = 0;
ADDW	R2, R0, #24
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_cryp.c,326 :: 		CRYP_KeyInitStruct->CRYP_Key3Right = 0;
ADDW	R2, R0, #28
; CRYP_KeyInitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_cryp.c,327 :: 		}
L_end_CRYP_KeyStructInit:
BX	LR
; end of _CRYP_KeyStructInit
_CRYP_IVInit:
;stm32f4xx_cryp.c,335 :: 		void CRYP_IVInit(CRYP_IVInitTypeDef* CRYP_IVInitStruct)
; CRYP_IVInitStruct start address is: 0 (R0)
; CRYP_IVInitStruct end address is: 0 (R0)
; CRYP_IVInitStruct start address is: 0 (R0)
;stm32f4xx_cryp.c,337 :: 		CRYP->IV0LR = CRYP_IVInitStruct->CRYP_IV0Left;
LDR	R2, [R0, #0]
MOVW	R1, #64
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,338 :: 		CRYP->IV0RR = CRYP_IVInitStruct->CRYP_IV0Right;
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
MOVW	R1, #68
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,339 :: 		CRYP->IV1LR = CRYP_IVInitStruct->CRYP_IV1Left;
ADDW	R1, R0, #8
LDR	R2, [R1, #0]
MOVW	R1, #72
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,340 :: 		CRYP->IV1RR = CRYP_IVInitStruct->CRYP_IV1Right;
ADDW	R1, R0, #12
; CRYP_IVInitStruct end address is: 0 (R0)
LDR	R2, [R1, #0]
MOVW	R1, #76
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,341 :: 		}
L_end_CRYP_IVInit:
BX	LR
; end of _CRYP_IVInit
_CRYP_IVStructInit:
;stm32f4xx_cryp.c,349 :: 		void CRYP_IVStructInit(CRYP_IVInitTypeDef* CRYP_IVInitStruct)
; CRYP_IVInitStruct start address is: 0 (R0)
; CRYP_IVInitStruct end address is: 0 (R0)
; CRYP_IVInitStruct start address is: 0 (R0)
;stm32f4xx_cryp.c,351 :: 		CRYP_IVInitStruct->CRYP_IV0Left  = 0;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_cryp.c,352 :: 		CRYP_IVInitStruct->CRYP_IV0Right = 0;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_cryp.c,353 :: 		CRYP_IVInitStruct->CRYP_IV1Left  = 0;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_cryp.c,354 :: 		CRYP_IVInitStruct->CRYP_IV1Right = 0;
ADDW	R2, R0, #12
; CRYP_IVInitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_cryp.c,355 :: 		}
L_end_CRYP_IVStructInit:
BX	LR
; end of _CRYP_IVStructInit
_CRYP_FIFOFlush:
;stm32f4xx_cryp.c,364 :: 		void CRYP_FIFOFlush(void)
;stm32f4xx_cryp.c,367 :: 		CRYP->CR |= CRYP_CR_FFLUSH;
MOVW	R1, #0
MOVT	R1, #20486
LDR	R0, [R1, #0]
ORR	R0, R0, #16384
STR	R0, [R1, #0]
;stm32f4xx_cryp.c,368 :: 		}
L_end_CRYP_FIFOFlush:
BX	LR
; end of _CRYP_FIFOFlush
_CRYP_Cmd:
;stm32f4xx_cryp.c,376 :: 		void CRYP_Cmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_cryp.c,381 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_CRYP_Cmd30
; NewState end address is: 0 (R0)
;stm32f4xx_cryp.c,384 :: 		CRYP->CR |= CRYP_CR_CRYPEN;
MOVW	R2, #0
MOVT	R2, #20486
LDR	R1, [R2, #0]
ORR	R1, R1, #32768
STR	R1, [R2, #0]
;stm32f4xx_cryp.c,385 :: 		}
IT	AL
BAL	L_CRYP_Cmd31
L_CRYP_Cmd30:
;stm32f4xx_cryp.c,389 :: 		CRYP->CR &= ~CRYP_CR_CRYPEN;
MOVW	R3, #0
MOVT	R3, #20486
LDR	R2, [R3, #0]
MVN	R1, #32768
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_cryp.c,390 :: 		}
L_CRYP_Cmd31:
;stm32f4xx_cryp.c,391 :: 		}
L_end_CRYP_Cmd:
BX	LR
; end of _CRYP_Cmd
_CRYP_DataIn:
;stm32f4xx_cryp.c,419 :: 		void CRYP_DataIn(uint32_t Data)
; Data start address is: 0 (R0)
; Data end address is: 0 (R0)
; Data start address is: 0 (R0)
;stm32f4xx_cryp.c,421 :: 		CRYP->DR = Data;
MOVW	R1, #8
MOVT	R1, #20486
STR	R0, [R1, #0]
; Data end address is: 0 (R0)
;stm32f4xx_cryp.c,422 :: 		}
L_end_CRYP_DataIn:
BX	LR
; end of _CRYP_DataIn
_CRYP_DataOut:
;stm32f4xx_cryp.c,429 :: 		uint32_t CRYP_DataOut(void)
;stm32f4xx_cryp.c,431 :: 		return CRYP->DOUT;
MOVW	R0, #12
MOVT	R0, #20486
LDR	R0, [R0, #0]
;stm32f4xx_cryp.c,432 :: 		}
L_end_CRYP_DataOut:
BX	LR
; end of _CRYP_DataOut
_CRYP_SaveContext:
;stm32f4xx_cryp.c,473 :: 		CRYP_KeyInitTypeDef* CRYP_KeyInitStruct)
; CRYP_KeyInitStruct start address is: 4 (R1)
; CRYP_ContextSave start address is: 0 (R0)
SUB	SP, SP, #4
; CRYP_KeyInitStruct end address is: 4 (R1)
; CRYP_ContextSave end address is: 0 (R0)
; CRYP_ContextSave start address is: 0 (R0)
; CRYP_KeyInitStruct start address is: 4 (R1)
;stm32f4xx_cryp.c,475 :: 		__IO uint32_t timeout = 0;
; timeout start address is: 20 (R5)
MOV	R5, #0
;stm32f4xx_cryp.c,476 :: 		uint32_t ckeckmask = 0, bitstatus;
;stm32f4xx_cryp.c,477 :: 		ErrorStatus status = ERROR;
;stm32f4xx_cryp.c,480 :: 		CRYP->DMACR &= ~(uint32_t)CRYP_DMACR_DIEN;
MOVW	R4, #16
MOVT	R4, #20486
LDR	R3, [R4, #0]
MVN	R2, #1
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_cryp.c,486 :: 		if ((CRYP->CR & (uint32_t)(CRYP_CR_ALGOMODE_TDES_ECB | CRYP_CR_ALGOMODE_TDES_CBC)) != (uint32_t)0 )/* TDES */
MOVW	R2, #0
MOVT	R2, #20486
LDR	R2, [R2, #0]
AND	R2, R2, #8
CMP	R2, #0
IT	EQ
BEQ	L_CRYP_SaveContext32
;stm32f4xx_cryp.c,488 :: 		ckeckmask =  CRYP_SR_IFEM | CRYP_SR_BUSY ;
; ckeckmask start address is: 8 (R2)
MOV	R2, #17
;stm32f4xx_cryp.c,489 :: 		}
MOV	R3, R2
; ckeckmask end address is: 8 (R2)
IT	AL
BAL	L_CRYP_SaveContext33
L_CRYP_SaveContext32:
;stm32f4xx_cryp.c,492 :: 		ckeckmask =  CRYP_SR_IFEM | CRYP_SR_BUSY | CRYP_SR_OFNE;
; ckeckmask start address is: 8 (R2)
MOV	R2, #21
; ckeckmask end address is: 8 (R2)
MOV	R3, R2
;stm32f4xx_cryp.c,493 :: 		}
L_CRYP_SaveContext33:
;stm32f4xx_cryp.c,495 :: 		do
; ckeckmask start address is: 12 (R3)
STR	R1, [SP, #0]
; CRYP_ContextSave end address is: 0 (R0)
; CRYP_KeyInitStruct end address is: 4 (R1)
; ckeckmask end address is: 12 (R3)
; timeout end address is: 20 (R5)
MOV	R1, R0
LDR	R0, [SP, #0]
L_CRYP_SaveContext34:
;stm32f4xx_cryp.c,497 :: 		bitstatus = CRYP->SR & ckeckmask;
; ckeckmask start address is: 12 (R3)
; timeout start address is: 20 (R5)
; CRYP_KeyInitStruct start address is: 0 (R0)
; CRYP_ContextSave start address is: 4 (R1)
MOVW	R2, #4
MOVT	R2, #20486
LDR	R2, [R2, #0]
ANDS	R2, R3
; bitstatus start address is: 16 (R4)
MOV	R4, R2
;stm32f4xx_cryp.c,498 :: 		timeout++;
ADDS	R2, R5, #1
MOV	R5, R2
;stm32f4xx_cryp.c,500 :: 		while ((timeout != MAX_TIMEOUT) && (bitstatus != CRYP_SR_IFEM));
MOVW	R2, #65535
CMP	R5, R2
IT	EQ
BEQ	L__CRYP_SaveContext65
CMP	R4, #1
IT	EQ
BEQ	L__CRYP_SaveContext64
; bitstatus end address is: 16 (R4)
; timeout end address is: 20 (R5)
IT	AL
BAL	L_CRYP_SaveContext34
L__CRYP_SaveContext65:
L__CRYP_SaveContext64:
;stm32f4xx_cryp.c,502 :: 		if ((CRYP->SR & ckeckmask) != CRYP_SR_IFEM)
MOVW	R2, #4
MOVT	R2, #20486
LDR	R2, [R2, #0]
ANDS	R2, R3
; ckeckmask end address is: 12 (R3)
CMP	R2, #1
IT	EQ
BEQ	L_CRYP_SaveContext39
; CRYP_KeyInitStruct end address is: 0 (R0)
; CRYP_ContextSave end address is: 4 (R1)
;stm32f4xx_cryp.c,504 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_cryp.c,505 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_CRYP_SaveContext40
L_CRYP_SaveContext39:
;stm32f4xx_cryp.c,512 :: 		CRYP->DMACR &= ~(uint32_t)CRYP_DMACR_DOEN;
; CRYP_ContextSave start address is: 4 (R1)
; CRYP_KeyInitStruct start address is: 0 (R0)
MOVW	R4, #16
MOVT	R4, #20486
LDR	R3, [R4, #0]
MVN	R2, #2
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_cryp.c,513 :: 		CRYP->CR &= ~(uint32_t)CRYP_CR_CRYPEN;
MOVW	R4, #0
MOVT	R4, #20486
LDR	R3, [R4, #0]
MVN	R2, #32768
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_cryp.c,519 :: 		CRYP_CR_ALGODIR);
AND	R2, R2, #1020
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,522 :: 		CRYP_ContextSave->CRYP_IV0LR = CRYP->IV0LR;
ADDS	R3, R1, #4
MOVW	R2, #64
MOVT	R2, #20486
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,523 :: 		CRYP_ContextSave->CRYP_IV0RR = CRYP->IV0RR;
ADDW	R3, R1, #8
MOVW	R2, #68
MOVT	R2, #20486
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,524 :: 		CRYP_ContextSave->CRYP_IV1LR = CRYP->IV1LR;
ADDW	R3, R1, #12
MOVW	R2, #72
MOVT	R2, #20486
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,525 :: 		CRYP_ContextSave->CRYP_IV1RR = CRYP->IV1RR;
ADDW	R3, R1, #16
MOVW	R2, #76
MOVT	R2, #20486
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,528 :: 		CRYP_ContextSave->CRYP_K0LR = CRYP_KeyInitStruct->CRYP_Key0Left;
ADDW	R3, R1, #20
LDR	R2, [R0, #0]
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,529 :: 		CRYP_ContextSave->CRYP_K0RR = CRYP_KeyInitStruct->CRYP_Key0Right;
ADDW	R3, R1, #24
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,530 :: 		CRYP_ContextSave->CRYP_K1LR = CRYP_KeyInitStruct->CRYP_Key1Left;
ADDW	R3, R1, #28
ADDW	R2, R0, #8
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,531 :: 		CRYP_ContextSave->CRYP_K1RR = CRYP_KeyInitStruct->CRYP_Key1Right;
ADDW	R3, R1, #32
ADDW	R2, R0, #12
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,532 :: 		CRYP_ContextSave->CRYP_K2LR = CRYP_KeyInitStruct->CRYP_Key2Left;
ADDW	R3, R1, #36
ADDW	R2, R0, #16
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,533 :: 		CRYP_ContextSave->CRYP_K2RR = CRYP_KeyInitStruct->CRYP_Key2Right;
ADDW	R3, R1, #40
ADDW	R2, R0, #20
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,534 :: 		CRYP_ContextSave->CRYP_K3LR = CRYP_KeyInitStruct->CRYP_Key3Left;
ADDW	R3, R1, #44
ADDW	R2, R0, #24
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,535 :: 		CRYP_ContextSave->CRYP_K3RR = CRYP_KeyInitStruct->CRYP_Key3Right;
ADDW	R3, R1, #48
; CRYP_ContextSave end address is: 4 (R1)
ADDW	R2, R0, #28
; CRYP_KeyInitStruct end address is: 0 (R0)
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,540 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_cryp.c,541 :: 		}
L_CRYP_SaveContext40:
;stm32f4xx_cryp.c,543 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f4xx_cryp.c,544 :: 		}
L_end_CRYP_SaveContext:
ADD	SP, SP, #4
BX	LR
; end of _CRYP_SaveContext
_CRYP_RestoreContext:
;stm32f4xx_cryp.c,557 :: 		void CRYP_RestoreContext(CRYP_Context* CRYP_ContextRestore)
; CRYP_ContextRestore start address is: 0 (R0)
; CRYP_ContextRestore end address is: 0 (R0)
; CRYP_ContextRestore start address is: 0 (R0)
;stm32f4xx_cryp.c,561 :: 		CRYP->CR = CRYP_ContextRestore->CR_bits9to2;
LDR	R4, [R0, #0]
MOVW	R3, #0
MOVT	R3, #20486
STR	R4, [R3, #0]
;stm32f4xx_cryp.c,564 :: 		CRYP->K0LR = CRYP_ContextRestore->CRYP_K0LR;
ADDW	R1, R0, #20
LDR	R2, [R1, #0]
MOVW	R1, #32
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,565 :: 		CRYP->K0RR = CRYP_ContextRestore->CRYP_K0RR;
ADDW	R1, R0, #24
LDR	R2, [R1, #0]
MOVW	R1, #36
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,566 :: 		CRYP->K1LR = CRYP_ContextRestore->CRYP_K1LR;
ADDW	R1, R0, #28
LDR	R2, [R1, #0]
MOVW	R1, #40
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,567 :: 		CRYP->K1RR = CRYP_ContextRestore->CRYP_K1RR;
ADDW	R1, R0, #32
LDR	R2, [R1, #0]
MOVW	R1, #44
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,568 :: 		CRYP->K2LR = CRYP_ContextRestore->CRYP_K2LR;
ADDW	R1, R0, #36
LDR	R2, [R1, #0]
MOVW	R1, #48
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,569 :: 		CRYP->K2RR = CRYP_ContextRestore->CRYP_K2RR;
ADDW	R1, R0, #40
LDR	R2, [R1, #0]
MOVW	R1, #52
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,570 :: 		CRYP->K3LR = CRYP_ContextRestore->CRYP_K3LR;
ADDW	R1, R0, #44
LDR	R2, [R1, #0]
MOVW	R1, #56
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,571 :: 		CRYP->K3RR = CRYP_ContextRestore->CRYP_K3RR;
ADDW	R1, R0, #48
LDR	R2, [R1, #0]
MOVW	R1, #60
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,574 :: 		CRYP->IV0LR = CRYP_ContextRestore->CRYP_IV0LR;
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
MOVW	R1, #64
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,575 :: 		CRYP->IV0RR = CRYP_ContextRestore->CRYP_IV0RR;
ADDW	R1, R0, #8
LDR	R2, [R1, #0]
MOVW	R1, #68
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,576 :: 		CRYP->IV1LR = CRYP_ContextRestore->CRYP_IV1LR;
ADDW	R1, R0, #12
LDR	R2, [R1, #0]
MOVW	R1, #72
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,577 :: 		CRYP->IV1RR = CRYP_ContextRestore->CRYP_IV1RR;
ADDW	R1, R0, #16
; CRYP_ContextRestore end address is: 0 (R0)
LDR	R2, [R1, #0]
MOVW	R1, #76
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_cryp.c,580 :: 		CRYP->CR |= CRYP_CR_CRYPEN;
ORR	R1, R4, #32768
STR	R1, [R3, #0]
;stm32f4xx_cryp.c,581 :: 		}
L_end_CRYP_RestoreContext:
BX	LR
; end of _CRYP_RestoreContext
_CRYP_DMACmd:
;stm32f4xx_cryp.c,618 :: 		void CRYP_DMACmd(uint8_t CRYP_DMAReq, FunctionalState NewState)
; NewState start address is: 4 (R1)
; CRYP_DMAReq start address is: 0 (R0)
; NewState end address is: 4 (R1)
; CRYP_DMAReq end address is: 0 (R0)
; CRYP_DMAReq start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_cryp.c,624 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_CRYP_DMACmd41
; NewState end address is: 4 (R1)
;stm32f4xx_cryp.c,627 :: 		CRYP->DMACR |= CRYP_DMAReq;
MOVW	R3, #16
MOVT	R3, #20486
LDR	R2, [R3, #0]
ORRS	R2, R0
; CRYP_DMAReq end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,628 :: 		}
IT	AL
BAL	L_CRYP_DMACmd42
L_CRYP_DMACmd41:
;stm32f4xx_cryp.c,632 :: 		CRYP->DMACR &= (uint8_t)~CRYP_DMAReq;
; CRYP_DMAReq start address is: 0 (R0)
MVN	R4, R0
UXTB	R4, R4
; CRYP_DMAReq end address is: 0 (R0)
MOVW	R3, #16
MOVT	R3, #20486
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,633 :: 		}
L_CRYP_DMACmd42:
;stm32f4xx_cryp.c,634 :: 		}
L_end_CRYP_DMACmd:
BX	LR
; end of _CRYP_DMACmd
_CRYP_ITConfig:
;stm32f4xx_cryp.c,743 :: 		void CRYP_ITConfig(uint8_t CRYP_IT, FunctionalState NewState)
; NewState start address is: 4 (R1)
; CRYP_IT start address is: 0 (R0)
; NewState end address is: 4 (R1)
; CRYP_IT end address is: 0 (R0)
; CRYP_IT start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_cryp.c,749 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_CRYP_ITConfig43
; NewState end address is: 4 (R1)
;stm32f4xx_cryp.c,752 :: 		CRYP->IMSCR |= CRYP_IT;
MOVW	R3, #20
MOVT	R3, #20486
LDR	R2, [R3, #0]
ORRS	R2, R0
; CRYP_IT end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,753 :: 		}
IT	AL
BAL	L_CRYP_ITConfig44
L_CRYP_ITConfig43:
;stm32f4xx_cryp.c,757 :: 		CRYP->IMSCR &= (uint8_t)~CRYP_IT;
; CRYP_IT start address is: 0 (R0)
MVN	R4, R0
UXTB	R4, R4
; CRYP_IT end address is: 0 (R0)
MOVW	R3, #20
MOVT	R3, #20486
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_cryp.c,758 :: 		}
L_CRYP_ITConfig44:
;stm32f4xx_cryp.c,759 :: 		}
L_end_CRYP_ITConfig:
BX	LR
; end of _CRYP_ITConfig
_CRYP_GetITStatus:
;stm32f4xx_cryp.c,771 :: 		ITStatus CRYP_GetITStatus(uint8_t CRYP_IT)
; CRYP_IT start address is: 0 (R0)
; CRYP_IT end address is: 0 (R0)
; CRYP_IT start address is: 0 (R0)
;stm32f4xx_cryp.c,773 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_cryp.c,778 :: 		if ((CRYP->MISR &  CRYP_IT) != (uint8_t)RESET)
MOVW	R1, #28
MOVT	R1, #20486
LDR	R1, [R1, #0]
ANDS	R1, R0
; CRYP_IT end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_CRYP_GetITStatus45
;stm32f4xx_cryp.c,781 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_cryp.c,782 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CRYP_GetITStatus46
L_CRYP_GetITStatus45:
;stm32f4xx_cryp.c,786 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_cryp.c,787 :: 		}
L_CRYP_GetITStatus46:
;stm32f4xx_cryp.c,789 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_cryp.c,790 :: 		}
L_end_CRYP_GetITStatus:
BX	LR
; end of _CRYP_GetITStatus
_CRYP_GetFlagStatus:
;stm32f4xx_cryp.c,805 :: 		FlagStatus CRYP_GetFlagStatus(uint8_t CRYP_FLAG)
; CRYP_FLAG start address is: 0 (R0)
; CRYP_FLAG end address is: 0 (R0)
; CRYP_FLAG start address is: 0 (R0)
;stm32f4xx_cryp.c,807 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_cryp.c,808 :: 		uint32_t tempreg = 0;
;stm32f4xx_cryp.c,814 :: 		if ((CRYP_FLAG & FLAG_MASK) != 0x00)
AND	R1, R0, #32
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_CRYP_GetFlagStatus47
;stm32f4xx_cryp.c,816 :: 		tempreg = CRYP->RISR;
MOVW	R1, #24
MOVT	R1, #20486
; tempreg start address is: 8 (R2)
LDR	R2, [R1, #0]
;stm32f4xx_cryp.c,817 :: 		}
; tempreg end address is: 8 (R2)
IT	AL
BAL	L_CRYP_GetFlagStatus48
L_CRYP_GetFlagStatus47:
;stm32f4xx_cryp.c,820 :: 		tempreg = CRYP->SR;
MOVW	R1, #4
MOVT	R1, #20486
; tempreg start address is: 8 (R2)
LDR	R2, [R1, #0]
; tempreg end address is: 8 (R2)
;stm32f4xx_cryp.c,821 :: 		}
L_CRYP_GetFlagStatus48:
;stm32f4xx_cryp.c,825 :: 		if ((tempreg & CRYP_FLAG ) != (uint8_t)RESET)
; tempreg start address is: 8 (R2)
AND	R1, R2, R0, LSL #0
; CRYP_FLAG end address is: 0 (R0)
; tempreg end address is: 8 (R2)
CMP	R1, #0
IT	EQ
BEQ	L_CRYP_GetFlagStatus49
;stm32f4xx_cryp.c,828 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_cryp.c,829 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CRYP_GetFlagStatus50
L_CRYP_GetFlagStatus49:
;stm32f4xx_cryp.c,833 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_cryp.c,834 :: 		}
L_CRYP_GetFlagStatus50:
;stm32f4xx_cryp.c,837 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_cryp.c,838 :: 		}
L_end_CRYP_GetFlagStatus:
BX	LR
; end of _CRYP_GetFlagStatus
