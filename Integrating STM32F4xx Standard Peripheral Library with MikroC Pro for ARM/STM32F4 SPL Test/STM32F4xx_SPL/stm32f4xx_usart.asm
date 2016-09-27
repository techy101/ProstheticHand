stm32f4xx_usart___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_usart___DSB
stm32f4xx_usart___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_usart___WFI
stm32f4xx_usart___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_usart___WFE
stm32f4xx_usart___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_usart___REV
stm32f4xx_usart_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_usart_NVIC_SetPriorityGrouping
stm32f4xx_usart_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_usart_NVIC_GetPriorityGrouping
stm32f4xx_usart_NVIC_EnableIRQ:
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
; end of stm32f4xx_usart_NVIC_EnableIRQ
stm32f4xx_usart_NVIC_DisableIRQ:
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
; end of stm32f4xx_usart_NVIC_DisableIRQ
stm32f4xx_usart_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_usart_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_usart_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_usart_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_usart_NVIC_GetPendingIRQ1
L_stm32f4xx_usart_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_usart_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_usart_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_usart_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_usart_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_usart_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_usart_NVIC_GetPendingIRQ
stm32f4xx_usart_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_usart_NVIC_SetPendingIRQ
stm32f4xx_usart_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_usart_NVIC_ClearPendingIRQ
stm32f4xx_usart_NVIC_GetActive:
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
BEQ	L_stm32f4xx_usart_NVIC_GetActive2
; ?FLOC__stm32f4xx_usart_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_usart_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_usart_NVIC_GetActive3
L_stm32f4xx_usart_NVIC_GetActive2:
; ?FLOC__stm32f4xx_usart_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_usart_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_usart_NVIC_GetActive3:
; ?FLOC__stm32f4xx_usart_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_usart_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_usart_NVIC_GetActive
stm32f4xx_usart_NVIC_SetPriority:
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
BGE	L_stm32f4xx_usart_NVIC_SetPriority4
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
BAL	L_stm32f4xx_usart_NVIC_SetPriority5
L_stm32f4xx_usart_NVIC_SetPriority4:
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
L_stm32f4xx_usart_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_usart_NVIC_SetPriority
stm32f4xx_usart_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_usart_NVIC_GetPriority6
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
L_stm32f4xx_usart_NVIC_GetPriority6:
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
; end of stm32f4xx_usart_NVIC_GetPriority
stm32f4xx_usart_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_usart_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_usart_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_usart_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_usart_NVIC_EncodePriority9
L_stm32f4xx_usart_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_usart_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_usart_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_usart_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_usart_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_usart_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_usart_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_usart_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_usart_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_usart_NVIC_EncodePriority11
L_stm32f4xx_usart_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_usart_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_usart_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_usart_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_usart_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_usart_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_usart_NVIC_EncodePriority
stm32f4xx_usart_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_usart_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_usart_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_usart_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_usart_NVIC_DecodePriority13
L_stm32f4xx_usart_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_usart_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_usart_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_usart_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_usart_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_usart_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_usart_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_usart_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_usart_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_usart_NVIC_DecodePriority15
L_stm32f4xx_usart_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_usart_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_usart_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_usart_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_usart_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_usart_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_usart_NVIC_DecodePriority
stm32f4xx_usart_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_usart___DSB+0
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
BL	stm32f4xx_usart___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_usart_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_usart_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_usart_NVIC_SystemReset
stm32f4xx_usart_SysTick_Config:
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
BLS	L_stm32f4xx_usart_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_usart_SysTick_Config18:
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
BL	stm32f4xx_usart_NVIC_SetPriority+0
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
; end of stm32f4xx_usart_SysTick_Config
stm32f4xx_usart_ITM_SendChar:
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
BEQ	L_stm32f4xx_usart_ITM_SendChar92
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_usart_ITM_SendChar93
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_usart_ITM_SendChar94
L_stm32f4xx_usart_ITM_SendChar88:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_usart_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_usart_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_usart_ITM_SendChar22
L_stm32f4xx_usart_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_usart_ITM_SendChar91
L_stm32f4xx_usart_ITM_SendChar92:
L_stm32f4xx_usart_ITM_SendChar91:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_usart_ITM_SendChar90
L_stm32f4xx_usart_ITM_SendChar93:
L_stm32f4xx_usart_ITM_SendChar90:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_usart_ITM_SendChar89
L_stm32f4xx_usart_ITM_SendChar94:
L_stm32f4xx_usart_ITM_SendChar89:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_usart_ITM_SendChar
stm32f4xx_usart_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_usart_ITM_ReceiveChar24
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
L_stm32f4xx_usart_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_usart_ITM_ReceiveChar
stm32f4xx_usart_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_usart_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_usart_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_usart_ITM_CheckChar
_USART_DeInit:
;stm32f4xx_usart.c,184 :: 		void USART_DeInit(USART_TypeDef* USARTx)
; USARTx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
;stm32f4xx_usart.c,189 :: 		if (USARTx == USART1)
MOVW	R1, #4096
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_USART_DeInit27
; USARTx end address is: 0 (R0)
;stm32f4xx_usart.c,191 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART1, ENABLE);
MOVS	R1, #1
MOV	R0, #16
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_usart.c,192 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART1, DISABLE);
MOVS	R1, #0
MOV	R0, #16
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_usart.c,193 :: 		}
IT	AL
BAL	L_USART_DeInit28
L_USART_DeInit27:
;stm32f4xx_usart.c,194 :: 		else if (USARTx == USART2)
; USARTx start address is: 0 (R0)
MOVW	R1, #17408
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_USART_DeInit29
; USARTx end address is: 0 (R0)
;stm32f4xx_usart.c,196 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, ENABLE);
MOVS	R1, #1
MOV	R0, #131072
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_usart.c,197 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, DISABLE);
MOVS	R1, #0
MOV	R0, #131072
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_usart.c,198 :: 		}
IT	AL
BAL	L_USART_DeInit30
L_USART_DeInit29:
;stm32f4xx_usart.c,199 :: 		else if (USARTx == USART3)
; USARTx start address is: 0 (R0)
MOVW	R1, #18432
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_USART_DeInit31
; USARTx end address is: 0 (R0)
;stm32f4xx_usart.c,201 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, ENABLE);
MOVS	R1, #1
MOV	R0, #262144
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_usart.c,202 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, DISABLE);
MOVS	R1, #0
MOV	R0, #262144
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_usart.c,203 :: 		}
IT	AL
BAL	L_USART_DeInit32
L_USART_DeInit31:
;stm32f4xx_usart.c,204 :: 		else if (USARTx == UART4)
; USARTx start address is: 0 (R0)
MOVW	R1, #19456
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_USART_DeInit33
; USARTx end address is: 0 (R0)
;stm32f4xx_usart.c,206 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART4, ENABLE);
MOVS	R1, #1
MOV	R0, #524288
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_usart.c,207 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART4, DISABLE);
MOVS	R1, #0
MOV	R0, #524288
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_usart.c,208 :: 		}
IT	AL
BAL	L_USART_DeInit34
L_USART_DeInit33:
;stm32f4xx_usart.c,209 :: 		else if (USARTx == UART5)
; USARTx start address is: 0 (R0)
MOVW	R1, #20480
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_USART_DeInit35
; USARTx end address is: 0 (R0)
;stm32f4xx_usart.c,211 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART5, ENABLE);
MOVS	R1, #1
MOV	R0, #1048576
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_usart.c,212 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART5, DISABLE);
MOVS	R1, #0
MOV	R0, #1048576
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_usart.c,213 :: 		}
IT	AL
BAL	L_USART_DeInit36
L_USART_DeInit35:
;stm32f4xx_usart.c,216 :: 		if (USARTx == USART6)
; USARTx start address is: 0 (R0)
MOVW	R1, #5120
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_USART_DeInit37
; USARTx end address is: 0 (R0)
;stm32f4xx_usart.c,218 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART6, ENABLE);
MOVS	R1, #1
MOV	R0, #32
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_usart.c,219 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART6, DISABLE);
MOVS	R1, #0
MOV	R0, #32
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_usart.c,220 :: 		}
L_USART_DeInit37:
;stm32f4xx_usart.c,221 :: 		}
L_USART_DeInit36:
L_USART_DeInit34:
L_USART_DeInit32:
L_USART_DeInit30:
L_USART_DeInit28:
;stm32f4xx_usart.c,222 :: 		}
L_end_USART_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART_DeInit
_USART_Init:
;stm32f4xx_usart.c,233 :: 		void USART_Init(USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStruct)
; USART_InitStruct start address is: 4 (R1)
; USARTx start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
; USART_InitStruct end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_InitStruct start address is: 4 (R1)
;stm32f4xx_usart.c,235 :: 		uint32_t tmpreg = 0x00, apbclock = 0x00;
;stm32f4xx_usart.c,236 :: 		uint32_t integerdivider = 0x00;
;stm32f4xx_usart.c,237 :: 		uint32_t fractionaldivider = 0x00;
;stm32f4xx_usart.c,250 :: 		if (USART_InitStruct->USART_HardwareFlowControl != USART_HardwareFlowControl_None)
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_USART_Init38
;stm32f4xx_usart.c,253 :: 		}
L_USART_Init38:
;stm32f4xx_usart.c,256 :: 		tmpreg = USARTx->CR2;
ADDW	R4, R0, #16
LDRH	R5, [R4, #0]
; tmpreg start address is: 20 (R5)
UXTH	R5, R5
;stm32f4xx_usart.c,259 :: 		tmpreg &= (uint32_t)~((uint32_t)USART_CR2_STOP);
MVN	R2, #12288
AND	R3, R5, R2, LSL #0
; tmpreg end address is: 20 (R5)
;stm32f4xx_usart.c,263 :: 		tmpreg |= (uint32_t)USART_InitStruct->USART_StopBits;
ADDS	R2, R1, #6
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
;stm32f4xx_usart.c,266 :: 		USARTx->CR2 = (uint16_t)tmpreg;
UXTH	R2, R2
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,269 :: 		tmpreg = USARTx->CR1;
ADDW	R5, R0, #12
LDRH	R2, [R5, #0]
; tmpreg start address is: 12 (R3)
UXTH	R3, R2
;stm32f4xx_usart.c,272 :: 		tmpreg &= (uint32_t)~((uint32_t)CR1_CLEAR_MASK);
MOVW	R2, #59891
MOVT	R2, #65535
AND	R4, R3, R2, LSL #0
; tmpreg end address is: 12 (R3)
;stm32f4xx_usart.c,278 :: 		tmpreg |= (uint32_t)USART_InitStruct->USART_WordLength | USART_InitStruct->USART_Parity |
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADDW	R2, R1, #8
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_usart.c,279 :: 		USART_InitStruct->USART_Mode;
ADDW	R2, R1, #10
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
ORR	R2, R4, R2, LSL #0
;stm32f4xx_usart.c,282 :: 		USARTx->CR1 = (uint16_t)tmpreg;
UXTH	R2, R2
STRH	R2, [R5, #0]
;stm32f4xx_usart.c,285 :: 		tmpreg = USARTx->CR3;
ADDW	R4, R0, #20
LDRH	R2, [R4, #0]
; tmpreg start address is: 20 (R5)
UXTH	R5, R2
;stm32f4xx_usart.c,288 :: 		tmpreg &= (uint32_t)~((uint32_t)CR3_CLEAR_MASK);
MVN	R2, #768
AND	R3, R5, R2, LSL #0
; tmpreg end address is: 20 (R5)
;stm32f4xx_usart.c,292 :: 		tmpreg |= USART_InitStruct->USART_HardwareFlowControl;
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
;stm32f4xx_usart.c,295 :: 		USARTx->CR3 = (uint16_t)tmpreg;
UXTH	R2, R2
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,299 :: 		RCC_GetClocksFreq(&RCC_ClocksStatus);
ADD	R2, SP, #12
STR	R1, [SP, #4]
STR	R0, [SP, #8]
MOV	R0, R2
BL	_RCC_GetClocksFreq+0
LDR	R0, [SP, #8]
LDR	R1, [SP, #4]
;stm32f4xx_usart.c,301 :: 		if ((USARTx == USART1) || (USARTx == USART6))
MOVW	R2, #4096
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__USART_Init97
MOVW	R2, #5120
MOVT	R2, #16385
CMP	R0, R2
IT	EQ
BEQ	L__USART_Init96
IT	AL
BAL	L_USART_Init41
L__USART_Init97:
L__USART_Init96:
;stm32f4xx_usart.c,303 :: 		apbclock = RCC_ClocksStatus.PCLK2_Frequency;
; apbclock start address is: 16 (R4)
LDR	R4, [SP, #24]
;stm32f4xx_usart.c,304 :: 		}
; apbclock end address is: 16 (R4)
IT	AL
BAL	L_USART_Init42
L_USART_Init41:
;stm32f4xx_usart.c,307 :: 		apbclock = RCC_ClocksStatus.PCLK1_Frequency;
; apbclock start address is: 16 (R4)
LDR	R4, [SP, #20]
; apbclock end address is: 16 (R4)
;stm32f4xx_usart.c,308 :: 		}
L_USART_Init42:
;stm32f4xx_usart.c,311 :: 		if ((USARTx->CR1 & USART_CR1_OVER8) != 0)
; apbclock start address is: 16 (R4)
ADDW	R2, R0, #12
LDRH	R2, [R2, #0]
AND	R2, R2, #32768
UXTH	R2, R2
CMP	R2, #0
IT	EQ
BEQ	L_USART_Init43
;stm32f4xx_usart.c,314 :: 		integerdivider = ((25 * apbclock) / (2 * (USART_InitStruct->USART_BaudRate)));
MOV	R2, #25
MULS	R4, R2, R4
; apbclock end address is: 16 (R4)
LDR	R2, [R1, #0]
; USART_InitStruct end address is: 4 (R1)
LSLS	R2, R2, #1
UDIV	R4, R4, R2
; integerdivider start address is: 16 (R4)
;stm32f4xx_usart.c,315 :: 		}
; integerdivider end address is: 16 (R4)
IT	AL
BAL	L_USART_Init44
L_USART_Init43:
;stm32f4xx_usart.c,319 :: 		integerdivider = ((25 * apbclock) / (4 * (USART_InitStruct->USART_BaudRate)));
; apbclock start address is: 16 (R4)
; USART_InitStruct start address is: 4 (R1)
MOV	R2, #25
MULS	R4, R2, R4
; apbclock end address is: 16 (R4)
LDR	R2, [R1, #0]
; USART_InitStruct end address is: 4 (R1)
LSLS	R2, R2, #2
UDIV	R4, R4, R2
; integerdivider start address is: 16 (R4)
; integerdivider end address is: 16 (R4)
;stm32f4xx_usart.c,320 :: 		}
L_USART_Init44:
;stm32f4xx_usart.c,321 :: 		tmpreg = (integerdivider / 100) << 4;
; integerdivider start address is: 16 (R4)
MOV	R2, #100
UDIV	R2, R4, R2
LSLS	R2, R2, #4
; tmpreg start address is: 4 (R1)
MOV	R1, R2
;stm32f4xx_usart.c,324 :: 		fractionaldivider = integerdivider - (100 * (tmpreg >> 4));
LSRS	R3, R2, #4
MOV	R2, #100
MULS	R2, R3, R2
SUB	R2, R4, R2
; integerdivider end address is: 16 (R4)
; fractionaldivider start address is: 12 (R3)
MOV	R3, R2
;stm32f4xx_usart.c,327 :: 		if ((USARTx->CR1 & USART_CR1_OVER8) != 0)
ADDW	R2, R0, #12
LDRH	R2, [R2, #0]
AND	R2, R2, #32768
UXTH	R2, R2
CMP	R2, #0
IT	EQ
BEQ	L_USART_Init45
;stm32f4xx_usart.c,329 :: 		tmpreg |= ((((fractionaldivider * 8) + 50) / 100)) & ((uint8_t)0x07);
LSLS	R2, R3, #3
; fractionaldivider end address is: 12 (R3)
ADDW	R3, R2, #50
MOV	R2, #100
UDIV	R2, R3, R2
AND	R2, R2, #7
ORRS	R1, R2
;stm32f4xx_usart.c,330 :: 		}
IT	AL
BAL	L_USART_Init46
L_USART_Init45:
;stm32f4xx_usart.c,333 :: 		tmpreg |= ((((fractionaldivider * 16) + 50) / 100)) & ((uint8_t)0x0F);
; fractionaldivider start address is: 12 (R3)
LSLS	R2, R3, #4
; fractionaldivider end address is: 12 (R3)
ADDW	R3, R2, #50
MOV	R2, #100
UDIV	R2, R3, R2
AND	R2, R2, #15
ORRS	R1, R2
; tmpreg end address is: 4 (R1)
;stm32f4xx_usart.c,334 :: 		}
L_USART_Init46:
;stm32f4xx_usart.c,337 :: 		USARTx->BRR = (uint16_t)tmpreg;
; tmpreg start address is: 4 (R1)
ADDW	R3, R0, #8
; USARTx end address is: 0 (R0)
UXTH	R2, R1
; tmpreg end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,338 :: 		}
L_end_USART_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _USART_Init
_USART_StructInit:
;stm32f4xx_usart.c,346 :: 		void USART_StructInit(USART_InitTypeDef* USART_InitStruct)
; USART_InitStruct start address is: 0 (R0)
; USART_InitStruct end address is: 0 (R0)
; USART_InitStruct start address is: 0 (R0)
;stm32f4xx_usart.c,349 :: 		USART_InitStruct->USART_BaudRate = 9600;
MOV	R1, #9600
STR	R1, [R0, #0]
;stm32f4xx_usart.c,350 :: 		USART_InitStruct->USART_WordLength = USART_WordLength_8b;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_usart.c,351 :: 		USART_InitStruct->USART_StopBits = USART_StopBits_1;
ADDS	R2, R0, #6
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_usart.c,352 :: 		USART_InitStruct->USART_Parity = USART_Parity_No ;
ADDW	R2, R0, #8
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_usart.c,353 :: 		USART_InitStruct->USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
ADDW	R2, R0, #10
MOVW	R1, #12
STRH	R1, [R2, #0]
;stm32f4xx_usart.c,354 :: 		USART_InitStruct->USART_HardwareFlowControl = USART_HardwareFlowControl_None;
ADDW	R2, R0, #12
; USART_InitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_usart.c,355 :: 		}
L_end_USART_StructInit:
BX	LR
; end of _USART_StructInit
_USART_ClockInit:
;stm32f4xx_usart.c,366 :: 		void USART_ClockInit(USART_TypeDef* USARTx, USART_ClockInitTypeDef* USART_ClockInitStruct)
; USART_ClockInitStruct start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_ClockInitStruct end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_ClockInitStruct start address is: 4 (R1)
;stm32f4xx_usart.c,368 :: 		uint32_t tmpreg = 0x00;
;stm32f4xx_usart.c,377 :: 		tmpreg = USARTx->CR2;
ADDW	R5, R0, #16
; USARTx end address is: 0 (R0)
LDRH	R2, [R5, #0]
; tmpreg start address is: 0 (R0)
UXTH	R0, R2
;stm32f4xx_usart.c,379 :: 		tmpreg &= (uint32_t)~((uint32_t)CR2_CLOCK_CLEAR_MASK);
MVN	R2, #3840
AND	R4, R0, R2, LSL #0
; tmpreg end address is: 0 (R0)
;stm32f4xx_usart.c,385 :: 		tmpreg |= (uint32_t)USART_ClockInitStruct->USART_Clock | USART_ClockInitStruct->USART_CPOL |
LDRH	R2, [R1, #0]
UXTH	R3, R2
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_usart.c,386 :: 		USART_ClockInitStruct->USART_CPHA | USART_ClockInitStruct->USART_LastBit;
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
ORRS	R3, R2
ADDS	R2, R1, #6
; USART_ClockInitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
ORR	R2, R4, R2, LSL #0
;stm32f4xx_usart.c,388 :: 		USARTx->CR2 = (uint16_t)tmpreg;
UXTH	R2, R2
STRH	R2, [R5, #0]
;stm32f4xx_usart.c,389 :: 		}
L_end_USART_ClockInit:
BX	LR
; end of _USART_ClockInit
_USART_ClockStructInit:
;stm32f4xx_usart.c,397 :: 		void USART_ClockStructInit(USART_ClockInitTypeDef* USART_ClockInitStruct)
; USART_ClockInitStruct start address is: 0 (R0)
; USART_ClockInitStruct end address is: 0 (R0)
; USART_ClockInitStruct start address is: 0 (R0)
;stm32f4xx_usart.c,400 :: 		USART_ClockInitStruct->USART_Clock = USART_Clock_Disable;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f4xx_usart.c,401 :: 		USART_ClockInitStruct->USART_CPOL = USART_CPOL_Low;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_usart.c,402 :: 		USART_ClockInitStruct->USART_CPHA = USART_CPHA_1Edge;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_usart.c,403 :: 		USART_ClockInitStruct->USART_LastBit = USART_LastBit_Disable;
ADDS	R2, R0, #6
; USART_ClockInitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_usart.c,404 :: 		}
L_end_USART_ClockStructInit:
BX	LR
; end of _USART_ClockStructInit
_USART_Cmd:
;stm32f4xx_usart.c,414 :: 		void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_usart.c,420 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_Cmd47
; NewState end address is: 4 (R1)
;stm32f4xx_usart.c,423 :: 		USARTx->CR1 |= USART_CR1_UE;
ADDW	R3, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #8192
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,424 :: 		}
IT	AL
BAL	L_USART_Cmd48
L_USART_Cmd47:
;stm32f4xx_usart.c,428 :: 		USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_UE);
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #57343
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,429 :: 		}
L_USART_Cmd48:
;stm32f4xx_usart.c,430 :: 		}
L_end_USART_Cmd:
BX	LR
; end of _USART_Cmd
_USART_SetPrescaler:
;stm32f4xx_usart.c,440 :: 		void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
; USART_Prescaler start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_Prescaler end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_Prescaler start address is: 4 (R1)
;stm32f4xx_usart.c,446 :: 		USARTx->GTPR &= USART_GTPR_GT;
ADDW	R3, R0, #24
LDRH	R2, [R3, #0]
AND	R2, R2, #65280
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,448 :: 		USARTx->GTPR |= USART_Prescaler;
ADDW	R3, R0, #24
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; USART_Prescaler end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,449 :: 		}
L_end_USART_SetPrescaler:
BX	LR
; end of _USART_SetPrescaler
_USART_OverSampling8Cmd:
;stm32f4xx_usart.c,461 :: 		void USART_OverSampling8Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_usart.c,467 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_OverSampling8Cmd49
; NewState end address is: 4 (R1)
;stm32f4xx_usart.c,470 :: 		USARTx->CR1 |= USART_CR1_OVER8;
ADDW	R3, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #32768
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,471 :: 		}
IT	AL
BAL	L_USART_OverSampling8Cmd50
L_USART_OverSampling8Cmd49:
;stm32f4xx_usart.c,475 :: 		USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_OVER8);
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #32767
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,476 :: 		}
L_USART_OverSampling8Cmd50:
;stm32f4xx_usart.c,477 :: 		}
L_end_USART_OverSampling8Cmd:
BX	LR
; end of _USART_OverSampling8Cmd
_USART_OneBitMethodCmd:
;stm32f4xx_usart.c,487 :: 		void USART_OneBitMethodCmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_usart.c,493 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_OneBitMethodCmd51
; NewState end address is: 4 (R1)
;stm32f4xx_usart.c,496 :: 		USARTx->CR3 |= USART_CR3_ONEBIT;
ADDW	R3, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #2048
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,497 :: 		}
IT	AL
BAL	L_USART_OneBitMethodCmd52
L_USART_OneBitMethodCmd51:
;stm32f4xx_usart.c,501 :: 		USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_ONEBIT);
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,502 :: 		}
L_USART_OneBitMethodCmd52:
;stm32f4xx_usart.c,503 :: 		}
L_end_USART_OneBitMethodCmd:
BX	LR
; end of _USART_OneBitMethodCmd
_USART_SendData:
;stm32f4xx_usart.c,544 :: 		void USART_SendData(USART_TypeDef* USARTx, uint16_t Data)
; Data start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; Data end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; Data start address is: 4 (R1)
;stm32f4xx_usart.c,551 :: 		USARTx->DR = (Data & (uint16_t)0x01FF);
ADDS	R3, R0, #4
; USARTx end address is: 0 (R0)
MOVW	R2, #511
AND	R2, R1, R2, LSL #0
; Data end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,552 :: 		}
L_end_USART_SendData:
BX	LR
; end of _USART_SendData
_USART_ReceiveData:
;stm32f4xx_usart.c,560 :: 		uint16_t USART_ReceiveData(USART_TypeDef* USARTx)
; USARTx start address is: 0 (R0)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
;stm32f4xx_usart.c,566 :: 		return (uint16_t)(USARTx->DR & (uint16_t)0x01FF);
ADDS	R1, R0, #4
; USARTx end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #511
AND	R1, R2, R1, LSL #0
UXTH	R0, R1
;stm32f4xx_usart.c,567 :: 		}
L_end_USART_ReceiveData:
BX	LR
; end of _USART_ReceiveData
_USART_SetAddress:
;stm32f4xx_usart.c,611 :: 		void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
; USART_Address start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_Address end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_Address start address is: 4 (R1)
;stm32f4xx_usart.c,618 :: 		USARTx->CR2 &= (uint16_t)~((uint16_t)USART_CR2_ADD);
ADDW	R4, R0, #16
LDRH	R3, [R4, #0]
MOVW	R2, #65520
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,620 :: 		USARTx->CR2 |= USART_Address;
ADDW	R3, R0, #16
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; USART_Address end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,621 :: 		}
L_end_USART_SetAddress:
BX	LR
; end of _USART_SetAddress
_USART_ReceiverWakeUpCmd:
;stm32f4xx_usart.c,631 :: 		void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_usart.c,637 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_ReceiverWakeUpCmd53
; NewState end address is: 4 (R1)
;stm32f4xx_usart.c,640 :: 		USARTx->CR1 |= USART_CR1_RWU;
ADDW	R3, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #2
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,641 :: 		}
IT	AL
BAL	L_USART_ReceiverWakeUpCmd54
L_USART_ReceiverWakeUpCmd53:
;stm32f4xx_usart.c,645 :: 		USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_RWU);
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65533
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,646 :: 		}
L_USART_ReceiverWakeUpCmd54:
;stm32f4xx_usart.c,647 :: 		}
L_end_USART_ReceiverWakeUpCmd:
BX	LR
; end of _USART_ReceiverWakeUpCmd
_USART_WakeUpConfig:
;stm32f4xx_usart.c,658 :: 		void USART_WakeUpConfig(USART_TypeDef* USARTx, uint16_t USART_WakeUp)
; USART_WakeUp start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_WakeUp end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_WakeUp start address is: 4 (R1)
;stm32f4xx_usart.c,664 :: 		USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_WAKE);
ADDW	R4, R0, #12
LDRH	R3, [R4, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,665 :: 		USARTx->CR1 |= USART_WakeUp;
ADDW	R3, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; USART_WakeUp end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,666 :: 		}
L_end_USART_WakeUpConfig:
BX	LR
; end of _USART_WakeUpConfig
_USART_LINBreakDetectLengthConfig:
;stm32f4xx_usart.c,727 :: 		void USART_LINBreakDetectLengthConfig(USART_TypeDef* USARTx, uint16_t USART_LINBreakDetectLength)
; USART_LINBreakDetectLength start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_LINBreakDetectLength end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_LINBreakDetectLength start address is: 4 (R1)
;stm32f4xx_usart.c,733 :: 		USARTx->CR2 &= (uint16_t)~((uint16_t)USART_CR2_LBDL);
ADDW	R4, R0, #16
LDRH	R3, [R4, #0]
MOVW	R2, #65503
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,734 :: 		USARTx->CR2 |= USART_LINBreakDetectLength;
ADDW	R3, R0, #16
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; USART_LINBreakDetectLength end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,735 :: 		}
L_end_USART_LINBreakDetectLengthConfig:
BX	LR
; end of _USART_LINBreakDetectLengthConfig
_USART_LINCmd:
;stm32f4xx_usart.c,745 :: 		void USART_LINCmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_usart.c,751 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_LINCmd55
; NewState end address is: 4 (R1)
;stm32f4xx_usart.c,754 :: 		USARTx->CR2 |= USART_CR2_LINEN;
ADDW	R3, R0, #16
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #16384
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,755 :: 		}
IT	AL
BAL	L_USART_LINCmd56
L_USART_LINCmd55:
;stm32f4xx_usart.c,759 :: 		USARTx->CR2 &= (uint16_t)~((uint16_t)USART_CR2_LINEN);
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #16
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #49151
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,760 :: 		}
L_USART_LINCmd56:
;stm32f4xx_usart.c,761 :: 		}
L_end_USART_LINCmd:
BX	LR
; end of _USART_LINCmd
_USART_SendBreak:
;stm32f4xx_usart.c,769 :: 		void USART_SendBreak(USART_TypeDef* USARTx)
; USARTx start address is: 0 (R0)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
;stm32f4xx_usart.c,775 :: 		USARTx->CR1 |= USART_CR1_SBK;
ADDW	R2, R0, #12
; USARTx end address is: 0 (R0)
LDRH	R1, [R2, #0]
ORR	R1, R1, #1
STRH	R1, [R2, #0]
;stm32f4xx_usart.c,776 :: 		}
L_end_USART_SendBreak:
BX	LR
; end of _USART_SendBreak
_USART_HalfDuplexCmd:
;stm32f4xx_usart.c,822 :: 		void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_usart.c,828 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_HalfDuplexCmd57
; NewState end address is: 4 (R1)
;stm32f4xx_usart.c,831 :: 		USARTx->CR3 |= USART_CR3_HDSEL;
ADDW	R3, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #8
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,832 :: 		}
IT	AL
BAL	L_USART_HalfDuplexCmd58
L_USART_HalfDuplexCmd57:
;stm32f4xx_usart.c,836 :: 		USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_HDSEL);
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65527
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,837 :: 		}
L_USART_HalfDuplexCmd58:
;stm32f4xx_usart.c,838 :: 		}
L_end_USART_HalfDuplexCmd:
BX	LR
; end of _USART_HalfDuplexCmd
_USART_SetGuardTime:
;stm32f4xx_usart.c,907 :: 		void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
; USART_GuardTime start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_GuardTime end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_GuardTime start address is: 4 (R1)
;stm32f4xx_usart.c,913 :: 		USARTx->GTPR &= USART_GTPR_PSC;
ADDW	R3, R0, #24
LDRH	R2, [R3, #0]
AND	R2, R2, #255
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,915 :: 		USARTx->GTPR |= (uint16_t)((uint16_t)USART_GuardTime << 0x08);
ADDW	R4, R0, #24
; USARTx end address is: 0 (R0)
UXTB	R2, R1
; USART_GuardTime end address is: 4 (R1)
LSLS	R3, R2, #8
UXTH	R3, R3
LDRH	R2, [R4, #0]
ORRS	R2, R3
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,916 :: 		}
L_end_USART_SetGuardTime:
BX	LR
; end of _USART_SetGuardTime
_USART_SmartCardCmd:
;stm32f4xx_usart.c,926 :: 		void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_usart.c,931 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_SmartCardCmd59
; NewState end address is: 4 (R1)
;stm32f4xx_usart.c,934 :: 		USARTx->CR3 |= USART_CR3_SCEN;
ADDW	R3, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #32
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,935 :: 		}
IT	AL
BAL	L_USART_SmartCardCmd60
L_USART_SmartCardCmd59:
;stm32f4xx_usart.c,939 :: 		USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_SCEN);
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65503
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,940 :: 		}
L_USART_SmartCardCmd60:
;stm32f4xx_usart.c,941 :: 		}
L_end_USART_SmartCardCmd:
BX	LR
; end of _USART_SmartCardCmd
_USART_SmartCardNACKCmd:
;stm32f4xx_usart.c,951 :: 		void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_usart.c,956 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_SmartCardNACKCmd61
; NewState end address is: 4 (R1)
;stm32f4xx_usart.c,959 :: 		USARTx->CR3 |= USART_CR3_NACK;
ADDW	R3, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #16
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,960 :: 		}
IT	AL
BAL	L_USART_SmartCardNACKCmd62
L_USART_SmartCardNACKCmd61:
;stm32f4xx_usart.c,964 :: 		USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_NACK);
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65519
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,965 :: 		}
L_USART_SmartCardNACKCmd62:
;stm32f4xx_usart.c,966 :: 		}
L_end_USART_SmartCardNACKCmd:
BX	LR
; end of _USART_SmartCardNACKCmd
_USART_IrDAConfig:
;stm32f4xx_usart.c,1022 :: 		void USART_IrDAConfig(USART_TypeDef* USARTx, uint16_t USART_IrDAMode)
; USART_IrDAMode start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_IrDAMode end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_IrDAMode start address is: 4 (R1)
;stm32f4xx_usart.c,1028 :: 		USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_IRLP);
ADDW	R4, R0, #20
LDRH	R3, [R4, #0]
MOVW	R2, #65531
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,1029 :: 		USARTx->CR3 |= USART_IrDAMode;
ADDW	R3, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORRS	R2, R1
; USART_IrDAMode end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,1030 :: 		}
L_end_USART_IrDAConfig:
BX	LR
; end of _USART_IrDAConfig
_USART_IrDACmd:
;stm32f4xx_usart.c,1040 :: 		void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_usart.c,1046 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_USART_IrDACmd63
; NewState end address is: 4 (R1)
;stm32f4xx_usart.c,1049 :: 		USARTx->CR3 |= USART_CR3_IREN;
ADDW	R3, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #2
STRH	R2, [R3, #0]
;stm32f4xx_usart.c,1050 :: 		}
IT	AL
BAL	L_USART_IrDACmd64
L_USART_IrDACmd63:
;stm32f4xx_usart.c,1054 :: 		USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_IREN);
; USARTx start address is: 0 (R0)
ADDW	R4, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65533
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_usart.c,1055 :: 		}
L_USART_IrDACmd64:
;stm32f4xx_usart.c,1056 :: 		}
L_end_USART_IrDACmd:
BX	LR
; end of _USART_IrDACmd
_USART_DMACmd:
;stm32f4xx_usart.c,1086 :: 		void USART_DMACmd(USART_TypeDef* USARTx, uint16_t USART_DMAReq, FunctionalState NewState)
; NewState start address is: 8 (R2)
; USART_DMAReq start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; USART_DMAReq end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_DMAReq start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f4xx_usart.c,1093 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_USART_DMACmd65
; NewState end address is: 8 (R2)
;stm32f4xx_usart.c,1097 :: 		USARTx->CR3 |= USART_DMAReq;
ADDW	R4, R0, #20
; USARTx end address is: 0 (R0)
LDRH	R3, [R4, #0]
ORRS	R3, R1
; USART_DMAReq end address is: 4 (R1)
STRH	R3, [R4, #0]
;stm32f4xx_usart.c,1098 :: 		}
IT	AL
BAL	L_USART_DMACmd66
L_USART_DMACmd65:
;stm32f4xx_usart.c,1103 :: 		USARTx->CR3 &= (uint16_t)~USART_DMAReq;
; USART_DMAReq start address is: 4 (R1)
; USARTx start address is: 0 (R0)
ADDW	R5, R0, #20
; USARTx end address is: 0 (R0)
MVN	R4, R1
UXTH	R4, R4
; USART_DMAReq end address is: 4 (R1)
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f4xx_usart.c,1104 :: 		}
L_USART_DMACmd66:
;stm32f4xx_usart.c,1105 :: 		}
L_end_USART_DMACmd:
BX	LR
; end of _USART_DMACmd
_USART_ITConfig:
;stm32f4xx_usart.c,1214 :: 		void USART_ITConfig(USART_TypeDef* USARTx, uint16_t USART_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; USART_IT start address is: 4 (R1)
; USARTx start address is: 0 (R0)
MOV	R4, R0
UXTH	R0, R1
; NewState end address is: 8 (R2)
; USART_IT end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 16 (R4)
; USART_IT start address is: 0 (R0)
; NewState start address is: 8 (R2)
;stm32f4xx_usart.c,1216 :: 		uint32_t usartreg = 0x00, itpos = 0x00, itmask = 0x00;
;stm32f4xx_usart.c,1217 :: 		uint32_t usartxbase = 0x00;
;stm32f4xx_usart.c,1224 :: 		if (USART_IT == USART_IT_CTS)
MOVW	R3, #2410
CMP	R0, R3
IT	NE
BNE	L_USART_ITConfig67
;stm32f4xx_usart.c,1227 :: 		}
L_USART_ITConfig67:
;stm32f4xx_usart.c,1229 :: 		usartxbase = (uint32_t)USARTx;
; usartxbase start address is: 4 (R1)
MOV	R1, R4
; USARTx end address is: 16 (R4)
;stm32f4xx_usart.c,1232 :: 		usartreg = (((uint8_t)USART_IT) >> 0x05);
UXTB	R3, R0
LSRS	R3, R3, #5
UXTB	R3, R3
; usartreg start address is: 16 (R4)
UXTB	R4, R3
;stm32f4xx_usart.c,1235 :: 		itpos = USART_IT & IT_MASK;
AND	R3, R0, #31
UXTH	R3, R3
; USART_IT end address is: 0 (R0)
; itpos start address is: 0 (R0)
UXTH	R0, R3
;stm32f4xx_usart.c,1236 :: 		itmask = (((uint32_t)0x01) << itpos);
MOV	R3, #1
LSLS	R3, R0
; itpos end address is: 0 (R0)
; itmask start address is: 0 (R0)
MOV	R0, R3
;stm32f4xx_usart.c,1238 :: 		if (usartreg == 0x01) /* The IT is in CR1 register */
CMP	R4, #1
IT	NE
BNE	L_USART_ITConfig68
; usartreg end address is: 16 (R4)
;stm32f4xx_usart.c,1240 :: 		usartxbase += 0x0C;
ADDS	R1, #12
;stm32f4xx_usart.c,1241 :: 		}
IT	AL
BAL	L_USART_ITConfig69
L_USART_ITConfig68:
;stm32f4xx_usart.c,1242 :: 		else if (usartreg == 0x02) /* The IT is in CR2 register */
; usartreg start address is: 16 (R4)
CMP	R4, #2
IT	NE
BNE	L_USART_ITConfig70
; usartreg end address is: 16 (R4)
;stm32f4xx_usart.c,1244 :: 		usartxbase += 0x10;
ADDS	R1, #16
;stm32f4xx_usart.c,1245 :: 		}
IT	AL
BAL	L_USART_ITConfig71
L_USART_ITConfig70:
;stm32f4xx_usart.c,1248 :: 		usartxbase += 0x14;
ADDS	R1, #20
; usartxbase end address is: 4 (R1)
;stm32f4xx_usart.c,1249 :: 		}
L_USART_ITConfig71:
; usartxbase start address is: 4 (R1)
; usartxbase end address is: 4 (R1)
L_USART_ITConfig69:
;stm32f4xx_usart.c,1250 :: 		if (NewState != DISABLE)
; usartxbase start address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_USART_ITConfig72
; NewState end address is: 8 (R2)
;stm32f4xx_usart.c,1252 :: 		*(__IO uint32_t*)usartxbase  |= itmask;
LDR	R3, [R1, #0]
ORRS	R3, R0
; itmask end address is: 0 (R0)
STR	R3, [R1, #0]
; usartxbase end address is: 4 (R1)
;stm32f4xx_usart.c,1253 :: 		}
IT	AL
BAL	L_USART_ITConfig73
L_USART_ITConfig72:
;stm32f4xx_usart.c,1256 :: 		*(__IO uint32_t*)usartxbase &= ~itmask;
; usartxbase start address is: 4 (R1)
; itmask start address is: 0 (R0)
MVN	R4, R0
; itmask end address is: 0 (R0)
LDR	R3, [R1, #0]
ANDS	R3, R4
STR	R3, [R1, #0]
; usartxbase end address is: 4 (R1)
;stm32f4xx_usart.c,1257 :: 		}
L_USART_ITConfig73:
;stm32f4xx_usart.c,1258 :: 		}
L_end_USART_ITConfig:
BX	LR
; end of _USART_ITConfig
_USART_GetFlagStatus:
;stm32f4xx_usart.c,1278 :: 		FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, uint16_t USART_FLAG)
; USART_FLAG start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_FLAG end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_FLAG start address is: 4 (R1)
;stm32f4xx_usart.c,1280 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_usart.c,1286 :: 		if (USART_FLAG == USART_FLAG_CTS)
CMP	R1, #512
IT	NE
BNE	L_USART_GetFlagStatus74
;stm32f4xx_usart.c,1289 :: 		}
L_USART_GetFlagStatus74:
;stm32f4xx_usart.c,1291 :: 		if ((USARTx->SR & USART_FLAG) != (uint16_t)RESET)
LDRH	R2, [R0, #0]
; USARTx end address is: 0 (R0)
ANDS	R2, R1
UXTH	R2, R2
; USART_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_USART_GetFlagStatus75
;stm32f4xx_usart.c,1293 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_usart.c,1294 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_USART_GetFlagStatus76
L_USART_GetFlagStatus75:
;stm32f4xx_usart.c,1297 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_usart.c,1298 :: 		}
L_USART_GetFlagStatus76:
;stm32f4xx_usart.c,1299 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_usart.c,1300 :: 		}
L_end_USART_GetFlagStatus:
BX	LR
; end of _USART_GetFlagStatus
_USART_ClearFlag:
;stm32f4xx_usart.c,1327 :: 		void USART_ClearFlag(USART_TypeDef* USARTx, uint16_t USART_FLAG)
; USART_FLAG start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_FLAG end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_FLAG start address is: 4 (R1)
;stm32f4xx_usart.c,1334 :: 		if ((USART_FLAG & USART_FLAG_CTS) == USART_FLAG_CTS)
AND	R2, R1, #512
UXTH	R2, R2
CMP	R2, #512
IT	NE
BNE	L_USART_ClearFlag77
;stm32f4xx_usart.c,1337 :: 		}
L_USART_ClearFlag77:
;stm32f4xx_usart.c,1339 :: 		USARTx->SR = (uint16_t)~USART_FLAG;
MVN	R2, R1
; USART_FLAG end address is: 4 (R1)
STRH	R2, [R0, #0]
; USARTx end address is: 0 (R0)
;stm32f4xx_usart.c,1340 :: 		}
L_end_USART_ClearFlag:
BX	LR
; end of _USART_ClearFlag
_USART_GetITStatus:
;stm32f4xx_usart.c,1361 :: 		ITStatus USART_GetITStatus(USART_TypeDef* USARTx, uint16_t USART_IT)
; USART_IT start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_IT end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_IT start address is: 4 (R1)
;stm32f4xx_usart.c,1363 :: 		uint32_t bitpos = 0x00, itmask = 0x00, usartreg = 0x00;
;stm32f4xx_usart.c,1364 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_usart.c,1370 :: 		if (USART_IT == USART_IT_CTS)
MOVW	R2, #2410
CMP	R1, R2
IT	NE
BNE	L_USART_GetITStatus78
;stm32f4xx_usart.c,1373 :: 		}
L_USART_GetITStatus78:
;stm32f4xx_usart.c,1376 :: 		usartreg = (((uint8_t)USART_IT) >> 0x05);
UXTB	R2, R1
LSRS	R2, R2, #5
UXTB	R2, R2
; usartreg start address is: 12 (R3)
UXTB	R3, R2
;stm32f4xx_usart.c,1378 :: 		itmask = USART_IT & IT_MASK;
AND	R4, R1, #31
; itmask start address is: 16 (R4)
UXTH	R4, R4
;stm32f4xx_usart.c,1379 :: 		itmask = (uint32_t)0x01 << itmask;
MOV	R2, #1
LSL	R4, R2, R4
;stm32f4xx_usart.c,1381 :: 		if (usartreg == 0x01) /* The IT  is in CR1 register */
CMP	R3, #1
IT	NE
BNE	L_USART_GetITStatus79
; usartreg end address is: 12 (R3)
;stm32f4xx_usart.c,1383 :: 		itmask &= USARTx->CR1;
ADDW	R2, R0, #12
LDRH	R2, [R2, #0]
ANDS	R4, R2
;stm32f4xx_usart.c,1384 :: 		}
IT	AL
BAL	L_USART_GetITStatus80
L_USART_GetITStatus79:
;stm32f4xx_usart.c,1385 :: 		else if (usartreg == 0x02) /* The IT  is in CR2 register */
; usartreg start address is: 12 (R3)
CMP	R3, #2
IT	NE
BNE	L_USART_GetITStatus81
; usartreg end address is: 12 (R3)
;stm32f4xx_usart.c,1387 :: 		itmask &= USARTx->CR2;
ADDW	R2, R0, #16
LDRH	R2, [R2, #0]
AND	R2, R4, R2, LSL #0
; itmask end address is: 16 (R4)
; itmask start address is: 8 (R2)
;stm32f4xx_usart.c,1388 :: 		}
MOV	R4, R2
; itmask end address is: 8 (R2)
IT	AL
BAL	L_USART_GetITStatus82
L_USART_GetITStatus81:
;stm32f4xx_usart.c,1391 :: 		itmask &= USARTx->CR3;
; itmask start address is: 16 (R4)
ADDW	R2, R0, #20
LDRH	R2, [R2, #0]
AND	R2, R4, R2, LSL #0
; itmask end address is: 16 (R4)
; itmask start address is: 12 (R3)
MOV	R3, R2
; itmask end address is: 12 (R3)
MOV	R4, R3
;stm32f4xx_usart.c,1392 :: 		}
L_USART_GetITStatus82:
; itmask start address is: 16 (R4)
; itmask end address is: 16 (R4)
L_USART_GetITStatus80:
;stm32f4xx_usart.c,1394 :: 		bitpos = USART_IT >> 0x08;
; itmask start address is: 16 (R4)
LSRS	R2, R1, #8
UXTH	R2, R2
; USART_IT end address is: 4 (R1)
; bitpos start address is: 4 (R1)
UXTH	R1, R2
;stm32f4xx_usart.c,1395 :: 		bitpos = (uint32_t)0x01 << bitpos;
MOV	R2, #1
LSL	R3, R2, R1
; bitpos end address is: 4 (R1)
;stm32f4xx_usart.c,1396 :: 		bitpos &= USARTx->SR;
LDRH	R2, [R0, #0]
; USARTx end address is: 0 (R0)
AND	R2, R3, R2, LSL #0
; bitpos start address is: 0 (R0)
MOV	R0, R2
;stm32f4xx_usart.c,1397 :: 		if ((itmask != (uint16_t)RESET)&&(bitpos != (uint16_t)RESET))
CMP	R4, #0
IT	EQ
BEQ	L__USART_GetITStatus100
; itmask end address is: 16 (R4)
CMP	R0, #0
IT	EQ
BEQ	L__USART_GetITStatus99
; bitpos end address is: 0 (R0)
L__USART_GetITStatus98:
;stm32f4xx_usart.c,1399 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_usart.c,1400 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_USART_GetITStatus86
;stm32f4xx_usart.c,1397 :: 		if ((itmask != (uint16_t)RESET)&&(bitpos != (uint16_t)RESET))
L__USART_GetITStatus100:
L__USART_GetITStatus99:
;stm32f4xx_usart.c,1403 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_usart.c,1404 :: 		}
L_USART_GetITStatus86:
;stm32f4xx_usart.c,1406 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_usart.c,1407 :: 		}
L_end_USART_GetITStatus:
BX	LR
; end of _USART_GetITStatus
_USART_ClearITPendingBit:
;stm32f4xx_usart.c,1435 :: 		void USART_ClearITPendingBit(USART_TypeDef* USARTx, uint16_t USART_IT)
; USART_IT start address is: 4 (R1)
; USARTx start address is: 0 (R0)
; USART_IT end address is: 4 (R1)
; USARTx end address is: 0 (R0)
; USARTx start address is: 0 (R0)
; USART_IT start address is: 4 (R1)
;stm32f4xx_usart.c,1437 :: 		uint16_t bitpos = 0x00, itmask = 0x00;
;stm32f4xx_usart.c,1443 :: 		if (USART_IT == USART_IT_CTS)
MOVW	R2, #2410
CMP	R1, R2
IT	NE
BNE	L_USART_ClearITPendingBit87
;stm32f4xx_usart.c,1446 :: 		}
L_USART_ClearITPendingBit87:
;stm32f4xx_usart.c,1448 :: 		bitpos = USART_IT >> 0x08;
LSRS	R3, R1, #8
UXTH	R3, R3
; USART_IT end address is: 4 (R1)
;stm32f4xx_usart.c,1449 :: 		itmask = ((uint16_t)0x01 << (uint16_t)bitpos);
MOVW	R2, #1
LSLS	R2, R3
UXTH	R2, R2
;stm32f4xx_usart.c,1450 :: 		USARTx->SR = (uint16_t)~itmask;
MVN	R2, R2
STRH	R2, [R0, #0]
; USARTx end address is: 0 (R0)
;stm32f4xx_usart.c,1451 :: 		}
L_end_USART_ClearITPendingBit:
BX	LR
; end of _USART_ClearITPendingBit
