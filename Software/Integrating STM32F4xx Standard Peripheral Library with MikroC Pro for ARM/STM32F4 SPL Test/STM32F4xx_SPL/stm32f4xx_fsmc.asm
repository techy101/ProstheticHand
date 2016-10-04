stm32f4xx_fsmc___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_fsmc___DSB
stm32f4xx_fsmc___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_fsmc___WFI
stm32f4xx_fsmc___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_fsmc___WFE
stm32f4xx_fsmc___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_fsmc___REV
stm32f4xx_fsmc_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_fsmc_NVIC_SetPriorityGrouping
stm32f4xx_fsmc_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_fsmc_NVIC_GetPriorityGrouping
stm32f4xx_fsmc_NVIC_EnableIRQ:
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
; end of stm32f4xx_fsmc_NVIC_EnableIRQ
stm32f4xx_fsmc_NVIC_DisableIRQ:
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
; end of stm32f4xx_fsmc_NVIC_DisableIRQ
stm32f4xx_fsmc_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_fsmc_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_fsmc_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_fsmc_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_fsmc_NVIC_GetPendingIRQ1
L_stm32f4xx_fsmc_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_fsmc_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_fsmc_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_fsmc_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_fsmc_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_fsmc_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_fsmc_NVIC_GetPendingIRQ
stm32f4xx_fsmc_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_fsmc_NVIC_SetPendingIRQ
stm32f4xx_fsmc_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_fsmc_NVIC_ClearPendingIRQ
stm32f4xx_fsmc_NVIC_GetActive:
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
BEQ	L_stm32f4xx_fsmc_NVIC_GetActive2
; ?FLOC__stm32f4xx_fsmc_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_fsmc_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_fsmc_NVIC_GetActive3
L_stm32f4xx_fsmc_NVIC_GetActive2:
; ?FLOC__stm32f4xx_fsmc_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_fsmc_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_fsmc_NVIC_GetActive3:
; ?FLOC__stm32f4xx_fsmc_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_fsmc_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_fsmc_NVIC_GetActive
stm32f4xx_fsmc_NVIC_SetPriority:
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
BGE	L_stm32f4xx_fsmc_NVIC_SetPriority4
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
BAL	L_stm32f4xx_fsmc_NVIC_SetPriority5
L_stm32f4xx_fsmc_NVIC_SetPriority4:
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
L_stm32f4xx_fsmc_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_fsmc_NVIC_SetPriority
stm32f4xx_fsmc_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_fsmc_NVIC_GetPriority6
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
L_stm32f4xx_fsmc_NVIC_GetPriority6:
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
; end of stm32f4xx_fsmc_NVIC_GetPriority
stm32f4xx_fsmc_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_fsmc_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_fsmc_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_fsmc_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_fsmc_NVIC_EncodePriority9
L_stm32f4xx_fsmc_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_fsmc_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_fsmc_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_fsmc_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_fsmc_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_fsmc_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_fsmc_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_fsmc_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_fsmc_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_fsmc_NVIC_EncodePriority11
L_stm32f4xx_fsmc_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_fsmc_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_fsmc_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_fsmc_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_fsmc_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_fsmc_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_fsmc_NVIC_EncodePriority
stm32f4xx_fsmc_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_fsmc_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_fsmc_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_fsmc_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_fsmc_NVIC_DecodePriority13
L_stm32f4xx_fsmc_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_fsmc_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_fsmc_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_fsmc_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_fsmc_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_fsmc_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_fsmc_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_fsmc_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_fsmc_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_fsmc_NVIC_DecodePriority15
L_stm32f4xx_fsmc_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_fsmc_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_fsmc_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_fsmc_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_fsmc_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_fsmc_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_fsmc_NVIC_DecodePriority
stm32f4xx_fsmc_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_fsmc___DSB+0
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
BL	stm32f4xx_fsmc___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_fsmc_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_fsmc_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_fsmc_NVIC_SystemReset
stm32f4xx_fsmc_SysTick_Config:
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
BLS	L_stm32f4xx_fsmc_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_fsmc_SysTick_Config18:
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
BL	stm32f4xx_fsmc_NVIC_SetPriority+0
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
; end of stm32f4xx_fsmc_SysTick_Config
stm32f4xx_fsmc_ITM_SendChar:
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
BEQ	L_stm32f4xx_fsmc_ITM_SendChar90
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_fsmc_ITM_SendChar91
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_fsmc_ITM_SendChar92
L_stm32f4xx_fsmc_ITM_SendChar86:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_fsmc_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_fsmc_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_fsmc_ITM_SendChar22
L_stm32f4xx_fsmc_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_fsmc_ITM_SendChar89
L_stm32f4xx_fsmc_ITM_SendChar90:
L_stm32f4xx_fsmc_ITM_SendChar89:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_fsmc_ITM_SendChar88
L_stm32f4xx_fsmc_ITM_SendChar91:
L_stm32f4xx_fsmc_ITM_SendChar88:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_fsmc_ITM_SendChar87
L_stm32f4xx_fsmc_ITM_SendChar92:
L_stm32f4xx_fsmc_ITM_SendChar87:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_fsmc_ITM_SendChar
stm32f4xx_fsmc_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_fsmc_ITM_ReceiveChar24
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
L_stm32f4xx_fsmc_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_fsmc_ITM_ReceiveChar
stm32f4xx_fsmc_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_fsmc_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_fsmc_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_fsmc_ITM_CheckChar
_FSMC_NORSRAMDeInit:
;stm32f4xx_fsmc.c,121 :: 		void FSMC_NORSRAMDeInit(uint32_t FSMC_Bank)
; FSMC_Bank start address is: 0 (R0)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
;stm32f4xx_fsmc.c,127 :: 		if(FSMC_Bank == FSMC_Bank1_NORSRAM1)
CMP	R0, #0
IT	NE
BNE	L_FSMC_NORSRAMDeInit27
;stm32f4xx_fsmc.c,129 :: 		FSMC_Bank1->BTCR[FSMC_Bank] = 0x000030DB;
LSLS	R2, R0, #2
MOVW	R1, #0
MOVT	R1, #40960
ADDS	R2, R1, R2
MOVW	R1, #12507
MOVT	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,130 :: 		}
IT	AL
BAL	L_FSMC_NORSRAMDeInit28
L_FSMC_NORSRAMDeInit27:
;stm32f4xx_fsmc.c,134 :: 		FSMC_Bank1->BTCR[FSMC_Bank] = 0x000030D2;
LSLS	R2, R0, #2
MOVW	R1, #0
MOVT	R1, #40960
ADDS	R2, R1, R2
MOVW	R1, #12498
MOVT	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,135 :: 		}
L_FSMC_NORSRAMDeInit28:
;stm32f4xx_fsmc.c,136 :: 		FSMC_Bank1->BTCR[FSMC_Bank + 1] = 0x0FFFFFFF;
ADDS	R1, R0, #1
LSLS	R2, R1, #2
MOVW	R1, #0
MOVT	R1, #40960
ADDS	R2, R1, R2
MVN	R1, #-268435456
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,137 :: 		FSMC_Bank1E->BWTR[FSMC_Bank] = 0x0FFFFFFF;
LSLS	R2, R0, #2
; FSMC_Bank end address is: 0 (R0)
MOVW	R1, #260
MOVT	R1, #40960
ADDS	R2, R1, R2
MVN	R1, #-268435456
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,138 :: 		}
L_end_FSMC_NORSRAMDeInit:
BX	LR
; end of _FSMC_NORSRAMDeInit
_FSMC_NORSRAMInit:
;stm32f4xx_fsmc.c,148 :: 		void FSMC_NORSRAMInit(FSMC_NORSRAMInitTypeDef* FSMC_NORSRAMInitStruct)
; FSMC_NORSRAMInitStruct start address is: 0 (R0)
; FSMC_NORSRAMInitStruct end address is: 0 (R0)
; FSMC_NORSRAMInitStruct start address is: 0 (R0)
;stm32f4xx_fsmc.c,173 :: 		FSMC_Bank1->BTCR[FSMC_NORSRAMInitStruct->FSMC_Bank] =
LDR	R1, [R0, #0]
LSLS	R2, R1, #2
MOVW	R1, #0
MOVT	R1, #40960
ADDS	R3, R1, R2
;stm32f4xx_fsmc.c,174 :: 		(uint32_t)FSMC_NORSRAMInitStruct->FSMC_DataAddressMux |
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
;stm32f4xx_fsmc.c,175 :: 		FSMC_NORSRAMInitStruct->FSMC_MemoryType |
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,176 :: 		FSMC_NORSRAMInitStruct->FSMC_MemoryDataWidth |
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,177 :: 		FSMC_NORSRAMInitStruct->FSMC_BurstAccessMode |
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,178 :: 		FSMC_NORSRAMInitStruct->FSMC_AsynchronousWait |
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,179 :: 		FSMC_NORSRAMInitStruct->FSMC_WaitSignalPolarity |
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,180 :: 		FSMC_NORSRAMInitStruct->FSMC_WrapMode |
ADDW	R1, R0, #28
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,181 :: 		FSMC_NORSRAMInitStruct->FSMC_WaitSignalActive |
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,182 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteOperation |
ADDW	R1, R0, #36
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,183 :: 		FSMC_NORSRAMInitStruct->FSMC_WaitSignal |
ADDW	R1, R0, #40
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,184 :: 		FSMC_NORSRAMInitStruct->FSMC_ExtendedMode |
ADDW	R1, R0, #44
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,185 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteBurst;
ADDW	R1, R0, #48
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_fsmc.c,186 :: 		if(FSMC_NORSRAMInitStruct->FSMC_MemoryType == FSMC_MemoryType_NOR)
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
CMP	R1, #8
IT	NE
BNE	L_FSMC_NORSRAMInit29
;stm32f4xx_fsmc.c,188 :: 		FSMC_Bank1->BTCR[FSMC_NORSRAMInitStruct->FSMC_Bank] |= (uint32_t)BCR_FACCEN_SET;
LDR	R1, [R0, #0]
LSLS	R2, R1, #2
MOVW	R1, #0
MOVT	R1, #40960
ADDS	R2, R1, R2
LDR	R1, [R2, #0]
ORR	R1, R1, #64
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,189 :: 		}
L_FSMC_NORSRAMInit29:
;stm32f4xx_fsmc.c,191 :: 		FSMC_Bank1->BTCR[FSMC_NORSRAMInitStruct->FSMC_Bank+1] =
LDR	R1, [R0, #0]
ADDS	R1, R1, #1
LSLS	R2, R1, #2
MOVW	R1, #0
MOVT	R1, #40960
ADDS	R4, R1, R2
;stm32f4xx_fsmc.c,192 :: 		(uint32_t)FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_AddressSetupTime |
ADDW	R1, R0, #52
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f4xx_fsmc.c,193 :: 		(FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_AddressHoldTime << 4) |
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #4
ORRS	R2, R1
;stm32f4xx_fsmc.c,194 :: 		(FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_DataSetupTime << 8) |
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f4xx_fsmc.c,195 :: 		(FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_BusTurnAroundDuration << 16) |
ADDW	R1, R3, #12
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R2, R1
;stm32f4xx_fsmc.c,196 :: 		(FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_CLKDivision << 20) |
ADDW	R1, R3, #16
LDR	R1, [R1, #0]
LSLS	R1, R1, #20
ORRS	R2, R1
;stm32f4xx_fsmc.c,197 :: 		(FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_DataLatency << 24) |
ADDW	R1, R3, #20
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORRS	R2, R1
;stm32f4xx_fsmc.c,198 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_AccessMode;
ADDW	R1, R3, #24
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
STR	R1, [R4, #0]
;stm32f4xx_fsmc.c,202 :: 		if(FSMC_NORSRAMInitStruct->FSMC_ExtendedMode == FSMC_ExtendedMode_Enable)
ADDW	R1, R0, #44
LDR	R1, [R1, #0]
CMP	R1, #16384
IT	NE
BNE	L_FSMC_NORSRAMInit30
;stm32f4xx_fsmc.c,210 :: 		FSMC_Bank1E->BWTR[FSMC_NORSRAMInitStruct->FSMC_Bank] =
LDR	R1, [R0, #0]
LSLS	R2, R1, #2
MOVW	R1, #260
MOVT	R1, #40960
ADDS	R4, R1, R2
;stm32f4xx_fsmc.c,211 :: 		(uint32_t)FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_AddressSetupTime |
ADDW	R1, R0, #56
; FSMC_NORSRAMInitStruct end address is: 0 (R0)
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f4xx_fsmc.c,212 :: 		(FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_AddressHoldTime << 4 )|
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #4
ORRS	R2, R1
;stm32f4xx_fsmc.c,213 :: 		(FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_DataSetupTime << 8) |
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f4xx_fsmc.c,214 :: 		(FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_CLKDivision << 20) |
ADDW	R1, R3, #16
LDR	R1, [R1, #0]
LSLS	R1, R1, #20
ORRS	R2, R1
;stm32f4xx_fsmc.c,215 :: 		(FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_DataLatency << 24) |
ADDW	R1, R3, #20
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORRS	R2, R1
;stm32f4xx_fsmc.c,216 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_AccessMode;
ADDW	R1, R3, #24
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
STR	R1, [R4, #0]
;stm32f4xx_fsmc.c,217 :: 		}
IT	AL
BAL	L_FSMC_NORSRAMInit31
L_FSMC_NORSRAMInit30:
;stm32f4xx_fsmc.c,220 :: 		FSMC_Bank1E->BWTR[FSMC_NORSRAMInitStruct->FSMC_Bank] = 0x0FFFFFFF;
; FSMC_NORSRAMInitStruct start address is: 0 (R0)
LDR	R1, [R0, #0]
; FSMC_NORSRAMInitStruct end address is: 0 (R0)
LSLS	R2, R1, #2
MOVW	R1, #260
MOVT	R1, #40960
ADDS	R2, R1, R2
MVN	R1, #-268435456
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,221 :: 		}
L_FSMC_NORSRAMInit31:
;stm32f4xx_fsmc.c,222 :: 		}
L_end_FSMC_NORSRAMInit:
BX	LR
; end of _FSMC_NORSRAMInit
_FSMC_NORSRAMStructInit:
;stm32f4xx_fsmc.c,230 :: 		void FSMC_NORSRAMStructInit(FSMC_NORSRAMInitTypeDef* FSMC_NORSRAMInitStruct)
; FSMC_NORSRAMInitStruct start address is: 0 (R0)
; FSMC_NORSRAMInitStruct end address is: 0 (R0)
; FSMC_NORSRAMInitStruct start address is: 0 (R0)
;stm32f4xx_fsmc.c,233 :: 		FSMC_NORSRAMInitStruct->FSMC_Bank = FSMC_Bank1_NORSRAM1;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_fsmc.c,234 :: 		FSMC_NORSRAMInitStruct->FSMC_DataAddressMux = FSMC_DataAddressMux_Enable;
ADDS	R2, R0, #4
MOV	R1, #2
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,235 :: 		FSMC_NORSRAMInitStruct->FSMC_MemoryType = FSMC_MemoryType_SRAM;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,236 :: 		FSMC_NORSRAMInitStruct->FSMC_MemoryDataWidth = FSMC_MemoryDataWidth_8b;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,237 :: 		FSMC_NORSRAMInitStruct->FSMC_BurstAccessMode = FSMC_BurstAccessMode_Disable;
ADDW	R2, R0, #16
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,238 :: 		FSMC_NORSRAMInitStruct->FSMC_AsynchronousWait = FSMC_AsynchronousWait_Disable;
ADDW	R2, R0, #20
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,239 :: 		FSMC_NORSRAMInitStruct->FSMC_WaitSignalPolarity = FSMC_WaitSignalPolarity_Low;
ADDW	R2, R0, #24
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,240 :: 		FSMC_NORSRAMInitStruct->FSMC_WrapMode = FSMC_WrapMode_Disable;
ADDW	R2, R0, #28
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,241 :: 		FSMC_NORSRAMInitStruct->FSMC_WaitSignalActive = FSMC_WaitSignalActive_BeforeWaitState;
ADDW	R2, R0, #32
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,242 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteOperation = FSMC_WriteOperation_Enable;
ADDW	R2, R0, #36
MOV	R1, #4096
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,243 :: 		FSMC_NORSRAMInitStruct->FSMC_WaitSignal = FSMC_WaitSignal_Enable;
ADDW	R2, R0, #40
MOV	R1, #8192
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,244 :: 		FSMC_NORSRAMInitStruct->FSMC_ExtendedMode = FSMC_ExtendedMode_Disable;
ADDW	R2, R0, #44
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,245 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteBurst = FSMC_WriteBurst_Disable;
ADDW	R2, R0, #48
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,246 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_AddressSetupTime = 0xF;
ADDW	R1, R0, #52
LDR	R2, [R1, #0]
MOV	R1, #15
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,247 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_AddressHoldTime = 0xF;
ADDW	R1, R0, #52
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOV	R1, #15
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,248 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_DataSetupTime = 0xFF;
ADDW	R1, R0, #52
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOV	R1, #255
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,249 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_BusTurnAroundDuration = 0xF;
ADDW	R1, R0, #52
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOV	R1, #15
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,250 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_CLKDivision = 0xF;
ADDW	R1, R0, #52
LDR	R1, [R1, #0]
ADDW	R2, R1, #16
MOV	R1, #15
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,251 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_DataLatency = 0xF;
ADDW	R1, R0, #52
LDR	R1, [R1, #0]
ADDW	R2, R1, #20
MOV	R1, #15
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,252 :: 		FSMC_NORSRAMInitStruct->FSMC_ReadWriteTimingStruct->FSMC_AccessMode = FSMC_AccessMode_A;
ADDW	R1, R0, #52
LDR	R1, [R1, #0]
ADDW	R2, R1, #24
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,253 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_AddressSetupTime = 0xF;
ADDW	R1, R0, #56
LDR	R2, [R1, #0]
MOV	R1, #15
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,254 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_AddressHoldTime = 0xF;
ADDW	R1, R0, #56
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOV	R1, #15
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,255 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_DataSetupTime = 0xFF;
ADDW	R1, R0, #56
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOV	R1, #255
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,256 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_BusTurnAroundDuration = 0xF;
ADDW	R1, R0, #56
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOV	R1, #15
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,257 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_CLKDivision = 0xF;
ADDW	R1, R0, #56
LDR	R1, [R1, #0]
ADDW	R2, R1, #16
MOV	R1, #15
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,258 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_DataLatency = 0xF;
ADDW	R1, R0, #56
LDR	R1, [R1, #0]
ADDW	R2, R1, #20
MOV	R1, #15
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,259 :: 		FSMC_NORSRAMInitStruct->FSMC_WriteTimingStruct->FSMC_AccessMode = FSMC_AccessMode_A;
ADDW	R1, R0, #56
; FSMC_NORSRAMInitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ADDW	R2, R1, #24
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,260 :: 		}
L_end_FSMC_NORSRAMStructInit:
BX	LR
; end of _FSMC_NORSRAMStructInit
_FSMC_NORSRAMCmd:
;stm32f4xx_fsmc.c,273 :: 		void FSMC_NORSRAMCmd(uint32_t FSMC_Bank, FunctionalState NewState)
; NewState start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; NewState end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_fsmc.c,278 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_FSMC_NORSRAMCmd32
; NewState end address is: 4 (R1)
;stm32f4xx_fsmc.c,281 :: 		FSMC_Bank1->BTCR[FSMC_Bank] |= BCR_MBKEN_SET;
LSLS	R3, R0, #2
; FSMC_Bank end address is: 0 (R0)
MOVW	R2, #0
MOVT	R2, #40960
ADDS	R3, R2, R3
LDR	R2, [R3, #0]
ORR	R2, R2, #1
STR	R2, [R3, #0]
;stm32f4xx_fsmc.c,282 :: 		}
IT	AL
BAL	L_FSMC_NORSRAMCmd33
L_FSMC_NORSRAMCmd32:
;stm32f4xx_fsmc.c,286 :: 		FSMC_Bank1->BTCR[FSMC_Bank] &= BCR_MBKEN_RESET;
; FSMC_Bank start address is: 0 (R0)
LSLS	R3, R0, #2
; FSMC_Bank end address is: 0 (R0)
MOVW	R2, #0
MOVT	R2, #40960
ADDS	R4, R2, R3
LDR	R3, [R4, #0]
MOVW	R2, #65534
MOVT	R2, #15
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_fsmc.c,287 :: 		}
L_FSMC_NORSRAMCmd33:
;stm32f4xx_fsmc.c,288 :: 		}
L_end_FSMC_NORSRAMCmd:
BX	LR
; end of _FSMC_NORSRAMCmd
_FSMC_NANDDeInit:
;stm32f4xx_fsmc.c,344 :: 		void FSMC_NANDDeInit(uint32_t FSMC_Bank)
; FSMC_Bank start address is: 0 (R0)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
;stm32f4xx_fsmc.c,349 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_NANDDeInit34
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,352 :: 		FSMC_Bank2->PCR2 = 0x00000018;
MOV	R2, #24
MOVW	R1, #96
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f4xx_fsmc.c,353 :: 		FSMC_Bank2->SR2 = 0x00000040;
MOV	R2, #64
MOVW	R1, #100
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f4xx_fsmc.c,354 :: 		FSMC_Bank2->PMEM2 = 0xFCFCFCFC;
MOV	R2, #-50529028
MOVW	R1, #104
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f4xx_fsmc.c,355 :: 		FSMC_Bank2->PATT2 = 0xFCFCFCFC;
MOV	R2, #-50529028
MOVW	R1, #108
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f4xx_fsmc.c,356 :: 		}
IT	AL
BAL	L_FSMC_NANDDeInit35
L_FSMC_NANDDeInit34:
;stm32f4xx_fsmc.c,361 :: 		FSMC_Bank3->PCR3 = 0x00000018;
MOV	R2, #24
MOVW	R1, #128
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f4xx_fsmc.c,362 :: 		FSMC_Bank3->SR3 = 0x00000040;
MOV	R2, #64
MOVW	R1, #132
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f4xx_fsmc.c,363 :: 		FSMC_Bank3->PMEM3 = 0xFCFCFCFC;
MOV	R2, #-50529028
MOVW	R1, #136
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f4xx_fsmc.c,364 :: 		FSMC_Bank3->PATT3 = 0xFCFCFCFC;
MOV	R2, #-50529028
MOVW	R1, #140
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f4xx_fsmc.c,365 :: 		}
L_FSMC_NANDDeInit35:
;stm32f4xx_fsmc.c,366 :: 		}
L_end_FSMC_NANDDeInit:
BX	LR
; end of _FSMC_NANDDeInit
_FSMC_NANDInit:
;stm32f4xx_fsmc.c,375 :: 		void FSMC_NANDInit(FSMC_NANDInitTypeDef* FSMC_NANDInitStruct)
; FSMC_NANDInitStruct start address is: 0 (R0)
; FSMC_NANDInitStruct end address is: 0 (R0)
; FSMC_NANDInitStruct start address is: 0 (R0)
;stm32f4xx_fsmc.c,377 :: 		uint32_t tmppcr = 0x00000000, tmppmem = 0x00000000, tmppatt = 0x00000000;
;stm32f4xx_fsmc.c,397 :: 		tmppcr = (uint32_t)FSMC_NANDInitStruct->FSMC_Waitfeature |
ADDS	R1, R0, #4
LDR	R1, [R1, #0]
;stm32f4xx_fsmc.c,398 :: 		PCR_MEMORYTYPE_NAND |
ORR	R2, R1, #8
;stm32f4xx_fsmc.c,399 :: 		FSMC_NANDInitStruct->FSMC_MemoryDataWidth |
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,400 :: 		FSMC_NANDInitStruct->FSMC_ECC |
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,401 :: 		FSMC_NANDInitStruct->FSMC_ECCPageSize |
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_fsmc.c,402 :: 		(FSMC_NANDInitStruct->FSMC_TCLRSetupTime << 9 )|
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
LSLS	R1, R1, #9
ORRS	R2, R1
;stm32f4xx_fsmc.c,403 :: 		(FSMC_NANDInitStruct->FSMC_TARSetupTime << 13);
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
LSLS	R1, R1, #13
ORR	R1, R2, R1, LSL #0
; tmppcr start address is: 16 (R4)
MOV	R4, R1
;stm32f4xx_fsmc.c,406 :: 		tmppmem = (uint32_t)FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_SetupTime |
ADDW	R1, R0, #28
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f4xx_fsmc.c,407 :: 		(FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_WaitSetupTime << 8) |
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f4xx_fsmc.c,408 :: 		(FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HoldSetupTime << 16)|
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R2, R1
;stm32f4xx_fsmc.c,409 :: 		(FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HiZSetupTime << 24);
ADDW	R1, R3, #12
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORR	R1, R2, R1, LSL #0
; tmppmem start address is: 20 (R5)
MOV	R5, R1
;stm32f4xx_fsmc.c,412 :: 		tmppatt = (uint32_t)FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_SetupTime |
ADDW	R1, R0, #32
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f4xx_fsmc.c,413 :: 		(FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_WaitSetupTime << 8) |
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f4xx_fsmc.c,414 :: 		(FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HoldSetupTime << 16)|
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R2, R1
;stm32f4xx_fsmc.c,415 :: 		(FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HiZSetupTime << 24);
ADDW	R1, R3, #12
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORR	R1, R2, R1, LSL #0
; tmppatt start address is: 8 (R2)
MOV	R2, R1
;stm32f4xx_fsmc.c,417 :: 		if(FSMC_NANDInitStruct->FSMC_Bank == FSMC_Bank2_NAND)
LDR	R1, [R0, #0]
; FSMC_NANDInitStruct end address is: 0 (R0)
CMP	R1, #16
IT	NE
BNE	L_FSMC_NANDInit36
;stm32f4xx_fsmc.c,420 :: 		FSMC_Bank2->PCR2 = tmppcr;
MOVW	R1, #96
MOVT	R1, #40960
STR	R4, [R1, #0]
; tmppcr end address is: 16 (R4)
;stm32f4xx_fsmc.c,421 :: 		FSMC_Bank2->PMEM2 = tmppmem;
MOVW	R1, #104
MOVT	R1, #40960
STR	R5, [R1, #0]
; tmppmem end address is: 20 (R5)
;stm32f4xx_fsmc.c,422 :: 		FSMC_Bank2->PATT2 = tmppatt;
MOVW	R1, #108
MOVT	R1, #40960
STR	R2, [R1, #0]
; tmppatt end address is: 8 (R2)
;stm32f4xx_fsmc.c,423 :: 		}
IT	AL
BAL	L_FSMC_NANDInit37
L_FSMC_NANDInit36:
;stm32f4xx_fsmc.c,427 :: 		FSMC_Bank3->PCR3 = tmppcr;
; tmppatt start address is: 8 (R2)
; tmppmem start address is: 20 (R5)
; tmppcr start address is: 16 (R4)
MOVW	R1, #128
MOVT	R1, #40960
STR	R4, [R1, #0]
; tmppcr end address is: 16 (R4)
;stm32f4xx_fsmc.c,428 :: 		FSMC_Bank3->PMEM3 = tmppmem;
MOVW	R1, #136
MOVT	R1, #40960
STR	R5, [R1, #0]
; tmppmem end address is: 20 (R5)
;stm32f4xx_fsmc.c,429 :: 		FSMC_Bank3->PATT3 = tmppatt;
MOVW	R1, #140
MOVT	R1, #40960
STR	R2, [R1, #0]
; tmppatt end address is: 8 (R2)
;stm32f4xx_fsmc.c,430 :: 		}
L_FSMC_NANDInit37:
;stm32f4xx_fsmc.c,431 :: 		}
L_end_FSMC_NANDInit:
BX	LR
; end of _FSMC_NANDInit
_FSMC_NANDStructInit:
;stm32f4xx_fsmc.c,440 :: 		void FSMC_NANDStructInit(FSMC_NANDInitTypeDef* FSMC_NANDInitStruct)
; FSMC_NANDInitStruct start address is: 0 (R0)
; FSMC_NANDInitStruct end address is: 0 (R0)
; FSMC_NANDInitStruct start address is: 0 (R0)
;stm32f4xx_fsmc.c,443 :: 		FSMC_NANDInitStruct->FSMC_Bank = FSMC_Bank2_NAND;
MOV	R1, #16
STR	R1, [R0, #0]
;stm32f4xx_fsmc.c,444 :: 		FSMC_NANDInitStruct->FSMC_Waitfeature = FSMC_Waitfeature_Disable;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,445 :: 		FSMC_NANDInitStruct->FSMC_MemoryDataWidth = FSMC_MemoryDataWidth_8b;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,446 :: 		FSMC_NANDInitStruct->FSMC_ECC = FSMC_ECC_Disable;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,447 :: 		FSMC_NANDInitStruct->FSMC_ECCPageSize = FSMC_ECCPageSize_256Bytes;
ADDW	R2, R0, #16
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,448 :: 		FSMC_NANDInitStruct->FSMC_TCLRSetupTime = 0x0;
ADDW	R2, R0, #20
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,449 :: 		FSMC_NANDInitStruct->FSMC_TARSetupTime = 0x0;
ADDW	R2, R0, #24
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,450 :: 		FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_SetupTime = 0xFC;
ADDW	R1, R0, #28
LDR	R2, [R1, #0]
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,451 :: 		FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_WaitSetupTime = 0xFC;
ADDW	R1, R0, #28
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,452 :: 		FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HoldSetupTime = 0xFC;
ADDW	R1, R0, #28
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,453 :: 		FSMC_NANDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HiZSetupTime = 0xFC;
ADDW	R1, R0, #28
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,454 :: 		FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_SetupTime = 0xFC;
ADDW	R1, R0, #32
LDR	R2, [R1, #0]
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,455 :: 		FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_WaitSetupTime = 0xFC;
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,456 :: 		FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HoldSetupTime = 0xFC;
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,457 :: 		FSMC_NANDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HiZSetupTime = 0xFC;
ADDW	R1, R0, #32
; FSMC_NANDInitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,458 :: 		}
L_end_FSMC_NANDStructInit:
BX	LR
; end of _FSMC_NANDStructInit
_FSMC_NANDCmd:
;stm32f4xx_fsmc.c,469 :: 		void FSMC_NANDCmd(uint32_t FSMC_Bank, FunctionalState NewState)
; NewState start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; NewState end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_fsmc.c,474 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_FSMC_NANDCmd38
; NewState end address is: 4 (R1)
;stm32f4xx_fsmc.c,477 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_NANDCmd39
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,479 :: 		FSMC_Bank2->PCR2 |= PCR_PBKEN_SET;
MOVW	R3, #96
MOVT	R3, #40960
LDR	R2, [R3, #0]
ORR	R2, R2, #4
STR	R2, [R3, #0]
;stm32f4xx_fsmc.c,480 :: 		}
IT	AL
BAL	L_FSMC_NANDCmd40
L_FSMC_NANDCmd39:
;stm32f4xx_fsmc.c,483 :: 		FSMC_Bank3->PCR3 |= PCR_PBKEN_SET;
MOVW	R3, #128
MOVT	R3, #40960
LDR	R2, [R3, #0]
ORR	R2, R2, #4
STR	R2, [R3, #0]
;stm32f4xx_fsmc.c,484 :: 		}
L_FSMC_NANDCmd40:
;stm32f4xx_fsmc.c,485 :: 		}
IT	AL
BAL	L_FSMC_NANDCmd41
L_FSMC_NANDCmd38:
;stm32f4xx_fsmc.c,489 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #16
IT	NE
BNE	L_FSMC_NANDCmd42
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,491 :: 		FSMC_Bank2->PCR2 &= PCR_PBKEN_RESET;
MOVW	R4, #96
MOVT	R4, #40960
LDR	R3, [R4, #0]
MOVW	R2, #65531
MOVT	R2, #15
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_fsmc.c,492 :: 		}
IT	AL
BAL	L_FSMC_NANDCmd43
L_FSMC_NANDCmd42:
;stm32f4xx_fsmc.c,495 :: 		FSMC_Bank3->PCR3 &= PCR_PBKEN_RESET;
MOVW	R4, #128
MOVT	R4, #40960
LDR	R3, [R4, #0]
MOVW	R2, #65531
MOVT	R2, #15
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_fsmc.c,496 :: 		}
L_FSMC_NANDCmd43:
;stm32f4xx_fsmc.c,497 :: 		}
L_FSMC_NANDCmd41:
;stm32f4xx_fsmc.c,498 :: 		}
L_end_FSMC_NANDCmd:
BX	LR
; end of _FSMC_NANDCmd
_FSMC_NANDECCCmd:
;stm32f4xx_fsmc.c,509 :: 		void FSMC_NANDECCCmd(uint32_t FSMC_Bank, FunctionalState NewState)
; NewState start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; NewState end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_fsmc.c,514 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_FSMC_NANDECCCmd44
; NewState end address is: 4 (R1)
;stm32f4xx_fsmc.c,517 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_NANDECCCmd45
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,519 :: 		FSMC_Bank2->PCR2 |= PCR_ECCEN_SET;
MOVW	R3, #96
MOVT	R3, #40960
LDR	R2, [R3, #0]
ORR	R2, R2, #64
STR	R2, [R3, #0]
;stm32f4xx_fsmc.c,520 :: 		}
IT	AL
BAL	L_FSMC_NANDECCCmd46
L_FSMC_NANDECCCmd45:
;stm32f4xx_fsmc.c,523 :: 		FSMC_Bank3->PCR3 |= PCR_ECCEN_SET;
MOVW	R3, #128
MOVT	R3, #40960
LDR	R2, [R3, #0]
ORR	R2, R2, #64
STR	R2, [R3, #0]
;stm32f4xx_fsmc.c,524 :: 		}
L_FSMC_NANDECCCmd46:
;stm32f4xx_fsmc.c,525 :: 		}
IT	AL
BAL	L_FSMC_NANDECCCmd47
L_FSMC_NANDECCCmd44:
;stm32f4xx_fsmc.c,529 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #16
IT	NE
BNE	L_FSMC_NANDECCCmd48
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,531 :: 		FSMC_Bank2->PCR2 &= PCR_ECCEN_RESET;
MOVW	R4, #96
MOVT	R4, #40960
LDR	R3, [R4, #0]
MOVW	R2, #65471
MOVT	R2, #15
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_fsmc.c,532 :: 		}
IT	AL
BAL	L_FSMC_NANDECCCmd49
L_FSMC_NANDECCCmd48:
;stm32f4xx_fsmc.c,535 :: 		FSMC_Bank3->PCR3 &= PCR_ECCEN_RESET;
MOVW	R4, #128
MOVT	R4, #40960
LDR	R3, [R4, #0]
MOVW	R2, #65471
MOVT	R2, #15
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_fsmc.c,536 :: 		}
L_FSMC_NANDECCCmd49:
;stm32f4xx_fsmc.c,537 :: 		}
L_FSMC_NANDECCCmd47:
;stm32f4xx_fsmc.c,538 :: 		}
L_end_FSMC_NANDECCCmd:
BX	LR
; end of _FSMC_NANDECCCmd
_FSMC_GetECC:
;stm32f4xx_fsmc.c,548 :: 		uint32_t FSMC_GetECC(uint32_t FSMC_Bank)
; FSMC_Bank start address is: 0 (R0)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
;stm32f4xx_fsmc.c,550 :: 		uint32_t eccval = 0x00000000;
;stm32f4xx_fsmc.c,552 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_GetECC50
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,555 :: 		eccval = FSMC_Bank2->ECCR2;
MOVW	R1, #116
MOVT	R1, #40960
; eccval start address is: 0 (R0)
LDR	R0, [R1, #0]
;stm32f4xx_fsmc.c,556 :: 		}
; eccval end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetECC51
L_FSMC_GetECC50:
;stm32f4xx_fsmc.c,560 :: 		eccval = FSMC_Bank3->ECCR3;
MOVW	R1, #148
MOVT	R1, #40960
; eccval start address is: 0 (R0)
LDR	R0, [R1, #0]
; eccval end address is: 0 (R0)
;stm32f4xx_fsmc.c,561 :: 		}
L_FSMC_GetECC51:
;stm32f4xx_fsmc.c,563 :: 		return(eccval);
; eccval start address is: 0 (R0)
; eccval end address is: 0 (R0)
;stm32f4xx_fsmc.c,564 :: 		}
L_end_FSMC_GetECC:
BX	LR
; end of _FSMC_GetECC
_FSMC_PCCARDDeInit:
;stm32f4xx_fsmc.c,612 :: 		void FSMC_PCCARDDeInit(void)
;stm32f4xx_fsmc.c,615 :: 		FSMC_Bank4->PCR4 = 0x00000018;
MOV	R1, #24
MOVW	R0, #160
MOVT	R0, #40960
STR	R1, [R0, #0]
;stm32f4xx_fsmc.c,616 :: 		FSMC_Bank4->SR4 = 0x00000000;
MOV	R1, #0
MOVW	R0, #164
MOVT	R0, #40960
STR	R1, [R0, #0]
;stm32f4xx_fsmc.c,617 :: 		FSMC_Bank4->PMEM4 = 0xFCFCFCFC;
MOV	R1, #-50529028
MOVW	R0, #168
MOVT	R0, #40960
STR	R1, [R0, #0]
;stm32f4xx_fsmc.c,618 :: 		FSMC_Bank4->PATT4 = 0xFCFCFCFC;
MOV	R1, #-50529028
MOVW	R0, #172
MOVT	R0, #40960
STR	R1, [R0, #0]
;stm32f4xx_fsmc.c,619 :: 		FSMC_Bank4->PIO4 = 0xFCFCFCFC;
MOV	R1, #-50529028
MOVW	R0, #176
MOVT	R0, #40960
STR	R1, [R0, #0]
;stm32f4xx_fsmc.c,620 :: 		}
L_end_FSMC_PCCARDDeInit:
BX	LR
; end of _FSMC_PCCARDDeInit
_FSMC_PCCARDInit:
;stm32f4xx_fsmc.c,629 :: 		void FSMC_PCCARDInit(FSMC_PCCARDInitTypeDef* FSMC_PCCARDInitStruct)
; FSMC_PCCARDInitStruct start address is: 0 (R0)
; FSMC_PCCARDInitStruct end address is: 0 (R0)
; FSMC_PCCARDInitStruct start address is: 0 (R0)
;stm32f4xx_fsmc.c,651 :: 		FSMC_Bank4->PCR4 = (uint32_t)FSMC_PCCARDInitStruct->FSMC_Waitfeature |
LDR	R1, [R0, #0]
;stm32f4xx_fsmc.c,652 :: 		FSMC_MemoryDataWidth_16b |
ORR	R2, R1, #16
;stm32f4xx_fsmc.c,653 :: 		(FSMC_PCCARDInitStruct->FSMC_TCLRSetupTime << 9) |
ADDS	R1, R0, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #9
ORRS	R2, R1
;stm32f4xx_fsmc.c,654 :: 		(FSMC_PCCARDInitStruct->FSMC_TARSetupTime << 13);
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #13
ORRS	R2, R1
MOVW	R1, #160
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f4xx_fsmc.c,657 :: 		FSMC_Bank4->PMEM4 = (uint32_t)FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_SetupTime |
ADDW	R1, R0, #12
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f4xx_fsmc.c,658 :: 		(FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_WaitSetupTime << 8) |
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f4xx_fsmc.c,659 :: 		(FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HoldSetupTime << 16)|
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R2, R1
;stm32f4xx_fsmc.c,660 :: 		(FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HiZSetupTime << 24);
ADDW	R1, R3, #12
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORRS	R2, R1
MOVW	R1, #168
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f4xx_fsmc.c,663 :: 		FSMC_Bank4->PATT4 = (uint32_t)FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_SetupTime |
ADDW	R1, R0, #16
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f4xx_fsmc.c,664 :: 		(FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_WaitSetupTime << 8) |
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f4xx_fsmc.c,665 :: 		(FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HoldSetupTime << 16)|
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R2, R1
;stm32f4xx_fsmc.c,666 :: 		(FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HiZSetupTime << 24);
ADDW	R1, R3, #12
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORRS	R2, R1
MOVW	R1, #172
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f4xx_fsmc.c,669 :: 		FSMC_Bank4->PIO4 = (uint32_t)FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_SetupTime |
ADDW	R1, R0, #20
; FSMC_PCCARDInitStruct end address is: 0 (R0)
LDR	R3, [R1, #0]
LDR	R2, [R3, #0]
;stm32f4xx_fsmc.c,670 :: 		(FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_WaitSetupTime << 8) |
ADDS	R1, R3, #4
LDR	R1, [R1, #0]
LSLS	R1, R1, #8
ORRS	R2, R1
;stm32f4xx_fsmc.c,671 :: 		(FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_HoldSetupTime << 16)|
ADDW	R1, R3, #8
LDR	R1, [R1, #0]
LSLS	R1, R1, #16
ORRS	R2, R1
;stm32f4xx_fsmc.c,672 :: 		(FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_HiZSetupTime << 24);
ADDW	R1, R3, #12
LDR	R1, [R1, #0]
LSLS	R1, R1, #24
ORRS	R2, R1
MOVW	R1, #176
MOVT	R1, #40960
STR	R2, [R1, #0]
;stm32f4xx_fsmc.c,673 :: 		}
L_end_FSMC_PCCARDInit:
BX	LR
; end of _FSMC_PCCARDInit
_FSMC_PCCARDStructInit:
;stm32f4xx_fsmc.c,681 :: 		void FSMC_PCCARDStructInit(FSMC_PCCARDInitTypeDef* FSMC_PCCARDInitStruct)
; FSMC_PCCARDInitStruct start address is: 0 (R0)
; FSMC_PCCARDInitStruct end address is: 0 (R0)
; FSMC_PCCARDInitStruct start address is: 0 (R0)
;stm32f4xx_fsmc.c,684 :: 		FSMC_PCCARDInitStruct->FSMC_Waitfeature = FSMC_Waitfeature_Disable;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_fsmc.c,685 :: 		FSMC_PCCARDInitStruct->FSMC_TCLRSetupTime = 0x0;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,686 :: 		FSMC_PCCARDInitStruct->FSMC_TARSetupTime = 0x0;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,687 :: 		FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_SetupTime = 0xFC;
ADDW	R1, R0, #12
LDR	R2, [R1, #0]
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,688 :: 		FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_WaitSetupTime = 0xFC;
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,689 :: 		FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HoldSetupTime = 0xFC;
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,690 :: 		FSMC_PCCARDInitStruct->FSMC_CommonSpaceTimingStruct->FSMC_HiZSetupTime = 0xFC;
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,691 :: 		FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_SetupTime = 0xFC;
ADDW	R1, R0, #16
LDR	R2, [R1, #0]
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,692 :: 		FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_WaitSetupTime = 0xFC;
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,693 :: 		FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HoldSetupTime = 0xFC;
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,694 :: 		FSMC_PCCARDInitStruct->FSMC_AttributeSpaceTimingStruct->FSMC_HiZSetupTime = 0xFC;
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,695 :: 		FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_SetupTime = 0xFC;
ADDW	R1, R0, #20
LDR	R2, [R1, #0]
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,696 :: 		FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_WaitSetupTime = 0xFC;
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,697 :: 		FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_HoldSetupTime = 0xFC;
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
ADDW	R2, R1, #8
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,698 :: 		FSMC_PCCARDInitStruct->FSMC_IOSpaceTimingStruct->FSMC_HiZSetupTime = 0xFC;
ADDW	R1, R0, #20
; FSMC_PCCARDInitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ADDW	R2, R1, #12
MOV	R1, #252
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,699 :: 		}
L_end_FSMC_PCCARDStructInit:
BX	LR
; end of _FSMC_PCCARDStructInit
_FSMC_PCCARDCmd:
;stm32f4xx_fsmc.c,707 :: 		void FSMC_PCCARDCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_fsmc.c,711 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_FSMC_PCCARDCmd52
; NewState end address is: 0 (R0)
;stm32f4xx_fsmc.c,714 :: 		FSMC_Bank4->PCR4 |= PCR_PBKEN_SET;
MOVW	R2, #160
MOVT	R2, #40960
LDR	R1, [R2, #0]
ORR	R1, R1, #4
STR	R1, [R2, #0]
;stm32f4xx_fsmc.c,715 :: 		}
IT	AL
BAL	L_FSMC_PCCARDCmd53
L_FSMC_PCCARDCmd52:
;stm32f4xx_fsmc.c,719 :: 		FSMC_Bank4->PCR4 &= PCR_PBKEN_RESET;
MOVW	R3, #160
MOVT	R3, #40960
LDR	R2, [R3, #0]
MOVW	R1, #65531
MOVT	R1, #15
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_fsmc.c,720 :: 		}
L_FSMC_PCCARDCmd53:
;stm32f4xx_fsmc.c,721 :: 		}
L_end_FSMC_PCCARDCmd:
BX	LR
; end of _FSMC_PCCARDCmd
_FSMC_ITConfig:
;stm32f4xx_fsmc.c,754 :: 		void FSMC_ITConfig(uint32_t FSMC_Bank, uint32_t FSMC_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; NewState end address is: 8 (R2)
; FSMC_IT end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; FSMC_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f4xx_fsmc.c,760 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_FSMC_ITConfig54
; NewState end address is: 8 (R2)
;stm32f4xx_fsmc.c,763 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_ITConfig55
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,765 :: 		FSMC_Bank2->SR2 |= FSMC_IT;
MOVW	R4, #100
MOVT	R4, #40960
LDR	R3, [R4, #0]
ORRS	R3, R1
; FSMC_IT end address is: 4 (R1)
STR	R3, [R4, #0]
;stm32f4xx_fsmc.c,766 :: 		}
IT	AL
BAL	L_FSMC_ITConfig56
L_FSMC_ITConfig55:
;stm32f4xx_fsmc.c,768 :: 		else if (FSMC_Bank == FSMC_Bank3_NAND)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #256
IT	NE
BNE	L_FSMC_ITConfig57
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,770 :: 		FSMC_Bank3->SR3 |= FSMC_IT;
MOVW	R4, #132
MOVT	R4, #40960
LDR	R3, [R4, #0]
ORRS	R3, R1
; FSMC_IT end address is: 4 (R1)
STR	R3, [R4, #0]
;stm32f4xx_fsmc.c,771 :: 		}
IT	AL
BAL	L_FSMC_ITConfig58
L_FSMC_ITConfig57:
;stm32f4xx_fsmc.c,775 :: 		FSMC_Bank4->SR4 |= FSMC_IT;
; FSMC_IT start address is: 4 (R1)
MOVW	R4, #164
MOVT	R4, #40960
LDR	R3, [R4, #0]
ORRS	R3, R1
; FSMC_IT end address is: 4 (R1)
STR	R3, [R4, #0]
;stm32f4xx_fsmc.c,776 :: 		}
L_FSMC_ITConfig58:
L_FSMC_ITConfig56:
;stm32f4xx_fsmc.c,777 :: 		}
IT	AL
BAL	L_FSMC_ITConfig59
L_FSMC_ITConfig54:
;stm32f4xx_fsmc.c,781 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #16
IT	NE
BNE	L_FSMC_ITConfig60
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,784 :: 		FSMC_Bank2->SR2 &= (uint32_t)~FSMC_IT;
MVN	R5, R1
; FSMC_IT end address is: 4 (R1)
MOVW	R4, #100
MOVT	R4, #40960
LDR	R3, [R4, #0]
ANDS	R3, R5
STR	R3, [R4, #0]
;stm32f4xx_fsmc.c,785 :: 		}
IT	AL
BAL	L_FSMC_ITConfig61
L_FSMC_ITConfig60:
;stm32f4xx_fsmc.c,787 :: 		else if (FSMC_Bank == FSMC_Bank3_NAND)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #256
IT	NE
BNE	L_FSMC_ITConfig62
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,789 :: 		FSMC_Bank3->SR3 &= (uint32_t)~FSMC_IT;
MVN	R5, R1
; FSMC_IT end address is: 4 (R1)
MOVW	R4, #132
MOVT	R4, #40960
LDR	R3, [R4, #0]
ANDS	R3, R5
STR	R3, [R4, #0]
;stm32f4xx_fsmc.c,790 :: 		}
IT	AL
BAL	L_FSMC_ITConfig63
L_FSMC_ITConfig62:
;stm32f4xx_fsmc.c,794 :: 		FSMC_Bank4->SR4 &= (uint32_t)~FSMC_IT;
; FSMC_IT start address is: 4 (R1)
MVN	R5, R1
; FSMC_IT end address is: 4 (R1)
MOVW	R4, #164
MOVT	R4, #40960
LDR	R3, [R4, #0]
ANDS	R3, R5
STR	R3, [R4, #0]
;stm32f4xx_fsmc.c,795 :: 		}
L_FSMC_ITConfig63:
L_FSMC_ITConfig61:
;stm32f4xx_fsmc.c,796 :: 		}
L_FSMC_ITConfig59:
;stm32f4xx_fsmc.c,797 :: 		}
L_end_FSMC_ITConfig:
BX	LR
; end of _FSMC_ITConfig
_FSMC_GetFlagStatus:
;stm32f4xx_fsmc.c,814 :: 		FlagStatus FSMC_GetFlagStatus(uint32_t FSMC_Bank, uint32_t FSMC_FLAG)
; FSMC_FLAG start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; FSMC_FLAG end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; FSMC_FLAG start address is: 4 (R1)
;stm32f4xx_fsmc.c,816 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_fsmc.c,817 :: 		uint32_t tmpsr = 0x00000000;
;stm32f4xx_fsmc.c,823 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_GetFlagStatus64
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,825 :: 		tmpsr = FSMC_Bank2->SR2;
MOVW	R2, #100
MOVT	R2, #40960
; tmpsr start address is: 0 (R0)
LDR	R0, [R2, #0]
;stm32f4xx_fsmc.c,826 :: 		}
; tmpsr end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetFlagStatus65
L_FSMC_GetFlagStatus64:
;stm32f4xx_fsmc.c,827 :: 		else if(FSMC_Bank == FSMC_Bank3_NAND)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #256
IT	NE
BNE	L_FSMC_GetFlagStatus66
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,829 :: 		tmpsr = FSMC_Bank3->SR3;
MOVW	R2, #132
MOVT	R2, #40960
; tmpsr start address is: 0 (R0)
LDR	R0, [R2, #0]
;stm32f4xx_fsmc.c,830 :: 		}
; tmpsr end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetFlagStatus67
L_FSMC_GetFlagStatus66:
;stm32f4xx_fsmc.c,834 :: 		tmpsr = FSMC_Bank4->SR4;
MOVW	R2, #164
MOVT	R2, #40960
; tmpsr start address is: 0 (R0)
LDR	R0, [R2, #0]
; tmpsr end address is: 0 (R0)
;stm32f4xx_fsmc.c,835 :: 		}
L_FSMC_GetFlagStatus67:
; tmpsr start address is: 0 (R0)
; tmpsr end address is: 0 (R0)
L_FSMC_GetFlagStatus65:
;stm32f4xx_fsmc.c,838 :: 		if ((tmpsr & FSMC_FLAG) != (uint16_t)RESET )
; tmpsr start address is: 0 (R0)
AND	R2, R0, R1, LSL #0
; FSMC_FLAG end address is: 4 (R1)
; tmpsr end address is: 0 (R0)
CMP	R2, #0
IT	EQ
BEQ	L_FSMC_GetFlagStatus68
;stm32f4xx_fsmc.c,840 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_fsmc.c,841 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetFlagStatus69
L_FSMC_GetFlagStatus68:
;stm32f4xx_fsmc.c,844 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_fsmc.c,845 :: 		}
L_FSMC_GetFlagStatus69:
;stm32f4xx_fsmc.c,847 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_fsmc.c,848 :: 		}
L_end_FSMC_GetFlagStatus:
BX	LR
; end of _FSMC_GetFlagStatus
_FSMC_ClearFlag:
;stm32f4xx_fsmc.c,864 :: 		void FSMC_ClearFlag(uint32_t FSMC_Bank, uint32_t FSMC_FLAG)
; FSMC_FLAG start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; FSMC_FLAG end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; FSMC_FLAG start address is: 4 (R1)
;stm32f4xx_fsmc.c,870 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_ClearFlag70
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,872 :: 		FSMC_Bank2->SR2 &= ~FSMC_FLAG;
MVN	R4, R1
; FSMC_FLAG end address is: 4 (R1)
MOVW	R3, #100
MOVT	R3, #40960
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_fsmc.c,873 :: 		}
IT	AL
BAL	L_FSMC_ClearFlag71
L_FSMC_ClearFlag70:
;stm32f4xx_fsmc.c,874 :: 		else if(FSMC_Bank == FSMC_Bank3_NAND)
; FSMC_FLAG start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #256
IT	NE
BNE	L_FSMC_ClearFlag72
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,876 :: 		FSMC_Bank3->SR3 &= ~FSMC_FLAG;
MVN	R4, R1
; FSMC_FLAG end address is: 4 (R1)
MOVW	R3, #132
MOVT	R3, #40960
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_fsmc.c,877 :: 		}
IT	AL
BAL	L_FSMC_ClearFlag73
L_FSMC_ClearFlag72:
;stm32f4xx_fsmc.c,881 :: 		FSMC_Bank4->SR4 &= ~FSMC_FLAG;
; FSMC_FLAG start address is: 4 (R1)
MVN	R4, R1
; FSMC_FLAG end address is: 4 (R1)
MOVW	R3, #164
MOVT	R3, #40960
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_fsmc.c,882 :: 		}
L_FSMC_ClearFlag73:
L_FSMC_ClearFlag71:
;stm32f4xx_fsmc.c,883 :: 		}
L_end_FSMC_ClearFlag:
BX	LR
; end of _FSMC_ClearFlag
_FSMC_GetITStatus:
;stm32f4xx_fsmc.c,899 :: 		ITStatus FSMC_GetITStatus(uint32_t FSMC_Bank, uint32_t FSMC_IT)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; FSMC_IT end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; FSMC_IT start address is: 4 (R1)
;stm32f4xx_fsmc.c,901 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_fsmc.c,902 :: 		uint32_t tmpsr = 0x0, itstatus = 0x0, itenable = 0x0;
;stm32f4xx_fsmc.c,908 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_GetITStatus74
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,910 :: 		tmpsr = FSMC_Bank2->SR2;
MOVW	R2, #100
MOVT	R2, #40960
; tmpsr start address is: 0 (R0)
LDR	R0, [R2, #0]
;stm32f4xx_fsmc.c,911 :: 		}
; tmpsr end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetITStatus75
L_FSMC_GetITStatus74:
;stm32f4xx_fsmc.c,912 :: 		else if(FSMC_Bank == FSMC_Bank3_NAND)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #256
IT	NE
BNE	L_FSMC_GetITStatus76
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,914 :: 		tmpsr = FSMC_Bank3->SR3;
MOVW	R2, #132
MOVT	R2, #40960
; tmpsr start address is: 0 (R0)
LDR	R0, [R2, #0]
;stm32f4xx_fsmc.c,915 :: 		}
; tmpsr end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetITStatus77
L_FSMC_GetITStatus76:
;stm32f4xx_fsmc.c,919 :: 		tmpsr = FSMC_Bank4->SR4;
MOVW	R2, #164
MOVT	R2, #40960
; tmpsr start address is: 0 (R0)
LDR	R0, [R2, #0]
; tmpsr end address is: 0 (R0)
;stm32f4xx_fsmc.c,920 :: 		}
L_FSMC_GetITStatus77:
; tmpsr start address is: 0 (R0)
; tmpsr end address is: 0 (R0)
L_FSMC_GetITStatus75:
;stm32f4xx_fsmc.c,922 :: 		itstatus = tmpsr & FSMC_IT;
; tmpsr start address is: 0 (R0)
AND	R3, R0, R1, LSL #0
;stm32f4xx_fsmc.c,924 :: 		itenable = tmpsr & (FSMC_IT >> 3);
LSRS	R2, R1, #3
; FSMC_IT end address is: 4 (R1)
AND	R2, R0, R2, LSL #0
; tmpsr end address is: 0 (R0)
; itenable start address is: 0 (R0)
MOV	R0, R2
;stm32f4xx_fsmc.c,925 :: 		if ((itstatus != (uint32_t)RESET)  && (itenable != (uint32_t)RESET))
CMP	R3, #0
IT	EQ
BEQ	L__FSMC_GetITStatus95
CMP	R0, #0
IT	EQ
BEQ	L__FSMC_GetITStatus94
; itenable end address is: 0 (R0)
L__FSMC_GetITStatus93:
;stm32f4xx_fsmc.c,927 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_fsmc.c,928 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_FSMC_GetITStatus81
;stm32f4xx_fsmc.c,925 :: 		if ((itstatus != (uint32_t)RESET)  && (itenable != (uint32_t)RESET))
L__FSMC_GetITStatus95:
L__FSMC_GetITStatus94:
;stm32f4xx_fsmc.c,931 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_fsmc.c,932 :: 		}
L_FSMC_GetITStatus81:
;stm32f4xx_fsmc.c,933 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_fsmc.c,934 :: 		}
L_end_FSMC_GetITStatus:
BX	LR
; end of _FSMC_GetITStatus
_FSMC_ClearITPendingBit:
;stm32f4xx_fsmc.c,950 :: 		void FSMC_ClearITPendingBit(uint32_t FSMC_Bank, uint32_t FSMC_IT)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
; FSMC_IT end address is: 4 (R1)
; FSMC_Bank end address is: 0 (R0)
; FSMC_Bank start address is: 0 (R0)
; FSMC_IT start address is: 4 (R1)
;stm32f4xx_fsmc.c,956 :: 		if(FSMC_Bank == FSMC_Bank2_NAND)
CMP	R0, #16
IT	NE
BNE	L_FSMC_ClearITPendingBit82
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,958 :: 		FSMC_Bank2->SR2 &= ~(FSMC_IT >> 3);
LSRS	R2, R1, #3
; FSMC_IT end address is: 4 (R1)
MVN	R4, R2
MOVW	R3, #100
MOVT	R3, #40960
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_fsmc.c,959 :: 		}
IT	AL
BAL	L_FSMC_ClearITPendingBit83
L_FSMC_ClearITPendingBit82:
;stm32f4xx_fsmc.c,960 :: 		else if(FSMC_Bank == FSMC_Bank3_NAND)
; FSMC_IT start address is: 4 (R1)
; FSMC_Bank start address is: 0 (R0)
CMP	R0, #256
IT	NE
BNE	L_FSMC_ClearITPendingBit84
; FSMC_Bank end address is: 0 (R0)
;stm32f4xx_fsmc.c,962 :: 		FSMC_Bank3->SR3 &= ~(FSMC_IT >> 3);
LSRS	R2, R1, #3
; FSMC_IT end address is: 4 (R1)
MVN	R4, R2
MOVW	R3, #132
MOVT	R3, #40960
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_fsmc.c,963 :: 		}
IT	AL
BAL	L_FSMC_ClearITPendingBit85
L_FSMC_ClearITPendingBit84:
;stm32f4xx_fsmc.c,967 :: 		FSMC_Bank4->SR4 &= ~(FSMC_IT >> 3);
; FSMC_IT start address is: 4 (R1)
LSRS	R2, R1, #3
; FSMC_IT end address is: 4 (R1)
MVN	R4, R2
MOVW	R3, #164
MOVT	R3, #40960
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_fsmc.c,968 :: 		}
L_FSMC_ClearITPendingBit85:
L_FSMC_ClearITPendingBit83:
;stm32f4xx_fsmc.c,969 :: 		}
L_end_FSMC_ClearITPendingBit:
BX	LR
; end of _FSMC_ClearITPendingBit
