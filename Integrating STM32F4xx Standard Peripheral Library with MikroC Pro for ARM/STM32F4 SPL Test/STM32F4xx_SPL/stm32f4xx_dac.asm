stm32f4xx_dac___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_dac___DSB
stm32f4xx_dac___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_dac___WFI
stm32f4xx_dac___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_dac___WFE
stm32f4xx_dac___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_dac___REV
stm32f4xx_dac_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_dac_NVIC_SetPriorityGrouping
stm32f4xx_dac_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_dac_NVIC_GetPriorityGrouping
stm32f4xx_dac_NVIC_EnableIRQ:
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
; end of stm32f4xx_dac_NVIC_EnableIRQ
stm32f4xx_dac_NVIC_DisableIRQ:
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
; end of stm32f4xx_dac_NVIC_DisableIRQ
stm32f4xx_dac_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_dac_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_dac_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_dac_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_dac_NVIC_GetPendingIRQ1
L_stm32f4xx_dac_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_dac_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_dac_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_dac_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_dac_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_dac_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_dac_NVIC_GetPendingIRQ
stm32f4xx_dac_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_dac_NVIC_SetPendingIRQ
stm32f4xx_dac_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_dac_NVIC_ClearPendingIRQ
stm32f4xx_dac_NVIC_GetActive:
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
BEQ	L_stm32f4xx_dac_NVIC_GetActive2
; ?FLOC__stm32f4xx_dac_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_dac_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_dac_NVIC_GetActive3
L_stm32f4xx_dac_NVIC_GetActive2:
; ?FLOC__stm32f4xx_dac_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_dac_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_dac_NVIC_GetActive3:
; ?FLOC__stm32f4xx_dac_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_dac_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_dac_NVIC_GetActive
stm32f4xx_dac_NVIC_SetPriority:
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
BGE	L_stm32f4xx_dac_NVIC_SetPriority4
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
BAL	L_stm32f4xx_dac_NVIC_SetPriority5
L_stm32f4xx_dac_NVIC_SetPriority4:
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
L_stm32f4xx_dac_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_dac_NVIC_SetPriority
stm32f4xx_dac_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_dac_NVIC_GetPriority6
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
L_stm32f4xx_dac_NVIC_GetPriority6:
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
; end of stm32f4xx_dac_NVIC_GetPriority
stm32f4xx_dac_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_dac_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_dac_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_dac_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_dac_NVIC_EncodePriority9
L_stm32f4xx_dac_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_dac_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_dac_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_dac_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_dac_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_dac_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_dac_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_dac_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_dac_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_dac_NVIC_EncodePriority11
L_stm32f4xx_dac_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_dac_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_dac_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_dac_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_dac_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_dac_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_dac_NVIC_EncodePriority
stm32f4xx_dac_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_dac_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_dac_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_dac_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_dac_NVIC_DecodePriority13
L_stm32f4xx_dac_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_dac_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_dac_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_dac_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_dac_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_dac_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_dac_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_dac_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_dac_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_dac_NVIC_DecodePriority15
L_stm32f4xx_dac_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_dac_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_dac_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_dac_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_dac_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_dac_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_dac_NVIC_DecodePriority
stm32f4xx_dac_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_dac___DSB+0
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
BL	stm32f4xx_dac___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_dac_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_dac_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_dac_NVIC_SystemReset
stm32f4xx_dac_SysTick_Config:
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
BLS	L_stm32f4xx_dac_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_dac_SysTick_Config18:
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
BL	stm32f4xx_dac_NVIC_SetPriority+0
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
; end of stm32f4xx_dac_SysTick_Config
stm32f4xx_dac_ITM_SendChar:
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
BEQ	L_stm32f4xx_dac_ITM_SendChar51
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_dac_ITM_SendChar52
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_dac_ITM_SendChar53
L_stm32f4xx_dac_ITM_SendChar47:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_dac_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_dac_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_dac_ITM_SendChar22
L_stm32f4xx_dac_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_dac_ITM_SendChar50
L_stm32f4xx_dac_ITM_SendChar51:
L_stm32f4xx_dac_ITM_SendChar50:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_dac_ITM_SendChar49
L_stm32f4xx_dac_ITM_SendChar52:
L_stm32f4xx_dac_ITM_SendChar49:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_dac_ITM_SendChar48
L_stm32f4xx_dac_ITM_SendChar53:
L_stm32f4xx_dac_ITM_SendChar48:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_dac_ITM_SendChar
stm32f4xx_dac_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_dac_ITM_ReceiveChar24
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
L_stm32f4xx_dac_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_dac_ITM_ReceiveChar
stm32f4xx_dac_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_dac_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_dac_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_dac_ITM_CheckChar
_DAC_DeInit:
;stm32f4xx_dac.c,180 :: 		void DAC_DeInit(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f4xx_dac.c,183 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_DAC, ENABLE);
MOVS	R1, #1
MOV	R0, #536870912
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_dac.c,185 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_DAC, DISABLE);
MOVS	R1, #0
MOV	R0, #536870912
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_dac.c,186 :: 		}
L_end_DAC_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DAC_DeInit
_DAC_Init:
;stm32f4xx_dac.c,199 :: 		void DAC_Init(uint32_t DAC_Channel, DAC_InitTypeDef* DAC_InitStruct)
; DAC_InitStruct start address is: 4 (R1)
; DAC_Channel start address is: 0 (R0)
; DAC_InitStruct end address is: 4 (R1)
; DAC_Channel end address is: 0 (R0)
; DAC_Channel start address is: 0 (R0)
; DAC_InitStruct start address is: 4 (R1)
;stm32f4xx_dac.c,201 :: 		uint32_t tmpreg1 = 0, tmpreg2 = 0;
;stm32f4xx_dac.c,213 :: 		tmpreg1 &= ~(CR_CLEAR_MASK << DAC_Channel);
MOVW	R2, #4094
MOVT	R2, #0
LSLS	R2, R0
MVN	R3, R2
MOVW	R5, #29696
MOVT	R5, #16384
LDR	R2, [R5, #0]
AND	R4, R2, R3, LSL #0
;stm32f4xx_dac.c,220 :: 		tmpreg2 = (DAC_InitStruct->DAC_Trigger | DAC_InitStruct->DAC_WaveGeneration |
LDR	R3, [R1, #0]
ADDS	R2, R1, #4
LDR	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_dac.c,222 :: 		DAC_InitStruct->DAC_OutputBuffer);
ADDW	R2, R1, #8
LDR	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #12
; DAC_InitStruct end address is: 4 (R1)
LDR	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
;stm32f4xx_dac.c,224 :: 		tmpreg1 |= tmpreg2 << DAC_Channel;
LSLS	R2, R0
; DAC_Channel end address is: 0 (R0)
ORR	R2, R4, R2, LSL #0
;stm32f4xx_dac.c,226 :: 		DAC->CR = tmpreg1;
STR	R2, [R5, #0]
;stm32f4xx_dac.c,227 :: 		}
L_end_DAC_Init:
BX	LR
; end of _DAC_Init
_DAC_StructInit:
;stm32f4xx_dac.c,235 :: 		void DAC_StructInit(DAC_InitTypeDef* DAC_InitStruct)
; DAC_InitStruct start address is: 0 (R0)
; DAC_InitStruct end address is: 0 (R0)
; DAC_InitStruct start address is: 0 (R0)
;stm32f4xx_dac.c,239 :: 		DAC_InitStruct->DAC_Trigger = DAC_Trigger_None;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_dac.c,241 :: 		DAC_InitStruct->DAC_WaveGeneration = DAC_WaveGeneration_None;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dac.c,243 :: 		DAC_InitStruct->DAC_LFSRUnmask_TriangleAmplitude = DAC_LFSRUnmask_Bit0;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dac.c,245 :: 		DAC_InitStruct->DAC_OutputBuffer = DAC_OutputBuffer_Enable;
ADDW	R2, R0, #12
; DAC_InitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_dac.c,246 :: 		}
L_end_DAC_StructInit:
BX	LR
; end of _DAC_StructInit
_DAC_Cmd:
;stm32f4xx_dac.c,259 :: 		void DAC_Cmd(uint32_t DAC_Channel, FunctionalState NewState)
; NewState start address is: 4 (R1)
; DAC_Channel start address is: 0 (R0)
; NewState end address is: 4 (R1)
; DAC_Channel end address is: 0 (R0)
; DAC_Channel start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_dac.c,265 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_DAC_Cmd27
; NewState end address is: 4 (R1)
;stm32f4xx_dac.c,268 :: 		DAC->CR |= (DAC_CR_EN1 << DAC_Channel);
MOV	R2, #1
LSL	R4, R2, R0
; DAC_Channel end address is: 0 (R0)
MOVW	R3, #29696
MOVT	R3, #16384
LDR	R2, [R3, #0]
ORRS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_dac.c,269 :: 		}
IT	AL
BAL	L_DAC_Cmd28
L_DAC_Cmd27:
;stm32f4xx_dac.c,273 :: 		DAC->CR &= (~(DAC_CR_EN1 << DAC_Channel));
; DAC_Channel start address is: 0 (R0)
MOV	R2, #1
LSLS	R2, R0
; DAC_Channel end address is: 0 (R0)
MVN	R4, R2
MOVW	R3, #29696
MOVT	R3, #16384
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_dac.c,274 :: 		}
L_DAC_Cmd28:
;stm32f4xx_dac.c,275 :: 		}
L_end_DAC_Cmd:
BX	LR
; end of _DAC_Cmd
_DAC_SoftwareTriggerCmd:
;stm32f4xx_dac.c,287 :: 		void DAC_SoftwareTriggerCmd(uint32_t DAC_Channel, FunctionalState NewState)
; NewState start address is: 4 (R1)
; DAC_Channel start address is: 0 (R0)
; NewState end address is: 4 (R1)
; DAC_Channel end address is: 0 (R0)
; DAC_Channel start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_dac.c,293 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_DAC_SoftwareTriggerCmd29
; NewState end address is: 4 (R1)
;stm32f4xx_dac.c,296 :: 		DAC->SWTRIGR |= (uint32_t)DAC_SWTRIGR_SWTRIG1 << (DAC_Channel >> 4);
LSRS	R3, R0, #4
; DAC_Channel end address is: 0 (R0)
MOV	R2, #1
LSL	R4, R2, R3
MOVW	R3, #29700
MOVT	R3, #16384
LDR	R2, [R3, #0]
ORRS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_dac.c,297 :: 		}
IT	AL
BAL	L_DAC_SoftwareTriggerCmd30
L_DAC_SoftwareTriggerCmd29:
;stm32f4xx_dac.c,301 :: 		DAC->SWTRIGR &= ~((uint32_t)DAC_SWTRIGR_SWTRIG1 << (DAC_Channel >> 4));
; DAC_Channel start address is: 0 (R0)
LSRS	R3, R0, #4
; DAC_Channel end address is: 0 (R0)
MOV	R2, #1
LSLS	R2, R3
MVN	R4, R2
MOVW	R3, #29700
MOVT	R3, #16384
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_dac.c,302 :: 		}
L_DAC_SoftwareTriggerCmd30:
;stm32f4xx_dac.c,303 :: 		}
L_end_DAC_SoftwareTriggerCmd:
BX	LR
; end of _DAC_SoftwareTriggerCmd
_DAC_DualSoftwareTriggerCmd:
;stm32f4xx_dac.c,311 :: 		void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_dac.c,316 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_DAC_DualSoftwareTriggerCmd31
; NewState end address is: 0 (R0)
;stm32f4xx_dac.c,319 :: 		DAC->SWTRIGR |= DUAL_SWTRIG_SET;
MOVW	R2, #29700
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORR	R1, R1, #3
STR	R1, [R2, #0]
;stm32f4xx_dac.c,320 :: 		}
IT	AL
BAL	L_DAC_DualSoftwareTriggerCmd32
L_DAC_DualSoftwareTriggerCmd31:
;stm32f4xx_dac.c,324 :: 		DAC->SWTRIGR &= DUAL_SWTRIG_RESET;
MOVW	R3, #29700
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #3
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_dac.c,325 :: 		}
L_DAC_DualSoftwareTriggerCmd32:
;stm32f4xx_dac.c,326 :: 		}
L_end_DAC_DualSoftwareTriggerCmd:
BX	LR
; end of _DAC_DualSoftwareTriggerCmd
_DAC_WaveGenerationCmd:
;stm32f4xx_dac.c,342 :: 		void DAC_WaveGenerationCmd(uint32_t DAC_Channel, uint32_t DAC_Wave, FunctionalState NewState)
; NewState start address is: 8 (R2)
; DAC_Wave start address is: 4 (R1)
; DAC_Channel start address is: 0 (R0)
; NewState end address is: 8 (R2)
; DAC_Wave end address is: 4 (R1)
; DAC_Channel end address is: 0 (R0)
; DAC_Channel start address is: 0 (R0)
; DAC_Wave start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f4xx_dac.c,349 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_DAC_WaveGenerationCmd33
; NewState end address is: 8 (R2)
;stm32f4xx_dac.c,352 :: 		DAC->CR |= DAC_Wave << DAC_Channel;
LSL	R5, R1, R0
; DAC_Channel end address is: 0 (R0)
; DAC_Wave end address is: 4 (R1)
MOVW	R4, #29696
MOVT	R4, #16384
LDR	R3, [R4, #0]
ORRS	R3, R5
STR	R3, [R4, #0]
;stm32f4xx_dac.c,353 :: 		}
IT	AL
BAL	L_DAC_WaveGenerationCmd34
L_DAC_WaveGenerationCmd33:
;stm32f4xx_dac.c,357 :: 		DAC->CR &= ~(DAC_Wave << DAC_Channel);
; DAC_Wave start address is: 4 (R1)
; DAC_Channel start address is: 0 (R0)
LSL	R3, R1, R0
; DAC_Channel end address is: 0 (R0)
; DAC_Wave end address is: 4 (R1)
MVN	R5, R3
MOVW	R4, #29696
MOVT	R4, #16384
LDR	R3, [R4, #0]
ANDS	R3, R5
STR	R3, [R4, #0]
;stm32f4xx_dac.c,358 :: 		}
L_DAC_WaveGenerationCmd34:
;stm32f4xx_dac.c,359 :: 		}
L_end_DAC_WaveGenerationCmd:
BX	LR
; end of _DAC_WaveGenerationCmd
_DAC_SetChannel1Data:
;stm32f4xx_dac.c,371 :: 		void DAC_SetChannel1Data(uint32_t DAC_Align, uint16_t Data)
; Data start address is: 4 (R1)
; DAC_Align start address is: 0 (R0)
; Data end address is: 4 (R1)
; DAC_Align end address is: 0 (R0)
; DAC_Align start address is: 0 (R0)
; Data start address is: 4 (R1)
;stm32f4xx_dac.c,373 :: 		__IO uint32_t tmp = 0;
;stm32f4xx_dac.c,379 :: 		tmp = (uint32_t)DAC_BASE;
; tmp start address is: 12 (R3)
MOVW	R3, #29696
MOVT	R3, #16384
;stm32f4xx_dac.c,380 :: 		tmp += DHR12R1_OFFSET + DAC_Align;
ADDW	R2, R0, #8
; DAC_Align end address is: 0 (R0)
ADDS	R2, R3, R2
; tmp end address is: 12 (R3)
; tmp start address is: 0 (R0)
MOV	R0, R2
;stm32f4xx_dac.c,383 :: 		*(__IO uint32_t *) tmp = Data;
MOV	R2, R0
; tmp end address is: 0 (R0)
STR	R1, [R2, #0]
; Data end address is: 4 (R1)
;stm32f4xx_dac.c,384 :: 		}
L_end_DAC_SetChannel1Data:
BX	LR
; end of _DAC_SetChannel1Data
_DAC_SetChannel2Data:
;stm32f4xx_dac.c,396 :: 		void DAC_SetChannel2Data(uint32_t DAC_Align, uint16_t Data)
; Data start address is: 4 (R1)
; DAC_Align start address is: 0 (R0)
; Data end address is: 4 (R1)
; DAC_Align end address is: 0 (R0)
; DAC_Align start address is: 0 (R0)
; Data start address is: 4 (R1)
;stm32f4xx_dac.c,398 :: 		__IO uint32_t tmp = 0;
;stm32f4xx_dac.c,404 :: 		tmp = (uint32_t)DAC_BASE;
; tmp start address is: 12 (R3)
MOVW	R3, #29696
MOVT	R3, #16384
;stm32f4xx_dac.c,405 :: 		tmp += DHR12R2_OFFSET + DAC_Align;
ADDW	R2, R0, #20
; DAC_Align end address is: 0 (R0)
ADDS	R2, R3, R2
; tmp end address is: 12 (R3)
; tmp start address is: 0 (R0)
MOV	R0, R2
;stm32f4xx_dac.c,408 :: 		*(__IO uint32_t *)tmp = Data;
MOV	R2, R0
; tmp end address is: 0 (R0)
STR	R1, [R2, #0]
; Data end address is: 4 (R1)
;stm32f4xx_dac.c,409 :: 		}
L_end_DAC_SetChannel2Data:
BX	LR
; end of _DAC_SetChannel2Data
_DAC_SetDualChannelData:
;stm32f4xx_dac.c,424 :: 		void DAC_SetDualChannelData(uint32_t DAC_Align, uint16_t Data2, uint16_t Data1)
; Data1 start address is: 8 (R2)
; Data2 start address is: 4 (R1)
; DAC_Align start address is: 0 (R0)
; Data1 end address is: 8 (R2)
; Data2 end address is: 4 (R1)
; DAC_Align end address is: 0 (R0)
; DAC_Align start address is: 0 (R0)
; Data2 start address is: 4 (R1)
; Data1 start address is: 8 (R2)
;stm32f4xx_dac.c,426 :: 		uint32_t dataMe = 0, tmp = 0;
;stm32f4xx_dac.c,434 :: 		if (DAC_Align == DAC_Align_8b_R)
CMP	R0, #8
IT	NE
BNE	L_DAC_SetDualChannelData35
;stm32f4xx_dac.c,436 :: 		dataMe = ((uint32_t)Data2 << 8) | Data1;
; Data2 end address is: 4 (R1)
LSLS	R1, R1, #8
ORRS	R1, R2
; Data1 end address is: 8 (R2)
; dataMe start address is: 4 (R1)
;stm32f4xx_dac.c,437 :: 		}
; dataMe end address is: 4 (R1)
IT	AL
BAL	L_DAC_SetDualChannelData36
L_DAC_SetDualChannelData35:
;stm32f4xx_dac.c,440 :: 		dataMe = ((uint32_t)Data2 << 16) | Data1;
; Data1 start address is: 8 (R2)
; Data2 start address is: 4 (R1)
; Data2 end address is: 4 (R1)
LSLS	R1, R1, #16
ORRS	R1, R2
; Data1 end address is: 8 (R2)
; dataMe start address is: 4 (R1)
; dataMe end address is: 4 (R1)
;stm32f4xx_dac.c,441 :: 		}
L_DAC_SetDualChannelData36:
;stm32f4xx_dac.c,444 :: 		tmp += DHR12RD_OFFSET + DAC_Align;
; dataMe start address is: 4 (R1)
ADDW	R4, R0, #32
; DAC_Align end address is: 0 (R0)
MOVW	R3, #29696
MOVT	R3, #16384
ADDS	R3, R3, R4
;stm32f4xx_dac.c,447 :: 		*(__IO uint32_t *)tmp = dataMe;
STR	R1, [R3, #0]
; dataMe end address is: 4 (R1)
;stm32f4xx_dac.c,448 :: 		}
L_end_DAC_SetDualChannelData:
BX	LR
; end of _DAC_SetDualChannelData
_DAC_GetDataOutputValue:
;stm32f4xx_dac.c,458 :: 		uint16_t DAC_GetDataOutputValue(uint32_t DAC_Channel)
; DAC_Channel start address is: 0 (R0)
; DAC_Channel end address is: 0 (R0)
; DAC_Channel start address is: 0 (R0)
;stm32f4xx_dac.c,460 :: 		__IO uint32_t tmp = 0;
;stm32f4xx_dac.c,465 :: 		tmp = (uint32_t) DAC_BASE ;
; tmp start address is: 8 (R2)
MOVW	R2, #29696
MOVT	R2, #16384
;stm32f4xx_dac.c,466 :: 		tmp += DOR_OFFSET + ((uint32_t)DAC_Channel >> 2);
LSRS	R1, R0, #2
; DAC_Channel end address is: 0 (R0)
ADDS	R1, #44
ADDS	R1, R2, R1
; tmp end address is: 8 (R2)
; tmp start address is: 0 (R0)
MOV	R0, R1
;stm32f4xx_dac.c,469 :: 		return (uint16_t) (*(__IO uint32_t*) tmp);
MOV	R1, R0
; tmp end address is: 0 (R0)
LDR	R1, [R1, #0]
UXTH	R1, R1
UXTH	R0, R1
;stm32f4xx_dac.c,470 :: 		}
L_end_DAC_GetDataOutputValue:
BX	LR
; end of _DAC_GetDataOutputValue
_DAC_DMACmd:
;stm32f4xx_dac.c,503 :: 		void DAC_DMACmd(uint32_t DAC_Channel, FunctionalState NewState)
; NewState start address is: 4 (R1)
; DAC_Channel start address is: 0 (R0)
; NewState end address is: 4 (R1)
; DAC_Channel end address is: 0 (R0)
; DAC_Channel start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_dac.c,509 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_DAC_DMACmd37
; NewState end address is: 4 (R1)
;stm32f4xx_dac.c,512 :: 		DAC->CR |= (DAC_CR_DMAEN1 << DAC_Channel);
MOV	R2, #4096
LSL	R4, R2, R0
; DAC_Channel end address is: 0 (R0)
MOVW	R3, #29696
MOVT	R3, #16384
LDR	R2, [R3, #0]
ORRS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_dac.c,513 :: 		}
IT	AL
BAL	L_DAC_DMACmd38
L_DAC_DMACmd37:
;stm32f4xx_dac.c,517 :: 		DAC->CR &= (~(DAC_CR_DMAEN1 << DAC_Channel));
; DAC_Channel start address is: 0 (R0)
MOV	R2, #4096
LSLS	R2, R0
; DAC_Channel end address is: 0 (R0)
MVN	R4, R2
MOVW	R3, #29696
MOVT	R3, #16384
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_dac.c,518 :: 		}
L_DAC_DMACmd38:
;stm32f4xx_dac.c,519 :: 		}
L_end_DAC_DMACmd:
BX	LR
; end of _DAC_DMACmd
_DAC_ITConfig:
;stm32f4xx_dac.c,551 :: 		void DAC_ITConfig(uint32_t DAC_Channel, uint32_t DAC_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; DAC_IT start address is: 4 (R1)
; DAC_Channel start address is: 0 (R0)
; NewState end address is: 8 (R2)
; DAC_IT end address is: 4 (R1)
; DAC_Channel end address is: 0 (R0)
; DAC_Channel start address is: 0 (R0)
; DAC_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f4xx_dac.c,558 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_DAC_ITConfig39
; NewState end address is: 8 (R2)
;stm32f4xx_dac.c,561 :: 		DAC->CR |=  (DAC_IT << DAC_Channel);
LSL	R5, R1, R0
; DAC_Channel end address is: 0 (R0)
; DAC_IT end address is: 4 (R1)
MOVW	R4, #29696
MOVT	R4, #16384
LDR	R3, [R4, #0]
ORRS	R3, R5
STR	R3, [R4, #0]
;stm32f4xx_dac.c,562 :: 		}
IT	AL
BAL	L_DAC_ITConfig40
L_DAC_ITConfig39:
;stm32f4xx_dac.c,566 :: 		DAC->CR &= (~(uint32_t)(DAC_IT << DAC_Channel));
; DAC_IT start address is: 4 (R1)
; DAC_Channel start address is: 0 (R0)
LSL	R3, R1, R0
; DAC_Channel end address is: 0 (R0)
; DAC_IT end address is: 4 (R1)
MVN	R5, R3
MOVW	R4, #29696
MOVT	R4, #16384
LDR	R3, [R4, #0]
ANDS	R3, R5
STR	R3, [R4, #0]
;stm32f4xx_dac.c,567 :: 		}
L_DAC_ITConfig40:
;stm32f4xx_dac.c,568 :: 		}
L_end_DAC_ITConfig:
BX	LR
; end of _DAC_ITConfig
_DAC_GetFlagStatus:
;stm32f4xx_dac.c,583 :: 		FlagStatus DAC_GetFlagStatus(uint32_t DAC_Channel, uint32_t DAC_FLAG)
; DAC_FLAG start address is: 4 (R1)
; DAC_Channel start address is: 0 (R0)
; DAC_FLAG end address is: 4 (R1)
; DAC_Channel end address is: 0 (R0)
; DAC_Channel start address is: 0 (R0)
; DAC_FLAG start address is: 4 (R1)
;stm32f4xx_dac.c,585 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_dac.c,591 :: 		if ((DAC->SR & (DAC_FLAG << DAC_Channel)) != (uint8_t)RESET)
LSL	R3, R1, R0
; DAC_Channel end address is: 0 (R0)
; DAC_FLAG end address is: 4 (R1)
MOVW	R2, #29748
MOVT	R2, #16384
LDR	R2, [R2, #0]
ANDS	R2, R3
CMP	R2, #0
IT	EQ
BEQ	L_DAC_GetFlagStatus41
;stm32f4xx_dac.c,594 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_dac.c,595 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_DAC_GetFlagStatus42
L_DAC_GetFlagStatus41:
;stm32f4xx_dac.c,599 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_dac.c,600 :: 		}
L_DAC_GetFlagStatus42:
;stm32f4xx_dac.c,602 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_dac.c,603 :: 		}
L_end_DAC_GetFlagStatus:
BX	LR
; end of _DAC_GetFlagStatus
_DAC_ClearFlag:
;stm32f4xx_dac.c,618 :: 		void DAC_ClearFlag(uint32_t DAC_Channel, uint32_t DAC_FLAG)
; DAC_FLAG start address is: 4 (R1)
; DAC_Channel start address is: 0 (R0)
; DAC_FLAG end address is: 4 (R1)
; DAC_Channel end address is: 0 (R0)
; DAC_Channel start address is: 0 (R0)
; DAC_FLAG start address is: 4 (R1)
;stm32f4xx_dac.c,625 :: 		DAC->SR = (DAC_FLAG << DAC_Channel);
LSL	R3, R1, R0
; DAC_Channel end address is: 0 (R0)
; DAC_FLAG end address is: 4 (R1)
MOVW	R2, #29748
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_dac.c,626 :: 		}
L_end_DAC_ClearFlag:
BX	LR
; end of _DAC_ClearFlag
_DAC_GetITStatus:
;stm32f4xx_dac.c,641 :: 		ITStatus DAC_GetITStatus(uint32_t DAC_Channel, uint32_t DAC_IT)
; DAC_IT start address is: 4 (R1)
; DAC_Channel start address is: 0 (R0)
; DAC_IT end address is: 4 (R1)
; DAC_Channel end address is: 0 (R0)
; DAC_Channel start address is: 0 (R0)
; DAC_IT start address is: 4 (R1)
;stm32f4xx_dac.c,643 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_dac.c,644 :: 		uint32_t enablestatus = 0;
;stm32f4xx_dac.c,651 :: 		enablestatus = (DAC->CR & (DAC_IT << DAC_Channel)) ;
LSL	R3, R1, R0
; DAC_Channel end address is: 0 (R0)
; DAC_IT end address is: 4 (R1)
MOVW	R2, #29696
MOVT	R2, #16384
LDR	R2, [R2, #0]
ANDS	R2, R3
; enablestatus start address is: 0 (R0)
MOV	R0, R2
;stm32f4xx_dac.c,654 :: 		if (((DAC->SR & (DAC_IT << DAC_Channel)) != (uint32_t)RESET) && enablestatus)
MOVW	R2, #29748
MOVT	R2, #16384
LDR	R2, [R2, #0]
ANDS	R2, R3
CMP	R2, #0
IT	EQ
BEQ	L__DAC_GetITStatus56
CMP	R0, #0
IT	EQ
BEQ	L__DAC_GetITStatus55
; enablestatus end address is: 0 (R0)
L__DAC_GetITStatus54:
;stm32f4xx_dac.c,657 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_dac.c,658 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_DAC_GetITStatus46
;stm32f4xx_dac.c,654 :: 		if (((DAC->SR & (DAC_IT << DAC_Channel)) != (uint32_t)RESET) && enablestatus)
L__DAC_GetITStatus56:
L__DAC_GetITStatus55:
;stm32f4xx_dac.c,662 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_dac.c,663 :: 		}
L_DAC_GetITStatus46:
;stm32f4xx_dac.c,665 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_dac.c,666 :: 		}
L_end_DAC_GetITStatus:
BX	LR
; end of _DAC_GetITStatus
_DAC_ClearITPendingBit:
;stm32f4xx_dac.c,681 :: 		void DAC_ClearITPendingBit(uint32_t DAC_Channel, uint32_t DAC_IT)
; DAC_IT start address is: 4 (R1)
; DAC_Channel start address is: 0 (R0)
; DAC_IT end address is: 4 (R1)
; DAC_Channel end address is: 0 (R0)
; DAC_Channel start address is: 0 (R0)
; DAC_IT start address is: 4 (R1)
;stm32f4xx_dac.c,688 :: 		DAC->SR = (DAC_IT << DAC_Channel);
LSL	R3, R1, R0
; DAC_Channel end address is: 0 (R0)
; DAC_IT end address is: 4 (R1)
MOVW	R2, #29748
MOVT	R2, #16384
STR	R3, [R2, #0]
;stm32f4xx_dac.c,689 :: 		}
L_end_DAC_ClearITPendingBit:
BX	LR
; end of _DAC_ClearITPendingBit
