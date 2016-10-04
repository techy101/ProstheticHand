stm32f4xx_can___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_can___DSB
stm32f4xx_can___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_can___WFI
stm32f4xx_can___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_can___WFE
stm32f4xx_can___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_can___REV
stm32f4xx_can_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_can_NVIC_SetPriorityGrouping
stm32f4xx_can_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_can_NVIC_GetPriorityGrouping
stm32f4xx_can_NVIC_EnableIRQ:
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
; end of stm32f4xx_can_NVIC_EnableIRQ
stm32f4xx_can_NVIC_DisableIRQ:
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
; end of stm32f4xx_can_NVIC_DisableIRQ
stm32f4xx_can_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_can_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_can_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_can_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_can_NVIC_GetPendingIRQ1
L_stm32f4xx_can_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_can_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_can_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_can_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_can_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_can_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_can_NVIC_GetPendingIRQ
stm32f4xx_can_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_can_NVIC_SetPendingIRQ
stm32f4xx_can_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_can_NVIC_ClearPendingIRQ
stm32f4xx_can_NVIC_GetActive:
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
BEQ	L_stm32f4xx_can_NVIC_GetActive2
; ?FLOC__stm32f4xx_can_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_can_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_can_NVIC_GetActive3
L_stm32f4xx_can_NVIC_GetActive2:
; ?FLOC__stm32f4xx_can_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_can_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_can_NVIC_GetActive3:
; ?FLOC__stm32f4xx_can_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_can_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_can_NVIC_GetActive
stm32f4xx_can_NVIC_SetPriority:
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
BGE	L_stm32f4xx_can_NVIC_SetPriority4
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
BAL	L_stm32f4xx_can_NVIC_SetPriority5
L_stm32f4xx_can_NVIC_SetPriority4:
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
L_stm32f4xx_can_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_can_NVIC_SetPriority
stm32f4xx_can_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_can_NVIC_GetPriority6
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
L_stm32f4xx_can_NVIC_GetPriority6:
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
; end of stm32f4xx_can_NVIC_GetPriority
stm32f4xx_can_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_can_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_can_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_can_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_can_NVIC_EncodePriority9
L_stm32f4xx_can_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_can_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_can_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_can_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_can_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_can_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_can_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_can_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_can_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_can_NVIC_EncodePriority11
L_stm32f4xx_can_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_can_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_can_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_can_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_can_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_can_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_can_NVIC_EncodePriority
stm32f4xx_can_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_can_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_can_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_can_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_can_NVIC_DecodePriority13
L_stm32f4xx_can_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_can_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_can_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_can_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_can_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_can_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_can_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_can_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_can_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_can_NVIC_DecodePriority15
L_stm32f4xx_can_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_can_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_can_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_can_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_can_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_can_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_can_NVIC_DecodePriority
stm32f4xx_can_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_can___DSB+0
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
BL	stm32f4xx_can___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_can_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_can_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_can_NVIC_SystemReset
stm32f4xx_can_SysTick_Config:
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
BLS	L_stm32f4xx_can_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_can_SysTick_Config18:
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
BL	stm32f4xx_can_NVIC_SetPriority+0
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
; end of stm32f4xx_can_SysTick_Config
stm32f4xx_can_ITM_SendChar:
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
BEQ	L_stm32f4xx_can_ITM_SendChar203
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_can_ITM_SendChar204
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_can_ITM_SendChar205
L_stm32f4xx_can_ITM_SendChar199:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_can_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_can_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_can_ITM_SendChar22
L_stm32f4xx_can_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_can_ITM_SendChar202
L_stm32f4xx_can_ITM_SendChar203:
L_stm32f4xx_can_ITM_SendChar202:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_can_ITM_SendChar201
L_stm32f4xx_can_ITM_SendChar204:
L_stm32f4xx_can_ITM_SendChar201:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_can_ITM_SendChar200
L_stm32f4xx_can_ITM_SendChar205:
L_stm32f4xx_can_ITM_SendChar200:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_can_ITM_SendChar
stm32f4xx_can_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_can_ITM_ReceiveChar24
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
L_stm32f4xx_can_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_can_ITM_ReceiveChar
stm32f4xx_can_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_can_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_can_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_can_ITM_CheckChar
_CAN_DeInit:
;stm32f4xx_can.c,168 :: 		void CAN_DeInit(CAN_TypeDef* CANx)
; CANx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
;stm32f4xx_can.c,173 :: 		if (CANx == CAN1)
MOVW	R1, #25600
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_CAN_DeInit27
; CANx end address is: 0 (R0)
;stm32f4xx_can.c,176 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_CAN1, ENABLE);
MOVS	R1, #1
MOV	R0, #33554432
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_can.c,178 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_CAN1, DISABLE);
MOVS	R1, #0
MOV	R0, #33554432
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_can.c,179 :: 		}
IT	AL
BAL	L_CAN_DeInit28
L_CAN_DeInit27:
;stm32f4xx_can.c,183 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_CAN2, ENABLE);
MOVS	R1, #1
MOV	R0, #67108864
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_can.c,185 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_CAN2, DISABLE);
MOVS	R1, #0
MOV	R0, #67108864
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_can.c,186 :: 		}
L_CAN_DeInit28:
;stm32f4xx_can.c,187 :: 		}
L_end_CAN_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _CAN_DeInit
_CAN_Init:
;stm32f4xx_can.c,198 :: 		uint8_t CAN_Init(CAN_TypeDef* CANx, CAN_InitTypeDef* CAN_InitStruct)
; CAN_InitStruct start address is: 4 (R1)
; CANx start address is: 0 (R0)
; CAN_InitStruct end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; CAN_InitStruct start address is: 4 (R1)
;stm32f4xx_can.c,200 :: 		uint8_t InitStatus = CAN_InitStatus_Failed;
;stm32f4xx_can.c,201 :: 		uint32_t wait_ack = 0x00000000;
; wait_ack start address is: 16 (R4)
MOV	R4, #0
;stm32f4xx_can.c,217 :: 		CANx->MCR &= (~(uint32_t)CAN_MCR_SLEEP);
LDR	R3, [R0, #0]
MVN	R2, #2
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f4xx_can.c,220 :: 		CANx->MCR |= CAN_MCR_INRQ ;
LDR	R2, [R0, #0]
ORR	R2, R2, #1
STR	R2, [R0, #0]
; wait_ack end address is: 16 (R4)
; CAN_InitStruct end address is: 4 (R1)
; CANx end address is: 0 (R0)
MOV	R3, R4
;stm32f4xx_can.c,223 :: 		while (((CANx->MSR & CAN_MSR_INAK) != CAN_MSR_INAK) && (wait_ack != INAK_TIMEOUT))
L_CAN_Init29:
; wait_ack start address is: 12 (R3)
; CAN_InitStruct start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
AND	R2, R2, #1
CMP	R2, #1
IT	EQ
BEQ	L__CAN_Init209
MOVW	R2, #65535
MOVT	R2, #0
CMP	R3, R2
IT	EQ
BEQ	L__CAN_Init208
L__CAN_Init207:
;stm32f4xx_can.c,225 :: 		wait_ack++;
ADDS	R3, R3, #1
;stm32f4xx_can.c,226 :: 		}
; wait_ack end address is: 12 (R3)
IT	AL
BAL	L_CAN_Init29
;stm32f4xx_can.c,223 :: 		while (((CANx->MSR & CAN_MSR_INAK) != CAN_MSR_INAK) && (wait_ack != INAK_TIMEOUT))
L__CAN_Init209:
L__CAN_Init208:
;stm32f4xx_can.c,229 :: 		if ((CANx->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
AND	R2, R2, #1
CMP	R2, #1
IT	EQ
BEQ	L_CAN_Init33
; CAN_InitStruct end address is: 4 (R1)
; CANx end address is: 0 (R0)
;stm32f4xx_can.c,231 :: 		InitStatus = CAN_InitStatus_Failed;
; InitStatus start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_can.c,232 :: 		}
; InitStatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_Init34
L_CAN_Init33:
;stm32f4xx_can.c,236 :: 		if (CAN_InitStruct->CAN_TTCM == ENABLE)
; CANx start address is: 0 (R0)
; CAN_InitStruct start address is: 4 (R1)
ADDS	R2, R1, #6
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_CAN_Init35
;stm32f4xx_can.c,238 :: 		CANx->MCR |= CAN_MCR_TTCM;
LDR	R2, [R0, #0]
ORR	R2, R2, #128
STR	R2, [R0, #0]
;stm32f4xx_can.c,239 :: 		}
IT	AL
BAL	L_CAN_Init36
L_CAN_Init35:
;stm32f4xx_can.c,242 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_TTCM;
LDR	R3, [R0, #0]
MVN	R2, #128
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f4xx_can.c,243 :: 		}
L_CAN_Init36:
;stm32f4xx_can.c,246 :: 		if (CAN_InitStruct->CAN_ABOM == ENABLE)
ADDS	R2, R1, #7
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_CAN_Init37
;stm32f4xx_can.c,248 :: 		CANx->MCR |= CAN_MCR_ABOM;
LDR	R2, [R0, #0]
ORR	R2, R2, #64
STR	R2, [R0, #0]
;stm32f4xx_can.c,249 :: 		}
IT	AL
BAL	L_CAN_Init38
L_CAN_Init37:
;stm32f4xx_can.c,252 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_ABOM;
LDR	R3, [R0, #0]
MVN	R2, #64
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f4xx_can.c,253 :: 		}
L_CAN_Init38:
;stm32f4xx_can.c,256 :: 		if (CAN_InitStruct->CAN_AWUM == ENABLE)
ADDW	R2, R1, #8
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_CAN_Init39
;stm32f4xx_can.c,258 :: 		CANx->MCR |= CAN_MCR_AWUM;
LDR	R2, [R0, #0]
ORR	R2, R2, #32
STR	R2, [R0, #0]
;stm32f4xx_can.c,259 :: 		}
IT	AL
BAL	L_CAN_Init40
L_CAN_Init39:
;stm32f4xx_can.c,262 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_AWUM;
LDR	R3, [R0, #0]
MVN	R2, #32
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f4xx_can.c,263 :: 		}
L_CAN_Init40:
;stm32f4xx_can.c,266 :: 		if (CAN_InitStruct->CAN_NART == ENABLE)
ADDW	R2, R1, #9
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_CAN_Init41
;stm32f4xx_can.c,268 :: 		CANx->MCR |= CAN_MCR_NART;
LDR	R2, [R0, #0]
ORR	R2, R2, #16
STR	R2, [R0, #0]
;stm32f4xx_can.c,269 :: 		}
IT	AL
BAL	L_CAN_Init42
L_CAN_Init41:
;stm32f4xx_can.c,272 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_NART;
LDR	R3, [R0, #0]
MVN	R2, #16
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f4xx_can.c,273 :: 		}
L_CAN_Init42:
;stm32f4xx_can.c,276 :: 		if (CAN_InitStruct->CAN_RFLM == ENABLE)
ADDW	R2, R1, #10
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_CAN_Init43
;stm32f4xx_can.c,278 :: 		CANx->MCR |= CAN_MCR_RFLM;
LDR	R2, [R0, #0]
ORR	R2, R2, #8
STR	R2, [R0, #0]
;stm32f4xx_can.c,279 :: 		}
IT	AL
BAL	L_CAN_Init44
L_CAN_Init43:
;stm32f4xx_can.c,282 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_RFLM;
LDR	R3, [R0, #0]
MVN	R2, #8
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f4xx_can.c,283 :: 		}
L_CAN_Init44:
;stm32f4xx_can.c,286 :: 		if (CAN_InitStruct->CAN_TXFP == ENABLE)
ADDW	R2, R1, #11
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_CAN_Init45
;stm32f4xx_can.c,288 :: 		CANx->MCR |= CAN_MCR_TXFP;
LDR	R2, [R0, #0]
ORR	R2, R2, #4
STR	R2, [R0, #0]
;stm32f4xx_can.c,289 :: 		}
IT	AL
BAL	L_CAN_Init46
L_CAN_Init45:
;stm32f4xx_can.c,292 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_TXFP;
LDR	R3, [R0, #0]
MVN	R2, #4
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f4xx_can.c,293 :: 		}
L_CAN_Init46:
;stm32f4xx_can.c,300 :: 		((uint32_t)CAN_InitStruct->CAN_Prescaler - 1);
ADDW	R4, R0, #28
ADDS	R2, R1, #2
LDRB	R2, [R2, #0]
LSLS	R3, R2, #30
ADDS	R2, R1, #3
LDRB	R2, [R2, #0]
LSLS	R2, R2, #24
ORRS	R3, R2
ADDS	R2, R1, #4
LDRB	R2, [R2, #0]
LSLS	R2, R2, #16
ORRS	R3, R2
ADDS	R2, R1, #5
LDRB	R2, [R2, #0]
LSLS	R2, R2, #20
ORRS	R3, R2
LDRH	R2, [R1, #0]
; CAN_InitStruct end address is: 4 (R1)
SUBS	R2, R2, #1
ORR	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_can.c,303 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_INRQ;
LDR	R3, [R0, #0]
MVN	R2, #1
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f4xx_can.c,306 :: 		wait_ack = 0;
; wait_ack start address is: 4 (R1)
MOV	R1, #0
; CANx end address is: 0 (R0)
; wait_ack end address is: 4 (R1)
;stm32f4xx_can.c,308 :: 		while (((CANx->MSR & CAN_MSR_INAK) == CAN_MSR_INAK) && (wait_ack != INAK_TIMEOUT))
L_CAN_Init47:
; wait_ack start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
AND	R2, R2, #1
CMP	R2, #1
IT	NE
BNE	L__CAN_Init211
MOVW	R2, #65535
MOVT	R2, #0
CMP	R1, R2
IT	EQ
BEQ	L__CAN_Init210
L__CAN_Init206:
;stm32f4xx_can.c,310 :: 		wait_ack++;
ADDS	R1, R1, #1
;stm32f4xx_can.c,311 :: 		}
; wait_ack end address is: 4 (R1)
IT	AL
BAL	L_CAN_Init47
;stm32f4xx_can.c,308 :: 		while (((CANx->MSR & CAN_MSR_INAK) == CAN_MSR_INAK) && (wait_ack != INAK_TIMEOUT))
L__CAN_Init211:
L__CAN_Init210:
;stm32f4xx_can.c,314 :: 		if ((CANx->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
ADDS	R2, R0, #4
; CANx end address is: 0 (R0)
LDR	R2, [R2, #0]
AND	R2, R2, #1
CMP	R2, #1
IT	NE
BNE	L_CAN_Init51
;stm32f4xx_can.c,316 :: 		InitStatus = CAN_InitStatus_Failed;
; InitStatus start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_can.c,317 :: 		}
; InitStatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_Init52
L_CAN_Init51:
;stm32f4xx_can.c,320 :: 		InitStatus = CAN_InitStatus_Success ;
; InitStatus start address is: 0 (R0)
MOVS	R0, #1
; InitStatus end address is: 0 (R0)
;stm32f4xx_can.c,321 :: 		}
L_CAN_Init52:
;stm32f4xx_can.c,322 :: 		}
; InitStatus start address is: 0 (R0)
; InitStatus end address is: 0 (R0)
L_CAN_Init34:
;stm32f4xx_can.c,325 :: 		return InitStatus;
; InitStatus start address is: 0 (R0)
; InitStatus end address is: 0 (R0)
;stm32f4xx_can.c,326 :: 		}
L_end_CAN_Init:
BX	LR
; end of _CAN_Init
_CAN_FilterInit:
;stm32f4xx_can.c,335 :: 		void CAN_FilterInit(CAN_FilterInitTypeDef* CAN_FilterInitStruct)
; CAN_FilterInitStruct start address is: 0 (R0)
; CAN_FilterInitStruct end address is: 0 (R0)
; CAN_FilterInitStruct start address is: 0 (R0)
;stm32f4xx_can.c,337 :: 		uint32_t filter_number_bit_pos = 0;
;stm32f4xx_can.c,345 :: 		filter_number_bit_pos = ((uint32_t)1) << CAN_FilterInitStruct->CAN_FilterNumber;
ADDW	R1, R0, #10
LDRB	R2, [R1, #0]
MOV	R1, #1
LSL	R3, R1, R2
; filter_number_bit_pos start address is: 20 (R5)
MOV	R5, R3
;stm32f4xx_can.c,348 :: 		CAN1->FMR |= FMR_FINIT;
MOVW	R2, #26112
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORR	R1, R1, #1
STR	R1, [R2, #0]
;stm32f4xx_can.c,351 :: 		CAN1->FA1R &= ~(uint32_t)filter_number_bit_pos;
MVN	R3, R3
MOVW	R2, #26140
MOVT	R2, #16384
LDR	R1, [R2, #0]
ANDS	R1, R3
STR	R1, [R2, #0]
;stm32f4xx_can.c,354 :: 		if (CAN_FilterInitStruct->CAN_FilterScale == CAN_FilterScale_16bit)
ADDW	R1, R0, #12
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_CAN_FilterInit53
;stm32f4xx_can.c,357 :: 		CAN1->FS1R &= ~(uint32_t)filter_number_bit_pos;
MVN	R3, R5
MOVW	R2, #26124
MOVT	R2, #16384
LDR	R1, [R2, #0]
ANDS	R1, R3
STR	R1, [R2, #0]
;stm32f4xx_can.c,361 :: 		CAN1->sFilterRegister[CAN_FilterInitStruct->CAN_FilterNumber].FR1 =
ADDW	R1, R0, #10
LDRB	R1, [R1, #0]
LSLS	R2, R1, #3
MOVW	R1, #26176
MOVT	R1, #16384
ADDS	R4, R1, R2
;stm32f4xx_can.c,362 :: 		((0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterMaskIdLow) << 16) |
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOVW	R1, #65535
MOVT	R1, #0
ANDS	R1, R2
LSLS	R3, R1, #16
;stm32f4xx_can.c,363 :: 		(0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterIdLow);
ADDS	R1, R0, #2
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOVW	R1, #65535
MOVT	R1, #0
ANDS	R1, R2
ORR	R1, R3, R1, LSL #0
STR	R1, [R4, #0]
;stm32f4xx_can.c,367 :: 		CAN1->sFilterRegister[CAN_FilterInitStruct->CAN_FilterNumber].FR2 =
ADDW	R1, R0, #10
LDRB	R1, [R1, #0]
LSLS	R2, R1, #3
MOVW	R1, #26176
MOVT	R1, #16384
ADDS	R1, R1, R2
ADDS	R4, R1, #4
;stm32f4xx_can.c,368 :: 		((0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterMaskIdHigh) << 16) |
ADDS	R1, R0, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOVW	R1, #65535
MOVT	R1, #0
ANDS	R1, R2
LSLS	R3, R1, #16
;stm32f4xx_can.c,369 :: 		(0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterIdHigh);
LDRH	R1, [R0, #0]
UXTH	R2, R1
MOVW	R1, #65535
MOVT	R1, #0
ANDS	R1, R2
ORR	R1, R3, R1, LSL #0
STR	R1, [R4, #0]
;stm32f4xx_can.c,370 :: 		}
L_CAN_FilterInit53:
;stm32f4xx_can.c,372 :: 		if (CAN_FilterInitStruct->CAN_FilterScale == CAN_FilterScale_32bit)
ADDW	R1, R0, #12
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_CAN_FilterInit54
;stm32f4xx_can.c,375 :: 		CAN1->FS1R |= filter_number_bit_pos;
MOVW	R2, #26124
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORRS	R1, R5
STR	R1, [R2, #0]
;stm32f4xx_can.c,377 :: 		CAN1->sFilterRegister[CAN_FilterInitStruct->CAN_FilterNumber].FR1 =
ADDW	R1, R0, #10
LDRB	R1, [R1, #0]
LSLS	R2, R1, #3
MOVW	R1, #26176
MOVT	R1, #16384
ADDS	R4, R1, R2
;stm32f4xx_can.c,378 :: 		((0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterIdHigh) << 16) |
LDRH	R1, [R0, #0]
UXTH	R2, R1
MOVW	R1, #65535
MOVT	R1, #0
ANDS	R1, R2
LSLS	R3, R1, #16
;stm32f4xx_can.c,379 :: 		(0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterIdLow);
ADDS	R1, R0, #2
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOVW	R1, #65535
MOVT	R1, #0
ANDS	R1, R2
ORR	R1, R3, R1, LSL #0
STR	R1, [R4, #0]
;stm32f4xx_can.c,381 :: 		CAN1->sFilterRegister[CAN_FilterInitStruct->CAN_FilterNumber].FR2 =
ADDW	R1, R0, #10
LDRB	R1, [R1, #0]
LSLS	R2, R1, #3
MOVW	R1, #26176
MOVT	R1, #16384
ADDS	R1, R1, R2
ADDS	R4, R1, #4
;stm32f4xx_can.c,382 :: 		((0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterMaskIdHigh) << 16) |
ADDS	R1, R0, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOVW	R1, #65535
MOVT	R1, #0
ANDS	R1, R2
LSLS	R3, R1, #16
;stm32f4xx_can.c,383 :: 		(0x0000FFFF & (uint32_t)CAN_FilterInitStruct->CAN_FilterMaskIdLow);
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOVW	R1, #65535
MOVT	R1, #0
ANDS	R1, R2
ORR	R1, R3, R1, LSL #0
STR	R1, [R4, #0]
;stm32f4xx_can.c,384 :: 		}
L_CAN_FilterInit54:
;stm32f4xx_can.c,387 :: 		if (CAN_FilterInitStruct->CAN_FilterMode == CAN_FilterMode_IdMask)
ADDW	R1, R0, #11
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_CAN_FilterInit55
;stm32f4xx_can.c,390 :: 		CAN1->FM1R &= ~(uint32_t)filter_number_bit_pos;
MVN	R3, R5
MOVW	R2, #26116
MOVT	R2, #16384
LDR	R1, [R2, #0]
ANDS	R1, R3
STR	R1, [R2, #0]
;stm32f4xx_can.c,391 :: 		}
IT	AL
BAL	L_CAN_FilterInit56
L_CAN_FilterInit55:
;stm32f4xx_can.c,395 :: 		CAN1->FM1R |= (uint32_t)filter_number_bit_pos;
MOVW	R2, #26116
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORRS	R1, R5
STR	R1, [R2, #0]
;stm32f4xx_can.c,396 :: 		}
L_CAN_FilterInit56:
;stm32f4xx_can.c,399 :: 		if (CAN_FilterInitStruct->CAN_FilterFIFOAssignment == CAN_Filter_FIFO0)
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_CAN_FilterInit57
;stm32f4xx_can.c,402 :: 		CAN1->FFA1R &= ~(uint32_t)filter_number_bit_pos;
MVN	R3, R5
MOVW	R2, #26132
MOVT	R2, #16384
LDR	R1, [R2, #0]
ANDS	R1, R3
STR	R1, [R2, #0]
;stm32f4xx_can.c,403 :: 		}
L_CAN_FilterInit57:
;stm32f4xx_can.c,405 :: 		if (CAN_FilterInitStruct->CAN_FilterFIFOAssignment == CAN_Filter_FIFO1)
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_CAN_FilterInit58
;stm32f4xx_can.c,408 :: 		CAN1->FFA1R |= (uint32_t)filter_number_bit_pos;
MOVW	R2, #26132
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORRS	R1, R5
STR	R1, [R2, #0]
;stm32f4xx_can.c,409 :: 		}
L_CAN_FilterInit58:
;stm32f4xx_can.c,412 :: 		if (CAN_FilterInitStruct->CAN_FilterActivation == ENABLE)
ADDW	R1, R0, #13
; CAN_FilterInitStruct end address is: 0 (R0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_CAN_FilterInit59
;stm32f4xx_can.c,414 :: 		CAN1->FA1R |= filter_number_bit_pos;
MOVW	R2, #26140
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORRS	R1, R5
; filter_number_bit_pos end address is: 20 (R5)
STR	R1, [R2, #0]
;stm32f4xx_can.c,415 :: 		}
L_CAN_FilterInit59:
;stm32f4xx_can.c,418 :: 		CAN1->FMR &= ~FMR_FINIT;
MOVW	R3, #26112
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #1
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_can.c,419 :: 		}
L_end_CAN_FilterInit:
BX	LR
; end of _CAN_FilterInit
_CAN_StructInit:
;stm32f4xx_can.c,426 :: 		void CAN_StructInit(CAN_InitTypeDef* CAN_InitStruct)
; CAN_InitStruct start address is: 0 (R0)
; CAN_InitStruct end address is: 0 (R0)
; CAN_InitStruct start address is: 0 (R0)
;stm32f4xx_can.c,431 :: 		CAN_InitStruct->CAN_TTCM = DISABLE;
ADDS	R2, R0, #6
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_can.c,434 :: 		CAN_InitStruct->CAN_ABOM = DISABLE;
ADDS	R2, R0, #7
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_can.c,437 :: 		CAN_InitStruct->CAN_AWUM = DISABLE;
ADDW	R2, R0, #8
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_can.c,440 :: 		CAN_InitStruct->CAN_NART = DISABLE;
ADDW	R2, R0, #9
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_can.c,443 :: 		CAN_InitStruct->CAN_RFLM = DISABLE;
ADDW	R2, R0, #10
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_can.c,446 :: 		CAN_InitStruct->CAN_TXFP = DISABLE;
ADDW	R2, R0, #11
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_can.c,449 :: 		CAN_InitStruct->CAN_Mode = CAN_Mode_Normal;
ADDS	R2, R0, #2
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_can.c,452 :: 		CAN_InitStruct->CAN_SJW = CAN_SJW_1tq;
ADDS	R2, R0, #3
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_can.c,455 :: 		CAN_InitStruct->CAN_BS1 = CAN_BS1_4tq;
ADDS	R2, R0, #4
MOVS	R1, #3
STRB	R1, [R2, #0]
;stm32f4xx_can.c,458 :: 		CAN_InitStruct->CAN_BS2 = CAN_BS2_3tq;
ADDS	R2, R0, #5
MOVS	R1, #2
STRB	R1, [R2, #0]
;stm32f4xx_can.c,461 :: 		CAN_InitStruct->CAN_Prescaler = 1;
MOVS	R1, #1
STRH	R1, [R0, #0]
; CAN_InitStruct end address is: 0 (R0)
;stm32f4xx_can.c,462 :: 		}
L_end_CAN_StructInit:
BX	LR
; end of _CAN_StructInit
_CAN_SlaveStartBank:
;stm32f4xx_can.c,469 :: 		void CAN_SlaveStartBank(uint8_t CAN_BankNumber)
; CAN_BankNumber start address is: 0 (R0)
; CAN_BankNumber end address is: 0 (R0)
; CAN_BankNumber start address is: 0 (R0)
;stm32f4xx_can.c,475 :: 		CAN1->FMR |= FMR_FINIT;
MOVW	R3, #26112
MOVT	R3, #16384
LDR	R1, [R3, #0]
ORR	R2, R1, #1
STR	R2, [R3, #0]
;stm32f4xx_can.c,478 :: 		CAN1->FMR &= (uint32_t)0xFFFFC0F1 ;
MOVW	R1, #49393
MOVT	R1, #65535
ANDS	R2, R1
STR	R2, [R3, #0]
;stm32f4xx_can.c,479 :: 		CAN1->FMR |= (uint32_t)(CAN_BankNumber)<<8;
UXTB	R1, R0
; CAN_BankNumber end address is: 0 (R0)
LSLS	R1, R1, #8
ORRS	R2, R1
STR	R2, [R3, #0]
;stm32f4xx_can.c,482 :: 		CAN1->FMR &= ~FMR_FINIT;
MVN	R1, #1
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_can.c,483 :: 		}
L_end_CAN_SlaveStartBank:
BX	LR
; end of _CAN_SlaveStartBank
_CAN_DBGFreeze:
;stm32f4xx_can.c,494 :: 		void CAN_DBGFreeze(CAN_TypeDef* CANx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; CANx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_can.c,500 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_CAN_DBGFreeze60
; NewState end address is: 4 (R1)
;stm32f4xx_can.c,503 :: 		CANx->MCR |= MCR_DBF;
LDR	R2, [R0, #0]
ORR	R2, R2, #65536
STR	R2, [R0, #0]
; CANx end address is: 0 (R0)
;stm32f4xx_can.c,504 :: 		}
IT	AL
BAL	L_CAN_DBGFreeze61
L_CAN_DBGFreeze60:
;stm32f4xx_can.c,508 :: 		CANx->MCR &= ~MCR_DBF;
; CANx start address is: 0 (R0)
LDR	R3, [R0, #0]
MVN	R2, #65536
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
; CANx end address is: 0 (R0)
;stm32f4xx_can.c,509 :: 		}
L_CAN_DBGFreeze61:
;stm32f4xx_can.c,510 :: 		}
L_end_CAN_DBGFreeze:
BX	LR
; end of _CAN_DBGFreeze
_CAN_TTComModeCmd:
;stm32f4xx_can.c,524 :: 		void CAN_TTComModeCmd(CAN_TypeDef* CANx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; CANx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_can.c,529 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_CAN_TTComModeCmd62
; NewState end address is: 4 (R1)
;stm32f4xx_can.c,532 :: 		CANx->MCR |= CAN_MCR_TTCM;
LDR	R2, [R0, #0]
ORR	R2, R2, #128
STR	R2, [R0, #0]
;stm32f4xx_can.c,535 :: 		CANx->sTxMailBox[0].TDTR |= ((uint32_t)CAN_TDT0R_TGT);
ADD	R2, R0, #384
ADDS	R3, R2, #4
LDR	R2, [R3, #0]
ORR	R2, R2, #256
STR	R2, [R3, #0]
;stm32f4xx_can.c,536 :: 		CANx->sTxMailBox[1].TDTR |= ((uint32_t)CAN_TDT1R_TGT);
ADD	R2, R0, #384
ADDS	R2, #16
ADDS	R3, R2, #4
LDR	R2, [R3, #0]
ORR	R2, R2, #256
STR	R2, [R3, #0]
;stm32f4xx_can.c,537 :: 		CANx->sTxMailBox[2].TDTR |= ((uint32_t)CAN_TDT2R_TGT);
ADD	R2, R0, #384
; CANx end address is: 0 (R0)
ADDS	R2, #32
ADDS	R3, R2, #4
LDR	R2, [R3, #0]
ORR	R2, R2, #256
STR	R2, [R3, #0]
;stm32f4xx_can.c,538 :: 		}
IT	AL
BAL	L_CAN_TTComModeCmd63
L_CAN_TTComModeCmd62:
;stm32f4xx_can.c,542 :: 		CANx->MCR &= (uint32_t)(~(uint32_t)CAN_MCR_TTCM);
; CANx start address is: 0 (R0)
LDR	R3, [R0, #0]
MVN	R2, #128
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
;stm32f4xx_can.c,545 :: 		CANx->sTxMailBox[0].TDTR &= ((uint32_t)~CAN_TDT0R_TGT);
ADD	R2, R0, #384
ADDS	R4, R2, #4
LDR	R3, [R4, #0]
MVN	R2, #256
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_can.c,546 :: 		CANx->sTxMailBox[1].TDTR &= ((uint32_t)~CAN_TDT1R_TGT);
ADD	R2, R0, #384
ADDS	R2, #16
ADDS	R4, R2, #4
LDR	R3, [R4, #0]
MVN	R2, #256
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_can.c,547 :: 		CANx->sTxMailBox[2].TDTR &= ((uint32_t)~CAN_TDT2R_TGT);
ADD	R2, R0, #384
; CANx end address is: 0 (R0)
ADDS	R2, #32
ADDS	R4, R2, #4
LDR	R3, [R4, #0]
MVN	R2, #256
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_can.c,548 :: 		}
L_CAN_TTComModeCmd63:
;stm32f4xx_can.c,549 :: 		}
L_end_CAN_TTComModeCmd:
BX	LR
; end of _CAN_TTComModeCmd
_CAN_Transmit:
;stm32f4xx_can.c,578 :: 		uint8_t CAN_Transmit(CAN_TypeDef* CANx, CanTxMsg* TxMessage)
; TxMessage start address is: 4 (R1)
; CANx start address is: 0 (R0)
; TxMessage end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; TxMessage start address is: 4 (R1)
;stm32f4xx_can.c,580 :: 		uint8_t transmit_mailbox = 0;
;stm32f4xx_can.c,588 :: 		if ((CANx->TSR&CAN_TSR_TME0) == CAN_TSR_TME0)
ADDW	R2, R0, #8
LDR	R2, [R2, #0]
AND	R2, R2, #67108864
CMP	R2, #67108864
IT	NE
BNE	L_CAN_Transmit64
;stm32f4xx_can.c,590 :: 		transmit_mailbox = 0;
; transmit_mailbox start address is: 24 (R6)
MOVS	R6, #0
;stm32f4xx_can.c,591 :: 		}
; transmit_mailbox end address is: 24 (R6)
IT	AL
BAL	L_CAN_Transmit65
L_CAN_Transmit64:
;stm32f4xx_can.c,592 :: 		else if ((CANx->TSR&CAN_TSR_TME1) == CAN_TSR_TME1)
ADDW	R2, R0, #8
LDR	R2, [R2, #0]
AND	R2, R2, #134217728
CMP	R2, #134217728
IT	NE
BNE	L_CAN_Transmit66
;stm32f4xx_can.c,594 :: 		transmit_mailbox = 1;
; transmit_mailbox start address is: 8 (R2)
MOVS	R2, #1
;stm32f4xx_can.c,595 :: 		}
UXTB	R6, R2
; transmit_mailbox end address is: 8 (R2)
IT	AL
BAL	L_CAN_Transmit67
L_CAN_Transmit66:
;stm32f4xx_can.c,596 :: 		else if ((CANx->TSR&CAN_TSR_TME2) == CAN_TSR_TME2)
ADDW	R2, R0, #8
LDR	R2, [R2, #0]
AND	R2, R2, #268435456
CMP	R2, #268435456
IT	NE
BNE	L_CAN_Transmit68
;stm32f4xx_can.c,598 :: 		transmit_mailbox = 2;
; transmit_mailbox start address is: 8 (R2)
MOVS	R2, #2
;stm32f4xx_can.c,599 :: 		}
; transmit_mailbox end address is: 8 (R2)
IT	AL
BAL	L_CAN_Transmit69
L_CAN_Transmit68:
;stm32f4xx_can.c,602 :: 		transmit_mailbox = CAN_TxStatus_NoMailBox;
; transmit_mailbox start address is: 8 (R2)
MOVS	R2, #4
; transmit_mailbox end address is: 8 (R2)
;stm32f4xx_can.c,603 :: 		}
L_CAN_Transmit69:
; transmit_mailbox start address is: 8 (R2)
UXTB	R6, R2
; transmit_mailbox end address is: 8 (R2)
L_CAN_Transmit67:
; transmit_mailbox start address is: 24 (R6)
; transmit_mailbox end address is: 24 (R6)
L_CAN_Transmit65:
;stm32f4xx_can.c,605 :: 		if (transmit_mailbox != CAN_TxStatus_NoMailBox)
; transmit_mailbox start address is: 24 (R6)
CMP	R6, #4
IT	EQ
BEQ	L_CAN_Transmit70
;stm32f4xx_can.c,608 :: 		CANx->sTxMailBox[transmit_mailbox].TIR &= TMIDxR_TXRQ;
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R3, R3, R2
LDR	R2, [R3, #0]
AND	R2, R2, #1
STR	R2, [R3, #0]
;stm32f4xx_can.c,609 :: 		if (TxMessage->IDE == CAN_Id_Standard)
ADDW	R2, R1, #8
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_CAN_Transmit71
;stm32f4xx_can.c,613 :: 		TxMessage->RTR);
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R4, R3, R2
LDR	R2, [R1, #0]
LSLS	R3, R2, #21
ADDW	R2, R1, #9
LDRB	R2, [R2, #0]
ORRS	R3, R2
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;stm32f4xx_can.c,614 :: 		}
IT	AL
BAL	L_CAN_Transmit72
L_CAN_Transmit71:
;stm32f4xx_can.c,620 :: 		TxMessage->RTR);
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R4, R3, R2
ADDS	R2, R1, #4
LDR	R2, [R2, #0]
LSLS	R3, R2, #3
ADDW	R2, R1, #8
LDRB	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #9
LDRB	R2, [R2, #0]
ORRS	R3, R2
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;stm32f4xx_can.c,621 :: 		}
L_CAN_Transmit72:
;stm32f4xx_can.c,624 :: 		TxMessage->DLC &= (uint8_t)0x0000000F;
ADDW	R3, R1, #10
LDRB	R2, [R3, #0]
AND	R2, R2, #15
STRB	R2, [R3, #0]
;stm32f4xx_can.c,625 :: 		CANx->sTxMailBox[transmit_mailbox].TDTR &= (uint32_t)0xFFFFFFF0;
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R2, R3, R2
ADDS	R4, R2, #4
LDR	R3, [R4, #0]
MVN	R2, #15
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_can.c,626 :: 		CANx->sTxMailBox[transmit_mailbox].TDTR |= TxMessage->DLC;
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R2, R3, R2
ADDS	R4, R2, #4
ADDW	R2, R1, #10
LDRB	R3, [R2, #0]
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;stm32f4xx_can.c,629 :: 		CANx->sTxMailBox[transmit_mailbox].TDLR = (((uint32_t)TxMessage->Data[3] << 24) |
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R2, R3, R2
ADDW	R5, R2, #8
ADDW	R4, R1, #11
ADDS	R2, R4, #3
LDRB	R2, [R2, #0]
LSLS	R3, R2, #24
;stm32f4xx_can.c,630 :: 		((uint32_t)TxMessage->Data[2] << 16) |
ADDS	R2, R4, #2
LDRB	R2, [R2, #0]
LSLS	R2, R2, #16
ORRS	R3, R2
;stm32f4xx_can.c,631 :: 		((uint32_t)TxMessage->Data[1] << 8) |
ADDS	R2, R4, #1
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
ORRS	R3, R2
;stm32f4xx_can.c,632 :: 		((uint32_t)TxMessage->Data[0]));
LDRB	R2, [R4, #0]
ORR	R2, R3, R2, LSL #0
STR	R2, [R5, #0]
;stm32f4xx_can.c,633 :: 		CANx->sTxMailBox[transmit_mailbox].TDHR = (((uint32_t)TxMessage->Data[7] << 24) |
ADD	R3, R0, #384
LSLS	R2, R6, #4
ADDS	R2, R3, R2
ADDW	R5, R2, #12
ADDW	R4, R1, #11
; TxMessage end address is: 4 (R1)
ADDS	R2, R4, #7
LDRB	R2, [R2, #0]
LSLS	R3, R2, #24
;stm32f4xx_can.c,634 :: 		((uint32_t)TxMessage->Data[6] << 16) |
ADDS	R2, R4, #6
LDRB	R2, [R2, #0]
LSLS	R2, R2, #16
ORRS	R3, R2
;stm32f4xx_can.c,635 :: 		((uint32_t)TxMessage->Data[5] << 8) |
ADDS	R2, R4, #5
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
ORRS	R3, R2
;stm32f4xx_can.c,636 :: 		((uint32_t)TxMessage->Data[4]));
ADDS	R2, R4, #4
LDRB	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
STR	R2, [R5, #0]
;stm32f4xx_can.c,638 :: 		CANx->sTxMailBox[transmit_mailbox].TIR |= TMIDxR_TXRQ;
ADD	R3, R0, #384
; CANx end address is: 0 (R0)
LSLS	R2, R6, #4
ADDS	R3, R3, R2
LDR	R2, [R3, #0]
ORR	R2, R2, #1
STR	R2, [R3, #0]
;stm32f4xx_can.c,639 :: 		}
L_CAN_Transmit70:
;stm32f4xx_can.c,640 :: 		return transmit_mailbox;
UXTB	R0, R6
; transmit_mailbox end address is: 24 (R6)
;stm32f4xx_can.c,641 :: 		}
L_end_CAN_Transmit:
BX	LR
; end of _CAN_Transmit
_CAN_TransmitStatus:
;stm32f4xx_can.c,650 :: 		uint8_t CAN_TransmitStatus(CAN_TypeDef* CANx, uint8_t TransmitMailbox)
; TransmitMailbox start address is: 4 (R1)
; CANx start address is: 0 (R0)
; TransmitMailbox end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; TransmitMailbox start address is: 4 (R1)
;stm32f4xx_can.c,652 :: 		uint32_t state = 0;
;stm32f4xx_can.c,658 :: 		switch (TransmitMailbox)
IT	AL
BAL	L_CAN_TransmitStatus73
; TransmitMailbox end address is: 4 (R1)
;stm32f4xx_can.c,660 :: 		case (CAN_TXMAILBOX_0):
L_CAN_TransmitStatus75:
;stm32f4xx_can.c,661 :: 		state =   CANx->TSR &  (CAN_TSR_RQCP0 | CAN_TSR_TXOK0 | CAN_TSR_TME0);
ADDW	R2, R0, #8
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #3
MOVT	R2, #1024
AND	R0, R3, R2, LSL #0
; state start address is: 0 (R0)
;stm32f4xx_can.c,662 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus74
;stm32f4xx_can.c,663 :: 		case (CAN_TXMAILBOX_1):
L_CAN_TransmitStatus76:
;stm32f4xx_can.c,664 :: 		state =   CANx->TSR &  (CAN_TSR_RQCP1 | CAN_TSR_TXOK1 | CAN_TSR_TME1);
; CANx start address is: 0 (R0)
ADDW	R2, R0, #8
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #768
MOVT	R2, #2048
AND	R0, R3, R2, LSL #0
; state start address is: 0 (R0)
;stm32f4xx_can.c,665 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus74
;stm32f4xx_can.c,666 :: 		case (CAN_TXMAILBOX_2):
L_CAN_TransmitStatus77:
;stm32f4xx_can.c,667 :: 		state =   CANx->TSR &  (CAN_TSR_RQCP2 | CAN_TSR_TXOK2 | CAN_TSR_TME2);
; CANx start address is: 0 (R0)
ADDW	R2, R0, #8
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #0
MOVT	R2, #4099
AND	R0, R3, R2, LSL #0
; state start address is: 0 (R0)
;stm32f4xx_can.c,668 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus74
;stm32f4xx_can.c,669 :: 		default:
L_CAN_TransmitStatus78:
;stm32f4xx_can.c,670 :: 		state = CAN_TxStatus_Failed;
; state start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_can.c,671 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus74
;stm32f4xx_can.c,672 :: 		}
L_CAN_TransmitStatus73:
; TransmitMailbox start address is: 4 (R1)
; CANx start address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_CAN_TransmitStatus75
CMP	R1, #1
IT	EQ
BEQ	L_CAN_TransmitStatus76
CMP	R1, #2
IT	EQ
BEQ	L_CAN_TransmitStatus77
; CANx end address is: 0 (R0)
; TransmitMailbox end address is: 4 (R1)
IT	AL
BAL	L_CAN_TransmitStatus78
L_CAN_TransmitStatus74:
;stm32f4xx_can.c,673 :: 		switch (state)
; state start address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus79
; state end address is: 0 (R0)
;stm32f4xx_can.c,676 :: 		case (0x0): state = CAN_TxStatus_Pending;
L_CAN_TransmitStatus81:
; state start address is: 0 (R0)
MOVS	R0, #2
;stm32f4xx_can.c,677 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f4xx_can.c,679 :: 		case (CAN_TSR_RQCP0 | CAN_TSR_TME0): state = CAN_TxStatus_Failed;
L_CAN_TransmitStatus82:
; state start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_can.c,680 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f4xx_can.c,681 :: 		case (CAN_TSR_RQCP1 | CAN_TSR_TME1): state = CAN_TxStatus_Failed;
L_CAN_TransmitStatus83:
; state start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_can.c,682 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f4xx_can.c,683 :: 		case (CAN_TSR_RQCP2 | CAN_TSR_TME2): state = CAN_TxStatus_Failed;
L_CAN_TransmitStatus84:
; state start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_can.c,684 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f4xx_can.c,686 :: 		case (CAN_TSR_RQCP0 | CAN_TSR_TXOK0 | CAN_TSR_TME0):state = CAN_TxStatus_Ok;
L_CAN_TransmitStatus85:
; state start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_can.c,687 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f4xx_can.c,688 :: 		case (CAN_TSR_RQCP1 | CAN_TSR_TXOK1 | CAN_TSR_TME1):state = CAN_TxStatus_Ok;
L_CAN_TransmitStatus86:
; state start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_can.c,689 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f4xx_can.c,690 :: 		case (CAN_TSR_RQCP2 | CAN_TSR_TXOK2 | CAN_TSR_TME2):state = CAN_TxStatus_Ok;
L_CAN_TransmitStatus87:
; state start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_can.c,691 :: 		break;
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f4xx_can.c,692 :: 		default: state = CAN_TxStatus_Failed;
L_CAN_TransmitStatus88:
; state start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_can.c,693 :: 		break;
IT	AL
BAL	L_CAN_TransmitStatus80
;stm32f4xx_can.c,694 :: 		}
L_CAN_TransmitStatus79:
CMP	R0, #0
IT	EQ
BEQ	L_CAN_TransmitStatus81
MOVW	R2, #1
MOVT	R2, #1024
CMP	R0, R2
IT	EQ
BEQ	L_CAN_TransmitStatus82
MOVW	R2, #256
MOVT	R2, #2048
CMP	R0, R2
IT	EQ
BEQ	L_CAN_TransmitStatus83
MOVW	R2, #0
MOVT	R2, #4097
CMP	R0, R2
IT	EQ
BEQ	L_CAN_TransmitStatus84
MOVW	R2, #3
MOVT	R2, #1024
CMP	R0, R2
IT	EQ
BEQ	L_CAN_TransmitStatus85
MOVW	R2, #768
MOVT	R2, #2048
CMP	R0, R2
IT	EQ
BEQ	L_CAN_TransmitStatus86
MOVW	R2, #0
MOVT	R2, #4099
CMP	R0, R2
IT	EQ
BEQ	L_CAN_TransmitStatus87
; state end address is: 0 (R0)
IT	AL
BAL	L_CAN_TransmitStatus88
L_CAN_TransmitStatus80:
;stm32f4xx_can.c,695 :: 		return (uint8_t) state;
; state start address is: 0 (R0)
UXTB	R0, R0
; state end address is: 0 (R0)
;stm32f4xx_can.c,696 :: 		}
L_end_CAN_TransmitStatus:
BX	LR
; end of _CAN_TransmitStatus
_CAN_CancelTransmit:
;stm32f4xx_can.c,704 :: 		void CAN_CancelTransmit(CAN_TypeDef* CANx, uint8_t Mailbox)
; Mailbox start address is: 4 (R1)
; CANx start address is: 0 (R0)
; Mailbox end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; Mailbox start address is: 4 (R1)
;stm32f4xx_can.c,710 :: 		switch (Mailbox)
IT	AL
BAL	L_CAN_CancelTransmit89
; Mailbox end address is: 4 (R1)
;stm32f4xx_can.c,712 :: 		case (CAN_TXMAILBOX_0): CANx->TSR |= CAN_TSR_ABRQ0;
L_CAN_CancelTransmit91:
ADDW	R3, R0, #8
; CANx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #128
STR	R2, [R3, #0]
;stm32f4xx_can.c,713 :: 		break;
IT	AL
BAL	L_CAN_CancelTransmit90
;stm32f4xx_can.c,714 :: 		case (CAN_TXMAILBOX_1): CANx->TSR |= CAN_TSR_ABRQ1;
L_CAN_CancelTransmit92:
; CANx start address is: 0 (R0)
ADDW	R3, R0, #8
; CANx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #32768
STR	R2, [R3, #0]
;stm32f4xx_can.c,715 :: 		break;
IT	AL
BAL	L_CAN_CancelTransmit90
;stm32f4xx_can.c,716 :: 		case (CAN_TXMAILBOX_2): CANx->TSR |= CAN_TSR_ABRQ2;
L_CAN_CancelTransmit93:
; CANx start address is: 0 (R0)
ADDW	R3, R0, #8
; CANx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #8388608
STR	R2, [R3, #0]
;stm32f4xx_can.c,717 :: 		break;
IT	AL
BAL	L_CAN_CancelTransmit90
;stm32f4xx_can.c,718 :: 		default:
L_CAN_CancelTransmit94:
;stm32f4xx_can.c,719 :: 		break;
IT	AL
BAL	L_CAN_CancelTransmit90
;stm32f4xx_can.c,720 :: 		}
L_CAN_CancelTransmit89:
; Mailbox start address is: 4 (R1)
; CANx start address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_CAN_CancelTransmit91
CMP	R1, #1
IT	EQ
BEQ	L_CAN_CancelTransmit92
CMP	R1, #2
IT	EQ
BEQ	L_CAN_CancelTransmit93
; CANx end address is: 0 (R0)
; Mailbox end address is: 4 (R1)
IT	AL
BAL	L_CAN_CancelTransmit94
L_CAN_CancelTransmit90:
;stm32f4xx_can.c,721 :: 		}
L_end_CAN_CancelTransmit:
BX	LR
; end of _CAN_CancelTransmit
_CAN_Receive:
;stm32f4xx_can.c,751 :: 		void CAN_Receive(CAN_TypeDef* CANx, uint8_t FIFONumber, CanRxMsg* RxMessage)
; RxMessage start address is: 8 (R2)
; FIFONumber start address is: 4 (R1)
; CANx start address is: 0 (R0)
; RxMessage end address is: 8 (R2)
; FIFONumber end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; FIFONumber start address is: 4 (R1)
; RxMessage start address is: 8 (R2)
;stm32f4xx_can.c,757 :: 		RxMessage->IDE = (uint8_t)0x04 & CANx->sFIFOMailBox[FIFONumber].RIR;
ADDW	R5, R2, #8
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
LDR	R3, [R3, #0]
AND	R3, R3, #4
STRB	R3, [R5, #0]
;stm32f4xx_can.c,758 :: 		if (RxMessage->IDE == CAN_Id_Standard)
ADDW	R3, R2, #8
LDRB	R3, [R3, #0]
CMP	R3, #0
IT	NE
BNE	L_CAN_Receive95
;stm32f4xx_can.c,760 :: 		RxMessage->StdId = (uint32_t)0x000007FF & (CANx->sFIFOMailBox[FIFONumber].RIR >> 21);
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
LDR	R3, [R3, #0]
LSRS	R4, R3, #21
MOVW	R3, #2047
MOVT	R3, #0
ANDS	R3, R4
STR	R3, [R2, #0]
;stm32f4xx_can.c,761 :: 		}
IT	AL
BAL	L_CAN_Receive96
L_CAN_Receive95:
;stm32f4xx_can.c,764 :: 		RxMessage->ExtId = (uint32_t)0x1FFFFFFF & (CANx->sFIFOMailBox[FIFONumber].RIR >> 3);
ADDS	R5, R2, #4
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
LDR	R3, [R3, #0]
LSRS	R4, R3, #3
MVN	R3, #-536870912
ANDS	R3, R4
STR	R3, [R5, #0]
;stm32f4xx_can.c,765 :: 		}
L_CAN_Receive96:
;stm32f4xx_can.c,767 :: 		RxMessage->RTR = (uint8_t)0x02 & CANx->sFIFOMailBox[FIFONumber].RIR;
ADDW	R5, R2, #9
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
LDR	R3, [R3, #0]
AND	R3, R3, #2
STRB	R3, [R5, #0]
;stm32f4xx_can.c,769 :: 		RxMessage->DLC = (uint8_t)0x0F & CANx->sFIFOMailBox[FIFONumber].RDTR;
ADDW	R5, R2, #10
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, R3, #4
LDR	R3, [R3, #0]
AND	R3, R3, #15
STRB	R3, [R5, #0]
;stm32f4xx_can.c,771 :: 		RxMessage->FMI = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDTR >> 8);
ADDW	R5, R2, #19
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, R3, #4
LDR	R3, [R3, #0]
LSRS	R3, R3, #8
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f4xx_can.c,773 :: 		RxMessage->Data[0] = (uint8_t)0xFF & CANx->sFIFOMailBox[FIFONumber].RDLR;
ADDW	R5, R2, #11
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #8
LDR	R3, [R3, #0]
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f4xx_can.c,774 :: 		RxMessage->Data[1] = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDLR >> 8);
ADDW	R3, R2, #11
ADDS	R5, R3, #1
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #8
LDR	R3, [R3, #0]
LSRS	R3, R3, #8
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f4xx_can.c,775 :: 		RxMessage->Data[2] = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDLR >> 16);
ADDW	R3, R2, #11
ADDS	R5, R3, #2
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #8
LDR	R3, [R3, #0]
LSRS	R3, R3, #16
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f4xx_can.c,776 :: 		RxMessage->Data[3] = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDLR >> 24);
ADDW	R3, R2, #11
ADDS	R5, R3, #3
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #8
LDR	R3, [R3, #0]
LSRS	R3, R3, #24
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f4xx_can.c,777 :: 		RxMessage->Data[4] = (uint8_t)0xFF & CANx->sFIFOMailBox[FIFONumber].RDHR;
ADDW	R3, R2, #11
ADDS	R5, R3, #4
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #12
LDR	R3, [R3, #0]
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f4xx_can.c,778 :: 		RxMessage->Data[5] = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDHR >> 8);
ADDW	R3, R2, #11
ADDS	R5, R3, #5
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #12
LDR	R3, [R3, #0]
LSRS	R3, R3, #8
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f4xx_can.c,779 :: 		RxMessage->Data[6] = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDHR >> 16);
ADDW	R3, R2, #11
ADDS	R5, R3, #6
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #12
LDR	R3, [R3, #0]
LSRS	R3, R3, #16
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f4xx_can.c,780 :: 		RxMessage->Data[7] = (uint8_t)0xFF & (CANx->sFIFOMailBox[FIFONumber].RDHR >> 24);
ADDW	R3, R2, #11
; RxMessage end address is: 8 (R2)
ADDS	R5, R3, #7
ADD	R4, R0, #432
LSLS	R3, R1, #4
ADDS	R3, R4, R3
ADDS	R3, #12
LDR	R3, [R3, #0]
LSRS	R3, R3, #24
AND	R3, R3, #255
STRB	R3, [R5, #0]
;stm32f4xx_can.c,783 :: 		if (FIFONumber == CAN_FIFO0)
CMP	R1, #0
IT	NE
BNE	L_CAN_Receive97
; FIFONumber end address is: 4 (R1)
;stm32f4xx_can.c,785 :: 		CANx->RF0R |= CAN_RF0R_RFOM0;
ADDW	R4, R0, #12
; CANx end address is: 0 (R0)
LDR	R3, [R4, #0]
ORR	R3, R3, #32
STR	R3, [R4, #0]
;stm32f4xx_can.c,786 :: 		}
IT	AL
BAL	L_CAN_Receive98
L_CAN_Receive97:
;stm32f4xx_can.c,790 :: 		CANx->RF1R |= CAN_RF1R_RFOM1;
; CANx start address is: 0 (R0)
ADDW	R4, R0, #16
; CANx end address is: 0 (R0)
LDR	R3, [R4, #0]
ORR	R3, R3, #32
STR	R3, [R4, #0]
;stm32f4xx_can.c,791 :: 		}
L_CAN_Receive98:
;stm32f4xx_can.c,792 :: 		}
L_end_CAN_Receive:
BX	LR
; end of _CAN_Receive
_CAN_FIFORelease:
;stm32f4xx_can.c,800 :: 		void CAN_FIFORelease(CAN_TypeDef* CANx, uint8_t FIFONumber)
; FIFONumber start address is: 4 (R1)
; CANx start address is: 0 (R0)
; FIFONumber end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; FIFONumber start address is: 4 (R1)
;stm32f4xx_can.c,806 :: 		if (FIFONumber == CAN_FIFO0)
CMP	R1, #0
IT	NE
BNE	L_CAN_FIFORelease99
; FIFONumber end address is: 4 (R1)
;stm32f4xx_can.c,808 :: 		CANx->RF0R |= CAN_RF0R_RFOM0;
ADDW	R3, R0, #12
; CANx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #32
STR	R2, [R3, #0]
;stm32f4xx_can.c,809 :: 		}
IT	AL
BAL	L_CAN_FIFORelease100
L_CAN_FIFORelease99:
;stm32f4xx_can.c,813 :: 		CANx->RF1R |= CAN_RF1R_RFOM1;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #16
; CANx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #32
STR	R2, [R3, #0]
;stm32f4xx_can.c,814 :: 		}
L_CAN_FIFORelease100:
;stm32f4xx_can.c,815 :: 		}
L_end_CAN_FIFORelease:
BX	LR
; end of _CAN_FIFORelease
_CAN_MessagePending:
;stm32f4xx_can.c,823 :: 		uint8_t CAN_MessagePending(CAN_TypeDef* CANx, uint8_t FIFONumber)
; FIFONumber start address is: 4 (R1)
; CANx start address is: 0 (R0)
; FIFONumber end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; FIFONumber start address is: 4 (R1)
;stm32f4xx_can.c,825 :: 		uint8_t message_pending=0;
;stm32f4xx_can.c,829 :: 		if (FIFONumber == CAN_FIFO0)
CMP	R1, #0
IT	NE
BNE	L_CAN_MessagePending101
; FIFONumber end address is: 4 (R1)
;stm32f4xx_can.c,831 :: 		message_pending = (uint8_t)(CANx->RF0R&(uint32_t)0x03);
ADDW	R2, R0, #12
; CANx end address is: 0 (R0)
LDR	R2, [R2, #0]
AND	R2, R2, #3
; message_pending start address is: 0 (R0)
UXTB	R0, R2
;stm32f4xx_can.c,832 :: 		}
; message_pending end address is: 0 (R0)
IT	AL
BAL	L_CAN_MessagePending102
L_CAN_MessagePending101:
;stm32f4xx_can.c,833 :: 		else if (FIFONumber == CAN_FIFO1)
; FIFONumber start address is: 4 (R1)
; CANx start address is: 0 (R0)
CMP	R1, #1
IT	NE
BNE	L_CAN_MessagePending103
; FIFONumber end address is: 4 (R1)
;stm32f4xx_can.c,835 :: 		message_pending = (uint8_t)(CANx->RF1R&(uint32_t)0x03);
ADDW	R2, R0, #16
; CANx end address is: 0 (R0)
LDR	R2, [R2, #0]
AND	R2, R2, #3
; message_pending start address is: 0 (R0)
UXTB	R0, R2
;stm32f4xx_can.c,836 :: 		}
; message_pending end address is: 0 (R0)
IT	AL
BAL	L_CAN_MessagePending104
L_CAN_MessagePending103:
;stm32f4xx_can.c,839 :: 		message_pending = 0;
; message_pending start address is: 0 (R0)
MOVS	R0, #0
; message_pending end address is: 0 (R0)
;stm32f4xx_can.c,840 :: 		}
L_CAN_MessagePending104:
; message_pending start address is: 0 (R0)
; message_pending end address is: 0 (R0)
L_CAN_MessagePending102:
;stm32f4xx_can.c,841 :: 		return message_pending;
; message_pending start address is: 0 (R0)
; message_pending end address is: 0 (R0)
;stm32f4xx_can.c,842 :: 		}
L_end_CAN_MessagePending:
BX	LR
; end of _CAN_MessagePending
_CAN_OperatingModeRequest:
;stm32f4xx_can.c,873 :: 		uint8_t CAN_OperatingModeRequest(CAN_TypeDef* CANx, uint8_t CAN_OperatingMode)
; CAN_OperatingMode start address is: 4 (R1)
; CANx start address is: 0 (R0)
UXTB	R2, R1
; CAN_OperatingMode end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; CAN_OperatingMode start address is: 8 (R2)
;stm32f4xx_can.c,875 :: 		uint8_t status = CAN_ModeStatus_Failed;
;stm32f4xx_can.c,878 :: 		uint32_t timeout = INAK_TIMEOUT;
; timeout start address is: 4 (R1)
MOVW	R1, #65535
MOVT	R1, #0
;stm32f4xx_can.c,884 :: 		if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
CMP	R2, #0
IT	NE
BNE	L_CAN_OperatingModeRequest105
; CAN_OperatingMode end address is: 8 (R2)
;stm32f4xx_can.c,887 :: 		CANx->MCR = (uint32_t)((CANx->MCR & (uint32_t)(~(uint32_t)CAN_MCR_SLEEP)) | CAN_MCR_INRQ);
LDR	R3, [R0, #0]
MVN	R2, #2
AND	R2, R3, R2, LSL #0
ORR	R2, R2, #1
STR	R2, [R0, #0]
; CANx end address is: 0 (R0)
; timeout end address is: 4 (R1)
;stm32f4xx_can.c,890 :: 		while (((CANx->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
L_CAN_OperatingModeRequest106:
; timeout start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
AND	R2, R2, #3
CMP	R2, #1
IT	EQ
BEQ	L__CAN_OperatingModeRequest216
CMP	R1, #0
IT	EQ
BEQ	L__CAN_OperatingModeRequest215
L__CAN_OperatingModeRequest214:
;stm32f4xx_can.c,892 :: 		timeout--;
SUBS	R1, R1, #1
;stm32f4xx_can.c,893 :: 		}
; timeout end address is: 4 (R1)
IT	AL
BAL	L_CAN_OperatingModeRequest106
;stm32f4xx_can.c,890 :: 		while (((CANx->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
L__CAN_OperatingModeRequest216:
L__CAN_OperatingModeRequest215:
;stm32f4xx_can.c,894 :: 		if ((CANx->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
ADDS	R2, R0, #4
; CANx end address is: 0 (R0)
LDR	R2, [R2, #0]
AND	R2, R2, #3
CMP	R2, #1
IT	EQ
BEQ	L_CAN_OperatingModeRequest110
;stm32f4xx_can.c,896 :: 		status = CAN_ModeStatus_Failed;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_can.c,897 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_CAN_OperatingModeRequest111
L_CAN_OperatingModeRequest110:
;stm32f4xx_can.c,900 :: 		status = CAN_ModeStatus_Success;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_can.c,901 :: 		}
L_CAN_OperatingModeRequest111:
;stm32f4xx_can.c,902 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_CAN_OperatingModeRequest112
L_CAN_OperatingModeRequest105:
;stm32f4xx_can.c,903 :: 		else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
; timeout start address is: 4 (R1)
; CANx start address is: 0 (R0)
; CAN_OperatingMode start address is: 8 (R2)
CMP	R2, #1
IT	NE
BNE	L_CAN_OperatingModeRequest113
; CAN_OperatingMode end address is: 8 (R2)
;stm32f4xx_can.c,906 :: 		CANx->MCR &= (uint32_t)(~(CAN_MCR_SLEEP|CAN_MCR_INRQ));
LDR	R3, [R0, #0]
MVN	R2, #3
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
; CANx end address is: 0 (R0)
; timeout end address is: 4 (R1)
;stm32f4xx_can.c,909 :: 		while (((CANx->MSR & CAN_MODE_MASK) != 0) && (timeout!=0))
L_CAN_OperatingModeRequest114:
; timeout start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
AND	R2, R2, #3
CMP	R2, #0
IT	EQ
BEQ	L__CAN_OperatingModeRequest218
CMP	R1, #0
IT	EQ
BEQ	L__CAN_OperatingModeRequest217
L__CAN_OperatingModeRequest213:
;stm32f4xx_can.c,911 :: 		timeout--;
SUBS	R1, R1, #1
;stm32f4xx_can.c,912 :: 		}
; timeout end address is: 4 (R1)
IT	AL
BAL	L_CAN_OperatingModeRequest114
;stm32f4xx_can.c,909 :: 		while (((CANx->MSR & CAN_MODE_MASK) != 0) && (timeout!=0))
L__CAN_OperatingModeRequest218:
L__CAN_OperatingModeRequest217:
;stm32f4xx_can.c,913 :: 		if ((CANx->MSR & CAN_MODE_MASK) != 0)
ADDS	R2, R0, #4
; CANx end address is: 0 (R0)
LDR	R2, [R2, #0]
AND	R2, R2, #3
CMP	R2, #0
IT	EQ
BEQ	L_CAN_OperatingModeRequest118
;stm32f4xx_can.c,915 :: 		status = CAN_ModeStatus_Failed;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_can.c,916 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_CAN_OperatingModeRequest119
L_CAN_OperatingModeRequest118:
;stm32f4xx_can.c,919 :: 		status = CAN_ModeStatus_Success;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_can.c,920 :: 		}
L_CAN_OperatingModeRequest119:
;stm32f4xx_can.c,921 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_CAN_OperatingModeRequest120
L_CAN_OperatingModeRequest113:
;stm32f4xx_can.c,922 :: 		else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
; timeout start address is: 4 (R1)
; CANx start address is: 0 (R0)
; CAN_OperatingMode start address is: 8 (R2)
CMP	R2, #2
IT	NE
BNE	L_CAN_OperatingModeRequest121
; CAN_OperatingMode end address is: 8 (R2)
;stm32f4xx_can.c,925 :: 		CANx->MCR = (uint32_t)((CANx->MCR & (uint32_t)(~(uint32_t)CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
LDR	R3, [R0, #0]
MVN	R2, #1
AND	R2, R3, R2, LSL #0
ORR	R2, R2, #2
STR	R2, [R0, #0]
; CANx end address is: 0 (R0)
; timeout end address is: 4 (R1)
;stm32f4xx_can.c,928 :: 		while (((CANx->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout!=0))
L_CAN_OperatingModeRequest122:
; timeout start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDS	R2, R0, #4
LDR	R2, [R2, #0]
AND	R2, R2, #3
CMP	R2, #2
IT	EQ
BEQ	L__CAN_OperatingModeRequest220
CMP	R1, #0
IT	EQ
BEQ	L__CAN_OperatingModeRequest219
L__CAN_OperatingModeRequest212:
;stm32f4xx_can.c,930 :: 		timeout--;
SUBS	R1, R1, #1
;stm32f4xx_can.c,931 :: 		}
; timeout end address is: 4 (R1)
IT	AL
BAL	L_CAN_OperatingModeRequest122
;stm32f4xx_can.c,928 :: 		while (((CANx->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout!=0))
L__CAN_OperatingModeRequest220:
L__CAN_OperatingModeRequest219:
;stm32f4xx_can.c,932 :: 		if ((CANx->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
ADDS	R2, R0, #4
; CANx end address is: 0 (R0)
LDR	R2, [R2, #0]
AND	R2, R2, #3
CMP	R2, #2
IT	EQ
BEQ	L_CAN_OperatingModeRequest126
;stm32f4xx_can.c,934 :: 		status = CAN_ModeStatus_Failed;
; status start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_can.c,935 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_CAN_OperatingModeRequest127
L_CAN_OperatingModeRequest126:
;stm32f4xx_can.c,938 :: 		status = CAN_ModeStatus_Success;
; status start address is: 0 (R0)
MOVS	R0, #1
; status end address is: 0 (R0)
;stm32f4xx_can.c,939 :: 		}
L_CAN_OperatingModeRequest127:
;stm32f4xx_can.c,940 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_CAN_OperatingModeRequest128
L_CAN_OperatingModeRequest121:
;stm32f4xx_can.c,943 :: 		status = CAN_ModeStatus_Failed;
; status start address is: 0 (R0)
MOVS	R0, #0
; status end address is: 0 (R0)
;stm32f4xx_can.c,944 :: 		}
L_CAN_OperatingModeRequest128:
; status start address is: 0 (R0)
; status end address is: 0 (R0)
L_CAN_OperatingModeRequest120:
; status start address is: 0 (R0)
; status end address is: 0 (R0)
L_CAN_OperatingModeRequest112:
;stm32f4xx_can.c,946 :: 		return  (uint8_t) status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f4xx_can.c,947 :: 		}
L_end_CAN_OperatingModeRequest:
BX	LR
; end of _CAN_OperatingModeRequest
_CAN_Sleep:
;stm32f4xx_can.c,954 :: 		uint8_t CAN_Sleep(CAN_TypeDef* CANx)
; CANx start address is: 0 (R0)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
;stm32f4xx_can.c,956 :: 		uint8_t sleepstatus = CAN_Sleep_Failed;
; sleepstatus start address is: 12 (R3)
MOVS	R3, #0
;stm32f4xx_can.c,962 :: 		CANx->MCR = (((CANx->MCR) & (uint32_t)(~(uint32_t)CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
LDR	R2, [R0, #0]
MVN	R1, #1
AND	R1, R2, R1, LSL #0
ORR	R1, R1, #2
STR	R1, [R0, #0]
;stm32f4xx_can.c,965 :: 		if ((CANx->MSR & (CAN_MSR_SLAK|CAN_MSR_INAK)) == CAN_MSR_SLAK)
ADDS	R1, R0, #4
; CANx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #3
CMP	R1, #2
IT	NE
BNE	L__CAN_Sleep221
; sleepstatus end address is: 12 (R3)
;stm32f4xx_can.c,968 :: 		sleepstatus =  CAN_Sleep_Ok;
; sleepstatus start address is: 0 (R0)
MOVS	R0, #1
; sleepstatus end address is: 0 (R0)
;stm32f4xx_can.c,969 :: 		}
IT	AL
BAL	L_CAN_Sleep129
L__CAN_Sleep221:
;stm32f4xx_can.c,965 :: 		if ((CANx->MSR & (CAN_MSR_SLAK|CAN_MSR_INAK)) == CAN_MSR_SLAK)
UXTB	R0, R3
;stm32f4xx_can.c,969 :: 		}
L_CAN_Sleep129:
;stm32f4xx_can.c,971 :: 		return (uint8_t)sleepstatus;
; sleepstatus start address is: 0 (R0)
; sleepstatus end address is: 0 (R0)
;stm32f4xx_can.c,972 :: 		}
L_end_CAN_Sleep:
BX	LR
; end of _CAN_Sleep
_CAN_WakeUp:
;stm32f4xx_can.c,979 :: 		uint8_t CAN_WakeUp(CAN_TypeDef* CANx)
; CANx start address is: 0 (R0)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
;stm32f4xx_can.c,981 :: 		uint32_t wait_slak = SLAK_TIMEOUT;
; wait_slak start address is: 12 (R3)
MOVW	R3, #65535
MOVT	R3, #0
;stm32f4xx_can.c,982 :: 		uint8_t wakeupstatus = CAN_WakeUp_Failed;
; wakeupstatus start address is: 16 (R4)
MOVS	R4, #0
;stm32f4xx_can.c,988 :: 		CANx->MCR &= ~(uint32_t)CAN_MCR_SLEEP;
LDR	R2, [R0, #0]
MVN	R1, #2
AND	R1, R2, R1, LSL #0
STR	R1, [R0, #0]
; wakeupstatus end address is: 16 (R4)
; CANx end address is: 0 (R0)
; wait_slak end address is: 12 (R3)
UXTB	R2, R4
;stm32f4xx_can.c,991 :: 		while(((CANx->MSR & CAN_MSR_SLAK) == CAN_MSR_SLAK)&&(wait_slak!=0x00))
L_CAN_WakeUp130:
; wakeupstatus start address is: 8 (R2)
; wait_slak start address is: 12 (R3)
; CANx start address is: 0 (R0)
ADDS	R1, R0, #4
LDR	R1, [R1, #0]
AND	R1, R1, #2
CMP	R1, #2
IT	NE
BNE	L__CAN_WakeUp224
CMP	R3, #0
IT	EQ
BEQ	L__CAN_WakeUp223
L__CAN_WakeUp222:
;stm32f4xx_can.c,993 :: 		wait_slak--;
SUBS	R3, R3, #1
;stm32f4xx_can.c,994 :: 		}
; wait_slak end address is: 12 (R3)
IT	AL
BAL	L_CAN_WakeUp130
;stm32f4xx_can.c,991 :: 		while(((CANx->MSR & CAN_MSR_SLAK) == CAN_MSR_SLAK)&&(wait_slak!=0x00))
L__CAN_WakeUp224:
L__CAN_WakeUp223:
;stm32f4xx_can.c,995 :: 		if((CANx->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
ADDS	R1, R0, #4
; CANx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #2
CMP	R1, #2
IT	EQ
BEQ	L__CAN_WakeUp225
; wakeupstatus end address is: 8 (R2)
;stm32f4xx_can.c,998 :: 		wakeupstatus = CAN_WakeUp_Ok;
; wakeupstatus start address is: 0 (R0)
MOVS	R0, #1
; wakeupstatus end address is: 0 (R0)
;stm32f4xx_can.c,999 :: 		}
IT	AL
BAL	L_CAN_WakeUp134
L__CAN_WakeUp225:
;stm32f4xx_can.c,995 :: 		if((CANx->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
UXTB	R0, R2
;stm32f4xx_can.c,999 :: 		}
L_CAN_WakeUp134:
;stm32f4xx_can.c,1001 :: 		return (uint8_t)wakeupstatus;
; wakeupstatus start address is: 0 (R0)
; wakeupstatus end address is: 0 (R0)
;stm32f4xx_can.c,1002 :: 		}
L_end_CAN_WakeUp:
BX	LR
; end of _CAN_WakeUp
_CAN_GetLastErrorCode:
;stm32f4xx_can.c,1041 :: 		uint8_t CAN_GetLastErrorCode(CAN_TypeDef* CANx)
; CANx start address is: 0 (R0)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
;stm32f4xx_can.c,1043 :: 		uint8_t errorcode=0;
;stm32f4xx_can.c,1049 :: 		errorcode = (((uint8_t)CANx->ESR) & (uint8_t)CAN_ESR_LEC);
ADDW	R1, R0, #24
; CANx end address is: 0 (R0)
LDR	R1, [R1, #0]
UXTB	R1, R1
AND	R1, R1, #112
;stm32f4xx_can.c,1052 :: 		return errorcode;
UXTB	R0, R1
;stm32f4xx_can.c,1053 :: 		}
L_end_CAN_GetLastErrorCode:
BX	LR
; end of _CAN_GetLastErrorCode
_CAN_GetReceiveErrorCounter:
;stm32f4xx_can.c,1066 :: 		uint8_t CAN_GetReceiveErrorCounter(CAN_TypeDef* CANx)
; CANx start address is: 0 (R0)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
;stm32f4xx_can.c,1068 :: 		uint8_t counter=0;
;stm32f4xx_can.c,1074 :: 		counter = (uint8_t)((CANx->ESR & CAN_ESR_REC)>> 24);
ADDW	R1, R0, #24
; CANx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #-16777216
LSRS	R1, R1, #24
;stm32f4xx_can.c,1077 :: 		return counter;
UXTB	R0, R1
;stm32f4xx_can.c,1078 :: 		}
L_end_CAN_GetReceiveErrorCounter:
BX	LR
; end of _CAN_GetReceiveErrorCounter
_CAN_GetLSBTransmitErrorCounter:
;stm32f4xx_can.c,1086 :: 		uint8_t CAN_GetLSBTransmitErrorCounter(CAN_TypeDef* CANx)
; CANx start address is: 0 (R0)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
;stm32f4xx_can.c,1088 :: 		uint8_t counter=0;
;stm32f4xx_can.c,1094 :: 		counter = (uint8_t)((CANx->ESR & CAN_ESR_TEC)>> 16);
ADDW	R1, R0, #24
; CANx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #16711680
LSRS	R1, R1, #16
;stm32f4xx_can.c,1097 :: 		return counter;
UXTB	R0, R1
;stm32f4xx_can.c,1098 :: 		}
L_end_CAN_GetLSBTransmitErrorCounter:
BX	LR
; end of _CAN_GetLSBTransmitErrorCounter
_CAN_ITConfig:
;stm32f4xx_can.c,1293 :: 		void CAN_ITConfig(CAN_TypeDef* CANx, uint32_t CAN_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; CAN_IT start address is: 4 (R1)
; CANx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; CAN_IT end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; CAN_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f4xx_can.c,1300 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_CAN_ITConfig135
; NewState end address is: 8 (R2)
;stm32f4xx_can.c,1303 :: 		CANx->IER |= CAN_IT;
ADDW	R4, R0, #20
; CANx end address is: 0 (R0)
LDR	R3, [R4, #0]
ORRS	R3, R1
; CAN_IT end address is: 4 (R1)
STR	R3, [R4, #0]
;stm32f4xx_can.c,1304 :: 		}
IT	AL
BAL	L_CAN_ITConfig136
L_CAN_ITConfig135:
;stm32f4xx_can.c,1308 :: 		CANx->IER &= ~CAN_IT;
; CAN_IT start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDW	R5, R0, #20
; CANx end address is: 0 (R0)
MVN	R4, R1
; CAN_IT end address is: 4 (R1)
LDR	R3, [R5, #0]
ANDS	R3, R4
STR	R3, [R5, #0]
;stm32f4xx_can.c,1309 :: 		}
L_CAN_ITConfig136:
;stm32f4xx_can.c,1310 :: 		}
L_end_CAN_ITConfig:
BX	LR
; end of _CAN_ITConfig
_CAN_GetFlagStatus:
;stm32f4xx_can.c,1333 :: 		FlagStatus CAN_GetFlagStatus(CAN_TypeDef* CANx, uint32_t CAN_FLAG)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
; CAN_FLAG end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; CAN_FLAG start address is: 4 (R1)
;stm32f4xx_can.c,1335 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_can.c,1342 :: 		if((CAN_FLAG & CAN_FLAGS_ESR) != (uint32_t)RESET)
AND	R2, R1, #15728640
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus137
;stm32f4xx_can.c,1345 :: 		if ((CANx->ESR & (CAN_FLAG & 0x000FFFFF)) != (uint32_t)RESET)
ADDW	R2, R0, #24
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #65535
MOVT	R2, #15
AND	R2, R1, R2, LSL #0
; CAN_FLAG end address is: 4 (R1)
AND	R2, R3, R2, LSL #0
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus138
;stm32f4xx_can.c,1348 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_can.c,1349 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus139
L_CAN_GetFlagStatus138:
;stm32f4xx_can.c,1353 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_can.c,1354 :: 		}
L_CAN_GetFlagStatus139:
;stm32f4xx_can.c,1355 :: 		}
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus140
L_CAN_GetFlagStatus137:
;stm32f4xx_can.c,1356 :: 		else if((CAN_FLAG & CAN_FLAGS_MSR) != (uint32_t)RESET)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
AND	R2, R1, #16777216
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus141
;stm32f4xx_can.c,1359 :: 		if ((CANx->MSR & (CAN_FLAG & 0x000FFFFF)) != (uint32_t)RESET)
ADDS	R2, R0, #4
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #65535
MOVT	R2, #15
AND	R2, R1, R2, LSL #0
; CAN_FLAG end address is: 4 (R1)
AND	R2, R3, R2, LSL #0
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus142
;stm32f4xx_can.c,1362 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_can.c,1363 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus143
L_CAN_GetFlagStatus142:
;stm32f4xx_can.c,1367 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_can.c,1368 :: 		}
L_CAN_GetFlagStatus143:
;stm32f4xx_can.c,1369 :: 		}
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus144
L_CAN_GetFlagStatus141:
;stm32f4xx_can.c,1370 :: 		else if((CAN_FLAG & CAN_FLAGS_TSR) != (uint32_t)RESET)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
AND	R2, R1, #134217728
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus145
;stm32f4xx_can.c,1373 :: 		if ((CANx->TSR & (CAN_FLAG & 0x000FFFFF)) != (uint32_t)RESET)
ADDW	R2, R0, #8
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #65535
MOVT	R2, #15
AND	R2, R1, R2, LSL #0
; CAN_FLAG end address is: 4 (R1)
AND	R2, R3, R2, LSL #0
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus146
;stm32f4xx_can.c,1376 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_can.c,1377 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus147
L_CAN_GetFlagStatus146:
;stm32f4xx_can.c,1381 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_can.c,1382 :: 		}
L_CAN_GetFlagStatus147:
;stm32f4xx_can.c,1383 :: 		}
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus148
L_CAN_GetFlagStatus145:
;stm32f4xx_can.c,1384 :: 		else if((CAN_FLAG & CAN_FLAGS_RF0R) != (uint32_t)RESET)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
AND	R2, R1, #33554432
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus149
;stm32f4xx_can.c,1387 :: 		if ((CANx->RF0R & (CAN_FLAG & 0x000FFFFF)) != (uint32_t)RESET)
ADDW	R2, R0, #12
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #65535
MOVT	R2, #15
AND	R2, R1, R2, LSL #0
; CAN_FLAG end address is: 4 (R1)
AND	R2, R3, R2, LSL #0
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus150
;stm32f4xx_can.c,1390 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_can.c,1391 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus151
L_CAN_GetFlagStatus150:
;stm32f4xx_can.c,1395 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_can.c,1396 :: 		}
L_CAN_GetFlagStatus151:
;stm32f4xx_can.c,1397 :: 		}
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus152
L_CAN_GetFlagStatus149:
;stm32f4xx_can.c,1401 :: 		if ((uint32_t)(CANx->RF1R & (CAN_FLAG & 0x000FFFFF)) != (uint32_t)RESET)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
ADDW	R2, R0, #16
; CANx end address is: 0 (R0)
LDR	R3, [R2, #0]
MOVW	R2, #65535
MOVT	R2, #15
AND	R2, R1, R2, LSL #0
; CAN_FLAG end address is: 4 (R1)
AND	R2, R3, R2, LSL #0
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetFlagStatus153
;stm32f4xx_can.c,1404 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_can.c,1405 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetFlagStatus154
L_CAN_GetFlagStatus153:
;stm32f4xx_can.c,1409 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_can.c,1410 :: 		}
L_CAN_GetFlagStatus154:
;stm32f4xx_can.c,1411 :: 		}
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
L_CAN_GetFlagStatus152:
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
L_CAN_GetFlagStatus148:
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
L_CAN_GetFlagStatus144:
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
L_CAN_GetFlagStatus140:
;stm32f4xx_can.c,1413 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_can.c,1414 :: 		}
L_end_CAN_GetFlagStatus:
BX	LR
; end of _CAN_GetFlagStatus
_CAN_ClearFlag:
;stm32f4xx_can.c,1433 :: 		void CAN_ClearFlag(CAN_TypeDef* CANx, uint32_t CAN_FLAG)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
; CAN_FLAG end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; CAN_FLAG start address is: 4 (R1)
;stm32f4xx_can.c,1435 :: 		uint32_t flagtmp=0;
;stm32f4xx_can.c,1440 :: 		if (CAN_FLAG == CAN_FLAG_LEC) /* ESR register */
MOVW	R2, #112
MOVT	R2, #12528
CMP	R1, R2
IT	NE
BNE	L_CAN_ClearFlag155
; CAN_FLAG end address is: 4 (R1)
;stm32f4xx_can.c,1443 :: 		CANx->ESR = (uint32_t)RESET;
ADDW	R3, R0, #24
; CANx end address is: 0 (R0)
MOV	R2, #0
STR	R2, [R3, #0]
;stm32f4xx_can.c,1444 :: 		}
IT	AL
BAL	L_CAN_ClearFlag156
L_CAN_ClearFlag155:
;stm32f4xx_can.c,1447 :: 		flagtmp = CAN_FLAG & 0x000FFFFF;
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
MOVW	R2, #65535
MOVT	R2, #15
AND	R2, R1, R2, LSL #0
; flagtmp start address is: 12 (R3)
MOV	R3, R2
;stm32f4xx_can.c,1449 :: 		if ((CAN_FLAG & CAN_FLAGS_RF0R)!=(uint32_t)RESET)
AND	R2, R1, #33554432
CMP	R2, #0
IT	EQ
BEQ	L_CAN_ClearFlag157
; CAN_FLAG end address is: 4 (R1)
;stm32f4xx_can.c,1452 :: 		CANx->RF0R = (uint32_t)(flagtmp);
ADDW	R2, R0, #12
; CANx end address is: 0 (R0)
STR	R3, [R2, #0]
; flagtmp end address is: 12 (R3)
;stm32f4xx_can.c,1453 :: 		}
IT	AL
BAL	L_CAN_ClearFlag158
L_CAN_ClearFlag157:
;stm32f4xx_can.c,1454 :: 		else if ((CAN_FLAG & CAN_FLAGS_RF1R)!=(uint32_t)RESET)
; flagtmp start address is: 12 (R3)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
AND	R2, R1, #67108864
CMP	R2, #0
IT	EQ
BEQ	L_CAN_ClearFlag159
; CAN_FLAG end address is: 4 (R1)
;stm32f4xx_can.c,1457 :: 		CANx->RF1R = (uint32_t)(flagtmp);
ADDW	R2, R0, #16
; CANx end address is: 0 (R0)
STR	R3, [R2, #0]
; flagtmp end address is: 12 (R3)
;stm32f4xx_can.c,1458 :: 		}
IT	AL
BAL	L_CAN_ClearFlag160
L_CAN_ClearFlag159:
;stm32f4xx_can.c,1459 :: 		else if ((CAN_FLAG & CAN_FLAGS_TSR)!=(uint32_t)RESET)
; flagtmp start address is: 12 (R3)
; CAN_FLAG start address is: 4 (R1)
; CANx start address is: 0 (R0)
AND	R2, R1, #134217728
; CAN_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_CAN_ClearFlag161
;stm32f4xx_can.c,1462 :: 		CANx->TSR = (uint32_t)(flagtmp);
ADDW	R2, R0, #8
; CANx end address is: 0 (R0)
STR	R3, [R2, #0]
; flagtmp end address is: 12 (R3)
;stm32f4xx_can.c,1463 :: 		}
IT	AL
BAL	L_CAN_ClearFlag162
L_CAN_ClearFlag161:
;stm32f4xx_can.c,1467 :: 		CANx->MSR = (uint32_t)(flagtmp);
; flagtmp start address is: 12 (R3)
; CANx start address is: 0 (R0)
ADDS	R2, R0, #4
; CANx end address is: 0 (R0)
STR	R3, [R2, #0]
; flagtmp end address is: 12 (R3)
;stm32f4xx_can.c,1468 :: 		}
L_CAN_ClearFlag162:
L_CAN_ClearFlag160:
L_CAN_ClearFlag158:
;stm32f4xx_can.c,1469 :: 		}
L_CAN_ClearFlag156:
;stm32f4xx_can.c,1470 :: 		}
L_end_CAN_ClearFlag:
BX	LR
; end of _CAN_ClearFlag
_CAN_GetITStatus:
;stm32f4xx_can.c,1493 :: 		ITStatus CAN_GetITStatus(CAN_TypeDef* CANx, uint32_t CAN_IT)
; CAN_IT start address is: 4 (R1)
; CANx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R3, R0
; CAN_IT end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 12 (R3)
; CAN_IT start address is: 4 (R1)
;stm32f4xx_can.c,1495 :: 		ITStatus itstatus = RESET;
;stm32f4xx_can.c,1501 :: 		if((CANx->IER & CAN_IT) != RESET)
ADDW	R2, R3, #20
LDR	R2, [R2, #0]
ANDS	R2, R1
CMP	R2, #0
IT	EQ
BEQ	L_CAN_GetITStatus163
;stm32f4xx_can.c,1504 :: 		switch (CAN_IT)
IT	AL
BAL	L_CAN_GetITStatus164
; CAN_IT end address is: 4 (R1)
;stm32f4xx_can.c,1506 :: 		case CAN_IT_TME:
L_CAN_GetITStatus166:
;stm32f4xx_can.c,1508 :: 		itstatus = CheckITStatus(CANx->TSR, CAN_TSR_RQCP0|CAN_TSR_RQCP1|CAN_TSR_RQCP2);
ADDW	R2, R3, #8
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVW	R1, #257
MOVT	R1, #1
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1509 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1510 :: 		case CAN_IT_FMP0:
L_CAN_GetITStatus167:
;stm32f4xx_can.c,1512 :: 		itstatus = CheckITStatus(CANx->RF0R, CAN_RF0R_FMP0);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #12
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVS	R1, #3
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1513 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1514 :: 		case CAN_IT_FF0:
L_CAN_GetITStatus168:
;stm32f4xx_can.c,1516 :: 		itstatus = CheckITStatus(CANx->RF0R, CAN_RF0R_FULL0);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #12
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVS	R1, #8
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1517 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1518 :: 		case CAN_IT_FOV0:
L_CAN_GetITStatus169:
;stm32f4xx_can.c,1520 :: 		itstatus = CheckITStatus(CANx->RF0R, CAN_RF0R_FOVR0);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #12
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVS	R1, #16
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1521 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1522 :: 		case CAN_IT_FMP1:
L_CAN_GetITStatus170:
;stm32f4xx_can.c,1524 :: 		itstatus = CheckITStatus(CANx->RF1R, CAN_RF1R_FMP1);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #16
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVS	R1, #3
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1525 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1526 :: 		case CAN_IT_FF1:
L_CAN_GetITStatus171:
;stm32f4xx_can.c,1528 :: 		itstatus = CheckITStatus(CANx->RF1R, CAN_RF1R_FULL1);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #16
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVS	R1, #8
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1529 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1530 :: 		case CAN_IT_FOV1:
L_CAN_GetITStatus172:
;stm32f4xx_can.c,1532 :: 		itstatus = CheckITStatus(CANx->RF1R, CAN_RF1R_FOVR1);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #16
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVS	R1, #16
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1533 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1534 :: 		case CAN_IT_WKU:
L_CAN_GetITStatus173:
;stm32f4xx_can.c,1536 :: 		itstatus = CheckITStatus(CANx->MSR, CAN_MSR_WKUI);
; CANx start address is: 12 (R3)
ADDS	R2, R3, #4
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVW	R1, #8
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1537 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1538 :: 		case CAN_IT_SLK:
L_CAN_GetITStatus174:
;stm32f4xx_can.c,1540 :: 		itstatus = CheckITStatus(CANx->MSR, CAN_MSR_SLAKI);
; CANx start address is: 12 (R3)
ADDS	R2, R3, #4
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVW	R1, #16
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1541 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1542 :: 		case CAN_IT_EWG:
L_CAN_GetITStatus175:
;stm32f4xx_can.c,1544 :: 		itstatus = CheckITStatus(CANx->ESR, CAN_ESR_EWGF);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #24
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOV	R1, #1
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1545 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1546 :: 		case CAN_IT_EPV:
L_CAN_GetITStatus176:
;stm32f4xx_can.c,1548 :: 		itstatus = CheckITStatus(CANx->ESR, CAN_ESR_EPVF);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #24
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOV	R1, #2
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1549 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1550 :: 		case CAN_IT_BOF:
L_CAN_GetITStatus177:
;stm32f4xx_can.c,1552 :: 		itstatus = CheckITStatus(CANx->ESR, CAN_ESR_BOFF);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #24
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOV	R1, #4
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1553 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1554 :: 		case CAN_IT_LEC:
L_CAN_GetITStatus178:
;stm32f4xx_can.c,1556 :: 		itstatus = CheckITStatus(CANx->ESR, CAN_ESR_LEC);
; CANx start address is: 12 (R3)
ADDW	R2, R3, #24
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOV	R1, #112
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1557 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1558 :: 		case CAN_IT_ERR:
L_CAN_GetITStatus179:
;stm32f4xx_can.c,1560 :: 		itstatus = CheckITStatus(CANx->MSR, CAN_MSR_ERRI);
; CANx start address is: 12 (R3)
ADDS	R2, R3, #4
; CANx end address is: 12 (R3)
LDR	R2, [R2, #0]
MOVW	R1, #4
MOV	R0, R2
BL	stm32f4xx_can_CheckITStatus+0
; itstatus start address is: 0 (R0)
;stm32f4xx_can.c,1561 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1562 :: 		default:
L_CAN_GetITStatus180:
;stm32f4xx_can.c,1564 :: 		itstatus = RESET;
; itstatus start address is: 0 (R0)
MOVS	R0, #0
;stm32f4xx_can.c,1565 :: 		break;
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus165
;stm32f4xx_can.c,1566 :: 		}
L_CAN_GetITStatus164:
; CAN_IT start address is: 4 (R1)
; CANx start address is: 12 (R3)
CMP	R1, #1
IT	EQ
BEQ	L_CAN_GetITStatus166
CMP	R1, #2
IT	EQ
BEQ	L_CAN_GetITStatus167
CMP	R1, #4
IT	EQ
BEQ	L_CAN_GetITStatus168
CMP	R1, #8
IT	EQ
BEQ	L_CAN_GetITStatus169
CMP	R1, #16
IT	EQ
BEQ	L_CAN_GetITStatus170
CMP	R1, #32
IT	EQ
BEQ	L_CAN_GetITStatus171
CMP	R1, #64
IT	EQ
BEQ	L_CAN_GetITStatus172
CMP	R1, #65536
IT	EQ
BEQ	L_CAN_GetITStatus173
CMP	R1, #131072
IT	EQ
BEQ	L_CAN_GetITStatus174
CMP	R1, #256
IT	EQ
BEQ	L_CAN_GetITStatus175
CMP	R1, #512
IT	EQ
BEQ	L_CAN_GetITStatus176
CMP	R1, #1024
IT	EQ
BEQ	L_CAN_GetITStatus177
CMP	R1, #2048
IT	EQ
BEQ	L_CAN_GetITStatus178
CMP	R1, #32768
IT	EQ
BEQ	L_CAN_GetITStatus179
; CANx end address is: 12 (R3)
; CAN_IT end address is: 4 (R1)
IT	AL
BAL	L_CAN_GetITStatus180
L_CAN_GetITStatus165:
;stm32f4xx_can.c,1567 :: 		}
; itstatus start address is: 0 (R0)
; itstatus end address is: 0 (R0)
IT	AL
BAL	L_CAN_GetITStatus181
L_CAN_GetITStatus163:
;stm32f4xx_can.c,1571 :: 		itstatus  = RESET;
; itstatus start address is: 0 (R0)
MOVS	R0, #0
; itstatus end address is: 0 (R0)
;stm32f4xx_can.c,1572 :: 		}
L_CAN_GetITStatus181:
;stm32f4xx_can.c,1575 :: 		return  itstatus;
; itstatus start address is: 0 (R0)
; itstatus end address is: 0 (R0)
;stm32f4xx_can.c,1576 :: 		}
L_end_CAN_GetITStatus:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _CAN_GetITStatus
_CAN_ClearITPendingBit:
;stm32f4xx_can.c,1597 :: 		void CAN_ClearITPendingBit(CAN_TypeDef* CANx, uint32_t CAN_IT)
; CAN_IT start address is: 4 (R1)
; CANx start address is: 0 (R0)
; CAN_IT end address is: 4 (R1)
; CANx end address is: 0 (R0)
; CANx start address is: 0 (R0)
; CAN_IT start address is: 4 (R1)
;stm32f4xx_can.c,1603 :: 		switch (CAN_IT)
IT	AL
BAL	L_CAN_ClearITPendingBit182
; CAN_IT end address is: 4 (R1)
;stm32f4xx_can.c,1605 :: 		case CAN_IT_TME:
L_CAN_ClearITPendingBit184:
;stm32f4xx_can.c,1607 :: 		CANx->TSR = CAN_TSR_RQCP0|CAN_TSR_RQCP1|CAN_TSR_RQCP2;
ADDW	R3, R0, #8
; CANx end address is: 0 (R0)
MOVW	R2, #257
MOVT	R2, #1
STR	R2, [R3, #0]
;stm32f4xx_can.c,1608 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1609 :: 		case CAN_IT_FF0:
L_CAN_ClearITPendingBit185:
;stm32f4xx_can.c,1611 :: 		CANx->RF0R = CAN_RF0R_FULL0;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #12
; CANx end address is: 0 (R0)
MOVS	R2, #8
STR	R2, [R3, #0]
;stm32f4xx_can.c,1612 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1613 :: 		case CAN_IT_FOV0:
L_CAN_ClearITPendingBit186:
;stm32f4xx_can.c,1615 :: 		CANx->RF0R = CAN_RF0R_FOVR0;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #12
; CANx end address is: 0 (R0)
MOVS	R2, #16
STR	R2, [R3, #0]
;stm32f4xx_can.c,1616 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1617 :: 		case CAN_IT_FF1:
L_CAN_ClearITPendingBit187:
;stm32f4xx_can.c,1619 :: 		CANx->RF1R = CAN_RF1R_FULL1;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #16
; CANx end address is: 0 (R0)
MOVS	R2, #8
STR	R2, [R3, #0]
;stm32f4xx_can.c,1620 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1621 :: 		case CAN_IT_FOV1:
L_CAN_ClearITPendingBit188:
;stm32f4xx_can.c,1623 :: 		CANx->RF1R = CAN_RF1R_FOVR1;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #16
; CANx end address is: 0 (R0)
MOVS	R2, #16
STR	R2, [R3, #0]
;stm32f4xx_can.c,1624 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1625 :: 		case CAN_IT_WKU:
L_CAN_ClearITPendingBit189:
;stm32f4xx_can.c,1627 :: 		CANx->MSR = CAN_MSR_WKUI;
; CANx start address is: 0 (R0)
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #8
STR	R2, [R3, #0]
;stm32f4xx_can.c,1628 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1629 :: 		case CAN_IT_SLK:
L_CAN_ClearITPendingBit190:
;stm32f4xx_can.c,1631 :: 		CANx->MSR = CAN_MSR_SLAKI;
; CANx start address is: 0 (R0)
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #16
STR	R2, [R3, #0]
;stm32f4xx_can.c,1632 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1633 :: 		case CAN_IT_EWG:
L_CAN_ClearITPendingBit191:
;stm32f4xx_can.c,1635 :: 		CANx->MSR = CAN_MSR_ERRI;
; CANx start address is: 0 (R0)
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #4
STR	R2, [R3, #0]
;stm32f4xx_can.c,1637 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1638 :: 		case CAN_IT_EPV:
L_CAN_ClearITPendingBit192:
;stm32f4xx_can.c,1640 :: 		CANx->MSR = CAN_MSR_ERRI;
; CANx start address is: 0 (R0)
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #4
STR	R2, [R3, #0]
;stm32f4xx_can.c,1642 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1643 :: 		case CAN_IT_BOF:
L_CAN_ClearITPendingBit193:
;stm32f4xx_can.c,1645 :: 		CANx->MSR = CAN_MSR_ERRI;
; CANx start address is: 0 (R0)
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #4
STR	R2, [R3, #0]
;stm32f4xx_can.c,1647 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1648 :: 		case CAN_IT_LEC:
L_CAN_ClearITPendingBit194:
;stm32f4xx_can.c,1650 :: 		CANx->ESR = RESET;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #24
MOVS	R2, #0
STR	R2, [R3, #0]
;stm32f4xx_can.c,1652 :: 		CANx->MSR = CAN_MSR_ERRI;
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #4
STR	R2, [R3, #0]
;stm32f4xx_can.c,1653 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1654 :: 		case CAN_IT_ERR:
L_CAN_ClearITPendingBit195:
;stm32f4xx_can.c,1656 :: 		CANx->ESR = RESET;
; CANx start address is: 0 (R0)
ADDW	R3, R0, #24
MOVS	R2, #0
STR	R2, [R3, #0]
;stm32f4xx_can.c,1658 :: 		CANx->MSR = CAN_MSR_ERRI;
ADDS	R3, R0, #4
; CANx end address is: 0 (R0)
MOVW	R2, #4
STR	R2, [R3, #0]
;stm32f4xx_can.c,1660 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1661 :: 		default:
L_CAN_ClearITPendingBit196:
;stm32f4xx_can.c,1662 :: 		break;
IT	AL
BAL	L_CAN_ClearITPendingBit183
;stm32f4xx_can.c,1663 :: 		}
L_CAN_ClearITPendingBit182:
; CAN_IT start address is: 4 (R1)
; CANx start address is: 0 (R0)
CMP	R1, #1
IT	EQ
BEQ	L_CAN_ClearITPendingBit184
CMP	R1, #4
IT	EQ
BEQ	L_CAN_ClearITPendingBit185
CMP	R1, #8
IT	EQ
BEQ	L_CAN_ClearITPendingBit186
CMP	R1, #32
IT	EQ
BEQ	L_CAN_ClearITPendingBit187
CMP	R1, #64
IT	EQ
BEQ	L_CAN_ClearITPendingBit188
CMP	R1, #65536
IT	EQ
BEQ	L_CAN_ClearITPendingBit189
CMP	R1, #131072
IT	EQ
BEQ	L_CAN_ClearITPendingBit190
CMP	R1, #256
IT	EQ
BEQ	L_CAN_ClearITPendingBit191
CMP	R1, #512
IT	EQ
BEQ	L_CAN_ClearITPendingBit192
CMP	R1, #1024
IT	EQ
BEQ	L_CAN_ClearITPendingBit193
CMP	R1, #2048
IT	EQ
BEQ	L_CAN_ClearITPendingBit194
CMP	R1, #32768
IT	EQ
BEQ	L_CAN_ClearITPendingBit195
; CANx end address is: 0 (R0)
; CAN_IT end address is: 4 (R1)
IT	AL
BAL	L_CAN_ClearITPendingBit196
L_CAN_ClearITPendingBit183:
;stm32f4xx_can.c,1664 :: 		}
L_end_CAN_ClearITPendingBit:
BX	LR
; end of _CAN_ClearITPendingBit
stm32f4xx_can_CheckITStatus:
;stm32f4xx_can.c,1675 :: 		static ITStatus CheckITStatus(uint32_t CAN_Reg, uint32_t It_Bit)
; It_Bit start address is: 4 (R1)
; CAN_Reg start address is: 0 (R0)
; It_Bit end address is: 4 (R1)
; CAN_Reg end address is: 0 (R0)
; CAN_Reg start address is: 0 (R0)
; It_Bit start address is: 4 (R1)
;stm32f4xx_can.c,1677 :: 		ITStatus pendingbitstatus = RESET;
;stm32f4xx_can.c,1679 :: 		if ((CAN_Reg & It_Bit) != (uint32_t)RESET)
AND	R2, R0, R1, LSL #0
; CAN_Reg end address is: 0 (R0)
; It_Bit end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_stm32f4xx_can_CheckITStatus197
;stm32f4xx_can.c,1682 :: 		pendingbitstatus = SET;
; pendingbitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_can.c,1683 :: 		}
; pendingbitstatus end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_can_CheckITStatus198
L_stm32f4xx_can_CheckITStatus197:
;stm32f4xx_can.c,1687 :: 		pendingbitstatus = RESET;
; pendingbitstatus start address is: 0 (R0)
MOVS	R0, #0
; pendingbitstatus end address is: 0 (R0)
;stm32f4xx_can.c,1688 :: 		}
L_stm32f4xx_can_CheckITStatus198:
;stm32f4xx_can.c,1689 :: 		return pendingbitstatus;
; pendingbitstatus start address is: 0 (R0)
; pendingbitstatus end address is: 0 (R0)
;stm32f4xx_can.c,1690 :: 		}
L_end_CheckITStatus:
BX	LR
; end of stm32f4xx_can_CheckITStatus
