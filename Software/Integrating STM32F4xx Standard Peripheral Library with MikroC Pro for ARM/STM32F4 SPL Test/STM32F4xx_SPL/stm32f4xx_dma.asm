stm32f4xx_dma___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_dma___DSB
stm32f4xx_dma___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_dma___WFI
stm32f4xx_dma___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_dma___WFE
stm32f4xx_dma___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_dma___REV
stm32f4xx_dma_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_dma_NVIC_SetPriorityGrouping
stm32f4xx_dma_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_dma_NVIC_GetPriorityGrouping
stm32f4xx_dma_NVIC_EnableIRQ:
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
; end of stm32f4xx_dma_NVIC_EnableIRQ
stm32f4xx_dma_NVIC_DisableIRQ:
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
; end of stm32f4xx_dma_NVIC_DisableIRQ
stm32f4xx_dma_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_dma_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_dma_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_dma_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_dma_NVIC_GetPendingIRQ1
L_stm32f4xx_dma_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_dma_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_dma_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_dma_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_dma_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_dma_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_dma_NVIC_GetPendingIRQ
stm32f4xx_dma_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_dma_NVIC_SetPendingIRQ
stm32f4xx_dma_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_dma_NVIC_ClearPendingIRQ
stm32f4xx_dma_NVIC_GetActive:
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
BEQ	L_stm32f4xx_dma_NVIC_GetActive2
; ?FLOC__stm32f4xx_dma_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_dma_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_dma_NVIC_GetActive3
L_stm32f4xx_dma_NVIC_GetActive2:
; ?FLOC__stm32f4xx_dma_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_dma_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_dma_NVIC_GetActive3:
; ?FLOC__stm32f4xx_dma_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_dma_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_dma_NVIC_GetActive
stm32f4xx_dma_NVIC_SetPriority:
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
BGE	L_stm32f4xx_dma_NVIC_SetPriority4
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
BAL	L_stm32f4xx_dma_NVIC_SetPriority5
L_stm32f4xx_dma_NVIC_SetPriority4:
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
L_stm32f4xx_dma_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_dma_NVIC_SetPriority
stm32f4xx_dma_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_dma_NVIC_GetPriority6
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
L_stm32f4xx_dma_NVIC_GetPriority6:
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
; end of stm32f4xx_dma_NVIC_GetPriority
stm32f4xx_dma_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_dma_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_dma_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_dma_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_dma_NVIC_EncodePriority9
L_stm32f4xx_dma_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_dma_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_dma_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_dma_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_dma_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_dma_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_dma_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_dma_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_dma_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_dma_NVIC_EncodePriority11
L_stm32f4xx_dma_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_dma_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_dma_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_dma_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_dma_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_dma_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_dma_NVIC_EncodePriority
stm32f4xx_dma_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_dma_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_dma_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_dma_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_dma_NVIC_DecodePriority13
L_stm32f4xx_dma_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_dma_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_dma_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_dma_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_dma_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_dma_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_dma_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_dma_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_dma_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_dma_NVIC_DecodePriority15
L_stm32f4xx_dma_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_dma_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_dma_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_dma_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_dma_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_dma_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_dma_NVIC_DecodePriority
stm32f4xx_dma_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_dma___DSB+0
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
BL	stm32f4xx_dma___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_dma_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_dma_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_dma_NVIC_SystemReset
stm32f4xx_dma_SysTick_Config:
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
BLS	L_stm32f4xx_dma_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_dma_SysTick_Config18:
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
BL	stm32f4xx_dma_NVIC_SetPriority+0
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
; end of stm32f4xx_dma_SysTick_Config
stm32f4xx_dma_ITM_SendChar:
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
BEQ	L_stm32f4xx_dma_ITM_SendChar108
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_dma_ITM_SendChar109
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_dma_ITM_SendChar110
L_stm32f4xx_dma_ITM_SendChar104:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_dma_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_dma_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_dma_ITM_SendChar22
L_stm32f4xx_dma_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_dma_ITM_SendChar107
L_stm32f4xx_dma_ITM_SendChar108:
L_stm32f4xx_dma_ITM_SendChar107:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_dma_ITM_SendChar106
L_stm32f4xx_dma_ITM_SendChar109:
L_stm32f4xx_dma_ITM_SendChar106:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_dma_ITM_SendChar105
L_stm32f4xx_dma_ITM_SendChar110:
L_stm32f4xx_dma_ITM_SendChar105:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_dma_ITM_SendChar
stm32f4xx_dma_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_dma_ITM_ReceiveChar24
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
L_stm32f4xx_dma_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_dma_ITM_ReceiveChar
stm32f4xx_dma_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_dma_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_dma_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_dma_ITM_CheckChar
_DMA_DeInit:
;stm32f4xx_dma.c,194 :: 		void DMA_DeInit(DMA_Stream_TypeDef* DMAy_Streamx)
; DMAy_Streamx start address is: 0 (R0)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
;stm32f4xx_dma.c,200 :: 		DMAy_Streamx->CR &= ~((uint32_t)DMA_SxCR_EN);
LDR	R2, [R0, #0]
MVN	R1, #1
AND	R1, R2, R1, LSL #0
STR	R1, [R0, #0]
;stm32f4xx_dma.c,203 :: 		DMAy_Streamx->CR  = 0;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_dma.c,206 :: 		DMAy_Streamx->NDTR = 0;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,209 :: 		DMAy_Streamx->PAR  = 0;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,212 :: 		DMAy_Streamx->M0AR = 0;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,215 :: 		DMAy_Streamx->M1AR = 0;
ADDW	R2, R0, #16
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,218 :: 		DMAy_Streamx->FCR = (uint32_t)0x00000021;
ADDW	R2, R0, #20
MOV	R1, #33
STR	R1, [R2, #0]
;stm32f4xx_dma.c,221 :: 		if (DMAy_Streamx == DMA1_Stream0)
MOVW	R1, #24592
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit27
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,224 :: 		DMA1->LIFCR = DMA_Stream0_IT_MASK;
MOV	R2, #61
MOVW	R1, #24584
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,225 :: 		}
IT	AL
BAL	L_DMA_DeInit28
L_DMA_DeInit27:
;stm32f4xx_dma.c,226 :: 		else if (DMAy_Streamx == DMA1_Stream1)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #24616
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit29
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,229 :: 		DMA1->LIFCR = DMA_Stream1_IT_MASK;
MOV	R2, #3904
MOVW	R1, #24584
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,230 :: 		}
IT	AL
BAL	L_DMA_DeInit30
L_DMA_DeInit29:
;stm32f4xx_dma.c,231 :: 		else if (DMAy_Streamx == DMA1_Stream2)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #24640
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit31
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,234 :: 		DMA1->LIFCR = DMA_Stream2_IT_MASK;
MOV	R2, #3997696
MOVW	R1, #24584
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,235 :: 		}
IT	AL
BAL	L_DMA_DeInit32
L_DMA_DeInit31:
;stm32f4xx_dma.c,236 :: 		else if (DMAy_Streamx == DMA1_Stream3)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #24664
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit33
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,239 :: 		DMA1->LIFCR = DMA_Stream3_IT_MASK;
MOV	R2, #255852544
MOVW	R1, #24584
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,240 :: 		}
IT	AL
BAL	L_DMA_DeInit34
L_DMA_DeInit33:
;stm32f4xx_dma.c,241 :: 		else if (DMAy_Streamx == DMA1_Stream4)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #24688
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit35
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,244 :: 		DMA1->HIFCR = DMA_Stream4_IT_MASK;
MOVW	R2, #61
MOVT	R2, #8192
MOVW	R1, #24588
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,245 :: 		}
IT	AL
BAL	L_DMA_DeInit36
L_DMA_DeInit35:
;stm32f4xx_dma.c,246 :: 		else if (DMAy_Streamx == DMA1_Stream5)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #24712
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit37
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,249 :: 		DMA1->HIFCR = DMA_Stream5_IT_MASK;
MOVW	R2, #3904
MOVT	R2, #8192
MOVW	R1, #24588
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,250 :: 		}
IT	AL
BAL	L_DMA_DeInit38
L_DMA_DeInit37:
;stm32f4xx_dma.c,251 :: 		else if (DMAy_Streamx == DMA1_Stream6)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #24736
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit39
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,254 :: 		DMA1->HIFCR = (uint32_t)DMA_Stream6_IT_MASK;
MOVW	R2, #0
MOVT	R2, #8253
MOVW	R1, #24588
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,255 :: 		}
IT	AL
BAL	L_DMA_DeInit40
L_DMA_DeInit39:
;stm32f4xx_dma.c,256 :: 		else if (DMAy_Streamx == DMA1_Stream7)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #24760
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit41
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,259 :: 		DMA1->HIFCR = DMA_Stream7_IT_MASK;
MOV	R2, #792723456
MOVW	R1, #24588
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,260 :: 		}
IT	AL
BAL	L_DMA_DeInit42
L_DMA_DeInit41:
;stm32f4xx_dma.c,261 :: 		else if (DMAy_Streamx == DMA2_Stream0)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #25616
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit43
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,264 :: 		DMA2->LIFCR = DMA_Stream0_IT_MASK;
MOV	R2, #61
MOVW	R1, #25608
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,265 :: 		}
IT	AL
BAL	L_DMA_DeInit44
L_DMA_DeInit43:
;stm32f4xx_dma.c,266 :: 		else if (DMAy_Streamx == DMA2_Stream1)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #25640
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit45
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,269 :: 		DMA2->LIFCR = DMA_Stream1_IT_MASK;
MOV	R2, #3904
MOVW	R1, #25608
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,270 :: 		}
IT	AL
BAL	L_DMA_DeInit46
L_DMA_DeInit45:
;stm32f4xx_dma.c,271 :: 		else if (DMAy_Streamx == DMA2_Stream2)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #25664
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit47
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,274 :: 		DMA2->LIFCR = DMA_Stream2_IT_MASK;
MOV	R2, #3997696
MOVW	R1, #25608
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,275 :: 		}
IT	AL
BAL	L_DMA_DeInit48
L_DMA_DeInit47:
;stm32f4xx_dma.c,276 :: 		else if (DMAy_Streamx == DMA2_Stream3)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #25688
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit49
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,279 :: 		DMA2->LIFCR = DMA_Stream3_IT_MASK;
MOV	R2, #255852544
MOVW	R1, #25608
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,280 :: 		}
IT	AL
BAL	L_DMA_DeInit50
L_DMA_DeInit49:
;stm32f4xx_dma.c,281 :: 		else if (DMAy_Streamx == DMA2_Stream4)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #25712
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit51
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,284 :: 		DMA2->HIFCR = DMA_Stream4_IT_MASK;
MOVW	R2, #61
MOVT	R2, #8192
MOVW	R1, #25612
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,285 :: 		}
IT	AL
BAL	L_DMA_DeInit52
L_DMA_DeInit51:
;stm32f4xx_dma.c,286 :: 		else if (DMAy_Streamx == DMA2_Stream5)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #25736
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit53
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,289 :: 		DMA2->HIFCR = DMA_Stream5_IT_MASK;
MOVW	R2, #3904
MOVT	R2, #8192
MOVW	R1, #25612
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,290 :: 		}
IT	AL
BAL	L_DMA_DeInit54
L_DMA_DeInit53:
;stm32f4xx_dma.c,291 :: 		else if (DMAy_Streamx == DMA2_Stream6)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #25760
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit55
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,294 :: 		DMA2->HIFCR = DMA_Stream6_IT_MASK;
MOVW	R2, #0
MOVT	R2, #8253
MOVW	R1, #25612
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,295 :: 		}
IT	AL
BAL	L_DMA_DeInit56
L_DMA_DeInit55:
;stm32f4xx_dma.c,298 :: 		if (DMAy_Streamx == DMA2_Stream7)
; DMAy_Streamx start address is: 0 (R0)
MOVW	R1, #25784
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_DMA_DeInit57
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,301 :: 		DMA2->HIFCR = DMA_Stream7_IT_MASK;
MOV	R2, #792723456
MOVW	R1, #25612
MOVT	R1, #16386
STR	R2, [R1, #0]
;stm32f4xx_dma.c,302 :: 		}
L_DMA_DeInit57:
;stm32f4xx_dma.c,303 :: 		}
L_DMA_DeInit56:
L_DMA_DeInit54:
L_DMA_DeInit52:
L_DMA_DeInit50:
L_DMA_DeInit48:
L_DMA_DeInit46:
L_DMA_DeInit44:
L_DMA_DeInit42:
L_DMA_DeInit40:
L_DMA_DeInit38:
L_DMA_DeInit36:
L_DMA_DeInit34:
L_DMA_DeInit32:
L_DMA_DeInit30:
L_DMA_DeInit28:
;stm32f4xx_dma.c,304 :: 		}
L_end_DMA_DeInit:
BX	LR
; end of _DMA_DeInit
_DMA_Init:
;stm32f4xx_dma.c,317 :: 		void DMA_Init(DMA_Stream_TypeDef* DMAy_Streamx, DMA_InitTypeDef* DMA_InitStruct)
; DMA_InitStruct start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
; DMA_InitStruct end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
; DMA_InitStruct start address is: 4 (R1)
;stm32f4xx_dma.c,319 :: 		uint32_t tmpreg = 0;
;stm32f4xx_dma.c,339 :: 		tmpreg = DMAy_Streamx->CR;
LDR	R3, [R0, #0]
;stm32f4xx_dma.c,345 :: 		DMA_SxCR_DIR));
MOVW	R2, #32831
MOVT	R2, #61468
AND	R4, R3, R2, LSL #0
;stm32f4xx_dma.c,358 :: 		tmpreg |= DMA_InitStruct->DMA_Channel | DMA_InitStruct->DMA_DIR |
LDR	R3, [R1, #0]
ADDW	R2, R1, #12
LDR	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_dma.c,359 :: 		DMA_InitStruct->DMA_PeripheralInc | DMA_InitStruct->DMA_MemoryInc |
ADDW	R2, R1, #20
LDR	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #24
LDR	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_dma.c,360 :: 		DMA_InitStruct->DMA_PeripheralDataSize | DMA_InitStruct->DMA_MemoryDataSize |
ADDW	R2, R1, #28
LDR	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #32
LDR	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_dma.c,361 :: 		DMA_InitStruct->DMA_Mode | DMA_InitStruct->DMA_Priority |
ADDW	R2, R1, #36
LDR	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #40
LDR	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_dma.c,362 :: 		DMA_InitStruct->DMA_MemoryBurst | DMA_InitStruct->DMA_PeripheralBurst;
ADDW	R2, R1, #52
LDR	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #56
LDR	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
ORR	R2, R4, R2, LSL #0
;stm32f4xx_dma.c,365 :: 		DMAy_Streamx->CR = tmpreg;
STR	R2, [R0, #0]
;stm32f4xx_dma.c,369 :: 		tmpreg = DMAy_Streamx->FCR;
ADDW	R5, R0, #20
LDR	R3, [R5, #0]
;stm32f4xx_dma.c,372 :: 		tmpreg &= (uint32_t)~(DMA_SxFCR_DMDIS | DMA_SxFCR_FTH);
MVN	R2, #7
AND	R4, R3, R2, LSL #0
;stm32f4xx_dma.c,377 :: 		tmpreg |= DMA_InitStruct->DMA_FIFOMode | DMA_InitStruct->DMA_FIFOThreshold;
ADDW	R2, R1, #44
LDR	R3, [R2, #0]
ADDW	R2, R1, #48
LDR	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
ORR	R2, R4, R2, LSL #0
;stm32f4xx_dma.c,380 :: 		DMAy_Streamx->FCR = tmpreg;
STR	R2, [R5, #0]
;stm32f4xx_dma.c,384 :: 		DMAy_Streamx->NDTR = DMA_InitStruct->DMA_BufferSize;
ADDS	R3, R0, #4
ADDW	R2, R1, #16
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_dma.c,388 :: 		DMAy_Streamx->PAR = DMA_InitStruct->DMA_PeripheralBaseAddr;
ADDW	R3, R0, #8
ADDS	R2, R1, #4
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_dma.c,392 :: 		DMAy_Streamx->M0AR = DMA_InitStruct->DMA_Memory0BaseAddr;
ADDW	R3, R0, #12
; DMAy_Streamx end address is: 0 (R0)
ADDW	R2, R1, #8
; DMA_InitStruct end address is: 4 (R1)
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_dma.c,393 :: 		}
L_end_DMA_Init:
BX	LR
; end of _DMA_Init
_DMA_StructInit:
;stm32f4xx_dma.c,401 :: 		void DMA_StructInit(DMA_InitTypeDef* DMA_InitStruct)
; DMA_InitStruct start address is: 0 (R0)
; DMA_InitStruct end address is: 0 (R0)
; DMA_InitStruct start address is: 0 (R0)
;stm32f4xx_dma.c,405 :: 		DMA_InitStruct->DMA_Channel = 0;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_dma.c,408 :: 		DMA_InitStruct->DMA_PeripheralBaseAddr = 0;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,411 :: 		DMA_InitStruct->DMA_Memory0BaseAddr = 0;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,414 :: 		DMA_InitStruct->DMA_DIR = DMA_DIR_PeripheralToMemory;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,417 :: 		DMA_InitStruct->DMA_BufferSize = 0;
ADDW	R2, R0, #16
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,420 :: 		DMA_InitStruct->DMA_PeripheralInc = DMA_PeripheralInc_Disable;
ADDW	R2, R0, #20
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,423 :: 		DMA_InitStruct->DMA_MemoryInc = DMA_MemoryInc_Disable;
ADDW	R2, R0, #24
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,426 :: 		DMA_InitStruct->DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
ADDW	R2, R0, #28
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,429 :: 		DMA_InitStruct->DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
ADDW	R2, R0, #32
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,432 :: 		DMA_InitStruct->DMA_Mode = DMA_Mode_Normal;
ADDW	R2, R0, #36
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,435 :: 		DMA_InitStruct->DMA_Priority = DMA_Priority_Low;
ADDW	R2, R0, #40
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,438 :: 		DMA_InitStruct->DMA_FIFOMode = DMA_FIFOMode_Disable;
ADDW	R2, R0, #44
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,441 :: 		DMA_InitStruct->DMA_FIFOThreshold = DMA_FIFOThreshold_1QuarterFull;
ADDW	R2, R0, #48
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,444 :: 		DMA_InitStruct->DMA_MemoryBurst = DMA_MemoryBurst_Single;
ADDW	R2, R0, #52
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,447 :: 		DMA_InitStruct->DMA_PeripheralBurst = DMA_PeripheralBurst_Single;
ADDW	R2, R0, #56
; DMA_InitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dma.c,448 :: 		}
L_end_DMA_StructInit:
BX	LR
; end of _DMA_StructInit
_DMA_Cmd:
;stm32f4xx_dma.c,476 :: 		void DMA_Cmd(DMA_Stream_TypeDef* DMAy_Streamx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_dma.c,482 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_DMA_Cmd58
; NewState end address is: 4 (R1)
;stm32f4xx_dma.c,485 :: 		DMAy_Streamx->CR |= (uint32_t)DMA_SxCR_EN;
LDR	R2, [R0, #0]
ORR	R2, R2, #1
STR	R2, [R0, #0]
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,486 :: 		}
IT	AL
BAL	L_DMA_Cmd59
L_DMA_Cmd58:
;stm32f4xx_dma.c,490 :: 		DMAy_Streamx->CR &= ~(uint32_t)DMA_SxCR_EN;
; DMAy_Streamx start address is: 0 (R0)
LDR	R3, [R0, #0]
MVN	R2, #1
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,491 :: 		}
L_DMA_Cmd59:
;stm32f4xx_dma.c,492 :: 		}
L_end_DMA_Cmd:
BX	LR
; end of _DMA_Cmd
_DMA_PeriphIncOffsetSizeConfig:
;stm32f4xx_dma.c,512 :: 		void DMA_PeriphIncOffsetSizeConfig(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_Pincos)
; DMA_Pincos start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
; DMA_Pincos end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
; DMA_Pincos start address is: 4 (R1)
;stm32f4xx_dma.c,519 :: 		if(DMA_Pincos != DMA_PINCOS_Psize)
CMP	R1, #0
IT	EQ
BEQ	L_DMA_PeriphIncOffsetSizeConfig60
; DMA_Pincos end address is: 4 (R1)
;stm32f4xx_dma.c,522 :: 		DMAy_Streamx->CR |= (uint32_t)DMA_SxCR_PINCOS;
LDR	R2, [R0, #0]
ORR	R2, R2, #32768
STR	R2, [R0, #0]
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,523 :: 		}
IT	AL
BAL	L_DMA_PeriphIncOffsetSizeConfig61
L_DMA_PeriphIncOffsetSizeConfig60:
;stm32f4xx_dma.c,527 :: 		DMAy_Streamx->CR &= ~(uint32_t)DMA_SxCR_PINCOS;
; DMAy_Streamx start address is: 0 (R0)
LDR	R3, [R0, #0]
MVN	R2, #32768
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,528 :: 		}
L_DMA_PeriphIncOffsetSizeConfig61:
;stm32f4xx_dma.c,529 :: 		}
L_end_DMA_PeriphIncOffsetSizeConfig:
BX	LR
; end of _DMA_PeriphIncOffsetSizeConfig
_DMA_FlowControllerConfig:
;stm32f4xx_dma.c,548 :: 		void DMA_FlowControllerConfig(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_FlowCtrl)
; DMA_FlowCtrl start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
; DMA_FlowCtrl end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
; DMA_FlowCtrl start address is: 4 (R1)
;stm32f4xx_dma.c,555 :: 		if(DMA_FlowCtrl != DMA_FlowCtrl_Memory)
CMP	R1, #0
IT	EQ
BEQ	L_DMA_FlowControllerConfig62
; DMA_FlowCtrl end address is: 4 (R1)
;stm32f4xx_dma.c,558 :: 		DMAy_Streamx->CR |= (uint32_t)DMA_SxCR_PFCTRL;
LDR	R2, [R0, #0]
ORR	R2, R2, #32
STR	R2, [R0, #0]
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,559 :: 		}
IT	AL
BAL	L_DMA_FlowControllerConfig63
L_DMA_FlowControllerConfig62:
;stm32f4xx_dma.c,563 :: 		DMAy_Streamx->CR &= ~(uint32_t)DMA_SxCR_PFCTRL;
; DMAy_Streamx start address is: 0 (R0)
LDR	R3, [R0, #0]
MVN	R2, #32
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,564 :: 		}
L_DMA_FlowControllerConfig63:
;stm32f4xx_dma.c,565 :: 		}
L_end_DMA_FlowControllerConfig:
BX	LR
; end of _DMA_FlowControllerConfig
_DMA_SetCurrDataCounter:
;stm32f4xx_dma.c,632 :: 		void DMA_SetCurrDataCounter(DMA_Stream_TypeDef* DMAy_Streamx, uint16_t Counter)
; Counter start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
; Counter end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
; Counter start address is: 4 (R1)
;stm32f4xx_dma.c,638 :: 		DMAy_Streamx->NDTR = (uint16_t)Counter;
ADDS	R2, R0, #4
; DMAy_Streamx end address is: 0 (R0)
STR	R1, [R2, #0]
; Counter end address is: 4 (R1)
;stm32f4xx_dma.c,639 :: 		}
L_end_DMA_SetCurrDataCounter:
BX	LR
; end of _DMA_SetCurrDataCounter
_DMA_GetCurrDataCounter:
;stm32f4xx_dma.c,647 :: 		uint16_t DMA_GetCurrDataCounter(DMA_Stream_TypeDef* DMAy_Streamx)
; DMAy_Streamx start address is: 0 (R0)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
;stm32f4xx_dma.c,653 :: 		return ((uint16_t)(DMAy_Streamx->NDTR));
ADDS	R1, R0, #4
; DMAy_Streamx end address is: 0 (R0)
LDR	R1, [R1, #0]
UXTH	R0, R1
;stm32f4xx_dma.c,654 :: 		}
L_end_DMA_GetCurrDataCounter:
BX	LR
; end of _DMA_GetCurrDataCounter
_DMA_DoubleBufferModeConfig:
;stm32f4xx_dma.c,725 :: 		uint32_t DMA_CurrentMemory)
; DMA_CurrentMemory start address is: 8 (R2)
; Memory1BaseAddr start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
; DMA_CurrentMemory end address is: 8 (R2)
; Memory1BaseAddr end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
; Memory1BaseAddr start address is: 4 (R1)
; DMA_CurrentMemory start address is: 8 (R2)
;stm32f4xx_dma.c,731 :: 		if (DMA_CurrentMemory != DMA_Memory_0)
CMP	R2, #0
IT	EQ
BEQ	L_DMA_DoubleBufferModeConfig64
; DMA_CurrentMemory end address is: 8 (R2)
;stm32f4xx_dma.c,734 :: 		DMAy_Streamx->CR |= (uint32_t)(DMA_SxCR_CT);
LDR	R3, [R0, #0]
ORR	R3, R3, #524288
STR	R3, [R0, #0]
;stm32f4xx_dma.c,735 :: 		}
IT	AL
BAL	L_DMA_DoubleBufferModeConfig65
L_DMA_DoubleBufferModeConfig64:
;stm32f4xx_dma.c,739 :: 		DMAy_Streamx->CR &= ~(uint32_t)(DMA_SxCR_CT);
LDR	R4, [R0, #0]
MVN	R3, #524288
AND	R3, R4, R3, LSL #0
STR	R3, [R0, #0]
;stm32f4xx_dma.c,740 :: 		}
L_DMA_DoubleBufferModeConfig65:
;stm32f4xx_dma.c,743 :: 		DMAy_Streamx->M1AR = Memory1BaseAddr;
ADDW	R3, R0, #16
; DMAy_Streamx end address is: 0 (R0)
STR	R1, [R3, #0]
; Memory1BaseAddr end address is: 4 (R1)
;stm32f4xx_dma.c,744 :: 		}
L_end_DMA_DoubleBufferModeConfig:
BX	LR
; end of _DMA_DoubleBufferModeConfig
_DMA_DoubleBufferModeCmd:
;stm32f4xx_dma.c,755 :: 		void DMA_DoubleBufferModeCmd(DMA_Stream_TypeDef* DMAy_Streamx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_dma.c,762 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_DMA_DoubleBufferModeCmd66
; NewState end address is: 4 (R1)
;stm32f4xx_dma.c,765 :: 		DMAy_Streamx->CR |= (uint32_t)DMA_SxCR_DBM;
LDR	R2, [R0, #0]
ORR	R2, R2, #262144
STR	R2, [R0, #0]
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,766 :: 		}
IT	AL
BAL	L_DMA_DoubleBufferModeCmd67
L_DMA_DoubleBufferModeCmd66:
;stm32f4xx_dma.c,770 :: 		DMAy_Streamx->CR &= ~(uint32_t)DMA_SxCR_DBM;
; DMAy_Streamx start address is: 0 (R0)
LDR	R3, [R0, #0]
MVN	R2, #262144
AND	R2, R3, R2, LSL #0
STR	R2, [R0, #0]
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,771 :: 		}
L_DMA_DoubleBufferModeCmd67:
;stm32f4xx_dma.c,772 :: 		}
L_end_DMA_DoubleBufferModeCmd:
BX	LR
; end of _DMA_DoubleBufferModeCmd
_DMA_MemoryTargetConfig:
;stm32f4xx_dma.c,797 :: 		uint32_t DMA_MemoryTarget)
; DMA_MemoryTarget start address is: 8 (R2)
; MemoryBaseAddr start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
; DMA_MemoryTarget end address is: 8 (R2)
; MemoryBaseAddr end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
; MemoryBaseAddr start address is: 4 (R1)
; DMA_MemoryTarget start address is: 8 (R2)
;stm32f4xx_dma.c,804 :: 		if (DMA_MemoryTarget != DMA_Memory_0)
CMP	R2, #0
IT	EQ
BEQ	L_DMA_MemoryTargetConfig68
; DMA_MemoryTarget end address is: 8 (R2)
;stm32f4xx_dma.c,807 :: 		DMAy_Streamx->M1AR = MemoryBaseAddr;
ADDW	R3, R0, #16
; DMAy_Streamx end address is: 0 (R0)
STR	R1, [R3, #0]
; MemoryBaseAddr end address is: 4 (R1)
;stm32f4xx_dma.c,808 :: 		}
IT	AL
BAL	L_DMA_MemoryTargetConfig69
L_DMA_MemoryTargetConfig68:
;stm32f4xx_dma.c,812 :: 		DMAy_Streamx->M0AR = MemoryBaseAddr;
; MemoryBaseAddr start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
ADDW	R3, R0, #12
; DMAy_Streamx end address is: 0 (R0)
STR	R1, [R3, #0]
; MemoryBaseAddr end address is: 4 (R1)
;stm32f4xx_dma.c,813 :: 		}
L_DMA_MemoryTargetConfig69:
;stm32f4xx_dma.c,814 :: 		}
L_end_DMA_MemoryTargetConfig:
BX	LR
; end of _DMA_MemoryTargetConfig
_DMA_GetCurrentMemoryTarget:
;stm32f4xx_dma.c,822 :: 		uint32_t DMA_GetCurrentMemoryTarget(DMA_Stream_TypeDef* DMAy_Streamx)
; DMAy_Streamx start address is: 0 (R0)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
;stm32f4xx_dma.c,824 :: 		uint32_t tmp = 0;
;stm32f4xx_dma.c,830 :: 		if ((DMAy_Streamx->CR & DMA_SxCR_CT) != 0)
LDR	R1, [R0, #0]
; DMAy_Streamx end address is: 0 (R0)
AND	R1, R1, #524288
CMP	R1, #0
IT	EQ
BEQ	L_DMA_GetCurrentMemoryTarget70
;stm32f4xx_dma.c,833 :: 		tmp = 1;
; tmp start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_dma.c,834 :: 		}
; tmp end address is: 0 (R0)
IT	AL
BAL	L_DMA_GetCurrentMemoryTarget71
L_DMA_GetCurrentMemoryTarget70:
;stm32f4xx_dma.c,838 :: 		tmp = 0;
; tmp start address is: 0 (R0)
MOV	R0, #0
; tmp end address is: 0 (R0)
;stm32f4xx_dma.c,839 :: 		}
L_DMA_GetCurrentMemoryTarget71:
;stm32f4xx_dma.c,840 :: 		return tmp;
; tmp start address is: 0 (R0)
; tmp end address is: 0 (R0)
;stm32f4xx_dma.c,841 :: 		}
L_end_DMA_GetCurrentMemoryTarget:
BX	LR
; end of _DMA_GetCurrentMemoryTarget
_DMA_GetCmdStatus:
;stm32f4xx_dma.c,931 :: 		FunctionalState DMA_GetCmdStatus(DMA_Stream_TypeDef* DMAy_Streamx)
; DMAy_Streamx start address is: 0 (R0)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
;stm32f4xx_dma.c,933 :: 		FunctionalState state = DISABLE;
;stm32f4xx_dma.c,938 :: 		if ((DMAy_Streamx->CR & (uint32_t)DMA_SxCR_EN) != 0)
LDR	R1, [R0, #0]
; DMAy_Streamx end address is: 0 (R0)
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_DMA_GetCmdStatus72
;stm32f4xx_dma.c,941 :: 		state = ENABLE;
; state start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_dma.c,942 :: 		}
; state end address is: 0 (R0)
IT	AL
BAL	L_DMA_GetCmdStatus73
L_DMA_GetCmdStatus72:
;stm32f4xx_dma.c,947 :: 		state = DISABLE;
; state start address is: 0 (R0)
MOVS	R0, #0
; state end address is: 0 (R0)
;stm32f4xx_dma.c,948 :: 		}
L_DMA_GetCmdStatus73:
;stm32f4xx_dma.c,949 :: 		return state;
; state start address is: 0 (R0)
; state end address is: 0 (R0)
;stm32f4xx_dma.c,950 :: 		}
L_end_DMA_GetCmdStatus:
BX	LR
; end of _DMA_GetCmdStatus
_DMA_GetFIFOStatus:
;stm32f4xx_dma.c,965 :: 		uint32_t DMA_GetFIFOStatus(DMA_Stream_TypeDef* DMAy_Streamx)
; DMAy_Streamx start address is: 0 (R0)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
;stm32f4xx_dma.c,967 :: 		uint32_t tmpreg = 0;
;stm32f4xx_dma.c,973 :: 		tmpreg = (uint32_t)((DMAy_Streamx->FCR & DMA_SxFCR_FS));
ADDW	R1, R0, #20
; DMAy_Streamx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #56
;stm32f4xx_dma.c,975 :: 		return tmpreg;
MOV	R0, R1
;stm32f4xx_dma.c,976 :: 		}
L_end_DMA_GetFIFOStatus:
BX	LR
; end of _DMA_GetFIFOStatus
_DMA_GetFlagStatus:
;stm32f4xx_dma.c,992 :: 		FlagStatus DMA_GetFlagStatus(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_FLAG)
; DMA_FLAG start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
; DMA_FLAG end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
; DMA_FLAG start address is: 4 (R1)
;stm32f4xx_dma.c,994 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_dma.c,996 :: 		uint32_t tmpreg = 0;
;stm32f4xx_dma.c,1003 :: 		if (DMAy_Streamx < DMA2_Stream0)
MOVW	R2, #25616
MOVT	R2, #16386
CMP	R0, R2
IT	CS
BCS	L_DMA_GetFlagStatus74
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,1006 :: 		DMAy = DMA1;
; DMAy start address is: 0 (R0)
MOVW	R0, #24576
MOVT	R0, #16386
;stm32f4xx_dma.c,1007 :: 		}
; DMAy end address is: 0 (R0)
IT	AL
BAL	L_DMA_GetFlagStatus75
L_DMA_GetFlagStatus74:
;stm32f4xx_dma.c,1011 :: 		DMAy = DMA2;
; DMAy start address is: 0 (R0)
MOVW	R0, #25600
MOVT	R0, #16386
; DMAy end address is: 0 (R0)
;stm32f4xx_dma.c,1012 :: 		}
L_DMA_GetFlagStatus75:
;stm32f4xx_dma.c,1015 :: 		if ((DMA_FLAG & HIGH_ISR_MASK) != (uint32_t)RESET)
; DMAy start address is: 0 (R0)
AND	R2, R1, #536870912
CMP	R2, #0
IT	EQ
BEQ	L_DMA_GetFlagStatus76
;stm32f4xx_dma.c,1018 :: 		tmpreg = DMAy->HISR;
ADDS	R2, R0, #4
; DMAy end address is: 0 (R0)
LDR	R0, [R2, #0]
; tmpreg start address is: 0 (R0)
;stm32f4xx_dma.c,1019 :: 		}
; tmpreg end address is: 0 (R0)
IT	AL
BAL	L_DMA_GetFlagStatus77
L_DMA_GetFlagStatus76:
;stm32f4xx_dma.c,1023 :: 		tmpreg = DMAy->LISR;
; DMAy start address is: 0 (R0)
LDR	R0, [R0, #0]
; DMAy end address is: 0 (R0)
; tmpreg start address is: 0 (R0)
; tmpreg end address is: 0 (R0)
;stm32f4xx_dma.c,1024 :: 		}
L_DMA_GetFlagStatus77:
;stm32f4xx_dma.c,1027 :: 		tmpreg &= (uint32_t)RESERVED_MASK;
; tmpreg start address is: 0 (R0)
MOVW	R2, #3965
MOVT	R2, #3965
AND	R2, R0, R2, LSL #0
; tmpreg end address is: 0 (R0)
;stm32f4xx_dma.c,1030 :: 		if ((tmpreg & DMA_FLAG) != (uint32_t)RESET)
ANDS	R2, R1
; DMA_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_DMA_GetFlagStatus78
;stm32f4xx_dma.c,1033 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_dma.c,1034 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_DMA_GetFlagStatus79
L_DMA_GetFlagStatus78:
;stm32f4xx_dma.c,1038 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_dma.c,1039 :: 		}
L_DMA_GetFlagStatus79:
;stm32f4xx_dma.c,1042 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_dma.c,1043 :: 		}
L_end_DMA_GetFlagStatus:
BX	LR
; end of _DMA_GetFlagStatus
_DMA_ClearFlag:
;stm32f4xx_dma.c,1059 :: 		void DMA_ClearFlag(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_FLAG)
; DMA_FLAG start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
; DMA_FLAG end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
; DMA_FLAG start address is: 4 (R1)
;stm32f4xx_dma.c,1068 :: 		if (DMAy_Streamx < DMA2_Stream0)
MOVW	R2, #25616
MOVT	R2, #16386
CMP	R0, R2
IT	CS
BCS	L_DMA_ClearFlag80
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,1071 :: 		DMAy = DMA1;
; DMAy start address is: 0 (R0)
MOVW	R0, #24576
MOVT	R0, #16386
;stm32f4xx_dma.c,1072 :: 		}
; DMAy end address is: 0 (R0)
IT	AL
BAL	L_DMA_ClearFlag81
L_DMA_ClearFlag80:
;stm32f4xx_dma.c,1076 :: 		DMAy = DMA2;
; DMAy start address is: 0 (R0)
MOVW	R0, #25600
MOVT	R0, #16386
; DMAy end address is: 0 (R0)
;stm32f4xx_dma.c,1077 :: 		}
L_DMA_ClearFlag81:
;stm32f4xx_dma.c,1080 :: 		if ((DMA_FLAG & HIGH_ISR_MASK) != (uint32_t)RESET)
; DMAy start address is: 0 (R0)
AND	R2, R1, #536870912
CMP	R2, #0
IT	EQ
BEQ	L_DMA_ClearFlag82
;stm32f4xx_dma.c,1083 :: 		DMAy->HIFCR = (uint32_t)(DMA_FLAG & RESERVED_MASK);
ADDW	R3, R0, #12
; DMAy end address is: 0 (R0)
MOVW	R2, #3965
MOVT	R2, #3965
AND	R2, R1, R2, LSL #0
; DMA_FLAG end address is: 4 (R1)
STR	R2, [R3, #0]
;stm32f4xx_dma.c,1084 :: 		}
IT	AL
BAL	L_DMA_ClearFlag83
L_DMA_ClearFlag82:
;stm32f4xx_dma.c,1088 :: 		DMAy->LIFCR = (uint32_t)(DMA_FLAG & RESERVED_MASK);
; DMAy start address is: 0 (R0)
; DMA_FLAG start address is: 4 (R1)
ADDW	R3, R0, #8
; DMAy end address is: 0 (R0)
MOVW	R2, #3965
MOVT	R2, #3965
AND	R2, R1, R2, LSL #0
; DMA_FLAG end address is: 4 (R1)
STR	R2, [R3, #0]
;stm32f4xx_dma.c,1089 :: 		}
L_DMA_ClearFlag83:
;stm32f4xx_dma.c,1090 :: 		}
L_end_DMA_ClearFlag:
BX	LR
; end of _DMA_ClearFlag
_DMA_ITConfig:
;stm32f4xx_dma.c,1106 :: 		void DMA_ITConfig(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; DMA_IT start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; DMA_IT end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
; DMA_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f4xx_dma.c,1114 :: 		if ((DMA_IT & DMA_IT_FE) != 0)
AND	R3, R1, #128
CMP	R3, #0
IT	EQ
BEQ	L_DMA_ITConfig84
;stm32f4xx_dma.c,1116 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_DMA_ITConfig85
;stm32f4xx_dma.c,1119 :: 		DMAy_Streamx->FCR |= (uint32_t)DMA_IT_FE;
ADDW	R4, R0, #20
LDR	R3, [R4, #0]
ORR	R3, R3, #128
STR	R3, [R4, #0]
;stm32f4xx_dma.c,1120 :: 		}
IT	AL
BAL	L_DMA_ITConfig86
L_DMA_ITConfig85:
;stm32f4xx_dma.c,1124 :: 		DMAy_Streamx->FCR &= ~(uint32_t)DMA_IT_FE;
ADDW	R5, R0, #20
LDR	R4, [R5, #0]
MVN	R3, #128
AND	R3, R4, R3, LSL #0
STR	R3, [R5, #0]
;stm32f4xx_dma.c,1125 :: 		}
L_DMA_ITConfig86:
;stm32f4xx_dma.c,1126 :: 		}
L_DMA_ITConfig84:
;stm32f4xx_dma.c,1129 :: 		if (DMA_IT != DMA_IT_FE)
CMP	R1, #128
IT	EQ
BEQ	L_DMA_ITConfig87
;stm32f4xx_dma.c,1131 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_DMA_ITConfig88
; NewState end address is: 8 (R2)
;stm32f4xx_dma.c,1134 :: 		DMAy_Streamx->CR |= (uint32_t)(DMA_IT  & TRANSFER_IT_ENABLE_MASK);
AND	R4, R1, #30
; DMA_IT end address is: 4 (R1)
LDR	R3, [R0, #0]
ORRS	R3, R4
STR	R3, [R0, #0]
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,1135 :: 		}
IT	AL
BAL	L_DMA_ITConfig89
L_DMA_ITConfig88:
;stm32f4xx_dma.c,1139 :: 		DMAy_Streamx->CR &= ~(uint32_t)(DMA_IT & TRANSFER_IT_ENABLE_MASK);
; DMA_IT start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
AND	R3, R1, #30
; DMA_IT end address is: 4 (R1)
MVN	R4, R3
LDR	R3, [R0, #0]
ANDS	R3, R4
STR	R3, [R0, #0]
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,1140 :: 		}
L_DMA_ITConfig89:
;stm32f4xx_dma.c,1141 :: 		}
L_DMA_ITConfig87:
;stm32f4xx_dma.c,1142 :: 		}
L_end_DMA_ITConfig:
BX	LR
; end of _DMA_ITConfig
_DMA_GetITStatus:
;stm32f4xx_dma.c,1158 :: 		ITStatus DMA_GetITStatus(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_IT)
; DMA_IT start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
MOV	R4, R0
; DMA_IT end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 16 (R4)
; DMA_IT start address is: 4 (R1)
;stm32f4xx_dma.c,1160 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_dma.c,1162 :: 		uint32_t tmpreg = 0, enablestatus = 0;
;stm32f4xx_dma.c,1169 :: 		if (DMAy_Streamx < DMA2_Stream0)
MOVW	R2, #25616
MOVT	R2, #16386
CMP	R4, R2
IT	CS
BCS	L_DMA_GetITStatus90
;stm32f4xx_dma.c,1172 :: 		DMAy = DMA1;
; DMAy start address is: 0 (R0)
MOVW	R0, #24576
MOVT	R0, #16386
;stm32f4xx_dma.c,1173 :: 		}
; DMAy end address is: 0 (R0)
IT	AL
BAL	L_DMA_GetITStatus91
L_DMA_GetITStatus90:
;stm32f4xx_dma.c,1177 :: 		DMAy = DMA2;
; DMAy start address is: 0 (R0)
MOVW	R0, #25600
MOVT	R0, #16386
; DMAy end address is: 0 (R0)
;stm32f4xx_dma.c,1178 :: 		}
L_DMA_GetITStatus91:
;stm32f4xx_dma.c,1181 :: 		if ((DMA_IT & TRANSFER_IT_MASK) != (uint32_t)RESET)
; DMAy start address is: 0 (R0)
MOVW	R2, #3900
MOVT	R2, #3900
AND	R2, R1, R2, LSL #0
CMP	R2, #0
IT	EQ
BEQ	L_DMA_GetITStatus92
;stm32f4xx_dma.c,1184 :: 		tmpreg = (uint32_t)((DMA_IT >> 11) & TRANSFER_IT_ENABLE_MASK);
LSRS	R2, R1, #11
AND	R3, R2, #30
;stm32f4xx_dma.c,1187 :: 		enablestatus = (uint32_t)(DMAy_Streamx->CR & tmpreg);
LDR	R2, [R4, #0]
; DMAy_Streamx end address is: 16 (R4)
AND	R3, R2, R3, LSL #0
; enablestatus start address is: 12 (R3)
;stm32f4xx_dma.c,1188 :: 		}
; enablestatus end address is: 12 (R3)
IT	AL
BAL	L_DMA_GetITStatus93
L_DMA_GetITStatus92:
;stm32f4xx_dma.c,1192 :: 		enablestatus = (uint32_t)(DMAy_Streamx->FCR & DMA_IT_FE);
; DMAy_Streamx start address is: 16 (R4)
ADDW	R2, R4, #20
; DMAy_Streamx end address is: 16 (R4)
LDR	R2, [R2, #0]
AND	R3, R2, #128
; enablestatus start address is: 12 (R3)
; enablestatus end address is: 12 (R3)
;stm32f4xx_dma.c,1193 :: 		}
L_DMA_GetITStatus93:
;stm32f4xx_dma.c,1196 :: 		if ((DMA_IT & HIGH_ISR_MASK) != (uint32_t)RESET)
; enablestatus start address is: 12 (R3)
AND	R2, R1, #536870912
CMP	R2, #0
IT	EQ
BEQ	L_DMA_GetITStatus94
;stm32f4xx_dma.c,1199 :: 		tmpreg = DMAy->HISR ;
ADDS	R2, R0, #4
; DMAy end address is: 0 (R0)
LDR	R0, [R2, #0]
; tmpreg start address is: 0 (R0)
;stm32f4xx_dma.c,1200 :: 		}
; tmpreg end address is: 0 (R0)
IT	AL
BAL	L_DMA_GetITStatus95
L_DMA_GetITStatus94:
;stm32f4xx_dma.c,1204 :: 		tmpreg = DMAy->LISR ;
; DMAy start address is: 0 (R0)
LDR	R0, [R0, #0]
; DMAy end address is: 0 (R0)
; tmpreg start address is: 0 (R0)
; tmpreg end address is: 0 (R0)
;stm32f4xx_dma.c,1205 :: 		}
L_DMA_GetITStatus95:
;stm32f4xx_dma.c,1208 :: 		tmpreg &= (uint32_t)RESERVED_MASK;
; tmpreg start address is: 0 (R0)
MOVW	R2, #3965
MOVT	R2, #3965
AND	R2, R0, R2, LSL #0
; tmpreg end address is: 0 (R0)
;stm32f4xx_dma.c,1211 :: 		if (((tmpreg & DMA_IT) != (uint32_t)RESET) && (enablestatus != (uint32_t)RESET))
ANDS	R2, R1
; DMA_IT end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L__DMA_GetITStatus113
CMP	R3, #0
IT	EQ
BEQ	L__DMA_GetITStatus112
; enablestatus end address is: 12 (R3)
L__DMA_GetITStatus111:
;stm32f4xx_dma.c,1214 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_dma.c,1215 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_DMA_GetITStatus99
;stm32f4xx_dma.c,1211 :: 		if (((tmpreg & DMA_IT) != (uint32_t)RESET) && (enablestatus != (uint32_t)RESET))
L__DMA_GetITStatus113:
L__DMA_GetITStatus112:
;stm32f4xx_dma.c,1219 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_dma.c,1220 :: 		}
L_DMA_GetITStatus99:
;stm32f4xx_dma.c,1223 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_dma.c,1224 :: 		}
L_end_DMA_GetITStatus:
BX	LR
; end of _DMA_GetITStatus
_DMA_ClearITPendingBit:
;stm32f4xx_dma.c,1240 :: 		void DMA_ClearITPendingBit(DMA_Stream_TypeDef* DMAy_Streamx, uint32_t DMA_IT)
; DMA_IT start address is: 4 (R1)
; DMAy_Streamx start address is: 0 (R0)
; DMA_IT end address is: 4 (R1)
; DMAy_Streamx end address is: 0 (R0)
; DMAy_Streamx start address is: 0 (R0)
; DMA_IT start address is: 4 (R1)
;stm32f4xx_dma.c,1249 :: 		if (DMAy_Streamx < DMA2_Stream0)
MOVW	R2, #25616
MOVT	R2, #16386
CMP	R0, R2
IT	CS
BCS	L_DMA_ClearITPendingBit100
; DMAy_Streamx end address is: 0 (R0)
;stm32f4xx_dma.c,1252 :: 		DMAy = DMA1;
; DMAy start address is: 0 (R0)
MOVW	R0, #24576
MOVT	R0, #16386
;stm32f4xx_dma.c,1253 :: 		}
; DMAy end address is: 0 (R0)
IT	AL
BAL	L_DMA_ClearITPendingBit101
L_DMA_ClearITPendingBit100:
;stm32f4xx_dma.c,1257 :: 		DMAy = DMA2;
; DMAy start address is: 0 (R0)
MOVW	R0, #25600
MOVT	R0, #16386
; DMAy end address is: 0 (R0)
;stm32f4xx_dma.c,1258 :: 		}
L_DMA_ClearITPendingBit101:
;stm32f4xx_dma.c,1261 :: 		if ((DMA_IT & HIGH_ISR_MASK) != (uint32_t)RESET)
; DMAy start address is: 0 (R0)
AND	R2, R1, #536870912
CMP	R2, #0
IT	EQ
BEQ	L_DMA_ClearITPendingBit102
;stm32f4xx_dma.c,1264 :: 		DMAy->HIFCR = (uint32_t)(DMA_IT & RESERVED_MASK);
ADDW	R3, R0, #12
; DMAy end address is: 0 (R0)
MOVW	R2, #3965
MOVT	R2, #3965
AND	R2, R1, R2, LSL #0
; DMA_IT end address is: 4 (R1)
STR	R2, [R3, #0]
;stm32f4xx_dma.c,1265 :: 		}
IT	AL
BAL	L_DMA_ClearITPendingBit103
L_DMA_ClearITPendingBit102:
;stm32f4xx_dma.c,1269 :: 		DMAy->LIFCR = (uint32_t)(DMA_IT & RESERVED_MASK);
; DMAy start address is: 0 (R0)
; DMA_IT start address is: 4 (R1)
ADDW	R3, R0, #8
; DMAy end address is: 0 (R0)
MOVW	R2, #3965
MOVT	R2, #3965
AND	R2, R1, R2, LSL #0
; DMA_IT end address is: 4 (R1)
STR	R2, [R3, #0]
;stm32f4xx_dma.c,1270 :: 		}
L_DMA_ClearITPendingBit103:
;stm32f4xx_dma.c,1271 :: 		}
L_end_DMA_ClearITPendingBit:
BX	LR
; end of _DMA_ClearITPendingBit
