stm32f4xx_rcc___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_rcc___DSB
stm32f4xx_rcc___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_rcc___WFI
stm32f4xx_rcc___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_rcc___WFE
stm32f4xx_rcc___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_rcc___REV
stm32f4xx_rcc_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_rcc_NVIC_SetPriorityGrouping
stm32f4xx_rcc_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_rcc_NVIC_GetPriorityGrouping
stm32f4xx_rcc_NVIC_EnableIRQ:
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
; end of stm32f4xx_rcc_NVIC_EnableIRQ
stm32f4xx_rcc_NVIC_DisableIRQ:
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
; end of stm32f4xx_rcc_NVIC_DisableIRQ
stm32f4xx_rcc_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_rcc_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_rcc_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_rcc_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_rcc_NVIC_GetPendingIRQ1
L_stm32f4xx_rcc_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_rcc_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_rcc_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_rcc_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_rcc_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_rcc_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_rcc_NVIC_GetPendingIRQ
stm32f4xx_rcc_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_rcc_NVIC_SetPendingIRQ
stm32f4xx_rcc_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_rcc_NVIC_ClearPendingIRQ
stm32f4xx_rcc_NVIC_GetActive:
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
BEQ	L_stm32f4xx_rcc_NVIC_GetActive2
; ?FLOC__stm32f4xx_rcc_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_rcc_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_rcc_NVIC_GetActive3
L_stm32f4xx_rcc_NVIC_GetActive2:
; ?FLOC__stm32f4xx_rcc_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_rcc_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_rcc_NVIC_GetActive3:
; ?FLOC__stm32f4xx_rcc_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_rcc_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_rcc_NVIC_GetActive
stm32f4xx_rcc_NVIC_SetPriority:
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
BGE	L_stm32f4xx_rcc_NVIC_SetPriority4
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
BAL	L_stm32f4xx_rcc_NVIC_SetPriority5
L_stm32f4xx_rcc_NVIC_SetPriority4:
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
L_stm32f4xx_rcc_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_rcc_NVIC_SetPriority
stm32f4xx_rcc_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_rcc_NVIC_GetPriority6
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
L_stm32f4xx_rcc_NVIC_GetPriority6:
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
; end of stm32f4xx_rcc_NVIC_GetPriority
stm32f4xx_rcc_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_rcc_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_rcc_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_rcc_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_rcc_NVIC_EncodePriority9
L_stm32f4xx_rcc_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_rcc_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_rcc_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_rcc_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_rcc_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_rcc_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_rcc_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_rcc_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_rcc_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_rcc_NVIC_EncodePriority11
L_stm32f4xx_rcc_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_rcc_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_rcc_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_rcc_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_rcc_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_rcc_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_rcc_NVIC_EncodePriority
stm32f4xx_rcc_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_rcc_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_rcc_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_rcc_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_rcc_NVIC_DecodePriority13
L_stm32f4xx_rcc_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_rcc_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_rcc_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_rcc_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_rcc_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_rcc_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_rcc_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_rcc_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_rcc_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_rcc_NVIC_DecodePriority15
L_stm32f4xx_rcc_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_rcc_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_rcc_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_rcc_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_rcc_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_rcc_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_rcc_NVIC_DecodePriority
stm32f4xx_rcc_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_rcc___DSB+0
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
BL	stm32f4xx_rcc___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_rcc_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_rcc_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_rcc_NVIC_SystemReset
stm32f4xx_rcc_SysTick_Config:
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
BLS	L_stm32f4xx_rcc_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_rcc_SysTick_Config18:
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
BL	stm32f4xx_rcc_NVIC_SetPriority+0
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
; end of stm32f4xx_rcc_SysTick_Config
stm32f4xx_rcc_ITM_SendChar:
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
BEQ	L_stm32f4xx_rcc_ITM_SendChar92
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_rcc_ITM_SendChar93
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_rcc_ITM_SendChar94
L_stm32f4xx_rcc_ITM_SendChar88:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_rcc_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_rcc_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_rcc_ITM_SendChar22
L_stm32f4xx_rcc_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_rcc_ITM_SendChar91
L_stm32f4xx_rcc_ITM_SendChar92:
L_stm32f4xx_rcc_ITM_SendChar91:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_rcc_ITM_SendChar90
L_stm32f4xx_rcc_ITM_SendChar93:
L_stm32f4xx_rcc_ITM_SendChar90:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_rcc_ITM_SendChar89
L_stm32f4xx_rcc_ITM_SendChar94:
L_stm32f4xx_rcc_ITM_SendChar89:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_rcc_ITM_SendChar
stm32f4xx_rcc_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_rcc_ITM_ReceiveChar24
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
L_stm32f4xx_rcc_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_rcc_ITM_ReceiveChar
stm32f4xx_rcc_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_rcc_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_rcc_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_rcc_ITM_CheckChar
_RCC_DeInit:
;stm32f4xx_rcc.c,202 :: 		void RCC_DeInit(void)
;stm32f4xx_rcc.c,205 :: 		RCC->CR |= (uint32_t)0x00000001;
MOVW	R3, #14336
MOVT	R3, #16386
LDR	R0, [R3, #0]
ORR	R2, R0, #1
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,208 :: 		RCC->CFGR = 0x00000000;
MOV	R1, #0
MOVW	R0, #14344
MOVT	R0, #16386
STR	R1, [R0, #0]
;stm32f4xx_rcc.c,211 :: 		RCC->CR &= (uint32_t)0xFEF6FFFF;
MOVW	R0, #65535
MOVT	R0, #65270
ANDS	R2, R0
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,214 :: 		RCC->PLLCFGR = 0x24003010;
MOVW	R1, #12304
MOVT	R1, #9216
MOVW	R0, #14340
MOVT	R0, #16386
STR	R1, [R0, #0]
;stm32f4xx_rcc.c,217 :: 		RCC->CR &= (uint32_t)0xFFFBFFFF;
MVN	R0, #262144
AND	R0, R2, R0, LSL #0
STR	R0, [R3, #0]
;stm32f4xx_rcc.c,220 :: 		RCC->CIR = 0x00000000;
MOV	R1, #0
MOVW	R0, #14348
MOVT	R0, #16386
STR	R1, [R0, #0]
;stm32f4xx_rcc.c,221 :: 		}
L_end_RCC_DeInit:
BX	LR
; end of _RCC_DeInit
_RCC_HSEConfig:
;stm32f4xx_rcc.c,243 :: 		void RCC_HSEConfig(uint8_t RCC_HSE)
; RCC_HSE start address is: 0 (R0)
; RCC_HSE end address is: 0 (R0)
; RCC_HSE start address is: 0 (R0)
;stm32f4xx_rcc.c,249 :: 		*(__IO uint8_t *) CR_BYTE3_ADDRESS = RCC_HSE_OFF;
MOVS	R2, #0
MOVW	R1, 1073887234
MOVT	R1, 16386
STRB	R2, [R1, #0]
;stm32f4xx_rcc.c,252 :: 		*(__IO uint8_t *) CR_BYTE3_ADDRESS = RCC_HSE;
MOVW	R1, 1073887234
MOVT	R1, 16386
STRB	R0, [R1, #0]
; RCC_HSE end address is: 0 (R0)
;stm32f4xx_rcc.c,253 :: 		}
L_end_RCC_HSEConfig:
BX	LR
; end of _RCC_HSEConfig
_RCC_WaitForHSEStartUp:
;stm32f4xx_rcc.c,267 :: 		ErrorStatus RCC_WaitForHSEStartUp(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f4xx_rcc.c,269 :: 		__IO uint32_t startupcounter = 0;
; startupcounter start address is: 12 (R3)
MOV	R3, #0
;stm32f4xx_rcc.c,270 :: 		ErrorStatus status = ERROR;
;stm32f4xx_rcc.c,271 :: 		FlagStatus hsestatus = RESET;
; startupcounter end address is: 12 (R3)
;stm32f4xx_rcc.c,273 :: 		do
L_RCC_WaitForHSEStartUp27:
;stm32f4xx_rcc.c,275 :: 		hsestatus = RCC_GetFlagStatus(RCC_FLAG_HSERDY);
; startupcounter start address is: 12 (R3)
MOVS	R0, #49
BL	_RCC_GetFlagStatus+0
; hsestatus start address is: 4 (R1)
UXTB	R1, R0
;stm32f4xx_rcc.c,276 :: 		startupcounter++;
ADDS	R0, R3, #1
MOV	R3, R0
;stm32f4xx_rcc.c,277 :: 		} while((startupcounter != HSE_STARTUP_TIMEOUT) && (hsestatus == RESET));
CMP	R3, #1280
IT	EQ
BEQ	L__RCC_WaitForHSEStartUp97
CMP	R1, #0
IT	NE
BNE	L__RCC_WaitForHSEStartUp96
; hsestatus end address is: 4 (R1)
; startupcounter end address is: 12 (R3)
IT	AL
BAL	L_RCC_WaitForHSEStartUp27
L__RCC_WaitForHSEStartUp97:
L__RCC_WaitForHSEStartUp96:
;stm32f4xx_rcc.c,279 :: 		if (RCC_GetFlagStatus(RCC_FLAG_HSERDY) != RESET)
MOVS	R0, #49
BL	_RCC_GetFlagStatus+0
CMP	R0, #0
IT	EQ
BEQ	L_RCC_WaitForHSEStartUp32
;stm32f4xx_rcc.c,281 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_rcc.c,282 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_RCC_WaitForHSEStartUp33
L_RCC_WaitForHSEStartUp32:
;stm32f4xx_rcc.c,285 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
; status end address is: 0 (R0)
;stm32f4xx_rcc.c,286 :: 		}
L_RCC_WaitForHSEStartUp33:
;stm32f4xx_rcc.c,287 :: 		return (status);
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f4xx_rcc.c,288 :: 		}
L_end_RCC_WaitForHSEStartUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RCC_WaitForHSEStartUp
_RCC_AdjustHSICalibrationValue:
;stm32f4xx_rcc.c,298 :: 		void RCC_AdjustHSICalibrationValue(uint8_t HSICalibrationValue)
; HSICalibrationValue start address is: 0 (R0)
; HSICalibrationValue end address is: 0 (R0)
; HSICalibrationValue start address is: 0 (R0)
;stm32f4xx_rcc.c,300 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rcc.c,307 :: 		tmpreg &= ~RCC_CR_HSITRIM;
MOVW	R3, #14336
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #248
ANDS	R2, R1
;stm32f4xx_rcc.c,310 :: 		tmpreg |= (uint32_t)HSICalibrationValue << 3;
UXTB	R1, R0
; HSICalibrationValue end address is: 0 (R0)
LSLS	R1, R1, #3
ORR	R1, R2, R1, LSL #0
;stm32f4xx_rcc.c,313 :: 		RCC->CR = tmpreg;
STR	R1, [R3, #0]
;stm32f4xx_rcc.c,314 :: 		}
L_end_RCC_AdjustHSICalibrationValue:
BX	LR
; end of _RCC_AdjustHSICalibrationValue
_RCC_HSICmd:
;stm32f4xx_rcc.c,334 :: 		void RCC_HSICmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_rcc.c,339 :: 		*(__IO uint32_t *) CR_HSION_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111949312
MOVT	R1, 16967
STR	R2, [R1, #0]
;stm32f4xx_rcc.c,340 :: 		}
L_end_RCC_HSICmd:
BX	LR
; end of _RCC_HSICmd
_RCC_LSEConfig:
;stm32f4xx_rcc.c,359 :: 		void RCC_LSEConfig(uint8_t RCC_LSE)
; RCC_LSE start address is: 0 (R0)
; RCC_LSE end address is: 0 (R0)
; RCC_LSE start address is: 0 (R0)
;stm32f4xx_rcc.c,366 :: 		*(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_OFF;
MOVS	R2, #0
MOVW	R1, 1073887344
MOVT	R1, 16386
STRB	R2, [R1, #0]
;stm32f4xx_rcc.c,369 :: 		*(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_OFF;
MOVS	R2, #0
MOVW	R1, 1073887344
MOVT	R1, 16386
STRB	R2, [R1, #0]
;stm32f4xx_rcc.c,372 :: 		switch (RCC_LSE)
IT	AL
BAL	L_RCC_LSEConfig34
; RCC_LSE end address is: 0 (R0)
;stm32f4xx_rcc.c,374 :: 		case RCC_LSE_ON:
L_RCC_LSEConfig36:
;stm32f4xx_rcc.c,376 :: 		*(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_ON;
MOVS	R2, #1
MOVW	R1, 1073887344
MOVT	R1, 16386
STRB	R2, [R1, #0]
;stm32f4xx_rcc.c,377 :: 		break;
IT	AL
BAL	L_RCC_LSEConfig35
;stm32f4xx_rcc.c,378 :: 		case RCC_LSE_Bypass:
L_RCC_LSEConfig37:
;stm32f4xx_rcc.c,380 :: 		*(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_Bypass | RCC_LSE_ON;
MOVS	R2, #5
MOVW	R1, 1073887344
MOVT	R1, 16386
STRB	R2, [R1, #0]
;stm32f4xx_rcc.c,381 :: 		break;
IT	AL
BAL	L_RCC_LSEConfig35
;stm32f4xx_rcc.c,382 :: 		default:
L_RCC_LSEConfig38:
;stm32f4xx_rcc.c,383 :: 		break;
IT	AL
BAL	L_RCC_LSEConfig35
;stm32f4xx_rcc.c,384 :: 		}
L_RCC_LSEConfig34:
; RCC_LSE start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_RCC_LSEConfig36
CMP	R0, #4
IT	EQ
BEQ	L_RCC_LSEConfig37
; RCC_LSE end address is: 0 (R0)
IT	AL
BAL	L_RCC_LSEConfig38
L_RCC_LSEConfig35:
;stm32f4xx_rcc.c,385 :: 		}
L_end_RCC_LSEConfig:
BX	LR
; end of _RCC_LSEConfig
_RCC_LSICmd:
;stm32f4xx_rcc.c,399 :: 		void RCC_LSICmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_rcc.c,404 :: 		*(__IO uint32_t *) CSR_LSION_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111953024
MOVT	R1, 16967
STR	R2, [R1, #0]
;stm32f4xx_rcc.c,405 :: 		}
L_end_RCC_LSICmd:
BX	LR
; end of _RCC_LSICmd
_RCC_PLLConfig:
;stm32f4xx_rcc.c,442 :: 		void RCC_PLLConfig(uint32_t RCC_PLLSource, uint32_t PLLM, uint32_t PLLN, uint32_t PLLP, uint32_t PLLQ)
; PLLP start address is: 12 (R3)
; PLLN start address is: 8 (R2)
; PLLM start address is: 4 (R1)
; RCC_PLLSource start address is: 0 (R0)
MOV	R5, R2
; PLLP end address is: 12 (R3)
; PLLN end address is: 8 (R2)
; PLLM end address is: 4 (R1)
; RCC_PLLSource end address is: 0 (R0)
; RCC_PLLSource start address is: 0 (R0)
; PLLM start address is: 4 (R1)
; PLLN start address is: 20 (R5)
; PLLP start address is: 12 (R3)
; PLLQ start address is: 8 (R2)
LDR	R2, [SP, #0]
;stm32f4xx_rcc.c,451 :: 		RCC->PLLCFGR = PLLM | (PLLN << 6) | (((PLLP >> 1) -1) << 16) | (RCC_PLLSource) |
LSLS	R4, R5, #6
; PLLN end address is: 20 (R5)
ORR	R5, R1, R4, LSL #0
; PLLM end address is: 4 (R1)
LSRS	R4, R3, #1
; PLLP end address is: 12 (R3)
SUBS	R4, R4, #1
LSLS	R4, R4, #16
ORR	R4, R5, R4, LSL #0
ORR	R5, R4, R0, LSL #0
; RCC_PLLSource end address is: 0 (R0)
;stm32f4xx_rcc.c,452 :: 		(PLLQ << 24);
LSLS	R4, R2, #24
; PLLQ end address is: 8 (R2)
ORRS	R5, R4
MOVW	R4, #14340
MOVT	R4, #16386
STR	R5, [R4, #0]
;stm32f4xx_rcc.c,453 :: 		}
L_end_RCC_PLLConfig:
BX	LR
; end of _RCC_PLLConfig
_RCC_PLLCmd:
;stm32f4xx_rcc.c,465 :: 		void RCC_PLLCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_rcc.c,469 :: 		*(__IO uint32_t *) CR_PLLON_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111949408
MOVT	R1, 16967
STR	R2, [R1, #0]
;stm32f4xx_rcc.c,470 :: 		}
L_end_RCC_PLLCmd:
BX	LR
; end of _RCC_PLLCmd
_RCC_PLLI2SConfig:
;stm32f4xx_rcc.c,491 :: 		void RCC_PLLI2SConfig(uint32_t PLLI2SN, uint32_t PLLI2SR)
; PLLI2SR start address is: 4 (R1)
; PLLI2SN start address is: 0 (R0)
; PLLI2SR end address is: 4 (R1)
; PLLI2SN end address is: 0 (R0)
; PLLI2SN start address is: 0 (R0)
; PLLI2SR start address is: 4 (R1)
;stm32f4xx_rcc.c,497 :: 		RCC->PLLI2SCFGR = (PLLI2SN << 6) | (PLLI2SR << 28);
LSLS	R3, R0, #6
; PLLI2SN end address is: 0 (R0)
LSLS	R2, R1, #28
; PLLI2SR end address is: 4 (R1)
ORRS	R3, R2
MOVW	R2, #14468
MOVT	R2, #16386
STR	R3, [R2, #0]
;stm32f4xx_rcc.c,498 :: 		}
L_end_RCC_PLLI2SConfig:
BX	LR
; end of _RCC_PLLI2SConfig
_RCC_PLLI2SCmd:
;stm32f4xx_rcc.c,506 :: 		void RCC_PLLI2SCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_rcc.c,510 :: 		*(__IO uint32_t *) CR_PLLI2SON_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111949416
MOVT	R1, 16967
STR	R2, [R1, #0]
;stm32f4xx_rcc.c,511 :: 		}
L_end_RCC_PLLI2SCmd:
BX	LR
; end of _RCC_PLLI2SCmd
_RCC_ClockSecuritySystemCmd:
;stm32f4xx_rcc.c,524 :: 		void RCC_ClockSecuritySystemCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_rcc.c,528 :: 		*(__IO uint32_t *) CR_CSSON_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111949388
MOVT	R1, 16967
STR	R2, [R1, #0]
;stm32f4xx_rcc.c,529 :: 		}
L_end_RCC_ClockSecuritySystemCmd:
BX	LR
; end of _RCC_ClockSecuritySystemCmd
_RCC_MCO1Config:
;stm32f4xx_rcc.c,549 :: 		void RCC_MCO1Config(uint32_t RCC_MCO1Source, uint32_t RCC_MCO1Div)
; RCC_MCO1Div start address is: 4 (R1)
; RCC_MCO1Source start address is: 0 (R0)
; RCC_MCO1Div end address is: 4 (R1)
; RCC_MCO1Source end address is: 0 (R0)
; RCC_MCO1Source start address is: 0 (R0)
; RCC_MCO1Div start address is: 4 (R1)
;stm32f4xx_rcc.c,551 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rcc.c,560 :: 		tmpreg &= CFGR_MCO1_RESET_MASK;
MOVW	R4, #14344
MOVT	R4, #16386
LDR	R3, [R4, #0]
MVN	R2, #123731968
ANDS	R3, R2
;stm32f4xx_rcc.c,563 :: 		tmpreg |= RCC_MCO1Source | RCC_MCO1Div;
ORR	R2, R0, R1, LSL #0
; RCC_MCO1Source end address is: 0 (R0)
; RCC_MCO1Div end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_rcc.c,566 :: 		RCC->CFGR = tmpreg;
STR	R2, [R4, #0]
;stm32f4xx_rcc.c,567 :: 		}
L_end_RCC_MCO1Config:
BX	LR
; end of _RCC_MCO1Config
_RCC_MCO2Config:
;stm32f4xx_rcc.c,587 :: 		void RCC_MCO2Config(uint32_t RCC_MCO2Source, uint32_t RCC_MCO2Div)
; RCC_MCO2Div start address is: 4 (R1)
; RCC_MCO2Source start address is: 0 (R0)
; RCC_MCO2Div end address is: 4 (R1)
; RCC_MCO2Source end address is: 0 (R0)
; RCC_MCO2Source start address is: 0 (R0)
; RCC_MCO2Div start address is: 4 (R1)
;stm32f4xx_rcc.c,589 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rcc.c,598 :: 		tmpreg &= CFGR_MCO2_RESET_MASK;
MOVW	R4, #14344
MOVT	R4, #16386
LDR	R3, [R4, #0]
MVN	R2, #-134217728
ANDS	R3, R2
;stm32f4xx_rcc.c,601 :: 		tmpreg |= RCC_MCO2Source | RCC_MCO2Div;
ORR	R2, R0, R1, LSL #0
; RCC_MCO2Source end address is: 0 (R0)
; RCC_MCO2Div end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_rcc.c,604 :: 		RCC->CFGR = tmpreg;
STR	R2, [R4, #0]
;stm32f4xx_rcc.c,605 :: 		}
L_end_RCC_MCO2Config:
BX	LR
; end of _RCC_MCO2Config
_RCC_SYSCLKConfig:
;stm32f4xx_rcc.c,693 :: 		void RCC_SYSCLKConfig(uint32_t RCC_SYSCLKSource)
; RCC_SYSCLKSource start address is: 0 (R0)
; RCC_SYSCLKSource end address is: 0 (R0)
; RCC_SYSCLKSource start address is: 0 (R0)
;stm32f4xx_rcc.c,695 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rcc.c,703 :: 		tmpreg &= ~RCC_CFGR_SW;
MOVW	R3, #14344
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #3
AND	R1, R2, R1, LSL #0
;stm32f4xx_rcc.c,706 :: 		tmpreg |= RCC_SYSCLKSource;
ORRS	R1, R0
; RCC_SYSCLKSource end address is: 0 (R0)
;stm32f4xx_rcc.c,709 :: 		RCC->CFGR = tmpreg;
STR	R1, [R3, #0]
;stm32f4xx_rcc.c,710 :: 		}
L_end_RCC_SYSCLKConfig:
BX	LR
; end of _RCC_SYSCLKConfig
_RCC_GetSYSCLKSource:
;stm32f4xx_rcc.c,721 :: 		uint8_t RCC_GetSYSCLKSource(void)
;stm32f4xx_rcc.c,723 :: 		return ((uint8_t)(RCC->CFGR & RCC_CFGR_SWS));
MOVW	R0, #14344
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #12
UXTB	R0, R0
;stm32f4xx_rcc.c,724 :: 		}
L_end_RCC_GetSYSCLKSource:
BX	LR
; end of _RCC_GetSYSCLKSource
_RCC_HCLKConfig:
;stm32f4xx_rcc.c,746 :: 		void RCC_HCLKConfig(uint32_t RCC_SYSCLK)
; RCC_SYSCLK start address is: 0 (R0)
; RCC_SYSCLK end address is: 0 (R0)
; RCC_SYSCLK start address is: 0 (R0)
;stm32f4xx_rcc.c,748 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rcc.c,756 :: 		tmpreg &= ~RCC_CFGR_HPRE;
MOVW	R3, #14344
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #240
AND	R1, R2, R1, LSL #0
;stm32f4xx_rcc.c,759 :: 		tmpreg |= RCC_SYSCLK;
ORRS	R1, R0
; RCC_SYSCLK end address is: 0 (R0)
;stm32f4xx_rcc.c,762 :: 		RCC->CFGR = tmpreg;
STR	R1, [R3, #0]
;stm32f4xx_rcc.c,763 :: 		}
L_end_RCC_HCLKConfig:
BX	LR
; end of _RCC_HCLKConfig
_RCC_PCLK1Config:
;stm32f4xx_rcc.c,778 :: 		void RCC_PCLK1Config(uint32_t RCC_HCLK)
; RCC_HCLK start address is: 0 (R0)
; RCC_HCLK end address is: 0 (R0)
; RCC_HCLK start address is: 0 (R0)
;stm32f4xx_rcc.c,780 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rcc.c,788 :: 		tmpreg &= ~RCC_CFGR_PPRE1;
MOVW	R3, #14344
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #7168
AND	R1, R2, R1, LSL #0
;stm32f4xx_rcc.c,791 :: 		tmpreg |= RCC_HCLK;
ORRS	R1, R0
; RCC_HCLK end address is: 0 (R0)
;stm32f4xx_rcc.c,794 :: 		RCC->CFGR = tmpreg;
STR	R1, [R3, #0]
;stm32f4xx_rcc.c,795 :: 		}
L_end_RCC_PCLK1Config:
BX	LR
; end of _RCC_PCLK1Config
_RCC_PCLK2Config:
;stm32f4xx_rcc.c,809 :: 		void RCC_PCLK2Config(uint32_t RCC_HCLK)
; RCC_HCLK start address is: 0 (R0)
; RCC_HCLK end address is: 0 (R0)
; RCC_HCLK start address is: 0 (R0)
;stm32f4xx_rcc.c,811 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rcc.c,819 :: 		tmpreg &= ~RCC_CFGR_PPRE2;
MOVW	R3, #14344
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #57344
ANDS	R2, R1
;stm32f4xx_rcc.c,822 :: 		tmpreg |= RCC_HCLK << 3;
LSLS	R1, R0, #3
; RCC_HCLK end address is: 0 (R0)
ORR	R1, R2, R1, LSL #0
;stm32f4xx_rcc.c,825 :: 		RCC->CFGR = tmpreg;
STR	R1, [R3, #0]
;stm32f4xx_rcc.c,826 :: 		}
L_end_RCC_PCLK2Config:
BX	LR
; end of _RCC_PCLK2Config
_RCC_GetClocksFreq:
;stm32f4xx_rcc.c,861 :: 		void RCC_GetClocksFreq(RCC_ClocksTypeDef* RCC_Clocks)
; RCC_Clocks start address is: 0 (R0)
; RCC_Clocks end address is: 0 (R0)
; RCC_Clocks start address is: 0 (R0)
;stm32f4xx_rcc.c,863 :: 		uint32_t tmp = 0, presc = 0, pllvco = 0, pllp = 2, pllsource = 0, pllm = 2;
;stm32f4xx_rcc.c,866 :: 		tmp = RCC->CFGR & RCC_CFGR_SWS;
MOVW	R1, #14344
MOVT	R1, #16386
LDR	R1, [R1, #0]
AND	R1, R1, #12
; tmp start address is: 4 (R1)
;stm32f4xx_rcc.c,868 :: 		switch (tmp)
IT	AL
BAL	L_RCC_GetClocksFreq39
; tmp end address is: 4 (R1)
;stm32f4xx_rcc.c,870 :: 		case 0x00:  /* HSI used as system clock source */
L_RCC_GetClocksFreq41:
;stm32f4xx_rcc.c,871 :: 		RCC_Clocks->SYSCLK_Frequency = HSI_VALUE;
MOVW	R1, #9216
MOVT	R1, #244
STR	R1, [R0, #0]
;stm32f4xx_rcc.c,872 :: 		break;
IT	AL
BAL	L_RCC_GetClocksFreq40
;stm32f4xx_rcc.c,873 :: 		case 0x04:  /* HSE used as system clock  source */
L_RCC_GetClocksFreq42:
;stm32f4xx_rcc.c,874 :: 		RCC_Clocks->SYSCLK_Frequency = HSE_VALUE;
MOVW	R1, #30784
MOVT	R1, #381
STR	R1, [R0, #0]
;stm32f4xx_rcc.c,875 :: 		break;
IT	AL
BAL	L_RCC_GetClocksFreq40
;stm32f4xx_rcc.c,876 :: 		case 0x08:  /* PLL used as system clock  source */
L_RCC_GetClocksFreq43:
;stm32f4xx_rcc.c,881 :: 		pllsource = (RCC->PLLCFGR & RCC_PLLCFGR_PLLSRC) >> 22;
MOVW	R3, #14340
MOVT	R3, #16386
LDR	R1, [R3, #0]
AND	R1, R1, #4194304
LSRS	R2, R1, #22
;stm32f4xx_rcc.c,882 :: 		pllm = RCC->PLLCFGR & RCC_PLLCFGR_PLLM;
MOV	R1, R3
LDR	R1, [R1, #0]
AND	R1, R1, #63
; pllm start address is: 16 (R4)
MOV	R4, R1
;stm32f4xx_rcc.c,884 :: 		if (pllsource != 0)
CMP	R2, #0
IT	EQ
BEQ	L_RCC_GetClocksFreq44
;stm32f4xx_rcc.c,887 :: 		pllvco = (HSE_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);
MOVW	R1, #30784
MOVT	R1, #381
UDIV	R3, R1, R4
; pllm end address is: 16 (R4)
MOVW	R1, #14340
MOVT	R1, #16386
LDR	R2, [R1, #0]
MOVW	R1, #32704
MOVT	R1, #0
AND	R1, R2, R1, LSL #0
LSRS	R1, R1, #6
MUL	R2, R3, R1
; pllvco start address is: 8 (R2)
;stm32f4xx_rcc.c,888 :: 		}
; pllvco end address is: 8 (R2)
IT	AL
BAL	L_RCC_GetClocksFreq45
L_RCC_GetClocksFreq44:
;stm32f4xx_rcc.c,892 :: 		pllvco = (HSI_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);
; pllm start address is: 16 (R4)
MOVW	R1, #9216
MOVT	R1, #244
UDIV	R3, R1, R4
; pllm end address is: 16 (R4)
MOVW	R1, #14340
MOVT	R1, #16386
LDR	R2, [R1, #0]
MOVW	R1, #32704
MOVT	R1, #0
AND	R1, R2, R1, LSL #0
LSRS	R1, R1, #6
MUL	R2, R3, R1
; pllvco start address is: 8 (R2)
; pllvco end address is: 8 (R2)
;stm32f4xx_rcc.c,893 :: 		}
L_RCC_GetClocksFreq45:
;stm32f4xx_rcc.c,895 :: 		pllp = (((RCC->PLLCFGR & RCC_PLLCFGR_PLLP) >>16) + 1 ) *2;
; pllvco start address is: 8 (R2)
MOVW	R1, #14340
MOVT	R1, #16386
LDR	R1, [R1, #0]
AND	R1, R1, #196608
LSRS	R1, R1, #16
ADDS	R1, R1, #1
LSLS	R1, R1, #1
;stm32f4xx_rcc.c,896 :: 		RCC_Clocks->SYSCLK_Frequency = pllvco/pllp;
UDIV	R1, R2, R1
; pllvco end address is: 8 (R2)
STR	R1, [R0, #0]
;stm32f4xx_rcc.c,897 :: 		break;
IT	AL
BAL	L_RCC_GetClocksFreq40
;stm32f4xx_rcc.c,898 :: 		default:
L_RCC_GetClocksFreq46:
;stm32f4xx_rcc.c,899 :: 		RCC_Clocks->SYSCLK_Frequency = HSI_VALUE;
MOVW	R1, #9216
MOVT	R1, #244
STR	R1, [R0, #0]
;stm32f4xx_rcc.c,900 :: 		break;
IT	AL
BAL	L_RCC_GetClocksFreq40
;stm32f4xx_rcc.c,901 :: 		}
L_RCC_GetClocksFreq39:
; tmp start address is: 4 (R1)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_GetClocksFreq41
CMP	R1, #4
IT	EQ
BEQ	L_RCC_GetClocksFreq42
CMP	R1, #8
IT	EQ
BEQ	L_RCC_GetClocksFreq43
; tmp end address is: 4 (R1)
IT	AL
BAL	L_RCC_GetClocksFreq46
L_RCC_GetClocksFreq40:
;stm32f4xx_rcc.c,905 :: 		tmp = RCC->CFGR & RCC_CFGR_HPRE;
MOVW	R3, #14344
MOVT	R3, #16386
LDR	R1, [R3, #0]
AND	R1, R1, #240
;stm32f4xx_rcc.c,906 :: 		tmp = tmp >> 4;
LSRS	R2, R1, #4
;stm32f4xx_rcc.c,907 :: 		presc = APBAHBPrescTable[tmp];
MOVW	R1, #lo_addr(stm32f4xx_rcc_APBAHBPrescTable+0)
MOVT	R1, #hi_addr(stm32f4xx_rcc_APBAHBPrescTable+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
; presc start address is: 16 (R4)
UXTB	R4, R1
;stm32f4xx_rcc.c,909 :: 		RCC_Clocks->HCLK_Frequency = RCC_Clocks->SYSCLK_Frequency >> presc;
ADDS	R2, R0, #4
LDR	R1, [R0, #0]
LSRS	R1, R4
; presc end address is: 16 (R4)
STR	R1, [R2, #0]
;stm32f4xx_rcc.c,912 :: 		tmp = RCC->CFGR & RCC_CFGR_PPRE1;
MOV	R1, R3
LDR	R1, [R1, #0]
AND	R1, R1, #7168
;stm32f4xx_rcc.c,913 :: 		tmp = tmp >> 10;
LSRS	R2, R1, #10
;stm32f4xx_rcc.c,914 :: 		presc = APBAHBPrescTable[tmp];
MOVW	R1, #lo_addr(stm32f4xx_rcc_APBAHBPrescTable+0)
MOVT	R1, #hi_addr(stm32f4xx_rcc_APBAHBPrescTable+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
; presc start address is: 16 (R4)
UXTB	R4, R1
;stm32f4xx_rcc.c,916 :: 		RCC_Clocks->PCLK1_Frequency = RCC_Clocks->HCLK_Frequency >> presc;
ADDW	R2, R0, #8
ADDS	R1, R0, #4
LDR	R1, [R1, #0]
LSRS	R1, R4
; presc end address is: 16 (R4)
STR	R1, [R2, #0]
;stm32f4xx_rcc.c,919 :: 		tmp = RCC->CFGR & RCC_CFGR_PPRE2;
MOV	R1, R3
LDR	R1, [R1, #0]
AND	R1, R1, #57344
;stm32f4xx_rcc.c,920 :: 		tmp = tmp >> 13;
LSRS	R2, R1, #13
;stm32f4xx_rcc.c,921 :: 		presc = APBAHBPrescTable[tmp];
MOVW	R1, #lo_addr(stm32f4xx_rcc_APBAHBPrescTable+0)
MOVT	R1, #hi_addr(stm32f4xx_rcc_APBAHBPrescTable+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
; presc start address is: 12 (R3)
UXTB	R3, R1
;stm32f4xx_rcc.c,923 :: 		RCC_Clocks->PCLK2_Frequency = RCC_Clocks->HCLK_Frequency >> presc;
ADDW	R2, R0, #12
ADDS	R1, R0, #4
; RCC_Clocks end address is: 0 (R0)
LDR	R1, [R1, #0]
LSRS	R1, R3
; presc end address is: 12 (R3)
STR	R1, [R2, #0]
;stm32f4xx_rcc.c,924 :: 		}
L_end_RCC_GetClocksFreq:
BX	LR
; end of _RCC_GetClocksFreq
_RCC_RTCCLKConfig:
;stm32f4xx_rcc.c,986 :: 		void RCC_RTCCLKConfig(uint32_t RCC_RTCCLKSource)
; RCC_RTCCLKSource start address is: 0 (R0)
; RCC_RTCCLKSource end address is: 0 (R0)
; RCC_RTCCLKSource start address is: 0 (R0)
;stm32f4xx_rcc.c,988 :: 		uint32_t tmpreg = 0;
;stm32f4xx_rcc.c,993 :: 		if ((RCC_RTCCLKSource & 0x00000300) == 0x00000300)
AND	R1, R0, #768
CMP	R1, #768
IT	NE
BNE	L_RCC_RTCCLKConfig47
;stm32f4xx_rcc.c,998 :: 		tmpreg &= ~RCC_CFGR_RTCPRE;
MOVW	R3, #14344
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #2031616
ANDS	R2, R1
;stm32f4xx_rcc.c,1001 :: 		tmpreg |= (RCC_RTCCLKSource & 0xFFFFCFF);
MOVW	R1, #64767
MOVT	R1, #4095
AND	R1, R0, R1, LSL #0
ORR	R1, R2, R1, LSL #0
;stm32f4xx_rcc.c,1004 :: 		RCC->CFGR = tmpreg;
STR	R1, [R3, #0]
;stm32f4xx_rcc.c,1005 :: 		}
L_RCC_RTCCLKConfig47:
;stm32f4xx_rcc.c,1008 :: 		RCC->BDCR |= (RCC_RTCCLKSource & 0x00000FFF);
MOVW	R1, #4095
MOVT	R1, #0
AND	R3, R0, R1, LSL #0
; RCC_RTCCLKSource end address is: 0 (R0)
MOVW	R2, #14448
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORRS	R1, R3
STR	R1, [R2, #0]
;stm32f4xx_rcc.c,1009 :: 		}
L_end_RCC_RTCCLKConfig:
BX	LR
; end of _RCC_RTCCLKConfig
_RCC_RTCCLKCmd:
;stm32f4xx_rcc.c,1018 :: 		void RCC_RTCCLKCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_rcc.c,1023 :: 		*(__IO uint32_t *) BDCR_RTCEN_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111952956
MOVT	R1, 16967
STR	R2, [R1, #0]
;stm32f4xx_rcc.c,1024 :: 		}
L_end_RCC_RTCCLKCmd:
BX	LR
; end of _RCC_RTCCLKCmd
_RCC_BackupResetCmd:
;stm32f4xx_rcc.c,1035 :: 		void RCC_BackupResetCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_rcc.c,1039 :: 		*(__IO uint32_t *) BDCR_BDRST_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1111952960
MOVT	R1, 16967
STR	R2, [R1, #0]
;stm32f4xx_rcc.c,1040 :: 		}
L_end_RCC_BackupResetCmd:
BX	LR
; end of _RCC_BackupResetCmd
_RCC_I2SCLKConfig:
;stm32f4xx_rcc.c,1052 :: 		void RCC_I2SCLKConfig(uint32_t RCC_I2SCLKSource)
; RCC_I2SCLKSource start address is: 0 (R0)
; RCC_I2SCLKSource end address is: 0 (R0)
; RCC_I2SCLKSource start address is: 0 (R0)
;stm32f4xx_rcc.c,1057 :: 		*(__IO uint32_t *) CFGR_I2SSRC_BB = RCC_I2SCLKSource;
MOVW	R1, 1111949660
MOVT	R1, 16967
STR	R0, [R1, #0]
; RCC_I2SCLKSource end address is: 0 (R0)
;stm32f4xx_rcc.c,1058 :: 		}
L_end_RCC_I2SCLKConfig:
BX	LR
; end of _RCC_I2SCLKConfig
_RCC_AHB1PeriphClockCmd:
;stm32f4xx_rcc.c,1091 :: 		void RCC_AHB1PeriphClockCmd(uint32_t RCC_AHB1Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_AHB1Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_AHB1Periph end address is: 0 (R0)
; RCC_AHB1Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1097 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_AHB1PeriphClockCmd48
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1099 :: 		RCC->AHB1ENR |= RCC_AHB1Periph;
MOVW	R3, #14384
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_AHB1Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1100 :: 		}
IT	AL
BAL	L_RCC_AHB1PeriphClockCmd49
L_RCC_AHB1PeriphClockCmd48:
;stm32f4xx_rcc.c,1103 :: 		RCC->AHB1ENR &= ~RCC_AHB1Periph;
; RCC_AHB1Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_AHB1Periph end address is: 0 (R0)
MOVW	R3, #14384
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1104 :: 		}
L_RCC_AHB1PeriphClockCmd49:
;stm32f4xx_rcc.c,1105 :: 		}
L_end_RCC_AHB1PeriphClockCmd:
BX	LR
; end of _RCC_AHB1PeriphClockCmd
_RCC_AHB2PeriphClockCmd:
;stm32f4xx_rcc.c,1123 :: 		void RCC_AHB2PeriphClockCmd(uint32_t RCC_AHB2Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_AHB2Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_AHB2Periph end address is: 0 (R0)
; RCC_AHB2Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1129 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_AHB2PeriphClockCmd50
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1131 :: 		RCC->AHB2ENR |= RCC_AHB2Periph;
MOVW	R3, #14388
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_AHB2Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1132 :: 		}
IT	AL
BAL	L_RCC_AHB2PeriphClockCmd51
L_RCC_AHB2PeriphClockCmd50:
;stm32f4xx_rcc.c,1135 :: 		RCC->AHB2ENR &= ~RCC_AHB2Periph;
; RCC_AHB2Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_AHB2Periph end address is: 0 (R0)
MOVW	R3, #14388
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1136 :: 		}
L_RCC_AHB2PeriphClockCmd51:
;stm32f4xx_rcc.c,1137 :: 		}
L_end_RCC_AHB2PeriphClockCmd:
BX	LR
; end of _RCC_AHB2PeriphClockCmd
_RCC_AHB3PeriphClockCmd:
;stm32f4xx_rcc.c,1150 :: 		void RCC_AHB3PeriphClockCmd(uint32_t RCC_AHB3Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_AHB3Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_AHB3Periph end address is: 0 (R0)
; RCC_AHB3Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1156 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_AHB3PeriphClockCmd52
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1158 :: 		RCC->AHB3ENR |= RCC_AHB3Periph;
MOVW	R3, #14392
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_AHB3Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1159 :: 		}
IT	AL
BAL	L_RCC_AHB3PeriphClockCmd53
L_RCC_AHB3PeriphClockCmd52:
;stm32f4xx_rcc.c,1162 :: 		RCC->AHB3ENR &= ~RCC_AHB3Periph;
; RCC_AHB3Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_AHB3Periph end address is: 0 (R0)
MOVW	R3, #14392
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1163 :: 		}
L_RCC_AHB3PeriphClockCmd53:
;stm32f4xx_rcc.c,1164 :: 		}
L_end_RCC_AHB3PeriphClockCmd:
BX	LR
; end of _RCC_AHB3PeriphClockCmd
_RCC_APB1PeriphClockCmd:
;stm32f4xx_rcc.c,1200 :: 		void RCC_APB1PeriphClockCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_APB1Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_APB1Periph end address is: 0 (R0)
; RCC_APB1Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1206 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_APB1PeriphClockCmd54
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1208 :: 		RCC->APB1ENR |= RCC_APB1Periph;
MOVW	R3, #14400
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_APB1Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1209 :: 		}
IT	AL
BAL	L_RCC_APB1PeriphClockCmd55
L_RCC_APB1PeriphClockCmd54:
;stm32f4xx_rcc.c,1212 :: 		RCC->APB1ENR &= ~RCC_APB1Periph;
; RCC_APB1Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_APB1Periph end address is: 0 (R0)
MOVW	R3, #14400
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1213 :: 		}
L_RCC_APB1PeriphClockCmd55:
;stm32f4xx_rcc.c,1214 :: 		}
L_end_RCC_APB1PeriphClockCmd:
BX	LR
; end of _RCC_APB1PeriphClockCmd
_RCC_APB2PeriphClockCmd:
;stm32f4xx_rcc.c,1240 :: 		void RCC_APB2PeriphClockCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_APB2Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_APB2Periph end address is: 0 (R0)
; RCC_APB2Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1246 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_APB2PeriphClockCmd56
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1248 :: 		RCC->APB2ENR |= RCC_APB2Periph;
MOVW	R3, #14404
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_APB2Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1249 :: 		}
IT	AL
BAL	L_RCC_APB2PeriphClockCmd57
L_RCC_APB2PeriphClockCmd56:
;stm32f4xx_rcc.c,1252 :: 		RCC->APB2ENR &= ~RCC_APB2Periph;
; RCC_APB2Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_APB2Periph end address is: 0 (R0)
MOVW	R3, #14404
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1253 :: 		}
L_RCC_APB2PeriphClockCmd57:
;stm32f4xx_rcc.c,1254 :: 		}
L_end_RCC_APB2PeriphClockCmd:
BX	LR
; end of _RCC_APB2PeriphClockCmd
_RCC_AHB1PeriphResetCmd:
;stm32f4xx_rcc.c,1279 :: 		void RCC_AHB1PeriphResetCmd(uint32_t RCC_AHB1Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_AHB1Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_AHB1Periph end address is: 0 (R0)
; RCC_AHB1Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1285 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_AHB1PeriphResetCmd58
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1287 :: 		RCC->AHB1RSTR |= RCC_AHB1Periph;
MOVW	R3, #14352
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_AHB1Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1288 :: 		}
IT	AL
BAL	L_RCC_AHB1PeriphResetCmd59
L_RCC_AHB1PeriphResetCmd58:
;stm32f4xx_rcc.c,1291 :: 		RCC->AHB1RSTR &= ~RCC_AHB1Periph;
; RCC_AHB1Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_AHB1Periph end address is: 0 (R0)
MOVW	R3, #14352
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1292 :: 		}
L_RCC_AHB1PeriphResetCmd59:
;stm32f4xx_rcc.c,1293 :: 		}
L_end_RCC_AHB1PeriphResetCmd:
BX	LR
; end of _RCC_AHB1PeriphResetCmd
_RCC_AHB2PeriphResetCmd:
;stm32f4xx_rcc.c,1308 :: 		void RCC_AHB2PeriphResetCmd(uint32_t RCC_AHB2Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_AHB2Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_AHB2Periph end address is: 0 (R0)
; RCC_AHB2Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1314 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_AHB2PeriphResetCmd60
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1316 :: 		RCC->AHB2RSTR |= RCC_AHB2Periph;
MOVW	R3, #14356
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_AHB2Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1317 :: 		}
IT	AL
BAL	L_RCC_AHB2PeriphResetCmd61
L_RCC_AHB2PeriphResetCmd60:
;stm32f4xx_rcc.c,1320 :: 		RCC->AHB2RSTR &= ~RCC_AHB2Periph;
; RCC_AHB2Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_AHB2Periph end address is: 0 (R0)
MOVW	R3, #14356
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1321 :: 		}
L_RCC_AHB2PeriphResetCmd61:
;stm32f4xx_rcc.c,1322 :: 		}
L_end_RCC_AHB2PeriphResetCmd:
BX	LR
; end of _RCC_AHB2PeriphResetCmd
_RCC_AHB3PeriphResetCmd:
;stm32f4xx_rcc.c,1332 :: 		void RCC_AHB3PeriphResetCmd(uint32_t RCC_AHB3Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_AHB3Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_AHB3Periph end address is: 0 (R0)
; RCC_AHB3Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1338 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_AHB3PeriphResetCmd62
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1340 :: 		RCC->AHB3RSTR |= RCC_AHB3Periph;
MOVW	R3, #14360
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_AHB3Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1341 :: 		}
IT	AL
BAL	L_RCC_AHB3PeriphResetCmd63
L_RCC_AHB3PeriphResetCmd62:
;stm32f4xx_rcc.c,1344 :: 		RCC->AHB3RSTR &= ~RCC_AHB3Periph;
; RCC_AHB3Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_AHB3Periph end address is: 0 (R0)
MOVW	R3, #14360
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1345 :: 		}
L_RCC_AHB3PeriphResetCmd63:
;stm32f4xx_rcc.c,1346 :: 		}
L_end_RCC_AHB3PeriphResetCmd:
BX	LR
; end of _RCC_AHB3PeriphResetCmd
_RCC_APB1PeriphResetCmd:
;stm32f4xx_rcc.c,1379 :: 		void RCC_APB1PeriphResetCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_APB1Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_APB1Periph end address is: 0 (R0)
; RCC_APB1Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1384 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_APB1PeriphResetCmd64
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1386 :: 		RCC->APB1RSTR |= RCC_APB1Periph;
MOVW	R3, #14368
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_APB1Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1387 :: 		}
IT	AL
BAL	L_RCC_APB1PeriphResetCmd65
L_RCC_APB1PeriphResetCmd64:
;stm32f4xx_rcc.c,1390 :: 		RCC->APB1RSTR &= ~RCC_APB1Periph;
; RCC_APB1Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_APB1Periph end address is: 0 (R0)
MOVW	R3, #14368
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1391 :: 		}
L_RCC_APB1PeriphResetCmd65:
;stm32f4xx_rcc.c,1392 :: 		}
L_end_RCC_APB1PeriphResetCmd:
BX	LR
; end of _RCC_APB1PeriphResetCmd
_RCC_APB2PeriphResetCmd:
;stm32f4xx_rcc.c,1415 :: 		void RCC_APB2PeriphResetCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_APB2Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_APB2Periph end address is: 0 (R0)
; RCC_APB2Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1420 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_APB2PeriphResetCmd66
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1422 :: 		RCC->APB2RSTR |= RCC_APB2Periph;
MOVW	R3, #14372
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_APB2Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1423 :: 		}
IT	AL
BAL	L_RCC_APB2PeriphResetCmd67
L_RCC_APB2PeriphResetCmd66:
;stm32f4xx_rcc.c,1426 :: 		RCC->APB2RSTR &= ~RCC_APB2Periph;
; RCC_APB2Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_APB2Periph end address is: 0 (R0)
MOVW	R3, #14372
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1427 :: 		}
L_RCC_APB2PeriphResetCmd67:
;stm32f4xx_rcc.c,1428 :: 		}
L_end_RCC_APB2PeriphResetCmd:
BX	LR
; end of _RCC_APB2PeriphResetCmd
_RCC_AHB1PeriphClockLPModeCmd:
;stm32f4xx_rcc.c,1461 :: 		void RCC_AHB1PeriphClockLPModeCmd(uint32_t RCC_AHB1Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_AHB1Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_AHB1Periph end address is: 0 (R0)
; RCC_AHB1Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1466 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_AHB1PeriphClockLPModeCmd68
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1468 :: 		RCC->AHB1LPENR |= RCC_AHB1Periph;
MOVW	R3, #14416
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_AHB1Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1469 :: 		}
IT	AL
BAL	L_RCC_AHB1PeriphClockLPModeCmd69
L_RCC_AHB1PeriphClockLPModeCmd68:
;stm32f4xx_rcc.c,1472 :: 		RCC->AHB1LPENR &= ~RCC_AHB1Periph;
; RCC_AHB1Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_AHB1Periph end address is: 0 (R0)
MOVW	R3, #14416
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1473 :: 		}
L_RCC_AHB1PeriphClockLPModeCmd69:
;stm32f4xx_rcc.c,1474 :: 		}
L_end_RCC_AHB1PeriphClockLPModeCmd:
BX	LR
; end of _RCC_AHB1PeriphClockLPModeCmd
_RCC_AHB2PeriphClockLPModeCmd:
;stm32f4xx_rcc.c,1493 :: 		void RCC_AHB2PeriphClockLPModeCmd(uint32_t RCC_AHB2Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_AHB2Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_AHB2Periph end address is: 0 (R0)
; RCC_AHB2Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1498 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_AHB2PeriphClockLPModeCmd70
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1500 :: 		RCC->AHB2LPENR |= RCC_AHB2Periph;
MOVW	R3, #14420
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_AHB2Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1501 :: 		}
IT	AL
BAL	L_RCC_AHB2PeriphClockLPModeCmd71
L_RCC_AHB2PeriphClockLPModeCmd70:
;stm32f4xx_rcc.c,1504 :: 		RCC->AHB2LPENR &= ~RCC_AHB2Periph;
; RCC_AHB2Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_AHB2Periph end address is: 0 (R0)
MOVW	R3, #14420
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1505 :: 		}
L_RCC_AHB2PeriphClockLPModeCmd71:
;stm32f4xx_rcc.c,1506 :: 		}
L_end_RCC_AHB2PeriphClockLPModeCmd:
BX	LR
; end of _RCC_AHB2PeriphClockLPModeCmd
_RCC_AHB3PeriphClockLPModeCmd:
;stm32f4xx_rcc.c,1520 :: 		void RCC_AHB3PeriphClockLPModeCmd(uint32_t RCC_AHB3Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_AHB3Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_AHB3Periph end address is: 0 (R0)
; RCC_AHB3Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1525 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_AHB3PeriphClockLPModeCmd72
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1527 :: 		RCC->AHB3LPENR |= RCC_AHB3Periph;
MOVW	R3, #14424
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_AHB3Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1528 :: 		}
IT	AL
BAL	L_RCC_AHB3PeriphClockLPModeCmd73
L_RCC_AHB3PeriphClockLPModeCmd72:
;stm32f4xx_rcc.c,1531 :: 		RCC->AHB3LPENR &= ~RCC_AHB3Periph;
; RCC_AHB3Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_AHB3Periph end address is: 0 (R0)
MOVW	R3, #14424
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1532 :: 		}
L_RCC_AHB3PeriphClockLPModeCmd73:
;stm32f4xx_rcc.c,1533 :: 		}
L_end_RCC_AHB3PeriphClockLPModeCmd:
BX	LR
; end of _RCC_AHB3PeriphClockLPModeCmd
_RCC_APB1PeriphClockLPModeCmd:
;stm32f4xx_rcc.c,1570 :: 		void RCC_APB1PeriphClockLPModeCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_APB1Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_APB1Periph end address is: 0 (R0)
; RCC_APB1Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1575 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_APB1PeriphClockLPModeCmd74
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1577 :: 		RCC->APB1LPENR |= RCC_APB1Periph;
MOVW	R3, #14432
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_APB1Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1578 :: 		}
IT	AL
BAL	L_RCC_APB1PeriphClockLPModeCmd75
L_RCC_APB1PeriphClockLPModeCmd74:
;stm32f4xx_rcc.c,1581 :: 		RCC->APB1LPENR &= ~RCC_APB1Periph;
; RCC_APB1Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_APB1Periph end address is: 0 (R0)
MOVW	R3, #14432
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1582 :: 		}
L_RCC_APB1PeriphClockLPModeCmd75:
;stm32f4xx_rcc.c,1583 :: 		}
L_end_RCC_APB1PeriphClockLPModeCmd:
BX	LR
; end of _RCC_APB1PeriphClockLPModeCmd
_RCC_APB2PeriphClockLPModeCmd:
;stm32f4xx_rcc.c,1610 :: 		void RCC_APB2PeriphClockLPModeCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_APB2Periph start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_APB2Periph end address is: 0 (R0)
; RCC_APB2Periph start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1615 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_APB2PeriphClockLPModeCmd76
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1617 :: 		RCC->APB2LPENR |= RCC_APB2Periph;
MOVW	R3, #14436
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; RCC_APB2Periph end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1618 :: 		}
IT	AL
BAL	L_RCC_APB2PeriphClockLPModeCmd77
L_RCC_APB2PeriphClockLPModeCmd76:
;stm32f4xx_rcc.c,1621 :: 		RCC->APB2LPENR &= ~RCC_APB2Periph;
; RCC_APB2Periph start address is: 0 (R0)
MVN	R4, R0
; RCC_APB2Periph end address is: 0 (R0)
MOVW	R3, #14436
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_rcc.c,1622 :: 		}
L_RCC_APB2PeriphClockLPModeCmd77:
;stm32f4xx_rcc.c,1623 :: 		}
L_end_RCC_APB2PeriphClockLPModeCmd:
BX	LR
; end of _RCC_APB2PeriphClockLPModeCmd
_RCC_ITConfig:
;stm32f4xx_rcc.c,1655 :: 		void RCC_ITConfig(uint8_t RCC_IT, FunctionalState NewState)
; NewState start address is: 4 (R1)
; RCC_IT start address is: 0 (R0)
; NewState end address is: 4 (R1)
; RCC_IT end address is: 0 (R0)
; RCC_IT start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_rcc.c,1660 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_ITConfig78
; NewState end address is: 4 (R1)
;stm32f4xx_rcc.c,1663 :: 		*(__IO uint8_t *) CIR_BYTE2_ADDRESS |= RCC_IT;
MOVW	R2, 1073887245
MOVT	R2, 16386
LDRB	R2, [R2, #0]
ORR	R3, R2, R0, LSL #0
; RCC_IT end address is: 0 (R0)
MOVW	R2, 1073887245
MOVT	R2, 16386
STRB	R3, [R2, #0]
;stm32f4xx_rcc.c,1664 :: 		}
IT	AL
BAL	L_RCC_ITConfig79
L_RCC_ITConfig78:
;stm32f4xx_rcc.c,1668 :: 		*(__IO uint8_t *) CIR_BYTE2_ADDRESS &= (uint8_t)~RCC_IT;
; RCC_IT start address is: 0 (R0)
MVN	R3, R0
UXTB	R3, R3
; RCC_IT end address is: 0 (R0)
MOVW	R2, 1073887245
MOVT	R2, 16386
LDRB	R2, [R2, #0]
AND	R3, R2, R3, LSL #0
MOVW	R2, 1073887245
MOVT	R2, 16386
STRB	R3, [R2, #0]
;stm32f4xx_rcc.c,1669 :: 		}
L_RCC_ITConfig79:
;stm32f4xx_rcc.c,1670 :: 		}
L_end_RCC_ITConfig:
BX	LR
; end of _RCC_ITConfig
_RCC_GetFlagStatus:
;stm32f4xx_rcc.c,1691 :: 		FlagStatus RCC_GetFlagStatus(uint8_t RCC_FLAG)
; RCC_FLAG start address is: 0 (R0)
; RCC_FLAG end address is: 0 (R0)
; RCC_FLAG start address is: 0 (R0)
;stm32f4xx_rcc.c,1693 :: 		uint32_t tmp = 0;
;stm32f4xx_rcc.c,1694 :: 		uint32_t statusreg = 0;
;stm32f4xx_rcc.c,1695 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_rcc.c,1701 :: 		tmp = RCC_FLAG >> 5;
LSRS	R1, R0, #5
UXTB	R1, R1
; tmp start address is: 4 (R1)
;stm32f4xx_rcc.c,1702 :: 		if (tmp == 1)               /* The flag to check is in CR register */
CMP	R1, #1
IT	NE
BNE	L_RCC_GetFlagStatus80
; tmp end address is: 4 (R1)
;stm32f4xx_rcc.c,1704 :: 		statusreg = RCC->CR;
MOVW	R1, #14336
MOVT	R1, #16386
; statusreg start address is: 8 (R2)
LDR	R2, [R1, #0]
;stm32f4xx_rcc.c,1705 :: 		}
; statusreg end address is: 8 (R2)
IT	AL
BAL	L_RCC_GetFlagStatus81
L_RCC_GetFlagStatus80:
;stm32f4xx_rcc.c,1706 :: 		else if (tmp == 2)          /* The flag to check is in BDCR register */
; tmp start address is: 4 (R1)
CMP	R1, #2
IT	NE
BNE	L_RCC_GetFlagStatus82
; tmp end address is: 4 (R1)
;stm32f4xx_rcc.c,1708 :: 		statusreg = RCC->BDCR;
MOVW	R1, #14448
MOVT	R1, #16386
; statusreg start address is: 4 (R1)
LDR	R1, [R1, #0]
;stm32f4xx_rcc.c,1709 :: 		}
MOV	R2, R1
; statusreg end address is: 4 (R1)
IT	AL
BAL	L_RCC_GetFlagStatus83
L_RCC_GetFlagStatus82:
;stm32f4xx_rcc.c,1712 :: 		statusreg = RCC->CSR;
MOVW	R1, #14452
MOVT	R1, #16386
; statusreg start address is: 8 (R2)
LDR	R2, [R1, #0]
; statusreg end address is: 8 (R2)
;stm32f4xx_rcc.c,1713 :: 		}
L_RCC_GetFlagStatus83:
; statusreg start address is: 8 (R2)
; statusreg end address is: 8 (R2)
L_RCC_GetFlagStatus81:
;stm32f4xx_rcc.c,1716 :: 		tmp = RCC_FLAG & FLAG_MASK;
; statusreg start address is: 8 (R2)
AND	R1, R0, #31
UXTB	R1, R1
; RCC_FLAG end address is: 0 (R0)
; tmp start address is: 0 (R0)
UXTB	R0, R1
;stm32f4xx_rcc.c,1717 :: 		if ((statusreg & ((uint32_t)1 << tmp)) != (uint32_t)RESET)
MOV	R1, #1
LSLS	R1, R0
; tmp end address is: 0 (R0)
AND	R1, R2, R1, LSL #0
; statusreg end address is: 8 (R2)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_GetFlagStatus84
;stm32f4xx_rcc.c,1719 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_rcc.c,1720 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_RCC_GetFlagStatus85
L_RCC_GetFlagStatus84:
;stm32f4xx_rcc.c,1723 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_rcc.c,1724 :: 		}
L_RCC_GetFlagStatus85:
;stm32f4xx_rcc.c,1726 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_rcc.c,1727 :: 		}
L_end_RCC_GetFlagStatus:
BX	LR
; end of _RCC_GetFlagStatus
_RCC_ClearFlag:
;stm32f4xx_rcc.c,1736 :: 		void RCC_ClearFlag(void)
;stm32f4xx_rcc.c,1739 :: 		RCC->CSR |= RCC_CSR_RMVF;
MOVW	R1, #14452
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #16777216
STR	R0, [R1, #0]
;stm32f4xx_rcc.c,1740 :: 		}
L_end_RCC_ClearFlag:
BX	LR
; end of _RCC_ClearFlag
_RCC_GetITStatus:
;stm32f4xx_rcc.c,1755 :: 		ITStatus RCC_GetITStatus(uint8_t RCC_IT)
; RCC_IT start address is: 0 (R0)
; RCC_IT end address is: 0 (R0)
; RCC_IT start address is: 0 (R0)
;stm32f4xx_rcc.c,1757 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_rcc.c,1763 :: 		if ((RCC->CIR & RCC_IT) != (uint32_t)RESET)
MOVW	R1, #14348
MOVT	R1, #16386
LDR	R1, [R1, #0]
ANDS	R1, R0
; RCC_IT end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_RCC_GetITStatus86
;stm32f4xx_rcc.c,1765 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_rcc.c,1766 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_RCC_GetITStatus87
L_RCC_GetITStatus86:
;stm32f4xx_rcc.c,1769 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_rcc.c,1770 :: 		}
L_RCC_GetITStatus87:
;stm32f4xx_rcc.c,1772 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_rcc.c,1773 :: 		}
L_end_RCC_GetITStatus:
BX	LR
; end of _RCC_GetITStatus
_RCC_ClearITPendingBit:
;stm32f4xx_rcc.c,1788 :: 		void RCC_ClearITPendingBit(uint8_t RCC_IT)
; RCC_IT start address is: 0 (R0)
; RCC_IT end address is: 0 (R0)
; RCC_IT start address is: 0 (R0)
;stm32f4xx_rcc.c,1795 :: 		*(__IO uint8_t *) CIR_BYTE3_ADDRESS = RCC_IT;
MOVW	R1, 1073887246
MOVT	R1, 16386
STRB	R0, [R1, #0]
; RCC_IT end address is: 0 (R0)
;stm32f4xx_rcc.c,1796 :: 		}
L_end_RCC_ClearITPendingBit:
BX	LR
; end of _RCC_ClearITPendingBit
