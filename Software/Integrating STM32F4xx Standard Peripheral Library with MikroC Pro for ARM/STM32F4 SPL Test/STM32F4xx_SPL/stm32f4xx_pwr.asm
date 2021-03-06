stm32f4xx_pwr___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_pwr___DSB
stm32f4xx_pwr___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_pwr___WFI
stm32f4xx_pwr___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_pwr___WFE
stm32f4xx_pwr___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_pwr___REV
stm32f4xx_pwr_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_pwr_NVIC_SetPriorityGrouping
stm32f4xx_pwr_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_pwr_NVIC_GetPriorityGrouping
stm32f4xx_pwr_NVIC_EnableIRQ:
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
; end of stm32f4xx_pwr_NVIC_EnableIRQ
stm32f4xx_pwr_NVIC_DisableIRQ:
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
; end of stm32f4xx_pwr_NVIC_DisableIRQ
stm32f4xx_pwr_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_pwr_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_pwr_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_pwr_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_pwr_NVIC_GetPendingIRQ1
L_stm32f4xx_pwr_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_pwr_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_pwr_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_pwr_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_pwr_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_pwr_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_pwr_NVIC_GetPendingIRQ
stm32f4xx_pwr_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_pwr_NVIC_SetPendingIRQ
stm32f4xx_pwr_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_pwr_NVIC_ClearPendingIRQ
stm32f4xx_pwr_NVIC_GetActive:
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
BEQ	L_stm32f4xx_pwr_NVIC_GetActive2
; ?FLOC__stm32f4xx_pwr_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_pwr_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_pwr_NVIC_GetActive3
L_stm32f4xx_pwr_NVIC_GetActive2:
; ?FLOC__stm32f4xx_pwr_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_pwr_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_pwr_NVIC_GetActive3:
; ?FLOC__stm32f4xx_pwr_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_pwr_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_pwr_NVIC_GetActive
stm32f4xx_pwr_NVIC_SetPriority:
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
BGE	L_stm32f4xx_pwr_NVIC_SetPriority4
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
BAL	L_stm32f4xx_pwr_NVIC_SetPriority5
L_stm32f4xx_pwr_NVIC_SetPriority4:
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
L_stm32f4xx_pwr_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_pwr_NVIC_SetPriority
stm32f4xx_pwr_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_pwr_NVIC_GetPriority6
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
L_stm32f4xx_pwr_NVIC_GetPriority6:
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
; end of stm32f4xx_pwr_NVIC_GetPriority
stm32f4xx_pwr_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_pwr_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_pwr_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_pwr_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_pwr_NVIC_EncodePriority9
L_stm32f4xx_pwr_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_pwr_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_pwr_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_pwr_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_pwr_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_pwr_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_pwr_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_pwr_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_pwr_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_pwr_NVIC_EncodePriority11
L_stm32f4xx_pwr_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_pwr_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_pwr_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_pwr_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_pwr_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_pwr_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_pwr_NVIC_EncodePriority
stm32f4xx_pwr_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_pwr_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_pwr_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_pwr_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_pwr_NVIC_DecodePriority13
L_stm32f4xx_pwr_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_pwr_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_pwr_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_pwr_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_pwr_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_pwr_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_pwr_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_pwr_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_pwr_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_pwr_NVIC_DecodePriority15
L_stm32f4xx_pwr_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_pwr_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_pwr_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_pwr_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_pwr_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_pwr_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_pwr_NVIC_DecodePriority
stm32f4xx_pwr_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_pwr___DSB+0
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
BL	stm32f4xx_pwr___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_pwr_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_pwr_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_pwr_NVIC_SystemReset
stm32f4xx_pwr_SysTick_Config:
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
BLS	L_stm32f4xx_pwr_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_pwr_SysTick_Config18:
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
BL	stm32f4xx_pwr_NVIC_SetPriority+0
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
; end of stm32f4xx_pwr_SysTick_Config
stm32f4xx_pwr_ITM_SendChar:
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
BEQ	L_stm32f4xx_pwr_ITM_SendChar37
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_pwr_ITM_SendChar38
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_pwr_ITM_SendChar39
L_stm32f4xx_pwr_ITM_SendChar33:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_pwr_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_pwr_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_pwr_ITM_SendChar22
L_stm32f4xx_pwr_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_pwr_ITM_SendChar36
L_stm32f4xx_pwr_ITM_SendChar37:
L_stm32f4xx_pwr_ITM_SendChar36:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_pwr_ITM_SendChar35
L_stm32f4xx_pwr_ITM_SendChar38:
L_stm32f4xx_pwr_ITM_SendChar35:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_pwr_ITM_SendChar34
L_stm32f4xx_pwr_ITM_SendChar39:
L_stm32f4xx_pwr_ITM_SendChar34:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_pwr_ITM_SendChar
stm32f4xx_pwr_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_pwr_ITM_ReceiveChar24
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
L_stm32f4xx_pwr_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_pwr_ITM_ReceiveChar
stm32f4xx_pwr_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_pwr_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_pwr_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_pwr_ITM_CheckChar
_PWR_DeInit:
;stm32f4xx_pwr.c,126 :: 		void PWR_DeInit(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f4xx_pwr.c,128 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_PWR, ENABLE);
MOVS	R1, #1
MOV	R0, #268435456
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_pwr.c,129 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_PWR, DISABLE);
MOVS	R1, #0
MOV	R0, #268435456
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_pwr.c,130 :: 		}
L_end_PWR_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PWR_DeInit
_PWR_BackupAccessCmd:
;stm32f4xx_pwr.c,141 :: 		void PWR_BackupAccessCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_pwr.c,146 :: 		*(__IO uint32_t *) CR_DBP_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1108213792
MOVT	R1, 16910
STR	R2, [R1, #0]
;stm32f4xx_pwr.c,147 :: 		}
L_end_PWR_BackupAccessCmd:
BX	LR
; end of _PWR_BackupAccessCmd
_PWR_PVDLevelConfig:
;stm32f4xx_pwr.c,189 :: 		void PWR_PVDLevelConfig(uint32_t PWR_PVDLevel)
; PWR_PVDLevel start address is: 0 (R0)
; PWR_PVDLevel end address is: 0 (R0)
; PWR_PVDLevel start address is: 0 (R0)
;stm32f4xx_pwr.c,191 :: 		uint32_t tmpreg = 0;
;stm32f4xx_pwr.c,199 :: 		tmpreg &= CR_PLS_MASK;
MOVW	R3, #28672
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #224
AND	R1, R2, R1, LSL #0
;stm32f4xx_pwr.c,202 :: 		tmpreg |= PWR_PVDLevel;
ORRS	R1, R0
; PWR_PVDLevel end address is: 0 (R0)
;stm32f4xx_pwr.c,205 :: 		PWR->CR = tmpreg;
STR	R1, [R3, #0]
;stm32f4xx_pwr.c,206 :: 		}
L_end_PWR_PVDLevelConfig:
BX	LR
; end of _PWR_PVDLevelConfig
_PWR_PVDCmd:
;stm32f4xx_pwr.c,214 :: 		void PWR_PVDCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_pwr.c,219 :: 		*(__IO uint32_t *) CR_PVDE_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1108213776
MOVT	R1, 16910
STR	R2, [R1, #0]
;stm32f4xx_pwr.c,220 :: 		}
L_end_PWR_PVDCmd:
BX	LR
; end of _PWR_PVDCmd
_PWR_WakeUpPinCmd:
;stm32f4xx_pwr.c,248 :: 		void PWR_WakeUpPinCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_pwr.c,253 :: 		*(__IO uint32_t *) CSR_EWUP_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1108213920
MOVT	R1, 16910
STR	R2, [R1, #0]
;stm32f4xx_pwr.c,254 :: 		}
L_end_PWR_WakeUpPinCmd:
BX	LR
; end of _PWR_WakeUpPinCmd
_PWR_BackupRegulatorCmd:
;stm32f4xx_pwr.c,306 :: 		void PWR_BackupRegulatorCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_pwr.c,311 :: 		*(__IO uint32_t *) CSR_BRE_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1108213924
MOVT	R1, 16910
STR	R2, [R1, #0]
;stm32f4xx_pwr.c,312 :: 		}
L_end_PWR_BackupRegulatorCmd:
BX	LR
; end of _PWR_BackupRegulatorCmd
_PWR_MainRegulatorModeConfig:
;stm32f4xx_pwr.c,326 :: 		void PWR_MainRegulatorModeConfig(uint32_t PWR_Regulator_Voltage)
; PWR_Regulator_Voltage start address is: 0 (R0)
; PWR_Regulator_Voltage end address is: 0 (R0)
; PWR_Regulator_Voltage start address is: 0 (R0)
;stm32f4xx_pwr.c,331 :: 		if (PWR_Regulator_Voltage == PWR_Regulator_Voltage_Scale2)
CMP	R0, #0
IT	NE
BNE	L_PWR_MainRegulatorModeConfig27
; PWR_Regulator_Voltage end address is: 0 (R0)
;stm32f4xx_pwr.c,333 :: 		PWR->CR &= ~PWR_Regulator_Voltage_Scale1;
MOVW	R3, #28672
MOVT	R3, #16384
LDR	R2, [R3, #0]
MVN	R1, #16384
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_pwr.c,334 :: 		}
IT	AL
BAL	L_PWR_MainRegulatorModeConfig28
L_PWR_MainRegulatorModeConfig27:
;stm32f4xx_pwr.c,337 :: 		PWR->CR |= PWR_Regulator_Voltage_Scale1;
MOVW	R2, #28672
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORR	R1, R1, #16384
STR	R1, [R2, #0]
;stm32f4xx_pwr.c,338 :: 		}
L_PWR_MainRegulatorModeConfig28:
;stm32f4xx_pwr.c,339 :: 		}
L_end_PWR_MainRegulatorModeConfig:
BX	LR
; end of _PWR_MainRegulatorModeConfig
_PWR_FlashPowerDownCmd:
;stm32f4xx_pwr.c,368 :: 		void PWR_FlashPowerDownCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_pwr.c,373 :: 		*(__IO uint32_t *) CR_FPDS_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1108213796
MOVT	R1, 16910
STR	R2, [R1, #0]
;stm32f4xx_pwr.c,374 :: 		}
L_end_PWR_FlashPowerDownCmd:
BX	LR
; end of _PWR_FlashPowerDownCmd
_PWR_EnterSTOPMode:
;stm32f4xx_pwr.c,508 :: 		void PWR_EnterSTOPMode(uint32_t PWR_Regulator, uint8_t PWR_STOPEntry)
; PWR_STOPEntry start address is: 4 (R1)
; PWR_Regulator start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; PWR_STOPEntry end address is: 4 (R1)
; PWR_Regulator end address is: 0 (R0)
; PWR_Regulator start address is: 0 (R0)
; PWR_STOPEntry start address is: 4 (R1)
;stm32f4xx_pwr.c,510 :: 		uint32_t tmpreg = 0;
;stm32f4xx_pwr.c,519 :: 		tmpreg &= CR_DS_MASK;
MOVW	R4, #28672
MOVT	R4, #16384
LDR	R3, [R4, #0]
MVN	R2, #3
AND	R2, R3, R2, LSL #0
;stm32f4xx_pwr.c,522 :: 		tmpreg |= PWR_Regulator;
ORRS	R2, R0
; PWR_Regulator end address is: 0 (R0)
;stm32f4xx_pwr.c,525 :: 		PWR->CR = tmpreg;
STR	R2, [R4, #0]
;stm32f4xx_pwr.c,528 :: 		SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;
MOVW	R3, #60688
MOVT	R3, #57344
LDR	R2, [R3, #0]
ORR	R2, R2, #4
STR	R2, [R3, #0]
;stm32f4xx_pwr.c,531 :: 		if(PWR_STOPEntry == PWR_STOPEntry_WFI)
CMP	R1, #1
IT	NE
BNE	L_PWR_EnterSTOPMode29
; PWR_STOPEntry end address is: 4 (R1)
;stm32f4xx_pwr.c,534 :: 		__WFI();
BL	stm32f4xx_pwr___WFI+0
;stm32f4xx_pwr.c,535 :: 		}
IT	AL
BAL	L_PWR_EnterSTOPMode30
L_PWR_EnterSTOPMode29:
;stm32f4xx_pwr.c,539 :: 		__WFE();
BL	stm32f4xx_pwr___WFE+0
;stm32f4xx_pwr.c,540 :: 		}
L_PWR_EnterSTOPMode30:
;stm32f4xx_pwr.c,542 :: 		SCB->SCR &= (uint32_t)~((uint32_t)SCB_SCR_SLEEPDEEP_Msk);
MOVW	R4, #60688
MOVT	R4, #57344
LDR	R3, [R4, #0]
MVN	R2, #4
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_pwr.c,543 :: 		}
L_end_PWR_EnterSTOPMode:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PWR_EnterSTOPMode
_PWR_EnterSTANDBYMode:
;stm32f4xx_pwr.c,556 :: 		void PWR_EnterSTANDBYMode(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f4xx_pwr.c,559 :: 		PWR->CR |= PWR_CR_CWUF;
MOVW	R1, #28672
MOVT	R1, #16384
LDR	R0, [R1, #0]
ORR	R0, R0, #4
STR	R0, [R1, #0]
;stm32f4xx_pwr.c,562 :: 		PWR->CR |= PWR_CR_PDDS;
ORR	R0, R0, #2
STR	R0, [R1, #0]
;stm32f4xx_pwr.c,565 :: 		SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;
MOVW	R1, #60688
MOVT	R1, #57344
LDR	R0, [R1, #0]
ORR	R0, R0, #4
STR	R0, [R1, #0]
;stm32f4xx_pwr.c,572 :: 		__WFI();
BL	stm32f4xx_pwr___WFI+0
;stm32f4xx_pwr.c,573 :: 		}
L_end_PWR_EnterSTANDBYMode:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PWR_EnterSTANDBYMode
_PWR_GetFlagStatus:
;stm32f4xx_pwr.c,613 :: 		FlagStatus PWR_GetFlagStatus(uint32_t PWR_FLAG)
; PWR_FLAG start address is: 0 (R0)
; PWR_FLAG end address is: 0 (R0)
; PWR_FLAG start address is: 0 (R0)
;stm32f4xx_pwr.c,615 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_pwr.c,620 :: 		if ((PWR->CSR & PWR_FLAG) != (uint32_t)RESET)
MOVW	R1, #28676
MOVT	R1, #16384
LDR	R1, [R1, #0]
ANDS	R1, R0
; PWR_FLAG end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_PWR_GetFlagStatus31
;stm32f4xx_pwr.c,622 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_pwr.c,623 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_PWR_GetFlagStatus32
L_PWR_GetFlagStatus31:
;stm32f4xx_pwr.c,626 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_pwr.c,627 :: 		}
L_PWR_GetFlagStatus32:
;stm32f4xx_pwr.c,629 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_pwr.c,630 :: 		}
L_end_PWR_GetFlagStatus:
BX	LR
; end of _PWR_GetFlagStatus
_PWR_ClearFlag:
;stm32f4xx_pwr.c,640 :: 		void PWR_ClearFlag(uint32_t PWR_FLAG)
; PWR_FLAG start address is: 0 (R0)
; PWR_FLAG end address is: 0 (R0)
; PWR_FLAG start address is: 0 (R0)
;stm32f4xx_pwr.c,645 :: 		PWR->CR |=  PWR_FLAG << 2;
LSLS	R3, R0, #2
; PWR_FLAG end address is: 0 (R0)
MOVW	R2, #28672
MOVT	R2, #16384
LDR	R1, [R2, #0]
ORRS	R1, R3
STR	R1, [R2, #0]
;stm32f4xx_pwr.c,646 :: 		}
L_end_PWR_ClearFlag:
BX	LR
; end of _PWR_ClearFlag
