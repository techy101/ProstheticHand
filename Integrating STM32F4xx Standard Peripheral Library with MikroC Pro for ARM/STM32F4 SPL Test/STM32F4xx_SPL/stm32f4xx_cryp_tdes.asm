stm32f4xx_cryp_tdes___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_cryp_tdes___DSB
stm32f4xx_cryp_tdes___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_cryp_tdes___WFI
stm32f4xx_cryp_tdes___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_cryp_tdes___WFE
stm32f4xx_cryp_tdes___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_cryp_tdes___REV
stm32f4xx_cryp_tdes_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_cryp_tdes_NVIC_SetPriorityGrouping
stm32f4xx_cryp_tdes_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_cryp_tdes_NVIC_GetPriorityGrouping
stm32f4xx_cryp_tdes_NVIC_EnableIRQ:
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
; end of stm32f4xx_cryp_tdes_NVIC_EnableIRQ
stm32f4xx_cryp_tdes_NVIC_DisableIRQ:
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
; end of stm32f4xx_cryp_tdes_NVIC_DisableIRQ
stm32f4xx_cryp_tdes_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_cryp_tdes_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_cryp_tdes_NVIC_GetPendingIRQ1
L_stm32f4xx_cryp_tdes_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_cryp_tdes_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_cryp_tdes_NVIC_GetPendingIRQ
stm32f4xx_cryp_tdes_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_cryp_tdes_NVIC_SetPendingIRQ
stm32f4xx_cryp_tdes_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_cryp_tdes_NVIC_ClearPendingIRQ
stm32f4xx_cryp_tdes_NVIC_GetActive:
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
BEQ	L_stm32f4xx_cryp_tdes_NVIC_GetActive2
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_cryp_tdes_NVIC_GetActive3
L_stm32f4xx_cryp_tdes_NVIC_GetActive2:
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_cryp_tdes_NVIC_GetActive3:
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_cryp_tdes_NVIC_GetActive
stm32f4xx_cryp_tdes_NVIC_SetPriority:
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
BGE	L_stm32f4xx_cryp_tdes_NVIC_SetPriority4
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
BAL	L_stm32f4xx_cryp_tdes_NVIC_SetPriority5
L_stm32f4xx_cryp_tdes_NVIC_SetPriority4:
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
L_stm32f4xx_cryp_tdes_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_cryp_tdes_NVIC_SetPriority
stm32f4xx_cryp_tdes_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_cryp_tdes_NVIC_GetPriority6
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
L_stm32f4xx_cryp_tdes_NVIC_GetPriority6:
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
; end of stm32f4xx_cryp_tdes_NVIC_GetPriority
stm32f4xx_cryp_tdes_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_cryp_tdes_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_cryp_tdes_NVIC_EncodePriority9
L_stm32f4xx_cryp_tdes_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_cryp_tdes_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_cryp_tdes_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_cryp_tdes_NVIC_EncodePriority11
L_stm32f4xx_cryp_tdes_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_cryp_tdes_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_cryp_tdes_NVIC_EncodePriority
stm32f4xx_cryp_tdes_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_cryp_tdes_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_cryp_tdes_NVIC_DecodePriority13
L_stm32f4xx_cryp_tdes_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_cryp_tdes_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_cryp_tdes_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_cryp_tdes_NVIC_DecodePriority15
L_stm32f4xx_cryp_tdes_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_cryp_tdes_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_cryp_tdes_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_cryp_tdes_NVIC_DecodePriority
stm32f4xx_cryp_tdes_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_cryp_tdes___DSB+0
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
BL	stm32f4xx_cryp_tdes___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_cryp_tdes_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_cryp_tdes_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_cryp_tdes_NVIC_SystemReset
stm32f4xx_cryp_tdes_SysTick_Config:
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
BLS	L_stm32f4xx_cryp_tdes_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_cryp_tdes_SysTick_Config18:
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
BL	stm32f4xx_cryp_tdes_NVIC_SetPriority+0
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
; end of stm32f4xx_cryp_tdes_SysTick_Config
stm32f4xx_cryp_tdes_ITM_SendChar:
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
BEQ	L_stm32f4xx_cryp_tdes_ITM_SendChar59
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_cryp_tdes_ITM_SendChar60
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_cryp_tdes_ITM_SendChar61
L_stm32f4xx_cryp_tdes_ITM_SendChar55:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_cryp_tdes_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_cryp_tdes_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_cryp_tdes_ITM_SendChar22
L_stm32f4xx_cryp_tdes_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_cryp_tdes_ITM_SendChar58
L_stm32f4xx_cryp_tdes_ITM_SendChar59:
L_stm32f4xx_cryp_tdes_ITM_SendChar58:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_cryp_tdes_ITM_SendChar57
L_stm32f4xx_cryp_tdes_ITM_SendChar60:
L_stm32f4xx_cryp_tdes_ITM_SendChar57:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_cryp_tdes_ITM_SendChar56
L_stm32f4xx_cryp_tdes_ITM_SendChar61:
L_stm32f4xx_cryp_tdes_ITM_SendChar56:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_cryp_tdes_ITM_SendChar
stm32f4xx_cryp_tdes_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_cryp_tdes_ITM_ReceiveChar24
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
L_stm32f4xx_cryp_tdes_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_cryp_tdes_ITM_ReceiveChar
stm32f4xx_cryp_tdes_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_cryp_tdes_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_cryp_tdes_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_cryp_tdes_ITM_CheckChar
_CRYP_TDES_ECB:
;stm32f4xx_cryp_tdes.c,103 :: 		uint32_t Ilength, uint8_t *Output)
; Input start address is: 8 (R2)
; Key start address is: 4 (R1)
SUB	SP, SP, #80
STR	LR, [SP, #0]
STRB	R0, [SP, #64]
MOV	R0, R1
STR	R3, [SP, #68]
; Input end address is: 8 (R2)
; Key end address is: 4 (R1)
; Key start address is: 0 (R0)
; Input start address is: 8 (R2)
; Output start address is: 12 (R3)
LDR	R3, [SP, #80]
;stm32f4xx_cryp_tdes.c,107 :: 		__IO uint32_t counter = 0;
;stm32f4xx_cryp_tdes.c,108 :: 		uint32_t busystatus = 0;
;stm32f4xx_cryp_tdes.c,109 :: 		ErrorStatus status = SUCCESS;
MOVS	R4, #1
STRB	R4, [SP, #56]
;stm32f4xx_cryp_tdes.c,110 :: 		uint32_t keyaddr    = (uint32_t)Key;
; keyaddr start address is: 4 (R1)
MOV	R1, R0
; Key end address is: 0 (R0)
;stm32f4xx_cryp_tdes.c,111 :: 		uint32_t inputaddr  = (uint32_t)Input;
STR	R2, [SP, #48]
; Input end address is: 8 (R2)
;stm32f4xx_cryp_tdes.c,112 :: 		uint32_t outputaddr = (uint32_t)Output;
STR	R3, [SP, #52]
; Output end address is: 12 (R3)
;stm32f4xx_cryp_tdes.c,113 :: 		uint32_t i = 0;
;stm32f4xx_cryp_tdes.c,116 :: 		CRYP_KeyStructInit(&TDES_CRYP_KeyInitStructure);
ADD	R4, SP, #16
STR	R1, [SP, #4]
MOV	R0, R4
BL	_CRYP_KeyStructInit+0
LDR	R1, [SP, #4]
;stm32f4xx_cryp_tdes.c,119 :: 		if(Mode == MODE_ENCRYPT) /* TDES encryption */
LDRB	R4, [SP, #64]
CMP	R4, #1
IT	NE
BNE	L_CRYP_TDES_ECB27
;stm32f4xx_cryp_tdes.c,121 :: 		TDES_CRYP_InitStructure.CRYP_AlgoDir = CRYP_AlgoDir_Encrypt;
MOVW	R4, #0
STRH	R4, [SP, #8]
;stm32f4xx_cryp_tdes.c,122 :: 		}
IT	AL
BAL	L_CRYP_TDES_ECB28
L_CRYP_TDES_ECB27:
;stm32f4xx_cryp_tdes.c,125 :: 		TDES_CRYP_InitStructure.CRYP_AlgoDir = CRYP_AlgoDir_Decrypt;
MOVW	R4, #4
STRH	R4, [SP, #8]
;stm32f4xx_cryp_tdes.c,126 :: 		}
L_CRYP_TDES_ECB28:
;stm32f4xx_cryp_tdes.c,128 :: 		TDES_CRYP_InitStructure.CRYP_AlgoMode = CRYP_AlgoMode_TDES_ECB;
MOVW	R4, #0
STRH	R4, [SP, #10]
;stm32f4xx_cryp_tdes.c,129 :: 		TDES_CRYP_InitStructure.CRYP_DataType = CRYP_DataType_8b;
MOVW	R4, #128
STRH	R4, [SP, #12]
;stm32f4xx_cryp_tdes.c,130 :: 		CRYP_Init(&TDES_CRYP_InitStructure);
ADD	R4, SP, #8
STR	R1, [SP, #4]
MOV	R0, R4
BL	_CRYP_Init+0
LDR	R1, [SP, #4]
;stm32f4xx_cryp_tdes.c,133 :: 		TDES_CRYP_KeyInitStructure.CRYP_Key1Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R1, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #24]
;stm32f4xx_cryp_tdes.c,134 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_tdes.c,135 :: 		TDES_CRYP_KeyInitStructure.CRYP_Key1Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #28]
;stm32f4xx_cryp_tdes.c,136 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_tdes.c,137 :: 		TDES_CRYP_KeyInitStructure.CRYP_Key2Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #32]
;stm32f4xx_cryp_tdes.c,138 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_tdes.c,139 :: 		TDES_CRYP_KeyInitStructure.CRYP_Key2Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #36]
;stm32f4xx_cryp_tdes.c,140 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_tdes.c,141 :: 		TDES_CRYP_KeyInitStructure.CRYP_Key3Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #40]
;stm32f4xx_cryp_tdes.c,142 :: 		keyaddr+=4;
ADDS	R4, R1, #4
; keyaddr end address is: 4 (R1)
;stm32f4xx_cryp_tdes.c,143 :: 		TDES_CRYP_KeyInitStructure.CRYP_Key3Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #44]
;stm32f4xx_cryp_tdes.c,144 :: 		CRYP_KeyInit(& TDES_CRYP_KeyInitStructure);
ADD	R4, SP, #16
MOV	R0, R4
BL	_CRYP_KeyInit+0
;stm32f4xx_cryp_tdes.c,147 :: 		CRYP_FIFOFlush();
BL	_CRYP_FIFOFlush+0
;stm32f4xx_cryp_tdes.c,150 :: 		CRYP_Cmd(ENABLE);
MOVS	R0, #1
BL	_CRYP_Cmd+0
;stm32f4xx_cryp_tdes.c,152 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=8)
MOV	R4, #0
STR	R4, [SP, #60]
L_CRYP_TDES_ECB29:
LDR	R5, [SP, #68]
LDR	R4, [SP, #60]
CMP	R4, R5
IT	CS
BCS	L__CRYP_TDES_ECB67
LDRB	R4, [SP, #56]
CMP	R4, #0
IT	EQ
BEQ	L__CRYP_TDES_ECB66
L__CRYP_TDES_ECB63:
;stm32f4xx_cryp_tdes.c,155 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [SP, #48]
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_tdes.c,156 :: 		inputaddr+=4;
LDR	R4, [SP, #48]
ADDS	R4, R4, #4
STR	R4, [SP, #48]
;stm32f4xx_cryp_tdes.c,157 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_tdes.c,158 :: 		inputaddr+=4;
LDR	R4, [SP, #48]
ADDS	R4, R4, #4
STR	R4, [SP, #48]
;stm32f4xx_cryp_tdes.c,161 :: 		counter = 0;
; counter start address is: 28 (R7)
MOV	R7, #0
; counter end address is: 28 (R7)
MOV	R1, R7
;stm32f4xx_cryp_tdes.c,162 :: 		do
L_CRYP_TDES_ECB34:
;stm32f4xx_cryp_tdes.c,164 :: 		busystatus = CRYP_GetFlagStatus(CRYP_FLAG_BUSY);
; counter start address is: 4 (R1)
STR	R1, [SP, #4]
MOVS	R0, #16
BL	_CRYP_GetFlagStatus+0
LDR	R1, [SP, #4]
; busystatus start address is: 0 (R0)
;stm32f4xx_cryp_tdes.c,165 :: 		counter++;
ADDS	R4, R1, #1
; counter end address is: 4 (R1)
; counter start address is: 28 (R7)
MOV	R7, R4
;stm32f4xx_cryp_tdes.c,166 :: 		}while ((counter != TDESBUSY_TIMEOUT) && (busystatus != RESET));
CMP	R7, #65536
IT	EQ
BEQ	L__CRYP_TDES_ECB65
CMP	R0, #0
IT	EQ
BEQ	L__CRYP_TDES_ECB64
MOV	R1, R7
; counter end address is: 28 (R7)
IT	AL
BAL	L_CRYP_TDES_ECB34
L__CRYP_TDES_ECB65:
L__CRYP_TDES_ECB64:
;stm32f4xx_cryp_tdes.c,168 :: 		if (busystatus != RESET)
CMP	R0, #0
IT	EQ
BEQ	L_CRYP_TDES_ECB39
; busystatus end address is: 0 (R0)
;stm32f4xx_cryp_tdes.c,170 :: 		status = ERROR;
MOVS	R4, #0
STRB	R4, [SP, #56]
;stm32f4xx_cryp_tdes.c,171 :: 		}
IT	AL
BAL	L_CRYP_TDES_ECB40
L_CRYP_TDES_ECB39:
;stm32f4xx_cryp_tdes.c,176 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
LDR	R4, [SP, #52]
STR	R4, [SP, #76]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #76]
STR	R0, [R4, #0]
;stm32f4xx_cryp_tdes.c,177 :: 		outputaddr+=4;
LDR	R4, [SP, #52]
ADDS	R4, R4, #4
STR	R4, [SP, #52]
;stm32f4xx_cryp_tdes.c,178 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
STR	R4, [SP, #76]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #76]
STR	R0, [R4, #0]
;stm32f4xx_cryp_tdes.c,179 :: 		outputaddr+=4;
LDR	R4, [SP, #52]
ADDS	R4, R4, #4
STR	R4, [SP, #52]
;stm32f4xx_cryp_tdes.c,180 :: 		}
L_CRYP_TDES_ECB40:
;stm32f4xx_cryp_tdes.c,152 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=8)
LDR	R4, [SP, #60]
ADDS	R4, #8
STR	R4, [SP, #60]
;stm32f4xx_cryp_tdes.c,181 :: 		}
IT	AL
BAL	L_CRYP_TDES_ECB29
;stm32f4xx_cryp_tdes.c,152 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=8)
L__CRYP_TDES_ECB67:
L__CRYP_TDES_ECB66:
;stm32f4xx_cryp_tdes.c,184 :: 		CRYP_Cmd(DISABLE);
MOVS	R0, #0
BL	_CRYP_Cmd+0
;stm32f4xx_cryp_tdes.c,186 :: 		return status;
LDRB	R0, [SP, #56]
;stm32f4xx_cryp_tdes.c,187 :: 		}
L_end_CRYP_TDES_ECB:
LDR	LR, [SP, #0]
ADD	SP, SP, #80
BX	LR
; end of _CRYP_TDES_ECB
_CRYP_TDES_CBC:
;stm32f4xx_cryp_tdes.c,205 :: 		uint8_t *Input, uint32_t Ilength, uint8_t *Output)
; Input start address is: 12 (R3)
; InitVectors start address is: 8 (R2)
; Key start address is: 4 (R1)
SUB	SP, SP, #96
STR	LR, [SP, #0]
STRB	R0, [SP, #84]
MOV	R0, R1
; Input end address is: 12 (R3)
; InitVectors end address is: 8 (R2)
; Key end address is: 4 (R1)
; Key start address is: 0 (R0)
; InitVectors start address is: 8 (R2)
; Input start address is: 12 (R3)
LDR	R4, [SP, #96]
STR	R4, [SP, #96]
; Output start address is: 20 (R5)
LDR	R5, [SP, #100]
;stm32f4xx_cryp_tdes.c,210 :: 		__IO uint32_t counter = 0;
;stm32f4xx_cryp_tdes.c,211 :: 		uint32_t busystatus = 0;
;stm32f4xx_cryp_tdes.c,212 :: 		ErrorStatus status = SUCCESS;
MOVS	R4, #1
STRB	R4, [SP, #76]
;stm32f4xx_cryp_tdes.c,213 :: 		uint32_t keyaddr    = (uint32_t)Key;
; keyaddr start address is: 4 (R1)
MOV	R1, R0
; Key end address is: 0 (R0)
;stm32f4xx_cryp_tdes.c,214 :: 		uint32_t inputaddr  = (uint32_t)Input;
STR	R3, [SP, #64]
; Input end address is: 12 (R3)
;stm32f4xx_cryp_tdes.c,215 :: 		uint32_t outputaddr = (uint32_t)Output;
STR	R5, [SP, #68]
; Output end address is: 20 (R5)
;stm32f4xx_cryp_tdes.c,216 :: 		uint32_t ivaddr     = (uint32_t)InitVectors;
STR	R2, [SP, #72]
; InitVectors end address is: 8 (R2)
;stm32f4xx_cryp_tdes.c,217 :: 		uint32_t i = 0;
;stm32f4xx_cryp_tdes.c,220 :: 		CRYP_KeyStructInit(&TDES_CRYP_KeyInitStructure);
ADD	R4, SP, #16
STR	R1, [SP, #4]
MOV	R0, R4
BL	_CRYP_KeyStructInit+0
LDR	R1, [SP, #4]
;stm32f4xx_cryp_tdes.c,223 :: 		if(Mode == MODE_ENCRYPT) /* TDES encryption */
LDRB	R4, [SP, #84]
CMP	R4, #1
IT	NE
BNE	L_CRYP_TDES_CBC41
;stm32f4xx_cryp_tdes.c,225 :: 		TDES_CRYP_InitStructure.CRYP_AlgoDir = CRYP_AlgoDir_Encrypt;
MOVW	R4, #0
STRH	R4, [SP, #8]
;stm32f4xx_cryp_tdes.c,226 :: 		}
IT	AL
BAL	L_CRYP_TDES_CBC42
L_CRYP_TDES_CBC41:
;stm32f4xx_cryp_tdes.c,229 :: 		TDES_CRYP_InitStructure.CRYP_AlgoDir = CRYP_AlgoDir_Decrypt;
MOVW	R4, #4
STRH	R4, [SP, #8]
;stm32f4xx_cryp_tdes.c,230 :: 		}
L_CRYP_TDES_CBC42:
;stm32f4xx_cryp_tdes.c,231 :: 		TDES_CRYP_InitStructure.CRYP_AlgoMode = CRYP_AlgoMode_TDES_CBC;
MOVW	R4, #8
STRH	R4, [SP, #10]
;stm32f4xx_cryp_tdes.c,232 :: 		TDES_CRYP_InitStructure.CRYP_DataType = CRYP_DataType_8b;
MOVW	R4, #128
STRH	R4, [SP, #12]
;stm32f4xx_cryp_tdes.c,234 :: 		CRYP_Init(&TDES_CRYP_InitStructure);
ADD	R4, SP, #8
STR	R1, [SP, #4]
MOV	R0, R4
BL	_CRYP_Init+0
LDR	R1, [SP, #4]
;stm32f4xx_cryp_tdes.c,237 :: 		TDES_CRYP_KeyInitStructure.CRYP_Key1Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R1, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #24]
;stm32f4xx_cryp_tdes.c,238 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_tdes.c,239 :: 		TDES_CRYP_KeyInitStructure.CRYP_Key1Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #28]
;stm32f4xx_cryp_tdes.c,240 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_tdes.c,241 :: 		TDES_CRYP_KeyInitStructure.CRYP_Key2Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #32]
;stm32f4xx_cryp_tdes.c,242 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_tdes.c,243 :: 		TDES_CRYP_KeyInitStructure.CRYP_Key2Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #36]
;stm32f4xx_cryp_tdes.c,244 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_tdes.c,245 :: 		TDES_CRYP_KeyInitStructure.CRYP_Key3Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #40]
;stm32f4xx_cryp_tdes.c,246 :: 		keyaddr+=4;
ADDS	R4, R1, #4
; keyaddr end address is: 4 (R1)
;stm32f4xx_cryp_tdes.c,247 :: 		TDES_CRYP_KeyInitStructure.CRYP_Key3Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #44]
;stm32f4xx_cryp_tdes.c,248 :: 		CRYP_KeyInit(& TDES_CRYP_KeyInitStructure);
ADD	R4, SP, #16
MOV	R0, R4
BL	_CRYP_KeyInit+0
;stm32f4xx_cryp_tdes.c,251 :: 		TDES_CRYP_IVInitStructure.CRYP_IV0Left = __REV(*(uint32_t*)(ivaddr));
LDR	R4, [SP, #72]
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #48]
;stm32f4xx_cryp_tdes.c,252 :: 		ivaddr+=4;
LDR	R4, [SP, #72]
ADDS	R4, R4, #4
;stm32f4xx_cryp_tdes.c,253 :: 		TDES_CRYP_IVInitStructure.CRYP_IV0Right= __REV(*(uint32_t*)(ivaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_tdes___REV+0
STR	R0, [SP, #52]
;stm32f4xx_cryp_tdes.c,254 :: 		CRYP_IVInit(&TDES_CRYP_IVInitStructure);
ADD	R4, SP, #48
MOV	R0, R4
BL	_CRYP_IVInit+0
;stm32f4xx_cryp_tdes.c,257 :: 		CRYP_FIFOFlush();
BL	_CRYP_FIFOFlush+0
;stm32f4xx_cryp_tdes.c,260 :: 		CRYP_Cmd(ENABLE);
MOVS	R0, #1
BL	_CRYP_Cmd+0
;stm32f4xx_cryp_tdes.c,262 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=8)
MOV	R4, #0
STR	R4, [SP, #80]
L_CRYP_TDES_CBC43:
LDR	R5, [SP, #96]
LDR	R4, [SP, #80]
CMP	R4, R5
IT	CS
BCS	L__CRYP_TDES_CBC73
LDRB	R4, [SP, #76]
CMP	R4, #0
IT	EQ
BEQ	L__CRYP_TDES_CBC72
L__CRYP_TDES_CBC69:
;stm32f4xx_cryp_tdes.c,265 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [SP, #64]
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_tdes.c,266 :: 		inputaddr+=4;
LDR	R4, [SP, #64]
ADDS	R4, R4, #4
STR	R4, [SP, #64]
;stm32f4xx_cryp_tdes.c,267 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_tdes.c,268 :: 		inputaddr+=4;
LDR	R4, [SP, #64]
ADDS	R4, R4, #4
STR	R4, [SP, #64]
;stm32f4xx_cryp_tdes.c,271 :: 		counter = 0;
; counter start address is: 28 (R7)
MOV	R7, #0
; counter end address is: 28 (R7)
MOV	R1, R7
;stm32f4xx_cryp_tdes.c,272 :: 		do
L_CRYP_TDES_CBC48:
;stm32f4xx_cryp_tdes.c,274 :: 		busystatus = CRYP_GetFlagStatus(CRYP_FLAG_BUSY);
; counter start address is: 4 (R1)
STR	R1, [SP, #4]
MOVS	R0, #16
BL	_CRYP_GetFlagStatus+0
LDR	R1, [SP, #4]
; busystatus start address is: 0 (R0)
;stm32f4xx_cryp_tdes.c,275 :: 		counter++;
ADDS	R4, R1, #1
; counter end address is: 4 (R1)
; counter start address is: 28 (R7)
MOV	R7, R4
;stm32f4xx_cryp_tdes.c,276 :: 		}while ((counter != TDESBUSY_TIMEOUT) && (busystatus != RESET));
CMP	R7, #65536
IT	EQ
BEQ	L__CRYP_TDES_CBC71
CMP	R0, #0
IT	EQ
BEQ	L__CRYP_TDES_CBC70
MOV	R1, R7
; counter end address is: 28 (R7)
IT	AL
BAL	L_CRYP_TDES_CBC48
L__CRYP_TDES_CBC71:
L__CRYP_TDES_CBC70:
;stm32f4xx_cryp_tdes.c,278 :: 		if (busystatus != RESET)
CMP	R0, #0
IT	EQ
BEQ	L_CRYP_TDES_CBC53
; busystatus end address is: 0 (R0)
;stm32f4xx_cryp_tdes.c,280 :: 		status = ERROR;
MOVS	R4, #0
STRB	R4, [SP, #76]
;stm32f4xx_cryp_tdes.c,281 :: 		}
IT	AL
BAL	L_CRYP_TDES_CBC54
L_CRYP_TDES_CBC53:
;stm32f4xx_cryp_tdes.c,286 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
LDR	R4, [SP, #68]
STR	R4, [SP, #92]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #92]
STR	R0, [R4, #0]
;stm32f4xx_cryp_tdes.c,287 :: 		outputaddr+=4;
LDR	R4, [SP, #68]
ADDS	R4, R4, #4
STR	R4, [SP, #68]
;stm32f4xx_cryp_tdes.c,288 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
STR	R4, [SP, #92]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #92]
STR	R0, [R4, #0]
;stm32f4xx_cryp_tdes.c,289 :: 		outputaddr+=4;
LDR	R4, [SP, #68]
ADDS	R4, R4, #4
STR	R4, [SP, #68]
;stm32f4xx_cryp_tdes.c,290 :: 		}
L_CRYP_TDES_CBC54:
;stm32f4xx_cryp_tdes.c,262 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=8)
LDR	R4, [SP, #80]
ADDS	R4, #8
STR	R4, [SP, #80]
;stm32f4xx_cryp_tdes.c,291 :: 		}
IT	AL
BAL	L_CRYP_TDES_CBC43
;stm32f4xx_cryp_tdes.c,262 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=8)
L__CRYP_TDES_CBC73:
L__CRYP_TDES_CBC72:
;stm32f4xx_cryp_tdes.c,294 :: 		CRYP_Cmd(DISABLE);
MOVS	R0, #0
BL	_CRYP_Cmd+0
;stm32f4xx_cryp_tdes.c,296 :: 		return status;
LDRB	R0, [SP, #76]
;stm32f4xx_cryp_tdes.c,297 :: 		}
L_end_CRYP_TDES_CBC:
LDR	LR, [SP, #0]
ADD	SP, SP, #96
BX	LR
; end of _CRYP_TDES_CBC
