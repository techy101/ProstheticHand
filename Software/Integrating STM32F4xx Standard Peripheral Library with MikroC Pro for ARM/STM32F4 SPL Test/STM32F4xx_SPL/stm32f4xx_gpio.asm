stm32f4xx_gpio___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_gpio___DSB
stm32f4xx_gpio___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_gpio___WFI
stm32f4xx_gpio___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_gpio___WFE
stm32f4xx_gpio___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_gpio___REV
stm32f4xx_gpio_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_gpio_NVIC_SetPriorityGrouping
stm32f4xx_gpio_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_gpio_NVIC_GetPriorityGrouping
stm32f4xx_gpio_NVIC_EnableIRQ:
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
; end of stm32f4xx_gpio_NVIC_EnableIRQ
stm32f4xx_gpio_NVIC_DisableIRQ:
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
; end of stm32f4xx_gpio_NVIC_DisableIRQ
stm32f4xx_gpio_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_gpio_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_gpio_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_gpio_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_gpio_NVIC_GetPendingIRQ1
L_stm32f4xx_gpio_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_gpio_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_gpio_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_gpio_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_gpio_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_gpio_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_gpio_NVIC_GetPendingIRQ
stm32f4xx_gpio_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_gpio_NVIC_SetPendingIRQ
stm32f4xx_gpio_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_gpio_NVIC_ClearPendingIRQ
stm32f4xx_gpio_NVIC_GetActive:
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
BEQ	L_stm32f4xx_gpio_NVIC_GetActive2
; ?FLOC__stm32f4xx_gpio_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_gpio_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_gpio_NVIC_GetActive3
L_stm32f4xx_gpio_NVIC_GetActive2:
; ?FLOC__stm32f4xx_gpio_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_gpio_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_gpio_NVIC_GetActive3:
; ?FLOC__stm32f4xx_gpio_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_gpio_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_gpio_NVIC_GetActive
stm32f4xx_gpio_NVIC_SetPriority:
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
BGE	L_stm32f4xx_gpio_NVIC_SetPriority4
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
BAL	L_stm32f4xx_gpio_NVIC_SetPriority5
L_stm32f4xx_gpio_NVIC_SetPriority4:
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
L_stm32f4xx_gpio_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_gpio_NVIC_SetPriority
stm32f4xx_gpio_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_gpio_NVIC_GetPriority6
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
L_stm32f4xx_gpio_NVIC_GetPriority6:
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
; end of stm32f4xx_gpio_NVIC_GetPriority
stm32f4xx_gpio_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_gpio_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_gpio_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_gpio_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_gpio_NVIC_EncodePriority9
L_stm32f4xx_gpio_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_gpio_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_gpio_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_gpio_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_gpio_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_gpio_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_gpio_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_gpio_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_gpio_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_gpio_NVIC_EncodePriority11
L_stm32f4xx_gpio_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_gpio_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_gpio_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_gpio_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_gpio_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_gpio_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_gpio_NVIC_EncodePriority
stm32f4xx_gpio_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_gpio_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_gpio_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_gpio_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_gpio_NVIC_DecodePriority13
L_stm32f4xx_gpio_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_gpio_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_gpio_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_gpio_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_gpio_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_gpio_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_gpio_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_gpio_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_gpio_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_gpio_NVIC_DecodePriority15
L_stm32f4xx_gpio_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_gpio_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_gpio_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_gpio_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_gpio_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_gpio_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_gpio_NVIC_DecodePriority
stm32f4xx_gpio_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_gpio___DSB+0
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
BL	stm32f4xx_gpio___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_gpio_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_gpio_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_gpio_NVIC_SystemReset
stm32f4xx_gpio_SysTick_Config:
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
BLS	L_stm32f4xx_gpio_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_gpio_SysTick_Config18:
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
BL	stm32f4xx_gpio_NVIC_SetPriority+0
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
; end of stm32f4xx_gpio_SysTick_Config
stm32f4xx_gpio_ITM_SendChar:
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
BEQ	L_stm32f4xx_gpio_ITM_SendChar61
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_gpio_ITM_SendChar62
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_gpio_ITM_SendChar63
L_stm32f4xx_gpio_ITM_SendChar57:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_gpio_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_gpio_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_gpio_ITM_SendChar22
L_stm32f4xx_gpio_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_gpio_ITM_SendChar60
L_stm32f4xx_gpio_ITM_SendChar61:
L_stm32f4xx_gpio_ITM_SendChar60:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_gpio_ITM_SendChar59
L_stm32f4xx_gpio_ITM_SendChar62:
L_stm32f4xx_gpio_ITM_SendChar59:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_gpio_ITM_SendChar58
L_stm32f4xx_gpio_ITM_SendChar63:
L_stm32f4xx_gpio_ITM_SendChar58:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_gpio_ITM_SendChar
stm32f4xx_gpio_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_gpio_ITM_ReceiveChar24
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
L_stm32f4xx_gpio_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_gpio_ITM_ReceiveChar
stm32f4xx_gpio_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_gpio_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_gpio_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_gpio_ITM_CheckChar
_GPIO_DeInit:
;stm32f4xx_gpio.c,126 :: 		void GPIO_DeInit(GPIO_TypeDef* GPIOx)
; GPIOx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
;stm32f4xx_gpio.c,131 :: 		if (GPIOx == GPIOA)
MOVW	R1, #0
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit27
; GPIOx end address is: 0 (R0)
;stm32f4xx_gpio.c,133 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOA, ENABLE);
MOVS	R1, #1
MOV	R0, #1
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,134 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOA, DISABLE);
MOVS	R1, #0
MOV	R0, #1
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,135 :: 		}
IT	AL
BAL	L_GPIO_DeInit28
L_GPIO_DeInit27:
;stm32f4xx_gpio.c,136 :: 		else if (GPIOx == GPIOB)
; GPIOx start address is: 0 (R0)
MOVW	R1, #1024
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit29
; GPIOx end address is: 0 (R0)
;stm32f4xx_gpio.c,138 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOB, ENABLE);
MOVS	R1, #1
MOV	R0, #2
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,139 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOB, DISABLE);
MOVS	R1, #0
MOV	R0, #2
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,140 :: 		}
IT	AL
BAL	L_GPIO_DeInit30
L_GPIO_DeInit29:
;stm32f4xx_gpio.c,141 :: 		else if (GPIOx == GPIOC)
; GPIOx start address is: 0 (R0)
MOVW	R1, #2048
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit31
; GPIOx end address is: 0 (R0)
;stm32f4xx_gpio.c,143 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOC, ENABLE);
MOVS	R1, #1
MOV	R0, #4
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,144 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOC, DISABLE);
MOVS	R1, #0
MOV	R0, #4
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,145 :: 		}
IT	AL
BAL	L_GPIO_DeInit32
L_GPIO_DeInit31:
;stm32f4xx_gpio.c,146 :: 		else if (GPIOx == GPIOD)
; GPIOx start address is: 0 (R0)
MOVW	R1, #3072
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit33
; GPIOx end address is: 0 (R0)
;stm32f4xx_gpio.c,148 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOD, ENABLE);
MOVS	R1, #1
MOV	R0, #8
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,149 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOD, DISABLE);
MOVS	R1, #0
MOV	R0, #8
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,150 :: 		}
IT	AL
BAL	L_GPIO_DeInit34
L_GPIO_DeInit33:
;stm32f4xx_gpio.c,151 :: 		else if (GPIOx == GPIOE)
; GPIOx start address is: 0 (R0)
MOVW	R1, #4096
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit35
; GPIOx end address is: 0 (R0)
;stm32f4xx_gpio.c,153 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOE, ENABLE);
MOVS	R1, #1
MOV	R0, #16
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,154 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOE, DISABLE);
MOVS	R1, #0
MOV	R0, #16
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,155 :: 		}
IT	AL
BAL	L_GPIO_DeInit36
L_GPIO_DeInit35:
;stm32f4xx_gpio.c,156 :: 		else if (GPIOx == GPIOF)
; GPIOx start address is: 0 (R0)
MOVW	R1, #5120
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit37
; GPIOx end address is: 0 (R0)
;stm32f4xx_gpio.c,158 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOF, ENABLE);
MOVS	R1, #1
MOV	R0, #32
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,159 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOF, DISABLE);
MOVS	R1, #0
MOV	R0, #32
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,160 :: 		}
IT	AL
BAL	L_GPIO_DeInit38
L_GPIO_DeInit37:
;stm32f4xx_gpio.c,161 :: 		else if (GPIOx == GPIOG)
; GPIOx start address is: 0 (R0)
MOVW	R1, #6144
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit39
; GPIOx end address is: 0 (R0)
;stm32f4xx_gpio.c,163 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOG, ENABLE);
MOVS	R1, #1
MOV	R0, #64
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,164 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOG, DISABLE);
MOVS	R1, #0
MOV	R0, #64
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,165 :: 		}
IT	AL
BAL	L_GPIO_DeInit40
L_GPIO_DeInit39:
;stm32f4xx_gpio.c,166 :: 		else if (GPIOx == GPIOH)
; GPIOx start address is: 0 (R0)
MOVW	R1, #7168
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit41
; GPIOx end address is: 0 (R0)
;stm32f4xx_gpio.c,168 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOH, ENABLE);
MOVS	R1, #1
MOV	R0, #128
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,169 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOH, DISABLE);
MOVS	R1, #0
MOV	R0, #128
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,170 :: 		}
IT	AL
BAL	L_GPIO_DeInit42
L_GPIO_DeInit41:
;stm32f4xx_gpio.c,173 :: 		if (GPIOx == GPIOI)
; GPIOx start address is: 0 (R0)
MOVW	R1, #8192
MOVT	R1, #16386
CMP	R0, R1
IT	NE
BNE	L_GPIO_DeInit43
; GPIOx end address is: 0 (R0)
;stm32f4xx_gpio.c,175 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOI, ENABLE);
MOVS	R1, #1
MOV	R0, #256
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,176 :: 		RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOI, DISABLE);
MOVS	R1, #0
MOV	R0, #256
BL	_RCC_AHB1PeriphResetCmd+0
;stm32f4xx_gpio.c,177 :: 		}
L_GPIO_DeInit43:
;stm32f4xx_gpio.c,178 :: 		}
L_GPIO_DeInit42:
L_GPIO_DeInit40:
L_GPIO_DeInit38:
L_GPIO_DeInit36:
L_GPIO_DeInit34:
L_GPIO_DeInit32:
L_GPIO_DeInit30:
L_GPIO_DeInit28:
;stm32f4xx_gpio.c,179 :: 		}
L_end_GPIO_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _GPIO_DeInit
_GPIO_Init:
;stm32f4xx_gpio.c,188 :: 		void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_InitTypeDef* GPIO_InitStruct)
; GPIO_InitStruct start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
SUB	SP, SP, #4
; GPIO_InitStruct end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_InitStruct start address is: 4 (R1)
;stm32f4xx_gpio.c,190 :: 		uint32_t pinpos = 0x00, pos = 0x00 , currentpin = 0x00;
;stm32f4xx_gpio.c,200 :: 		for (pinpos = 0x00; pinpos < 0x10; pinpos++)
; pinpos start address is: 20 (R5)
MOV	R5, #0
; GPIOx end address is: 0 (R0)
; GPIO_InitStruct end address is: 4 (R1)
; pinpos end address is: 20 (R5)
STR	R1, [SP, #0]
MOV	R1, R0
LDR	R0, [SP, #0]
L_GPIO_Init44:
; pinpos start address is: 20 (R5)
; GPIOx start address is: 4 (R1)
; GPIO_InitStruct start address is: 0 (R0)
; GPIO_InitStruct start address is: 0 (R0)
; GPIO_InitStruct end address is: 0 (R0)
; GPIOx start address is: 4 (R1)
; GPIOx end address is: 4 (R1)
CMP	R5, #16
IT	CS
BCS	L_GPIO_Init45
; GPIO_InitStruct end address is: 0 (R0)
; GPIOx end address is: 4 (R1)
;stm32f4xx_gpio.c,202 :: 		pos = ((uint32_t)0x01) << pinpos;
; GPIOx start address is: 4 (R1)
; GPIO_InitStruct start address is: 0 (R0)
MOV	R2, #1
LSL	R3, R2, R5
;stm32f4xx_gpio.c,204 :: 		currentpin = (GPIO_InitStruct->GPIO_Pin) & pos;
LDR	R2, [R0, #0]
ANDS	R2, R3
;stm32f4xx_gpio.c,206 :: 		if (currentpin == pos)
CMP	R2, R3
IT	NE
BNE	L_GPIO_Init47
;stm32f4xx_gpio.c,208 :: 		GPIOx->MODER  &= ~(GPIO_MODER_MODER0 << (pinpos * 2));
LSLS	R3, R5, #1
MOV	R2, #3
LSLS	R2, R3
MVN	R3, R2
LDR	R2, [R1, #0]
ANDS	R2, R3
STR	R2, [R1, #0]
;stm32f4xx_gpio.c,209 :: 		GPIOx->MODER |= (((uint32_t)GPIO_InitStruct->GPIO_Mode) << (pinpos * 2));
ADDS	R2, R0, #4
LDRB	R2, [R2, #0]
UXTB	R3, R2
LSLS	R2, R5, #1
LSLS	R3, R2
LDR	R2, [R1, #0]
ORRS	R2, R3
STR	R2, [R1, #0]
;stm32f4xx_gpio.c,211 :: 		if ((GPIO_InitStruct->GPIO_Mode == GPIO_Mode_OUT) || (GPIO_InitStruct->GPIO_Mode == GPIO_Mode_AF))
ADDS	R2, R0, #4
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	EQ
BEQ	L__GPIO_Init66
ADDS	R2, R0, #4
LDRB	R2, [R2, #0]
CMP	R2, #2
IT	EQ
BEQ	L__GPIO_Init65
IT	AL
BAL	L_GPIO_Init50
L__GPIO_Init66:
L__GPIO_Init65:
;stm32f4xx_gpio.c,217 :: 		GPIOx->OSPEEDR &= ~(GPIO_OSPEEDER_OSPEEDR0 << (pinpos * 2));
ADDW	R4, R1, #8
LSLS	R3, R5, #1
MOV	R2, #3
LSLS	R2, R3
MVN	R3, R2
LDR	R2, [R4, #0]
ANDS	R2, R3
STR	R2, [R4, #0]
;stm32f4xx_gpio.c,218 :: 		GPIOx->OSPEEDR |= ((uint32_t)(GPIO_InitStruct->GPIO_Speed) << (pinpos * 2));
ADDW	R4, R1, #8
ADDS	R2, R0, #5
LDRB	R2, [R2, #0]
UXTB	R3, R2
LSLS	R2, R5, #1
LSLS	R3, R2
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;stm32f4xx_gpio.c,224 :: 		GPIOx->OTYPER  &= ~((GPIO_OTYPER_OT_0) << ((uint16_t)pinpos)) ;
ADDS	R4, R1, #4
UXTH	R3, R5
MOV	R2, #1
LSLS	R2, R3
MVN	R3, R2
LDR	R2, [R4, #0]
ANDS	R2, R3
STR	R2, [R4, #0]
;stm32f4xx_gpio.c,225 :: 		GPIOx->OTYPER |= (uint16_t)(((uint16_t)GPIO_InitStruct->GPIO_OType) << ((uint16_t)pinpos));
ADDS	R4, R1, #4
ADDS	R2, R0, #6
LDRB	R2, [R2, #0]
UXTB	R3, R2
UXTH	R2, R5
LSLS	R3, R2
UXTH	R3, R3
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;stm32f4xx_gpio.c,226 :: 		}
L_GPIO_Init50:
;stm32f4xx_gpio.c,229 :: 		GPIOx->PUPDR &= ~(GPIO_PUPDR_PUPDR0 << ((uint16_t)pinpos * 2));
ADDW	R4, R1, #12
UXTH	R2, R5
LSLS	R3, R2, #1
MOV	R2, #3
LSLS	R2, R3
MVN	R3, R2
LDR	R2, [R4, #0]
ANDS	R2, R3
STR	R2, [R4, #0]
;stm32f4xx_gpio.c,230 :: 		GPIOx->PUPDR |= (((uint32_t)GPIO_InitStruct->GPIO_PuPd) << (pinpos * 2));
ADDW	R4, R1, #12
ADDS	R2, R0, #7
LDRB	R2, [R2, #0]
UXTB	R3, R2
LSLS	R2, R5, #1
LSLS	R3, R2
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;stm32f4xx_gpio.c,231 :: 		}
L_GPIO_Init47:
;stm32f4xx_gpio.c,200 :: 		for (pinpos = 0x00; pinpos < 0x10; pinpos++)
ADDS	R5, R5, #1
;stm32f4xx_gpio.c,232 :: 		}
; GPIO_InitStruct end address is: 0 (R0)
; GPIOx end address is: 4 (R1)
; pinpos end address is: 20 (R5)
IT	AL
BAL	L_GPIO_Init44
L_GPIO_Init45:
;stm32f4xx_gpio.c,233 :: 		}
L_end_GPIO_Init:
ADD	SP, SP, #4
BX	LR
; end of _GPIO_Init
_GPIO_StructInit:
;stm32f4xx_gpio.c,240 :: 		void GPIO_StructInit(GPIO_InitTypeDef* GPIO_InitStruct)
; GPIO_InitStruct start address is: 0 (R0)
; GPIO_InitStruct end address is: 0 (R0)
; GPIO_InitStruct start address is: 0 (R0)
;stm32f4xx_gpio.c,243 :: 		GPIO_InitStruct->GPIO_Pin  = GPIO_Pin_All;
MOVW	R1, #65535
STR	R1, [R0, #0]
;stm32f4xx_gpio.c,244 :: 		GPIO_InitStruct->GPIO_Mode = GPIO_Mode_IN;
ADDS	R2, R0, #4
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_gpio.c,245 :: 		GPIO_InitStruct->GPIO_Speed = GPIO_Speed_2MHz;
ADDS	R2, R0, #5
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_gpio.c,246 :: 		GPIO_InitStruct->GPIO_OType = GPIO_OType_PP;
ADDS	R2, R0, #6
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_gpio.c,247 :: 		GPIO_InitStruct->GPIO_PuPd = GPIO_PuPd_NOPULL;
ADDS	R2, R0, #7
; GPIO_InitStruct end address is: 0 (R0)
MOVS	R1, #0
STRB	R1, [R2, #0]
;stm32f4xx_gpio.c,248 :: 		}
L_end_GPIO_StructInit:
BX	LR
; end of _GPIO_StructInit
_GPIO_PinLockConfig:
;stm32f4xx_gpio.c,261 :: 		void GPIO_PinLockConfig(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
;stm32f4xx_gpio.c,263 :: 		__IO uint32_t tmp = 0x00010000;
; tmp start address is: 12 (R3)
MOV	R3, #65536
;stm32f4xx_gpio.c,269 :: 		tmp |= GPIO_Pin;
ORRS	R3, R1
;stm32f4xx_gpio.c,271 :: 		GPIOx->LCKR = tmp;
ADDW	R2, R0, #28
STR	R3, [R2, #0]
;stm32f4xx_gpio.c,273 :: 		GPIOx->LCKR =  GPIO_Pin;
ADDW	R2, R0, #28
STR	R1, [R2, #0]
; GPIO_Pin end address is: 4 (R1)
;stm32f4xx_gpio.c,275 :: 		GPIOx->LCKR = tmp;
ADDW	R2, R0, #28
STR	R3, [R2, #0]
; tmp end address is: 12 (R3)
;stm32f4xx_gpio.c,277 :: 		tmp = GPIOx->LCKR;
ADDW	R2, R0, #28
; GPIOx end address is: 0 (R0)
LDR	R2, [R2, #0]
; tmp start address is: 0 (R0)
MOV	R0, R2
;stm32f4xx_gpio.c,279 :: 		tmp = GPIOx->LCKR;
MOV	R0, R2
; tmp end address is: 0 (R0)
;stm32f4xx_gpio.c,280 :: 		}
L_end_GPIO_PinLockConfig:
BX	LR
; end of _GPIO_PinLockConfig
_GPIO_ReadInputDataBit:
;stm32f4xx_gpio.c,305 :: 		uint8_t GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
;stm32f4xx_gpio.c,307 :: 		uint8_t bitstatus = 0x00;
;stm32f4xx_gpio.c,313 :: 		if ((GPIOx->IDR & GPIO_Pin) != (uint32_t)Bit_RESET)
ADDW	R2, R0, #16
; GPIOx end address is: 0 (R0)
LDR	R2, [R2, #0]
ANDS	R2, R1
; GPIO_Pin end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_GPIO_ReadInputDataBit51
;stm32f4xx_gpio.c,315 :: 		bitstatus = (uint8_t)Bit_SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_gpio.c,316 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_GPIO_ReadInputDataBit52
L_GPIO_ReadInputDataBit51:
;stm32f4xx_gpio.c,319 :: 		bitstatus = (uint8_t)Bit_RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_gpio.c,320 :: 		}
L_GPIO_ReadInputDataBit52:
;stm32f4xx_gpio.c,321 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_gpio.c,322 :: 		}
L_end_GPIO_ReadInputDataBit:
BX	LR
; end of _GPIO_ReadInputDataBit
_GPIO_ReadInputData:
;stm32f4xx_gpio.c,329 :: 		uint16_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
; GPIOx start address is: 0 (R0)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
;stm32f4xx_gpio.c,334 :: 		return ((uint16_t)GPIOx->IDR);
ADDW	R1, R0, #16
; GPIOx end address is: 0 (R0)
LDR	R1, [R1, #0]
UXTH	R0, R1
;stm32f4xx_gpio.c,335 :: 		}
L_end_GPIO_ReadInputData:
BX	LR
; end of _GPIO_ReadInputData
_GPIO_ReadOutputDataBit:
;stm32f4xx_gpio.c,344 :: 		uint8_t GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
;stm32f4xx_gpio.c,346 :: 		uint8_t bitstatus = 0x00;
;stm32f4xx_gpio.c,352 :: 		if ((GPIOx->ODR & GPIO_Pin) != (uint32_t)Bit_RESET)
ADDW	R2, R0, #20
; GPIOx end address is: 0 (R0)
LDR	R2, [R2, #0]
ANDS	R2, R1
; GPIO_Pin end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_GPIO_ReadOutputDataBit53
;stm32f4xx_gpio.c,354 :: 		bitstatus = (uint8_t)Bit_SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_gpio.c,355 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_GPIO_ReadOutputDataBit54
L_GPIO_ReadOutputDataBit53:
;stm32f4xx_gpio.c,358 :: 		bitstatus = (uint8_t)Bit_RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_gpio.c,359 :: 		}
L_GPIO_ReadOutputDataBit54:
;stm32f4xx_gpio.c,360 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_gpio.c,361 :: 		}
L_end_GPIO_ReadOutputDataBit:
BX	LR
; end of _GPIO_ReadOutputDataBit
_GPIO_ReadOutputData:
;stm32f4xx_gpio.c,368 :: 		uint16_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
; GPIOx start address is: 0 (R0)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
;stm32f4xx_gpio.c,373 :: 		return ((uint16_t)GPIOx->ODR);
ADDW	R1, R0, #20
; GPIOx end address is: 0 (R0)
LDR	R1, [R1, #0]
UXTH	R0, R1
;stm32f4xx_gpio.c,374 :: 		}
L_end_GPIO_ReadOutputData:
BX	LR
; end of _GPIO_ReadOutputData
_GPIO_SetBits:
;stm32f4xx_gpio.c,386 :: 		void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
;stm32f4xx_gpio.c,392 :: 		GPIOx->BSRRL = GPIO_Pin;
ADDW	R2, R0, #24
; GPIOx end address is: 0 (R0)
STRH	R1, [R2, #0]
; GPIO_Pin end address is: 4 (R1)
;stm32f4xx_gpio.c,393 :: 		}
L_end_GPIO_SetBits:
BX	LR
; end of _GPIO_SetBits
_GPIO_ResetBits:
;stm32f4xx_gpio.c,405 :: 		void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
;stm32f4xx_gpio.c,411 :: 		GPIOx->BSRRH = GPIO_Pin;
ADDW	R2, R0, #26
; GPIOx end address is: 0 (R0)
STRH	R1, [R2, #0]
; GPIO_Pin end address is: 4 (R1)
;stm32f4xx_gpio.c,412 :: 		}
L_end_GPIO_ResetBits:
BX	LR
; end of _GPIO_ResetBits
_GPIO_WriteBit:
;stm32f4xx_gpio.c,425 :: 		void GPIO_WriteBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, BitAction BitVal)
; BitVal start address is: 8 (R2)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; BitVal end address is: 8 (R2)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
; BitVal start address is: 8 (R2)
;stm32f4xx_gpio.c,432 :: 		if (BitVal != Bit_RESET)
CMP	R2, #0
IT	EQ
BEQ	L_GPIO_WriteBit55
; BitVal end address is: 8 (R2)
;stm32f4xx_gpio.c,434 :: 		GPIOx->BSRRL = GPIO_Pin;
ADDW	R3, R0, #24
; GPIOx end address is: 0 (R0)
STRH	R1, [R3, #0]
; GPIO_Pin end address is: 4 (R1)
;stm32f4xx_gpio.c,435 :: 		}
IT	AL
BAL	L_GPIO_WriteBit56
L_GPIO_WriteBit55:
;stm32f4xx_gpio.c,438 :: 		GPIOx->BSRRH = GPIO_Pin ;
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
ADDW	R3, R0, #26
; GPIOx end address is: 0 (R0)
STRH	R1, [R3, #0]
; GPIO_Pin end address is: 4 (R1)
;stm32f4xx_gpio.c,439 :: 		}
L_GPIO_WriteBit56:
;stm32f4xx_gpio.c,440 :: 		}
L_end_GPIO_WriteBit:
BX	LR
; end of _GPIO_WriteBit
_GPIO_Write:
;stm32f4xx_gpio.c,448 :: 		void GPIO_Write(GPIO_TypeDef* GPIOx, uint16_t PortVal)
; PortVal start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; PortVal end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; PortVal start address is: 4 (R1)
;stm32f4xx_gpio.c,453 :: 		GPIOx->ODR = PortVal;
ADDW	R2, R0, #20
; GPIOx end address is: 0 (R0)
STR	R1, [R2, #0]
; PortVal end address is: 4 (R1)
;stm32f4xx_gpio.c,454 :: 		}
L_end_GPIO_Write:
BX	LR
; end of _GPIO_Write
_GPIO_ToggleBits:
;stm32f4xx_gpio.c,462 :: 		void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
; GPIO_Pin start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_Pin end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_Pin start address is: 4 (R1)
;stm32f4xx_gpio.c,467 :: 		GPIOx->ODR ^= GPIO_Pin;
ADDW	R3, R0, #20
; GPIOx end address is: 0 (R0)
LDR	R2, [R3, #0]
EORS	R2, R1
; GPIO_Pin end address is: 4 (R1)
STR	R2, [R3, #0]
;stm32f4xx_gpio.c,468 :: 		}
L_end_GPIO_ToggleBits:
BX	LR
; end of _GPIO_ToggleBits
_GPIO_PinAFConfig:
;stm32f4xx_gpio.c,535 :: 		void GPIO_PinAFConfig(GPIO_TypeDef* GPIOx, uint16_t GPIO_PinSource, uint8_t GPIO_AF)
; GPIO_AF start address is: 8 (R2)
; GPIO_PinSource start address is: 4 (R1)
; GPIOx start address is: 0 (R0)
; GPIO_AF end address is: 8 (R2)
; GPIO_PinSource end address is: 4 (R1)
; GPIOx end address is: 0 (R0)
; GPIOx start address is: 0 (R0)
; GPIO_PinSource start address is: 4 (R1)
; GPIO_AF start address is: 8 (R2)
;stm32f4xx_gpio.c,537 :: 		uint32_t temp = 0x00;
;stm32f4xx_gpio.c,538 :: 		uint32_t temp_2 = 0x00;
;stm32f4xx_gpio.c,545 :: 		temp = ((uint32_t)(GPIO_AF) << ((uint32_t)((uint32_t)GPIO_PinSource & (uint32_t)0x07) * 4)) ;
UXTB	R4, R2
; GPIO_AF end address is: 8 (R2)
UXTH	R3, R1
AND	R3, R3, #7
LSLS	R3, R3, #2
LSL	R3, R4, R3
; temp start address is: 8 (R2)
MOV	R2, R3
;stm32f4xx_gpio.c,546 :: 		GPIOx->AFR[GPIO_PinSource >> 0x03] &= ~((uint32_t)0xF << ((uint32_t)((uint32_t)GPIO_PinSource & (uint32_t)0x07) * 4)) ;
ADDW	R4, R0, #32
LSRS	R3, R1, #3
UXTH	R3, R3
LSLS	R3, R3, #2
ADDS	R5, R4, R3
UXTH	R3, R1
AND	R3, R3, #7
LSLS	R4, R3, #2
MOV	R3, #15
LSLS	R3, R4
MVN	R4, R3
LDR	R3, [R5, #0]
ANDS	R3, R4
STR	R3, [R5, #0]
;stm32f4xx_gpio.c,547 :: 		temp_2 = GPIOx->AFR[GPIO_PinSource >> 0x03] | temp;
ADDW	R4, R0, #32
; GPIOx end address is: 0 (R0)
LSRS	R3, R1, #3
UXTH	R3, R3
; GPIO_PinSource end address is: 4 (R1)
LSLS	R3, R3, #2
ADDS	R4, R4, R3
LDR	R3, [R4, #0]
ORRS	R3, R2
; temp end address is: 8 (R2)
;stm32f4xx_gpio.c,548 :: 		GPIOx->AFR[GPIO_PinSource >> 0x03] = temp_2;
STR	R3, [R4, #0]
;stm32f4xx_gpio.c,549 :: 		}
L_end_GPIO_PinAFConfig:
BX	LR
; end of _GPIO_PinAFConfig
