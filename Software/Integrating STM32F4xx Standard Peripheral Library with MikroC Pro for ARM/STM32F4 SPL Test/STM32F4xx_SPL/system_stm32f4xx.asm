system_stm32f4xx___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of system_stm32f4xx___DSB
system_stm32f4xx___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of system_stm32f4xx___WFI
system_stm32f4xx___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of system_stm32f4xx___WFE
system_stm32f4xx___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of system_stm32f4xx___REV
system_stm32f4xx_NVIC_SetPriorityGrouping:
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
; end of system_stm32f4xx_NVIC_SetPriorityGrouping
system_stm32f4xx_NVIC_GetPriorityGrouping:
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
; end of system_stm32f4xx_NVIC_GetPriorityGrouping
system_stm32f4xx_NVIC_EnableIRQ:
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
; end of system_stm32f4xx_NVIC_EnableIRQ
system_stm32f4xx_NVIC_DisableIRQ:
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
; end of system_stm32f4xx_NVIC_DisableIRQ
system_stm32f4xx_NVIC_GetPendingIRQ:
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
BEQ	L_system_stm32f4xx_NVIC_GetPendingIRQ0
; ?FLOC__system_stm32f4xx_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__system_stm32f4xx_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_system_stm32f4xx_NVIC_GetPendingIRQ1
L_system_stm32f4xx_NVIC_GetPendingIRQ0:
; ?FLOC__system_stm32f4xx_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__system_stm32f4xx_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_system_stm32f4xx_NVIC_GetPendingIRQ1:
; ?FLOC__system_stm32f4xx_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__system_stm32f4xx_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of system_stm32f4xx_NVIC_GetPendingIRQ
system_stm32f4xx_NVIC_SetPendingIRQ:
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
; end of system_stm32f4xx_NVIC_SetPendingIRQ
system_stm32f4xx_NVIC_ClearPendingIRQ:
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
; end of system_stm32f4xx_NVIC_ClearPendingIRQ
system_stm32f4xx_NVIC_GetActive:
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
BEQ	L_system_stm32f4xx_NVIC_GetActive2
; ?FLOC__system_stm32f4xx_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__system_stm32f4xx_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_system_stm32f4xx_NVIC_GetActive3
L_system_stm32f4xx_NVIC_GetActive2:
; ?FLOC__system_stm32f4xx_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__system_stm32f4xx_NVIC_GetActive?T78 end address is: 0 (R0)
L_system_stm32f4xx_NVIC_GetActive3:
; ?FLOC__system_stm32f4xx_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__system_stm32f4xx_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of system_stm32f4xx_NVIC_GetActive
system_stm32f4xx_NVIC_SetPriority:
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
BGE	L_system_stm32f4xx_NVIC_SetPriority4
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
BAL	L_system_stm32f4xx_NVIC_SetPriority5
L_system_stm32f4xx_NVIC_SetPriority4:
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
L_system_stm32f4xx_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of system_stm32f4xx_NVIC_SetPriority
system_stm32f4xx_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_system_stm32f4xx_NVIC_GetPriority6
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
L_system_stm32f4xx_NVIC_GetPriority6:
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
; end of system_stm32f4xx_NVIC_GetPriority
system_stm32f4xx_NVIC_EncodePriority:
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
BLS	L_system_stm32f4xx_NVIC_EncodePriority8
; ?FLOC__system_stm32f4xx_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__system_stm32f4xx_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_system_stm32f4xx_NVIC_EncodePriority9
L_system_stm32f4xx_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__system_stm32f4xx_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__system_stm32f4xx_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_system_stm32f4xx_NVIC_EncodePriority9:
; ?FLOC__system_stm32f4xx_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__system_stm32f4xx_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_system_stm32f4xx_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__system_stm32f4xx_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__system_stm32f4xx_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_system_stm32f4xx_NVIC_EncodePriority11
L_system_stm32f4xx_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__system_stm32f4xx_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__system_stm32f4xx_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_system_stm32f4xx_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__system_stm32f4xx_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__system_stm32f4xx_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of system_stm32f4xx_NVIC_EncodePriority
system_stm32f4xx_NVIC_DecodePriority:
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
BLS	L_system_stm32f4xx_NVIC_DecodePriority12
; ?FLOC__system_stm32f4xx_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__system_stm32f4xx_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_system_stm32f4xx_NVIC_DecodePriority13
L_system_stm32f4xx_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__system_stm32f4xx_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__system_stm32f4xx_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_system_stm32f4xx_NVIC_DecodePriority13:
; ?FLOC__system_stm32f4xx_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__system_stm32f4xx_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_system_stm32f4xx_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__system_stm32f4xx_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__system_stm32f4xx_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_system_stm32f4xx_NVIC_DecodePriority15
L_system_stm32f4xx_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__system_stm32f4xx_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__system_stm32f4xx_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_system_stm32f4xx_NVIC_DecodePriority15:
; ?FLOC__system_stm32f4xx_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__system_stm32f4xx_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of system_stm32f4xx_NVIC_DecodePriority
system_stm32f4xx_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	system_stm32f4xx___DSB+0
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
BL	system_stm32f4xx___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_system_stm32f4xx_NVIC_SystemReset16:
IT	AL
BAL	L_system_stm32f4xx_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of system_stm32f4xx_NVIC_SystemReset
system_stm32f4xx_SysTick_Config:
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
BLS	L_system_stm32f4xx_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_system_stm32f4xx_SysTick_Config18:
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
BL	system_stm32f4xx_NVIC_SetPriority+0
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
; end of system_stm32f4xx_SysTick_Config
system_stm32f4xx_ITM_SendChar:
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
BEQ	L_system_stm32f4xx_ITM_SendChar52
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_system_stm32f4xx_ITM_SendChar53
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_system_stm32f4xx_ITM_SendChar54
L_system_stm32f4xx_ITM_SendChar48:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_system_stm32f4xx_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_system_stm32f4xx_ITM_SendChar23
IT	AL
BAL	L_system_stm32f4xx_ITM_SendChar22
L_system_stm32f4xx_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_system_stm32f4xx_ITM_SendChar51
L_system_stm32f4xx_ITM_SendChar52:
L_system_stm32f4xx_ITM_SendChar51:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_system_stm32f4xx_ITM_SendChar50
L_system_stm32f4xx_ITM_SendChar53:
L_system_stm32f4xx_ITM_SendChar50:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_system_stm32f4xx_ITM_SendChar49
L_system_stm32f4xx_ITM_SendChar54:
L_system_stm32f4xx_ITM_SendChar49:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of system_stm32f4xx_ITM_SendChar
system_stm32f4xx_ITM_ReceiveChar:
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
BEQ	L_system_stm32f4xx_ITM_ReceiveChar24
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
L_system_stm32f4xx_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of system_stm32f4xx_ITM_ReceiveChar
system_stm32f4xx_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_system_stm32f4xx_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_system_stm32f4xx_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of system_stm32f4xx_ITM_CheckChar
_SystemInit:
;system_stm32f4xx.c,214 :: 		void SystemInit(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;system_stm32f4xx.c,223 :: 		RCC->CR |= (uint32_t)0x00000001;
MOVW	R3, #14336
MOVT	R3, #16386
LDR	R0, [R3, #0]
ORR	R2, R0, #1
STR	R2, [R3, #0]
;system_stm32f4xx.c,226 :: 		RCC->CFGR = 0x00000000;
MOV	R1, #0
MOVW	R0, #14344
MOVT	R0, #16386
STR	R1, [R0, #0]
;system_stm32f4xx.c,229 :: 		RCC->CR &= (uint32_t)0xFEF6FFFF;
MOVW	R0, #65535
MOVT	R0, #65270
ANDS	R2, R0
STR	R2, [R3, #0]
;system_stm32f4xx.c,232 :: 		RCC->PLLCFGR = 0x24003010;
MOVW	R1, #12304
MOVT	R1, #9216
MOVW	R0, #14340
MOVT	R0, #16386
STR	R1, [R0, #0]
;system_stm32f4xx.c,235 :: 		RCC->CR &= (uint32_t)0xFFFBFFFF;
MVN	R0, #262144
AND	R0, R2, R0, LSL #0
STR	R0, [R3, #0]
;system_stm32f4xx.c,238 :: 		RCC->CIR = 0x00000000;
MOV	R1, #0
MOVW	R0, #14348
MOVT	R0, #16386
STR	R1, [R0, #0]
;system_stm32f4xx.c,246 :: 		SetSysClock();
BL	system_stm32f4xx_SetSysClock+0
;system_stm32f4xx.c,252 :: 		SCB->VTOR = FLASH_BASE | VECT_TAB_OFFSET; /* Vector Table Relocation in Internal FLASH */
MOV	R1, #134217728
MOVW	R0, #60680
MOVT	R0, #57344
STR	R1, [R0, #0]
;system_stm32f4xx.c,254 :: 		}
L_end_SystemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SystemInit
_SystemCoreClockUpdate:
;system_stm32f4xx.c,292 :: 		void SystemCoreClockUpdate(void)
;system_stm32f4xx.c,294 :: 		uint32_t tmp = 0, pllvco = 0, pllp = 2, pllsource = 0, pllm = 2;
;system_stm32f4xx.c,297 :: 		tmp = RCC->CFGR & RCC_CFGR_SWS;
MOVW	R0, #14344
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #12
; tmp start address is: 0 (R0)
;system_stm32f4xx.c,299 :: 		switch (tmp)
IT	AL
BAL	L_SystemCoreClockUpdate27
; tmp end address is: 0 (R0)
;system_stm32f4xx.c,301 :: 		case 0x00:  /* HSI used as system clock source */
L_SystemCoreClockUpdate29:
;system_stm32f4xx.c,302 :: 		SystemCoreClock = HSI_VALUE;
MOVW	R1, #9216
MOVT	R1, #244
MOVW	R0, #lo_addr(_SystemCoreClock+0)
MOVT	R0, #hi_addr(_SystemCoreClock+0)
STR	R1, [R0, #0]
;system_stm32f4xx.c,303 :: 		break;
IT	AL
BAL	L_SystemCoreClockUpdate28
;system_stm32f4xx.c,304 :: 		case 0x04:  /* HSE used as system clock source */
L_SystemCoreClockUpdate30:
;system_stm32f4xx.c,305 :: 		SystemCoreClock = HSE_VALUE;
MOVW	R1, #30784
MOVT	R1, #381
MOVW	R0, #lo_addr(_SystemCoreClock+0)
MOVT	R0, #hi_addr(_SystemCoreClock+0)
STR	R1, [R0, #0]
;system_stm32f4xx.c,306 :: 		break;
IT	AL
BAL	L_SystemCoreClockUpdate28
;system_stm32f4xx.c,307 :: 		case 0x08:  /* PLL used as system clock source */
L_SystemCoreClockUpdate31:
;system_stm32f4xx.c,312 :: 		pllsource = (RCC->PLLCFGR & RCC_PLLCFGR_PLLSRC) >> 22;
MOVW	R2, #14340
MOVT	R2, #16386
LDR	R0, [R2, #0]
AND	R0, R0, #4194304
LSRS	R1, R0, #22
;system_stm32f4xx.c,313 :: 		pllm = RCC->PLLCFGR & RCC_PLLCFGR_PLLM;
MOV	R0, R2
LDR	R0, [R0, #0]
AND	R0, R0, #63
; pllm start address is: 12 (R3)
MOV	R3, R0
;system_stm32f4xx.c,315 :: 		if (pllsource != 0)
CMP	R1, #0
IT	EQ
BEQ	L_SystemCoreClockUpdate32
;system_stm32f4xx.c,318 :: 		pllvco = (HSE_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);
MOVW	R0, #30784
MOVT	R0, #381
UDIV	R2, R0, R3
; pllm end address is: 12 (R3)
MOVW	R0, #14340
MOVT	R0, #16386
LDR	R1, [R0, #0]
MOVW	R0, #32704
MOVT	R0, #0
AND	R0, R1, R0, LSL #0
LSRS	R0, R0, #6
MULS	R2, R0, R2
; pllvco start address is: 8 (R2)
;system_stm32f4xx.c,319 :: 		}
; pllvco end address is: 8 (R2)
IT	AL
BAL	L_SystemCoreClockUpdate33
L_SystemCoreClockUpdate32:
;system_stm32f4xx.c,323 :: 		pllvco = (HSI_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);
; pllm start address is: 12 (R3)
MOVW	R0, #9216
MOVT	R0, #244
UDIV	R2, R0, R3
; pllm end address is: 12 (R3)
MOVW	R0, #14340
MOVT	R0, #16386
LDR	R1, [R0, #0]
MOVW	R0, #32704
MOVT	R0, #0
AND	R0, R1, R0, LSL #0
LSRS	R0, R0, #6
MULS	R2, R0, R2
; pllvco start address is: 8 (R2)
; pllvco end address is: 8 (R2)
;system_stm32f4xx.c,324 :: 		}
L_SystemCoreClockUpdate33:
;system_stm32f4xx.c,326 :: 		pllp = (((RCC->PLLCFGR & RCC_PLLCFGR_PLLP) >>16) + 1 ) *2;
; pllvco start address is: 8 (R2)
MOVW	R0, #14340
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #196608
LSRS	R0, R0, #16
ADDS	R0, R0, #1
LSLS	R0, R0, #1
;system_stm32f4xx.c,327 :: 		SystemCoreClock = pllvco/pllp;
UDIV	R1, R2, R0
; pllvco end address is: 8 (R2)
MOVW	R0, #lo_addr(_SystemCoreClock+0)
MOVT	R0, #hi_addr(_SystemCoreClock+0)
STR	R1, [R0, #0]
;system_stm32f4xx.c,328 :: 		break;
IT	AL
BAL	L_SystemCoreClockUpdate28
;system_stm32f4xx.c,329 :: 		default:
L_SystemCoreClockUpdate34:
;system_stm32f4xx.c,330 :: 		SystemCoreClock = HSI_VALUE;
MOVW	R1, #9216
MOVT	R1, #244
MOVW	R0, #lo_addr(_SystemCoreClock+0)
MOVT	R0, #hi_addr(_SystemCoreClock+0)
STR	R1, [R0, #0]
;system_stm32f4xx.c,331 :: 		break;
IT	AL
BAL	L_SystemCoreClockUpdate28
;system_stm32f4xx.c,332 :: 		}
L_SystemCoreClockUpdate27:
; tmp start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_SystemCoreClockUpdate29
CMP	R0, #4
IT	EQ
BEQ	L_SystemCoreClockUpdate30
CMP	R0, #8
IT	EQ
BEQ	L_SystemCoreClockUpdate31
; tmp end address is: 0 (R0)
IT	AL
BAL	L_SystemCoreClockUpdate34
L_SystemCoreClockUpdate28:
;system_stm32f4xx.c,335 :: 		tmp = AHBPrescTable[((RCC->CFGR & RCC_CFGR_HPRE) >> 4)];
MOVW	R0, #14344
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #240
LSRS	R1, R0, #4
MOVW	R0, #lo_addr(_AHBPrescTable+0)
MOVT	R0, #hi_addr(_AHBPrescTable+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
; tmp start address is: 8 (R2)
UXTB	R2, R0
;system_stm32f4xx.c,337 :: 		SystemCoreClock >>= tmp;
MOVW	R1, #lo_addr(_SystemCoreClock+0)
MOVT	R1, #hi_addr(_SystemCoreClock+0)
LDR	R0, [R1, #0]
LSRS	R0, R2
; tmp end address is: 8 (R2)
STR	R0, [R1, #0]
;system_stm32f4xx.c,338 :: 		}
L_end_SystemCoreClockUpdate:
BX	LR
; end of _SystemCoreClockUpdate
system_stm32f4xx_SetSysClock:
;system_stm32f4xx.c,348 :: 		static void SetSysClock(void)
;system_stm32f4xx.c,353 :: 		__IO uint32_t StartUpCounter = 0, HSEStatus = 0;
; StartUpCounter start address is: 8 (R2)
MOV	R2, #0
;system_stm32f4xx.c,356 :: 		RCC->CR |= ((uint32_t)RCC_CR_HSEON);
MOVW	R1, #14336
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #65536
STR	R0, [R1, #0]
;system_stm32f4xx.c,359 :: 		do
L_system_stm32f4xx_SetSysClock35:
;system_stm32f4xx.c,361 :: 		HSEStatus = RCC->CR & RCC_CR_HSERDY;
; StartUpCounter start address is: 8 (R2)
MOVW	R0, #14336
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #131072
; HSEStatus start address is: 4 (R1)
MOV	R1, R0
;system_stm32f4xx.c,362 :: 		StartUpCounter++;
ADDS	R0, R2, #1
MOV	R2, R0
; StartUpCounter end address is: 8 (R2)
;system_stm32f4xx.c,363 :: 		} while((HSEStatus == 0) && (StartUpCounter != HSE_STARTUP_TIMEOUT));
CMP	R1, #0
IT	NE
BNE	L_system_stm32f4xx_SetSysClock57
; StartUpCounter end address is: 8 (R2)
; StartUpCounter start address is: 8 (R2)
CMP	R2, #1280
IT	EQ
BEQ	L_system_stm32f4xx_SetSysClock56
; HSEStatus end address is: 4 (R1)
; StartUpCounter end address is: 8 (R2)
IT	AL
BAL	L_system_stm32f4xx_SetSysClock35
L_system_stm32f4xx_SetSysClock57:
L_system_stm32f4xx_SetSysClock56:
;system_stm32f4xx.c,365 :: 		if ((RCC->CR & RCC_CR_HSERDY) != RESET)
MOVW	R0, #14336
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #131072
CMP	R0, #0
IT	EQ
BEQ	L_system_stm32f4xx_SetSysClock40
;system_stm32f4xx.c,367 :: 		HSEStatus = (uint32_t)0x01;
; HSEStatus start address is: 0 (R0)
MOV	R0, #1
;system_stm32f4xx.c,368 :: 		}
; HSEStatus end address is: 0 (R0)
IT	AL
BAL	L_system_stm32f4xx_SetSysClock41
L_system_stm32f4xx_SetSysClock40:
;system_stm32f4xx.c,371 :: 		HSEStatus = (uint32_t)0x00;
; HSEStatus start address is: 0 (R0)
MOV	R0, #0
; HSEStatus end address is: 0 (R0)
;system_stm32f4xx.c,372 :: 		}
L_system_stm32f4xx_SetSysClock41:
;system_stm32f4xx.c,374 :: 		if (HSEStatus == (uint32_t)0x01)
; HSEStatus start address is: 0 (R0)
CMP	R0, #1
IT	NE
BNE	L_system_stm32f4xx_SetSysClock42
; HSEStatus end address is: 0 (R0)
;system_stm32f4xx.c,377 :: 		RCC->APB1ENR |= RCC_APB1ENR_PWREN;
MOVW	R1, #14400
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #268435456
STR	R0, [R1, #0]
;system_stm32f4xx.c,378 :: 		PWR->CR |= PWR_CR_VOS;
MOVW	R1, #28672
MOVT	R1, #16384
LDR	R0, [R1, #0]
ORR	R0, R0, #16384
STR	R0, [R1, #0]
;system_stm32f4xx.c,381 :: 		RCC->CFGR |= RCC_CFGR_HPRE_DIV1;
;system_stm32f4xx.c,384 :: 		RCC->CFGR |= RCC_CFGR_PPRE2_DIV2;
MOVW	R1, #14344
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #32768
STR	R0, [R1, #0]
;system_stm32f4xx.c,387 :: 		RCC->CFGR |= RCC_CFGR_PPRE1_DIV4;
ORR	R0, R0, #5120
STR	R0, [R1, #0]
;system_stm32f4xx.c,391 :: 		(RCC_PLLCFGR_PLLSRC_HSE) | (PLL_Q << 24);
MOVW	R1, #21529
MOVT	R1, #1856
MOVW	R0, #14340
MOVT	R0, #16386
STR	R1, [R0, #0]
;system_stm32f4xx.c,394 :: 		RCC->CR |= RCC_CR_PLLON;
MOVW	R1, #14336
MOVT	R1, #16386
LDR	R0, [R1, #0]
ORR	R0, R0, #16777216
STR	R0, [R1, #0]
;system_stm32f4xx.c,397 :: 		while((RCC->CR & RCC_CR_PLLRDY) == 0)
L_system_stm32f4xx_SetSysClock43:
MOVW	R0, #14336
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #33554432
CMP	R0, #0
IT	NE
BNE	L_system_stm32f4xx_SetSysClock44
;system_stm32f4xx.c,399 :: 		}
IT	AL
BAL	L_system_stm32f4xx_SetSysClock43
L_system_stm32f4xx_SetSysClock44:
;system_stm32f4xx.c,402 :: 		FLASH->ACR = FLASH_ACR_ICEN |FLASH_ACR_DCEN |FLASH_ACR_LATENCY_5WS;
MOVW	R1, #1541
MOVT	R1, #0
MOVW	R0, #15360
MOVT	R0, #16386
STR	R1, [R0, #0]
;system_stm32f4xx.c,405 :: 		RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
MOVW	R2, #14344
MOVT	R2, #16386
LDR	R1, [R2, #0]
MVN	R0, #3
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;system_stm32f4xx.c,406 :: 		RCC->CFGR |= RCC_CFGR_SW_PLL;
ORR	R0, R0, #2
STR	R0, [R2, #0]
;system_stm32f4xx.c,409 :: 		while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS ) != RCC_CFGR_SWS_PLL);
L_system_stm32f4xx_SetSysClock45:
MOVW	R0, #14344
MOVT	R0, #16386
LDR	R0, [R0, #0]
AND	R0, R0, #12
CMP	R0, #8
IT	EQ
BEQ	L_system_stm32f4xx_SetSysClock46
IT	AL
BAL	L_system_stm32f4xx_SetSysClock45
L_system_stm32f4xx_SetSysClock46:
;system_stm32f4xx.c,412 :: 		}
IT	AL
BAL	L_system_stm32f4xx_SetSysClock47
L_system_stm32f4xx_SetSysClock42:
;system_stm32f4xx.c,416 :: 		}
L_system_stm32f4xx_SetSysClock47:
;system_stm32f4xx.c,418 :: 		}
L_end_SetSysClock:
BX	LR
; end of system_stm32f4xx_SetSysClock
