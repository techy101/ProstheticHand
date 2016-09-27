stm32f4xx_hash___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_hash___DSB
stm32f4xx_hash___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_hash___WFI
stm32f4xx_hash___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_hash___WFE
stm32f4xx_hash___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_hash___REV
stm32f4xx_hash_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_hash_NVIC_SetPriorityGrouping
stm32f4xx_hash_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_hash_NVIC_GetPriorityGrouping
stm32f4xx_hash_NVIC_EnableIRQ:
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
; end of stm32f4xx_hash_NVIC_EnableIRQ
stm32f4xx_hash_NVIC_DisableIRQ:
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
; end of stm32f4xx_hash_NVIC_DisableIRQ
stm32f4xx_hash_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_hash_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_hash_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_hash_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_hash_NVIC_GetPendingIRQ1
L_stm32f4xx_hash_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_hash_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_hash_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_hash_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_hash_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_hash_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_hash_NVIC_GetPendingIRQ
stm32f4xx_hash_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_hash_NVIC_SetPendingIRQ
stm32f4xx_hash_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_hash_NVIC_ClearPendingIRQ
stm32f4xx_hash_NVIC_GetActive:
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
BEQ	L_stm32f4xx_hash_NVIC_GetActive2
; ?FLOC__stm32f4xx_hash_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_hash_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_hash_NVIC_GetActive3
L_stm32f4xx_hash_NVIC_GetActive2:
; ?FLOC__stm32f4xx_hash_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_hash_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_hash_NVIC_GetActive3:
; ?FLOC__stm32f4xx_hash_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_hash_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_hash_NVIC_GetActive
stm32f4xx_hash_NVIC_SetPriority:
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
BGE	L_stm32f4xx_hash_NVIC_SetPriority4
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
BAL	L_stm32f4xx_hash_NVIC_SetPriority5
L_stm32f4xx_hash_NVIC_SetPriority4:
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
L_stm32f4xx_hash_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_hash_NVIC_SetPriority
stm32f4xx_hash_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_hash_NVIC_GetPriority6
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
L_stm32f4xx_hash_NVIC_GetPriority6:
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
; end of stm32f4xx_hash_NVIC_GetPriority
stm32f4xx_hash_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_hash_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_hash_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_hash_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_hash_NVIC_EncodePriority9
L_stm32f4xx_hash_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_hash_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_hash_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_hash_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_hash_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_hash_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_hash_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_hash_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_hash_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_hash_NVIC_EncodePriority11
L_stm32f4xx_hash_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_hash_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_hash_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_hash_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_hash_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_hash_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_hash_NVIC_EncodePriority
stm32f4xx_hash_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_hash_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_hash_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_hash_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_hash_NVIC_DecodePriority13
L_stm32f4xx_hash_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_hash_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_hash_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_hash_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_hash_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_hash_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_hash_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_hash_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_hash_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_hash_NVIC_DecodePriority15
L_stm32f4xx_hash_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_hash_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_hash_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_hash_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_hash_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_hash_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_hash_NVIC_DecodePriority
stm32f4xx_hash_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_hash___DSB+0
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
BL	stm32f4xx_hash___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_hash_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_hash_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_hash_NVIC_SystemReset
stm32f4xx_hash_SysTick_Config:
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
BLS	L_stm32f4xx_hash_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_hash_SysTick_Config18:
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
BL	stm32f4xx_hash_NVIC_SetPriority+0
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
; end of stm32f4xx_hash_SysTick_Config
stm32f4xx_hash_ITM_SendChar:
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
BEQ	L_stm32f4xx_hash_ITM_SendChar48
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_hash_ITM_SendChar49
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_hash_ITM_SendChar50
L_stm32f4xx_hash_ITM_SendChar44:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_hash_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_hash_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_hash_ITM_SendChar22
L_stm32f4xx_hash_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_hash_ITM_SendChar47
L_stm32f4xx_hash_ITM_SendChar48:
L_stm32f4xx_hash_ITM_SendChar47:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_hash_ITM_SendChar46
L_stm32f4xx_hash_ITM_SendChar49:
L_stm32f4xx_hash_ITM_SendChar46:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_hash_ITM_SendChar45
L_stm32f4xx_hash_ITM_SendChar50:
L_stm32f4xx_hash_ITM_SendChar45:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_hash_ITM_SendChar
stm32f4xx_hash_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_hash_ITM_ReceiveChar24
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
L_stm32f4xx_hash_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_hash_ITM_ReceiveChar
stm32f4xx_hash_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_hash_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_hash_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_hash_ITM_CheckChar
_HASH_DeInit:
;stm32f4xx_hash.c,177 :: 		void HASH_DeInit(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f4xx_hash.c,180 :: 		RCC_AHB2PeriphResetCmd(RCC_AHB2Periph_HASH, ENABLE);
MOVS	R1, #1
MOV	R0, #32
BL	_RCC_AHB2PeriphResetCmd+0
;stm32f4xx_hash.c,182 :: 		RCC_AHB2PeriphResetCmd(RCC_AHB2Periph_HASH, DISABLE);
MOVS	R1, #0
MOV	R0, #32
BL	_RCC_AHB2PeriphResetCmd+0
;stm32f4xx_hash.c,183 :: 		}
L_end_HASH_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _HASH_DeInit
_HASH_Init:
;stm32f4xx_hash.c,197 :: 		void HASH_Init(HASH_InitTypeDef* HASH_InitStruct)
; HASH_InitStruct start address is: 0 (R0)
; HASH_InitStruct end address is: 0 (R0)
; HASH_InitStruct start address is: 0 (R0)
;stm32f4xx_hash.c,205 :: 		HASH->CR &= ~ (HASH_CR_ALGO | HASH_CR_DATATYPE | HASH_CR_MODE);
MOVW	R5, #1024
MOVT	R5, #20486
LDR	R2, [R5, #0]
MVN	R1, #240
AND	R4, R2, R1, LSL #0
STR	R4, [R5, #0]
;stm32f4xx_hash.c,208 :: 		HASH_InitStruct->HASH_AlgoMode);
LDR	R2, [R0, #0]
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
ORR	R3, R2, R1, LSL #0
ADDS	R2, R0, #4
LDR	R1, [R2, #0]
ORR	R1, R3, R1, LSL #0
ORR	R1, R4, R1, LSL #0
STR	R1, [R5, #0]
;stm32f4xx_hash.c,211 :: 		if(HASH_InitStruct->HASH_AlgoMode == HASH_AlgoMode_HMAC)
LDR	R1, [R2, #0]
CMP	R1, #64
IT	NE
BNE	L_HASH_Init27
;stm32f4xx_hash.c,214 :: 		HASH->CR &= ~HASH_CR_LKEY;
MOVW	R3, #1024
MOVT	R3, #20486
LDR	R2, [R3, #0]
MVN	R1, #65536
ANDS	R2, R1
STR	R2, [R3, #0]
;stm32f4xx_hash.c,215 :: 		HASH->CR |= HASH_InitStruct->HASH_HMACKeyType;
ADDW	R1, R0, #12
; HASH_InitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_hash.c,216 :: 		}
L_HASH_Init27:
;stm32f4xx_hash.c,220 :: 		HASH->CR |= HASH_CR_INIT;
MOVW	R2, #1024
MOVT	R2, #20486
LDR	R1, [R2, #0]
ORR	R1, R1, #4
STR	R1, [R2, #0]
;stm32f4xx_hash.c,221 :: 		}
L_end_HASH_Init:
BX	LR
; end of _HASH_Init
_HASH_StructInit:
;stm32f4xx_hash.c,231 :: 		void HASH_StructInit(HASH_InitTypeDef* HASH_InitStruct)
; HASH_InitStruct start address is: 0 (R0)
; HASH_InitStruct end address is: 0 (R0)
; HASH_InitStruct start address is: 0 (R0)
;stm32f4xx_hash.c,234 :: 		HASH_InitStruct->HASH_AlgoSelection = HASH_AlgoSelection_SHA1;
MOVW	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_hash.c,237 :: 		HASH_InitStruct->HASH_AlgoMode = HASH_AlgoMode_HASH;
ADDS	R2, R0, #4
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_hash.c,240 :: 		HASH_InitStruct->HASH_DataType = HASH_DataType_32b;
ADDW	R2, R0, #8
MOVW	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_hash.c,243 :: 		HASH_InitStruct->HASH_HMACKeyType = HASH_HMACKeyType_ShortKey;
ADDW	R2, R0, #12
; HASH_InitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_hash.c,244 :: 		}
L_end_HASH_StructInit:
BX	LR
; end of _HASH_StructInit
_HASH_Reset:
;stm32f4xx_hash.c,255 :: 		void HASH_Reset(void)
;stm32f4xx_hash.c,258 :: 		HASH->CR |= HASH_CR_INIT;
MOVW	R1, #1024
MOVT	R1, #20486
LDR	R0, [R1, #0]
ORR	R0, R0, #4
STR	R0, [R1, #0]
;stm32f4xx_hash.c,259 :: 		}
L_end_HASH_Reset:
BX	LR
; end of _HASH_Reset
_HASH_SetLastWordValidBitsNbr:
;stm32f4xx_hash.c,297 :: 		void HASH_SetLastWordValidBitsNbr(uint16_t ValidNumber)
; ValidNumber start address is: 0 (R0)
; ValidNumber end address is: 0 (R0)
; ValidNumber start address is: 0 (R0)
;stm32f4xx_hash.c,303 :: 		HASH->STR &= ~(HASH_STR_NBW);
MOVW	R3, #1032
MOVT	R3, #20486
LDR	R2, [R3, #0]
MVN	R1, #31
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_hash.c,304 :: 		HASH->STR |= ValidNumber;
ORRS	R1, R0
; ValidNumber end address is: 0 (R0)
STR	R1, [R3, #0]
;stm32f4xx_hash.c,305 :: 		}
L_end_HASH_SetLastWordValidBitsNbr:
BX	LR
; end of _HASH_SetLastWordValidBitsNbr
_HASH_DataIn:
;stm32f4xx_hash.c,312 :: 		void HASH_DataIn(uint32_t Data)
; Data start address is: 0 (R0)
; Data end address is: 0 (R0)
; Data start address is: 0 (R0)
;stm32f4xx_hash.c,315 :: 		HASH->DIN = Data;
MOVW	R1, #1028
MOVT	R1, #20486
STR	R0, [R1, #0]
; Data end address is: 0 (R0)
;stm32f4xx_hash.c,316 :: 		}
L_end_HASH_DataIn:
BX	LR
; end of _HASH_DataIn
_HASH_GetInFIFOWordsNbr:
;stm32f4xx_hash.c,323 :: 		uint8_t HASH_GetInFIFOWordsNbr(void)
;stm32f4xx_hash.c,326 :: 		return ((HASH->CR & HASH_CR_NBW) >> 8);
MOVW	R0, #1024
MOVT	R0, #20486
LDR	R0, [R0, #0]
AND	R0, R0, #3840
LSRS	R0, R0, #8
UXTB	R0, R0
;stm32f4xx_hash.c,327 :: 		}
L_end_HASH_GetInFIFOWordsNbr:
BX	LR
; end of _HASH_GetInFIFOWordsNbr
_HASH_GetDigest:
;stm32f4xx_hash.c,337 :: 		void HASH_GetDigest(HASH_MsgDigest* HASH_MessageDigest)
; HASH_MessageDigest start address is: 0 (R0)
; HASH_MessageDigest end address is: 0 (R0)
; HASH_MessageDigest start address is: 0 (R0)
;stm32f4xx_hash.c,340 :: 		HASH_MessageDigest->Data[0] = HASH->HR[0];
MOVW	R1, #1036
MOVT	R1, #20486
LDR	R1, [R1, #0]
STR	R1, [R0, #0]
;stm32f4xx_hash.c,341 :: 		HASH_MessageDigest->Data[1] = HASH->HR[1];
ADDS	R2, R0, #4
MOVW	R1, #1040
MOVT	R1, #20486
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;stm32f4xx_hash.c,342 :: 		HASH_MessageDigest->Data[2] = HASH->HR[2];
ADDW	R2, R0, #8
MOVW	R1, #1044
MOVT	R1, #20486
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;stm32f4xx_hash.c,343 :: 		HASH_MessageDigest->Data[3] = HASH->HR[3];
ADDW	R2, R0, #12
MOVW	R1, #1048
MOVT	R1, #20486
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;stm32f4xx_hash.c,344 :: 		HASH_MessageDigest->Data[4] = HASH->HR[4];
ADDW	R2, R0, #16
; HASH_MessageDigest end address is: 0 (R0)
MOVW	R1, #1052
MOVT	R1, #20486
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;stm32f4xx_hash.c,345 :: 		}
L_end_HASH_GetDigest:
BX	LR
; end of _HASH_GetDigest
_HASH_StartDigest:
;stm32f4xx_hash.c,352 :: 		void HASH_StartDigest(void)
;stm32f4xx_hash.c,355 :: 		HASH->STR |= HASH_STR_DCAL;
MOVW	R1, #1032
MOVT	R1, #20486
LDR	R0, [R1, #0]
ORR	R0, R0, #256
STR	R0, [R1, #0]
;stm32f4xx_hash.c,356 :: 		}
L_end_HASH_StartDigest:
BX	LR
; end of _HASH_StartDigest
_HASH_SaveContext:
;stm32f4xx_hash.c,395 :: 		void HASH_SaveContext(HASH_Context* HASH_ContextSave)
; HASH_ContextSave start address is: 0 (R0)
MOV	R3, R0
; HASH_ContextSave end address is: 0 (R0)
; HASH_ContextSave start address is: 12 (R3)
;stm32f4xx_hash.c,397 :: 		uint8_t i = 0;
;stm32f4xx_hash.c,400 :: 		HASH_ContextSave->HASH_IMR = HASH->IMR;
MOVW	R1, #1056
MOVT	R1, #20486
LDR	R1, [R1, #0]
STR	R1, [R3, #0]
;stm32f4xx_hash.c,401 :: 		HASH_ContextSave->HASH_STR = HASH->STR;
ADDS	R2, R3, #4
MOVW	R1, #1032
MOVT	R1, #20486
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;stm32f4xx_hash.c,402 :: 		HASH_ContextSave->HASH_CR  = HASH->CR;
ADDW	R2, R3, #8
MOVW	R1, #1024
MOVT	R1, #20486
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;stm32f4xx_hash.c,403 :: 		for(i=0; i<=50;i++)
; i start address is: 0 (R0)
MOVS	R0, #0
; HASH_ContextSave end address is: 12 (R3)
; i end address is: 0 (R0)
MOV	R4, R3
L_HASH_SaveContext28:
; i start address is: 0 (R0)
; HASH_ContextSave start address is: 16 (R4)
; HASH_ContextSave start address is: 16 (R4)
; HASH_ContextSave end address is: 16 (R4)
CMP	R0, #50
IT	GT
BGT	L_HASH_SaveContext29
; HASH_ContextSave end address is: 16 (R4)
;stm32f4xx_hash.c,405 :: 		HASH_ContextSave->HASH_CSR[i] = HASH->CSR[i];
; HASH_ContextSave start address is: 16 (R4)
ADDW	R1, R4, #12
LSLS	R3, R0, #2
ADDS	R2, R1, R3
MOVW	R1, #1272
MOVT	R1, #20486
ADDS	R1, R1, R3
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;stm32f4xx_hash.c,403 :: 		for(i=0; i<=50;i++)
ADDS	R0, R0, #1
UXTB	R0, R0
;stm32f4xx_hash.c,406 :: 		}
; HASH_ContextSave end address is: 16 (R4)
; i end address is: 0 (R0)
IT	AL
BAL	L_HASH_SaveContext28
L_HASH_SaveContext29:
;stm32f4xx_hash.c,407 :: 		}
L_end_HASH_SaveContext:
BX	LR
; end of _HASH_SaveContext
_HASH_RestoreContext:
;stm32f4xx_hash.c,417 :: 		void HASH_RestoreContext(HASH_Context* HASH_ContextRestore)
; HASH_ContextRestore start address is: 0 (R0)
MOV	R3, R0
; HASH_ContextRestore end address is: 0 (R0)
; HASH_ContextRestore start address is: 12 (R3)
;stm32f4xx_hash.c,419 :: 		uint8_t i = 0;
;stm32f4xx_hash.c,422 :: 		HASH->IMR = HASH_ContextRestore->HASH_IMR;
LDR	R2, [R3, #0]
MOVW	R1, #1056
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_hash.c,423 :: 		HASH->STR = HASH_ContextRestore->HASH_STR;
ADDS	R1, R3, #4
LDR	R2, [R1, #0]
MOVW	R1, #1032
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_hash.c,424 :: 		HASH->CR = HASH_ContextRestore->HASH_CR;
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
MOVW	R2, #1024
MOVT	R2, #20486
STR	R1, [R2, #0]
;stm32f4xx_hash.c,427 :: 		HASH->CR |= HASH_CR_INIT;
ORR	R1, R1, #4
STR	R1, [R2, #0]
;stm32f4xx_hash.c,430 :: 		for(i=0; i<=50;i++)
; i start address is: 0 (R0)
MOVS	R0, #0
; HASH_ContextRestore end address is: 12 (R3)
; i end address is: 0 (R0)
MOV	R4, R3
L_HASH_RestoreContext31:
; i start address is: 0 (R0)
; HASH_ContextRestore start address is: 16 (R4)
; HASH_ContextRestore start address is: 16 (R4)
; HASH_ContextRestore end address is: 16 (R4)
CMP	R0, #50
IT	GT
BGT	L_HASH_RestoreContext32
; HASH_ContextRestore end address is: 16 (R4)
;stm32f4xx_hash.c,432 :: 		HASH->CSR[i] = HASH_ContextRestore->HASH_CSR[i];
; HASH_ContextRestore start address is: 16 (R4)
LSLS	R3, R0, #2
MOVW	R1, #1272
MOVT	R1, #20486
ADDS	R2, R1, R3
ADDW	R1, R4, #12
ADDS	R1, R1, R3
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;stm32f4xx_hash.c,430 :: 		for(i=0; i<=50;i++)
ADDS	R0, R0, #1
UXTB	R0, R0
;stm32f4xx_hash.c,433 :: 		}
; HASH_ContextRestore end address is: 16 (R4)
; i end address is: 0 (R0)
IT	AL
BAL	L_HASH_RestoreContext31
L_HASH_RestoreContext32:
;stm32f4xx_hash.c,434 :: 		}
L_end_HASH_RestoreContext:
BX	LR
; end of _HASH_RestoreContext
_HASH_DMACmd:
;stm32f4xx_hash.c,466 :: 		void HASH_DMACmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_hash.c,471 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_HASH_DMACmd34
; NewState end address is: 0 (R0)
;stm32f4xx_hash.c,474 :: 		HASH->CR |= HASH_CR_DMAE;
MOVW	R2, #1024
MOVT	R2, #20486
LDR	R1, [R2, #0]
ORR	R1, R1, #8
STR	R1, [R2, #0]
;stm32f4xx_hash.c,475 :: 		}
IT	AL
BAL	L_HASH_DMACmd35
L_HASH_DMACmd34:
;stm32f4xx_hash.c,479 :: 		HASH->CR &= ~HASH_CR_DMAE;
MOVW	R3, #1024
MOVT	R3, #20486
LDR	R2, [R3, #0]
MVN	R1, #8
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_hash.c,480 :: 		}
L_HASH_DMACmd35:
;stm32f4xx_hash.c,481 :: 		}
L_end_HASH_DMACmd:
BX	LR
; end of _HASH_DMACmd
_HASH_ITConfig:
;stm32f4xx_hash.c,561 :: 		void HASH_ITConfig(uint8_t HASH_IT, FunctionalState NewState)
; NewState start address is: 4 (R1)
; HASH_IT start address is: 0 (R0)
; NewState end address is: 4 (R1)
; HASH_IT end address is: 0 (R0)
; HASH_IT start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_hash.c,567 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_HASH_ITConfig36
; NewState end address is: 4 (R1)
;stm32f4xx_hash.c,570 :: 		HASH->IMR |= HASH_IT;
MOVW	R3, #1056
MOVT	R3, #20486
LDR	R2, [R3, #0]
ORRS	R2, R0
; HASH_IT end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_hash.c,571 :: 		}
IT	AL
BAL	L_HASH_ITConfig37
L_HASH_ITConfig36:
;stm32f4xx_hash.c,575 :: 		HASH->IMR &= (uint8_t) ~HASH_IT;
; HASH_IT start address is: 0 (R0)
MVN	R4, R0
UXTB	R4, R4
; HASH_IT end address is: 0 (R0)
MOVW	R3, #1056
MOVT	R3, #20486
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_hash.c,576 :: 		}
L_HASH_ITConfig37:
;stm32f4xx_hash.c,577 :: 		}
L_end_HASH_ITConfig:
BX	LR
; end of _HASH_ITConfig
_HASH_GetFlagStatus:
;stm32f4xx_hash.c,590 :: 		FlagStatus HASH_GetFlagStatus(uint16_t HASH_FLAG)
; HASH_FLAG start address is: 0 (R0)
; HASH_FLAG end address is: 0 (R0)
; HASH_FLAG start address is: 0 (R0)
;stm32f4xx_hash.c,592 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_hash.c,593 :: 		uint32_t tempreg = 0;
;stm32f4xx_hash.c,599 :: 		if ((HASH_FLAG & HASH_FLAG_DINNE) != (uint16_t)RESET )
AND	R1, R0, #4096
UXTH	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_HASH_GetFlagStatus38
;stm32f4xx_hash.c,601 :: 		tempreg = HASH->CR;
MOVW	R1, #1024
MOVT	R1, #20486
; tempreg start address is: 8 (R2)
LDR	R2, [R1, #0]
;stm32f4xx_hash.c,602 :: 		}
; tempreg end address is: 8 (R2)
IT	AL
BAL	L_HASH_GetFlagStatus39
L_HASH_GetFlagStatus38:
;stm32f4xx_hash.c,605 :: 		tempreg = HASH->SR;
MOVW	R1, #1060
MOVT	R1, #20486
; tempreg start address is: 8 (R2)
LDR	R2, [R1, #0]
; tempreg end address is: 8 (R2)
;stm32f4xx_hash.c,606 :: 		}
L_HASH_GetFlagStatus39:
;stm32f4xx_hash.c,609 :: 		if ((tempreg & HASH_FLAG) != (uint16_t)RESET)
; tempreg start address is: 8 (R2)
AND	R1, R2, R0, LSL #0
; HASH_FLAG end address is: 0 (R0)
; tempreg end address is: 8 (R2)
CMP	R1, #0
IT	EQ
BEQ	L_HASH_GetFlagStatus40
;stm32f4xx_hash.c,612 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_hash.c,613 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_HASH_GetFlagStatus41
L_HASH_GetFlagStatus40:
;stm32f4xx_hash.c,617 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_hash.c,618 :: 		}
L_HASH_GetFlagStatus41:
;stm32f4xx_hash.c,621 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_hash.c,622 :: 		}
L_end_HASH_GetFlagStatus:
BX	LR
; end of _HASH_GetFlagStatus
_HASH_ClearFlag:
;stm32f4xx_hash.c,631 :: 		void HASH_ClearFlag(uint16_t HASH_FLAG)
; HASH_FLAG start address is: 0 (R0)
; HASH_FLAG end address is: 0 (R0)
; HASH_FLAG start address is: 0 (R0)
;stm32f4xx_hash.c,637 :: 		HASH->SR = ~(uint32_t)HASH_FLAG;
UXTH	R1, R0
; HASH_FLAG end address is: 0 (R0)
MVN	R2, R1
MOVW	R1, #1060
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_hash.c,638 :: 		}
L_end_HASH_ClearFlag:
BX	LR
; end of _HASH_ClearFlag
_HASH_GetITStatus:
;stm32f4xx_hash.c,647 :: 		ITStatus HASH_GetITStatus(uint8_t HASH_IT)
; HASH_IT start address is: 0 (R0)
; HASH_IT end address is: 0 (R0)
; HASH_IT start address is: 0 (R0)
;stm32f4xx_hash.c,649 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_hash.c,650 :: 		uint32_t tmpreg = 0;
;stm32f4xx_hash.c,659 :: 		if (((HASH->IMR & tmpreg) & HASH_IT) != RESET)
MOVW	R1, #1060
MOVT	R1, #20486
LDR	R2, [R1, #0]
MOVW	R1, #1056
MOVT	R1, #20486
LDR	R1, [R1, #0]
ANDS	R1, R2
ANDS	R1, R0
; HASH_IT end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_HASH_GetITStatus42
;stm32f4xx_hash.c,662 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_hash.c,663 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_HASH_GetITStatus43
L_HASH_GetITStatus42:
;stm32f4xx_hash.c,667 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_hash.c,668 :: 		}
L_HASH_GetITStatus43:
;stm32f4xx_hash.c,670 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_hash.c,671 :: 		}
L_end_HASH_GetITStatus:
BX	LR
; end of _HASH_GetITStatus
_HASH_ClearITPendingBit:
;stm32f4xx_hash.c,681 :: 		void HASH_ClearITPendingBit(uint8_t HASH_IT)
; HASH_IT start address is: 0 (R0)
; HASH_IT end address is: 0 (R0)
; HASH_IT start address is: 0 (R0)
;stm32f4xx_hash.c,687 :: 		HASH->SR = (uint8_t)~HASH_IT;
MVN	R2, R0
UXTB	R2, R2
; HASH_IT end address is: 0 (R0)
MOVW	R1, #1060
MOVT	R1, #20486
STR	R2, [R1, #0]
;stm32f4xx_hash.c,688 :: 		}
L_end_HASH_ClearITPendingBit:
BX	LR
; end of _HASH_ClearITPendingBit
