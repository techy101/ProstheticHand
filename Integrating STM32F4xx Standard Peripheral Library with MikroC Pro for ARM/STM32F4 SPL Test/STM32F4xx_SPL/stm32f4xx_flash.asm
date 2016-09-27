stm32f4xx_flash___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_flash___DSB
stm32f4xx_flash___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_flash___WFI
stm32f4xx_flash___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_flash___WFE
stm32f4xx_flash___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_flash___REV
stm32f4xx_flash_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_flash_NVIC_SetPriorityGrouping
stm32f4xx_flash_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_flash_NVIC_GetPriorityGrouping
stm32f4xx_flash_NVIC_EnableIRQ:
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
; end of stm32f4xx_flash_NVIC_EnableIRQ
stm32f4xx_flash_NVIC_DisableIRQ:
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
; end of stm32f4xx_flash_NVIC_DisableIRQ
stm32f4xx_flash_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_flash_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_flash_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_flash_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_flash_NVIC_GetPendingIRQ1
L_stm32f4xx_flash_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_flash_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_flash_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_flash_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_flash_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_flash_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_flash_NVIC_GetPendingIRQ
stm32f4xx_flash_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_flash_NVIC_SetPendingIRQ
stm32f4xx_flash_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_flash_NVIC_ClearPendingIRQ
stm32f4xx_flash_NVIC_GetActive:
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
BEQ	L_stm32f4xx_flash_NVIC_GetActive2
; ?FLOC__stm32f4xx_flash_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_flash_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_flash_NVIC_GetActive3
L_stm32f4xx_flash_NVIC_GetActive2:
; ?FLOC__stm32f4xx_flash_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_flash_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_flash_NVIC_GetActive3:
; ?FLOC__stm32f4xx_flash_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_flash_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_flash_NVIC_GetActive
stm32f4xx_flash_NVIC_SetPriority:
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
BGE	L_stm32f4xx_flash_NVIC_SetPriority4
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
BAL	L_stm32f4xx_flash_NVIC_SetPriority5
L_stm32f4xx_flash_NVIC_SetPriority4:
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
L_stm32f4xx_flash_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_flash_NVIC_SetPriority
stm32f4xx_flash_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_flash_NVIC_GetPriority6
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
L_stm32f4xx_flash_NVIC_GetPriority6:
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
; end of stm32f4xx_flash_NVIC_GetPriority
stm32f4xx_flash_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_flash_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_flash_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_flash_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_flash_NVIC_EncodePriority9
L_stm32f4xx_flash_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_flash_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_flash_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_flash_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_flash_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_flash_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_flash_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_flash_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_flash_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_flash_NVIC_EncodePriority11
L_stm32f4xx_flash_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_flash_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_flash_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_flash_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_flash_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_flash_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_flash_NVIC_EncodePriority
stm32f4xx_flash_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_flash_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_flash_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_flash_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_flash_NVIC_DecodePriority13
L_stm32f4xx_flash_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_flash_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_flash_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_flash_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_flash_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_flash_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_flash_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_flash_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_flash_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_flash_NVIC_DecodePriority15
L_stm32f4xx_flash_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_flash_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_flash_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_flash_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_flash_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_flash_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_flash_NVIC_DecodePriority
stm32f4xx_flash_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_flash___DSB+0
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
BL	stm32f4xx_flash___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_flash_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_flash_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_flash_NVIC_SystemReset
stm32f4xx_flash_SysTick_Config:
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
BLS	L_stm32f4xx_flash_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_flash_SysTick_Config18:
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
BL	stm32f4xx_flash_NVIC_SetPriority+0
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
; end of stm32f4xx_flash_SysTick_Config
stm32f4xx_flash_ITM_SendChar:
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
BEQ	L_stm32f4xx_flash_ITM_SendChar78
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_flash_ITM_SendChar79
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_flash_ITM_SendChar80
L_stm32f4xx_flash_ITM_SendChar74:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_flash_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_flash_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_flash_ITM_SendChar22
L_stm32f4xx_flash_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_flash_ITM_SendChar77
L_stm32f4xx_flash_ITM_SendChar78:
L_stm32f4xx_flash_ITM_SendChar77:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_flash_ITM_SendChar76
L_stm32f4xx_flash_ITM_SendChar79:
L_stm32f4xx_flash_ITM_SendChar76:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_flash_ITM_SendChar75
L_stm32f4xx_flash_ITM_SendChar80:
L_stm32f4xx_flash_ITM_SendChar75:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_flash_ITM_SendChar
stm32f4xx_flash_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_flash_ITM_ReceiveChar24
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
L_stm32f4xx_flash_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_flash_ITM_ReceiveChar
stm32f4xx_flash_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_flash_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_flash_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_flash_ITM_CheckChar
_FLASH_SetLatency:
;stm32f4xx_flash.c,172 :: 		void FLASH_SetLatency(uint32_t FLASH_Latency)
; FLASH_Latency start address is: 0 (R0)
; FLASH_Latency end address is: 0 (R0)
; FLASH_Latency start address is: 0 (R0)
;stm32f4xx_flash.c,178 :: 		*(__IO uint8_t *)ACR_BYTE0_ADDRESS = (uint8_t)FLASH_Latency;
UXTB	R2, R0
; FLASH_Latency end address is: 0 (R0)
MOVW	R1, 1073888256
MOVT	R1, 16386
STRB	R2, [R1, #0]
;stm32f4xx_flash.c,179 :: 		}
L_end_FLASH_SetLatency:
BX	LR
; end of _FLASH_SetLatency
_FLASH_PrefetchBufferCmd:
;stm32f4xx_flash.c,187 :: 		void FLASH_PrefetchBufferCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_flash.c,193 :: 		if(NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_PrefetchBufferCmd27
; NewState end address is: 0 (R0)
;stm32f4xx_flash.c,195 :: 		FLASH->ACR |= FLASH_ACR_PRFTEN;
MOVW	R2, #15360
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #256
STR	R1, [R2, #0]
;stm32f4xx_flash.c,196 :: 		}
IT	AL
BAL	L_FLASH_PrefetchBufferCmd28
L_FLASH_PrefetchBufferCmd27:
;stm32f4xx_flash.c,199 :: 		FLASH->ACR &= (~FLASH_ACR_PRFTEN);
MOVW	R3, #15360
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #256
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_flash.c,200 :: 		}
L_FLASH_PrefetchBufferCmd28:
;stm32f4xx_flash.c,201 :: 		}
L_end_FLASH_PrefetchBufferCmd:
BX	LR
; end of _FLASH_PrefetchBufferCmd
_FLASH_InstructionCacheCmd:
;stm32f4xx_flash.c,209 :: 		void FLASH_InstructionCacheCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_flash.c,214 :: 		if(NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_InstructionCacheCmd29
; NewState end address is: 0 (R0)
;stm32f4xx_flash.c,216 :: 		FLASH->ACR |= FLASH_ACR_ICEN;
MOVW	R2, #15360
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #512
STR	R1, [R2, #0]
;stm32f4xx_flash.c,217 :: 		}
IT	AL
BAL	L_FLASH_InstructionCacheCmd30
L_FLASH_InstructionCacheCmd29:
;stm32f4xx_flash.c,220 :: 		FLASH->ACR &= (~FLASH_ACR_ICEN);
MOVW	R3, #15360
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #512
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_flash.c,221 :: 		}
L_FLASH_InstructionCacheCmd30:
;stm32f4xx_flash.c,222 :: 		}
L_end_FLASH_InstructionCacheCmd:
BX	LR
; end of _FLASH_InstructionCacheCmd
_FLASH_DataCacheCmd:
;stm32f4xx_flash.c,230 :: 		void FLASH_DataCacheCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_flash.c,235 :: 		if(NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_DataCacheCmd31
; NewState end address is: 0 (R0)
;stm32f4xx_flash.c,237 :: 		FLASH->ACR |= FLASH_ACR_DCEN;
MOVW	R2, #15360
MOVT	R2, #16386
LDR	R1, [R2, #0]
ORR	R1, R1, #1024
STR	R1, [R2, #0]
;stm32f4xx_flash.c,238 :: 		}
IT	AL
BAL	L_FLASH_DataCacheCmd32
L_FLASH_DataCacheCmd31:
;stm32f4xx_flash.c,241 :: 		FLASH->ACR &= (~FLASH_ACR_DCEN);
MOVW	R3, #15360
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #1024
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_flash.c,242 :: 		}
L_FLASH_DataCacheCmd32:
;stm32f4xx_flash.c,243 :: 		}
L_end_FLASH_DataCacheCmd:
BX	LR
; end of _FLASH_DataCacheCmd
_FLASH_InstructionCacheReset:
;stm32f4xx_flash.c,251 :: 		void FLASH_InstructionCacheReset(void)
;stm32f4xx_flash.c,253 :: 		FLASH->ACR |= FLASH_ACR_ICRST;
MOVW	R1, #15360
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #2048
STR	R0, [R1, #0]
;stm32f4xx_flash.c,254 :: 		}
L_end_FLASH_InstructionCacheReset:
BX	LR
; end of _FLASH_InstructionCacheReset
_FLASH_DataCacheReset:
;stm32f4xx_flash.c,262 :: 		void FLASH_DataCacheReset(void)
;stm32f4xx_flash.c,264 :: 		FLASH->ACR |= FLASH_ACR_DCRST;
MOVW	R1, #15360
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #4096
STR	R0, [R1, #0]
;stm32f4xx_flash.c,265 :: 		}
L_end_FLASH_DataCacheReset:
BX	LR
; end of _FLASH_DataCacheReset
_FLASH_Unlock:
;stm32f4xx_flash.c,306 :: 		void FLASH_Unlock(void)
;stm32f4xx_flash.c,308 :: 		if((FLASH->CR & FLASH_CR_LOCK) != RESET)
MOVW	R0, #15376
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #-2147483648
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_Unlock33
;stm32f4xx_flash.c,311 :: 		FLASH->KEYR = FLASH_KEY1;
MOVW	R0, #291
MOVT	R0, #17767
MOVW	R1, #15364
MOVT	R1, #16386
STR	R0, [R1, #0]
;stm32f4xx_flash.c,312 :: 		FLASH->KEYR = FLASH_KEY2;
MOVW	R0, #35243
MOVT	R0, #52719
STR	R0, [R1, #0]
;stm32f4xx_flash.c,313 :: 		}
L_FLASH_Unlock33:
;stm32f4xx_flash.c,314 :: 		}
L_end_FLASH_Unlock:
BX	LR
; end of _FLASH_Unlock
_FLASH_Lock:
;stm32f4xx_flash.c,321 :: 		void FLASH_Lock(void)
;stm32f4xx_flash.c,324 :: 		FLASH->CR |= FLASH_CR_LOCK;
MOVW	R1, #15376
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #-2147483648
STR	R0, [R1, #0]
;stm32f4xx_flash.c,325 :: 		}
L_end_FLASH_Lock:
BX	LR
; end of _FLASH_Lock
_FLASH_EraseSector:
;stm32f4xx_flash.c,347 :: 		FLASH_Status FLASH_EraseSector(uint32_t FLASH_Sector, uint8_t VoltageRange)
; VoltageRange start address is: 4 (R1)
; FLASH_Sector start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R5, R0
; VoltageRange end address is: 4 (R1)
; FLASH_Sector end address is: 0 (R0)
; FLASH_Sector start address is: 20 (R5)
; VoltageRange start address is: 4 (R1)
;stm32f4xx_flash.c,349 :: 		uint32_t tmp_psize = 0x0;
;stm32f4xx_flash.c,350 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f4xx_flash.c,356 :: 		if(VoltageRange == VoltageRange_1)
CMP	R1, #0
IT	NE
BNE	L_FLASH_EraseSector34
; VoltageRange end address is: 4 (R1)
;stm32f4xx_flash.c,358 :: 		tmp_psize = FLASH_PSIZE_BYTE;
; tmp_psize start address is: 24 (R6)
MOV	R6, #0
;stm32f4xx_flash.c,359 :: 		}
; tmp_psize end address is: 24 (R6)
IT	AL
BAL	L_FLASH_EraseSector35
L_FLASH_EraseSector34:
;stm32f4xx_flash.c,360 :: 		else if(VoltageRange == VoltageRange_2)
; VoltageRange start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_FLASH_EraseSector36
; VoltageRange end address is: 4 (R1)
;stm32f4xx_flash.c,362 :: 		tmp_psize = FLASH_PSIZE_HALF_WORD;
; tmp_psize start address is: 0 (R0)
MOV	R0, #256
;stm32f4xx_flash.c,363 :: 		}
MOV	R6, R0
; tmp_psize end address is: 0 (R0)
IT	AL
BAL	L_FLASH_EraseSector37
L_FLASH_EraseSector36:
;stm32f4xx_flash.c,364 :: 		else if(VoltageRange == VoltageRange_3)
; VoltageRange start address is: 4 (R1)
CMP	R1, #2
IT	NE
BNE	L_FLASH_EraseSector38
; VoltageRange end address is: 4 (R1)
;stm32f4xx_flash.c,366 :: 		tmp_psize = FLASH_PSIZE_WORD;
; tmp_psize start address is: 0 (R0)
MOV	R0, #512
;stm32f4xx_flash.c,367 :: 		}
; tmp_psize end address is: 0 (R0)
IT	AL
BAL	L_FLASH_EraseSector39
L_FLASH_EraseSector38:
;stm32f4xx_flash.c,370 :: 		tmp_psize = FLASH_PSIZE_DOUBLE_WORD;
; tmp_psize start address is: 0 (R0)
MOV	R0, #768
; tmp_psize end address is: 0 (R0)
;stm32f4xx_flash.c,371 :: 		}
L_FLASH_EraseSector39:
; tmp_psize start address is: 0 (R0)
MOV	R6, R0
; tmp_psize end address is: 0 (R0)
L_FLASH_EraseSector37:
; tmp_psize start address is: 24 (R6)
; tmp_psize end address is: 24 (R6)
L_FLASH_EraseSector35:
;stm32f4xx_flash.c,373 :: 		status = FLASH_WaitForLastOperation();
; tmp_psize start address is: 24 (R6)
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f4xx_flash.c,375 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #8
IT	NE
BNE	L__FLASH_EraseSector81
; status end address is: 4 (R1)
;stm32f4xx_flash.c,378 :: 		FLASH->CR &= CR_PSIZE_MASK;
MOVW	R4, #15376
MOVT	R4, #16386
STR	R4, [SP, #4]
LDR	R3, [R4, #0]
MVN	R2, #768
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_flash.c,379 :: 		FLASH->CR |= tmp_psize;
ORR	R3, R2, R6, LSL #0
; tmp_psize end address is: 24 (R6)
STR	R3, [R4, #0]
;stm32f4xx_flash.c,380 :: 		FLASH->CR &= SECTOR_MASK;
MVN	R2, #248
ANDS	R3, R2
STR	R3, [R4, #0]
;stm32f4xx_flash.c,381 :: 		FLASH->CR |= FLASH_CR_SER | FLASH_Sector;
ORR	R2, R5, #2
; FLASH_Sector end address is: 20 (R5)
ORR	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_flash.c,382 :: 		FLASH->CR |= FLASH_CR_STRT;
ORR	R2, R2, #65536
STR	R2, [R4, #0]
;stm32f4xx_flash.c,385 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
; status start address is: 0 (R0)
;stm32f4xx_flash.c,388 :: 		FLASH->CR &= (~FLASH_CR_SER);
MOVW	R4, #15376
MOVT	R4, #16386
LDR	R3, [R4, #0]
MVN	R2, #2
ANDS	R3, R2
STR	R3, [R4, #0]
;stm32f4xx_flash.c,389 :: 		FLASH->CR &= SECTOR_MASK;
MVN	R2, #248
ANDS	R3, R2
LDR	R2, [SP, #4]
STR	R3, [R2, #0]
; status end address is: 0 (R0)
;stm32f4xx_flash.c,390 :: 		}
IT	AL
BAL	L_FLASH_EraseSector40
L__FLASH_EraseSector81:
;stm32f4xx_flash.c,375 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f4xx_flash.c,390 :: 		}
L_FLASH_EraseSector40:
;stm32f4xx_flash.c,392 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f4xx_flash.c,393 :: 		}
L_end_FLASH_EraseSector:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _FLASH_EraseSector
_FLASH_EraseAllSectors:
;stm32f4xx_flash.c,412 :: 		FLASH_Status FLASH_EraseAllSectors(uint8_t VoltageRange)
; VoltageRange start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R2, R0
; VoltageRange end address is: 0 (R0)
; VoltageRange start address is: 8 (R2)
;stm32f4xx_flash.c,414 :: 		uint32_t tmp_psize = 0x0;
;stm32f4xx_flash.c,415 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f4xx_flash.c,418 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
; status start address is: 0 (R0)
;stm32f4xx_flash.c,421 :: 		if(VoltageRange == VoltageRange_1)
CMP	R2, #0
IT	NE
BNE	L_FLASH_EraseAllSectors41
; VoltageRange end address is: 8 (R2)
;stm32f4xx_flash.c,423 :: 		tmp_psize = FLASH_PSIZE_BYTE;
; tmp_psize start address is: 16 (R4)
MOV	R4, #0
;stm32f4xx_flash.c,424 :: 		}
; tmp_psize end address is: 16 (R4)
IT	AL
BAL	L_FLASH_EraseAllSectors42
L_FLASH_EraseAllSectors41:
;stm32f4xx_flash.c,425 :: 		else if(VoltageRange == VoltageRange_2)
; VoltageRange start address is: 8 (R2)
CMP	R2, #1
IT	NE
BNE	L_FLASH_EraseAllSectors43
; VoltageRange end address is: 8 (R2)
;stm32f4xx_flash.c,427 :: 		tmp_psize = FLASH_PSIZE_HALF_WORD;
; tmp_psize start address is: 4 (R1)
MOV	R1, #256
;stm32f4xx_flash.c,428 :: 		}
MOV	R4, R1
; tmp_psize end address is: 4 (R1)
IT	AL
BAL	L_FLASH_EraseAllSectors44
L_FLASH_EraseAllSectors43:
;stm32f4xx_flash.c,429 :: 		else if(VoltageRange == VoltageRange_3)
; VoltageRange start address is: 8 (R2)
CMP	R2, #2
IT	NE
BNE	L_FLASH_EraseAllSectors45
; VoltageRange end address is: 8 (R2)
;stm32f4xx_flash.c,431 :: 		tmp_psize = FLASH_PSIZE_WORD;
; tmp_psize start address is: 4 (R1)
MOV	R1, #512
;stm32f4xx_flash.c,432 :: 		}
; tmp_psize end address is: 4 (R1)
IT	AL
BAL	L_FLASH_EraseAllSectors46
L_FLASH_EraseAllSectors45:
;stm32f4xx_flash.c,435 :: 		tmp_psize = FLASH_PSIZE_DOUBLE_WORD;
; tmp_psize start address is: 4 (R1)
MOV	R1, #768
; tmp_psize end address is: 4 (R1)
;stm32f4xx_flash.c,436 :: 		}
L_FLASH_EraseAllSectors46:
; tmp_psize start address is: 4 (R1)
MOV	R4, R1
; tmp_psize end address is: 4 (R1)
L_FLASH_EraseAllSectors44:
; tmp_psize start address is: 16 (R4)
; tmp_psize end address is: 16 (R4)
L_FLASH_EraseAllSectors42:
;stm32f4xx_flash.c,437 :: 		if(status == FLASH_COMPLETE)
; tmp_psize start address is: 16 (R4)
CMP	R0, #8
IT	NE
BNE	L__FLASH_EraseAllSectors82
; status end address is: 0 (R0)
;stm32f4xx_flash.c,440 :: 		FLASH->CR &= CR_PSIZE_MASK;
MOVW	R3, #15376
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #768
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_flash.c,441 :: 		FLASH->CR |= tmp_psize;
ORRS	R1, R4
; tmp_psize end address is: 16 (R4)
STR	R1, [R3, #0]
;stm32f4xx_flash.c,442 :: 		FLASH->CR |= FLASH_CR_MER;
ORR	R1, R1, #4
STR	R1, [R3, #0]
;stm32f4xx_flash.c,443 :: 		FLASH->CR |= FLASH_CR_STRT;
ORR	R1, R1, #65536
STR	R1, [R3, #0]
;stm32f4xx_flash.c,446 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
; status start address is: 0 (R0)
;stm32f4xx_flash.c,449 :: 		FLASH->CR &= (~FLASH_CR_MER);
MOVW	R3, #15376
MOVT	R3, #16386
LDR	R2, [R3, #0]
MVN	R1, #4
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
; status end address is: 0 (R0)
;stm32f4xx_flash.c,451 :: 		}
IT	AL
BAL	L_FLASH_EraseAllSectors47
L__FLASH_EraseAllSectors82:
;stm32f4xx_flash.c,437 :: 		if(status == FLASH_COMPLETE)
;stm32f4xx_flash.c,451 :: 		}
L_FLASH_EraseAllSectors47:
;stm32f4xx_flash.c,453 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f4xx_flash.c,454 :: 		}
L_end_FLASH_EraseAllSectors:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_EraseAllSectors
_FLASH_ProgramDoubleWord:
;stm32f4xx_flash.c,465 :: 		FLASH_Status FLASH_ProgramDoubleWord(uint32_t Address, uint64_t Data)
; Data start address is: 4 (R1)
; Address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R6, R1
MOV	R7, R2
MOV	R2, R0
; Data end address is: 4 (R1)
; Address end address is: 0 (R0)
; Address start address is: 8 (R2)
; Data start address is: 24 (R6)
;stm32f4xx_flash.c,467 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f4xx_flash.c,473 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f4xx_flash.c,475 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #8
IT	NE
BNE	L__FLASH_ProgramDoubleWord83
; status end address is: 4 (R1)
;stm32f4xx_flash.c,478 :: 		FLASH->CR &= CR_PSIZE_MASK;
MOVW	R5, #15376
MOVT	R5, #16386
LDR	R4, [R5, #0]
MVN	R3, #768
AND	R3, R4, R3, LSL #0
STR	R3, [R5, #0]
;stm32f4xx_flash.c,479 :: 		FLASH->CR |= FLASH_PSIZE_DOUBLE_WORD;
ORR	R3, R3, #768
STR	R3, [R5, #0]
;stm32f4xx_flash.c,480 :: 		FLASH->CR |= FLASH_CR_PG;
ORR	R3, R3, #1
STR	R3, [R5, #0]
;stm32f4xx_flash.c,482 :: 		*(__IO uint64_t*)Address = Data;
STRD	R6, R7, [R2, #0]
; Address end address is: 8 (R2)
; Data end address is: 24 (R6)
;stm32f4xx_flash.c,485 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
; status start address is: 0 (R0)
;stm32f4xx_flash.c,488 :: 		FLASH->CR &= (~FLASH_CR_PG);
MOVW	R5, #15376
MOVT	R5, #16386
LDR	R4, [R5, #0]
MVN	R3, #1
AND	R3, R4, R3, LSL #0
STR	R3, [R5, #0]
; status end address is: 0 (R0)
;stm32f4xx_flash.c,489 :: 		}
IT	AL
BAL	L_FLASH_ProgramDoubleWord48
L__FLASH_ProgramDoubleWord83:
;stm32f4xx_flash.c,475 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f4xx_flash.c,489 :: 		}
L_FLASH_ProgramDoubleWord48:
;stm32f4xx_flash.c,491 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f4xx_flash.c,492 :: 		}
L_end_FLASH_ProgramDoubleWord:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_ProgramDoubleWord
_FLASH_ProgramWord:
;stm32f4xx_flash.c,503 :: 		FLASH_Status FLASH_ProgramWord(uint32_t Address, uint32_t Data)
; Data start address is: 4 (R1)
; Address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
MOV	R6, R1
; Data end address is: 4 (R1)
; Address end address is: 0 (R0)
; Address start address is: 20 (R5)
; Data start address is: 24 (R6)
;stm32f4xx_flash.c,505 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f4xx_flash.c,511 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f4xx_flash.c,513 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #8
IT	NE
BNE	L__FLASH_ProgramWord84
; status end address is: 4 (R1)
;stm32f4xx_flash.c,516 :: 		FLASH->CR &= CR_PSIZE_MASK;
MOVW	R4, #15376
MOVT	R4, #16386
LDR	R3, [R4, #0]
MVN	R2, #768
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_flash.c,517 :: 		FLASH->CR |= FLASH_PSIZE_WORD;
ORR	R2, R2, #512
STR	R2, [R4, #0]
;stm32f4xx_flash.c,518 :: 		FLASH->CR |= FLASH_CR_PG;
ORR	R2, R2, #1
STR	R2, [R4, #0]
;stm32f4xx_flash.c,520 :: 		*(__IO uint32_t*)Address = Data;
STR	R6, [R5, #0]
; Address end address is: 20 (R5)
; Data end address is: 24 (R6)
;stm32f4xx_flash.c,523 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
; status start address is: 0 (R0)
;stm32f4xx_flash.c,526 :: 		FLASH->CR &= (~FLASH_CR_PG);
MOVW	R4, #15376
MOVT	R4, #16386
LDR	R3, [R4, #0]
MVN	R2, #1
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
; status end address is: 0 (R0)
;stm32f4xx_flash.c,527 :: 		}
IT	AL
BAL	L_FLASH_ProgramWord49
L__FLASH_ProgramWord84:
;stm32f4xx_flash.c,513 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f4xx_flash.c,527 :: 		}
L_FLASH_ProgramWord49:
;stm32f4xx_flash.c,529 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f4xx_flash.c,530 :: 		}
L_end_FLASH_ProgramWord:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_ProgramWord
_FLASH_ProgramHalfWord:
;stm32f4xx_flash.c,541 :: 		FLASH_Status FLASH_ProgramHalfWord(uint32_t Address, uint16_t Data)
; Data start address is: 4 (R1)
; Address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
UXTH	R6, R1
; Data end address is: 4 (R1)
; Address end address is: 0 (R0)
; Address start address is: 20 (R5)
; Data start address is: 24 (R6)
;stm32f4xx_flash.c,543 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f4xx_flash.c,549 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f4xx_flash.c,551 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #8
IT	NE
BNE	L__FLASH_ProgramHalfWord85
; status end address is: 4 (R1)
;stm32f4xx_flash.c,554 :: 		FLASH->CR &= CR_PSIZE_MASK;
MOVW	R4, #15376
MOVT	R4, #16386
LDR	R3, [R4, #0]
MVN	R2, #768
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_flash.c,555 :: 		FLASH->CR |= FLASH_PSIZE_HALF_WORD;
ORR	R2, R2, #256
STR	R2, [R4, #0]
;stm32f4xx_flash.c,556 :: 		FLASH->CR |= FLASH_CR_PG;
ORR	R2, R2, #1
STR	R2, [R4, #0]
;stm32f4xx_flash.c,558 :: 		*(__IO uint16_t*)Address = Data;
STRH	R6, [R5, #0]
; Address end address is: 20 (R5)
; Data end address is: 24 (R6)
;stm32f4xx_flash.c,561 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
; status start address is: 0 (R0)
;stm32f4xx_flash.c,564 :: 		FLASH->CR &= (~FLASH_CR_PG);
MOVW	R4, #15376
MOVT	R4, #16386
LDR	R3, [R4, #0]
MVN	R2, #1
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
; status end address is: 0 (R0)
;stm32f4xx_flash.c,565 :: 		}
IT	AL
BAL	L_FLASH_ProgramHalfWord50
L__FLASH_ProgramHalfWord85:
;stm32f4xx_flash.c,551 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f4xx_flash.c,565 :: 		}
L_FLASH_ProgramHalfWord50:
;stm32f4xx_flash.c,567 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f4xx_flash.c,568 :: 		}
L_end_FLASH_ProgramHalfWord:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_ProgramHalfWord
_FLASH_ProgramByte:
;stm32f4xx_flash.c,579 :: 		FLASH_Status FLASH_ProgramByte(uint32_t Address, uint8_t Data)
; Data start address is: 4 (R1)
; Address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
UXTB	R6, R1
; Data end address is: 4 (R1)
; Address end address is: 0 (R0)
; Address start address is: 20 (R5)
; Data start address is: 24 (R6)
;stm32f4xx_flash.c,581 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f4xx_flash.c,587 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
; status start address is: 4 (R1)
UXTB	R1, R0
;stm32f4xx_flash.c,589 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #8
IT	NE
BNE	L__FLASH_ProgramByte86
; status end address is: 4 (R1)
;stm32f4xx_flash.c,592 :: 		FLASH->CR &= CR_PSIZE_MASK;
MOVW	R4, #15376
MOVT	R4, #16386
LDR	R3, [R4, #0]
MVN	R2, #768
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_flash.c,593 :: 		FLASH->CR |= FLASH_PSIZE_BYTE;
STR	R2, [R4, #0]
;stm32f4xx_flash.c,594 :: 		FLASH->CR |= FLASH_CR_PG;
ORR	R2, R2, #1
STR	R2, [R4, #0]
;stm32f4xx_flash.c,596 :: 		*(__IO uint8_t*)Address = Data;
STRB	R6, [R5, #0]
; Address end address is: 20 (R5)
; Data end address is: 24 (R6)
;stm32f4xx_flash.c,599 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
; status start address is: 0 (R0)
;stm32f4xx_flash.c,602 :: 		FLASH->CR &= (~FLASH_CR_PG);
MOVW	R4, #15376
MOVT	R4, #16386
LDR	R3, [R4, #0]
MVN	R2, #1
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
; status end address is: 0 (R0)
;stm32f4xx_flash.c,603 :: 		}
IT	AL
BAL	L_FLASH_ProgramByte51
L__FLASH_ProgramByte86:
;stm32f4xx_flash.c,589 :: 		if(status == FLASH_COMPLETE)
UXTB	R0, R1
;stm32f4xx_flash.c,603 :: 		}
L_FLASH_ProgramByte51:
;stm32f4xx_flash.c,606 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f4xx_flash.c,607 :: 		}
L_end_FLASH_ProgramByte:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_ProgramByte
_FLASH_OB_Unlock:
;stm32f4xx_flash.c,664 :: 		void FLASH_OB_Unlock(void)
;stm32f4xx_flash.c,666 :: 		if((FLASH->OPTCR & FLASH_OPTCR_OPTLOCK) != RESET)
MOVW	R0, #15380
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_OB_Unlock52
;stm32f4xx_flash.c,669 :: 		FLASH->OPTKEYR = FLASH_OPT_KEY1;
MOVW	R0, #10811
MOVT	R0, #2073
MOVW	R1, #15368
MOVT	R1, #16386
STR	R0, [R1, #0]
;stm32f4xx_flash.c,670 :: 		FLASH->OPTKEYR = FLASH_OPT_KEY2;
MOVW	R0, #28287
MOVT	R0, #19549
STR	R0, [R1, #0]
;stm32f4xx_flash.c,671 :: 		}
L_FLASH_OB_Unlock52:
;stm32f4xx_flash.c,672 :: 		}
L_end_FLASH_OB_Unlock:
BX	LR
; end of _FLASH_OB_Unlock
_FLASH_OB_Lock:
;stm32f4xx_flash.c,679 :: 		void FLASH_OB_Lock(void)
;stm32f4xx_flash.c,682 :: 		FLASH->OPTCR |= FLASH_OPTCR_OPTLOCK;
MOVW	R1, #15380
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #1
STR	R0, [R1, #0]
;stm32f4xx_flash.c,683 :: 		}
L_end_FLASH_OB_Lock:
BX	LR
; end of _FLASH_OB_Lock
_FLASH_OB_WRPConfig:
;stm32f4xx_flash.c,695 :: 		void FLASH_OB_WRPConfig(uint32_t OB_WRP, FunctionalState NewState)
; NewState start address is: 4 (R1)
; OB_WRP start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R2, R0
UXTB	R3, R1
; NewState end address is: 4 (R1)
; OB_WRP end address is: 0 (R0)
; OB_WRP start address is: 8 (R2)
; NewState start address is: 12 (R3)
;stm32f4xx_flash.c,697 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f4xx_flash.c,703 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
;stm32f4xx_flash.c,705 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #8
IT	NE
BNE	L_FLASH_OB_WRPConfig53
;stm32f4xx_flash.c,707 :: 		if(NewState != DISABLE)
CMP	R3, #0
IT	EQ
BEQ	L_FLASH_OB_WRPConfig54
; NewState end address is: 12 (R3)
;stm32f4xx_flash.c,709 :: 		*(__IO uint16_t*)OPTCR_BYTE2_ADDRESS &= (~OB_WRP);
MVN	R3, R2
; OB_WRP end address is: 8 (R2)
MOVW	R2, 1073888278
MOVT	R2, 16386
LDRH	R2, [R2, #0]
AND	R3, R2, R3, LSL #0
MOVW	R2, 1073888278
MOVT	R2, 16386
STRH	R3, [R2, #0]
;stm32f4xx_flash.c,710 :: 		}
IT	AL
BAL	L_FLASH_OB_WRPConfig55
L_FLASH_OB_WRPConfig54:
;stm32f4xx_flash.c,713 :: 		*(__IO uint16_t*)OPTCR_BYTE2_ADDRESS |= (uint16_t)OB_WRP;
; OB_WRP start address is: 8 (R2)
UXTH	R3, R2
; OB_WRP end address is: 8 (R2)
MOVW	R2, 1073888278
MOVT	R2, 16386
LDRH	R2, [R2, #0]
ORR	R3, R2, R3, LSL #0
MOVW	R2, 1073888278
MOVT	R2, 16386
STRH	R3, [R2, #0]
;stm32f4xx_flash.c,714 :: 		}
L_FLASH_OB_WRPConfig55:
;stm32f4xx_flash.c,715 :: 		}
L_FLASH_OB_WRPConfig53:
;stm32f4xx_flash.c,716 :: 		}
L_end_FLASH_OB_WRPConfig:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_OB_WRPConfig
_FLASH_OB_RDPConfig:
;stm32f4xx_flash.c,730 :: 		void FLASH_OB_RDPConfig(uint8_t OB_RDP)
; OB_RDP start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R2, R0
; OB_RDP end address is: 0 (R0)
; OB_RDP start address is: 8 (R2)
;stm32f4xx_flash.c,732 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f4xx_flash.c,737 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
;stm32f4xx_flash.c,739 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #8
IT	NE
BNE	L_FLASH_OB_RDPConfig56
;stm32f4xx_flash.c,741 :: 		*(__IO uint8_t*)OPTCR_BYTE1_ADDRESS = OB_RDP;
MOVW	R1, 1073888277
MOVT	R1, 16386
STRB	R2, [R1, #0]
; OB_RDP end address is: 8 (R2)
;stm32f4xx_flash.c,743 :: 		}
L_FLASH_OB_RDPConfig56:
;stm32f4xx_flash.c,744 :: 		}
L_end_FLASH_OB_RDPConfig:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_OB_RDPConfig
_FLASH_OB_UserConfig:
;stm32f4xx_flash.c,762 :: 		void FLASH_OB_UserConfig(uint8_t OB_IWDG, uint8_t OB_STOP, uint8_t OB_STDBY)
; OB_STDBY start address is: 8 (R2)
; OB_STOP start address is: 4 (R1)
; OB_IWDG start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R2
UXTB	R2, R0
UXTB	R4, R1
; OB_STDBY end address is: 8 (R2)
; OB_STOP end address is: 4 (R1)
; OB_IWDG end address is: 0 (R0)
; OB_IWDG start address is: 8 (R2)
; OB_STOP start address is: 16 (R4)
; OB_STDBY start address is: 20 (R5)
;stm32f4xx_flash.c,764 :: 		uint8_t optiontmp = 0xFF;
;stm32f4xx_flash.c,765 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f4xx_flash.c,773 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
;stm32f4xx_flash.c,775 :: 		if(status == FLASH_COMPLETE)
CMP	R0, #8
IT	NE
BNE	L_FLASH_OB_UserConfig57
;stm32f4xx_flash.c,778 :: 		optiontmp =  (uint8_t)((*(__IO uint8_t *)OPTCR_BYTE0_ADDRESS) & (uint8_t)0x0F);
MOVW	R3, 1073888276
MOVT	R3, 16386
LDRB	R3, [R3, #0]
AND	R3, R3, #15
UXTB	R3, R3
;stm32f4xx_flash.c,781 :: 		*(__IO uint8_t *)OPTCR_BYTE0_ADDRESS = OB_IWDG | (uint8_t)(OB_STDBY | (uint8_t)(OB_STOP | ((uint8_t)optiontmp)));
ORR	R3, R4, R3, LSL #0
UXTB	R3, R3
; OB_STOP end address is: 16 (R4)
ORR	R3, R5, R3, LSL #0
UXTB	R3, R3
; OB_STDBY end address is: 20 (R5)
ORR	R4, R2, R3, LSL #0
; OB_IWDG end address is: 8 (R2)
MOVW	R3, 1073888276
MOVT	R3, 16386
STRB	R4, [R3, #0]
;stm32f4xx_flash.c,782 :: 		}
L_FLASH_OB_UserConfig57:
;stm32f4xx_flash.c,783 :: 		}
L_end_FLASH_OB_UserConfig:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_OB_UserConfig
_FLASH_OB_BORConfig:
;stm32f4xx_flash.c,795 :: 		void FLASH_OB_BORConfig(uint8_t OB_BOR)
; OB_BOR start address is: 0 (R0)
; OB_BOR end address is: 0 (R0)
; OB_BOR start address is: 0 (R0)
;stm32f4xx_flash.c,801 :: 		*(__IO uint8_t *)OPTCR_BYTE0_ADDRESS &= (~FLASH_OPTCR_BOR_LEV);
MOVW	R1, 1073888276
MOVT	R1, 16386
LDRB	R2, [R1, #0]
MVN	R1, #12
ANDS	R2, R1
MOVW	R1, 1073888276
MOVT	R1, 16386
STRB	R2, [R1, #0]
;stm32f4xx_flash.c,802 :: 		*(__IO uint8_t *)OPTCR_BYTE0_ADDRESS |= OB_BOR;
MOVW	R1, 1073888276
MOVT	R1, 16386
LDRB	R1, [R1, #0]
ORR	R2, R1, R0, LSL #0
; OB_BOR end address is: 0 (R0)
MOVW	R1, 1073888276
MOVT	R1, 16386
STRB	R2, [R1, #0]
;stm32f4xx_flash.c,804 :: 		}
L_end_FLASH_OB_BORConfig:
BX	LR
; end of _FLASH_OB_BORConfig
_FLASH_OB_Launch:
;stm32f4xx_flash.c,812 :: 		FLASH_Status FLASH_OB_Launch(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f4xx_flash.c,814 :: 		FLASH_Status status = FLASH_COMPLETE;
;stm32f4xx_flash.c,817 :: 		*(__IO uint8_t *)OPTCR_BYTE0_ADDRESS |= FLASH_OPTCR_OPTSTRT;
MOVW	R0, 1073888276
MOVT	R0, 16386
LDRB	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, 1073888276
MOVT	R0, 16386
STRB	R1, [R0, #0]
;stm32f4xx_flash.c,820 :: 		status = FLASH_WaitForLastOperation();
BL	_FLASH_WaitForLastOperation+0
;stm32f4xx_flash.c,822 :: 		return status;
;stm32f4xx_flash.c,823 :: 		}
L_end_FLASH_OB_Launch:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_OB_Launch
_FLASH_OB_GetUser:
;stm32f4xx_flash.c,831 :: 		uint8_t FLASH_OB_GetUser(void)
;stm32f4xx_flash.c,834 :: 		return (uint8_t)(FLASH->OPTCR >> 5);
MOVW	R0, #15380
MOVT	R0, #16386
LDR	R0, [R0, #0]
LSRS	R0, R0, #5
UXTB	R0, R0
;stm32f4xx_flash.c,835 :: 		}
L_end_FLASH_OB_GetUser:
BX	LR
; end of _FLASH_OB_GetUser
_FLASH_OB_GetWRP:
;stm32f4xx_flash.c,842 :: 		uint16_t FLASH_OB_GetWRP(void)
;stm32f4xx_flash.c,845 :: 		return (*(__IO uint16_t *)(OPTCR_BYTE2_ADDRESS));
MOVW	R0, 1073888278
MOVT	R0, 16386
LDRH	R0, [R0, #0]
;stm32f4xx_flash.c,846 :: 		}
L_end_FLASH_OB_GetWRP:
BX	LR
; end of _FLASH_OB_GetWRP
_FLASH_OB_GetRDP:
;stm32f4xx_flash.c,855 :: 		FlagStatus FLASH_OB_GetRDP(void)
;stm32f4xx_flash.c,857 :: 		FlagStatus readstatus = RESET;
;stm32f4xx_flash.c,859 :: 		if ((*(__IO uint8_t*)(OPTCR_BYTE1_ADDRESS) != (uint8_t)OB_RDP_Level_0))
MOVW	R0, 1073888277
MOVT	R0, 16386
LDRB	R0, [R0, #0]
CMP	R0, #170
IT	EQ
BEQ	L_FLASH_OB_GetRDP58
;stm32f4xx_flash.c,861 :: 		readstatus = SET;
; readstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_flash.c,862 :: 		}
; readstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_OB_GetRDP59
L_FLASH_OB_GetRDP58:
;stm32f4xx_flash.c,865 :: 		readstatus = RESET;
; readstatus start address is: 0 (R0)
MOVS	R0, #0
; readstatus end address is: 0 (R0)
;stm32f4xx_flash.c,866 :: 		}
L_FLASH_OB_GetRDP59:
;stm32f4xx_flash.c,867 :: 		return readstatus;
; readstatus start address is: 0 (R0)
; readstatus end address is: 0 (R0)
;stm32f4xx_flash.c,868 :: 		}
L_end_FLASH_OB_GetRDP:
BX	LR
; end of _FLASH_OB_GetRDP
_FLASH_OB_GetBOR:
;stm32f4xx_flash.c,879 :: 		uint8_t FLASH_OB_GetBOR(void)
;stm32f4xx_flash.c,882 :: 		return (uint8_t)(*(__IO uint8_t *)(OPTCR_BYTE0_ADDRESS) & (uint8_t)0x0C);
MOVW	R0, 1073888276
MOVT	R0, 16386
LDRB	R0, [R0, #0]
AND	R0, R0, #12
;stm32f4xx_flash.c,883 :: 		}
L_end_FLASH_OB_GetBOR:
BX	LR
; end of _FLASH_OB_GetBOR
_FLASH_ITConfig:
;stm32f4xx_flash.c,909 :: 		void FLASH_ITConfig(uint32_t FLASH_IT, FunctionalState NewState)
; NewState start address is: 4 (R1)
; FLASH_IT start address is: 0 (R0)
; NewState end address is: 4 (R1)
; FLASH_IT end address is: 0 (R0)
; FLASH_IT start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_flash.c,915 :: 		if(NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_FLASH_ITConfig60
; NewState end address is: 4 (R1)
;stm32f4xx_flash.c,918 :: 		FLASH->CR |= FLASH_IT;
MOVW	R3, #15376
MOVT	R3, #16386
LDR	R2, [R3, #0]
ORRS	R2, R0
; FLASH_IT end address is: 0 (R0)
STR	R2, [R3, #0]
;stm32f4xx_flash.c,919 :: 		}
IT	AL
BAL	L_FLASH_ITConfig61
L_FLASH_ITConfig60:
;stm32f4xx_flash.c,923 :: 		FLASH->CR &= ~(uint32_t)FLASH_IT;
; FLASH_IT start address is: 0 (R0)
MVN	R4, R0
; FLASH_IT end address is: 0 (R0)
MOVW	R3, #15376
MOVT	R3, #16386
LDR	R2, [R3, #0]
ANDS	R2, R4
STR	R2, [R3, #0]
;stm32f4xx_flash.c,924 :: 		}
L_FLASH_ITConfig61:
;stm32f4xx_flash.c,925 :: 		}
L_end_FLASH_ITConfig:
BX	LR
; end of _FLASH_ITConfig
_FLASH_GetFlagStatus:
;stm32f4xx_flash.c,940 :: 		FlagStatus FLASH_GetFlagStatus(uint32_t FLASH_FLAG)
; FLASH_FLAG start address is: 0 (R0)
; FLASH_FLAG end address is: 0 (R0)
; FLASH_FLAG start address is: 0 (R0)
;stm32f4xx_flash.c,942 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_flash.c,946 :: 		if((FLASH->SR & FLASH_FLAG) != (uint32_t)RESET)
MOVW	R1, #15372
MOVT	R1, #16386
LDR	R1, [R1, #0]
ANDS	R1, R0
; FLASH_FLAG end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_FLASH_GetFlagStatus62
;stm32f4xx_flash.c,948 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_flash.c,949 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetFlagStatus63
L_FLASH_GetFlagStatus62:
;stm32f4xx_flash.c,952 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_flash.c,953 :: 		}
L_FLASH_GetFlagStatus63:
;stm32f4xx_flash.c,955 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_flash.c,956 :: 		}
L_end_FLASH_GetFlagStatus:
BX	LR
; end of _FLASH_GetFlagStatus
_FLASH_ClearFlag:
;stm32f4xx_flash.c,970 :: 		void FLASH_ClearFlag(uint32_t FLASH_FLAG)
; FLASH_FLAG start address is: 0 (R0)
; FLASH_FLAG end address is: 0 (R0)
; FLASH_FLAG start address is: 0 (R0)
;stm32f4xx_flash.c,976 :: 		FLASH->SR = FLASH_FLAG;
MOVW	R1, #15372
MOVT	R1, #16386
STR	R0, [R1, #0]
; FLASH_FLAG end address is: 0 (R0)
;stm32f4xx_flash.c,977 :: 		}
L_end_FLASH_ClearFlag:
BX	LR
; end of _FLASH_ClearFlag
_FLASH_GetStatus:
;stm32f4xx_flash.c,985 :: 		FLASH_Status FLASH_GetStatus(void)
;stm32f4xx_flash.c,987 :: 		FLASH_Status flashstatus = FLASH_COMPLETE;
;stm32f4xx_flash.c,989 :: 		if((FLASH->SR & FLASH_FLAG_BSY) == FLASH_FLAG_BSY)
MOVW	R0, #15372
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #65536
CMP	R0, #65536
IT	NE
BNE	L_FLASH_GetStatus64
;stm32f4xx_flash.c,991 :: 		flashstatus = FLASH_BUSY;
; flashstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_flash.c,992 :: 		}
; flashstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetStatus65
L_FLASH_GetStatus64:
;stm32f4xx_flash.c,995 :: 		if((FLASH->SR & FLASH_FLAG_WRPERR) != (uint32_t)0x00)
MOVW	R0, #15372
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #16
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_GetStatus66
;stm32f4xx_flash.c,997 :: 		flashstatus = FLASH_ERROR_WRP;
; flashstatus start address is: 0 (R0)
MOVS	R0, #5
;stm32f4xx_flash.c,998 :: 		}
; flashstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetStatus67
L_FLASH_GetStatus66:
;stm32f4xx_flash.c,1001 :: 		if((FLASH->SR & (uint32_t)0xEF) != (uint32_t)0x00)
MOVW	R0, #15372
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #239
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_GetStatus68
;stm32f4xx_flash.c,1003 :: 		flashstatus = FLASH_ERROR_PROGRAM;
; flashstatus start address is: 0 (R0)
MOVS	R0, #6
;stm32f4xx_flash.c,1004 :: 		}
; flashstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetStatus69
L_FLASH_GetStatus68:
;stm32f4xx_flash.c,1007 :: 		if((FLASH->SR & FLASH_FLAG_OPERR) != (uint32_t)0x00)
MOVW	R0, #15372
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #2
CMP	R0, #0
IT	EQ
BEQ	L_FLASH_GetStatus70
;stm32f4xx_flash.c,1009 :: 		flashstatus = FLASH_ERROR_OPERATION;
; flashstatus start address is: 0 (R0)
MOVS	R0, #7
;stm32f4xx_flash.c,1010 :: 		}
; flashstatus end address is: 0 (R0)
IT	AL
BAL	L_FLASH_GetStatus71
L_FLASH_GetStatus70:
;stm32f4xx_flash.c,1013 :: 		flashstatus = FLASH_COMPLETE;
; flashstatus start address is: 0 (R0)
MOVS	R0, #8
; flashstatus end address is: 0 (R0)
;stm32f4xx_flash.c,1014 :: 		}
L_FLASH_GetStatus71:
;stm32f4xx_flash.c,1015 :: 		}
; flashstatus start address is: 0 (R0)
; flashstatus end address is: 0 (R0)
L_FLASH_GetStatus69:
;stm32f4xx_flash.c,1016 :: 		}
; flashstatus start address is: 0 (R0)
; flashstatus end address is: 0 (R0)
L_FLASH_GetStatus67:
;stm32f4xx_flash.c,1017 :: 		}
; flashstatus start address is: 0 (R0)
; flashstatus end address is: 0 (R0)
L_FLASH_GetStatus65:
;stm32f4xx_flash.c,1019 :: 		return flashstatus;
; flashstatus start address is: 0 (R0)
; flashstatus end address is: 0 (R0)
;stm32f4xx_flash.c,1020 :: 		}
L_end_FLASH_GetStatus:
BX	LR
; end of _FLASH_GetStatus
_FLASH_WaitForLastOperation:
;stm32f4xx_flash.c,1028 :: 		FLASH_Status FLASH_WaitForLastOperation(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f4xx_flash.c,1030 :: 		__IO FLASH_Status status = FLASH_COMPLETE;
;stm32f4xx_flash.c,1033 :: 		status = FLASH_GetStatus();
BL	_FLASH_GetStatus+0
; status start address is: 4 (R1)
UXTB	R1, R0
; status end address is: 4 (R1)
UXTB	R0, R1
;stm32f4xx_flash.c,1038 :: 		while(status == FLASH_BUSY)
L_FLASH_WaitForLastOperation72:
; status start address is: 0 (R0)
CMP	R0, #1
IT	NE
BNE	L_FLASH_WaitForLastOperation73
; status end address is: 0 (R0)
;stm32f4xx_flash.c,1040 :: 		status = FLASH_GetStatus();
BL	_FLASH_GetStatus+0
; status start address is: 0 (R0)
;stm32f4xx_flash.c,1041 :: 		}
IT	AL
BAL	L_FLASH_WaitForLastOperation72
L_FLASH_WaitForLastOperation73:
;stm32f4xx_flash.c,1043 :: 		return status;
; status end address is: 0 (R0)
;stm32f4xx_flash.c,1044 :: 		}
L_end_FLASH_WaitForLastOperation:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLASH_WaitForLastOperation
