stm32f4xx_sdio___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_sdio___DSB
stm32f4xx_sdio___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_sdio___WFI
stm32f4xx_sdio___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_sdio___WFE
stm32f4xx_sdio___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_sdio___REV
stm32f4xx_sdio_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_sdio_NVIC_SetPriorityGrouping
stm32f4xx_sdio_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_sdio_NVIC_GetPriorityGrouping
stm32f4xx_sdio_NVIC_EnableIRQ:
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
; end of stm32f4xx_sdio_NVIC_EnableIRQ
stm32f4xx_sdio_NVIC_DisableIRQ:
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
; end of stm32f4xx_sdio_NVIC_DisableIRQ
stm32f4xx_sdio_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_sdio_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_sdio_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_sdio_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_sdio_NVIC_GetPendingIRQ1
L_stm32f4xx_sdio_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_sdio_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_sdio_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_sdio_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_sdio_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_sdio_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_sdio_NVIC_GetPendingIRQ
stm32f4xx_sdio_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_sdio_NVIC_SetPendingIRQ
stm32f4xx_sdio_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_sdio_NVIC_ClearPendingIRQ
stm32f4xx_sdio_NVIC_GetActive:
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
BEQ	L_stm32f4xx_sdio_NVIC_GetActive2
; ?FLOC__stm32f4xx_sdio_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_sdio_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_sdio_NVIC_GetActive3
L_stm32f4xx_sdio_NVIC_GetActive2:
; ?FLOC__stm32f4xx_sdio_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_sdio_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_sdio_NVIC_GetActive3:
; ?FLOC__stm32f4xx_sdio_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_sdio_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_sdio_NVIC_GetActive
stm32f4xx_sdio_NVIC_SetPriority:
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
BGE	L_stm32f4xx_sdio_NVIC_SetPriority4
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
BAL	L_stm32f4xx_sdio_NVIC_SetPriority5
L_stm32f4xx_sdio_NVIC_SetPriority4:
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
L_stm32f4xx_sdio_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_sdio_NVIC_SetPriority
stm32f4xx_sdio_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_sdio_NVIC_GetPriority6
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
L_stm32f4xx_sdio_NVIC_GetPriority6:
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
; end of stm32f4xx_sdio_NVIC_GetPriority
stm32f4xx_sdio_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_sdio_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_sdio_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_sdio_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_sdio_NVIC_EncodePriority9
L_stm32f4xx_sdio_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_sdio_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_sdio_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_sdio_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_sdio_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_sdio_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_sdio_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_sdio_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_sdio_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_sdio_NVIC_EncodePriority11
L_stm32f4xx_sdio_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_sdio_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_sdio_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_sdio_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_sdio_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_sdio_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_sdio_NVIC_EncodePriority
stm32f4xx_sdio_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_sdio_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_sdio_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_sdio_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_sdio_NVIC_DecodePriority13
L_stm32f4xx_sdio_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_sdio_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_sdio_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_sdio_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_sdio_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_sdio_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_sdio_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_sdio_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_sdio_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_sdio_NVIC_DecodePriority15
L_stm32f4xx_sdio_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_sdio_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_sdio_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_sdio_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_sdio_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_sdio_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_sdio_NVIC_DecodePriority
stm32f4xx_sdio_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_sdio___DSB+0
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
BL	stm32f4xx_sdio___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_sdio_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_sdio_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_sdio_NVIC_SystemReset
stm32f4xx_sdio_SysTick_Config:
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
BLS	L_stm32f4xx_sdio_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_sdio_SysTick_Config18:
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
BL	stm32f4xx_sdio_NVIC_SetPriority+0
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
; end of stm32f4xx_sdio_SysTick_Config
stm32f4xx_sdio_ITM_SendChar:
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
BEQ	L_stm32f4xx_sdio_ITM_SendChar37
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_sdio_ITM_SendChar38
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_sdio_ITM_SendChar39
L_stm32f4xx_sdio_ITM_SendChar33:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_sdio_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_sdio_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_sdio_ITM_SendChar22
L_stm32f4xx_sdio_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_sdio_ITM_SendChar36
L_stm32f4xx_sdio_ITM_SendChar37:
L_stm32f4xx_sdio_ITM_SendChar36:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_sdio_ITM_SendChar35
L_stm32f4xx_sdio_ITM_SendChar38:
L_stm32f4xx_sdio_ITM_SendChar35:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_sdio_ITM_SendChar34
L_stm32f4xx_sdio_ITM_SendChar39:
L_stm32f4xx_sdio_ITM_SendChar34:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_sdio_ITM_SendChar
stm32f4xx_sdio_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_sdio_ITM_ReceiveChar24
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
L_stm32f4xx_sdio_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_sdio_ITM_ReceiveChar
stm32f4xx_sdio_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_sdio_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_sdio_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_sdio_ITM_CheckChar
_SDIO_DeInit:
;stm32f4xx_sdio.c,265 :: 		void SDIO_DeInit(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f4xx_sdio.c,267 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_SDIO, ENABLE);
MOVS	R1, #1
MOV	R0, #2048
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_sdio.c,268 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_SDIO, DISABLE);
MOVS	R1, #0
MOV	R0, #2048
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_sdio.c,269 :: 		}
L_end_SDIO_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SDIO_DeInit
_SDIO_Init:
;stm32f4xx_sdio.c,278 :: 		void SDIO_Init(SDIO_InitTypeDef* SDIO_InitStruct)
; SDIO_InitStruct start address is: 0 (R0)
; SDIO_InitStruct end address is: 0 (R0)
; SDIO_InitStruct start address is: 0 (R0)
;stm32f4xx_sdio.c,280 :: 		uint32_t tmpreg = 0;
;stm32f4xx_sdio.c,294 :: 		tmpreg &= CLKCR_CLEAR_MASK;
MOVW	R4, #11268
MOVT	R4, #16385
LDR	R2, [R4, #0]
MOVW	R1, #33024
MOVT	R1, #65535
AND	R3, R2, R1, LSL #0
;stm32f4xx_sdio.c,302 :: 		tmpreg |= (SDIO_InitStruct->SDIO_ClockDiv  | SDIO_InitStruct->SDIO_ClockPowerSave |
ADDW	R1, R0, #20
LDRB	R2, [R1, #0]
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_sdio.c,303 :: 		SDIO_InitStruct->SDIO_ClockBypass | SDIO_InitStruct->SDIO_BusWide |
ADDS	R1, R0, #4
LDR	R1, [R1, #0]
ORRS	R2, R1
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_sdio.c,304 :: 		SDIO_InitStruct->SDIO_ClockEdge | SDIO_InitStruct->SDIO_HardwareFlowControl);
LDR	R1, [R0, #0]
ORRS	R2, R1
ADDW	R1, R0, #16
; SDIO_InitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
ORR	R1, R3, R1, LSL #0
;stm32f4xx_sdio.c,307 :: 		SDIO->CLKCR = tmpreg;
STR	R1, [R4, #0]
;stm32f4xx_sdio.c,308 :: 		}
L_end_SDIO_Init:
BX	LR
; end of _SDIO_Init
_SDIO_StructInit:
;stm32f4xx_sdio.c,316 :: 		void SDIO_StructInit(SDIO_InitTypeDef* SDIO_InitStruct)
; SDIO_InitStruct start address is: 0 (R0)
; SDIO_InitStruct end address is: 0 (R0)
; SDIO_InitStruct start address is: 0 (R0)
;stm32f4xx_sdio.c,319 :: 		SDIO_InitStruct->SDIO_ClockDiv = 0x00;
ADDW	R2, R0, #20
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_sdio.c,320 :: 		SDIO_InitStruct->SDIO_ClockEdge = SDIO_ClockEdge_Rising;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_sdio.c,321 :: 		SDIO_InitStruct->SDIO_ClockBypass = SDIO_ClockBypass_Disable;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,322 :: 		SDIO_InitStruct->SDIO_ClockPowerSave = SDIO_ClockPowerSave_Disable;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,323 :: 		SDIO_InitStruct->SDIO_BusWide = SDIO_BusWide_1b;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,324 :: 		SDIO_InitStruct->SDIO_HardwareFlowControl = SDIO_HardwareFlowControl_Disable;
ADDW	R2, R0, #16
; SDIO_InitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,325 :: 		}
L_end_SDIO_StructInit:
BX	LR
; end of _SDIO_StructInit
_SDIO_ClockCmd:
;stm32f4xx_sdio.c,333 :: 		void SDIO_ClockCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_sdio.c,338 :: 		*(__IO uint32_t *) CLKCR_CLKEN_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1109754016
MOVT	R1, 16933
STR	R2, [R1, #0]
;stm32f4xx_sdio.c,339 :: 		}
L_end_SDIO_ClockCmd:
BX	LR
; end of _SDIO_ClockCmd
_SDIO_SetPowerState:
;stm32f4xx_sdio.c,349 :: 		void SDIO_SetPowerState(uint32_t SDIO_PowerState)
; SDIO_PowerState start address is: 0 (R0)
; SDIO_PowerState end address is: 0 (R0)
; SDIO_PowerState start address is: 0 (R0)
;stm32f4xx_sdio.c,354 :: 		SDIO->POWER = SDIO_PowerState;
MOVW	R1, #11264
MOVT	R1, #16385
STR	R0, [R1, #0]
; SDIO_PowerState end address is: 0 (R0)
;stm32f4xx_sdio.c,355 :: 		}
L_end_SDIO_SetPowerState:
BX	LR
; end of _SDIO_SetPowerState
_SDIO_GetPowerState:
;stm32f4xx_sdio.c,366 :: 		uint32_t SDIO_GetPowerState(void)
;stm32f4xx_sdio.c,368 :: 		return (SDIO->POWER & (~PWR_PWRCTRL_MASK));
MOVW	R0, #11264
MOVT	R0, #16385
LDR	R0, [R0, #0]
AND	R0, R0, #3
;stm32f4xx_sdio.c,369 :: 		}
L_end_SDIO_GetPowerState:
BX	LR
; end of _SDIO_GetPowerState
_SDIO_SendCommand:
;stm32f4xx_sdio.c,398 :: 		void SDIO_SendCommand(SDIO_CmdInitTypeDef *SDIO_CmdInitStruct)
; SDIO_CmdInitStruct start address is: 0 (R0)
; SDIO_CmdInitStruct end address is: 0 (R0)
; SDIO_CmdInitStruct start address is: 0 (R0)
;stm32f4xx_sdio.c,400 :: 		uint32_t tmpreg = 0;
;stm32f4xx_sdio.c,410 :: 		SDIO->ARG = SDIO_CmdInitStruct->SDIO_Argument;
LDR	R2, [R0, #0]
MOVW	R1, #11272
MOVT	R1, #16385
STR	R2, [R1, #0]
;stm32f4xx_sdio.c,416 :: 		tmpreg &= CMD_CLEAR_MASK;
MOVW	R4, #11276
MOVT	R4, #16385
LDR	R2, [R4, #0]
MOVW	R1, #63488
MOVT	R1, #65535
AND	R3, R2, R1, LSL #0
;stm32f4xx_sdio.c,421 :: 		tmpreg |= (uint32_t)SDIO_CmdInitStruct->SDIO_CmdIndex | SDIO_CmdInitStruct->SDIO_Response
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_sdio.c,422 :: 		| SDIO_CmdInitStruct->SDIO_Wait | SDIO_CmdInitStruct->SDIO_CPSM;
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ORRS	R2, R1
ADDW	R1, R0, #16
; SDIO_CmdInitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
ORR	R1, R3, R1, LSL #0
;stm32f4xx_sdio.c,425 :: 		SDIO->CMD = tmpreg;
STR	R1, [R4, #0]
;stm32f4xx_sdio.c,426 :: 		}
L_end_SDIO_SendCommand:
BX	LR
; end of _SDIO_SendCommand
_SDIO_CmdStructInit:
;stm32f4xx_sdio.c,434 :: 		void SDIO_CmdStructInit(SDIO_CmdInitTypeDef* SDIO_CmdInitStruct)
; SDIO_CmdInitStruct start address is: 0 (R0)
; SDIO_CmdInitStruct end address is: 0 (R0)
; SDIO_CmdInitStruct start address is: 0 (R0)
;stm32f4xx_sdio.c,437 :: 		SDIO_CmdInitStruct->SDIO_Argument = 0x00;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_sdio.c,438 :: 		SDIO_CmdInitStruct->SDIO_CmdIndex = 0x00;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,439 :: 		SDIO_CmdInitStruct->SDIO_Response = SDIO_Response_No;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,440 :: 		SDIO_CmdInitStruct->SDIO_Wait = SDIO_Wait_No;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,441 :: 		SDIO_CmdInitStruct->SDIO_CPSM = SDIO_CPSM_Disable;
ADDW	R2, R0, #16
; SDIO_CmdInitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,442 :: 		}
L_end_SDIO_CmdStructInit:
BX	LR
; end of _SDIO_CmdStructInit
_SDIO_GetCommandResponse:
;stm32f4xx_sdio.c,449 :: 		uint8_t SDIO_GetCommandResponse(void)
;stm32f4xx_sdio.c,451 :: 		return (uint8_t)(SDIO->RESPCMD);
MOVW	R0, #11280
MOVT	R0, #16385
LDRB	R0, [R0, #0]
;stm32f4xx_sdio.c,452 :: 		}
L_end_SDIO_GetCommandResponse:
BX	LR
; end of _SDIO_GetCommandResponse
_SDIO_GetResponse:
;stm32f4xx_sdio.c,464 :: 		uint32_t SDIO_GetResponse(uint32_t SDIO_RESP)
; SDIO_RESP start address is: 0 (R0)
; SDIO_RESP end address is: 0 (R0)
; SDIO_RESP start address is: 0 (R0)
;stm32f4xx_sdio.c,466 :: 		__IO uint32_t tmp = 0;
;stm32f4xx_sdio.c,471 :: 		tmp = SDIO_RESP_ADDR + SDIO_RESP;
MOVW	R1, #11284
MOVT	R1, #16385
ADDS	R1, R1, R0
; SDIO_RESP end address is: 0 (R0)
; tmp start address is: 0 (R0)
MOV	R0, R1
;stm32f4xx_sdio.c,473 :: 		return (*(__IO uint32_t *) tmp);
MOV	R1, R0
; tmp end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
;stm32f4xx_sdio.c,474 :: 		}
L_end_SDIO_GetResponse:
BX	LR
; end of _SDIO_GetResponse
_SDIO_DataConfig:
;stm32f4xx_sdio.c,502 :: 		void SDIO_DataConfig(SDIO_DataInitTypeDef* SDIO_DataInitStruct)
; SDIO_DataInitStruct start address is: 0 (R0)
; SDIO_DataInitStruct end address is: 0 (R0)
; SDIO_DataInitStruct start address is: 0 (R0)
;stm32f4xx_sdio.c,504 :: 		uint32_t tmpreg = 0;
;stm32f4xx_sdio.c,515 :: 		SDIO->DTIMER = SDIO_DataInitStruct->SDIO_DataTimeOut;
LDR	R2, [R0, #0]
MOVW	R1, #11300
MOVT	R1, #16385
STR	R2, [R1, #0]
;stm32f4xx_sdio.c,519 :: 		SDIO->DLEN = SDIO_DataInitStruct->SDIO_DataLength;
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
MOVW	R1, #11304
MOVT	R1, #16385
STR	R2, [R1, #0]
;stm32f4xx_sdio.c,525 :: 		tmpreg &= DCTRL_CLEAR_MASK;
MOVW	R4, #11308
MOVT	R4, #16385
LDR	R2, [R4, #0]
MVN	R1, #247
AND	R3, R2, R1, LSL #0
;stm32f4xx_sdio.c,530 :: 		tmpreg |= (uint32_t)SDIO_DataInitStruct->SDIO_DataBlockSize | SDIO_DataInitStruct->SDIO_TransferDir
ADDW	R1, R0, #8
LDR	R2, [R1, #0]
ADDW	R1, R0, #12
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_sdio.c,531 :: 		| SDIO_DataInitStruct->SDIO_TransferMode | SDIO_DataInitStruct->SDIO_DPSM;
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
ORRS	R2, R1
ADDW	R1, R0, #20
; SDIO_DataInitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
ORR	R1, R3, R1, LSL #0
;stm32f4xx_sdio.c,534 :: 		SDIO->DCTRL = tmpreg;
STR	R1, [R4, #0]
;stm32f4xx_sdio.c,535 :: 		}
L_end_SDIO_DataConfig:
BX	LR
; end of _SDIO_DataConfig
_SDIO_DataStructInit:
;stm32f4xx_sdio.c,543 :: 		void SDIO_DataStructInit(SDIO_DataInitTypeDef* SDIO_DataInitStruct)
; SDIO_DataInitStruct start address is: 0 (R0)
; SDIO_DataInitStruct end address is: 0 (R0)
; SDIO_DataInitStruct start address is: 0 (R0)
;stm32f4xx_sdio.c,546 :: 		SDIO_DataInitStruct->SDIO_DataTimeOut = 0xFFFFFFFF;
MOV	R1, #-1
STR	R1, [R0, #0]
;stm32f4xx_sdio.c,547 :: 		SDIO_DataInitStruct->SDIO_DataLength = 0x00;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,548 :: 		SDIO_DataInitStruct->SDIO_DataBlockSize = SDIO_DataBlockSize_1b;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,549 :: 		SDIO_DataInitStruct->SDIO_TransferDir = SDIO_TransferDir_ToCard;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,550 :: 		SDIO_DataInitStruct->SDIO_TransferMode = SDIO_TransferMode_Block;
ADDW	R2, R0, #16
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,551 :: 		SDIO_DataInitStruct->SDIO_DPSM = SDIO_DPSM_Disable;
ADDW	R2, R0, #20
; SDIO_DataInitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_sdio.c,552 :: 		}
L_end_SDIO_DataStructInit:
BX	LR
; end of _SDIO_DataStructInit
_SDIO_GetDataCounter:
;stm32f4xx_sdio.c,559 :: 		uint32_t SDIO_GetDataCounter(void)
;stm32f4xx_sdio.c,561 :: 		return SDIO->DCOUNT;
MOVW	R0, #11312
MOVT	R0, #16385
LDR	R0, [R0, #0]
;stm32f4xx_sdio.c,562 :: 		}
L_end_SDIO_GetDataCounter:
BX	LR
; end of _SDIO_GetDataCounter
_SDIO_ReadData:
;stm32f4xx_sdio.c,569 :: 		uint32_t SDIO_ReadData(void)
;stm32f4xx_sdio.c,571 :: 		return SDIO->FIFO;
MOVW	R0, #11392
MOVT	R0, #16385
LDR	R0, [R0, #0]
;stm32f4xx_sdio.c,572 :: 		}
L_end_SDIO_ReadData:
BX	LR
; end of _SDIO_ReadData
_SDIO_WriteData:
;stm32f4xx_sdio.c,579 :: 		void SDIO_WriteData(uint32_t Data)
; Data start address is: 0 (R0)
; Data end address is: 0 (R0)
; Data start address is: 0 (R0)
;stm32f4xx_sdio.c,581 :: 		SDIO->FIFO = Data;
MOVW	R1, #11392
MOVT	R1, #16385
STR	R0, [R1, #0]
; Data end address is: 0 (R0)
;stm32f4xx_sdio.c,582 :: 		}
L_end_SDIO_WriteData:
BX	LR
; end of _SDIO_WriteData
_SDIO_GetFIFOCount:
;stm32f4xx_sdio.c,589 :: 		uint32_t SDIO_GetFIFOCount(void)
;stm32f4xx_sdio.c,591 :: 		return SDIO->FIFOCNT;
MOVW	R0, #11336
MOVT	R0, #16385
LDR	R0, [R0, #0]
;stm32f4xx_sdio.c,592 :: 		}
L_end_SDIO_GetFIFOCount:
BX	LR
; end of _SDIO_GetFIFOCount
_SDIO_StartSDIOReadWait:
;stm32f4xx_sdio.c,618 :: 		void SDIO_StartSDIOReadWait(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_sdio.c,623 :: 		*(__IO uint32_t *) DCTRL_RWSTART_BB = (uint32_t) NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1109755296
MOVT	R1, 16933
STR	R2, [R1, #0]
;stm32f4xx_sdio.c,624 :: 		}
L_end_SDIO_StartSDIOReadWait:
BX	LR
; end of _SDIO_StartSDIOReadWait
_SDIO_StopSDIOReadWait:
;stm32f4xx_sdio.c,632 :: 		void SDIO_StopSDIOReadWait(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_sdio.c,637 :: 		*(__IO uint32_t *) DCTRL_RWSTOP_BB = (uint32_t) NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1109755300
MOVT	R1, 16933
STR	R2, [R1, #0]
;stm32f4xx_sdio.c,638 :: 		}
L_end_SDIO_StopSDIOReadWait:
BX	LR
; end of _SDIO_StopSDIOReadWait
_SDIO_SetSDIOReadWaitMode:
;stm32f4xx_sdio.c,648 :: 		void SDIO_SetSDIOReadWaitMode(uint32_t SDIO_ReadWaitMode)
; SDIO_ReadWaitMode start address is: 0 (R0)
; SDIO_ReadWaitMode end address is: 0 (R0)
; SDIO_ReadWaitMode start address is: 0 (R0)
;stm32f4xx_sdio.c,653 :: 		*(__IO uint32_t *) DCTRL_RWMOD_BB = SDIO_ReadWaitMode;
MOVW	R1, 1109755304
MOVT	R1, 16933
STR	R0, [R1, #0]
; SDIO_ReadWaitMode end address is: 0 (R0)
;stm32f4xx_sdio.c,654 :: 		}
L_end_SDIO_SetSDIOReadWaitMode:
BX	LR
; end of _SDIO_SetSDIOReadWaitMode
_SDIO_SetSDIOOperation:
;stm32f4xx_sdio.c,662 :: 		void SDIO_SetSDIOOperation(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_sdio.c,667 :: 		*(__IO uint32_t *) DCTRL_SDIOEN_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1109755308
MOVT	R1, 16933
STR	R2, [R1, #0]
;stm32f4xx_sdio.c,668 :: 		}
L_end_SDIO_SetSDIOOperation:
BX	LR
; end of _SDIO_SetSDIOOperation
_SDIO_SendSDIOSuspendCmd:
;stm32f4xx_sdio.c,676 :: 		void SDIO_SendSDIOSuspendCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_sdio.c,681 :: 		*(__IO uint32_t *) CMD_SDIOSUSPEND_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1109754284
MOVT	R1, 16933
STR	R2, [R1, #0]
;stm32f4xx_sdio.c,682 :: 		}
L_end_SDIO_SendSDIOSuspendCmd:
BX	LR
; end of _SDIO_SendSDIOSuspendCmd
_SDIO_CommandCompletionCmd:
;stm32f4xx_sdio.c,708 :: 		void SDIO_CommandCompletionCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_sdio.c,713 :: 		*(__IO uint32_t *) CMD_ENCMDCOMPL_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1109754288
MOVT	R1, 16933
STR	R2, [R1, #0]
;stm32f4xx_sdio.c,714 :: 		}
L_end_SDIO_CommandCompletionCmd:
BX	LR
; end of _SDIO_CommandCompletionCmd
_SDIO_CEATAITCmd:
;stm32f4xx_sdio.c,722 :: 		void SDIO_CEATAITCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_sdio.c,727 :: 		*(__IO uint32_t *) CMD_NIEN_BB = (uint32_t)((~((uint32_t)NewState)) & ((uint32_t)0x1));
UXTB	R1, R0
; NewState end address is: 0 (R0)
MVN	R1, R1
AND	R2, R1, #1
MOVW	R1, 1109754292
MOVT	R1, 16933
STR	R2, [R1, #0]
;stm32f4xx_sdio.c,728 :: 		}
L_end_SDIO_CEATAITCmd:
BX	LR
; end of _SDIO_CEATAITCmd
_SDIO_SendCEATACmd:
;stm32f4xx_sdio.c,736 :: 		void SDIO_SendCEATACmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_sdio.c,741 :: 		*(__IO uint32_t *) CMD_ATACMD_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1109754296
MOVT	R1, 16933
STR	R2, [R1, #0]
;stm32f4xx_sdio.c,742 :: 		}
L_end_SDIO_SendCEATACmd:
BX	LR
; end of _SDIO_SendCEATACmd
_SDIO_DMACmd:
;stm32f4xx_sdio.c,768 :: 		void SDIO_DMACmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_sdio.c,773 :: 		*(__IO uint32_t *) DCTRL_DMAEN_BB = (uint32_t)NewState;
UXTB	R2, R0
; NewState end address is: 0 (R0)
MOVW	R1, 1109755276
MOVT	R1, 16933
STR	R2, [R1, #0]
;stm32f4xx_sdio.c,774 :: 		}
L_end_SDIO_DMACmd:
BX	LR
; end of _SDIO_DMACmd
_SDIO_ITConfig:
;stm32f4xx_sdio.c,826 :: 		void SDIO_ITConfig(uint32_t SDIO_IT, FunctionalState NewState)
; NewState start address is: 4 (R1)
; SDIO_IT start address is: 0 (R0)
; NewState end address is: 4 (R1)
; SDIO_IT end address is: 0 (R0)
; SDIO_IT start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_sdio.c,832 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_SDIO_ITConfig27
; NewState end address is: 4 (R1)
;stm32f4xx_sdio.c,835 :: 		SDIO->MASK |= SDIO_IT;
MOVW	R3, #11324
MOVT	R3, #16385
LDR	R2, [R3, #0]
ORRS	R2, R0
; SDIO_IT end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_sdio.c,836 :: 		}
IT	AL
BAL	L_SDIO_ITConfig28
L_SDIO_ITConfig27:
;stm32f4xx_sdio.c,840 :: 		SDIO->MASK &= ~SDIO_IT;
; SDIO_IT start address is: 0 (R0)
MVN	R4, R0
; SDIO_IT end address is: 0 (R0)
MOVW	R3, #11324
MOVT	R3, #16385
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_sdio.c,841 :: 		}
L_SDIO_ITConfig28:
;stm32f4xx_sdio.c,842 :: 		}
L_end_SDIO_ITConfig:
BX	LR
; end of _SDIO_ITConfig
_SDIO_GetFlagStatus:
;stm32f4xx_sdio.c,874 :: 		FlagStatus SDIO_GetFlagStatus(uint32_t SDIO_FLAG)
; SDIO_FLAG start address is: 0 (R0)
; SDIO_FLAG end address is: 0 (R0)
; SDIO_FLAG start address is: 0 (R0)
;stm32f4xx_sdio.c,876 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_sdio.c,881 :: 		if ((SDIO->STA & SDIO_FLAG) != (uint32_t)RESET)
MOVW	R1, #11316
MOVT	R1, #16385
LDR	R1, [R1, #0]
ANDS	R1, R0
; SDIO_FLAG end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_SDIO_GetFlagStatus29
;stm32f4xx_sdio.c,883 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_sdio.c,884 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_SDIO_GetFlagStatus30
L_SDIO_GetFlagStatus29:
;stm32f4xx_sdio.c,887 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_sdio.c,888 :: 		}
L_SDIO_GetFlagStatus30:
;stm32f4xx_sdio.c,889 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_sdio.c,890 :: 		}
L_end_SDIO_GetFlagStatus:
BX	LR
; end of _SDIO_GetFlagStatus
_SDIO_ClearFlag:
;stm32f4xx_sdio.c,911 :: 		void SDIO_ClearFlag(uint32_t SDIO_FLAG)
; SDIO_FLAG start address is: 0 (R0)
; SDIO_FLAG end address is: 0 (R0)
; SDIO_FLAG start address is: 0 (R0)
;stm32f4xx_sdio.c,916 :: 		SDIO->ICR = SDIO_FLAG;
MOVW	R1, #11320
MOVT	R1, #16385
STR	R0, [R1, #0]
; SDIO_FLAG end address is: 0 (R0)
;stm32f4xx_sdio.c,917 :: 		}
L_end_SDIO_ClearFlag:
BX	LR
; end of _SDIO_ClearFlag
_SDIO_GetITStatus:
;stm32f4xx_sdio.c,950 :: 		ITStatus SDIO_GetITStatus(uint32_t SDIO_IT)
; SDIO_IT start address is: 0 (R0)
; SDIO_IT end address is: 0 (R0)
; SDIO_IT start address is: 0 (R0)
;stm32f4xx_sdio.c,952 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_sdio.c,956 :: 		if ((SDIO->STA & SDIO_IT) != (uint32_t)RESET)
MOVW	R1, #11316
MOVT	R1, #16385
LDR	R1, [R1, #0]
ANDS	R1, R0
; SDIO_IT end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_SDIO_GetITStatus31
;stm32f4xx_sdio.c,958 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_sdio.c,959 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_SDIO_GetITStatus32
L_SDIO_GetITStatus31:
;stm32f4xx_sdio.c,962 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_sdio.c,963 :: 		}
L_SDIO_GetITStatus32:
;stm32f4xx_sdio.c,964 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_sdio.c,965 :: 		}
L_end_SDIO_GetITStatus:
BX	LR
; end of _SDIO_GetITStatus
_SDIO_ClearITPendingBit:
;stm32f4xx_sdio.c,986 :: 		void SDIO_ClearITPendingBit(uint32_t SDIO_IT)
; SDIO_IT start address is: 0 (R0)
; SDIO_IT end address is: 0 (R0)
; SDIO_IT start address is: 0 (R0)
;stm32f4xx_sdio.c,991 :: 		SDIO->ICR = SDIO_IT;
MOVW	R1, #11320
MOVT	R1, #16385
STR	R0, [R1, #0]
; SDIO_IT end address is: 0 (R0)
;stm32f4xx_sdio.c,992 :: 		}
L_end_SDIO_ClearITPendingBit:
BX	LR
; end of _SDIO_ClearITPendingBit
