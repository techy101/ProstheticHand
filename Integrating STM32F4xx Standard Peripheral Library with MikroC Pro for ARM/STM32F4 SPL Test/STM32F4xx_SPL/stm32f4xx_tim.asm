stm32f4xx_tim___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_tim___DSB
stm32f4xx_tim___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_tim___WFI
stm32f4xx_tim___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_tim___WFE
stm32f4xx_tim___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_tim___REV
stm32f4xx_tim_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_tim_NVIC_SetPriorityGrouping
stm32f4xx_tim_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_tim_NVIC_GetPriorityGrouping
stm32f4xx_tim_NVIC_EnableIRQ:
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
; end of stm32f4xx_tim_NVIC_EnableIRQ
stm32f4xx_tim_NVIC_DisableIRQ:
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
; end of stm32f4xx_tim_NVIC_DisableIRQ
stm32f4xx_tim_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_tim_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_tim_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_tim_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_tim_NVIC_GetPendingIRQ1
L_stm32f4xx_tim_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_tim_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_tim_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_tim_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_tim_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_tim_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_tim_NVIC_GetPendingIRQ
stm32f4xx_tim_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_tim_NVIC_SetPendingIRQ
stm32f4xx_tim_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_tim_NVIC_ClearPendingIRQ
stm32f4xx_tim_NVIC_GetActive:
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
BEQ	L_stm32f4xx_tim_NVIC_GetActive2
; ?FLOC__stm32f4xx_tim_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_tim_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_tim_NVIC_GetActive3
L_stm32f4xx_tim_NVIC_GetActive2:
; ?FLOC__stm32f4xx_tim_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_tim_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_tim_NVIC_GetActive3:
; ?FLOC__stm32f4xx_tim_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_tim_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_tim_NVIC_GetActive
stm32f4xx_tim_NVIC_SetPriority:
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
BGE	L_stm32f4xx_tim_NVIC_SetPriority4
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
BAL	L_stm32f4xx_tim_NVIC_SetPriority5
L_stm32f4xx_tim_NVIC_SetPriority4:
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
L_stm32f4xx_tim_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_tim_NVIC_SetPriority
stm32f4xx_tim_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_tim_NVIC_GetPriority6
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
L_stm32f4xx_tim_NVIC_GetPriority6:
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
; end of stm32f4xx_tim_NVIC_GetPriority
stm32f4xx_tim_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_tim_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_tim_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_tim_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_tim_NVIC_EncodePriority9
L_stm32f4xx_tim_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_tim_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_tim_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_tim_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_tim_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_tim_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_tim_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_tim_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_tim_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_tim_NVIC_EncodePriority11
L_stm32f4xx_tim_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_tim_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_tim_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_tim_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_tim_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_tim_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_tim_NVIC_EncodePriority
stm32f4xx_tim_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_tim_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_tim_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_tim_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_tim_NVIC_DecodePriority13
L_stm32f4xx_tim_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_tim_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_tim_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_tim_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_tim_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_tim_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_tim_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_tim_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_tim_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_tim_NVIC_DecodePriority15
L_stm32f4xx_tim_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_tim_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_tim_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_tim_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_tim_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_tim_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_tim_NVIC_DecodePriority
stm32f4xx_tim_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_tim___DSB+0
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
BL	stm32f4xx_tim___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_tim_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_tim_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_tim_NVIC_SystemReset
stm32f4xx_tim_SysTick_Config:
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
BLS	L_stm32f4xx_tim_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_tim_SysTick_Config18:
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
BL	stm32f4xx_tim_NVIC_SetPriority+0
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
; end of stm32f4xx_tim_SysTick_Config
stm32f4xx_tim_ITM_SendChar:
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
BEQ	L_stm32f4xx_tim_ITM_SendChar125
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_tim_ITM_SendChar126
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_tim_ITM_SendChar127
L_stm32f4xx_tim_ITM_SendChar121:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_tim_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_tim_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_tim_ITM_SendChar22
L_stm32f4xx_tim_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_tim_ITM_SendChar124
L_stm32f4xx_tim_ITM_SendChar125:
L_stm32f4xx_tim_ITM_SendChar124:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_tim_ITM_SendChar123
L_stm32f4xx_tim_ITM_SendChar126:
L_stm32f4xx_tim_ITM_SendChar123:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_tim_ITM_SendChar122
L_stm32f4xx_tim_ITM_SendChar127:
L_stm32f4xx_tim_ITM_SendChar122:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_tim_ITM_SendChar
stm32f4xx_tim_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_tim_ITM_ReceiveChar24
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
L_stm32f4xx_tim_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_tim_ITM_ReceiveChar
stm32f4xx_tim_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_tim_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_tim_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_tim_ITM_CheckChar
_TIM_DeInit:
;stm32f4xx_tim.c,200 :: 		void TIM_DeInit(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f4xx_tim.c,205 :: 		if (TIMx == TIM1)
MOVW	R1, #0
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit27
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,207 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM1, ENABLE);
MOVS	R1, #1
MOV	R0, #1
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_tim.c,208 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM1, DISABLE);
MOVS	R1, #0
MOV	R0, #1
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_tim.c,209 :: 		}
IT	AL
BAL	L_TIM_DeInit28
L_TIM_DeInit27:
;stm32f4xx_tim.c,210 :: 		else if (TIMx == TIM2)
; TIMx start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit29
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,212 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM2, ENABLE);
MOVS	R1, #1
MOV	R0, #1
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,213 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM2, DISABLE);
MOVS	R1, #0
MOV	R0, #1
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,214 :: 		}
IT	AL
BAL	L_TIM_DeInit30
L_TIM_DeInit29:
;stm32f4xx_tim.c,215 :: 		else if (TIMx == TIM3)
; TIMx start address is: 0 (R0)
MOVW	R1, #1024
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit31
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,217 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM3, ENABLE);
MOVS	R1, #1
MOV	R0, #2
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,218 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM3, DISABLE);
MOVS	R1, #0
MOV	R0, #2
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,219 :: 		}
IT	AL
BAL	L_TIM_DeInit32
L_TIM_DeInit31:
;stm32f4xx_tim.c,220 :: 		else if (TIMx == TIM4)
; TIMx start address is: 0 (R0)
MOVW	R1, #2048
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit33
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,222 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM4, ENABLE);
MOVS	R1, #1
MOV	R0, #4
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,223 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM4, DISABLE);
MOVS	R1, #0
MOV	R0, #4
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,224 :: 		}
IT	AL
BAL	L_TIM_DeInit34
L_TIM_DeInit33:
;stm32f4xx_tim.c,225 :: 		else if (TIMx == TIM5)
; TIMx start address is: 0 (R0)
MOVW	R1, #3072
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit35
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,227 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM5, ENABLE);
MOVS	R1, #1
MOV	R0, #8
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,228 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM5, DISABLE);
MOVS	R1, #0
MOV	R0, #8
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,229 :: 		}
IT	AL
BAL	L_TIM_DeInit36
L_TIM_DeInit35:
;stm32f4xx_tim.c,230 :: 		else if (TIMx == TIM6)
; TIMx start address is: 0 (R0)
MOVW	R1, #4096
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit37
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,232 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM6, ENABLE);
MOVS	R1, #1
MOV	R0, #16
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,233 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM6, DISABLE);
MOVS	R1, #0
MOV	R0, #16
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,234 :: 		}
IT	AL
BAL	L_TIM_DeInit38
L_TIM_DeInit37:
;stm32f4xx_tim.c,235 :: 		else if (TIMx == TIM7)
; TIMx start address is: 0 (R0)
MOVW	R1, #5120
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit39
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,237 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM7, ENABLE);
MOVS	R1, #1
MOV	R0, #32
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,238 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM7, DISABLE);
MOVS	R1, #0
MOV	R0, #32
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,239 :: 		}
IT	AL
BAL	L_TIM_DeInit40
L_TIM_DeInit39:
;stm32f4xx_tim.c,240 :: 		else if (TIMx == TIM8)
; TIMx start address is: 0 (R0)
MOVW	R1, #1024
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit41
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,242 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM8, ENABLE);
MOVS	R1, #1
MOV	R0, #2
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_tim.c,243 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM8, DISABLE);
MOVS	R1, #0
MOV	R0, #2
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_tim.c,244 :: 		}
IT	AL
BAL	L_TIM_DeInit42
L_TIM_DeInit41:
;stm32f4xx_tim.c,245 :: 		else if (TIMx == TIM9)
; TIMx start address is: 0 (R0)
MOVW	R1, #16384
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit43
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,247 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM9, ENABLE);
MOVS	R1, #1
MOV	R0, #65536
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_tim.c,248 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM9, DISABLE);
MOVS	R1, #0
MOV	R0, #65536
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_tim.c,249 :: 		}
IT	AL
BAL	L_TIM_DeInit44
L_TIM_DeInit43:
;stm32f4xx_tim.c,250 :: 		else if (TIMx == TIM10)
; TIMx start address is: 0 (R0)
MOVW	R1, #17408
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit45
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,252 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM10, ENABLE);
MOVS	R1, #1
MOV	R0, #131072
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_tim.c,253 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM10, DISABLE);
MOVS	R1, #0
MOV	R0, #131072
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_tim.c,254 :: 		}
IT	AL
BAL	L_TIM_DeInit46
L_TIM_DeInit45:
;stm32f4xx_tim.c,255 :: 		else if (TIMx == TIM11)
; TIMx start address is: 0 (R0)
MOVW	R1, #18432
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit47
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,257 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM11, ENABLE);
MOVS	R1, #1
MOV	R0, #262144
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_tim.c,258 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM11, DISABLE);
MOVS	R1, #0
MOV	R0, #262144
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_tim.c,259 :: 		}
IT	AL
BAL	L_TIM_DeInit48
L_TIM_DeInit47:
;stm32f4xx_tim.c,260 :: 		else if (TIMx == TIM12)
; TIMx start address is: 0 (R0)
MOVW	R1, #6144
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit49
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,262 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM12, ENABLE);
MOVS	R1, #1
MOV	R0, #64
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,263 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM12, DISABLE);
MOVS	R1, #0
MOV	R0, #64
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,264 :: 		}
IT	AL
BAL	L_TIM_DeInit50
L_TIM_DeInit49:
;stm32f4xx_tim.c,265 :: 		else if (TIMx == TIM13)
; TIMx start address is: 0 (R0)
MOVW	R1, #7168
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit51
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,267 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM13, ENABLE);
MOVS	R1, #1
MOV	R0, #128
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,268 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM13, DISABLE);
MOVS	R1, #0
MOV	R0, #128
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,269 :: 		}
IT	AL
BAL	L_TIM_DeInit52
L_TIM_DeInit51:
;stm32f4xx_tim.c,272 :: 		if (TIMx == TIM14)
; TIMx start address is: 0 (R0)
MOVW	R1, #8192
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_TIM_DeInit53
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,274 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM14, ENABLE);
MOVS	R1, #1
MOV	R0, #256
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,275 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM14, DISABLE);
MOVS	R1, #0
MOV	R0, #256
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_tim.c,276 :: 		}
L_TIM_DeInit53:
;stm32f4xx_tim.c,277 :: 		}
L_TIM_DeInit52:
L_TIM_DeInit50:
L_TIM_DeInit48:
L_TIM_DeInit46:
L_TIM_DeInit44:
L_TIM_DeInit42:
L_TIM_DeInit40:
L_TIM_DeInit38:
L_TIM_DeInit36:
L_TIM_DeInit34:
L_TIM_DeInit32:
L_TIM_DeInit30:
L_TIM_DeInit28:
;stm32f4xx_tim.c,278 :: 		}
L_end_TIM_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_DeInit
_TIM_TimeBaseInit:
;stm32f4xx_tim.c,288 :: 		void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
; TIM_TimeBaseInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_TimeBaseInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_TimeBaseInitStruct start address is: 4 (R1)
;stm32f4xx_tim.c,290 :: 		uint16_t tmpcr1 = 0;
;stm32f4xx_tim.c,297 :: 		tmpcr1 = TIMx->CR1;
LDRH	R4, [R0, #0]
; tmpcr1 start address is: 16 (R4)
;stm32f4xx_tim.c,299 :: 		if((TIMx == TIM1) || (TIMx == TIM8)||
MOVW	R2, #0
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit136
MOVW	R2, #1024
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit135
;stm32f4xx_tim.c,300 :: 		(TIMx == TIM2) || (TIMx == TIM3)||
MOVW	R2, #0
MOVT	R2, #16384
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit134
MOVW	R2, #1024
MOVT	R2, #16384
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit133
;stm32f4xx_tim.c,301 :: 		(TIMx == TIM4) || (TIMx == TIM5))
MOVW	R2, #2048
MOVT	R2, #16384
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit132
MOVW	R2, #3072
MOVT	R2, #16384
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit131
IT	AL
BAL	L_TIM_TimeBaseInit56
;stm32f4xx_tim.c,299 :: 		if((TIMx == TIM1) || (TIMx == TIM8)||
L__TIM_TimeBaseInit136:
L__TIM_TimeBaseInit135:
;stm32f4xx_tim.c,300 :: 		(TIMx == TIM2) || (TIMx == TIM3)||
L__TIM_TimeBaseInit134:
L__TIM_TimeBaseInit133:
;stm32f4xx_tim.c,301 :: 		(TIMx == TIM4) || (TIMx == TIM5))
L__TIM_TimeBaseInit132:
L__TIM_TimeBaseInit131:
;stm32f4xx_tim.c,304 :: 		tmpcr1 &= (uint16_t)(~(TIM_CR1_DIR | TIM_CR1_CMS));
MOVW	R2, #65423
AND	R3, R4, R2, LSL #0
UXTH	R3, R3
; tmpcr1 end address is: 16 (R4)
;stm32f4xx_tim.c,305 :: 		tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_CounterMode;
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
; tmpcr1 start address is: 16 (R4)
UXTH	R4, R2
; tmpcr1 end address is: 16 (R4)
;stm32f4xx_tim.c,306 :: 		}
L_TIM_TimeBaseInit56:
;stm32f4xx_tim.c,308 :: 		if((TIMx != TIM6) && (TIMx != TIM7))
; tmpcr1 start address is: 16 (R4)
MOVW	R2, #4096
MOVT	R2, #16384
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit141
MOVW	R2, #5120
MOVT	R2, #16384
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit142
L__TIM_TimeBaseInit129:
;stm32f4xx_tim.c,311 :: 		tmpcr1 &=  (uint16_t)(~TIM_CR1_CKD);
MOVW	R2, #64767
AND	R3, R4, R2, LSL #0
UXTH	R3, R3
; tmpcr1 end address is: 16 (R4)
;stm32f4xx_tim.c,312 :: 		tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_ClockDivision;
ADDW	R2, R1, #8
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
; tmpcr1 start address is: 12 (R3)
UXTH	R3, R2
; tmpcr1 end address is: 12 (R3)
UXTH	R2, R3
;stm32f4xx_tim.c,308 :: 		if((TIMx != TIM6) && (TIMx != TIM7))
IT	AL
BAL	L__TIM_TimeBaseInit138
L__TIM_TimeBaseInit141:
UXTH	R2, R4
L__TIM_TimeBaseInit138:
; tmpcr1 start address is: 8 (R2)
; tmpcr1 end address is: 8 (R2)
IT	AL
BAL	L__TIM_TimeBaseInit137
L__TIM_TimeBaseInit142:
UXTH	R2, R4
L__TIM_TimeBaseInit137:
;stm32f4xx_tim.c,315 :: 		TIMx->CR1 = tmpcr1;
; tmpcr1 start address is: 8 (R2)
STRH	R2, [R0, #0]
; tmpcr1 end address is: 8 (R2)
;stm32f4xx_tim.c,318 :: 		TIMx->ARR = TIM_TimeBaseInitStruct->TIM_Period ;
ADDW	R3, R0, #44
ADDS	R2, R1, #4
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_tim.c,321 :: 		TIMx->PSC = TIM_TimeBaseInitStruct->TIM_Prescaler;
ADDW	R3, R0, #40
LDRH	R2, [R1, #0]
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,323 :: 		if ((TIMx == TIM1) || (TIMx == TIM8))
MOVW	R2, #0
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit140
MOVW	R2, #1024
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_TimeBaseInit139
; TIM_TimeBaseInitStruct end address is: 4 (R1)
IT	AL
BAL	L_TIM_TimeBaseInit62
L__TIM_TimeBaseInit140:
; TIM_TimeBaseInitStruct start address is: 4 (R1)
L__TIM_TimeBaseInit139:
;stm32f4xx_tim.c,326 :: 		TIMx->RCR = TIM_TimeBaseInitStruct->TIM_RepetitionCounter;
ADDW	R3, R0, #48
ADDW	R2, R1, #10
; TIM_TimeBaseInitStruct end address is: 4 (R1)
LDRB	R2, [R2, #0]
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,327 :: 		}
L_TIM_TimeBaseInit62:
;stm32f4xx_tim.c,331 :: 		TIMx->EGR = TIM_PSCReloadMode_Immediate;
ADDW	R3, R0, #20
; TIMx end address is: 0 (R0)
MOVW	R2, #1
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,332 :: 		}
L_end_TIM_TimeBaseInit:
BX	LR
; end of _TIM_TimeBaseInit
_TIM_TimeBaseStructInit:
;stm32f4xx_tim.c,340 :: 		void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
; TIM_TimeBaseInitStruct start address is: 0 (R0)
; TIM_TimeBaseInitStruct end address is: 0 (R0)
; TIM_TimeBaseInitStruct start address is: 0 (R0)
;stm32f4xx_tim.c,343 :: 		TIM_TimeBaseInitStruct->TIM_Period = 0xFFFFFFFF;
ADDS	R2, R0, #4
MOV	R1, #-1
STR	R1, [R2, #0]
;stm32f4xx_tim.c,344 :: 		TIM_TimeBaseInitStruct->TIM_Prescaler = 0x0000;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f4xx_tim.c,345 :: 		TIM_TimeBaseInitStruct->TIM_ClockDivision = TIM_CKD_DIV1;
ADDW	R2, R0, #8
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,346 :: 		TIM_TimeBaseInitStruct->TIM_CounterMode = TIM_CounterMode_Up;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,347 :: 		TIM_TimeBaseInitStruct->TIM_RepetitionCounter = 0x0000;
ADDW	R2, R0, #10
; TIM_TimeBaseInitStruct end address is: 0 (R0)
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_tim.c,348 :: 		}
L_end_TIM_TimeBaseStructInit:
BX	LR
; end of _TIM_TimeBaseStructInit
_TIM_PrescalerConfig:
;stm32f4xx_tim.c,360 :: 		void TIM_PrescalerConfig(TIM_TypeDef* TIMx, uint16_t Prescaler, uint16_t TIM_PSCReloadMode)
; TIM_PSCReloadMode start address is: 8 (R2)
; Prescaler start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_PSCReloadMode end address is: 8 (R2)
; Prescaler end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Prescaler start address is: 4 (R1)
; TIM_PSCReloadMode start address is: 8 (R2)
;stm32f4xx_tim.c,366 :: 		TIMx->PSC = Prescaler;
ADDW	R3, R0, #40
STRH	R1, [R3, #0]
; Prescaler end address is: 4 (R1)
;stm32f4xx_tim.c,368 :: 		TIMx->EGR = TIM_PSCReloadMode;
ADDW	R3, R0, #20
; TIMx end address is: 0 (R0)
STRH	R2, [R3, #0]
; TIM_PSCReloadMode end address is: 8 (R2)
;stm32f4xx_tim.c,369 :: 		}
L_end_TIM_PrescalerConfig:
BX	LR
; end of _TIM_PrescalerConfig
_TIM_CounterModeConfig:
;stm32f4xx_tim.c,383 :: 		void TIM_CounterModeConfig(TIM_TypeDef* TIMx, uint16_t TIM_CounterMode)
; TIM_CounterMode start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_CounterMode end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_CounterMode start address is: 4 (R1)
;stm32f4xx_tim.c,385 :: 		uint16_t tmpcr1 = 0;
;stm32f4xx_tim.c,391 :: 		tmpcr1 = TIMx->CR1;
LDRH	R3, [R0, #0]
;stm32f4xx_tim.c,394 :: 		tmpcr1 &= (uint16_t)~(TIM_CR1_DIR | TIM_CR1_CMS);
MOVW	R2, #65423
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f4xx_tim.c,397 :: 		tmpcr1 |= TIM_CounterMode;
ORRS	R2, R1
; TIM_CounterMode end address is: 4 (R1)
;stm32f4xx_tim.c,400 :: 		TIMx->CR1 = tmpcr1;
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,401 :: 		}
L_end_TIM_CounterModeConfig:
BX	LR
; end of _TIM_CounterModeConfig
_TIM_SetCounter:
;stm32f4xx_tim.c,409 :: 		void TIM_SetCounter(TIM_TypeDef* TIMx, uint32_t Counter)
; Counter start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; Counter end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Counter start address is: 4 (R1)
;stm32f4xx_tim.c,415 :: 		TIMx->CNT = Counter;
ADDW	R2, R0, #36
; TIMx end address is: 0 (R0)
STR	R1, [R2, #0]
; Counter end address is: 4 (R1)
;stm32f4xx_tim.c,416 :: 		}
L_end_TIM_SetCounter:
BX	LR
; end of _TIM_SetCounter
_TIM_SetAutoreload:
;stm32f4xx_tim.c,424 :: 		void TIM_SetAutoreload(TIM_TypeDef* TIMx, uint32_t Autoreload)
; Autoreload start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; Autoreload end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Autoreload start address is: 4 (R1)
;stm32f4xx_tim.c,430 :: 		TIMx->ARR = Autoreload;
ADDW	R2, R0, #44
; TIMx end address is: 0 (R0)
STR	R1, [R2, #0]
; Autoreload end address is: 4 (R1)
;stm32f4xx_tim.c,431 :: 		}
L_end_TIM_SetAutoreload:
BX	LR
; end of _TIM_SetAutoreload
_TIM_GetCounter:
;stm32f4xx_tim.c,438 :: 		uint32_t TIM_GetCounter(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f4xx_tim.c,444 :: 		return TIMx->CNT;
ADDW	R1, R0, #36
; TIMx end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
;stm32f4xx_tim.c,445 :: 		}
L_end_TIM_GetCounter:
BX	LR
; end of _TIM_GetCounter
_TIM_GetPrescaler:
;stm32f4xx_tim.c,452 :: 		uint16_t TIM_GetPrescaler(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f4xx_tim.c,458 :: 		return TIMx->PSC;
ADDW	R1, R0, #40
; TIMx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;stm32f4xx_tim.c,459 :: 		}
L_end_TIM_GetPrescaler:
BX	LR
; end of _TIM_GetPrescaler
_TIM_UpdateDisableConfig:
;stm32f4xx_tim.c,468 :: 		void TIM_UpdateDisableConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_tim.c,474 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_UpdateDisableConfig63
; NewState end address is: 4 (R1)
;stm32f4xx_tim.c,477 :: 		TIMx->CR1 |= TIM_CR1_UDIS;
LDRH	R2, [R0, #0]
ORR	R2, R2, #2
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,478 :: 		}
IT	AL
BAL	L_TIM_UpdateDisableConfig64
L_TIM_UpdateDisableConfig63:
;stm32f4xx_tim.c,482 :: 		TIMx->CR1 &= (uint16_t)~TIM_CR1_UDIS;
; TIMx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65533
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,483 :: 		}
L_TIM_UpdateDisableConfig64:
;stm32f4xx_tim.c,484 :: 		}
L_end_TIM_UpdateDisableConfig:
BX	LR
; end of _TIM_UpdateDisableConfig
_TIM_UpdateRequestConfig:
;stm32f4xx_tim.c,497 :: 		void TIM_UpdateRequestConfig(TIM_TypeDef* TIMx, uint16_t TIM_UpdateSource)
; TIM_UpdateSource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_UpdateSource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_UpdateSource start address is: 4 (R1)
;stm32f4xx_tim.c,503 :: 		if (TIM_UpdateSource != TIM_UpdateSource_Global)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_UpdateRequestConfig65
; TIM_UpdateSource end address is: 4 (R1)
;stm32f4xx_tim.c,506 :: 		TIMx->CR1 |= TIM_CR1_URS;
LDRH	R2, [R0, #0]
ORR	R2, R2, #4
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,507 :: 		}
IT	AL
BAL	L_TIM_UpdateRequestConfig66
L_TIM_UpdateRequestConfig65:
;stm32f4xx_tim.c,511 :: 		TIMx->CR1 &= (uint16_t)~TIM_CR1_URS;
; TIMx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65531
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,512 :: 		}
L_TIM_UpdateRequestConfig66:
;stm32f4xx_tim.c,513 :: 		}
L_end_TIM_UpdateRequestConfig:
BX	LR
; end of _TIM_UpdateRequestConfig
_TIM_ARRPreloadConfig:
;stm32f4xx_tim.c,522 :: 		void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_tim.c,528 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_ARRPreloadConfig67
; NewState end address is: 4 (R1)
;stm32f4xx_tim.c,531 :: 		TIMx->CR1 |= TIM_CR1_ARPE;
LDRH	R2, [R0, #0]
ORR	R2, R2, #128
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,532 :: 		}
IT	AL
BAL	L_TIM_ARRPreloadConfig68
L_TIM_ARRPreloadConfig67:
;stm32f4xx_tim.c,536 :: 		TIMx->CR1 &= (uint16_t)~TIM_CR1_ARPE;
; TIMx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65407
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,537 :: 		}
L_TIM_ARRPreloadConfig68:
;stm32f4xx_tim.c,538 :: 		}
L_end_TIM_ARRPreloadConfig:
BX	LR
; end of _TIM_ARRPreloadConfig
_TIM_SelectOnePulseMode:
;stm32f4xx_tim.c,549 :: 		void TIM_SelectOnePulseMode(TIM_TypeDef* TIMx, uint16_t TIM_OPMode)
; TIM_OPMode start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OPMode end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OPMode start address is: 4 (R1)
;stm32f4xx_tim.c,556 :: 		TIMx->CR1 &= (uint16_t)~TIM_CR1_OPM;
LDRH	R3, [R0, #0]
MOVW	R2, #65527
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
;stm32f4xx_tim.c,559 :: 		TIMx->CR1 |= TIM_OPMode;
LDRH	R2, [R0, #0]
ORRS	R2, R1
; TIM_OPMode end address is: 4 (R1)
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,560 :: 		}
L_end_TIM_SelectOnePulseMode:
BX	LR
; end of _TIM_SelectOnePulseMode
_TIM_SetClockDivision:
;stm32f4xx_tim.c,572 :: 		void TIM_SetClockDivision(TIM_TypeDef* TIMx, uint16_t TIM_CKD)
; TIM_CKD start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_CKD end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_CKD start address is: 4 (R1)
;stm32f4xx_tim.c,579 :: 		TIMx->CR1 &= (uint16_t)(~TIM_CR1_CKD);
LDRH	R3, [R0, #0]
MOVW	R2, #64767
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
;stm32f4xx_tim.c,582 :: 		TIMx->CR1 |= TIM_CKD;
LDRH	R2, [R0, #0]
ORRS	R2, R1
; TIM_CKD end address is: 4 (R1)
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,583 :: 		}
L_end_TIM_SetClockDivision:
BX	LR
; end of _TIM_SetClockDivision
_TIM_Cmd:
;stm32f4xx_tim.c,592 :: 		void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_tim.c,598 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_Cmd69
; NewState end address is: 4 (R1)
;stm32f4xx_tim.c,601 :: 		TIMx->CR1 |= TIM_CR1_CEN;
LDRH	R2, [R0, #0]
ORR	R2, R2, #1
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,602 :: 		}
IT	AL
BAL	L_TIM_Cmd70
L_TIM_Cmd69:
;stm32f4xx_tim.c,606 :: 		TIMx->CR1 &= (uint16_t)~TIM_CR1_CEN;
; TIMx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; TIMx end address is: 0 (R0)
;stm32f4xx_tim.c,607 :: 		}
L_TIM_Cmd70:
;stm32f4xx_tim.c,608 :: 		}
L_end_TIM_Cmd:
BX	LR
; end of _TIM_Cmd
_TIM_OC1Init:
;stm32f4xx_tim.c,671 :: 		void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
; TIM_OCInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct start address is: 4 (R1)
;stm32f4xx_tim.c,673 :: 		uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
;stm32f4xx_tim.c,682 :: 		TIMx->CCER &= (uint16_t)~TIM_CCER_CC1E;
ADDW	R4, R0, #32
LDRH	R3, [R4, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,685 :: 		tmpccer = TIMx->CCER;
ADDW	R2, R0, #32
LDRH	R4, [R2, #0]
;stm32f4xx_tim.c,687 :: 		tmpcr2 =  TIMx->CR2;
ADDS	R2, R0, #4
LDRH	R2, [R2, #0]
; tmpcr2 start address is: 24 (R6)
UXTH	R6, R2
;stm32f4xx_tim.c,690 :: 		tmpccmrx = TIMx->CCMR1;
ADDW	R2, R0, #24
LDRH	R3, [R2, #0]
;stm32f4xx_tim.c,693 :: 		tmpccmrx &= (uint16_t)~TIM_CCMR1_OC1M;
MOVW	R2, #65423
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,694 :: 		tmpccmrx &= (uint16_t)~TIM_CCMR1_CC1S;
MOVW	R2, #65532
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,696 :: 		tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
LDRH	R2, [R1, #0]
ORR	R2, R3, R2, LSL #0
; tmpccmrx start address is: 20 (R5)
UXTH	R5, R2
;stm32f4xx_tim.c,699 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC1P;
MOVW	R2, #65533
ANDS	R4, R2
UXTH	R4, R4
;stm32f4xx_tim.c,701 :: 		tmpccer |= TIM_OCInitStruct->TIM_OCPolarity;
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
ORRS	R4, R2
UXTH	R4, R4
;stm32f4xx_tim.c,704 :: 		tmpccer |= TIM_OCInitStruct->TIM_OutputState;
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
ORRS	R4, R2
UXTH	R4, R4
; tmpccer start address is: 16 (R4)
;stm32f4xx_tim.c,706 :: 		if((TIMx == TIM1) || (TIMx == TIM8))
MOVW	R2, #0
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC1Init145
MOVW	R2, #1024
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC1Init144
UXTH	R3, R6
IT	AL
BAL	L_TIM_OC1Init73
L__TIM_OC1Init145:
L__TIM_OC1Init144:
;stm32f4xx_tim.c,714 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC1NP;
MOVW	R2, #65527
ANDS	R4, R2
UXTH	R4, R4
; tmpccer end address is: 16 (R4)
;stm32f4xx_tim.c,716 :: 		tmpccer |= TIM_OCInitStruct->TIM_OCNPolarity;
ADDW	R2, R1, #14
LDRH	R2, [R2, #0]
ORRS	R4, R2
UXTH	R4, R4
;stm32f4xx_tim.c,718 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC1NE;
MOVW	R2, #65531
ANDS	R4, R2
UXTH	R4, R4
;stm32f4xx_tim.c,721 :: 		tmpccer |= TIM_OCInitStruct->TIM_OutputNState;
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
ORRS	R4, R2
UXTH	R4, R4
; tmpccer start address is: 16 (R4)
;stm32f4xx_tim.c,723 :: 		tmpcr2 &= (uint16_t)~TIM_CR2_OIS1;
MOVW	R2, #65279
AND	R3, R6, R2, LSL #0
UXTH	R3, R3
; tmpcr2 end address is: 24 (R6)
;stm32f4xx_tim.c,724 :: 		tmpcr2 &= (uint16_t)~TIM_CR2_OIS1N;
MOVW	R2, #65023
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,726 :: 		tmpcr2 |= TIM_OCInitStruct->TIM_OCIdleState;
ADDW	R2, R1, #16
LDRH	R2, [R2, #0]
ORRS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,728 :: 		tmpcr2 |= TIM_OCInitStruct->TIM_OCNIdleState;
ADDW	R2, R1, #18
LDRH	R2, [R2, #0]
ORRS	R3, R2
UXTH	R3, R3
; tmpcr2 start address is: 12 (R3)
; tmpcr2 end address is: 12 (R3)
; tmpccer end address is: 16 (R4)
;stm32f4xx_tim.c,729 :: 		}
L_TIM_OC1Init73:
;stm32f4xx_tim.c,731 :: 		TIMx->CR2 = tmpcr2;
; tmpcr2 start address is: 12 (R3)
; tmpccer start address is: 16 (R4)
ADDS	R2, R0, #4
STRH	R3, [R2, #0]
; tmpcr2 end address is: 12 (R3)
;stm32f4xx_tim.c,734 :: 		TIMx->CCMR1 = tmpccmrx;
ADDW	R2, R0, #24
STRH	R5, [R2, #0]
; tmpccmrx end address is: 20 (R5)
;stm32f4xx_tim.c,737 :: 		TIMx->CCR1 = TIM_OCInitStruct->TIM_Pulse;
ADDW	R3, R0, #52
ADDW	R2, R1, #8
; TIM_OCInitStruct end address is: 4 (R1)
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_tim.c,740 :: 		TIMx->CCER = tmpccer;
ADDW	R2, R0, #32
; TIMx end address is: 0 (R0)
STRH	R4, [R2, #0]
; tmpccer end address is: 16 (R4)
;stm32f4xx_tim.c,741 :: 		}
L_end_TIM_OC1Init:
BX	LR
; end of _TIM_OC1Init
_TIM_OC2Init:
;stm32f4xx_tim.c,752 :: 		void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
; TIM_OCInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct start address is: 4 (R1)
;stm32f4xx_tim.c,754 :: 		uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
;stm32f4xx_tim.c,763 :: 		TIMx->CCER &= (uint16_t)~TIM_CCER_CC2E;
ADDW	R4, R0, #32
LDRH	R3, [R4, #0]
MOVW	R2, #65519
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,766 :: 		tmpccer = TIMx->CCER;
ADDW	R2, R0, #32
LDRH	R4, [R2, #0]
;stm32f4xx_tim.c,768 :: 		tmpcr2 =  TIMx->CR2;
ADDS	R2, R0, #4
LDRH	R2, [R2, #0]
; tmpcr2 start address is: 24 (R6)
UXTH	R6, R2
;stm32f4xx_tim.c,771 :: 		tmpccmrx = TIMx->CCMR1;
ADDW	R2, R0, #24
LDRH	R3, [R2, #0]
;stm32f4xx_tim.c,774 :: 		tmpccmrx &= (uint16_t)~TIM_CCMR1_OC2M;
MOVW	R2, #36863
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,775 :: 		tmpccmrx &= (uint16_t)~TIM_CCMR1_CC2S;
MOVW	R2, #64767
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,778 :: 		tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
LDRH	R2, [R1, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ORR	R2, R3, R2, LSL #0
; tmpccmrx start address is: 20 (R5)
UXTH	R5, R2
;stm32f4xx_tim.c,781 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC2P;
MOVW	R2, #65503
ANDS	R4, R2
UXTH	R4, R4
;stm32f4xx_tim.c,783 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 4);
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
LSLS	R2, R2, #4
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
;stm32f4xx_tim.c,786 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 4);
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
LSLS	R2, R2, #4
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
; tmpccer start address is: 16 (R4)
;stm32f4xx_tim.c,788 :: 		if((TIMx == TIM1) || (TIMx == TIM8))
MOVW	R2, #0
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC2Init148
MOVW	R2, #1024
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC2Init147
UXTH	R3, R6
IT	AL
BAL	L_TIM_OC2Init76
L__TIM_OC2Init148:
L__TIM_OC2Init147:
;stm32f4xx_tim.c,796 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC2NP;
MOVW	R2, #65407
ANDS	R4, R2
UXTH	R4, R4
; tmpccer end address is: 16 (R4)
;stm32f4xx_tim.c,798 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 4);
ADDW	R2, R1, #14
LDRH	R2, [R2, #0]
LSLS	R2, R2, #4
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
;stm32f4xx_tim.c,800 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC2NE;
MOVW	R2, #65471
ANDS	R4, R2
UXTH	R4, R4
;stm32f4xx_tim.c,803 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 4);
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
LSLS	R2, R2, #4
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
; tmpccer start address is: 16 (R4)
;stm32f4xx_tim.c,805 :: 		tmpcr2 &= (uint16_t)~TIM_CR2_OIS2;
MOVW	R2, #64511
AND	R3, R6, R2, LSL #0
UXTH	R3, R3
; tmpcr2 end address is: 24 (R6)
;stm32f4xx_tim.c,806 :: 		tmpcr2 &= (uint16_t)~TIM_CR2_OIS2N;
MOVW	R2, #63487
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,808 :: 		tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 2);
ADDW	R2, R1, #16
LDRH	R2, [R2, #0]
LSLS	R2, R2, #2
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,810 :: 		tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 2);
ADDW	R2, R1, #18
LDRH	R2, [R2, #0]
LSLS	R2, R2, #2
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
; tmpcr2 start address is: 12 (R3)
; tmpcr2 end address is: 12 (R3)
; tmpccer end address is: 16 (R4)
;stm32f4xx_tim.c,811 :: 		}
L_TIM_OC2Init76:
;stm32f4xx_tim.c,813 :: 		TIMx->CR2 = tmpcr2;
; tmpcr2 start address is: 12 (R3)
; tmpccer start address is: 16 (R4)
ADDS	R2, R0, #4
STRH	R3, [R2, #0]
; tmpcr2 end address is: 12 (R3)
;stm32f4xx_tim.c,816 :: 		TIMx->CCMR1 = tmpccmrx;
ADDW	R2, R0, #24
STRH	R5, [R2, #0]
; tmpccmrx end address is: 20 (R5)
;stm32f4xx_tim.c,819 :: 		TIMx->CCR2 = TIM_OCInitStruct->TIM_Pulse;
ADDW	R3, R0, #56
ADDW	R2, R1, #8
; TIM_OCInitStruct end address is: 4 (R1)
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_tim.c,822 :: 		TIMx->CCER = tmpccer;
ADDW	R2, R0, #32
; TIMx end address is: 0 (R0)
STRH	R4, [R2, #0]
; tmpccer end address is: 16 (R4)
;stm32f4xx_tim.c,823 :: 		}
L_end_TIM_OC2Init:
BX	LR
; end of _TIM_OC2Init
_TIM_OC3Init:
;stm32f4xx_tim.c,833 :: 		void TIM_OC3Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
; TIM_OCInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct start address is: 4 (R1)
;stm32f4xx_tim.c,835 :: 		uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
;stm32f4xx_tim.c,844 :: 		TIMx->CCER &= (uint16_t)~TIM_CCER_CC3E;
ADDW	R4, R0, #32
LDRH	R3, [R4, #0]
MOVW	R2, #65279
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,847 :: 		tmpccer = TIMx->CCER;
ADDW	R2, R0, #32
LDRH	R4, [R2, #0]
;stm32f4xx_tim.c,849 :: 		tmpcr2 =  TIMx->CR2;
ADDS	R2, R0, #4
LDRH	R2, [R2, #0]
; tmpcr2 start address is: 24 (R6)
UXTH	R6, R2
;stm32f4xx_tim.c,852 :: 		tmpccmrx = TIMx->CCMR2;
ADDW	R2, R0, #28
LDRH	R3, [R2, #0]
;stm32f4xx_tim.c,855 :: 		tmpccmrx &= (uint16_t)~TIM_CCMR2_OC3M;
MOVW	R2, #65423
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,856 :: 		tmpccmrx &= (uint16_t)~TIM_CCMR2_CC3S;
MOVW	R2, #65532
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,858 :: 		tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
LDRH	R2, [R1, #0]
ORR	R2, R3, R2, LSL #0
; tmpccmrx start address is: 20 (R5)
UXTH	R5, R2
;stm32f4xx_tim.c,861 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC3P;
MOVW	R2, #65023
ANDS	R4, R2
UXTH	R4, R4
;stm32f4xx_tim.c,863 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 8);
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
;stm32f4xx_tim.c,866 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 8);
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
; tmpccer start address is: 16 (R4)
;stm32f4xx_tim.c,868 :: 		if((TIMx == TIM1) || (TIMx == TIM8))
MOVW	R2, #0
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC3Init151
MOVW	R2, #1024
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC3Init150
UXTH	R3, R6
IT	AL
BAL	L_TIM_OC3Init79
L__TIM_OC3Init151:
L__TIM_OC3Init150:
;stm32f4xx_tim.c,876 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC3NP;
MOVW	R2, #63487
ANDS	R4, R2
UXTH	R4, R4
; tmpccer end address is: 16 (R4)
;stm32f4xx_tim.c,878 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 8);
ADDW	R2, R1, #14
LDRH	R2, [R2, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
;stm32f4xx_tim.c,880 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC3NE;
MOVW	R2, #64511
ANDS	R4, R2
UXTH	R4, R4
;stm32f4xx_tim.c,883 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 8);
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ORRS	R4, R2
UXTH	R4, R4
; tmpccer start address is: 16 (R4)
;stm32f4xx_tim.c,885 :: 		tmpcr2 &= (uint16_t)~TIM_CR2_OIS3;
MOVW	R2, #61439
AND	R3, R6, R2, LSL #0
UXTH	R3, R3
; tmpcr2 end address is: 24 (R6)
;stm32f4xx_tim.c,886 :: 		tmpcr2 &= (uint16_t)~TIM_CR2_OIS3N;
MOVW	R2, #57343
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,888 :: 		tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 4);
ADDW	R2, R1, #16
LDRH	R2, [R2, #0]
LSLS	R2, R2, #4
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,890 :: 		tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 4);
ADDW	R2, R1, #18
LDRH	R2, [R2, #0]
LSLS	R2, R2, #4
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
; tmpcr2 start address is: 12 (R3)
; tmpcr2 end address is: 12 (R3)
; tmpccer end address is: 16 (R4)
;stm32f4xx_tim.c,891 :: 		}
L_TIM_OC3Init79:
;stm32f4xx_tim.c,893 :: 		TIMx->CR2 = tmpcr2;
; tmpcr2 start address is: 12 (R3)
; tmpccer start address is: 16 (R4)
ADDS	R2, R0, #4
STRH	R3, [R2, #0]
; tmpcr2 end address is: 12 (R3)
;stm32f4xx_tim.c,896 :: 		TIMx->CCMR2 = tmpccmrx;
ADDW	R2, R0, #28
STRH	R5, [R2, #0]
; tmpccmrx end address is: 20 (R5)
;stm32f4xx_tim.c,899 :: 		TIMx->CCR3 = TIM_OCInitStruct->TIM_Pulse;
ADDW	R3, R0, #60
ADDW	R2, R1, #8
; TIM_OCInitStruct end address is: 4 (R1)
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_tim.c,902 :: 		TIMx->CCER = tmpccer;
ADDW	R2, R0, #32
; TIMx end address is: 0 (R0)
STRH	R4, [R2, #0]
; tmpccer end address is: 16 (R4)
;stm32f4xx_tim.c,903 :: 		}
L_end_TIM_OC3Init:
BX	LR
; end of _TIM_OC3Init
_TIM_OC4Init:
;stm32f4xx_tim.c,913 :: 		void TIM_OC4Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
; TIM_OCInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCInitStruct start address is: 4 (R1)
;stm32f4xx_tim.c,915 :: 		uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
;stm32f4xx_tim.c,924 :: 		TIMx->CCER &= (uint16_t)~TIM_CCER_CC4E;
ADDW	R4, R0, #32
LDRH	R3, [R4, #0]
MOVW	R2, #61439
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,927 :: 		tmpccer = TIMx->CCER;
ADDW	R2, R0, #32
LDRH	R4, [R2, #0]
;stm32f4xx_tim.c,929 :: 		tmpcr2 =  TIMx->CR2;
ADDS	R2, R0, #4
LDRH	R2, [R2, #0]
; tmpcr2 start address is: 24 (R6)
UXTH	R6, R2
;stm32f4xx_tim.c,932 :: 		tmpccmrx = TIMx->CCMR2;
ADDW	R2, R0, #28
LDRH	R3, [R2, #0]
;stm32f4xx_tim.c,935 :: 		tmpccmrx &= (uint16_t)~TIM_CCMR2_OC4M;
MOVW	R2, #36863
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,936 :: 		tmpccmrx &= (uint16_t)~TIM_CCMR2_CC4S;
MOVW	R2, #64767
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,939 :: 		tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
LDRH	R2, [R1, #0]
LSLS	R2, R2, #8
UXTH	R2, R2
ORR	R2, R3, R2, LSL #0
; tmpccmrx start address is: 20 (R5)
UXTH	R5, R2
;stm32f4xx_tim.c,942 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC4P;
MOVW	R2, #57343
AND	R3, R4, R2, LSL #0
UXTH	R3, R3
;stm32f4xx_tim.c,944 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 12);
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
LSLS	R2, R2, #12
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,947 :: 		tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 12);
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
LSLS	R2, R2, #12
UXTH	R2, R2
ORR	R2, R3, R2, LSL #0
; tmpccer start address is: 16 (R4)
UXTH	R4, R2
;stm32f4xx_tim.c,949 :: 		if((TIMx == TIM1) || (TIMx == TIM8))
MOVW	R2, #0
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC4Init154
MOVW	R2, #1024
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__TIM_OC4Init153
UXTH	R3, R6
IT	AL
BAL	L_TIM_OC4Init82
L__TIM_OC4Init154:
L__TIM_OC4Init153:
;stm32f4xx_tim.c,953 :: 		tmpcr2 &=(uint16_t) ~TIM_CR2_OIS4;
MOVW	R2, #49151
AND	R3, R6, R2, LSL #0
UXTH	R3, R3
; tmpcr2 end address is: 24 (R6)
;stm32f4xx_tim.c,955 :: 		tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 6);
ADDW	R2, R1, #16
LDRH	R2, [R2, #0]
LSLS	R2, R2, #6
UXTH	R2, R2
ORRS	R3, R2
UXTH	R3, R3
; tmpcr2 start address is: 12 (R3)
; tmpcr2 end address is: 12 (R3)
;stm32f4xx_tim.c,956 :: 		}
L_TIM_OC4Init82:
;stm32f4xx_tim.c,958 :: 		TIMx->CR2 = tmpcr2;
; tmpcr2 start address is: 12 (R3)
ADDS	R2, R0, #4
STRH	R3, [R2, #0]
; tmpcr2 end address is: 12 (R3)
;stm32f4xx_tim.c,961 :: 		TIMx->CCMR2 = tmpccmrx;
ADDW	R2, R0, #28
STRH	R5, [R2, #0]
; tmpccmrx end address is: 20 (R5)
;stm32f4xx_tim.c,964 :: 		TIMx->CCR4 = TIM_OCInitStruct->TIM_Pulse;
ADDW	R3, R0, #64
ADDW	R2, R1, #8
; TIM_OCInitStruct end address is: 4 (R1)
LDR	R2, [R2, #0]
STR	R2, [R3, #0]
;stm32f4xx_tim.c,967 :: 		TIMx->CCER = tmpccer;
ADDW	R2, R0, #32
; TIMx end address is: 0 (R0)
STRH	R4, [R2, #0]
; tmpccer end address is: 16 (R4)
;stm32f4xx_tim.c,968 :: 		}
L_end_TIM_OC4Init:
BX	LR
; end of _TIM_OC4Init
_TIM_OCStructInit:
;stm32f4xx_tim.c,976 :: 		void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct)
; TIM_OCInitStruct start address is: 0 (R0)
; TIM_OCInitStruct end address is: 0 (R0)
; TIM_OCInitStruct start address is: 0 (R0)
;stm32f4xx_tim.c,979 :: 		TIM_OCInitStruct->TIM_OCMode = TIM_OCMode_Timing;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f4xx_tim.c,980 :: 		TIM_OCInitStruct->TIM_OutputState = TIM_OutputState_Disable;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,981 :: 		TIM_OCInitStruct->TIM_OutputNState = TIM_OutputNState_Disable;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,982 :: 		TIM_OCInitStruct->TIM_Pulse = 0x00000000;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_tim.c,983 :: 		TIM_OCInitStruct->TIM_OCPolarity = TIM_OCPolarity_High;
ADDW	R2, R0, #12
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,984 :: 		TIM_OCInitStruct->TIM_OCNPolarity = TIM_OCPolarity_High;
ADDW	R2, R0, #14
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,985 :: 		TIM_OCInitStruct->TIM_OCIdleState = TIM_OCIdleState_Reset;
ADDW	R2, R0, #16
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,986 :: 		TIM_OCInitStruct->TIM_OCNIdleState = TIM_OCNIdleState_Reset;
ADDW	R2, R0, #18
; TIM_OCInitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,987 :: 		}
L_end_TIM_OCStructInit:
BX	LR
; end of _TIM_OCStructInit
_TIM_SelectOCxM:
;stm32f4xx_tim.c,1012 :: 		void TIM_SelectOCxM(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode)
; TIM_OCMode start address is: 8 (R2)
; TIM_Channel start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCMode end address is: 8 (R2)
; TIM_Channel end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_Channel start address is: 4 (R1)
; TIM_OCMode start address is: 8 (R2)
;stm32f4xx_tim.c,1014 :: 		uint32_t tmp = 0;
;stm32f4xx_tim.c,1015 :: 		uint16_t tmp1 = 0;
;stm32f4xx_tim.c,1023 :: 		tmp += CCMR_OFFSET;
ADDW	R3, R0, #24
; tmp start address is: 24 (R6)
MOV	R6, R3
;stm32f4xx_tim.c,1025 :: 		tmp1 = CCER_CCE_SET << (uint16_t)TIM_Channel;
MOVW	R3, #1
LSLS	R3, R1
UXTH	R3, R3
;stm32f4xx_tim.c,1028 :: 		TIMx->CCER &= (uint16_t) ~tmp1;
ADDW	R5, R0, #32
; TIMx end address is: 0 (R0)
MVN	R4, R3
UXTH	R4, R4
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f4xx_tim.c,1030 :: 		if((TIM_Channel == TIM_Channel_1) ||(TIM_Channel == TIM_Channel_3))
CMP	R1, #0
IT	EQ
BEQ	L__TIM_SelectOCxM157
CMP	R1, #8
IT	EQ
BEQ	L__TIM_SelectOCxM156
IT	AL
BAL	L_TIM_SelectOCxM85
L__TIM_SelectOCxM157:
L__TIM_SelectOCxM156:
;stm32f4xx_tim.c,1032 :: 		tmp += (TIM_Channel>>1);
LSRS	R3, R1, #1
UXTH	R3, R3
; TIM_Channel end address is: 4 (R1)
ADDS	R5, R6, R3
; tmp end address is: 24 (R6)
; tmp start address is: 0 (R0)
MOV	R0, R5
;stm32f4xx_tim.c,1035 :: 		*(__IO uint32_t *) tmp &= CCMR_OC13M_MASK;
LDR	R4, [R5, #0]
MOVW	R3, #65423
AND	R3, R4, R3, LSL #0
STR	R3, [R5, #0]
;stm32f4xx_tim.c,1038 :: 		*(__IO uint32_t *) tmp |= TIM_OCMode;
LDR	R3, [R0, #0]
ORRS	R3, R2
; TIM_OCMode end address is: 8 (R2)
STR	R3, [R0, #0]
; tmp end address is: 0 (R0)
;stm32f4xx_tim.c,1039 :: 		}
IT	AL
BAL	L_TIM_SelectOCxM86
L_TIM_SelectOCxM85:
;stm32f4xx_tim.c,1042 :: 		tmp += (uint16_t)(TIM_Channel - (uint16_t)4)>> (uint16_t)1;
; tmp start address is: 24 (R6)
; TIM_OCMode start address is: 8 (R2)
; TIM_Channel start address is: 4 (R1)
SUBS	R3, R1, #4
UXTH	R3, R3
; TIM_Channel end address is: 4 (R1)
LSRS	R3, R3, #1
UXTH	R3, R3
ADDS	R5, R6, R3
; tmp end address is: 24 (R6)
; tmp start address is: 0 (R0)
MOV	R0, R5
;stm32f4xx_tim.c,1045 :: 		*(__IO uint32_t *) tmp &= CCMR_OC24M_MASK;
LDR	R4, [R5, #0]
MOVW	R3, #36863
AND	R3, R4, R3, LSL #0
STR	R3, [R5, #0]
;stm32f4xx_tim.c,1048 :: 		*(__IO uint32_t *) tmp |= (uint16_t)(TIM_OCMode << 8);
LSLS	R4, R2, #8
UXTH	R4, R4
; TIM_OCMode end address is: 8 (R2)
LDR	R3, [R0, #0]
ORRS	R3, R4
STR	R3, [R0, #0]
; tmp end address is: 0 (R0)
;stm32f4xx_tim.c,1049 :: 		}
L_TIM_SelectOCxM86:
;stm32f4xx_tim.c,1050 :: 		}
L_end_TIM_SelectOCxM:
BX	LR
; end of _TIM_SelectOCxM
_TIM_SetCompare1:
;stm32f4xx_tim.c,1058 :: 		void TIM_SetCompare1(TIM_TypeDef* TIMx, uint32_t Compare1)
; Compare1 start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; Compare1 end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Compare1 start address is: 4 (R1)
;stm32f4xx_tim.c,1064 :: 		TIMx->CCR1 = Compare1;
ADDW	R2, R0, #52
; TIMx end address is: 0 (R0)
STR	R1, [R2, #0]
; Compare1 end address is: 4 (R1)
;stm32f4xx_tim.c,1065 :: 		}
L_end_TIM_SetCompare1:
BX	LR
; end of _TIM_SetCompare1
_TIM_SetCompare2:
;stm32f4xx_tim.c,1074 :: 		void TIM_SetCompare2(TIM_TypeDef* TIMx, uint32_t Compare2)
; Compare2 start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; Compare2 end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Compare2 start address is: 4 (R1)
;stm32f4xx_tim.c,1080 :: 		TIMx->CCR2 = Compare2;
ADDW	R2, R0, #56
; TIMx end address is: 0 (R0)
STR	R1, [R2, #0]
; Compare2 end address is: 4 (R1)
;stm32f4xx_tim.c,1081 :: 		}
L_end_TIM_SetCompare2:
BX	LR
; end of _TIM_SetCompare2
_TIM_SetCompare3:
;stm32f4xx_tim.c,1089 :: 		void TIM_SetCompare3(TIM_TypeDef* TIMx, uint32_t Compare3)
; Compare3 start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; Compare3 end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Compare3 start address is: 4 (R1)
;stm32f4xx_tim.c,1095 :: 		TIMx->CCR3 = Compare3;
ADDW	R2, R0, #60
; TIMx end address is: 0 (R0)
STR	R1, [R2, #0]
; Compare3 end address is: 4 (R1)
;stm32f4xx_tim.c,1096 :: 		}
L_end_TIM_SetCompare3:
BX	LR
; end of _TIM_SetCompare3
_TIM_SetCompare4:
;stm32f4xx_tim.c,1104 :: 		void TIM_SetCompare4(TIM_TypeDef* TIMx, uint32_t Compare4)
; Compare4 start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; Compare4 end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; Compare4 start address is: 4 (R1)
;stm32f4xx_tim.c,1110 :: 		TIMx->CCR4 = Compare4;
ADDW	R2, R0, #64
; TIMx end address is: 0 (R0)
STR	R1, [R2, #0]
; Compare4 end address is: 4 (R1)
;stm32f4xx_tim.c,1111 :: 		}
L_end_TIM_SetCompare4:
BX	LR
; end of _TIM_SetCompare4
_TIM_ForcedOC1Config:
;stm32f4xx_tim.c,1122 :: 		void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
; TIM_ForcedAction start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction start address is: 4 (R1)
;stm32f4xx_tim.c,1124 :: 		uint16_t tmpccmr1 = 0;
;stm32f4xx_tim.c,1129 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1132 :: 		tmpccmr1 &= (uint16_t)~TIM_CCMR1_OC1M;
MOVW	R2, #65423
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f4xx_tim.c,1135 :: 		tmpccmr1 |= TIM_ForcedAction;
ORRS	R2, R1
; TIM_ForcedAction end address is: 4 (R1)
;stm32f4xx_tim.c,1138 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1139 :: 		}
L_end_TIM_ForcedOC1Config:
BX	LR
; end of _TIM_ForcedOC1Config
_TIM_ForcedOC2Config:
;stm32f4xx_tim.c,1151 :: 		void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
; TIM_ForcedAction start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction start address is: 4 (R1)
;stm32f4xx_tim.c,1153 :: 		uint16_t tmpccmr1 = 0;
;stm32f4xx_tim.c,1158 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1161 :: 		tmpccmr1 &= (uint16_t)~TIM_CCMR1_OC2M;
MOVW	R2, #36863
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1164 :: 		tmpccmr1 |= (uint16_t)(TIM_ForcedAction << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_ForcedAction end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1167 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1168 :: 		}
L_end_TIM_ForcedOC2Config:
BX	LR
; end of _TIM_ForcedOC2Config
_TIM_ForcedOC3Config:
;stm32f4xx_tim.c,1179 :: 		void TIM_ForcedOC3Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
; TIM_ForcedAction start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction start address is: 4 (R1)
;stm32f4xx_tim.c,1181 :: 		uint16_t tmpccmr2 = 0;
;stm32f4xx_tim.c,1187 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1190 :: 		tmpccmr2 &= (uint16_t)~TIM_CCMR2_OC3M;
MOVW	R2, #65423
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f4xx_tim.c,1193 :: 		tmpccmr2 |= TIM_ForcedAction;
ORRS	R2, R1
; TIM_ForcedAction end address is: 4 (R1)
;stm32f4xx_tim.c,1196 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1197 :: 		}
L_end_TIM_ForcedOC3Config:
BX	LR
; end of _TIM_ForcedOC3Config
_TIM_ForcedOC4Config:
;stm32f4xx_tim.c,1208 :: 		void TIM_ForcedOC4Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
; TIM_ForcedAction start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ForcedAction start address is: 4 (R1)
;stm32f4xx_tim.c,1210 :: 		uint16_t tmpccmr2 = 0;
;stm32f4xx_tim.c,1215 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1218 :: 		tmpccmr2 &= (uint16_t)~TIM_CCMR2_OC4M;
MOVW	R2, #36863
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1221 :: 		tmpccmr2 |= (uint16_t)(TIM_ForcedAction << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_ForcedAction end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1224 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1225 :: 		}
L_end_TIM_ForcedOC4Config:
BX	LR
; end of _TIM_ForcedOC4Config
_TIM_OC1PreloadConfig:
;stm32f4xx_tim.c,1236 :: 		void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
; TIM_OCPreload start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPreload end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPreload start address is: 4 (R1)
;stm32f4xx_tim.c,1238 :: 		uint16_t tmpccmr1 = 0;
;stm32f4xx_tim.c,1244 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1247 :: 		tmpccmr1 &= (uint16_t)(~TIM_CCMR1_OC1PE);
MOVW	R2, #65527
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f4xx_tim.c,1250 :: 		tmpccmr1 |= TIM_OCPreload;
ORRS	R2, R1
; TIM_OCPreload end address is: 4 (R1)
;stm32f4xx_tim.c,1253 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1254 :: 		}
L_end_TIM_OC1PreloadConfig:
BX	LR
; end of _TIM_OC1PreloadConfig
_TIM_OC2PreloadConfig:
;stm32f4xx_tim.c,1266 :: 		void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
; TIM_OCPreload start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPreload end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPreload start address is: 4 (R1)
;stm32f4xx_tim.c,1268 :: 		uint16_t tmpccmr1 = 0;
;stm32f4xx_tim.c,1274 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1277 :: 		tmpccmr1 &= (uint16_t)(~TIM_CCMR1_OC2PE);
MOVW	R2, #63487
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1280 :: 		tmpccmr1 |= (uint16_t)(TIM_OCPreload << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCPreload end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1283 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1284 :: 		}
L_end_TIM_OC2PreloadConfig:
BX	LR
; end of _TIM_OC2PreloadConfig
_TIM_OC3PreloadConfig:
;stm32f4xx_tim.c,1295 :: 		void TIM_OC3PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
; TIM_OCPreload start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPreload end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPreload start address is: 4 (R1)
;stm32f4xx_tim.c,1297 :: 		uint16_t tmpccmr2 = 0;
;stm32f4xx_tim.c,1303 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1306 :: 		tmpccmr2 &= (uint16_t)(~TIM_CCMR2_OC3PE);
MOVW	R2, #65527
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f4xx_tim.c,1309 :: 		tmpccmr2 |= TIM_OCPreload;
ORRS	R2, R1
; TIM_OCPreload end address is: 4 (R1)
;stm32f4xx_tim.c,1312 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1313 :: 		}
L_end_TIM_OC3PreloadConfig:
BX	LR
; end of _TIM_OC3PreloadConfig
_TIM_OC4PreloadConfig:
;stm32f4xx_tim.c,1324 :: 		void TIM_OC4PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
; TIM_OCPreload start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPreload end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPreload start address is: 4 (R1)
;stm32f4xx_tim.c,1326 :: 		uint16_t tmpccmr2 = 0;
;stm32f4xx_tim.c,1332 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1335 :: 		tmpccmr2 &= (uint16_t)(~TIM_CCMR2_OC4PE);
MOVW	R2, #63487
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1338 :: 		tmpccmr2 |= (uint16_t)(TIM_OCPreload << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCPreload end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1341 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1342 :: 		}
L_end_TIM_OC4PreloadConfig:
BX	LR
; end of _TIM_OC4PreloadConfig
_TIM_OC1FastConfig:
;stm32f4xx_tim.c,1353 :: 		void TIM_OC1FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
; TIM_OCFast start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCFast end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCFast start address is: 4 (R1)
;stm32f4xx_tim.c,1355 :: 		uint16_t tmpccmr1 = 0;
;stm32f4xx_tim.c,1362 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1365 :: 		tmpccmr1 &= (uint16_t)~TIM_CCMR1_OC1FE;
MOVW	R2, #65531
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f4xx_tim.c,1368 :: 		tmpccmr1 |= TIM_OCFast;
ORRS	R2, R1
; TIM_OCFast end address is: 4 (R1)
;stm32f4xx_tim.c,1371 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1372 :: 		}
L_end_TIM_OC1FastConfig:
BX	LR
; end of _TIM_OC1FastConfig
_TIM_OC2FastConfig:
;stm32f4xx_tim.c,1384 :: 		void TIM_OC2FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
; TIM_OCFast start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCFast end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCFast start address is: 4 (R1)
;stm32f4xx_tim.c,1386 :: 		uint16_t tmpccmr1 = 0;
;stm32f4xx_tim.c,1393 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1396 :: 		tmpccmr1 &= (uint16_t)(~TIM_CCMR1_OC2FE);
MOVW	R2, #64511
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1399 :: 		tmpccmr1 |= (uint16_t)(TIM_OCFast << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCFast end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1402 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1403 :: 		}
L_end_TIM_OC2FastConfig:
BX	LR
; end of _TIM_OC2FastConfig
_TIM_OC3FastConfig:
;stm32f4xx_tim.c,1414 :: 		void TIM_OC3FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
; TIM_OCFast start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCFast end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCFast start address is: 4 (R1)
;stm32f4xx_tim.c,1416 :: 		uint16_t tmpccmr2 = 0;
;stm32f4xx_tim.c,1423 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1426 :: 		tmpccmr2 &= (uint16_t)~TIM_CCMR2_OC3FE;
MOVW	R2, #65531
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f4xx_tim.c,1429 :: 		tmpccmr2 |= TIM_OCFast;
ORRS	R2, R1
; TIM_OCFast end address is: 4 (R1)
;stm32f4xx_tim.c,1432 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1433 :: 		}
L_end_TIM_OC3FastConfig:
BX	LR
; end of _TIM_OC3FastConfig
_TIM_OC4FastConfig:
;stm32f4xx_tim.c,1444 :: 		void TIM_OC4FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
; TIM_OCFast start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCFast end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCFast start address is: 4 (R1)
;stm32f4xx_tim.c,1446 :: 		uint16_t tmpccmr2 = 0;
;stm32f4xx_tim.c,1453 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1456 :: 		tmpccmr2 &= (uint16_t)(~TIM_CCMR2_OC4FE);
MOVW	R2, #64511
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1459 :: 		tmpccmr2 |= (uint16_t)(TIM_OCFast << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCFast end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1462 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1463 :: 		}
L_end_TIM_OC4FastConfig:
BX	LR
; end of _TIM_OC4FastConfig
_TIM_ClearOC1Ref:
;stm32f4xx_tim.c,1474 :: 		void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
; TIM_OCClear start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCClear end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCClear start address is: 4 (R1)
;stm32f4xx_tim.c,1476 :: 		uint16_t tmpccmr1 = 0;
;stm32f4xx_tim.c,1482 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1485 :: 		tmpccmr1 &= (uint16_t)~TIM_CCMR1_OC1CE;
MOVW	R2, #65407
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f4xx_tim.c,1488 :: 		tmpccmr1 |= TIM_OCClear;
ORRS	R2, R1
; TIM_OCClear end address is: 4 (R1)
;stm32f4xx_tim.c,1491 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1492 :: 		}
L_end_TIM_ClearOC1Ref:
BX	LR
; end of _TIM_ClearOC1Ref
_TIM_ClearOC2Ref:
;stm32f4xx_tim.c,1504 :: 		void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
; TIM_OCClear start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCClear end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCClear start address is: 4 (R1)
;stm32f4xx_tim.c,1506 :: 		uint16_t tmpccmr1 = 0;
;stm32f4xx_tim.c,1512 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1515 :: 		tmpccmr1 &= (uint16_t)~TIM_CCMR1_OC2CE;
MOVW	R2, #32767
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1518 :: 		tmpccmr1 |= (uint16_t)(TIM_OCClear << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCClear end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1521 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1522 :: 		}
L_end_TIM_ClearOC2Ref:
BX	LR
; end of _TIM_ClearOC2Ref
_TIM_ClearOC3Ref:
;stm32f4xx_tim.c,1533 :: 		void TIM_ClearOC3Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
; TIM_OCClear start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCClear end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCClear start address is: 4 (R1)
;stm32f4xx_tim.c,1535 :: 		uint16_t tmpccmr2 = 0;
;stm32f4xx_tim.c,1541 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1544 :: 		tmpccmr2 &= (uint16_t)~TIM_CCMR2_OC3CE;
MOVW	R2, #65407
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f4xx_tim.c,1547 :: 		tmpccmr2 |= TIM_OCClear;
ORRS	R2, R1
; TIM_OCClear end address is: 4 (R1)
;stm32f4xx_tim.c,1550 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1551 :: 		}
L_end_TIM_ClearOC3Ref:
BX	LR
; end of _TIM_ClearOC3Ref
_TIM_ClearOC4Ref:
;stm32f4xx_tim.c,1562 :: 		void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
; TIM_OCClear start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCClear end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCClear start address is: 4 (R1)
;stm32f4xx_tim.c,1564 :: 		uint16_t tmpccmr2 = 0;
;stm32f4xx_tim.c,1570 :: 		tmpccmr2 = TIMx->CCMR2;
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1573 :: 		tmpccmr2 &= (uint16_t)~TIM_CCMR2_OC4CE;
MOVW	R2, #32767
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1576 :: 		tmpccmr2 |= (uint16_t)(TIM_OCClear << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCClear end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1579 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1580 :: 		}
L_end_TIM_ClearOC4Ref:
BX	LR
; end of _TIM_ClearOC4Ref
_TIM_OC1PolarityConfig:
;stm32f4xx_tim.c,1591 :: 		void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
; TIM_OCPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity start address is: 4 (R1)
;stm32f4xx_tim.c,1593 :: 		uint16_t tmpccer = 0;
;stm32f4xx_tim.c,1599 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1602 :: 		tmpccer &= (uint16_t)(~TIM_CCER_CC1P);
MOVW	R2, #65533
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f4xx_tim.c,1603 :: 		tmpccer |= TIM_OCPolarity;
ORRS	R2, R1
; TIM_OCPolarity end address is: 4 (R1)
;stm32f4xx_tim.c,1606 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1607 :: 		}
L_end_TIM_OC1PolarityConfig:
BX	LR
; end of _TIM_OC1PolarityConfig
_TIM_OC1NPolarityConfig:
;stm32f4xx_tim.c,1618 :: 		void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
; TIM_OCNPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCNPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCNPolarity start address is: 4 (R1)
;stm32f4xx_tim.c,1620 :: 		uint16_t tmpccer = 0;
;stm32f4xx_tim.c,1625 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1628 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC1NP;
MOVW	R2, #65527
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f4xx_tim.c,1629 :: 		tmpccer |= TIM_OCNPolarity;
ORRS	R2, R1
; TIM_OCNPolarity end address is: 4 (R1)
;stm32f4xx_tim.c,1632 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1633 :: 		}
L_end_TIM_OC1NPolarityConfig:
BX	LR
; end of _TIM_OC1NPolarityConfig
_TIM_OC2PolarityConfig:
;stm32f4xx_tim.c,1645 :: 		void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
; TIM_OCPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity start address is: 4 (R1)
;stm32f4xx_tim.c,1647 :: 		uint16_t tmpccer = 0;
;stm32f4xx_tim.c,1653 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1656 :: 		tmpccer &= (uint16_t)(~TIM_CCER_CC2P);
MOVW	R2, #65503
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1657 :: 		tmpccer |= (uint16_t)(TIM_OCPolarity << 4);
LSLS	R2, R1, #4
UXTH	R2, R2
; TIM_OCPolarity end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1660 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1661 :: 		}
L_end_TIM_OC2PolarityConfig:
BX	LR
; end of _TIM_OC2PolarityConfig
_TIM_OC2NPolarityConfig:
;stm32f4xx_tim.c,1672 :: 		void TIM_OC2NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
; TIM_OCNPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCNPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCNPolarity start address is: 4 (R1)
;stm32f4xx_tim.c,1674 :: 		uint16_t tmpccer = 0;
;stm32f4xx_tim.c,1680 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1683 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC2NP;
MOVW	R2, #65407
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1684 :: 		tmpccer |= (uint16_t)(TIM_OCNPolarity << 4);
LSLS	R2, R1, #4
UXTH	R2, R2
; TIM_OCNPolarity end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1687 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1688 :: 		}
L_end_TIM_OC2NPolarityConfig:
BX	LR
; end of _TIM_OC2NPolarityConfig
_TIM_OC3PolarityConfig:
;stm32f4xx_tim.c,1699 :: 		void TIM_OC3PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
; TIM_OCPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity start address is: 4 (R1)
;stm32f4xx_tim.c,1701 :: 		uint16_t tmpccer = 0;
;stm32f4xx_tim.c,1707 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1710 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC3P;
MOVW	R2, #65023
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1711 :: 		tmpccer |= (uint16_t)(TIM_OCPolarity << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCPolarity end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1714 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1715 :: 		}
L_end_TIM_OC3PolarityConfig:
BX	LR
; end of _TIM_OC3PolarityConfig
_TIM_OC3NPolarityConfig:
;stm32f4xx_tim.c,1726 :: 		void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
; TIM_OCNPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCNPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCNPolarity start address is: 4 (R1)
;stm32f4xx_tim.c,1728 :: 		uint16_t tmpccer = 0;
;stm32f4xx_tim.c,1734 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1737 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC3NP;
MOVW	R2, #63487
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1738 :: 		tmpccer |= (uint16_t)(TIM_OCNPolarity << 8);
LSLS	R2, R1, #8
UXTH	R2, R2
; TIM_OCNPolarity end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1741 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1742 :: 		}
L_end_TIM_OC3NPolarityConfig:
BX	LR
; end of _TIM_OC3NPolarityConfig
_TIM_OC4PolarityConfig:
;stm32f4xx_tim.c,1753 :: 		void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
; TIM_OCPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_OCPolarity start address is: 4 (R1)
;stm32f4xx_tim.c,1755 :: 		uint16_t tmpccer = 0;
;stm32f4xx_tim.c,1761 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,1764 :: 		tmpccer &= (uint16_t)~TIM_CCER_CC4P;
MOVW	R2, #57343
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_tim.c,1765 :: 		tmpccer |= (uint16_t)(TIM_OCPolarity << 12);
LSLS	R2, R1, #12
UXTH	R2, R2
; TIM_OCPolarity end address is: 4 (R1)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_tim.c,1768 :: 		TIMx->CCER = tmpccer;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,1769 :: 		}
L_end_TIM_OC4PolarityConfig:
BX	LR
; end of _TIM_OC4PolarityConfig
_TIM_CCxCmd:
;stm32f4xx_tim.c,1784 :: 		void TIM_CCxCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCx)
; TIM_CCx start address is: 8 (R2)
; TIM_Channel start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_CCx end address is: 8 (R2)
; TIM_Channel end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_Channel start address is: 4 (R1)
; TIM_CCx start address is: 8 (R2)
;stm32f4xx_tim.c,1786 :: 		uint16_t tmp = 0;
;stm32f4xx_tim.c,1793 :: 		tmp = CCER_CCE_SET << TIM_Channel;
MOVW	R3, #1
LSLS	R3, R1
UXTH	R3, R3
;stm32f4xx_tim.c,1796 :: 		TIMx->CCER &= (uint16_t)~ tmp;
ADDW	R5, R0, #32
MVN	R4, R3
UXTH	R4, R4
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f4xx_tim.c,1799 :: 		TIMx->CCER |=  (uint16_t)(TIM_CCx << TIM_Channel);
ADDW	R5, R0, #32
; TIMx end address is: 0 (R0)
LSL	R4, R2, R1
UXTH	R4, R4
; TIM_Channel end address is: 4 (R1)
; TIM_CCx end address is: 8 (R2)
LDRH	R3, [R5, #0]
ORRS	R3, R4
STRH	R3, [R5, #0]
;stm32f4xx_tim.c,1800 :: 		}
L_end_TIM_CCxCmd:
BX	LR
; end of _TIM_CCxCmd
_TIM_CCxNCmd:
;stm32f4xx_tim.c,1814 :: 		void TIM_CCxNCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCxN)
; TIM_CCxN start address is: 8 (R2)
; TIM_Channel start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_CCxN end address is: 8 (R2)
; TIM_Channel end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_Channel start address is: 4 (R1)
; TIM_CCxN start address is: 8 (R2)
;stm32f4xx_tim.c,1816 :: 		uint16_t tmp = 0;
;stm32f4xx_tim.c,1823 :: 		tmp = CCER_CCNE_SET << TIM_Channel;
MOVW	R3, #4
LSLS	R3, R1
UXTH	R3, R3
;stm32f4xx_tim.c,1826 :: 		TIMx->CCER &= (uint16_t) ~tmp;
ADDW	R5, R0, #32
MVN	R4, R3
UXTH	R4, R4
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f4xx_tim.c,1829 :: 		TIMx->CCER |=  (uint16_t)(TIM_CCxN << TIM_Channel);
ADDW	R5, R0, #32
; TIMx end address is: 0 (R0)
LSL	R4, R2, R1
UXTH	R4, R4
; TIM_Channel end address is: 4 (R1)
; TIM_CCxN end address is: 8 (R2)
LDRH	R3, [R5, #0]
ORRS	R3, R4
STRH	R3, [R5, #0]
;stm32f4xx_tim.c,1830 :: 		}
L_end_TIM_CCxNCmd:
BX	LR
; end of _TIM_CCxNCmd
_TIM_ICInit:
;stm32f4xx_tim.c,1896 :: 		void TIM_ICInit(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
; TIM_ICInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R10, R0
MOV	R11, R1
; TIM_ICInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 40 (R10)
; TIM_ICInitStruct start address is: 44 (R11)
;stm32f4xx_tim.c,1905 :: 		if (TIM_ICInitStruct->TIM_Channel == TIM_Channel_1)
LDRH	R2, [R11, #0]
CMP	R2, #0
IT	NE
BNE	L_TIM_ICInit87
;stm32f4xx_tim.c,1910 :: 		TIM_ICInitStruct->TIM_ICFilter);
ADD	R2, R11, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
;stm32f4xx_tim.c,1909 :: 		TIM_ICInitStruct->TIM_ICSelection,
ADD	R2, R11, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
;stm32f4xx_tim.c,1908 :: 		TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
ADD	R2, R11, #2
LDRH	R2, [R2, #0]
UXTH	R1, R2
;stm32f4xx_tim.c,1909 :: 		TIM_ICInitStruct->TIM_ICSelection,
UXTH	R2, R3
;stm32f4xx_tim.c,1910 :: 		TIM_ICInitStruct->TIM_ICFilter);
UXTH	R3, R4
;stm32f4xx_tim.c,1908 :: 		TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
MOV	R0, R10
;stm32f4xx_tim.c,1910 :: 		TIM_ICInitStruct->TIM_ICFilter);
BL	stm32f4xx_tim_TI1_Config+0
;stm32f4xx_tim.c,1912 :: 		TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R11, #6
; TIM_ICInitStruct end address is: 44 (R11)
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R10
; TIMx end address is: 40 (R10)
BL	_TIM_SetIC1Prescaler+0
;stm32f4xx_tim.c,1913 :: 		}
IT	AL
BAL	L_TIM_ICInit88
L_TIM_ICInit87:
;stm32f4xx_tim.c,1914 :: 		else if (TIM_ICInitStruct->TIM_Channel == TIM_Channel_2)
; TIM_ICInitStruct start address is: 44 (R11)
; TIMx start address is: 40 (R10)
LDRH	R2, [R11, #0]
CMP	R2, #4
IT	NE
BNE	L_TIM_ICInit89
;stm32f4xx_tim.c,1920 :: 		TIM_ICInitStruct->TIM_ICFilter);
ADD	R2, R11, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
;stm32f4xx_tim.c,1919 :: 		TIM_ICInitStruct->TIM_ICSelection,
ADD	R2, R11, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
;stm32f4xx_tim.c,1918 :: 		TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
ADD	R2, R11, #2
LDRH	R2, [R2, #0]
UXTH	R1, R2
;stm32f4xx_tim.c,1919 :: 		TIM_ICInitStruct->TIM_ICSelection,
UXTH	R2, R3
;stm32f4xx_tim.c,1920 :: 		TIM_ICInitStruct->TIM_ICFilter);
UXTH	R3, R4
;stm32f4xx_tim.c,1918 :: 		TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
MOV	R0, R10
;stm32f4xx_tim.c,1920 :: 		TIM_ICInitStruct->TIM_ICFilter);
BL	stm32f4xx_tim_TI2_Config+0
;stm32f4xx_tim.c,1922 :: 		TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R11, #6
; TIM_ICInitStruct end address is: 44 (R11)
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R10
; TIMx end address is: 40 (R10)
BL	_TIM_SetIC2Prescaler+0
;stm32f4xx_tim.c,1923 :: 		}
IT	AL
BAL	L_TIM_ICInit90
L_TIM_ICInit89:
;stm32f4xx_tim.c,1924 :: 		else if (TIM_ICInitStruct->TIM_Channel == TIM_Channel_3)
; TIM_ICInitStruct start address is: 44 (R11)
; TIMx start address is: 40 (R10)
LDRH	R2, [R11, #0]
CMP	R2, #8
IT	NE
BNE	L_TIM_ICInit91
;stm32f4xx_tim.c,1930 :: 		TIM_ICInitStruct->TIM_ICFilter);
ADD	R2, R11, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
;stm32f4xx_tim.c,1929 :: 		TIM_ICInitStruct->TIM_ICSelection,
ADD	R2, R11, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
;stm32f4xx_tim.c,1928 :: 		TI3_Config(TIMx,  TIM_ICInitStruct->TIM_ICPolarity,
ADD	R2, R11, #2
LDRH	R2, [R2, #0]
UXTH	R1, R2
;stm32f4xx_tim.c,1929 :: 		TIM_ICInitStruct->TIM_ICSelection,
UXTH	R2, R3
;stm32f4xx_tim.c,1930 :: 		TIM_ICInitStruct->TIM_ICFilter);
UXTH	R3, R4
;stm32f4xx_tim.c,1928 :: 		TI3_Config(TIMx,  TIM_ICInitStruct->TIM_ICPolarity,
MOV	R0, R10
;stm32f4xx_tim.c,1930 :: 		TIM_ICInitStruct->TIM_ICFilter);
BL	stm32f4xx_tim_TI3_Config+0
;stm32f4xx_tim.c,1932 :: 		TIM_SetIC3Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R11, #6
; TIM_ICInitStruct end address is: 44 (R11)
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R10
; TIMx end address is: 40 (R10)
BL	_TIM_SetIC3Prescaler+0
;stm32f4xx_tim.c,1933 :: 		}
IT	AL
BAL	L_TIM_ICInit92
L_TIM_ICInit91:
;stm32f4xx_tim.c,1940 :: 		TIM_ICInitStruct->TIM_ICFilter);
; TIM_ICInitStruct start address is: 44 (R11)
; TIMx start address is: 40 (R10)
ADD	R2, R11, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
;stm32f4xx_tim.c,1939 :: 		TIM_ICInitStruct->TIM_ICSelection,
ADD	R2, R11, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
;stm32f4xx_tim.c,1938 :: 		TI4_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
ADD	R2, R11, #2
LDRH	R2, [R2, #0]
UXTH	R1, R2
;stm32f4xx_tim.c,1939 :: 		TIM_ICInitStruct->TIM_ICSelection,
UXTH	R2, R3
;stm32f4xx_tim.c,1940 :: 		TIM_ICInitStruct->TIM_ICFilter);
UXTH	R3, R4
;stm32f4xx_tim.c,1938 :: 		TI4_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
MOV	R0, R10
;stm32f4xx_tim.c,1940 :: 		TIM_ICInitStruct->TIM_ICFilter);
BL	stm32f4xx_tim_TI4_Config+0
;stm32f4xx_tim.c,1942 :: 		TIM_SetIC4Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R11, #6
; TIM_ICInitStruct end address is: 44 (R11)
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R10
; TIMx end address is: 40 (R10)
BL	_TIM_SetIC4Prescaler+0
;stm32f4xx_tim.c,1943 :: 		}
L_TIM_ICInit92:
L_TIM_ICInit90:
L_TIM_ICInit88:
;stm32f4xx_tim.c,1944 :: 		}
L_end_TIM_ICInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_ICInit
_TIM_ICStructInit:
;stm32f4xx_tim.c,1952 :: 		void TIM_ICStructInit(TIM_ICInitTypeDef* TIM_ICInitStruct)
; TIM_ICInitStruct start address is: 0 (R0)
; TIM_ICInitStruct end address is: 0 (R0)
; TIM_ICInitStruct start address is: 0 (R0)
;stm32f4xx_tim.c,1955 :: 		TIM_ICInitStruct->TIM_Channel = TIM_Channel_1;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f4xx_tim.c,1956 :: 		TIM_ICInitStruct->TIM_ICPolarity = TIM_ICPolarity_Rising;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,1957 :: 		TIM_ICInitStruct->TIM_ICSelection = TIM_ICSelection_DirectTI;
ADDS	R2, R0, #4
MOVW	R1, #1
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,1958 :: 		TIM_ICInitStruct->TIM_ICPrescaler = TIM_ICPSC_DIV1;
ADDS	R2, R0, #6
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,1959 :: 		TIM_ICInitStruct->TIM_ICFilter = 0x00;
ADDW	R2, R0, #8
; TIM_ICInitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,1960 :: 		}
L_end_TIM_ICStructInit:
BX	LR
; end of _TIM_ICStructInit
_TIM_PWMIConfig:
;stm32f4xx_tim.c,1971 :: 		void TIM_PWMIConfig(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
; TIM_ICInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R10, R0
MOV	R11, R1
; TIM_ICInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 40 (R10)
; TIM_ICInitStruct start address is: 44 (R11)
;stm32f4xx_tim.c,1973 :: 		uint16_t icoppositepolarity = TIM_ICPolarity_Rising;
;stm32f4xx_tim.c,1974 :: 		uint16_t icoppositeselection = TIM_ICSelection_DirectTI;
;stm32f4xx_tim.c,1980 :: 		if (TIM_ICInitStruct->TIM_ICPolarity == TIM_ICPolarity_Rising)
ADD	R2, R11, #2
LDRH	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_TIM_PWMIConfig93
;stm32f4xx_tim.c,1982 :: 		icoppositepolarity = TIM_ICPolarity_Falling;
; icoppositepolarity start address is: 48 (R12)
MOVW	R12, #2
;stm32f4xx_tim.c,1983 :: 		}
; icoppositepolarity end address is: 48 (R12)
IT	AL
BAL	L_TIM_PWMIConfig94
L_TIM_PWMIConfig93:
;stm32f4xx_tim.c,1986 :: 		icoppositepolarity = TIM_ICPolarity_Rising;
; icoppositepolarity start address is: 48 (R12)
MOVW	R12, #0
; icoppositepolarity end address is: 48 (R12)
;stm32f4xx_tim.c,1987 :: 		}
L_TIM_PWMIConfig94:
;stm32f4xx_tim.c,1989 :: 		if (TIM_ICInitStruct->TIM_ICSelection == TIM_ICSelection_DirectTI)
; icoppositepolarity start address is: 48 (R12)
ADD	R2, R11, #4
LDRH	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_TIM_PWMIConfig95
;stm32f4xx_tim.c,1991 :: 		icoppositeselection = TIM_ICSelection_IndirectTI;
MOVW	R2, #2
STRH	R2, [SP, #4]
;stm32f4xx_tim.c,1992 :: 		}
IT	AL
BAL	L_TIM_PWMIConfig96
L_TIM_PWMIConfig95:
;stm32f4xx_tim.c,1995 :: 		icoppositeselection = TIM_ICSelection_DirectTI;
MOVW	R2, #1
STRH	R2, [SP, #4]
;stm32f4xx_tim.c,1996 :: 		}
L_TIM_PWMIConfig96:
;stm32f4xx_tim.c,1997 :: 		if (TIM_ICInitStruct->TIM_Channel == TIM_Channel_1)
LDRH	R2, [R11, #0]
CMP	R2, #0
IT	NE
BNE	L_TIM_PWMIConfig97
;stm32f4xx_tim.c,2001 :: 		TIM_ICInitStruct->TIM_ICFilter);
ADD	R2, R11, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
;stm32f4xx_tim.c,2000 :: 		TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
ADD	R2, R11, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADD	R2, R11, #2
LDRH	R2, [R2, #0]
UXTH	R1, R2
UXTH	R2, R3
;stm32f4xx_tim.c,2001 :: 		TIM_ICInitStruct->TIM_ICFilter);
UXTH	R3, R4
;stm32f4xx_tim.c,2000 :: 		TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
MOV	R0, R10
;stm32f4xx_tim.c,2001 :: 		TIM_ICInitStruct->TIM_ICFilter);
BL	stm32f4xx_tim_TI1_Config+0
;stm32f4xx_tim.c,2003 :: 		TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R11, #6
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R10
BL	_TIM_SetIC1Prescaler+0
;stm32f4xx_tim.c,2005 :: 		TI2_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
ADD	R2, R11, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
LDRH	R2, [SP, #4]
UXTH	R1, R12
; icoppositepolarity end address is: 48 (R12)
MOV	R0, R10
BL	stm32f4xx_tim_TI2_Config+0
;stm32f4xx_tim.c,2007 :: 		TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R11, #6
; TIM_ICInitStruct end address is: 44 (R11)
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R10
; TIMx end address is: 40 (R10)
BL	_TIM_SetIC2Prescaler+0
;stm32f4xx_tim.c,2008 :: 		}
IT	AL
BAL	L_TIM_PWMIConfig98
L_TIM_PWMIConfig97:
;stm32f4xx_tim.c,2013 :: 		TIM_ICInitStruct->TIM_ICFilter);
; icoppositepolarity start address is: 48 (R12)
; TIM_ICInitStruct start address is: 44 (R11)
; TIMx start address is: 40 (R10)
ADD	R2, R11, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
;stm32f4xx_tim.c,2012 :: 		TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
ADD	R2, R11, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADD	R2, R11, #2
LDRH	R2, [R2, #0]
UXTH	R1, R2
UXTH	R2, R3
;stm32f4xx_tim.c,2013 :: 		TIM_ICInitStruct->TIM_ICFilter);
UXTH	R3, R4
;stm32f4xx_tim.c,2012 :: 		TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
MOV	R0, R10
;stm32f4xx_tim.c,2013 :: 		TIM_ICInitStruct->TIM_ICFilter);
BL	stm32f4xx_tim_TI2_Config+0
;stm32f4xx_tim.c,2015 :: 		TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R11, #6
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R10
BL	_TIM_SetIC2Prescaler+0
;stm32f4xx_tim.c,2017 :: 		TI1_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
ADD	R2, R11, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
LDRH	R2, [SP, #4]
UXTH	R1, R12
; icoppositepolarity end address is: 48 (R12)
MOV	R0, R10
BL	stm32f4xx_tim_TI1_Config+0
;stm32f4xx_tim.c,2019 :: 		TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
ADD	R2, R11, #6
; TIM_ICInitStruct end address is: 44 (R11)
LDRH	R2, [R2, #0]
UXTH	R1, R2
MOV	R0, R10
; TIMx end address is: 40 (R10)
BL	_TIM_SetIC1Prescaler+0
;stm32f4xx_tim.c,2020 :: 		}
L_TIM_PWMIConfig98:
;stm32f4xx_tim.c,2021 :: 		}
L_end_TIM_PWMIConfig:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _TIM_PWMIConfig
_TIM_GetCapture1:
;stm32f4xx_tim.c,2028 :: 		uint32_t TIM_GetCapture1(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f4xx_tim.c,2034 :: 		return TIMx->CCR1;
ADDW	R1, R0, #52
; TIMx end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
;stm32f4xx_tim.c,2035 :: 		}
L_end_TIM_GetCapture1:
BX	LR
; end of _TIM_GetCapture1
_TIM_GetCapture2:
;stm32f4xx_tim.c,2043 :: 		uint32_t TIM_GetCapture2(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f4xx_tim.c,2049 :: 		return TIMx->CCR2;
ADDW	R1, R0, #56
; TIMx end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
;stm32f4xx_tim.c,2050 :: 		}
L_end_TIM_GetCapture2:
BX	LR
; end of _TIM_GetCapture2
_TIM_GetCapture3:
;stm32f4xx_tim.c,2057 :: 		uint32_t TIM_GetCapture3(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f4xx_tim.c,2063 :: 		return TIMx->CCR3;
ADDW	R1, R0, #60
; TIMx end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
;stm32f4xx_tim.c,2064 :: 		}
L_end_TIM_GetCapture3:
BX	LR
; end of _TIM_GetCapture3
_TIM_GetCapture4:
;stm32f4xx_tim.c,2071 :: 		uint32_t TIM_GetCapture4(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f4xx_tim.c,2077 :: 		return TIMx->CCR4;
ADDW	R1, R0, #64
; TIMx end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
;stm32f4xx_tim.c,2078 :: 		}
L_end_TIM_GetCapture4:
BX	LR
; end of _TIM_GetCapture4
_TIM_SetIC1Prescaler:
;stm32f4xx_tim.c,2091 :: 		void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
; TIM_ICPSC start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICPSC end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPSC start address is: 4 (R1)
;stm32f4xx_tim.c,2098 :: 		TIMx->CCMR1 &= (uint16_t)~TIM_CCMR1_IC1PSC;
ADDW	R4, R0, #24
LDRH	R3, [R4, #0]
MOVW	R2, #65523
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2101 :: 		TIMx->CCMR1 |= TIM_ICPSC;
ADDW	R3, R0, #24
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; TIM_ICPSC end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,2102 :: 		}
L_end_TIM_SetIC1Prescaler:
BX	LR
; end of _TIM_SetIC1Prescaler
_TIM_SetIC2Prescaler:
;stm32f4xx_tim.c,2116 :: 		void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
; TIM_ICPSC start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICPSC end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPSC start address is: 4 (R1)
;stm32f4xx_tim.c,2123 :: 		TIMx->CCMR1 &= (uint16_t)~TIM_CCMR1_IC2PSC;
ADDW	R4, R0, #24
LDRH	R3, [R4, #0]
MOVW	R2, #62463
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2126 :: 		TIMx->CCMR1 |= (uint16_t)(TIM_ICPSC << 8);
ADDW	R4, R0, #24
; TIMx end address is: 0 (R0)
LSLS	R3, R1, #8
UXTH	R3, R3
; TIM_ICPSC end address is: 4 (R1)
LDRH	R2, [R4, #0]
ORRS	R2, R3
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2127 :: 		}
L_end_TIM_SetIC2Prescaler:
BX	LR
; end of _TIM_SetIC2Prescaler
_TIM_SetIC3Prescaler:
;stm32f4xx_tim.c,2140 :: 		void TIM_SetIC3Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
; TIM_ICPSC start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICPSC end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPSC start address is: 4 (R1)
;stm32f4xx_tim.c,2147 :: 		TIMx->CCMR2 &= (uint16_t)~TIM_CCMR2_IC3PSC;
ADDW	R4, R0, #28
LDRH	R3, [R4, #0]
MOVW	R2, #65523
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2150 :: 		TIMx->CCMR2 |= TIM_ICPSC;
ADDW	R3, R0, #28
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; TIM_ICPSC end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,2151 :: 		}
L_end_TIM_SetIC3Prescaler:
BX	LR
; end of _TIM_SetIC3Prescaler
_TIM_SetIC4Prescaler:
;stm32f4xx_tim.c,2164 :: 		void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
; TIM_ICPSC start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICPSC end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPSC start address is: 4 (R1)
;stm32f4xx_tim.c,2171 :: 		TIMx->CCMR2 &= (uint16_t)~TIM_CCMR2_IC4PSC;
ADDW	R4, R0, #28
LDRH	R3, [R4, #0]
MOVW	R2, #62463
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2174 :: 		TIMx->CCMR2 |= (uint16_t)(TIM_ICPSC << 8);
ADDW	R4, R0, #28
; TIMx end address is: 0 (R0)
LSLS	R3, R1, #8
UXTH	R3, R3
; TIM_ICPSC end address is: 4 (R1)
LDRH	R2, [R4, #0]
ORRS	R2, R3
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2175 :: 		}
L_end_TIM_SetIC4Prescaler:
BX	LR
; end of _TIM_SetIC4Prescaler
_TIM_BDTRConfig:
;stm32f4xx_tim.c,2217 :: 		void TIM_BDTRConfig(TIM_TypeDef* TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct)
; TIM_BDTRInitStruct start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_BDTRInitStruct end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_BDTRInitStruct start address is: 4 (R1)
;stm32f4xx_tim.c,2230 :: 		TIMx->BDTR = (uint32_t)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
ADDW	R4, R0, #68
; TIMx end address is: 0 (R0)
LDRH	R2, [R1, #0]
UXTH	R3, R2
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_tim.c,2231 :: 		TIM_BDTRInitStruct->TIM_LOCKLevel | TIM_BDTRInitStruct->TIM_DeadTime |
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
ORRS	R3, R2
ADDS	R2, R1, #6
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_tim.c,2232 :: 		TIM_BDTRInitStruct->TIM_Break | TIM_BDTRInitStruct->TIM_BreakPolarity |
ADDW	R2, R1, #8
LDRH	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #10
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_tim.c,2233 :: 		TIM_BDTRInitStruct->TIM_AutomaticOutput;
ADDW	R2, R1, #12
; TIM_BDTRInitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2234 :: 		}
L_end_TIM_BDTRConfig:
BX	LR
; end of _TIM_BDTRConfig
_TIM_BDTRStructInit:
;stm32f4xx_tim.c,2242 :: 		void TIM_BDTRStructInit(TIM_BDTRInitTypeDef* TIM_BDTRInitStruct)
; TIM_BDTRInitStruct start address is: 0 (R0)
; TIM_BDTRInitStruct end address is: 0 (R0)
; TIM_BDTRInitStruct start address is: 0 (R0)
;stm32f4xx_tim.c,2245 :: 		TIM_BDTRInitStruct->TIM_OSSRState = TIM_OSSRState_Disable;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f4xx_tim.c,2246 :: 		TIM_BDTRInitStruct->TIM_OSSIState = TIM_OSSIState_Disable;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,2247 :: 		TIM_BDTRInitStruct->TIM_LOCKLevel = TIM_LOCKLevel_OFF;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,2248 :: 		TIM_BDTRInitStruct->TIM_DeadTime = 0x00;
ADDS	R2, R0, #6
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,2249 :: 		TIM_BDTRInitStruct->TIM_Break = TIM_Break_Disable;
ADDW	R2, R0, #8
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,2250 :: 		TIM_BDTRInitStruct->TIM_BreakPolarity = TIM_BreakPolarity_Low;
ADDW	R2, R0, #10
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,2251 :: 		TIM_BDTRInitStruct->TIM_AutomaticOutput = TIM_AutomaticOutput_Disable;
ADDW	R2, R0, #12
; TIM_BDTRInitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_tim.c,2252 :: 		}
L_end_TIM_BDTRStructInit:
BX	LR
; end of _TIM_BDTRStructInit
_TIM_CtrlPWMOutputs:
;stm32f4xx_tim.c,2261 :: 		void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_tim.c,2267 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_CtrlPWMOutputs99
; NewState end address is: 4 (R1)
;stm32f4xx_tim.c,2270 :: 		TIMx->BDTR |= TIM_BDTR_MOE;
ADDW	R3, R0, #68
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #32768
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,2271 :: 		}
IT	AL
BAL	L_TIM_CtrlPWMOutputs100
L_TIM_CtrlPWMOutputs99:
;stm32f4xx_tim.c,2275 :: 		TIMx->BDTR &= (uint16_t)~TIM_BDTR_MOE;
; TIMx start address is: 0 (R0)
ADDW	R4, R0, #68
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #32767
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2276 :: 		}
L_TIM_CtrlPWMOutputs100:
;stm32f4xx_tim.c,2277 :: 		}
L_end_TIM_CtrlPWMOutputs:
BX	LR
; end of _TIM_CtrlPWMOutputs
_TIM_SelectCOM:
;stm32f4xx_tim.c,2286 :: 		void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_tim.c,2292 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_SelectCOM101
; NewState end address is: 4 (R1)
;stm32f4xx_tim.c,2295 :: 		TIMx->CR2 |= TIM_CR2_CCUS;
ADDS	R3, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #4
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,2296 :: 		}
IT	AL
BAL	L_TIM_SelectCOM102
L_TIM_SelectCOM101:
;stm32f4xx_tim.c,2300 :: 		TIMx->CR2 &= (uint16_t)~TIM_CR2_CCUS;
; TIMx start address is: 0 (R0)
ADDS	R4, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65531
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2301 :: 		}
L_TIM_SelectCOM102:
;stm32f4xx_tim.c,2302 :: 		}
L_end_TIM_SelectCOM:
BX	LR
; end of _TIM_SelectCOM
_TIM_CCPreloadControl:
;stm32f4xx_tim.c,2311 :: 		void TIM_CCPreloadControl(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_tim.c,2316 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_CCPreloadControl103
; NewState end address is: 4 (R1)
;stm32f4xx_tim.c,2319 :: 		TIMx->CR2 |= TIM_CR2_CCPC;
ADDS	R3, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #1
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,2320 :: 		}
IT	AL
BAL	L_TIM_CCPreloadControl104
L_TIM_CCPreloadControl103:
;stm32f4xx_tim.c,2324 :: 		TIMx->CR2 &= (uint16_t)~TIM_CR2_CCPC;
; TIMx start address is: 0 (R0)
ADDS	R4, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2325 :: 		}
L_TIM_CCPreloadControl104:
;stm32f4xx_tim.c,2326 :: 		}
L_end_TIM_CCPreloadControl:
BX	LR
; end of _TIM_CCPreloadControl
_TIM_ITConfig:
;stm32f4xx_tim.c,2368 :: 		void TIM_ITConfig(TIM_TypeDef* TIMx, uint16_t TIM_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; TIM_IT start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; TIM_IT end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f4xx_tim.c,2375 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_TIM_ITConfig105
; NewState end address is: 8 (R2)
;stm32f4xx_tim.c,2378 :: 		TIMx->DIER |= TIM_IT;
ADDW	R4, R0, #12
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
ORRS	R3, R1
; TIM_IT end address is: 4 (R1)
STRH	R3, [R4, #0]
;stm32f4xx_tim.c,2379 :: 		}
IT	AL
BAL	L_TIM_ITConfig106
L_TIM_ITConfig105:
;stm32f4xx_tim.c,2383 :: 		TIMx->DIER &= (uint16_t)~TIM_IT;
; TIM_IT start address is: 4 (R1)
; TIMx start address is: 0 (R0)
ADDW	R5, R0, #12
; TIMx end address is: 0 (R0)
MVN	R4, R1
UXTH	R4, R4
; TIM_IT end address is: 4 (R1)
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f4xx_tim.c,2384 :: 		}
L_TIM_ITConfig106:
;stm32f4xx_tim.c,2385 :: 		}
L_end_TIM_ITConfig:
BX	LR
; end of _TIM_ITConfig
_TIM_GenerateEvent:
;stm32f4xx_tim.c,2406 :: 		void TIM_GenerateEvent(TIM_TypeDef* TIMx, uint16_t TIM_EventSource)
; TIM_EventSource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_EventSource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_EventSource start address is: 4 (R1)
;stm32f4xx_tim.c,2413 :: 		TIMx->EGR = TIM_EventSource;
ADDW	R2, R0, #20
; TIMx end address is: 0 (R0)
STRH	R1, [R2, #0]
; TIM_EventSource end address is: 4 (R1)
;stm32f4xx_tim.c,2414 :: 		}
L_end_TIM_GenerateEvent:
BX	LR
; end of _TIM_GenerateEvent
_TIM_GetFlagStatus:
;stm32f4xx_tim.c,2439 :: 		FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)
; TIM_FLAG start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_FLAG end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_FLAG start address is: 4 (R1)
;stm32f4xx_tim.c,2441 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_tim.c,2447 :: 		if ((TIMx->SR & TIM_FLAG) != (uint16_t)RESET)
ADDW	R2, R0, #16
; TIMx end address is: 0 (R0)
LDRH	R2, [R2, #0]
ANDS	R2, R1
UXTH	R2, R2
; TIM_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_TIM_GetFlagStatus107
;stm32f4xx_tim.c,2449 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_tim.c,2450 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_TIM_GetFlagStatus108
L_TIM_GetFlagStatus107:
;stm32f4xx_tim.c,2453 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_tim.c,2454 :: 		}
L_TIM_GetFlagStatus108:
;stm32f4xx_tim.c,2455 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_tim.c,2456 :: 		}
L_end_TIM_GetFlagStatus:
BX	LR
; end of _TIM_GetFlagStatus
_TIM_ClearFlag:
;stm32f4xx_tim.c,2481 :: 		void TIM_ClearFlag(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)
; TIM_FLAG start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_FLAG end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_FLAG start address is: 4 (R1)
;stm32f4xx_tim.c,2487 :: 		TIMx->SR = (uint16_t)~TIM_FLAG;
ADDW	R3, R0, #16
; TIMx end address is: 0 (R0)
MVN	R2, R1
; TIM_FLAG end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,2488 :: 		}
L_end_TIM_ClearFlag:
BX	LR
; end of _TIM_ClearFlag
_TIM_GetITStatus:
;stm32f4xx_tim.c,2509 :: 		ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, uint16_t TIM_IT)
; TIM_IT start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_IT end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_IT start address is: 4 (R1)
;stm32f4xx_tim.c,2511 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_tim.c,2512 :: 		uint16_t itstatus = 0x0, itenable = 0x0;
;stm32f4xx_tim.c,2517 :: 		itstatus = TIMx->SR & TIM_IT;
ADDW	R2, R0, #16
LDRH	R2, [R2, #0]
AND	R3, R2, R1, LSL #0
UXTH	R3, R3
;stm32f4xx_tim.c,2519 :: 		itenable = TIMx->DIER & TIM_IT;
ADDW	R2, R0, #12
; TIMx end address is: 0 (R0)
LDRH	R2, [R2, #0]
ANDS	R2, R1
; TIM_IT end address is: 4 (R1)
; itenable start address is: 0 (R0)
UXTH	R0, R2
;stm32f4xx_tim.c,2520 :: 		if ((itstatus != (uint16_t)RESET) && (itenable != (uint16_t)RESET))
CMP	R3, #0
IT	EQ
BEQ	L__TIM_GetITStatus160
CMP	R0, #0
IT	EQ
BEQ	L__TIM_GetITStatus159
; itenable end address is: 0 (R0)
L__TIM_GetITStatus158:
;stm32f4xx_tim.c,2522 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_tim.c,2523 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_TIM_GetITStatus112
;stm32f4xx_tim.c,2520 :: 		if ((itstatus != (uint16_t)RESET) && (itenable != (uint16_t)RESET))
L__TIM_GetITStatus160:
L__TIM_GetITStatus159:
;stm32f4xx_tim.c,2526 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_tim.c,2527 :: 		}
L_TIM_GetITStatus112:
;stm32f4xx_tim.c,2528 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_tim.c,2529 :: 		}
L_end_TIM_GetITStatus:
BX	LR
; end of _TIM_GetITStatus
_TIM_ClearITPendingBit:
;stm32f4xx_tim.c,2550 :: 		void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, uint16_t TIM_IT)
; TIM_IT start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_IT end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_IT start address is: 4 (R1)
;stm32f4xx_tim.c,2556 :: 		TIMx->SR = (uint16_t)~TIM_IT;
ADDW	R3, R0, #16
; TIMx end address is: 0 (R0)
MVN	R2, R1
; TIM_IT end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,2557 :: 		}
L_end_TIM_ClearITPendingBit:
BX	LR
; end of _TIM_ClearITPendingBit
_TIM_DMAConfig:
;stm32f4xx_tim.c,2587 :: 		void TIM_DMAConfig(TIM_TypeDef* TIMx, uint16_t TIM_DMABase, uint16_t TIM_DMABurstLength)
; TIM_DMABurstLength start address is: 8 (R2)
; TIM_DMABase start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_DMABurstLength end address is: 8 (R2)
; TIM_DMABase end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_DMABase start address is: 4 (R1)
; TIM_DMABurstLength start address is: 8 (R2)
;stm32f4xx_tim.c,2595 :: 		TIMx->DCR = TIM_DMABase | TIM_DMABurstLength;
ADDW	R4, R0, #72
; TIMx end address is: 0 (R0)
ORR	R3, R1, R2, LSL #0
; TIM_DMABase end address is: 4 (R1)
; TIM_DMABurstLength end address is: 8 (R2)
STRH	R3, [R4, #0]
;stm32f4xx_tim.c,2596 :: 		}
L_end_TIM_DMAConfig:
BX	LR
; end of _TIM_DMAConfig
_TIM_DMACmd:
;stm32f4xx_tim.c,2614 :: 		void TIM_DMACmd(TIM_TypeDef* TIMx, uint16_t TIM_DMASource, FunctionalState NewState)
; NewState start address is: 8 (R2)
; TIM_DMASource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; TIM_DMASource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_DMASource start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f4xx_tim.c,2621 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_TIM_DMACmd113
; NewState end address is: 8 (R2)
;stm32f4xx_tim.c,2624 :: 		TIMx->DIER |= TIM_DMASource;
ADDW	R4, R0, #12
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
ORRS	R3, R1
; TIM_DMASource end address is: 4 (R1)
STRH	R3, [R4, #0]
;stm32f4xx_tim.c,2625 :: 		}
IT	AL
BAL	L_TIM_DMACmd114
L_TIM_DMACmd113:
;stm32f4xx_tim.c,2629 :: 		TIMx->DIER &= (uint16_t)~TIM_DMASource;
; TIM_DMASource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
ADDW	R5, R0, #12
; TIMx end address is: 0 (R0)
MVN	R4, R1
UXTH	R4, R4
; TIM_DMASource end address is: 4 (R1)
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f4xx_tim.c,2630 :: 		}
L_TIM_DMACmd114:
;stm32f4xx_tim.c,2631 :: 		}
L_end_TIM_DMACmd:
BX	LR
; end of _TIM_DMACmd
_TIM_SelectCCDMA:
;stm32f4xx_tim.c,2640 :: 		void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_tim.c,2646 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_SelectCCDMA115
; NewState end address is: 4 (R1)
;stm32f4xx_tim.c,2649 :: 		TIMx->CR2 |= TIM_CR2_CCDS;
ADDS	R3, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #8
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,2650 :: 		}
IT	AL
BAL	L_TIM_SelectCCDMA116
L_TIM_SelectCCDMA115:
;stm32f4xx_tim.c,2654 :: 		TIMx->CR2 &= (uint16_t)~TIM_CR2_CCDS;
; TIMx start address is: 0 (R0)
ADDS	R4, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65527
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2655 :: 		}
L_TIM_SelectCCDMA116:
;stm32f4xx_tim.c,2656 :: 		}
L_end_TIM_SelectCCDMA:
BX	LR
; end of _TIM_SelectCCDMA
_TIM_InternalClockConfig:
;stm32f4xx_tim.c,2679 :: 		void TIM_InternalClockConfig(TIM_TypeDef* TIMx)
; TIMx start address is: 0 (R0)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
;stm32f4xx_tim.c,2685 :: 		TIMx->SMCR &=  (uint16_t)~TIM_SMCR_SMS;
ADDW	R3, R0, #8
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
MOVW	R1, #65528
AND	R1, R2, R1, LSL #0
STRH	R1, [R3, #0]
;stm32f4xx_tim.c,2686 :: 		}
L_end_TIM_InternalClockConfig:
BX	LR
; end of _TIM_InternalClockConfig
_TIM_ITRxExternalClockConfig:
;stm32f4xx_tim.c,2700 :: 		void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)
; TIM_InputTriggerSource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
; TIM_InputTriggerSource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 20 (R5)
; TIM_InputTriggerSource start address is: 4 (R1)
;stm32f4xx_tim.c,2707 :: 		TIM_SelectInputTrigger(TIMx, TIM_InputTriggerSource);
; TIM_InputTriggerSource end address is: 4 (R1)
MOV	R0, R5
BL	_TIM_SelectInputTrigger+0
;stm32f4xx_tim.c,2710 :: 		TIMx->SMCR |= TIM_SlaveMode_External1;
ADDW	R3, R5, #8
; TIMx end address is: 20 (R5)
LDRH	R2, [R3, #0]
ORR	R2, R2, #7
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,2711 :: 		}
L_end_TIM_ITRxExternalClockConfig:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_ITRxExternalClockConfig
_TIM_TIxExternalClockConfig:
;stm32f4xx_tim.c,2731 :: 		uint16_t TIM_ICPolarity, uint16_t ICFilter)
; ICFilter start address is: 12 (R3)
; TIM_ICPolarity start address is: 8 (R2)
; TIM_TIxExternalCLKSource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R10, R0
UXTH	R11, R1
UXTH	R9, R2
UXTH	R12, R3
; ICFilter end address is: 12 (R3)
; TIM_ICPolarity end address is: 8 (R2)
; TIM_TIxExternalCLKSource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 40 (R10)
; TIM_TIxExternalCLKSource start address is: 44 (R11)
; TIM_ICPolarity start address is: 36 (R9)
; ICFilter start address is: 48 (R12)
;stm32f4xx_tim.c,2739 :: 		if (TIM_TIxExternalCLKSource == TIM_TIxExternalCLK1Source_TI2)
CMP	R11, #96
IT	NE
BNE	L_TIM_TIxExternalClockConfig117
;stm32f4xx_tim.c,2741 :: 		TI2_Config(TIMx, TIM_ICPolarity, TIM_ICSelection_DirectTI, ICFilter);
UXTH	R3, R12
; ICFilter end address is: 48 (R12)
MOVW	R2, #1
UXTH	R1, R9
; TIM_ICPolarity end address is: 36 (R9)
MOV	R0, R10
BL	stm32f4xx_tim_TI2_Config+0
;stm32f4xx_tim.c,2742 :: 		}
IT	AL
BAL	L_TIM_TIxExternalClockConfig118
L_TIM_TIxExternalClockConfig117:
;stm32f4xx_tim.c,2745 :: 		TI1_Config(TIMx, TIM_ICPolarity, TIM_ICSelection_DirectTI, ICFilter);
; ICFilter start address is: 48 (R12)
; TIM_ICPolarity start address is: 36 (R9)
UXTH	R3, R12
; ICFilter end address is: 48 (R12)
MOVW	R2, #1
UXTH	R1, R9
; TIM_ICPolarity end address is: 36 (R9)
MOV	R0, R10
BL	stm32f4xx_tim_TI1_Config+0
;stm32f4xx_tim.c,2746 :: 		}
L_TIM_TIxExternalClockConfig118:
;stm32f4xx_tim.c,2748 :: 		TIM_SelectInputTrigger(TIMx, TIM_TIxExternalCLKSource);
UXTH	R1, R11
; TIM_TIxExternalCLKSource end address is: 44 (R11)
MOV	R0, R10
BL	_TIM_SelectInputTrigger+0
;stm32f4xx_tim.c,2750 :: 		TIMx->SMCR |= TIM_SlaveMode_External1;
ADD	R5, R10, #8
; TIMx end address is: 40 (R10)
LDRH	R4, [R5, #0]
ORR	R4, R4, #7
STRH	R4, [R5, #0]
;stm32f4xx_tim.c,2751 :: 		}
L_end_TIM_TIxExternalClockConfig:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_TIxExternalClockConfig
_TIM_ETRClockMode1Config:
;stm32f4xx_tim.c,2771 :: 		uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)
; ExtTRGFilter start address is: 12 (R3)
; TIM_ExtTRGPolarity start address is: 8 (R2)
; TIM_ExtTRGPrescaler start address is: 4 (R1)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R7, R0
; ExtTRGFilter end address is: 12 (R3)
; TIM_ExtTRGPolarity end address is: 8 (R2)
; TIM_ExtTRGPrescaler end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 28 (R7)
; TIM_ExtTRGPrescaler start address is: 4 (R1)
; TIM_ExtTRGPolarity start address is: 8 (R2)
; ExtTRGFilter start address is: 12 (R3)
;stm32f4xx_tim.c,2773 :: 		uint16_t tmpsmcr = 0;
;stm32f4xx_tim.c,2781 :: 		TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
; ExtTRGFilter end address is: 12 (R3)
; TIM_ExtTRGPolarity end address is: 8 (R2)
; TIM_ExtTRGPrescaler end address is: 4 (R1)
MOV	R0, R7
BL	_TIM_ETRConfig+0
;stm32f4xx_tim.c,2784 :: 		tmpsmcr = TIMx->SMCR;
ADDW	R6, R7, #8
; TIMx end address is: 28 (R7)
LDRH	R5, [R6, #0]
;stm32f4xx_tim.c,2787 :: 		tmpsmcr &= (uint16_t)~TIM_SMCR_SMS;
MOVW	R4, #65528
AND	R4, R5, R4, LSL #0
UXTH	R4, R4
;stm32f4xx_tim.c,2790 :: 		tmpsmcr |= TIM_SlaveMode_External1;
ORR	R5, R4, #7
UXTH	R5, R5
;stm32f4xx_tim.c,2793 :: 		tmpsmcr &= (uint16_t)~TIM_SMCR_TS;
MOVW	R4, #65423
AND	R4, R5, R4, LSL #0
UXTH	R4, R4
;stm32f4xx_tim.c,2794 :: 		tmpsmcr |= TIM_TS_ETRF;
ORR	R4, R4, #112
;stm32f4xx_tim.c,2797 :: 		TIMx->SMCR = tmpsmcr;
STRH	R4, [R6, #0]
;stm32f4xx_tim.c,2798 :: 		}
L_end_TIM_ETRClockMode1Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_ETRClockMode1Config
_TIM_ETRClockMode2Config:
;stm32f4xx_tim.c,2818 :: 		uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)
; ExtTRGFilter start address is: 12 (R3)
; TIM_ExtTRGPolarity start address is: 8 (R2)
; TIM_ExtTRGPrescaler start address is: 4 (R1)
; TIMx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R7, R0
; ExtTRGFilter end address is: 12 (R3)
; TIM_ExtTRGPolarity end address is: 8 (R2)
; TIM_ExtTRGPrescaler end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 28 (R7)
; TIM_ExtTRGPrescaler start address is: 4 (R1)
; TIM_ExtTRGPolarity start address is: 8 (R2)
; ExtTRGFilter start address is: 12 (R3)
;stm32f4xx_tim.c,2827 :: 		TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
; ExtTRGFilter end address is: 12 (R3)
; TIM_ExtTRGPolarity end address is: 8 (R2)
; TIM_ExtTRGPrescaler end address is: 4 (R1)
MOV	R0, R7
BL	_TIM_ETRConfig+0
;stm32f4xx_tim.c,2830 :: 		TIMx->SMCR |= TIM_SMCR_ECE;
ADDW	R5, R7, #8
; TIMx end address is: 28 (R7)
LDRH	R4, [R5, #0]
ORR	R4, R4, #16384
STRH	R4, [R5, #0]
;stm32f4xx_tim.c,2831 :: 		}
L_end_TIM_ETRClockMode2Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _TIM_ETRClockMode2Config
_TIM_SelectInputTrigger:
;stm32f4xx_tim.c,2885 :: 		void TIM_SelectInputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)
; TIM_InputTriggerSource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_InputTriggerSource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_InputTriggerSource start address is: 4 (R1)
;stm32f4xx_tim.c,2887 :: 		uint16_t tmpsmcr = 0;
;stm32f4xx_tim.c,2894 :: 		tmpsmcr = TIMx->SMCR;
ADDW	R4, R0, #8
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_tim.c,2897 :: 		tmpsmcr &= (uint16_t)~TIM_SMCR_TS;
MOVW	R2, #65423
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
;stm32f4xx_tim.c,2900 :: 		tmpsmcr |= TIM_InputTriggerSource;
ORRS	R2, R1
; TIM_InputTriggerSource end address is: 4 (R1)
;stm32f4xx_tim.c,2903 :: 		TIMx->SMCR = tmpsmcr;
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2904 :: 		}
L_end_TIM_SelectInputTrigger:
BX	LR
; end of _TIM_SelectInputTrigger
_TIM_SelectOutputTrigger:
;stm32f4xx_tim.c,2928 :: 		void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_TRGOSource)
; TIM_TRGOSource start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_TRGOSource end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_TRGOSource start address is: 4 (R1)
;stm32f4xx_tim.c,2935 :: 		TIMx->CR2 &= (uint16_t)~TIM_CR2_MMS;
ADDS	R4, R0, #4
LDRH	R3, [R4, #0]
MOVW	R2, #65423
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2937 :: 		TIMx->CR2 |=  TIM_TRGOSource;
ADDS	R3, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; TIM_TRGOSource end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,2938 :: 		}
L_end_TIM_SelectOutputTrigger:
BX	LR
; end of _TIM_SelectOutputTrigger
_TIM_SelectSlaveMode:
;stm32f4xx_tim.c,2952 :: 		void TIM_SelectSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_SlaveMode)
; TIM_SlaveMode start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_SlaveMode end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_SlaveMode start address is: 4 (R1)
;stm32f4xx_tim.c,2959 :: 		TIMx->SMCR &= (uint16_t)~TIM_SMCR_SMS;
ADDW	R4, R0, #8
LDRH	R3, [R4, #0]
MOVW	R2, #65528
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2962 :: 		TIMx->SMCR |= TIM_SlaveMode;
ADDW	R3, R0, #8
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; TIM_SlaveMode end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,2963 :: 		}
L_end_TIM_SelectSlaveMode:
BX	LR
; end of _TIM_SelectSlaveMode
_TIM_SelectMasterSlaveMode:
;stm32f4xx_tim.c,2975 :: 		void TIM_SelectMasterSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_MasterSlaveMode)
; TIM_MasterSlaveMode start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_MasterSlaveMode end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_MasterSlaveMode start address is: 4 (R1)
;stm32f4xx_tim.c,2982 :: 		TIMx->SMCR &= (uint16_t)~TIM_SMCR_MSM;
ADDW	R4, R0, #8
LDRH	R3, [R4, #0]
MOVW	R2, #65407
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,2985 :: 		TIMx->SMCR |= TIM_MasterSlaveMode;
ADDW	R3, R0, #8
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; TIM_MasterSlaveMode end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,2986 :: 		}
L_end_TIM_SelectMasterSlaveMode:
BX	LR
; end of _TIM_SelectMasterSlaveMode
_TIM_ETRConfig:
;stm32f4xx_tim.c,3006 :: 		uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)
; ExtTRGFilter start address is: 12 (R3)
; TIM_ExtTRGPolarity start address is: 8 (R2)
; TIM_ExtTRGPrescaler start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; ExtTRGFilter end address is: 12 (R3)
; TIM_ExtTRGPolarity end address is: 8 (R2)
; TIM_ExtTRGPrescaler end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ExtTRGPrescaler start address is: 4 (R1)
; TIM_ExtTRGPolarity start address is: 8 (R2)
; ExtTRGFilter start address is: 12 (R3)
;stm32f4xx_tim.c,3008 :: 		uint16_t tmpsmcr = 0;
;stm32f4xx_tim.c,3016 :: 		tmpsmcr = TIMx->SMCR;
ADDW	R6, R0, #8
; TIMx end address is: 0 (R0)
LDRH	R4, [R6, #0]
;stm32f4xx_tim.c,3019 :: 		tmpsmcr &= SMCR_ETR_MASK;
AND	R5, R4, #255
UXTH	R5, R5
;stm32f4xx_tim.c,3022 :: 		tmpsmcr |= (uint16_t)(TIM_ExtTRGPrescaler | (uint16_t)(TIM_ExtTRGPolarity | (uint16_t)(ExtTRGFilter << (uint16_t)8)));
LSLS	R4, R3, #8
UXTH	R4, R4
; ExtTRGFilter end address is: 12 (R3)
ORR	R4, R2, R4, LSL #0
UXTH	R4, R4
; TIM_ExtTRGPolarity end address is: 8 (R2)
ORR	R4, R1, R4, LSL #0
UXTH	R4, R4
; TIM_ExtTRGPrescaler end address is: 4 (R1)
ORR	R4, R5, R4, LSL #0
;stm32f4xx_tim.c,3025 :: 		TIMx->SMCR = tmpsmcr;
STRH	R4, [R6, #0]
;stm32f4xx_tim.c,3026 :: 		}
L_end_TIM_ETRConfig:
BX	LR
; end of _TIM_ETRConfig
_TIM_EncoderInterfaceConfig:
;stm32f4xx_tim.c,3064 :: 		uint16_t TIM_IC1Polarity, uint16_t TIM_IC2Polarity)
; TIM_IC2Polarity start address is: 12 (R3)
; TIM_IC1Polarity start address is: 8 (R2)
; TIM_EncoderMode start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_IC2Polarity end address is: 12 (R3)
; TIM_IC1Polarity end address is: 8 (R2)
; TIM_EncoderMode end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_EncoderMode start address is: 4 (R1)
; TIM_IC1Polarity start address is: 8 (R2)
; TIM_IC2Polarity start address is: 12 (R3)
;stm32f4xx_tim.c,3066 :: 		uint16_t tmpsmcr = 0;
;stm32f4xx_tim.c,3067 :: 		uint16_t tmpccmr1 = 0;
;stm32f4xx_tim.c,3068 :: 		uint16_t tmpccer = 0;
;stm32f4xx_tim.c,3077 :: 		tmpsmcr = TIMx->SMCR;
ADD	R8, R0, #8
LDRH	R7, [R8, #0]
;stm32f4xx_tim.c,3080 :: 		tmpccmr1 = TIMx->CCMR1;
ADDW	R4, R0, #24
LDRH	R5, [R4, #0]
;stm32f4xx_tim.c,3083 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
LDRH	R6, [R4, #0]
;stm32f4xx_tim.c,3086 :: 		tmpsmcr &= (uint16_t)~TIM_SMCR_SMS;
MOVW	R4, #65528
AND	R4, R7, R4, LSL #0
UXTH	R4, R4
;stm32f4xx_tim.c,3087 :: 		tmpsmcr |= TIM_EncoderMode;
ORR	R7, R4, R1, LSL #0
; TIM_EncoderMode end address is: 4 (R1)
;stm32f4xx_tim.c,3090 :: 		tmpccmr1 &= ((uint16_t)~TIM_CCMR1_CC1S) & ((uint16_t)~TIM_CCMR1_CC2S);
MOVW	R4, #64764
MOVT	R4, #0
AND	R4, R5, R4, LSL #0
;stm32f4xx_tim.c,3091 :: 		tmpccmr1 |= TIM_CCMR1_CC1S_0 | TIM_CCMR1_CC2S_0;
UXTH	R5, R4
MOVW	R4, #257
MOVT	R4, #0
ORR	R4, R5, R4, LSL #0
; tmpccmr1 start address is: 4 (R1)
UXTH	R1, R4
;stm32f4xx_tim.c,3094 :: 		tmpccer &= ((uint16_t)~TIM_CCER_CC1P) & ((uint16_t)~TIM_CCER_CC2P);
MOVW	R4, #65501
MOVT	R4, #0
ANDS	R6, R4
;stm32f4xx_tim.c,3095 :: 		tmpccer |= (uint16_t)(TIM_IC1Polarity | (uint16_t)(TIM_IC2Polarity << (uint16_t)4));
LSLS	R4, R3, #4
UXTH	R4, R4
; TIM_IC2Polarity end address is: 12 (R3)
ORR	R5, R2, R4, LSL #0
UXTH	R5, R5
; TIM_IC1Polarity end address is: 8 (R2)
UXTH	R4, R6
ORRS	R4, R5
; tmpccer start address is: 8 (R2)
UXTH	R2, R4
;stm32f4xx_tim.c,3098 :: 		TIMx->SMCR = tmpsmcr;
STRH	R7, [R8, #0]
;stm32f4xx_tim.c,3101 :: 		TIMx->CCMR1 = tmpccmr1;
ADDW	R4, R0, #24
STRH	R1, [R4, #0]
; tmpccmr1 end address is: 4 (R1)
;stm32f4xx_tim.c,3104 :: 		TIMx->CCER = tmpccer;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
STRH	R2, [R4, #0]
; tmpccer end address is: 8 (R2)
;stm32f4xx_tim.c,3105 :: 		}
L_end_TIM_EncoderInterfaceConfig:
BX	LR
; end of _TIM_EncoderInterfaceConfig
_TIM_SelectHallSensor:
;stm32f4xx_tim.c,3115 :: 		void TIM_SelectHallSensor(TIM_TypeDef* TIMx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_tim.c,3121 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_TIM_SelectHallSensor119
; NewState end address is: 4 (R1)
;stm32f4xx_tim.c,3124 :: 		TIMx->CR2 |= TIM_CR2_TI1S;
ADDS	R3, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #128
STRH	R2, [R3, #0]
;stm32f4xx_tim.c,3125 :: 		}
IT	AL
BAL	L_TIM_SelectHallSensor120
L_TIM_SelectHallSensor119:
;stm32f4xx_tim.c,3129 :: 		TIMx->CR2 &= (uint16_t)~TIM_CR2_TI1S;
; TIMx start address is: 0 (R0)
ADDS	R4, R0, #4
; TIMx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65407
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_tim.c,3130 :: 		}
L_TIM_SelectHallSensor120:
;stm32f4xx_tim.c,3131 :: 		}
L_end_TIM_SelectHallSensor:
BX	LR
; end of _TIM_SelectHallSensor
_TIM_RemapConfig:
;stm32f4xx_tim.c,3166 :: 		void TIM_RemapConfig(TIM_TypeDef* TIMx, uint16_t TIM_Remap)
; TIM_Remap start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_Remap end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_Remap start address is: 4 (R1)
;stm32f4xx_tim.c,3173 :: 		TIMx->OR =  TIM_Remap;
ADDW	R2, R0, #80
; TIMx end address is: 0 (R0)
STRH	R1, [R2, #0]
; TIM_Remap end address is: 4 (R1)
;stm32f4xx_tim.c,3174 :: 		}
L_end_TIM_RemapConfig:
BX	LR
; end of _TIM_RemapConfig
stm32f4xx_tim_TI1_Config:
;stm32f4xx_tim.c,3198 :: 		uint16_t TIM_ICFilter)
; TIM_ICFilter start address is: 12 (R3)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICFilter end address is: 12 (R3)
; TIM_ICSelection end address is: 8 (R2)
; TIM_ICPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPolarity start address is: 4 (R1)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICFilter start address is: 12 (R3)
;stm32f4xx_tim.c,3200 :: 		uint16_t tmpccmr1 = 0, tmpccer = 0;
;stm32f4xx_tim.c,3203 :: 		TIMx->CCER &= (uint16_t)~TIM_CCER_CC1E;
ADDW	R6, R0, #32
LDRH	R5, [R6, #0]
MOVW	R4, #65534
AND	R4, R5, R4, LSL #0
STRH	R4, [R6, #0]
;stm32f4xx_tim.c,3204 :: 		tmpccmr1 = TIMx->CCMR1;
ADD	R8, R0, #24
LDRH	R5, [R8, #0]
;stm32f4xx_tim.c,3205 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
LDRH	R7, [R4, #0]
;stm32f4xx_tim.c,3208 :: 		tmpccmr1 &= ((uint16_t)~TIM_CCMR1_CC1S) & ((uint16_t)~TIM_CCMR1_IC1F);
MOVW	R4, #65292
MOVT	R4, #0
AND	R6, R5, R4, LSL #0
;stm32f4xx_tim.c,3209 :: 		tmpccmr1 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));
LSLS	R4, R3, #4
UXTH	R4, R4
; TIM_ICFilter end address is: 12 (R3)
ORR	R5, R2, R4, LSL #0
UXTH	R5, R5
; TIM_ICSelection end address is: 8 (R2)
UXTH	R4, R6
ORR	R6, R4, R5, LSL #0
;stm32f4xx_tim.c,3212 :: 		tmpccer &= (uint16_t)~(TIM_CCER_CC1P | TIM_CCER_CC1NP);
MOVW	R4, #65525
AND	R5, R7, R4, LSL #0
UXTH	R5, R5
;stm32f4xx_tim.c,3213 :: 		tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CCER_CC1E);
ORR	R4, R1, #1
UXTH	R4, R4
; TIM_ICPolarity end address is: 4 (R1)
ORR	R4, R5, R4, LSL #0
; tmpccer start address is: 4 (R1)
UXTH	R1, R4
;stm32f4xx_tim.c,3216 :: 		TIMx->CCMR1 = tmpccmr1;
STRH	R6, [R8, #0]
;stm32f4xx_tim.c,3217 :: 		TIMx->CCER = tmpccer;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
STRH	R1, [R4, #0]
; tmpccer end address is: 4 (R1)
;stm32f4xx_tim.c,3218 :: 		}
L_end_TI1_Config:
BX	LR
; end of stm32f4xx_tim_TI1_Config
stm32f4xx_tim_TI2_Config:
;stm32f4xx_tim.c,3239 :: 		uint16_t TIM_ICFilter)
; TIM_ICFilter start address is: 12 (R3)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICFilter end address is: 12 (R3)
; TIM_ICSelection end address is: 8 (R2)
; TIM_ICPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPolarity start address is: 4 (R1)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICFilter start address is: 12 (R3)
;stm32f4xx_tim.c,3241 :: 		uint16_t tmpccmr1 = 0, tmpccer = 0, tmp = 0;
;stm32f4xx_tim.c,3244 :: 		TIMx->CCER &= (uint16_t)~TIM_CCER_CC2E;
ADDW	R6, R0, #32
LDRH	R5, [R6, #0]
MOVW	R4, #65519
AND	R4, R5, R4, LSL #0
STRH	R4, [R6, #0]
;stm32f4xx_tim.c,3245 :: 		tmpccmr1 = TIMx->CCMR1;
ADD	R9, R0, #24
LDRH	R5, [R9, #0]
;stm32f4xx_tim.c,3246 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
LDRH	R8, [R4, #0]
;stm32f4xx_tim.c,3247 :: 		tmp = (uint16_t)(TIM_ICPolarity << 4);
LSLS	R7, R1, #4
UXTH	R7, R7
; TIM_ICPolarity end address is: 4 (R1)
;stm32f4xx_tim.c,3250 :: 		tmpccmr1 &= ((uint16_t)~TIM_CCMR1_CC2S) & ((uint16_t)~TIM_CCMR1_IC2F);
MOVW	R4, #3327
MOVT	R4, #0
AND	R4, R5, R4, LSL #0
;stm32f4xx_tim.c,3251 :: 		tmpccmr1 |= (uint16_t)(TIM_ICFilter << 12);
LSLS	R5, R3, #12
UXTH	R5, R5
; TIM_ICFilter end address is: 12 (R3)
UXTH	R4, R4
ORR	R5, R4, R5, LSL #0
UXTH	R5, R5
;stm32f4xx_tim.c,3252 :: 		tmpccmr1 |= (uint16_t)(TIM_ICSelection << 8);
LSLS	R4, R2, #8
UXTH	R4, R4
; TIM_ICSelection end address is: 8 (R2)
ORR	R6, R5, R4, LSL #0
;stm32f4xx_tim.c,3255 :: 		tmpccer &= (uint16_t)~(TIM_CCER_CC2P | TIM_CCER_CC2NP);
MOVW	R4, #65375
AND	R5, R8, R4, LSL #0
UXTH	R5, R5
;stm32f4xx_tim.c,3256 :: 		tmpccer |=  (uint16_t)(tmp | (uint16_t)TIM_CCER_CC2E);
ORR	R4, R7, #16
UXTH	R4, R4
ORR	R4, R5, R4, LSL #0
; tmpccer start address is: 4 (R1)
UXTH	R1, R4
;stm32f4xx_tim.c,3259 :: 		TIMx->CCMR1 = tmpccmr1 ;
STRH	R6, [R9, #0]
;stm32f4xx_tim.c,3260 :: 		TIMx->CCER = tmpccer;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
STRH	R1, [R4, #0]
; tmpccer end address is: 4 (R1)
;stm32f4xx_tim.c,3261 :: 		}
L_end_TI2_Config:
BX	LR
; end of stm32f4xx_tim_TI2_Config
stm32f4xx_tim_TI3_Config:
;stm32f4xx_tim.c,3281 :: 		uint16_t TIM_ICFilter)
; TIM_ICFilter start address is: 12 (R3)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICFilter end address is: 12 (R3)
; TIM_ICSelection end address is: 8 (R2)
; TIM_ICPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPolarity start address is: 4 (R1)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICFilter start address is: 12 (R3)
;stm32f4xx_tim.c,3283 :: 		uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;
;stm32f4xx_tim.c,3286 :: 		TIMx->CCER &= (uint16_t)~TIM_CCER_CC3E;
ADDW	R6, R0, #32
LDRH	R5, [R6, #0]
MOVW	R4, #65279
AND	R4, R5, R4, LSL #0
STRH	R4, [R6, #0]
;stm32f4xx_tim.c,3287 :: 		tmpccmr2 = TIMx->CCMR2;
ADD	R9, R0, #28
LDRH	R5, [R9, #0]
;stm32f4xx_tim.c,3288 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
LDRH	R8, [R4, #0]
;stm32f4xx_tim.c,3289 :: 		tmp = (uint16_t)(TIM_ICPolarity << 8);
LSLS	R7, R1, #8
UXTH	R7, R7
; TIM_ICPolarity end address is: 4 (R1)
;stm32f4xx_tim.c,3292 :: 		tmpccmr2 &= ((uint16_t)~TIM_CCMR1_CC1S) & ((uint16_t)~TIM_CCMR2_IC3F);
MOVW	R4, #65292
MOVT	R4, #0
AND	R6, R5, R4, LSL #0
;stm32f4xx_tim.c,3293 :: 		tmpccmr2 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));
LSLS	R4, R3, #4
UXTH	R4, R4
; TIM_ICFilter end address is: 12 (R3)
ORR	R5, R2, R4, LSL #0
UXTH	R5, R5
; TIM_ICSelection end address is: 8 (R2)
UXTH	R4, R6
ORR	R6, R4, R5, LSL #0
;stm32f4xx_tim.c,3296 :: 		tmpccer &= (uint16_t)~(TIM_CCER_CC3P | TIM_CCER_CC3NP);
MOVW	R4, #62975
AND	R5, R8, R4, LSL #0
UXTH	R5, R5
;stm32f4xx_tim.c,3297 :: 		tmpccer |= (uint16_t)(tmp | (uint16_t)TIM_CCER_CC3E);
ORR	R4, R7, #256
UXTH	R4, R4
ORR	R4, R5, R4, LSL #0
; tmpccer start address is: 4 (R1)
UXTH	R1, R4
;stm32f4xx_tim.c,3300 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R6, [R9, #0]
;stm32f4xx_tim.c,3301 :: 		TIMx->CCER = tmpccer;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
STRH	R1, [R4, #0]
; tmpccer end address is: 4 (R1)
;stm32f4xx_tim.c,3302 :: 		}
L_end_TI3_Config:
BX	LR
; end of stm32f4xx_tim_TI3_Config
stm32f4xx_tim_TI4_Config:
;stm32f4xx_tim.c,3322 :: 		uint16_t TIM_ICFilter)
; TIM_ICFilter start address is: 12 (R3)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICPolarity start address is: 4 (R1)
; TIMx start address is: 0 (R0)
; TIM_ICFilter end address is: 12 (R3)
; TIM_ICSelection end address is: 8 (R2)
; TIM_ICPolarity end address is: 4 (R1)
; TIMx end address is: 0 (R0)
; TIMx start address is: 0 (R0)
; TIM_ICPolarity start address is: 4 (R1)
; TIM_ICSelection start address is: 8 (R2)
; TIM_ICFilter start address is: 12 (R3)
;stm32f4xx_tim.c,3324 :: 		uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;
;stm32f4xx_tim.c,3327 :: 		TIMx->CCER &= (uint16_t)~TIM_CCER_CC4E;
ADDW	R6, R0, #32
LDRH	R5, [R6, #0]
MOVW	R4, #61439
AND	R4, R5, R4, LSL #0
STRH	R4, [R6, #0]
;stm32f4xx_tim.c,3328 :: 		tmpccmr2 = TIMx->CCMR2;
ADD	R9, R0, #28
LDRH	R5, [R9, #0]
;stm32f4xx_tim.c,3329 :: 		tmpccer = TIMx->CCER;
ADDW	R4, R0, #32
LDRH	R8, [R4, #0]
;stm32f4xx_tim.c,3330 :: 		tmp = (uint16_t)(TIM_ICPolarity << 12);
LSLS	R7, R1, #12
UXTH	R7, R7
; TIM_ICPolarity end address is: 4 (R1)
;stm32f4xx_tim.c,3333 :: 		tmpccmr2 &= ((uint16_t)~TIM_CCMR1_CC2S) & ((uint16_t)~TIM_CCMR1_IC2F);
MOVW	R4, #3327
MOVT	R4, #0
AND	R4, R5, R4, LSL #0
;stm32f4xx_tim.c,3334 :: 		tmpccmr2 |= (uint16_t)(TIM_ICSelection << 8);
LSLS	R5, R2, #8
UXTH	R5, R5
; TIM_ICSelection end address is: 8 (R2)
UXTH	R4, R4
ORR	R5, R4, R5, LSL #0
UXTH	R5, R5
;stm32f4xx_tim.c,3335 :: 		tmpccmr2 |= (uint16_t)(TIM_ICFilter << 12);
LSLS	R4, R3, #12
UXTH	R4, R4
; TIM_ICFilter end address is: 12 (R3)
ORR	R6, R5, R4, LSL #0
;stm32f4xx_tim.c,3338 :: 		tmpccer &= (uint16_t)~(TIM_CCER_CC4P | TIM_CCER_CC4NP);
MOVW	R4, #24575
AND	R5, R8, R4, LSL #0
UXTH	R5, R5
;stm32f4xx_tim.c,3339 :: 		tmpccer |= (uint16_t)(tmp | (uint16_t)TIM_CCER_CC4E);
ORR	R4, R7, #4096
UXTH	R4, R4
ORR	R4, R5, R4, LSL #0
; tmpccer start address is: 4 (R1)
UXTH	R1, R4
;stm32f4xx_tim.c,3342 :: 		TIMx->CCMR2 = tmpccmr2;
STRH	R6, [R9, #0]
;stm32f4xx_tim.c,3343 :: 		TIMx->CCER = tmpccer ;
ADDW	R4, R0, #32
; TIMx end address is: 0 (R0)
STRH	R1, [R4, #0]
; tmpccer end address is: 4 (R1)
;stm32f4xx_tim.c,3344 :: 		}
L_end_TI4_Config:
BX	LR
; end of stm32f4xx_tim_TI4_Config
