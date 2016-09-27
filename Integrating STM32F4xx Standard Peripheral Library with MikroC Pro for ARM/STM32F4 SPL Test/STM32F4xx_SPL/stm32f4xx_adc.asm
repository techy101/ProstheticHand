stm32f4xx_adc___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_adc___DSB
stm32f4xx_adc___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_adc___WFI
stm32f4xx_adc___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_adc___WFE
stm32f4xx_adc___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_adc___REV
stm32f4xx_adc_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_adc_NVIC_SetPriorityGrouping
stm32f4xx_adc_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_adc_NVIC_GetPriorityGrouping
stm32f4xx_adc_NVIC_EnableIRQ:
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
; end of stm32f4xx_adc_NVIC_EnableIRQ
stm32f4xx_adc_NVIC_DisableIRQ:
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
; end of stm32f4xx_adc_NVIC_DisableIRQ
stm32f4xx_adc_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_adc_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_adc_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_adc_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_adc_NVIC_GetPendingIRQ1
L_stm32f4xx_adc_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_adc_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_adc_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_adc_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_adc_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_adc_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_adc_NVIC_GetPendingIRQ
stm32f4xx_adc_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_adc_NVIC_SetPendingIRQ
stm32f4xx_adc_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_adc_NVIC_ClearPendingIRQ
stm32f4xx_adc_NVIC_GetActive:
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
BEQ	L_stm32f4xx_adc_NVIC_GetActive2
; ?FLOC__stm32f4xx_adc_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_adc_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_adc_NVIC_GetActive3
L_stm32f4xx_adc_NVIC_GetActive2:
; ?FLOC__stm32f4xx_adc_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_adc_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_adc_NVIC_GetActive3:
; ?FLOC__stm32f4xx_adc_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_adc_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_adc_NVIC_GetActive
stm32f4xx_adc_NVIC_SetPriority:
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
BGE	L_stm32f4xx_adc_NVIC_SetPriority4
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
BAL	L_stm32f4xx_adc_NVIC_SetPriority5
L_stm32f4xx_adc_NVIC_SetPriority4:
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
L_stm32f4xx_adc_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_adc_NVIC_SetPriority
stm32f4xx_adc_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_adc_NVIC_GetPriority6
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
L_stm32f4xx_adc_NVIC_GetPriority6:
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
; end of stm32f4xx_adc_NVIC_GetPriority
stm32f4xx_adc_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_adc_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_adc_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_adc_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_adc_NVIC_EncodePriority9
L_stm32f4xx_adc_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_adc_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_adc_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_adc_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_adc_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_adc_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_adc_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_adc_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_adc_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_adc_NVIC_EncodePriority11
L_stm32f4xx_adc_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_adc_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_adc_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_adc_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_adc_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_adc_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_adc_NVIC_EncodePriority
stm32f4xx_adc_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_adc_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_adc_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_adc_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_adc_NVIC_DecodePriority13
L_stm32f4xx_adc_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_adc_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_adc_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_adc_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_adc_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_adc_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_adc_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_adc_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_adc_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_adc_NVIC_DecodePriority15
L_stm32f4xx_adc_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_adc_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_adc_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_adc_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_adc_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_adc_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_adc_NVIC_DecodePriority
stm32f4xx_adc_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_adc___DSB+0
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
BL	stm32f4xx_adc___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_adc_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_adc_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_adc_NVIC_SystemReset
stm32f4xx_adc_SysTick_Config:
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
BLS	L_stm32f4xx_adc_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_adc_SysTick_Config18:
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
BL	stm32f4xx_adc_NVIC_SetPriority+0
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
; end of stm32f4xx_adc_SysTick_Config
stm32f4xx_adc_ITM_SendChar:
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
BEQ	L_stm32f4xx_adc_ITM_SendChar73
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_adc_ITM_SendChar74
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_adc_ITM_SendChar75
L_stm32f4xx_adc_ITM_SendChar69:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_adc_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_adc_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_adc_ITM_SendChar22
L_stm32f4xx_adc_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_adc_ITM_SendChar72
L_stm32f4xx_adc_ITM_SendChar73:
L_stm32f4xx_adc_ITM_SendChar72:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_adc_ITM_SendChar71
L_stm32f4xx_adc_ITM_SendChar74:
L_stm32f4xx_adc_ITM_SendChar71:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_adc_ITM_SendChar70
L_stm32f4xx_adc_ITM_SendChar75:
L_stm32f4xx_adc_ITM_SendChar70:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_adc_ITM_SendChar
stm32f4xx_adc_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_adc_ITM_ReceiveChar24
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
L_stm32f4xx_adc_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_adc_ITM_ReceiveChar
stm32f4xx_adc_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_adc_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_adc_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_adc_ITM_CheckChar
_ADC_DeInit:
;stm32f4xx_adc.c,212 :: 		void ADC_DeInit(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;stm32f4xx_adc.c,215 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_ADC, ENABLE);
MOVS	R1, #1
MOV	R0, #256
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_adc.c,218 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_ADC, DISABLE);
MOVS	R1, #0
MOV	R0, #256
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_adc.c,219 :: 		}
L_end_ADC_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ADC_DeInit
_ADC_Init:
;stm32f4xx_adc.c,234 :: 		void ADC_Init(ADC_TypeDef* ADCx, ADC_InitTypeDef* ADC_InitStruct)
; ADC_InitStruct start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_InitStruct end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_InitStruct start address is: 4 (R1)
;stm32f4xx_adc.c,236 :: 		uint32_t tmpreg1 = 0;
;stm32f4xx_adc.c,237 :: 		uint8_t tmpreg2 = 0;
; ADCx start address is: 24 (R6)
MOVS	R6, #0
;stm32f4xx_adc.c,250 :: 		tmpreg1 = ADCx->CR1;
ADDS	R5, R0, #4
LDR	R3, [R5, #0]
;stm32f4xx_adc.c,253 :: 		tmpreg1 &= CR1_CLEAR_MASK;
MOVW	R2, #65279
MOVT	R2, #64767
AND	R4, R3, R2, LSL #0
;stm32f4xx_adc.c,259 :: 		ADC_InitStruct->ADC_Resolution);
ADDS	R2, R1, #4
LDRB	R2, [R2, #0]
LSLS	R3, R2, #8
LDR	R2, [R1, #0]
ORR	R2, R3, R2, LSL #0
ORR	R2, R4, R2, LSL #0
;stm32f4xx_adc.c,261 :: 		ADCx->CR1 = tmpreg1;
STR	R2, [R5, #0]
;stm32f4xx_adc.c,264 :: 		tmpreg1 = ADCx->CR2;
ADDW	R5, R0, #8
LDR	R3, [R5, #0]
;stm32f4xx_adc.c,267 :: 		tmpreg1 &= CR2_CLEAR_MASK;
MOVW	R2, #63485
MOVT	R2, #49407
AND	R4, R3, R2, LSL #0
;stm32f4xx_adc.c,276 :: 		ADC_InitStruct->ADC_ExternalTrigConv |
ADDW	R2, R1, #16
LDR	R3, [R2, #0]
ADDW	R2, R1, #12
LDR	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_adc.c,278 :: 		((uint32_t)ADC_InitStruct->ADC_ContinuousConvMode << 1));
ADDW	R2, R1, #8
LDR	R2, [R2, #0]
ORRS	R3, R2
ADDS	R2, R1, #5
LDRB	R2, [R2, #0]
LSLS	R2, R2, #1
ORR	R2, R3, R2, LSL #0
ORR	R2, R4, R2, LSL #0
;stm32f4xx_adc.c,281 :: 		ADCx->CR2 = tmpreg1;
STR	R2, [R5, #0]
;stm32f4xx_adc.c,284 :: 		tmpreg1 = ADCx->SQR1;
ADDW	R4, R0, #44
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f4xx_adc.c,287 :: 		tmpreg1 &= SQR1_L_RESET;
MVN	R2, #15728640
ANDS	R3, R2
;stm32f4xx_adc.c,291 :: 		tmpreg2 |= (uint8_t)(ADC_InitStruct->ADC_NbrOfConversion - (uint8_t)1);
ADDW	R2, R1, #20
; ADC_InitStruct end address is: 4 (R1)
LDRB	R2, [R2, #0]
SUBS	R2, R2, #1
UXTB	R2, R2
ORR	R2, R6, R2, LSL #0
UXTB	R2, R2
; ADCx end address is: 24 (R6)
;stm32f4xx_adc.c,292 :: 		tmpreg1 |= ((uint32_t)tmpreg2 << 20);
LSLS	R2, R2, #20
ORR	R2, R3, R2, LSL #0
;stm32f4xx_adc.c,295 :: 		ADCx->SQR1 = tmpreg1;
STR	R2, [R4, #0]
;stm32f4xx_adc.c,296 :: 		}
L_end_ADC_Init:
BX	LR
; end of _ADC_Init
_ADC_StructInit:
;stm32f4xx_adc.c,309 :: 		void ADC_StructInit(ADC_InitTypeDef* ADC_InitStruct)
; ADC_InitStruct start address is: 0 (R0)
; ADC_InitStruct end address is: 0 (R0)
; ADC_InitStruct start address is: 0 (R0)
;stm32f4xx_adc.c,312 :: 		ADC_InitStruct->ADC_Resolution = ADC_Resolution_12b;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_adc.c,315 :: 		ADC_InitStruct->ADC_ScanConvMode = DISABLE;
ADDS	R2, R0, #4
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_adc.c,318 :: 		ADC_InitStruct->ADC_ContinuousConvMode = DISABLE;
ADDS	R2, R0, #5
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_adc.c,321 :: 		ADC_InitStruct->ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge_None;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_adc.c,324 :: 		ADC_InitStruct->ADC_ExternalTrigConv = ADC_ExternalTrigConv_T1_CC1;
ADDW	R2, R0, #12
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_adc.c,327 :: 		ADC_InitStruct->ADC_DataAlign = ADC_DataAlign_Right;
ADDW	R2, R0, #16
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_adc.c,330 :: 		ADC_InitStruct->ADC_NbrOfConversion = 1;
ADDW	R2, R0, #20
; ADC_InitStruct end address is: 0 (R0)
MOVS	R1, #1
STRB	R1, [R2, #0]
;stm32f4xx_adc.c,331 :: 		}
L_end_ADC_StructInit:
BX	LR
; end of _ADC_StructInit
_ADC_CommonInit:
;stm32f4xx_adc.c,340 :: 		void ADC_CommonInit(ADC_CommonInitTypeDef* ADC_CommonInitStruct)
; ADC_CommonInitStruct start address is: 0 (R0)
; ADC_CommonInitStruct end address is: 0 (R0)
; ADC_CommonInitStruct start address is: 0 (R0)
;stm32f4xx_adc.c,342 :: 		uint32_t tmpreg1 = 0;
;stm32f4xx_adc.c,353 :: 		tmpreg1 &= CR_CLEAR_MASK;
MOVW	R4, #8964
MOVT	R4, #16385
LDR	R2, [R4, #0]
MOVW	R1, #12512
MOVT	R1, #65532
AND	R3, R2, R1, LSL #0
;stm32f4xx_adc.c,361 :: 		tmpreg1 |= (uint32_t)(ADC_CommonInitStruct->ADC_Mode |
LDR	R2, [R0, #0]
;stm32f4xx_adc.c,362 :: 		ADC_CommonInitStruct->ADC_Prescaler |
ADDS	R1, R0, #4
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_adc.c,363 :: 		ADC_CommonInitStruct->ADC_DMAAccessMode |
ADDW	R1, R0, #8
LDR	R1, [R1, #0]
ORRS	R2, R1
;stm32f4xx_adc.c,364 :: 		ADC_CommonInitStruct->ADC_TwoSamplingDelay);
ADDW	R1, R0, #12
; ADC_CommonInitStruct end address is: 0 (R0)
LDR	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
ORR	R1, R3, R1, LSL #0
;stm32f4xx_adc.c,367 :: 		ADC->CCR = tmpreg1;
STR	R1, [R4, #0]
;stm32f4xx_adc.c,368 :: 		}
L_end_ADC_CommonInit:
BX	LR
; end of _ADC_CommonInit
_ADC_CommonStructInit:
;stm32f4xx_adc.c,376 :: 		void ADC_CommonStructInit(ADC_CommonInitTypeDef* ADC_CommonInitStruct)
; ADC_CommonInitStruct start address is: 0 (R0)
; ADC_CommonInitStruct end address is: 0 (R0)
; ADC_CommonInitStruct start address is: 0 (R0)
;stm32f4xx_adc.c,379 :: 		ADC_CommonInitStruct->ADC_Mode = ADC_Mode_Independent;
MOV	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_adc.c,382 :: 		ADC_CommonInitStruct->ADC_Prescaler = ADC_Prescaler_Div2;
ADDS	R2, R0, #4
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_adc.c,385 :: 		ADC_CommonInitStruct->ADC_DMAAccessMode = ADC_DMAAccessMode_Disabled;
ADDW	R2, R0, #8
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_adc.c,388 :: 		ADC_CommonInitStruct->ADC_TwoSamplingDelay = ADC_TwoSamplingDelay_5Cycles;
ADDW	R2, R0, #12
; ADC_CommonInitStruct end address is: 0 (R0)
MOV	R1, #0
STR	R1, [R2, #0]
;stm32f4xx_adc.c,389 :: 		}
L_end_ADC_CommonStructInit:
BX	LR
; end of _ADC_CommonStructInit
_ADC_Cmd:
;stm32f4xx_adc.c,398 :: 		void ADC_Cmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_adc.c,403 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_Cmd27
; NewState end address is: 4 (R1)
;stm32f4xx_adc.c,406 :: 		ADCx->CR2 |= (uint32_t)ADC_CR2_ADON;
ADDW	R3, R0, #8
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #1
STR	R2, [R3, #0]
;stm32f4xx_adc.c,407 :: 		}
IT	AL
BAL	L_ADC_Cmd28
L_ADC_Cmd27:
;stm32f4xx_adc.c,411 :: 		ADCx->CR2 &= (uint32_t)(~ADC_CR2_ADON);
; ADCx start address is: 0 (R0)
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #1
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_adc.c,412 :: 		}
L_ADC_Cmd28:
;stm32f4xx_adc.c,413 :: 		}
L_end_ADC_Cmd:
BX	LR
; end of _ADC_Cmd
_ADC_AnalogWatchdogCmd:
;stm32f4xx_adc.c,456 :: 		void ADC_AnalogWatchdogCmd(ADC_TypeDef* ADCx, uint32_t ADC_AnalogWatchdog)
; ADC_AnalogWatchdog start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_AnalogWatchdog end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_AnalogWatchdog start address is: 4 (R1)
;stm32f4xx_adc.c,458 :: 		uint32_t tmpreg = 0;
;stm32f4xx_adc.c,464 :: 		tmpreg = ADCx->CR1;
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f4xx_adc.c,467 :: 		tmpreg &= CR1_AWDMode_RESET;
MOVW	R2, #65023
MOVT	R2, #65343
AND	R2, R3, R2, LSL #0
;stm32f4xx_adc.c,470 :: 		tmpreg |= ADC_AnalogWatchdog;
ORRS	R2, R1
; ADC_AnalogWatchdog end address is: 4 (R1)
;stm32f4xx_adc.c,473 :: 		ADCx->CR1 = tmpreg;
STR	R2, [R4, #0]
;stm32f4xx_adc.c,474 :: 		}
L_end_ADC_AnalogWatchdogCmd:
BX	LR
; end of _ADC_AnalogWatchdogCmd
_ADC_AnalogWatchdogThresholdsConfig:
;stm32f4xx_adc.c,486 :: 		uint16_t LowThreshold)
; LowThreshold start address is: 8 (R2)
; HighThreshold start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; LowThreshold end address is: 8 (R2)
; HighThreshold end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; HighThreshold start address is: 4 (R1)
; LowThreshold start address is: 8 (R2)
;stm32f4xx_adc.c,494 :: 		ADCx->HTR = HighThreshold;
ADDW	R3, R0, #36
STR	R1, [R3, #0]
; HighThreshold end address is: 4 (R1)
;stm32f4xx_adc.c,497 :: 		ADCx->LTR = LowThreshold;
ADDW	R3, R0, #40
; ADCx end address is: 0 (R0)
STR	R2, [R3, #0]
; LowThreshold end address is: 8 (R2)
;stm32f4xx_adc.c,498 :: 		}
L_end_ADC_AnalogWatchdogThresholdsConfig:
BX	LR
; end of _ADC_AnalogWatchdogThresholdsConfig
_ADC_AnalogWatchdogSingleChannelConfig:
;stm32f4xx_adc.c,526 :: 		void ADC_AnalogWatchdogSingleChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel)
; ADC_Channel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_Channel end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_Channel start address is: 4 (R1)
;stm32f4xx_adc.c,528 :: 		uint32_t tmpreg = 0;
;stm32f4xx_adc.c,534 :: 		tmpreg = ADCx->CR1;
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f4xx_adc.c,537 :: 		tmpreg &= CR1_AWDCH_RESET;
MVN	R2, #31
AND	R2, R3, R2, LSL #0
;stm32f4xx_adc.c,540 :: 		tmpreg |= ADC_Channel;
ORRS	R2, R1
; ADC_Channel end address is: 4 (R1)
;stm32f4xx_adc.c,543 :: 		ADCx->CR1 = tmpreg;
STR	R2, [R4, #0]
;stm32f4xx_adc.c,544 :: 		}
L_end_ADC_AnalogWatchdogSingleChannelConfig:
BX	LR
; end of _ADC_AnalogWatchdogSingleChannelConfig
_ADC_TempSensorVrefintCmd:
;stm32f4xx_adc.c,591 :: 		void ADC_TempSensorVrefintCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_adc.c,595 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_ADC_TempSensorVrefintCmd29
; NewState end address is: 0 (R0)
;stm32f4xx_adc.c,598 :: 		ADC->CCR |= (uint32_t)ADC_CCR_TSVREFE;
MOVW	R2, #8964
MOVT	R2, #16385
LDR	R1, [R2, #0]
ORR	R1, R1, #8388608
STR	R1, [R2, #0]
;stm32f4xx_adc.c,599 :: 		}
IT	AL
BAL	L_ADC_TempSensorVrefintCmd30
L_ADC_TempSensorVrefintCmd29:
;stm32f4xx_adc.c,603 :: 		ADC->CCR &= (uint32_t)(~ADC_CCR_TSVREFE);
MOVW	R3, #8964
MOVT	R3, #16385
LDR	R2, [R3, #0]
MVN	R1, #8388608
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_adc.c,604 :: 		}
L_ADC_TempSensorVrefintCmd30:
;stm32f4xx_adc.c,605 :: 		}
L_end_ADC_TempSensorVrefintCmd:
BX	LR
; end of _ADC_TempSensorVrefintCmd
_ADC_VBATCmd:
;stm32f4xx_adc.c,613 :: 		void ADC_VBATCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_adc.c,617 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_ADC_VBATCmd31
; NewState end address is: 0 (R0)
;stm32f4xx_adc.c,620 :: 		ADC->CCR |= (uint32_t)ADC_CCR_VBATE;
MOVW	R2, #8964
MOVT	R2, #16385
LDR	R1, [R2, #0]
ORR	R1, R1, #4194304
STR	R1, [R2, #0]
;stm32f4xx_adc.c,621 :: 		}
IT	AL
BAL	L_ADC_VBATCmd32
L_ADC_VBATCmd31:
;stm32f4xx_adc.c,625 :: 		ADC->CCR &= (uint32_t)(~ADC_CCR_VBATE);
MOVW	R3, #8964
MOVT	R3, #16385
LDR	R2, [R3, #0]
MVN	R1, #4194304
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_adc.c,626 :: 		}
L_ADC_VBATCmd32:
;stm32f4xx_adc.c,627 :: 		}
L_end_ADC_VBATCmd:
BX	LR
; end of _ADC_VBATCmd
_ADC_RegularChannelConfig:
;stm32f4xx_adc.c,714 :: 		void ADC_RegularChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel, uint8_t Rank, uint8_t ADC_SampleTime)
; ADC_SampleTime start address is: 12 (R3)
; Rank start address is: 8 (R2)
; ADC_Channel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_SampleTime end address is: 12 (R3)
; Rank end address is: 8 (R2)
; ADC_Channel end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_Channel start address is: 4 (R1)
; Rank start address is: 8 (R2)
; ADC_SampleTime start address is: 12 (R3)
;stm32f4xx_adc.c,716 :: 		uint32_t tmpreg1 = 0, tmpreg2 = 0;
;stm32f4xx_adc.c,724 :: 		if (ADC_Channel > ADC_Channel_9)
CMP	R1, #9
IT	LS
BLS	L_ADC_RegularChannelConfig33
;stm32f4xx_adc.c,727 :: 		tmpreg1 = ADCx->SMPR1;
ADD	R8, R0, #12
LDR	R7, [R8, #0]
;stm32f4xx_adc.c,730 :: 		tmpreg2 = SMPR1_SMP_SET << (3 * (ADC_Channel - 10));
SUBW	R5, R1, #10
MOV	R4, #3
MUL	R6, R4, R5
MOV	R4, #7
LSLS	R4, R6
;stm32f4xx_adc.c,733 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R5, R7, R4, LSL #0
;stm32f4xx_adc.c,736 :: 		tmpreg2 = (uint32_t)ADC_SampleTime << (3 * (ADC_Channel - 10));
UXTB	R4, R3
; ADC_SampleTime end address is: 12 (R3)
LSLS	R4, R6
;stm32f4xx_adc.c,739 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f4xx_adc.c,742 :: 		ADCx->SMPR1 = tmpreg1;
STR	R4, [R8, #0]
;stm32f4xx_adc.c,743 :: 		}
IT	AL
BAL	L_ADC_RegularChannelConfig34
L_ADC_RegularChannelConfig33:
;stm32f4xx_adc.c,747 :: 		tmpreg1 = ADCx->SMPR2;
; ADC_SampleTime start address is: 12 (R3)
ADDW	R7, R0, #16
LDR	R5, [R7, #0]
;stm32f4xx_adc.c,750 :: 		tmpreg2 = SMPR2_SMP_SET << (3 * ADC_Channel);
MOV	R4, #3
MUL	R6, R4, R1
MOV	R4, #7
LSLS	R4, R6
;stm32f4xx_adc.c,753 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
ANDS	R5, R4
;stm32f4xx_adc.c,756 :: 		tmpreg2 = (uint32_t)ADC_SampleTime << (3 * ADC_Channel);
UXTB	R4, R3
; ADC_SampleTime end address is: 12 (R3)
LSLS	R4, R6
;stm32f4xx_adc.c,759 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f4xx_adc.c,762 :: 		ADCx->SMPR2 = tmpreg1;
STR	R4, [R7, #0]
;stm32f4xx_adc.c,763 :: 		}
L_ADC_RegularChannelConfig34:
;stm32f4xx_adc.c,765 :: 		if (Rank < 7)
CMP	R2, #7
IT	GE
BGE	L_ADC_RegularChannelConfig35
;stm32f4xx_adc.c,768 :: 		tmpreg1 = ADCx->SQR3;
ADD	R8, R0, #52
; ADCx end address is: 0 (R0)
LDR	R7, [R8, #0]
;stm32f4xx_adc.c,771 :: 		tmpreg2 = SQR3_SQ_SET << (5 * (Rank - 1));
SUBS	R5, R2, #1
SXTH	R5, R5
; Rank end address is: 8 (R2)
MOV	R4, #5
MUL	R6, R4, R5
MOV	R4, #31
LSLS	R4, R6
;stm32f4xx_adc.c,774 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R5, R7, R4, LSL #0
;stm32f4xx_adc.c,777 :: 		tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 1));
UXTB	R4, R1
; ADC_Channel end address is: 4 (R1)
LSLS	R4, R6
;stm32f4xx_adc.c,780 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f4xx_adc.c,783 :: 		ADCx->SQR3 = tmpreg1;
STR	R4, [R8, #0]
;stm32f4xx_adc.c,784 :: 		}
IT	AL
BAL	L_ADC_RegularChannelConfig36
L_ADC_RegularChannelConfig35:
;stm32f4xx_adc.c,786 :: 		else if (Rank < 13)
; Rank start address is: 8 (R2)
; ADC_Channel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
CMP	R2, #13
IT	GE
BGE	L_ADC_RegularChannelConfig37
;stm32f4xx_adc.c,789 :: 		tmpreg1 = ADCx->SQR2;
ADD	R8, R0, #48
; ADCx end address is: 0 (R0)
LDR	R7, [R8, #0]
;stm32f4xx_adc.c,792 :: 		tmpreg2 = SQR2_SQ_SET << (5 * (Rank - 7));
SUBS	R5, R2, #7
; Rank end address is: 8 (R2)
MOV	R4, #5
MUL	R6, R4, R5
MOV	R4, #31
LSLS	R4, R6
;stm32f4xx_adc.c,795 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R5, R7, R4, LSL #0
;stm32f4xx_adc.c,798 :: 		tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 7));
UXTB	R4, R1
; ADC_Channel end address is: 4 (R1)
LSLS	R4, R6
;stm32f4xx_adc.c,801 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f4xx_adc.c,804 :: 		ADCx->SQR2 = tmpreg1;
STR	R4, [R8, #0]
;stm32f4xx_adc.c,805 :: 		}
IT	AL
BAL	L_ADC_RegularChannelConfig38
L_ADC_RegularChannelConfig37:
;stm32f4xx_adc.c,810 :: 		tmpreg1 = ADCx->SQR1;
; Rank start address is: 8 (R2)
; ADC_Channel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
ADD	R8, R0, #44
; ADCx end address is: 0 (R0)
LDR	R7, [R8, #0]
;stm32f4xx_adc.c,813 :: 		tmpreg2 = SQR1_SQ_SET << (5 * (Rank - 13));
SUBW	R5, R2, #13
; Rank end address is: 8 (R2)
MOV	R4, #5
MUL	R6, R4, R5
MOV	R4, #31
LSLS	R4, R6
;stm32f4xx_adc.c,816 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R5, R7, R4, LSL #0
;stm32f4xx_adc.c,819 :: 		tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 13));
UXTB	R4, R1
; ADC_Channel end address is: 4 (R1)
LSLS	R4, R6
;stm32f4xx_adc.c,822 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f4xx_adc.c,825 :: 		ADCx->SQR1 = tmpreg1;
STR	R4, [R8, #0]
;stm32f4xx_adc.c,826 :: 		}
L_ADC_RegularChannelConfig38:
L_ADC_RegularChannelConfig36:
;stm32f4xx_adc.c,827 :: 		}
L_end_ADC_RegularChannelConfig:
BX	LR
; end of _ADC_RegularChannelConfig
_ADC_SoftwareStartConv:
;stm32f4xx_adc.c,834 :: 		void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f4xx_adc.c,840 :: 		ADCx->CR2 |= (uint32_t)ADC_CR2_SWSTART;
ADDW	R2, R0, #8
; ADCx end address is: 0 (R0)
LDR	R1, [R2, #0]
ORR	R1, R1, #1073741824
STR	R1, [R2, #0]
;stm32f4xx_adc.c,841 :: 		}
L_end_ADC_SoftwareStartConv:
BX	LR
; end of _ADC_SoftwareStartConv
_ADC_GetSoftwareStartConvStatus:
;stm32f4xx_adc.c,848 :: 		FlagStatus ADC_GetSoftwareStartConvStatus(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f4xx_adc.c,850 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_adc.c,855 :: 		if ((ADCx->CR2 & ADC_CR2_JSWSTART) != (uint32_t)RESET)
ADDW	R1, R0, #8
; ADCx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #4194304
CMP	R1, #0
IT	EQ
BEQ	L_ADC_GetSoftwareStartConvStatus39
;stm32f4xx_adc.c,858 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_adc.c,859 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_ADC_GetSoftwareStartConvStatus40
L_ADC_GetSoftwareStartConvStatus39:
;stm32f4xx_adc.c,863 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_adc.c,864 :: 		}
L_ADC_GetSoftwareStartConvStatus40:
;stm32f4xx_adc.c,867 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_adc.c,868 :: 		}
L_end_ADC_GetSoftwareStartConvStatus:
BX	LR
; end of _ADC_GetSoftwareStartConvStatus
_ADC_EOCOnEachRegularChannelCmd:
;stm32f4xx_adc.c,878 :: 		void ADC_EOCOnEachRegularChannelCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_adc.c,884 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_EOCOnEachRegularChannelCmd41
; NewState end address is: 4 (R1)
;stm32f4xx_adc.c,887 :: 		ADCx->CR2 |= (uint32_t)ADC_CR2_EOCS;
ADDW	R3, R0, #8
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #1024
STR	R2, [R3, #0]
;stm32f4xx_adc.c,888 :: 		}
IT	AL
BAL	L_ADC_EOCOnEachRegularChannelCmd42
L_ADC_EOCOnEachRegularChannelCmd41:
;stm32f4xx_adc.c,892 :: 		ADCx->CR2 &= (uint32_t)(~ADC_CR2_EOCS);
; ADCx start address is: 0 (R0)
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #1024
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_adc.c,893 :: 		}
L_ADC_EOCOnEachRegularChannelCmd42:
;stm32f4xx_adc.c,894 :: 		}
L_end_ADC_EOCOnEachRegularChannelCmd:
BX	LR
; end of _ADC_EOCOnEachRegularChannelCmd
_ADC_ContinuousModeCmd:
;stm32f4xx_adc.c,903 :: 		void ADC_ContinuousModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_adc.c,909 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_ContinuousModeCmd43
; NewState end address is: 4 (R1)
;stm32f4xx_adc.c,912 :: 		ADCx->CR2 |= (uint32_t)ADC_CR2_CONT;
ADDW	R3, R0, #8
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #2
STR	R2, [R3, #0]
;stm32f4xx_adc.c,913 :: 		}
IT	AL
BAL	L_ADC_ContinuousModeCmd44
L_ADC_ContinuousModeCmd43:
;stm32f4xx_adc.c,917 :: 		ADCx->CR2 &= (uint32_t)(~ADC_CR2_CONT);
; ADCx start address is: 0 (R0)
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #2
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_adc.c,918 :: 		}
L_ADC_ContinuousModeCmd44:
;stm32f4xx_adc.c,919 :: 		}
L_end_ADC_ContinuousModeCmd:
BX	LR
; end of _ADC_ContinuousModeCmd
_ADC_DiscModeChannelCountConfig:
;stm32f4xx_adc.c,929 :: 		void ADC_DiscModeChannelCountConfig(ADC_TypeDef* ADCx, uint8_t Number)
; Number start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; Number end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; Number start address is: 4 (R1)
;stm32f4xx_adc.c,931 :: 		uint32_t tmpreg1 = 0;
;stm32f4xx_adc.c,932 :: 		uint32_t tmpreg2 = 0;
;stm32f4xx_adc.c,939 :: 		tmpreg1 = ADCx->CR1;
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f4xx_adc.c,942 :: 		tmpreg1 &= CR1_DISCNUM_RESET;
MVN	R2, #57344
ANDS	R3, R2
;stm32f4xx_adc.c,945 :: 		tmpreg2 = Number - 1;
SUBS	R2, R1, #1
SXTH	R2, R2
; Number end address is: 4 (R1)
; tmpreg2 start address is: 0 (R0)
SXTH	R0, R2
;stm32f4xx_adc.c,946 :: 		tmpreg1 |= tmpreg2 << 13;
LSLS	R2, R0, #13
; tmpreg2 end address is: 0 (R0)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_adc.c,949 :: 		ADCx->CR1 = tmpreg1;
STR	R2, [R4, #0]
;stm32f4xx_adc.c,950 :: 		}
L_end_ADC_DiscModeChannelCountConfig:
BX	LR
; end of _ADC_DiscModeChannelCountConfig
_ADC_DiscModeCmd:
;stm32f4xx_adc.c,961 :: 		void ADC_DiscModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_adc.c,967 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_DiscModeCmd45
; NewState end address is: 4 (R1)
;stm32f4xx_adc.c,970 :: 		ADCx->CR1 |= (uint32_t)ADC_CR1_DISCEN;
ADDS	R3, R0, #4
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #2048
STR	R2, [R3, #0]
;stm32f4xx_adc.c,971 :: 		}
IT	AL
BAL	L_ADC_DiscModeCmd46
L_ADC_DiscModeCmd45:
;stm32f4xx_adc.c,975 :: 		ADCx->CR1 &= (uint32_t)(~ADC_CR1_DISCEN);
; ADCx start address is: 0 (R0)
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #2048
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_adc.c,976 :: 		}
L_ADC_DiscModeCmd46:
;stm32f4xx_adc.c,977 :: 		}
L_end_ADC_DiscModeCmd:
BX	LR
; end of _ADC_DiscModeCmd
_ADC_GetConversionValue:
;stm32f4xx_adc.c,984 :: 		uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f4xx_adc.c,990 :: 		return (uint16_t) ADCx->DR;
ADDW	R1, R0, #76
; ADCx end address is: 0 (R0)
LDR	R1, [R1, #0]
UXTH	R0, R1
;stm32f4xx_adc.c,991 :: 		}
L_end_ADC_GetConversionValue:
BX	LR
; end of _ADC_GetConversionValue
_ADC_GetMultiModeConversionValue:
;stm32f4xx_adc.c,1005 :: 		uint32_t ADC_GetMultiModeConversionValue(void)
;stm32f4xx_adc.c,1008 :: 		return (*(__IO uint32_t *) CDR_ADDRESS);
MOVW	R0, 1073816328
MOVT	R0, 16385
LDR	R0, [R0, #0]
;stm32f4xx_adc.c,1009 :: 		}
L_end_ADC_GetMultiModeConversionValue:
BX	LR
; end of _ADC_GetMultiModeConversionValue
_ADC_DMACmd:
;stm32f4xx_adc.c,1054 :: 		void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_adc.c,1059 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_DMACmd47
; NewState end address is: 4 (R1)
;stm32f4xx_adc.c,1062 :: 		ADCx->CR2 |= (uint32_t)ADC_CR2_DMA;
ADDW	R3, R0, #8
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #256
STR	R2, [R3, #0]
;stm32f4xx_adc.c,1063 :: 		}
IT	AL
BAL	L_ADC_DMACmd48
L_ADC_DMACmd47:
;stm32f4xx_adc.c,1067 :: 		ADCx->CR2 &= (uint32_t)(~ADC_CR2_DMA);
; ADCx start address is: 0 (R0)
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #256
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_adc.c,1068 :: 		}
L_ADC_DMACmd48:
;stm32f4xx_adc.c,1069 :: 		}
L_end_ADC_DMACmd:
BX	LR
; end of _ADC_DMACmd
_ADC_DMARequestAfterLastTransferCmd:
;stm32f4xx_adc.c,1078 :: 		void ADC_DMARequestAfterLastTransferCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_adc.c,1083 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_DMARequestAfterLastTransferCmd49
; NewState end address is: 4 (R1)
;stm32f4xx_adc.c,1086 :: 		ADCx->CR2 |= (uint32_t)ADC_CR2_DDS;
ADDW	R3, R0, #8
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #512
STR	R2, [R3, #0]
;stm32f4xx_adc.c,1087 :: 		}
IT	AL
BAL	L_ADC_DMARequestAfterLastTransferCmd50
L_ADC_DMARequestAfterLastTransferCmd49:
;stm32f4xx_adc.c,1091 :: 		ADCx->CR2 &= (uint32_t)(~ADC_CR2_DDS);
; ADCx start address is: 0 (R0)
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #512
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_adc.c,1092 :: 		}
L_ADC_DMARequestAfterLastTransferCmd50:
;stm32f4xx_adc.c,1093 :: 		}
L_end_ADC_DMARequestAfterLastTransferCmd:
BX	LR
; end of _ADC_DMARequestAfterLastTransferCmd
_ADC_MultiModeDMARequestAfterLastTransferCmd:
;stm32f4xx_adc.c,1105 :: 		void ADC_MultiModeDMARequestAfterLastTransferCmd(FunctionalState NewState)
; NewState start address is: 0 (R0)
; NewState end address is: 0 (R0)
; NewState start address is: 0 (R0)
;stm32f4xx_adc.c,1109 :: 		if (NewState != DISABLE)
CMP	R0, #0
IT	EQ
BEQ	L_ADC_MultiModeDMARequestAfterLastTransferCmd51
; NewState end address is: 0 (R0)
;stm32f4xx_adc.c,1112 :: 		ADC->CCR |= (uint32_t)ADC_CCR_DDS;
MOVW	R2, #8964
MOVT	R2, #16385
LDR	R1, [R2, #0]
ORR	R1, R1, #8192
STR	R1, [R2, #0]
;stm32f4xx_adc.c,1113 :: 		}
IT	AL
BAL	L_ADC_MultiModeDMARequestAfterLastTransferCmd52
L_ADC_MultiModeDMARequestAfterLastTransferCmd51:
;stm32f4xx_adc.c,1117 :: 		ADC->CCR &= (uint32_t)(~ADC_CCR_DDS);
MOVW	R3, #8964
MOVT	R3, #16385
LDR	R2, [R3, #0]
MVN	R1, #8192
AND	R1, R2, R1, LSL #0
STR	R1, [R3, #0]
;stm32f4xx_adc.c,1118 :: 		}
L_ADC_MultiModeDMARequestAfterLastTransferCmd52:
;stm32f4xx_adc.c,1119 :: 		}
L_end_ADC_MultiModeDMARequestAfterLastTransferCmd:
BX	LR
; end of _ADC_MultiModeDMARequestAfterLastTransferCmd
_ADC_InjectedChannelConfig:
;stm32f4xx_adc.c,1192 :: 		void ADC_InjectedChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel, uint8_t Rank, uint8_t ADC_SampleTime)
; ADC_SampleTime start address is: 12 (R3)
; Rank start address is: 8 (R2)
; ADC_Channel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_SampleTime end address is: 12 (R3)
; Rank end address is: 8 (R2)
; ADC_Channel end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_Channel start address is: 4 (R1)
; Rank start address is: 8 (R2)
; ADC_SampleTime start address is: 12 (R3)
;stm32f4xx_adc.c,1194 :: 		uint32_t tmpreg1 = 0, tmpreg2 = 0, tmpreg3 = 0;
;stm32f4xx_adc.c,1201 :: 		if (ADC_Channel > ADC_Channel_9)
CMP	R1, #9
IT	LS
BLS	L_ADC_InjectedChannelConfig53
;stm32f4xx_adc.c,1204 :: 		tmpreg1 = ADCx->SMPR1;
ADD	R8, R0, #12
LDR	R7, [R8, #0]
;stm32f4xx_adc.c,1206 :: 		tmpreg2 = SMPR1_SMP_SET << (3*(ADC_Channel - 10));
SUBW	R5, R1, #10
MOV	R4, #3
MUL	R6, R4, R5
MOV	R4, #7
LSLS	R4, R6
;stm32f4xx_adc.c,1208 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R5, R7, R4, LSL #0
;stm32f4xx_adc.c,1210 :: 		tmpreg2 = (uint32_t)ADC_SampleTime << (3*(ADC_Channel - 10));
UXTB	R4, R3
; ADC_SampleTime end address is: 12 (R3)
LSLS	R4, R6
;stm32f4xx_adc.c,1212 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f4xx_adc.c,1214 :: 		ADCx->SMPR1 = tmpreg1;
STR	R4, [R8, #0]
;stm32f4xx_adc.c,1215 :: 		}
IT	AL
BAL	L_ADC_InjectedChannelConfig54
L_ADC_InjectedChannelConfig53:
;stm32f4xx_adc.c,1219 :: 		tmpreg1 = ADCx->SMPR2;
; ADC_SampleTime start address is: 12 (R3)
ADDW	R7, R0, #16
LDR	R5, [R7, #0]
;stm32f4xx_adc.c,1221 :: 		tmpreg2 = SMPR2_SMP_SET << (3 * ADC_Channel);
MOV	R4, #3
MUL	R6, R4, R1
MOV	R4, #7
LSLS	R4, R6
;stm32f4xx_adc.c,1223 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
ANDS	R5, R4
;stm32f4xx_adc.c,1225 :: 		tmpreg2 = (uint32_t)ADC_SampleTime << (3 * ADC_Channel);
UXTB	R4, R3
; ADC_SampleTime end address is: 12 (R3)
LSLS	R4, R6
;stm32f4xx_adc.c,1227 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R5, R4, LSL #0
;stm32f4xx_adc.c,1229 :: 		ADCx->SMPR2 = tmpreg1;
STR	R4, [R7, #0]
;stm32f4xx_adc.c,1230 :: 		}
L_ADC_InjectedChannelConfig54:
;stm32f4xx_adc.c,1233 :: 		tmpreg1 = ADCx->JSQR;
ADD	R9, R0, #56
; ADCx end address is: 0 (R0)
LDR	R6, [R9, #0]
;stm32f4xx_adc.c,1235 :: 		tmpreg3 =  (tmpreg1 & JSQR_JL_SET)>> 20;
AND	R4, R6, #3145728
LSRS	R4, R4, #20
;stm32f4xx_adc.c,1237 :: 		tmpreg2 = JSQR_JSQ_SET << (5 * (uint8_t)((Rank + 3) - (tmpreg3 + 1)));
ADDS	R5, R2, #3
; Rank end address is: 8 (R2)
ADDS	R4, R4, #1
SUB	R8, R5, R4, LSL #0
UXTB	R5, R8
MOV	R4, #5
MULS	R5, R4, R5
MOV	R4, #31
LSLS	R4, R5
;stm32f4xx_adc.c,1239 :: 		tmpreg1 &= ~tmpreg2;
MVN	R4, R4
AND	R7, R6, R4, LSL #0
;stm32f4xx_adc.c,1241 :: 		tmpreg2 = (uint32_t)ADC_Channel << (5 * (uint8_t)((Rank + 3) - (tmpreg3 + 1)));
UXTB	R6, R1
; ADC_Channel end address is: 4 (R1)
UXTB	R5, R8
MOV	R4, #5
MULS	R4, R5, R4
LSL	R4, R6, R4
;stm32f4xx_adc.c,1243 :: 		tmpreg1 |= tmpreg2;
ORR	R4, R7, R4, LSL #0
;stm32f4xx_adc.c,1245 :: 		ADCx->JSQR = tmpreg1;
STR	R4, [R9, #0]
;stm32f4xx_adc.c,1246 :: 		}
L_end_ADC_InjectedChannelConfig:
BX	LR
; end of _ADC_InjectedChannelConfig
_ADC_InjectedSequencerLengthConfig:
;stm32f4xx_adc.c,1255 :: 		void ADC_InjectedSequencerLengthConfig(ADC_TypeDef* ADCx, uint8_t Length)
; Length start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; Length end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; Length start address is: 4 (R1)
;stm32f4xx_adc.c,1257 :: 		uint32_t tmpreg1 = 0;
;stm32f4xx_adc.c,1258 :: 		uint32_t tmpreg2 = 0;
;stm32f4xx_adc.c,1264 :: 		tmpreg1 = ADCx->JSQR;
ADDW	R4, R0, #56
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f4xx_adc.c,1267 :: 		tmpreg1 &= JSQR_JL_RESET;
MVN	R2, #3145728
ANDS	R3, R2
;stm32f4xx_adc.c,1270 :: 		tmpreg2 = Length - 1;
SUBS	R2, R1, #1
SXTH	R2, R2
; Length end address is: 4 (R1)
; tmpreg2 start address is: 0 (R0)
SXTH	R0, R2
;stm32f4xx_adc.c,1271 :: 		tmpreg1 |= tmpreg2 << 20;
LSLS	R2, R0, #20
; tmpreg2 end address is: 0 (R0)
ORR	R2, R3, R2, LSL #0
;stm32f4xx_adc.c,1274 :: 		ADCx->JSQR = tmpreg1;
STR	R2, [R4, #0]
;stm32f4xx_adc.c,1275 :: 		}
L_end_ADC_InjectedSequencerLengthConfig:
BX	LR
; end of _ADC_InjectedSequencerLengthConfig
_ADC_SetInjectedOffset:
;stm32f4xx_adc.c,1290 :: 		void ADC_SetInjectedOffset(ADC_TypeDef* ADCx, uint8_t ADC_InjectedChannel, uint16_t Offset)
; Offset start address is: 8 (R2)
; ADC_InjectedChannel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
MOV	R3, R0
; Offset end address is: 8 (R2)
; ADC_InjectedChannel end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 12 (R3)
; ADC_InjectedChannel start address is: 4 (R1)
; Offset start address is: 8 (R2)
;stm32f4xx_adc.c,1292 :: 		__IO uint32_t tmp = 0;
;stm32f4xx_adc.c,1298 :: 		tmp = (uint32_t)ADCx;
; tmp start address is: 0 (R0)
MOV	R0, R3
; ADCx end address is: 12 (R3)
;stm32f4xx_adc.c,1299 :: 		tmp += ADC_InjectedChannel;
ADDS	R0, R0, R1
; ADC_InjectedChannel end address is: 4 (R1)
;stm32f4xx_adc.c,1302 :: 		*(__IO uint32_t *) tmp = (uint32_t)Offset;
MOV	R4, R0
; tmp end address is: 0 (R0)
UXTH	R3, R2
; Offset end address is: 8 (R2)
STR	R3, [R4, #0]
;stm32f4xx_adc.c,1303 :: 		}
L_end_ADC_SetInjectedOffset:
BX	LR
; end of _ADC_SetInjectedOffset
_ADC_ExternalTrigInjectedConvConfig:
;stm32f4xx_adc.c,1328 :: 		void ADC_ExternalTrigInjectedConvConfig(ADC_TypeDef* ADCx, uint32_t ADC_ExternalTrigInjecConv)
; ADC_ExternalTrigInjecConv start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_ExternalTrigInjecConv end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_ExternalTrigInjecConv start address is: 4 (R1)
;stm32f4xx_adc.c,1330 :: 		uint32_t tmpreg = 0;
;stm32f4xx_adc.c,1336 :: 		tmpreg = ADCx->CR2;
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f4xx_adc.c,1339 :: 		tmpreg &= CR2_JEXTSEL_RESET;
MVN	R2, #983040
AND	R2, R3, R2, LSL #0
;stm32f4xx_adc.c,1342 :: 		tmpreg |= ADC_ExternalTrigInjecConv;
ORRS	R2, R1
; ADC_ExternalTrigInjecConv end address is: 4 (R1)
;stm32f4xx_adc.c,1345 :: 		ADCx->CR2 = tmpreg;
STR	R2, [R4, #0]
;stm32f4xx_adc.c,1346 :: 		}
L_end_ADC_ExternalTrigInjectedConvConfig:
BX	LR
; end of _ADC_ExternalTrigInjectedConvConfig
_ADC_ExternalTrigInjectedConvEdgeConfig:
;stm32f4xx_adc.c,1362 :: 		void ADC_ExternalTrigInjectedConvEdgeConfig(ADC_TypeDef* ADCx, uint32_t ADC_ExternalTrigInjecConvEdge)
; ADC_ExternalTrigInjecConvEdge start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_ExternalTrigInjecConvEdge end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_ExternalTrigInjecConvEdge start address is: 4 (R1)
;stm32f4xx_adc.c,1364 :: 		uint32_t tmpreg = 0;
;stm32f4xx_adc.c,1369 :: 		tmpreg = ADCx->CR2;
ADDW	R4, R0, #8
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
;stm32f4xx_adc.c,1371 :: 		tmpreg &= CR2_JEXTEN_RESET;
MVN	R2, #3145728
AND	R2, R3, R2, LSL #0
;stm32f4xx_adc.c,1373 :: 		tmpreg |= ADC_ExternalTrigInjecConvEdge;
ORRS	R2, R1
; ADC_ExternalTrigInjecConvEdge end address is: 4 (R1)
;stm32f4xx_adc.c,1375 :: 		ADCx->CR2 = tmpreg;
STR	R2, [R4, #0]
;stm32f4xx_adc.c,1376 :: 		}
L_end_ADC_ExternalTrigInjectedConvEdgeConfig:
BX	LR
; end of _ADC_ExternalTrigInjectedConvEdgeConfig
_ADC_SoftwareStartInjectedConv:
;stm32f4xx_adc.c,1383 :: 		void ADC_SoftwareStartInjectedConv(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f4xx_adc.c,1388 :: 		ADCx->CR2 |= (uint32_t)ADC_CR2_JSWSTART;
ADDW	R2, R0, #8
; ADCx end address is: 0 (R0)
LDR	R1, [R2, #0]
ORR	R1, R1, #4194304
STR	R1, [R2, #0]
;stm32f4xx_adc.c,1389 :: 		}
L_end_ADC_SoftwareStartInjectedConv:
BX	LR
; end of _ADC_SoftwareStartInjectedConv
_ADC_GetSoftwareStartInjectedConvCmdStatus:
;stm32f4xx_adc.c,1396 :: 		FlagStatus ADC_GetSoftwareStartInjectedConvCmdStatus(ADC_TypeDef* ADCx)
; ADCx start address is: 0 (R0)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
;stm32f4xx_adc.c,1398 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_adc.c,1403 :: 		if ((ADCx->CR2 & ADC_CR2_JSWSTART) != (uint32_t)RESET)
ADDW	R1, R0, #8
; ADCx end address is: 0 (R0)
LDR	R1, [R1, #0]
AND	R1, R1, #4194304
CMP	R1, #0
IT	EQ
BEQ	L_ADC_GetSoftwareStartInjectedConvCmdStatus55
;stm32f4xx_adc.c,1406 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_adc.c,1407 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_ADC_GetSoftwareStartInjectedConvCmdStatus56
L_ADC_GetSoftwareStartInjectedConvCmdStatus55:
;stm32f4xx_adc.c,1411 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_adc.c,1412 :: 		}
L_ADC_GetSoftwareStartInjectedConvCmdStatus56:
;stm32f4xx_adc.c,1414 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_adc.c,1415 :: 		}
L_end_ADC_GetSoftwareStartInjectedConvCmdStatus:
BX	LR
; end of _ADC_GetSoftwareStartInjectedConvCmdStatus
_ADC_AutoInjectedConvCmd:
;stm32f4xx_adc.c,1425 :: 		void ADC_AutoInjectedConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_adc.c,1430 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_AutoInjectedConvCmd57
; NewState end address is: 4 (R1)
;stm32f4xx_adc.c,1433 :: 		ADCx->CR1 |= (uint32_t)ADC_CR1_JAUTO;
ADDS	R3, R0, #4
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #1024
STR	R2, [R3, #0]
;stm32f4xx_adc.c,1434 :: 		}
IT	AL
BAL	L_ADC_AutoInjectedConvCmd58
L_ADC_AutoInjectedConvCmd57:
;stm32f4xx_adc.c,1438 :: 		ADCx->CR1 &= (uint32_t)(~ADC_CR1_JAUTO);
; ADCx start address is: 0 (R0)
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #1024
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_adc.c,1439 :: 		}
L_ADC_AutoInjectedConvCmd58:
;stm32f4xx_adc.c,1440 :: 		}
L_end_ADC_AutoInjectedConvCmd:
BX	LR
; end of _ADC_AutoInjectedConvCmd
_ADC_InjectedDiscModeCmd:
;stm32f4xx_adc.c,1451 :: 		void ADC_InjectedDiscModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_adc.c,1456 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_ADC_InjectedDiscModeCmd59
; NewState end address is: 4 (R1)
;stm32f4xx_adc.c,1459 :: 		ADCx->CR1 |= (uint32_t)ADC_CR1_JDISCEN;
ADDS	R3, R0, #4
; ADCx end address is: 0 (R0)
LDR	R2, [R3, #0]
ORR	R2, R2, #4096
STR	R2, [R3, #0]
;stm32f4xx_adc.c,1460 :: 		}
IT	AL
BAL	L_ADC_InjectedDiscModeCmd60
L_ADC_InjectedDiscModeCmd59:
;stm32f4xx_adc.c,1464 :: 		ADCx->CR1 &= (uint32_t)(~ADC_CR1_JDISCEN);
; ADCx start address is: 0 (R0)
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
MVN	R2, #4096
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_adc.c,1465 :: 		}
L_ADC_InjectedDiscModeCmd60:
;stm32f4xx_adc.c,1466 :: 		}
L_end_ADC_InjectedDiscModeCmd:
BX	LR
; end of _ADC_InjectedDiscModeCmd
_ADC_GetInjectedConversionValue:
;stm32f4xx_adc.c,1479 :: 		uint16_t ADC_GetInjectedConversionValue(ADC_TypeDef* ADCx, uint8_t ADC_InjectedChannel)
; ADC_InjectedChannel start address is: 4 (R1)
; ADCx start address is: 0 (R0)
MOV	R2, R0
; ADC_InjectedChannel end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 8 (R2)
; ADC_InjectedChannel start address is: 4 (R1)
;stm32f4xx_adc.c,1481 :: 		__IO uint32_t tmp = 0;
;stm32f4xx_adc.c,1487 :: 		tmp = (uint32_t)ADCx;
; tmp start address is: 0 (R0)
MOV	R0, R2
; ADCx end address is: 8 (R2)
;stm32f4xx_adc.c,1488 :: 		tmp += ADC_InjectedChannel + JDR_OFFSET;
ADDW	R2, R1, #40
SXTH	R2, R2
; ADC_InjectedChannel end address is: 4 (R1)
ADDS	R0, R0, R2
;stm32f4xx_adc.c,1491 :: 		return (uint16_t) (*(__IO uint32_t*)  tmp);
MOV	R2, R0
; tmp end address is: 0 (R0)
LDR	R2, [R2, #0]
UXTH	R2, R2
UXTH	R0, R2
;stm32f4xx_adc.c,1492 :: 		}
L_end_ADC_GetInjectedConversionValue:
BX	LR
; end of _ADC_GetInjectedConversionValue
_ADC_ITConfig:
;stm32f4xx_adc.c,1587 :: 		void ADC_ITConfig(ADC_TypeDef* ADCx, uint16_t ADC_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; ADC_IT start address is: 4 (R1)
; ADCx start address is: 0 (R0)
UXTH	R3, R1
; NewState end address is: 8 (R2)
; ADC_IT end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_IT start address is: 12 (R3)
; NewState start address is: 8 (R2)
;stm32f4xx_adc.c,1589 :: 		uint32_t itmask = 0;
;stm32f4xx_adc.c,1596 :: 		itmask = (uint8_t)ADC_IT;
; itmask start address is: 4 (R1)
UXTB	R1, R3
; ADC_IT end address is: 12 (R3)
;stm32f4xx_adc.c,1597 :: 		itmask = (uint32_t)0x01 << itmask;
MOV	R3, #1
LSL	R1, R3, R1
;stm32f4xx_adc.c,1599 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_ADC_ITConfig61
; NewState end address is: 8 (R2)
;stm32f4xx_adc.c,1602 :: 		ADCx->CR1 |= itmask;
ADDS	R4, R0, #4
; ADCx end address is: 0 (R0)
LDR	R3, [R4, #0]
ORRS	R3, R1
; itmask end address is: 4 (R1)
STR	R3, [R4, #0]
;stm32f4xx_adc.c,1603 :: 		}
IT	AL
BAL	L_ADC_ITConfig62
L_ADC_ITConfig61:
;stm32f4xx_adc.c,1607 :: 		ADCx->CR1 &= (~(uint32_t)itmask);
; itmask start address is: 4 (R1)
; ADCx start address is: 0 (R0)
ADDS	R5, R0, #4
; ADCx end address is: 0 (R0)
MVN	R4, R1
; itmask end address is: 4 (R1)
LDR	R3, [R5, #0]
ANDS	R3, R4
STR	R3, [R5, #0]
;stm32f4xx_adc.c,1608 :: 		}
L_ADC_ITConfig62:
;stm32f4xx_adc.c,1609 :: 		}
L_end_ADC_ITConfig:
BX	LR
; end of _ADC_ITConfig
_ADC_GetFlagStatus:
;stm32f4xx_adc.c,1624 :: 		FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, uint8_t ADC_FLAG)
; ADC_FLAG start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_FLAG end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_FLAG start address is: 4 (R1)
;stm32f4xx_adc.c,1626 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_adc.c,1632 :: 		if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
LDR	R2, [R0, #0]
; ADCx end address is: 0 (R0)
ANDS	R2, R1
; ADC_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_ADC_GetFlagStatus63
;stm32f4xx_adc.c,1635 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_adc.c,1636 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_ADC_GetFlagStatus64
L_ADC_GetFlagStatus63:
;stm32f4xx_adc.c,1640 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_adc.c,1641 :: 		}
L_ADC_GetFlagStatus64:
;stm32f4xx_adc.c,1643 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_adc.c,1644 :: 		}
L_end_ADC_GetFlagStatus:
BX	LR
; end of _ADC_GetFlagStatus
_ADC_ClearFlag:
;stm32f4xx_adc.c,1659 :: 		void ADC_ClearFlag(ADC_TypeDef* ADCx, uint8_t ADC_FLAG)
; ADC_FLAG start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_FLAG end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_FLAG start address is: 4 (R1)
;stm32f4xx_adc.c,1666 :: 		ADCx->SR = ~(uint32_t)ADC_FLAG;
UXTB	R2, R1
; ADC_FLAG end address is: 4 (R1)
MVN	R2, R2
STR	R2, [R0, #0]
; ADCx end address is: 0 (R0)
;stm32f4xx_adc.c,1667 :: 		}
L_end_ADC_ClearFlag:
BX	LR
; end of _ADC_ClearFlag
_ADC_GetITStatus:
;stm32f4xx_adc.c,1680 :: 		ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx, uint16_t ADC_IT)
; ADC_IT start address is: 4 (R1)
; ADCx start address is: 0 (R0)
UXTH	R5, R1
; ADC_IT end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_IT start address is: 20 (R5)
;stm32f4xx_adc.c,1682 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_adc.c,1683 :: 		uint32_t itmask = 0, enablestatus = 0;
;stm32f4xx_adc.c,1690 :: 		itmask = ADC_IT >> 8;
LSRS	R2, R5, #8
UXTH	R2, R2
; itmask start address is: 4 (R1)
UXTH	R1, R2
;stm32f4xx_adc.c,1693 :: 		enablestatus = (ADCx->CR1 & ((uint32_t)0x01 << (uint8_t)ADC_IT)) ;
ADDS	R2, R0, #4
LDR	R4, [R2, #0]
UXTB	R3, R5
; ADC_IT end address is: 20 (R5)
MOV	R2, #1
LSLS	R2, R3
AND	R2, R4, R2, LSL #0
; enablestatus start address is: 12 (R3)
MOV	R3, R2
;stm32f4xx_adc.c,1696 :: 		if (((ADCx->SR & itmask) != (uint32_t)RESET) && enablestatus)
LDR	R2, [R0, #0]
; ADCx end address is: 0 (R0)
ANDS	R2, R1
; itmask end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L__ADC_GetITStatus78
CMP	R3, #0
IT	EQ
BEQ	L__ADC_GetITStatus77
; enablestatus end address is: 12 (R3)
L__ADC_GetITStatus76:
;stm32f4xx_adc.c,1699 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_adc.c,1700 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_ADC_GetITStatus68
;stm32f4xx_adc.c,1696 :: 		if (((ADCx->SR & itmask) != (uint32_t)RESET) && enablestatus)
L__ADC_GetITStatus78:
L__ADC_GetITStatus77:
;stm32f4xx_adc.c,1704 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_adc.c,1705 :: 		}
L_ADC_GetITStatus68:
;stm32f4xx_adc.c,1707 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_adc.c,1708 :: 		}
L_end_ADC_GetITStatus:
BX	LR
; end of _ADC_GetITStatus
_ADC_ClearITPendingBit:
;stm32f4xx_adc.c,1721 :: 		void ADC_ClearITPendingBit(ADC_TypeDef* ADCx, uint16_t ADC_IT)
; ADC_IT start address is: 4 (R1)
; ADCx start address is: 0 (R0)
; ADC_IT end address is: 4 (R1)
; ADCx end address is: 0 (R0)
; ADCx start address is: 0 (R0)
; ADC_IT start address is: 4 (R1)
;stm32f4xx_adc.c,1723 :: 		uint8_t itmask = 0;
;stm32f4xx_adc.c,1728 :: 		itmask = (uint8_t)(ADC_IT >> 8);
LSRS	R2, R1, #8
UXTH	R2, R2
; ADC_IT end address is: 4 (R1)
;stm32f4xx_adc.c,1730 :: 		ADCx->SR = ~(uint32_t)itmask;
UXTB	R2, R2
MVN	R2, R2
STR	R2, [R0, #0]
; ADCx end address is: 0 (R0)
;stm32f4xx_adc.c,1731 :: 		}
L_end_ADC_ClearITPendingBit:
BX	LR
; end of _ADC_ClearITPendingBit
