stm32f4xx_cryp_aes___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_cryp_aes___DSB
stm32f4xx_cryp_aes___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_cryp_aes___WFI
stm32f4xx_cryp_aes___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_cryp_aes___WFE
stm32f4xx_cryp_aes___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_cryp_aes___REV
stm32f4xx_cryp_aes_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_cryp_aes_NVIC_SetPriorityGrouping
stm32f4xx_cryp_aes_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_cryp_aes_NVIC_GetPriorityGrouping
stm32f4xx_cryp_aes_NVIC_EnableIRQ:
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
; end of stm32f4xx_cryp_aes_NVIC_EnableIRQ
stm32f4xx_cryp_aes_NVIC_DisableIRQ:
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
; end of stm32f4xx_cryp_aes_NVIC_DisableIRQ
stm32f4xx_cryp_aes_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_cryp_aes_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_cryp_aes_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_cryp_aes_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_cryp_aes_NVIC_GetPendingIRQ1
L_stm32f4xx_cryp_aes_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_cryp_aes_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_cryp_aes_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_cryp_aes_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_cryp_aes_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_cryp_aes_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_cryp_aes_NVIC_GetPendingIRQ
stm32f4xx_cryp_aes_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_cryp_aes_NVIC_SetPendingIRQ
stm32f4xx_cryp_aes_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_cryp_aes_NVIC_ClearPendingIRQ
stm32f4xx_cryp_aes_NVIC_GetActive:
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
BEQ	L_stm32f4xx_cryp_aes_NVIC_GetActive2
; ?FLOC__stm32f4xx_cryp_aes_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_cryp_aes_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_cryp_aes_NVIC_GetActive3
L_stm32f4xx_cryp_aes_NVIC_GetActive2:
; ?FLOC__stm32f4xx_cryp_aes_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_cryp_aes_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_cryp_aes_NVIC_GetActive3:
; ?FLOC__stm32f4xx_cryp_aes_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_cryp_aes_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_cryp_aes_NVIC_GetActive
stm32f4xx_cryp_aes_NVIC_SetPriority:
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
BGE	L_stm32f4xx_cryp_aes_NVIC_SetPriority4
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
BAL	L_stm32f4xx_cryp_aes_NVIC_SetPriority5
L_stm32f4xx_cryp_aes_NVIC_SetPriority4:
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
L_stm32f4xx_cryp_aes_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_cryp_aes_NVIC_SetPriority
stm32f4xx_cryp_aes_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_cryp_aes_NVIC_GetPriority6
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
L_stm32f4xx_cryp_aes_NVIC_GetPriority6:
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
; end of stm32f4xx_cryp_aes_NVIC_GetPriority
stm32f4xx_cryp_aes_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_cryp_aes_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_cryp_aes_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_cryp_aes_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_cryp_aes_NVIC_EncodePriority9
L_stm32f4xx_cryp_aes_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_cryp_aes_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_cryp_aes_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_cryp_aes_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_cryp_aes_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_cryp_aes_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_cryp_aes_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_cryp_aes_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_cryp_aes_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_cryp_aes_NVIC_EncodePriority11
L_stm32f4xx_cryp_aes_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_cryp_aes_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_cryp_aes_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_cryp_aes_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_cryp_aes_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_cryp_aes_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_cryp_aes_NVIC_EncodePriority
stm32f4xx_cryp_aes_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_cryp_aes_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_cryp_aes_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_cryp_aes_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_cryp_aes_NVIC_DecodePriority13
L_stm32f4xx_cryp_aes_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_cryp_aes_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_cryp_aes_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_cryp_aes_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_cryp_aes_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_cryp_aes_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_cryp_aes_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_cryp_aes_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_cryp_aes_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_cryp_aes_NVIC_DecodePriority15
L_stm32f4xx_cryp_aes_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_cryp_aes_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_cryp_aes_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_cryp_aes_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_cryp_aes_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_cryp_aes_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_cryp_aes_NVIC_DecodePriority
stm32f4xx_cryp_aes_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_cryp_aes___DSB+0
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
BL	stm32f4xx_cryp_aes___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_cryp_aes_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_cryp_aes_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_cryp_aes_NVIC_SystemReset
stm32f4xx_cryp_aes_SysTick_Config:
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
BLS	L_stm32f4xx_cryp_aes_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_cryp_aes_SysTick_Config18:
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
BL	stm32f4xx_cryp_aes_NVIC_SetPriority+0
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
; end of stm32f4xx_cryp_aes_SysTick_Config
stm32f4xx_cryp_aes_ITM_SendChar:
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
BEQ	L_stm32f4xx_cryp_aes_ITM_SendChar105
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_cryp_aes_ITM_SendChar106
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_cryp_aes_ITM_SendChar107
L_stm32f4xx_cryp_aes_ITM_SendChar101:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_cryp_aes_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_cryp_aes_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_cryp_aes_ITM_SendChar22
L_stm32f4xx_cryp_aes_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_cryp_aes_ITM_SendChar104
L_stm32f4xx_cryp_aes_ITM_SendChar105:
L_stm32f4xx_cryp_aes_ITM_SendChar104:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_cryp_aes_ITM_SendChar103
L_stm32f4xx_cryp_aes_ITM_SendChar106:
L_stm32f4xx_cryp_aes_ITM_SendChar103:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_cryp_aes_ITM_SendChar102
L_stm32f4xx_cryp_aes_ITM_SendChar107:
L_stm32f4xx_cryp_aes_ITM_SendChar102:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_cryp_aes_ITM_SendChar
stm32f4xx_cryp_aes_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_cryp_aes_ITM_ReceiveChar24
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
L_stm32f4xx_cryp_aes_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_cryp_aes_ITM_ReceiveChar
stm32f4xx_cryp_aes_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_cryp_aes_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_cryp_aes_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_cryp_aes_ITM_CheckChar
_CRYP_AES_ECB:
;stm32f4xx_cryp_aes.c,105 :: 		uint8_t* Input, uint32_t Ilength, uint8_t* Output)
; Input start address is: 12 (R3)
; Keysize start address is: 8 (R2)
; Key start address is: 4 (R1)
SUB	SP, SP, #84
STR	LR, [SP, #0]
STRB	R0, [SP, #72]
MOV	R0, R1
; Input end address is: 12 (R3)
; Keysize end address is: 8 (R2)
; Key end address is: 4 (R1)
; Key start address is: 0 (R0)
; Keysize start address is: 8 (R2)
; Input start address is: 12 (R3)
LDR	R4, [SP, #84]
STR	R4, [SP, #84]
; Output start address is: 20 (R5)
LDR	R5, [SP, #88]
;stm32f4xx_cryp_aes.c,109 :: 		__IO uint32_t counter = 0;
MOV	R4, #0
STR	R4, [SP, #60]
MOVS	R4, #1
STRB	R4, [SP, #64]
;stm32f4xx_cryp_aes.c,110 :: 		uint32_t busystatus = 0;
;stm32f4xx_cryp_aes.c,111 :: 		ErrorStatus status = SUCCESS;
;stm32f4xx_cryp_aes.c,112 :: 		uint32_t keyaddr    = (uint32_t)Key;
; keyaddr start address is: 4 (R1)
MOV	R1, R0
; Key end address is: 0 (R0)
;stm32f4xx_cryp_aes.c,113 :: 		uint32_t inputaddr  = (uint32_t)Input;
STR	R3, [SP, #52]
; Input end address is: 12 (R3)
;stm32f4xx_cryp_aes.c,114 :: 		uint32_t outputaddr = (uint32_t)Output;
STR	R5, [SP, #56]
; Output end address is: 20 (R5)
;stm32f4xx_cryp_aes.c,115 :: 		uint32_t i = 0;
;stm32f4xx_cryp_aes.c,118 :: 		CRYP_KeyStructInit(&AES_CRYP_KeyInitStructure);
ADD	R4, SP, #20
STR	R1, [SP, #4]
STRH	R2, [SP, #8]
MOV	R0, R4
BL	_CRYP_KeyStructInit+0
LDRH	R2, [SP, #8]
LDR	R1, [SP, #4]
;stm32f4xx_cryp_aes.c,120 :: 		switch(Keysize)
IT	AL
BAL	L_CRYP_AES_ECB27
; Keysize end address is: 8 (R2)
;stm32f4xx_cryp_aes.c,122 :: 		case 128:
L_CRYP_AES_ECB29:
;stm32f4xx_cryp_aes.c,123 :: 		AES_CRYP_InitStructure.CRYP_KeySize = CRYP_KeySize_128b;
MOVW	R4, #0
STRH	R4, [SP, #18]
;stm32f4xx_cryp_aes.c,124 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R1, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #36]
;stm32f4xx_cryp_aes.c,125 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,126 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #40]
;stm32f4xx_cryp_aes.c,127 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,128 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #44]
;stm32f4xx_cryp_aes.c,129 :: 		keyaddr+=4;
ADDS	R4, R1, #4
; keyaddr end address is: 4 (R1)
;stm32f4xx_cryp_aes.c,130 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #48]
;stm32f4xx_cryp_aes.c,131 :: 		break;
IT	AL
BAL	L_CRYP_AES_ECB28
;stm32f4xx_cryp_aes.c,132 :: 		case 192:
L_CRYP_AES_ECB30:
;stm32f4xx_cryp_aes.c,133 :: 		AES_CRYP_InitStructure.CRYP_KeySize  = CRYP_KeySize_192b;
; keyaddr start address is: 4 (R1)
MOVW	R4, #256
STRH	R4, [SP, #18]
;stm32f4xx_cryp_aes.c,134 :: 		AES_CRYP_KeyInitStructure.CRYP_Key1Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R1, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #28]
;stm32f4xx_cryp_aes.c,135 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,136 :: 		AES_CRYP_KeyInitStructure.CRYP_Key1Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #32]
;stm32f4xx_cryp_aes.c,137 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,138 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #36]
;stm32f4xx_cryp_aes.c,139 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,140 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #40]
;stm32f4xx_cryp_aes.c,141 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,142 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #44]
;stm32f4xx_cryp_aes.c,143 :: 		keyaddr+=4;
ADDS	R4, R1, #4
; keyaddr end address is: 4 (R1)
;stm32f4xx_cryp_aes.c,144 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #48]
;stm32f4xx_cryp_aes.c,145 :: 		break;
IT	AL
BAL	L_CRYP_AES_ECB28
;stm32f4xx_cryp_aes.c,146 :: 		case 256:
L_CRYP_AES_ECB31:
;stm32f4xx_cryp_aes.c,147 :: 		AES_CRYP_InitStructure.CRYP_KeySize  = CRYP_KeySize_256b;
; keyaddr start address is: 4 (R1)
MOVW	R4, #512
STRH	R4, [SP, #18]
;stm32f4xx_cryp_aes.c,148 :: 		AES_CRYP_KeyInitStructure.CRYP_Key0Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R1, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #20]
;stm32f4xx_cryp_aes.c,149 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,150 :: 		AES_CRYP_KeyInitStructure.CRYP_Key0Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #24]
;stm32f4xx_cryp_aes.c,151 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,152 :: 		AES_CRYP_KeyInitStructure.CRYP_Key1Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #28]
;stm32f4xx_cryp_aes.c,153 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,154 :: 		AES_CRYP_KeyInitStructure.CRYP_Key1Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #32]
;stm32f4xx_cryp_aes.c,155 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,156 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #36]
;stm32f4xx_cryp_aes.c,157 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,158 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #40]
;stm32f4xx_cryp_aes.c,159 :: 		keyaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,160 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #44]
;stm32f4xx_cryp_aes.c,161 :: 		keyaddr+=4;
ADDS	R4, R1, #4
; keyaddr end address is: 4 (R1)
;stm32f4xx_cryp_aes.c,162 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #48]
;stm32f4xx_cryp_aes.c,163 :: 		break;
IT	AL
BAL	L_CRYP_AES_ECB28
;stm32f4xx_cryp_aes.c,164 :: 		default:
L_CRYP_AES_ECB32:
;stm32f4xx_cryp_aes.c,165 :: 		break;
IT	AL
BAL	L_CRYP_AES_ECB28
;stm32f4xx_cryp_aes.c,166 :: 		}
L_CRYP_AES_ECB27:
; keyaddr start address is: 4 (R1)
; Keysize start address is: 8 (R2)
CMP	R2, #128
IT	EQ
BEQ	L_CRYP_AES_ECB29
CMP	R2, #192
IT	EQ
BEQ	L_CRYP_AES_ECB30
CMP	R2, #256
IT	EQ
BEQ	L_CRYP_AES_ECB31
; Keysize end address is: 8 (R2)
; keyaddr end address is: 4 (R1)
IT	AL
BAL	L_CRYP_AES_ECB32
L_CRYP_AES_ECB28:
;stm32f4xx_cryp_aes.c,169 :: 		if(Mode == MODE_DECRYPT) /* AES decryption */
LDRB	R4, [SP, #72]
CMP	R4, #0
IT	NE
BNE	L_CRYP_AES_ECB33
;stm32f4xx_cryp_aes.c,172 :: 		CRYP_FIFOFlush();
BL	_CRYP_FIFOFlush+0
;stm32f4xx_cryp_aes.c,175 :: 		AES_CRYP_InitStructure.CRYP_AlgoDir = CRYP_AlgoDir_Decrypt;
MOVW	R4, #4
STRH	R4, [SP, #12]
;stm32f4xx_cryp_aes.c,176 :: 		AES_CRYP_InitStructure.CRYP_AlgoMode = CRYP_AlgoMode_AES_Key;
MOVW	R4, #56
STRH	R4, [SP, #14]
;stm32f4xx_cryp_aes.c,177 :: 		AES_CRYP_InitStructure.CRYP_DataType = CRYP_DataType_32b;
MOVW	R4, #0
STRH	R4, [SP, #16]
;stm32f4xx_cryp_aes.c,178 :: 		CRYP_Init(&AES_CRYP_InitStructure);
ADD	R4, SP, #12
MOV	R0, R4
BL	_CRYP_Init+0
;stm32f4xx_cryp_aes.c,181 :: 		CRYP_KeyInit(&AES_CRYP_KeyInitStructure);
ADD	R4, SP, #20
MOV	R0, R4
BL	_CRYP_KeyInit+0
;stm32f4xx_cryp_aes.c,184 :: 		CRYP_Cmd(ENABLE);
MOVS	R0, #1
BL	_CRYP_Cmd+0
;stm32f4xx_cryp_aes.c,187 :: 		do
L_CRYP_AES_ECB34:
;stm32f4xx_cryp_aes.c,189 :: 		busystatus = CRYP_GetFlagStatus(CRYP_FLAG_BUSY);
MOVS	R0, #16
BL	_CRYP_GetFlagStatus+0
; busystatus start address is: 0 (R0)
;stm32f4xx_cryp_aes.c,190 :: 		counter++;
LDR	R4, [SP, #60]
ADDS	R4, R4, #1
STR	R4, [SP, #60]
;stm32f4xx_cryp_aes.c,191 :: 		}while ((counter != AESBUSY_TIMEOUT) && (busystatus != RESET));
LDR	R4, [SP, #60]
CMP	R4, #65536
IT	EQ
BEQ	L__CRYP_AES_ECB112
CMP	R0, #0
IT	EQ
BEQ	L__CRYP_AES_ECB111
IT	AL
BAL	L_CRYP_AES_ECB34
L__CRYP_AES_ECB112:
L__CRYP_AES_ECB111:
;stm32f4xx_cryp_aes.c,193 :: 		if (busystatus != RESET)
CMP	R0, #0
IT	EQ
BEQ	L_CRYP_AES_ECB39
; busystatus end address is: 0 (R0)
;stm32f4xx_cryp_aes.c,195 :: 		status = ERROR;
MOVS	R4, #0
STRB	R4, [SP, #64]
;stm32f4xx_cryp_aes.c,196 :: 		}
IT	AL
BAL	L_CRYP_AES_ECB40
L_CRYP_AES_ECB39:
;stm32f4xx_cryp_aes.c,200 :: 		AES_CRYP_InitStructure.CRYP_AlgoDir = CRYP_AlgoDir_Decrypt;
MOVW	R4, #4
STRH	R4, [SP, #12]
;stm32f4xx_cryp_aes.c,201 :: 		}
L_CRYP_AES_ECB40:
;stm32f4xx_cryp_aes.c,202 :: 		}
IT	AL
BAL	L_CRYP_AES_ECB41
L_CRYP_AES_ECB33:
;stm32f4xx_cryp_aes.c,207 :: 		CRYP_KeyInit(&AES_CRYP_KeyInitStructure);
ADD	R4, SP, #20
MOV	R0, R4
BL	_CRYP_KeyInit+0
;stm32f4xx_cryp_aes.c,210 :: 		AES_CRYP_InitStructure.CRYP_AlgoDir  = CRYP_AlgoDir_Encrypt;
MOVW	R4, #0
STRH	R4, [SP, #12]
;stm32f4xx_cryp_aes.c,211 :: 		}
L_CRYP_AES_ECB41:
;stm32f4xx_cryp_aes.c,213 :: 		AES_CRYP_InitStructure.CRYP_AlgoMode = CRYP_AlgoMode_AES_ECB;
MOVW	R4, #32
STRH	R4, [SP, #14]
;stm32f4xx_cryp_aes.c,214 :: 		AES_CRYP_InitStructure.CRYP_DataType = CRYP_DataType_8b;
MOVW	R4, #128
STRH	R4, [SP, #16]
;stm32f4xx_cryp_aes.c,215 :: 		CRYP_Init(&AES_CRYP_InitStructure);
ADD	R4, SP, #12
MOV	R0, R4
BL	_CRYP_Init+0
;stm32f4xx_cryp_aes.c,218 :: 		CRYP_FIFOFlush();
BL	_CRYP_FIFOFlush+0
;stm32f4xx_cryp_aes.c,221 :: 		CRYP_Cmd(ENABLE);
MOVS	R0, #1
BL	_CRYP_Cmd+0
;stm32f4xx_cryp_aes.c,223 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=16)
MOV	R4, #0
STR	R4, [SP, #68]
L_CRYP_AES_ECB42:
LDR	R5, [SP, #84]
LDR	R4, [SP, #68]
CMP	R4, R5
IT	CS
BCS	L__CRYP_AES_ECB116
LDRB	R4, [SP, #64]
CMP	R4, #0
IT	EQ
BEQ	L__CRYP_AES_ECB115
L__CRYP_AES_ECB109:
;stm32f4xx_cryp_aes.c,227 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [SP, #52]
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_aes.c,228 :: 		inputaddr+=4;
LDR	R4, [SP, #52]
ADDS	R4, R4, #4
STR	R4, [SP, #52]
;stm32f4xx_cryp_aes.c,229 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_aes.c,230 :: 		inputaddr+=4;
LDR	R4, [SP, #52]
ADDS	R4, R4, #4
STR	R4, [SP, #52]
;stm32f4xx_cryp_aes.c,231 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_aes.c,232 :: 		inputaddr+=4;
LDR	R4, [SP, #52]
ADDS	R4, R4, #4
STR	R4, [SP, #52]
;stm32f4xx_cryp_aes.c,233 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_aes.c,234 :: 		inputaddr+=4;
LDR	R4, [SP, #52]
ADDS	R4, R4, #4
STR	R4, [SP, #52]
;stm32f4xx_cryp_aes.c,237 :: 		counter = 0;
MOV	R4, #0
STR	R4, [SP, #60]
;stm32f4xx_cryp_aes.c,238 :: 		do
L_CRYP_AES_ECB47:
;stm32f4xx_cryp_aes.c,240 :: 		busystatus = CRYP_GetFlagStatus(CRYP_FLAG_BUSY);
MOVS	R0, #16
BL	_CRYP_GetFlagStatus+0
; busystatus start address is: 0 (R0)
;stm32f4xx_cryp_aes.c,241 :: 		counter++;
LDR	R4, [SP, #60]
ADDS	R4, R4, #1
STR	R4, [SP, #60]
;stm32f4xx_cryp_aes.c,242 :: 		}while ((counter != AESBUSY_TIMEOUT) && (busystatus != RESET));
LDR	R4, [SP, #60]
CMP	R4, #65536
IT	EQ
BEQ	L__CRYP_AES_ECB114
CMP	R0, #0
IT	EQ
BEQ	L__CRYP_AES_ECB113
IT	AL
BAL	L_CRYP_AES_ECB47
L__CRYP_AES_ECB114:
L__CRYP_AES_ECB113:
;stm32f4xx_cryp_aes.c,244 :: 		if (busystatus != RESET)
CMP	R0, #0
IT	EQ
BEQ	L_CRYP_AES_ECB52
; busystatus end address is: 0 (R0)
;stm32f4xx_cryp_aes.c,246 :: 		status = ERROR;
MOVS	R4, #0
STRB	R4, [SP, #64]
;stm32f4xx_cryp_aes.c,247 :: 		}
IT	AL
BAL	L_CRYP_AES_ECB53
L_CRYP_AES_ECB52:
;stm32f4xx_cryp_aes.c,252 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
LDR	R4, [SP, #56]
STR	R4, [SP, #80]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #80]
STR	R0, [R4, #0]
;stm32f4xx_cryp_aes.c,253 :: 		outputaddr+=4;
LDR	R4, [SP, #56]
ADDS	R4, R4, #4
STR	R4, [SP, #56]
;stm32f4xx_cryp_aes.c,254 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
STR	R4, [SP, #80]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #80]
STR	R0, [R4, #0]
;stm32f4xx_cryp_aes.c,255 :: 		outputaddr+=4;
LDR	R4, [SP, #56]
ADDS	R4, R4, #4
STR	R4, [SP, #56]
;stm32f4xx_cryp_aes.c,256 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
STR	R4, [SP, #80]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #80]
STR	R0, [R4, #0]
;stm32f4xx_cryp_aes.c,257 :: 		outputaddr+=4;
LDR	R4, [SP, #56]
ADDS	R4, R4, #4
STR	R4, [SP, #56]
;stm32f4xx_cryp_aes.c,258 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
STR	R4, [SP, #80]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #80]
STR	R0, [R4, #0]
;stm32f4xx_cryp_aes.c,259 :: 		outputaddr+=4;
LDR	R4, [SP, #56]
ADDS	R4, R4, #4
STR	R4, [SP, #56]
;stm32f4xx_cryp_aes.c,260 :: 		}
L_CRYP_AES_ECB53:
;stm32f4xx_cryp_aes.c,223 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=16)
LDR	R4, [SP, #68]
ADDS	R4, #16
STR	R4, [SP, #68]
;stm32f4xx_cryp_aes.c,261 :: 		}
IT	AL
BAL	L_CRYP_AES_ECB42
;stm32f4xx_cryp_aes.c,223 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=16)
L__CRYP_AES_ECB116:
L__CRYP_AES_ECB115:
;stm32f4xx_cryp_aes.c,264 :: 		CRYP_Cmd(DISABLE);
MOVS	R0, #0
BL	_CRYP_Cmd+0
;stm32f4xx_cryp_aes.c,266 :: 		return status;
LDRB	R0, [SP, #64]
;stm32f4xx_cryp_aes.c,267 :: 		}
L_end_CRYP_AES_ECB:
LDR	LR, [SP, #0]
ADD	SP, SP, #84
BX	LR
; end of _CRYP_AES_ECB
_CRYP_AES_CBC:
;stm32f4xx_cryp_aes.c,287 :: 		uint8_t *Output)
; Keysize start address is: 12 (R3)
; Key start address is: 8 (R2)
; InitVectors start address is: 4 (R1)
SUB	SP, SP, #104
STR	LR, [SP, #0]
STRB	R0, [SP, #92]
MOV	R0, R1
MOV	R1, R2
; Keysize end address is: 12 (R3)
; Key end address is: 8 (R2)
; InitVectors end address is: 4 (R1)
; InitVectors start address is: 0 (R0)
; Key start address is: 4 (R1)
; Keysize start address is: 12 (R3)
; Input start address is: 20 (R5)
LDR	R5, [SP, #104]
LDR	R4, [SP, #108]
STR	R4, [SP, #108]
; Output start address is: 24 (R6)
LDR	R6, [SP, #112]
;stm32f4xx_cryp_aes.c,292 :: 		__IO uint32_t counter = 0;
MOV	R4, #0
STR	R4, [SP, #80]
MOVS	R4, #1
STRB	R4, [SP, #84]
;stm32f4xx_cryp_aes.c,293 :: 		uint32_t busystatus = 0;
;stm32f4xx_cryp_aes.c,294 :: 		ErrorStatus status = SUCCESS;
;stm32f4xx_cryp_aes.c,295 :: 		uint32_t keyaddr    = (uint32_t)Key;
; keyaddr start address is: 8 (R2)
MOV	R2, R1
; Key end address is: 4 (R1)
;stm32f4xx_cryp_aes.c,296 :: 		uint32_t inputaddr  = (uint32_t)Input;
STR	R5, [SP, #72]
; Input end address is: 20 (R5)
;stm32f4xx_cryp_aes.c,297 :: 		uint32_t outputaddr = (uint32_t)Output;
STR	R6, [SP, #76]
; Output end address is: 24 (R6)
;stm32f4xx_cryp_aes.c,298 :: 		uint32_t ivaddr     = (uint32_t)InitVectors;
; ivaddr start address is: 4 (R1)
MOV	R1, R0
; InitVectors end address is: 0 (R0)
;stm32f4xx_cryp_aes.c,299 :: 		uint32_t i = 0;
;stm32f4xx_cryp_aes.c,302 :: 		CRYP_KeyStructInit(&AES_CRYP_KeyInitStructure);
ADD	R4, SP, #24
STR	R1, [SP, #4]
STR	R2, [SP, #8]
STRH	R3, [SP, #12]
MOV	R0, R4
BL	_CRYP_KeyStructInit+0
LDRH	R3, [SP, #12]
LDR	R2, [SP, #8]
LDR	R1, [SP, #4]
;stm32f4xx_cryp_aes.c,304 :: 		switch(Keysize)
IT	AL
BAL	L_CRYP_AES_CBC54
; Keysize end address is: 12 (R3)
;stm32f4xx_cryp_aes.c,306 :: 		case 128:
L_CRYP_AES_CBC56:
;stm32f4xx_cryp_aes.c,307 :: 		AES_CRYP_InitStructure.CRYP_KeySize = CRYP_KeySize_128b;
MOVW	R4, #0
STRH	R4, [SP, #22]
;stm32f4xx_cryp_aes.c,308 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R2, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #40]
;stm32f4xx_cryp_aes.c,309 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,310 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #44]
;stm32f4xx_cryp_aes.c,311 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,312 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #48]
;stm32f4xx_cryp_aes.c,313 :: 		keyaddr+=4;
ADDS	R4, R2, #4
; keyaddr end address is: 8 (R2)
;stm32f4xx_cryp_aes.c,314 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #52]
;stm32f4xx_cryp_aes.c,315 :: 		break;
IT	AL
BAL	L_CRYP_AES_CBC55
;stm32f4xx_cryp_aes.c,316 :: 		case 192:
L_CRYP_AES_CBC57:
;stm32f4xx_cryp_aes.c,317 :: 		AES_CRYP_InitStructure.CRYP_KeySize  = CRYP_KeySize_192b;
; keyaddr start address is: 8 (R2)
MOVW	R4, #256
STRH	R4, [SP, #22]
;stm32f4xx_cryp_aes.c,318 :: 		AES_CRYP_KeyInitStructure.CRYP_Key1Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R2, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #32]
;stm32f4xx_cryp_aes.c,319 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,320 :: 		AES_CRYP_KeyInitStructure.CRYP_Key1Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #36]
;stm32f4xx_cryp_aes.c,321 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,322 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #40]
;stm32f4xx_cryp_aes.c,323 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,324 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #44]
;stm32f4xx_cryp_aes.c,325 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,326 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #48]
;stm32f4xx_cryp_aes.c,327 :: 		keyaddr+=4;
ADDS	R4, R2, #4
; keyaddr end address is: 8 (R2)
;stm32f4xx_cryp_aes.c,328 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #52]
;stm32f4xx_cryp_aes.c,329 :: 		break;
IT	AL
BAL	L_CRYP_AES_CBC55
;stm32f4xx_cryp_aes.c,330 :: 		case 256:
L_CRYP_AES_CBC58:
;stm32f4xx_cryp_aes.c,331 :: 		AES_CRYP_InitStructure.CRYP_KeySize  = CRYP_KeySize_256b;
; keyaddr start address is: 8 (R2)
MOVW	R4, #512
STRH	R4, [SP, #22]
;stm32f4xx_cryp_aes.c,332 :: 		AES_CRYP_KeyInitStructure.CRYP_Key0Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R2, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #24]
;stm32f4xx_cryp_aes.c,333 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,334 :: 		AES_CRYP_KeyInitStructure.CRYP_Key0Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #28]
;stm32f4xx_cryp_aes.c,335 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,336 :: 		AES_CRYP_KeyInitStructure.CRYP_Key1Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #32]
;stm32f4xx_cryp_aes.c,337 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,338 :: 		AES_CRYP_KeyInitStructure.CRYP_Key1Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #36]
;stm32f4xx_cryp_aes.c,339 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,340 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #40]
;stm32f4xx_cryp_aes.c,341 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,342 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #44]
;stm32f4xx_cryp_aes.c,343 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,344 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #48]
;stm32f4xx_cryp_aes.c,345 :: 		keyaddr+=4;
ADDS	R4, R2, #4
; keyaddr end address is: 8 (R2)
;stm32f4xx_cryp_aes.c,346 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #52]
;stm32f4xx_cryp_aes.c,347 :: 		break;
IT	AL
BAL	L_CRYP_AES_CBC55
;stm32f4xx_cryp_aes.c,348 :: 		default:
L_CRYP_AES_CBC59:
;stm32f4xx_cryp_aes.c,349 :: 		break;
IT	AL
BAL	L_CRYP_AES_CBC55
;stm32f4xx_cryp_aes.c,350 :: 		}
L_CRYP_AES_CBC54:
; keyaddr start address is: 8 (R2)
; Keysize start address is: 12 (R3)
CMP	R3, #128
IT	EQ
BEQ	L_CRYP_AES_CBC56
CMP	R3, #192
IT	EQ
BEQ	L_CRYP_AES_CBC57
CMP	R3, #256
IT	EQ
BEQ	L_CRYP_AES_CBC58
; Keysize end address is: 12 (R3)
; keyaddr end address is: 8 (R2)
IT	AL
BAL	L_CRYP_AES_CBC59
L_CRYP_AES_CBC55:
;stm32f4xx_cryp_aes.c,353 :: 		AES_CRYP_IVInitStructure.CRYP_IV0Left = __REV(*(uint32_t*)(ivaddr));
LDR	R4, [R1, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #56]
;stm32f4xx_cryp_aes.c,354 :: 		ivaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,355 :: 		AES_CRYP_IVInitStructure.CRYP_IV0Right= __REV(*(uint32_t*)(ivaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #60]
;stm32f4xx_cryp_aes.c,356 :: 		ivaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,357 :: 		AES_CRYP_IVInitStructure.CRYP_IV1Left = __REV(*(uint32_t*)(ivaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #64]
;stm32f4xx_cryp_aes.c,358 :: 		ivaddr+=4;
ADDS	R4, R1, #4
; ivaddr end address is: 4 (R1)
;stm32f4xx_cryp_aes.c,359 :: 		AES_CRYP_IVInitStructure.CRYP_IV1Right= __REV(*(uint32_t*)(ivaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #68]
;stm32f4xx_cryp_aes.c,363 :: 		if(Mode == MODE_DECRYPT) /* AES decryption */
LDRB	R4, [SP, #92]
CMP	R4, #0
IT	NE
BNE	L_CRYP_AES_CBC60
;stm32f4xx_cryp_aes.c,366 :: 		CRYP_FIFOFlush();
BL	_CRYP_FIFOFlush+0
;stm32f4xx_cryp_aes.c,369 :: 		AES_CRYP_InitStructure.CRYP_AlgoDir = CRYP_AlgoDir_Decrypt;
MOVW	R4, #4
STRH	R4, [SP, #16]
;stm32f4xx_cryp_aes.c,370 :: 		AES_CRYP_InitStructure.CRYP_AlgoMode = CRYP_AlgoMode_AES_Key;
MOVW	R4, #56
STRH	R4, [SP, #18]
;stm32f4xx_cryp_aes.c,371 :: 		AES_CRYP_InitStructure.CRYP_DataType = CRYP_DataType_32b;
MOVW	R4, #0
STRH	R4, [SP, #20]
;stm32f4xx_cryp_aes.c,373 :: 		CRYP_Init(&AES_CRYP_InitStructure);
ADD	R4, SP, #16
MOV	R0, R4
BL	_CRYP_Init+0
;stm32f4xx_cryp_aes.c,376 :: 		CRYP_KeyInit(&AES_CRYP_KeyInitStructure);
ADD	R4, SP, #24
MOV	R0, R4
BL	_CRYP_KeyInit+0
;stm32f4xx_cryp_aes.c,379 :: 		CRYP_Cmd(ENABLE);
MOVS	R0, #1
BL	_CRYP_Cmd+0
;stm32f4xx_cryp_aes.c,382 :: 		do
L_CRYP_AES_CBC61:
;stm32f4xx_cryp_aes.c,384 :: 		busystatus = CRYP_GetFlagStatus(CRYP_FLAG_BUSY);
MOVS	R0, #16
BL	_CRYP_GetFlagStatus+0
; busystatus start address is: 0 (R0)
;stm32f4xx_cryp_aes.c,385 :: 		counter++;
LDR	R4, [SP, #80]
ADDS	R4, R4, #1
STR	R4, [SP, #80]
;stm32f4xx_cryp_aes.c,386 :: 		}while ((counter != AESBUSY_TIMEOUT) && (busystatus != RESET));
LDR	R4, [SP, #80]
CMP	R4, #65536
IT	EQ
BEQ	L__CRYP_AES_CBC121
CMP	R0, #0
IT	EQ
BEQ	L__CRYP_AES_CBC120
IT	AL
BAL	L_CRYP_AES_CBC61
L__CRYP_AES_CBC121:
L__CRYP_AES_CBC120:
;stm32f4xx_cryp_aes.c,388 :: 		if (busystatus != RESET)
CMP	R0, #0
IT	EQ
BEQ	L_CRYP_AES_CBC66
; busystatus end address is: 0 (R0)
;stm32f4xx_cryp_aes.c,390 :: 		status = ERROR;
MOVS	R4, #0
STRB	R4, [SP, #84]
;stm32f4xx_cryp_aes.c,391 :: 		}
IT	AL
BAL	L_CRYP_AES_CBC67
L_CRYP_AES_CBC66:
;stm32f4xx_cryp_aes.c,395 :: 		AES_CRYP_InitStructure.CRYP_AlgoDir = CRYP_AlgoDir_Decrypt;
MOVW	R4, #4
STRH	R4, [SP, #16]
;stm32f4xx_cryp_aes.c,396 :: 		}
L_CRYP_AES_CBC67:
;stm32f4xx_cryp_aes.c,397 :: 		}
IT	AL
BAL	L_CRYP_AES_CBC68
L_CRYP_AES_CBC60:
;stm32f4xx_cryp_aes.c,401 :: 		CRYP_KeyInit(&AES_CRYP_KeyInitStructure);
ADD	R4, SP, #24
MOV	R0, R4
BL	_CRYP_KeyInit+0
;stm32f4xx_cryp_aes.c,404 :: 		AES_CRYP_InitStructure.CRYP_AlgoDir  = CRYP_AlgoDir_Encrypt;
MOVW	R4, #0
STRH	R4, [SP, #16]
;stm32f4xx_cryp_aes.c,405 :: 		}
L_CRYP_AES_CBC68:
;stm32f4xx_cryp_aes.c,406 :: 		AES_CRYP_InitStructure.CRYP_AlgoMode = CRYP_AlgoMode_AES_CBC;
MOVW	R4, #40
STRH	R4, [SP, #18]
;stm32f4xx_cryp_aes.c,407 :: 		AES_CRYP_InitStructure.CRYP_DataType = CRYP_DataType_8b;
MOVW	R4, #128
STRH	R4, [SP, #20]
;stm32f4xx_cryp_aes.c,408 :: 		CRYP_Init(&AES_CRYP_InitStructure);
ADD	R4, SP, #16
MOV	R0, R4
BL	_CRYP_Init+0
;stm32f4xx_cryp_aes.c,411 :: 		CRYP_IVInit(&AES_CRYP_IVInitStructure);
ADD	R4, SP, #56
MOV	R0, R4
BL	_CRYP_IVInit+0
;stm32f4xx_cryp_aes.c,414 :: 		CRYP_FIFOFlush();
BL	_CRYP_FIFOFlush+0
;stm32f4xx_cryp_aes.c,417 :: 		CRYP_Cmd(ENABLE);
MOVS	R0, #1
BL	_CRYP_Cmd+0
;stm32f4xx_cryp_aes.c,420 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=16)
MOV	R4, #0
STR	R4, [SP, #88]
L_CRYP_AES_CBC69:
LDR	R5, [SP, #108]
LDR	R4, [SP, #88]
CMP	R4, R5
IT	CS
BCS	L__CRYP_AES_CBC125
LDRB	R4, [SP, #84]
CMP	R4, #0
IT	EQ
BEQ	L__CRYP_AES_CBC124
L__CRYP_AES_CBC118:
;stm32f4xx_cryp_aes.c,424 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [SP, #72]
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_aes.c,425 :: 		inputaddr+=4;
LDR	R4, [SP, #72]
ADDS	R4, R4, #4
STR	R4, [SP, #72]
;stm32f4xx_cryp_aes.c,426 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_aes.c,427 :: 		inputaddr+=4;
LDR	R4, [SP, #72]
ADDS	R4, R4, #4
STR	R4, [SP, #72]
;stm32f4xx_cryp_aes.c,428 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_aes.c,429 :: 		inputaddr+=4;
LDR	R4, [SP, #72]
ADDS	R4, R4, #4
STR	R4, [SP, #72]
;stm32f4xx_cryp_aes.c,430 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_aes.c,431 :: 		inputaddr+=4;
LDR	R4, [SP, #72]
ADDS	R4, R4, #4
STR	R4, [SP, #72]
;stm32f4xx_cryp_aes.c,433 :: 		counter = 0;
MOV	R4, #0
STR	R4, [SP, #80]
;stm32f4xx_cryp_aes.c,434 :: 		do
L_CRYP_AES_CBC74:
;stm32f4xx_cryp_aes.c,436 :: 		busystatus = CRYP_GetFlagStatus(CRYP_FLAG_BUSY);
MOVS	R0, #16
BL	_CRYP_GetFlagStatus+0
; busystatus start address is: 0 (R0)
;stm32f4xx_cryp_aes.c,437 :: 		counter++;
LDR	R4, [SP, #80]
ADDS	R4, R4, #1
STR	R4, [SP, #80]
;stm32f4xx_cryp_aes.c,438 :: 		}while ((counter != AESBUSY_TIMEOUT) && (busystatus != RESET));
LDR	R4, [SP, #80]
CMP	R4, #65536
IT	EQ
BEQ	L__CRYP_AES_CBC123
CMP	R0, #0
IT	EQ
BEQ	L__CRYP_AES_CBC122
IT	AL
BAL	L_CRYP_AES_CBC74
L__CRYP_AES_CBC123:
L__CRYP_AES_CBC122:
;stm32f4xx_cryp_aes.c,440 :: 		if (busystatus != RESET)
CMP	R0, #0
IT	EQ
BEQ	L_CRYP_AES_CBC79
; busystatus end address is: 0 (R0)
;stm32f4xx_cryp_aes.c,442 :: 		status = ERROR;
MOVS	R4, #0
STRB	R4, [SP, #84]
;stm32f4xx_cryp_aes.c,443 :: 		}
IT	AL
BAL	L_CRYP_AES_CBC80
L_CRYP_AES_CBC79:
;stm32f4xx_cryp_aes.c,448 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
LDR	R4, [SP, #76]
STR	R4, [SP, #100]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #100]
STR	R0, [R4, #0]
;stm32f4xx_cryp_aes.c,449 :: 		outputaddr+=4;
LDR	R4, [SP, #76]
ADDS	R4, R4, #4
STR	R4, [SP, #76]
;stm32f4xx_cryp_aes.c,450 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
STR	R4, [SP, #100]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #100]
STR	R0, [R4, #0]
;stm32f4xx_cryp_aes.c,451 :: 		outputaddr+=4;
LDR	R4, [SP, #76]
ADDS	R4, R4, #4
STR	R4, [SP, #76]
;stm32f4xx_cryp_aes.c,452 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
STR	R4, [SP, #100]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #100]
STR	R0, [R4, #0]
;stm32f4xx_cryp_aes.c,453 :: 		outputaddr+=4;
LDR	R4, [SP, #76]
ADDS	R4, R4, #4
STR	R4, [SP, #76]
;stm32f4xx_cryp_aes.c,454 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
STR	R4, [SP, #100]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #100]
STR	R0, [R4, #0]
;stm32f4xx_cryp_aes.c,455 :: 		outputaddr+=4;
LDR	R4, [SP, #76]
ADDS	R4, R4, #4
STR	R4, [SP, #76]
;stm32f4xx_cryp_aes.c,456 :: 		}
L_CRYP_AES_CBC80:
;stm32f4xx_cryp_aes.c,420 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=16)
LDR	R4, [SP, #88]
ADDS	R4, #16
STR	R4, [SP, #88]
;stm32f4xx_cryp_aes.c,457 :: 		}
IT	AL
BAL	L_CRYP_AES_CBC69
;stm32f4xx_cryp_aes.c,420 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=16)
L__CRYP_AES_CBC125:
L__CRYP_AES_CBC124:
;stm32f4xx_cryp_aes.c,460 :: 		CRYP_Cmd(DISABLE);
MOVS	R0, #0
BL	_CRYP_Cmd+0
;stm32f4xx_cryp_aes.c,462 :: 		return status;
LDRB	R0, [SP, #84]
;stm32f4xx_cryp_aes.c,463 :: 		}
L_end_CRYP_AES_CBC:
LDR	LR, [SP, #0]
ADD	SP, SP, #104
BX	LR
; end of _CRYP_AES_CBC
_CRYP_AES_CTR:
;stm32f4xx_cryp_aes.c,483 :: 		uint8_t *Output)
; Keysize start address is: 12 (R3)
; Key start address is: 8 (R2)
; InitVectors start address is: 4 (R1)
SUB	SP, SP, #100
STR	LR, [SP, #0]
STRB	R0, [SP, #88]
MOV	R0, R1
MOV	R1, R2
; Keysize end address is: 12 (R3)
; Key end address is: 8 (R2)
; InitVectors end address is: 4 (R1)
; InitVectors start address is: 0 (R0)
; Key start address is: 4 (R1)
; Keysize start address is: 12 (R3)
; Input start address is: 20 (R5)
LDR	R5, [SP, #100]
LDR	R4, [SP, #104]
STR	R4, [SP, #104]
; Output start address is: 24 (R6)
LDR	R6, [SP, #108]
;stm32f4xx_cryp_aes.c,488 :: 		__IO uint32_t counter = 0;
;stm32f4xx_cryp_aes.c,489 :: 		uint32_t busystatus = 0;
;stm32f4xx_cryp_aes.c,490 :: 		ErrorStatus status = SUCCESS;
MOVS	R4, #1
STRB	R4, [SP, #80]
;stm32f4xx_cryp_aes.c,491 :: 		uint32_t keyaddr    = (uint32_t)Key;
; keyaddr start address is: 8 (R2)
MOV	R2, R1
; Key end address is: 4 (R1)
;stm32f4xx_cryp_aes.c,492 :: 		uint32_t inputaddr  = (uint32_t)Input;
STR	R5, [SP, #72]
; Input end address is: 20 (R5)
;stm32f4xx_cryp_aes.c,493 :: 		uint32_t outputaddr = (uint32_t)Output;
STR	R6, [SP, #76]
; Output end address is: 24 (R6)
;stm32f4xx_cryp_aes.c,494 :: 		uint32_t ivaddr     = (uint32_t)InitVectors;
; ivaddr start address is: 4 (R1)
MOV	R1, R0
; InitVectors end address is: 0 (R0)
;stm32f4xx_cryp_aes.c,495 :: 		uint32_t i = 0;
;stm32f4xx_cryp_aes.c,498 :: 		CRYP_KeyStructInit(&AES_CRYP_KeyInitStructure);
ADD	R4, SP, #24
STR	R1, [SP, #4]
STR	R2, [SP, #8]
STRH	R3, [SP, #12]
MOV	R0, R4
BL	_CRYP_KeyStructInit+0
LDRH	R3, [SP, #12]
LDR	R2, [SP, #8]
LDR	R1, [SP, #4]
;stm32f4xx_cryp_aes.c,500 :: 		switch(Keysize)
IT	AL
BAL	L_CRYP_AES_CTR81
; Keysize end address is: 12 (R3)
;stm32f4xx_cryp_aes.c,502 :: 		case 128:
L_CRYP_AES_CTR83:
;stm32f4xx_cryp_aes.c,503 :: 		AES_CRYP_InitStructure.CRYP_KeySize = CRYP_KeySize_128b;
MOVW	R4, #0
STRH	R4, [SP, #22]
;stm32f4xx_cryp_aes.c,504 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R2, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #40]
;stm32f4xx_cryp_aes.c,505 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,506 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #44]
;stm32f4xx_cryp_aes.c,507 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,508 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #48]
;stm32f4xx_cryp_aes.c,509 :: 		keyaddr+=4;
ADDS	R4, R2, #4
; keyaddr end address is: 8 (R2)
;stm32f4xx_cryp_aes.c,510 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #52]
;stm32f4xx_cryp_aes.c,511 :: 		break;
IT	AL
BAL	L_CRYP_AES_CTR82
;stm32f4xx_cryp_aes.c,512 :: 		case 192:
L_CRYP_AES_CTR84:
;stm32f4xx_cryp_aes.c,513 :: 		AES_CRYP_InitStructure.CRYP_KeySize  = CRYP_KeySize_192b;
; keyaddr start address is: 8 (R2)
MOVW	R4, #256
STRH	R4, [SP, #22]
;stm32f4xx_cryp_aes.c,514 :: 		AES_CRYP_KeyInitStructure.CRYP_Key1Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R2, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #32]
;stm32f4xx_cryp_aes.c,515 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,516 :: 		AES_CRYP_KeyInitStructure.CRYP_Key1Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #36]
;stm32f4xx_cryp_aes.c,517 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,518 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #40]
;stm32f4xx_cryp_aes.c,519 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,520 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #44]
;stm32f4xx_cryp_aes.c,521 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,522 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #48]
;stm32f4xx_cryp_aes.c,523 :: 		keyaddr+=4;
ADDS	R4, R2, #4
; keyaddr end address is: 8 (R2)
;stm32f4xx_cryp_aes.c,524 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #52]
;stm32f4xx_cryp_aes.c,525 :: 		break;
IT	AL
BAL	L_CRYP_AES_CTR82
;stm32f4xx_cryp_aes.c,526 :: 		case 256:
L_CRYP_AES_CTR85:
;stm32f4xx_cryp_aes.c,527 :: 		AES_CRYP_InitStructure.CRYP_KeySize  = CRYP_KeySize_256b;
; keyaddr start address is: 8 (R2)
MOVW	R4, #512
STRH	R4, [SP, #22]
;stm32f4xx_cryp_aes.c,528 :: 		AES_CRYP_KeyInitStructure.CRYP_Key0Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R2, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #24]
;stm32f4xx_cryp_aes.c,529 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,530 :: 		AES_CRYP_KeyInitStructure.CRYP_Key0Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #28]
;stm32f4xx_cryp_aes.c,531 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,532 :: 		AES_CRYP_KeyInitStructure.CRYP_Key1Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #32]
;stm32f4xx_cryp_aes.c,533 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,534 :: 		AES_CRYP_KeyInitStructure.CRYP_Key1Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #36]
;stm32f4xx_cryp_aes.c,535 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,536 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #40]
;stm32f4xx_cryp_aes.c,537 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,538 :: 		AES_CRYP_KeyInitStructure.CRYP_Key2Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #44]
;stm32f4xx_cryp_aes.c,539 :: 		keyaddr+=4;
ADDS	R4, R2, #4
MOV	R2, R4
;stm32f4xx_cryp_aes.c,540 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Left = __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #48]
;stm32f4xx_cryp_aes.c,541 :: 		keyaddr+=4;
ADDS	R4, R2, #4
; keyaddr end address is: 8 (R2)
;stm32f4xx_cryp_aes.c,542 :: 		AES_CRYP_KeyInitStructure.CRYP_Key3Right= __REV(*(uint32_t*)(keyaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #52]
;stm32f4xx_cryp_aes.c,543 :: 		break;
IT	AL
BAL	L_CRYP_AES_CTR82
;stm32f4xx_cryp_aes.c,544 :: 		default:
L_CRYP_AES_CTR86:
;stm32f4xx_cryp_aes.c,545 :: 		break;
IT	AL
BAL	L_CRYP_AES_CTR82
;stm32f4xx_cryp_aes.c,546 :: 		}
L_CRYP_AES_CTR81:
; keyaddr start address is: 8 (R2)
; Keysize start address is: 12 (R3)
CMP	R3, #128
IT	EQ
BEQ	L_CRYP_AES_CTR83
CMP	R3, #192
IT	EQ
BEQ	L_CRYP_AES_CTR84
CMP	R3, #256
IT	EQ
BEQ	L_CRYP_AES_CTR85
; Keysize end address is: 12 (R3)
; keyaddr end address is: 8 (R2)
IT	AL
BAL	L_CRYP_AES_CTR86
L_CRYP_AES_CTR82:
;stm32f4xx_cryp_aes.c,548 :: 		AES_CRYP_IVInitStructure.CRYP_IV0Left = __REV(*(uint32_t*)(ivaddr));
LDR	R4, [R1, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #56]
;stm32f4xx_cryp_aes.c,549 :: 		ivaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,550 :: 		AES_CRYP_IVInitStructure.CRYP_IV0Right= __REV(*(uint32_t*)(ivaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #60]
;stm32f4xx_cryp_aes.c,551 :: 		ivaddr+=4;
ADDS	R4, R1, #4
MOV	R1, R4
;stm32f4xx_cryp_aes.c,552 :: 		AES_CRYP_IVInitStructure.CRYP_IV1Left = __REV(*(uint32_t*)(ivaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #64]
;stm32f4xx_cryp_aes.c,553 :: 		ivaddr+=4;
ADDS	R4, R1, #4
; ivaddr end address is: 4 (R1)
;stm32f4xx_cryp_aes.c,554 :: 		AES_CRYP_IVInitStructure.CRYP_IV1Right= __REV(*(uint32_t*)(ivaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	stm32f4xx_cryp_aes___REV+0
STR	R0, [SP, #68]
;stm32f4xx_cryp_aes.c,557 :: 		CRYP_KeyInit(&AES_CRYP_KeyInitStructure);
ADD	R4, SP, #24
MOV	R0, R4
BL	_CRYP_KeyInit+0
;stm32f4xx_cryp_aes.c,560 :: 		if(Mode == MODE_DECRYPT) /* AES decryption */
LDRB	R4, [SP, #88]
CMP	R4, #0
IT	NE
BNE	L_CRYP_AES_CTR87
;stm32f4xx_cryp_aes.c,563 :: 		AES_CRYP_InitStructure.CRYP_AlgoDir = CRYP_AlgoDir_Decrypt;
MOVW	R4, #4
STRH	R4, [SP, #16]
;stm32f4xx_cryp_aes.c,564 :: 		}
IT	AL
BAL	L_CRYP_AES_CTR88
L_CRYP_AES_CTR87:
;stm32f4xx_cryp_aes.c,569 :: 		AES_CRYP_InitStructure.CRYP_AlgoDir = CRYP_AlgoDir_Encrypt;
MOVW	R4, #0
STRH	R4, [SP, #16]
;stm32f4xx_cryp_aes.c,570 :: 		}
L_CRYP_AES_CTR88:
;stm32f4xx_cryp_aes.c,571 :: 		AES_CRYP_InitStructure.CRYP_AlgoMode = CRYP_AlgoMode_AES_CTR;
MOVW	R4, #48
STRH	R4, [SP, #18]
;stm32f4xx_cryp_aes.c,572 :: 		AES_CRYP_InitStructure.CRYP_DataType = CRYP_DataType_8b;
MOVW	R4, #128
STRH	R4, [SP, #20]
;stm32f4xx_cryp_aes.c,573 :: 		CRYP_Init(&AES_CRYP_InitStructure);
ADD	R4, SP, #16
MOV	R0, R4
BL	_CRYP_Init+0
;stm32f4xx_cryp_aes.c,576 :: 		CRYP_IVInit(&AES_CRYP_IVInitStructure);
ADD	R4, SP, #56
MOV	R0, R4
BL	_CRYP_IVInit+0
;stm32f4xx_cryp_aes.c,579 :: 		CRYP_FIFOFlush();
BL	_CRYP_FIFOFlush+0
;stm32f4xx_cryp_aes.c,582 :: 		CRYP_Cmd(ENABLE);
MOVS	R0, #1
BL	_CRYP_Cmd+0
;stm32f4xx_cryp_aes.c,584 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=16)
MOV	R4, #0
STR	R4, [SP, #84]
L_CRYP_AES_CTR89:
LDR	R5, [SP, #104]
LDR	R4, [SP, #84]
CMP	R4, R5
IT	CS
BCS	L__CRYP_AES_CTR131
LDRB	R4, [SP, #80]
CMP	R4, #0
IT	EQ
BEQ	L__CRYP_AES_CTR130
L__CRYP_AES_CTR127:
;stm32f4xx_cryp_aes.c,588 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [SP, #72]
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_aes.c,589 :: 		inputaddr+=4;
LDR	R4, [SP, #72]
ADDS	R4, R4, #4
STR	R4, [SP, #72]
;stm32f4xx_cryp_aes.c,590 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_aes.c,591 :: 		inputaddr+=4;
LDR	R4, [SP, #72]
ADDS	R4, R4, #4
STR	R4, [SP, #72]
;stm32f4xx_cryp_aes.c,592 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_aes.c,593 :: 		inputaddr+=4;
LDR	R4, [SP, #72]
ADDS	R4, R4, #4
STR	R4, [SP, #72]
;stm32f4xx_cryp_aes.c,594 :: 		CRYP_DataIn(*(uint32_t*)(inputaddr));
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_CRYP_DataIn+0
;stm32f4xx_cryp_aes.c,595 :: 		inputaddr+=4;
LDR	R4, [SP, #72]
ADDS	R4, R4, #4
STR	R4, [SP, #72]
;stm32f4xx_cryp_aes.c,597 :: 		counter = 0;
; counter start address is: 28 (R7)
MOV	R7, #0
; counter end address is: 28 (R7)
MOV	R1, R7
;stm32f4xx_cryp_aes.c,598 :: 		do
L_CRYP_AES_CTR94:
;stm32f4xx_cryp_aes.c,600 :: 		busystatus = CRYP_GetFlagStatus(CRYP_FLAG_BUSY);
; counter start address is: 4 (R1)
STR	R1, [SP, #4]
MOVS	R0, #16
BL	_CRYP_GetFlagStatus+0
LDR	R1, [SP, #4]
; busystatus start address is: 0 (R0)
;stm32f4xx_cryp_aes.c,601 :: 		counter++;
ADDS	R4, R1, #1
; counter end address is: 4 (R1)
; counter start address is: 28 (R7)
MOV	R7, R4
;stm32f4xx_cryp_aes.c,602 :: 		}while ((counter != AESBUSY_TIMEOUT) && (busystatus != RESET));
CMP	R7, #65536
IT	EQ
BEQ	L__CRYP_AES_CTR129
CMP	R0, #0
IT	EQ
BEQ	L__CRYP_AES_CTR128
MOV	R1, R7
; counter end address is: 28 (R7)
IT	AL
BAL	L_CRYP_AES_CTR94
L__CRYP_AES_CTR129:
L__CRYP_AES_CTR128:
;stm32f4xx_cryp_aes.c,604 :: 		if (busystatus != RESET)
CMP	R0, #0
IT	EQ
BEQ	L_CRYP_AES_CTR99
; busystatus end address is: 0 (R0)
;stm32f4xx_cryp_aes.c,606 :: 		status = ERROR;
MOVS	R4, #0
STRB	R4, [SP, #80]
;stm32f4xx_cryp_aes.c,607 :: 		}
IT	AL
BAL	L_CRYP_AES_CTR100
L_CRYP_AES_CTR99:
;stm32f4xx_cryp_aes.c,612 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
LDR	R4, [SP, #76]
STR	R4, [SP, #96]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #96]
STR	R0, [R4, #0]
;stm32f4xx_cryp_aes.c,613 :: 		outputaddr+=4;
LDR	R4, [SP, #76]
ADDS	R4, R4, #4
STR	R4, [SP, #76]
;stm32f4xx_cryp_aes.c,614 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
STR	R4, [SP, #96]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #96]
STR	R0, [R4, #0]
;stm32f4xx_cryp_aes.c,615 :: 		outputaddr+=4;
LDR	R4, [SP, #76]
ADDS	R4, R4, #4
STR	R4, [SP, #76]
;stm32f4xx_cryp_aes.c,616 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
STR	R4, [SP, #96]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #96]
STR	R0, [R4, #0]
;stm32f4xx_cryp_aes.c,617 :: 		outputaddr+=4;
LDR	R4, [SP, #76]
ADDS	R4, R4, #4
STR	R4, [SP, #76]
;stm32f4xx_cryp_aes.c,618 :: 		*(uint32_t*)(outputaddr) = CRYP_DataOut();
STR	R4, [SP, #96]
BL	_CRYP_DataOut+0
LDR	R4, [SP, #96]
STR	R0, [R4, #0]
;stm32f4xx_cryp_aes.c,619 :: 		outputaddr+=4;
LDR	R4, [SP, #76]
ADDS	R4, R4, #4
STR	R4, [SP, #76]
;stm32f4xx_cryp_aes.c,620 :: 		}
L_CRYP_AES_CTR100:
;stm32f4xx_cryp_aes.c,584 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=16)
LDR	R4, [SP, #84]
ADDS	R4, #16
STR	R4, [SP, #84]
;stm32f4xx_cryp_aes.c,621 :: 		}
IT	AL
BAL	L_CRYP_AES_CTR89
;stm32f4xx_cryp_aes.c,584 :: 		for(i=0; ((i<Ilength) && (status != ERROR)); i+=16)
L__CRYP_AES_CTR131:
L__CRYP_AES_CTR130:
;stm32f4xx_cryp_aes.c,623 :: 		CRYP_Cmd(DISABLE);
MOVS	R0, #0
BL	_CRYP_Cmd+0
;stm32f4xx_cryp_aes.c,625 :: 		return status;
LDRB	R0, [SP, #80]
;stm32f4xx_cryp_aes.c,626 :: 		}
L_end_CRYP_AES_CTR:
LDR	LR, [SP, #0]
ADD	SP, SP, #100
BX	LR
; end of _CRYP_AES_CTR
