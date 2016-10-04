stm32f4xx_i2c___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_i2c___DSB
stm32f4xx_i2c___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_i2c___WFI
stm32f4xx_i2c___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_i2c___WFE
stm32f4xx_i2c___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_i2c___REV
stm32f4xx_i2c_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_i2c_NVIC_SetPriorityGrouping
stm32f4xx_i2c_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_i2c_NVIC_GetPriorityGrouping
stm32f4xx_i2c_NVIC_EnableIRQ:
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
; end of stm32f4xx_i2c_NVIC_EnableIRQ
stm32f4xx_i2c_NVIC_DisableIRQ:
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
; end of stm32f4xx_i2c_NVIC_DisableIRQ
stm32f4xx_i2c_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_i2c_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_i2c_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_i2c_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_i2c_NVIC_GetPendingIRQ1
L_stm32f4xx_i2c_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_i2c_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_i2c_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_i2c_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_i2c_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_i2c_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_i2c_NVIC_GetPendingIRQ
stm32f4xx_i2c_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_i2c_NVIC_SetPendingIRQ
stm32f4xx_i2c_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_i2c_NVIC_ClearPendingIRQ
stm32f4xx_i2c_NVIC_GetActive:
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
BEQ	L_stm32f4xx_i2c_NVIC_GetActive2
; ?FLOC__stm32f4xx_i2c_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_i2c_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_i2c_NVIC_GetActive3
L_stm32f4xx_i2c_NVIC_GetActive2:
; ?FLOC__stm32f4xx_i2c_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_i2c_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_i2c_NVIC_GetActive3:
; ?FLOC__stm32f4xx_i2c_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_i2c_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_i2c_NVIC_GetActive
stm32f4xx_i2c_NVIC_SetPriority:
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
BGE	L_stm32f4xx_i2c_NVIC_SetPriority4
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
BAL	L_stm32f4xx_i2c_NVIC_SetPriority5
L_stm32f4xx_i2c_NVIC_SetPriority4:
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
L_stm32f4xx_i2c_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_i2c_NVIC_SetPriority
stm32f4xx_i2c_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_i2c_NVIC_GetPriority6
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
L_stm32f4xx_i2c_NVIC_GetPriority6:
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
; end of stm32f4xx_i2c_NVIC_GetPriority
stm32f4xx_i2c_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_i2c_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_i2c_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_i2c_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_i2c_NVIC_EncodePriority9
L_stm32f4xx_i2c_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_i2c_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_i2c_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_i2c_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_i2c_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_i2c_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_i2c_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_i2c_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_i2c_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_i2c_NVIC_EncodePriority11
L_stm32f4xx_i2c_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_i2c_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_i2c_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_i2c_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_i2c_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_i2c_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_i2c_NVIC_EncodePriority
stm32f4xx_i2c_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_i2c_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_i2c_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_i2c_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_i2c_NVIC_DecodePriority13
L_stm32f4xx_i2c_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_i2c_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_i2c_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_i2c_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_i2c_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_i2c_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_i2c_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_i2c_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_i2c_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_i2c_NVIC_DecodePriority15
L_stm32f4xx_i2c_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_i2c_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_i2c_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_i2c_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_i2c_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_i2c_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_i2c_NVIC_DecodePriority
stm32f4xx_i2c_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_i2c___DSB+0
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
BL	stm32f4xx_i2c___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_i2c_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_i2c_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_i2c_NVIC_SystemReset
stm32f4xx_i2c_SysTick_Config:
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
BLS	L_stm32f4xx_i2c_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_i2c_SysTick_Config18:
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
BL	stm32f4xx_i2c_NVIC_SetPriority+0
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
; end of stm32f4xx_i2c_SysTick_Config
stm32f4xx_i2c_ITM_SendChar:
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
BEQ	L_stm32f4xx_i2c_ITM_SendChar90
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_i2c_ITM_SendChar91
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_i2c_ITM_SendChar92
L_stm32f4xx_i2c_ITM_SendChar86:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_i2c_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_i2c_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_i2c_ITM_SendChar22
L_stm32f4xx_i2c_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_i2c_ITM_SendChar89
L_stm32f4xx_i2c_ITM_SendChar90:
L_stm32f4xx_i2c_ITM_SendChar89:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_i2c_ITM_SendChar88
L_stm32f4xx_i2c_ITM_SendChar91:
L_stm32f4xx_i2c_ITM_SendChar88:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_i2c_ITM_SendChar87
L_stm32f4xx_i2c_ITM_SendChar92:
L_stm32f4xx_i2c_ITM_SendChar87:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_i2c_ITM_SendChar
stm32f4xx_i2c_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_i2c_ITM_ReceiveChar24
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
L_stm32f4xx_i2c_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_i2c_ITM_ReceiveChar
stm32f4xx_i2c_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_i2c_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_i2c_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_i2c_ITM_CheckChar
_I2C_DeInit:
;stm32f4xx_i2c.c,138 :: 		void I2C_DeInit(I2C_TypeDef* I2Cx)
; I2Cx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
;stm32f4xx_i2c.c,143 :: 		if (I2Cx == I2C1)
MOVW	R1, #21504
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_I2C_DeInit27
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,146 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C1, ENABLE);
MOVS	R1, #1
MOV	R0, #2097152
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_i2c.c,148 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C1, DISABLE);
MOVS	R1, #0
MOV	R0, #2097152
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_i2c.c,149 :: 		}
IT	AL
BAL	L_I2C_DeInit28
L_I2C_DeInit27:
;stm32f4xx_i2c.c,150 :: 		else if (I2Cx == I2C2)
; I2Cx start address is: 0 (R0)
MOVW	R1, #22528
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_I2C_DeInit29
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,153 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C2, ENABLE);
MOVS	R1, #1
MOV	R0, #4194304
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_i2c.c,155 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C2, DISABLE);
MOVS	R1, #0
MOV	R0, #4194304
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_i2c.c,156 :: 		}
IT	AL
BAL	L_I2C_DeInit30
L_I2C_DeInit29:
;stm32f4xx_i2c.c,159 :: 		if (I2Cx == I2C3)
; I2Cx start address is: 0 (R0)
MOVW	R1, #23552
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_I2C_DeInit31
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,162 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C3, ENABLE);
MOVS	R1, #1
MOV	R0, #8388608
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_i2c.c,164 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C3, DISABLE);
MOVS	R1, #0
MOV	R0, #8388608
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_i2c.c,165 :: 		}
L_I2C_DeInit31:
;stm32f4xx_i2c.c,166 :: 		}
L_I2C_DeInit30:
L_I2C_DeInit28:
;stm32f4xx_i2c.c,167 :: 		}
L_end_I2C_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _I2C_DeInit
_I2C_Init:
;stm32f4xx_i2c.c,181 :: 		void I2C_Init(I2C_TypeDef* I2Cx, I2C_InitTypeDef* I2C_InitStruct)
; I2C_InitStruct start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
SUB	SP, SP, #32
STR	LR, [SP, #0]
; I2C_InitStruct end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_InitStruct start address is: 4 (R1)
;stm32f4xx_i2c.c,183 :: 		uint16_t tmpreg = 0, freqrange = 0;
;stm32f4xx_i2c.c,184 :: 		uint16_t result = 0x04;
;stm32f4xx_i2c.c,185 :: 		uint32_t pclk1 = 8000000;
;stm32f4xx_i2c.c,198 :: 		tmpreg = I2Cx->CR2;
ADDS	R2, R0, #4
LDRH	R3, [R2, #0]
;stm32f4xx_i2c.c,200 :: 		tmpreg &= (uint16_t)~((uint16_t)I2C_CR2_FREQ);
MOVW	R2, #65472
AND	R4, R3, R2, LSL #0
UXTH	R4, R4
; tmpreg start address is: 16 (R4)
;stm32f4xx_i2c.c,202 :: 		RCC_GetClocksFreq(&rcc_clocks);
ADD	R2, SP, #16
STRH	R4, [SP, #4]
STR	R1, [SP, #8]
STR	R0, [SP, #12]
MOV	R0, R2
BL	_RCC_GetClocksFreq+0
LDR	R0, [SP, #12]
LDR	R1, [SP, #8]
LDRH	R4, [SP, #4]
;stm32f4xx_i2c.c,203 :: 		pclk1 = rcc_clocks.PCLK1_Frequency;
; pclk1 start address is: 24 (R6)
LDR	R6, [SP, #24]
;stm32f4xx_i2c.c,205 :: 		freqrange = (uint16_t)(pclk1 / 1000000);
LDR	R3, [SP, #24]
MOVW	R2, #16960
MOVT	R2, #15
UDIV	R2, R3, R2
; freqrange start address is: 20 (R5)
UXTH	R5, R2
;stm32f4xx_i2c.c,206 :: 		tmpreg |= freqrange;
UXTH	R2, R2
ORR	R3, R4, R2, LSL #0
; tmpreg end address is: 16 (R4)
;stm32f4xx_i2c.c,208 :: 		I2Cx->CR2 = tmpreg;
ADDS	R2, R0, #4
STRH	R3, [R2, #0]
;stm32f4xx_i2c.c,212 :: 		I2Cx->CR1 &= (uint16_t)~((uint16_t)I2C_CR1_PE);
LDRH	R3, [R0, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
;stm32f4xx_i2c.c,215 :: 		tmpreg = 0;
; tmpreg start address is: 16 (R4)
MOVW	R4, #0
;stm32f4xx_i2c.c,218 :: 		if (I2C_InitStruct->I2C_ClockSpeed <= 100000)
LDR	R3, [R1, #0]
MOVW	R2, #34464
MOVT	R2, #1
CMP	R3, R2
IT	HI
BHI	L_I2C_Init32
;stm32f4xx_i2c.c,221 :: 		result = (uint16_t)(pclk1 / (I2C_InitStruct->I2C_ClockSpeed << 1));
LDR	R2, [R1, #0]
LSLS	R2, R2, #1
UDIV	R2, R6, R2
; pclk1 end address is: 24 (R6)
; result start address is: 12 (R3)
UXTH	R3, R2
;stm32f4xx_i2c.c,223 :: 		if (result < 0x04)
UXTH	R2, R2
CMP	R2, #4
IT	GE
BGE	L__I2C_Init93
; result end address is: 12 (R3)
;stm32f4xx_i2c.c,226 :: 		result = 0x04;
; result start address is: 8 (R2)
MOVW	R2, #4
; result end address is: 8 (R2)
UXTH	R3, R2
;stm32f4xx_i2c.c,227 :: 		}
IT	AL
BAL	L_I2C_Init33
L__I2C_Init93:
;stm32f4xx_i2c.c,223 :: 		if (result < 0x04)
;stm32f4xx_i2c.c,227 :: 		}
L_I2C_Init33:
;stm32f4xx_i2c.c,229 :: 		tmpreg |= result;
; result start address is: 12 (R3)
ORRS	R4, R3
UXTH	R4, R4
; result end address is: 12 (R3)
;stm32f4xx_i2c.c,231 :: 		I2Cx->TRISE = freqrange + 1;
ADDW	R3, R0, #32
ADDS	R2, R5, #1
; freqrange end address is: 20 (R5)
STRH	R2, [R3, #0]
;stm32f4xx_i2c.c,232 :: 		}
UXTH	R3, R4
IT	AL
BAL	L_I2C_Init34
L_I2C_Init32:
;stm32f4xx_i2c.c,238 :: 		if (I2C_InitStruct->I2C_DutyCycle == I2C_DutyCycle_2)
; freqrange start address is: 20 (R5)
; pclk1 start address is: 24 (R6)
ADDS	R2, R1, #6
LDRH	R3, [R2, #0]
MOVW	R2, #49151
CMP	R3, R2
IT	NE
BNE	L_I2C_Init35
;stm32f4xx_i2c.c,241 :: 		result = (uint16_t)(pclk1 / (I2C_InitStruct->I2C_ClockSpeed * 3));
LDR	R3, [R1, #0]
MOV	R2, #3
MULS	R2, R3, R2
UDIV	R2, R6, R2
; pclk1 end address is: 24 (R6)
; result start address is: 12 (R3)
UXTH	R3, R2
;stm32f4xx_i2c.c,242 :: 		}
; result end address is: 12 (R3)
IT	AL
BAL	L_I2C_Init36
L_I2C_Init35:
;stm32f4xx_i2c.c,246 :: 		result = (uint16_t)(pclk1 / (I2C_InitStruct->I2C_ClockSpeed * 25));
; pclk1 start address is: 24 (R6)
LDR	R3, [R1, #0]
MOV	R2, #25
MULS	R2, R3, R2
UDIV	R2, R6, R2
; pclk1 end address is: 24 (R6)
;stm32f4xx_i2c.c,248 :: 		result |= I2C_DutyCycle_16_9;
UXTH	R2, R2
ORR	R3, R2, #16384
UXTH	R3, R3
; result start address is: 12 (R3)
; result end address is: 12 (R3)
;stm32f4xx_i2c.c,249 :: 		}
L_I2C_Init36:
;stm32f4xx_i2c.c,252 :: 		if ((result & I2C_CCR_CCR) == 0)
; result start address is: 12 (R3)
MOVW	R2, #4095
AND	R2, R3, R2, LSL #0
UXTH	R2, R2
CMP	R2, #0
IT	NE
BNE	L__I2C_Init94
;stm32f4xx_i2c.c,255 :: 		result |= (uint16_t)0x0001;
ORR	R3, R3, #1
UXTH	R3, R3
; result end address is: 12 (R3)
;stm32f4xx_i2c.c,256 :: 		}
IT	AL
BAL	L_I2C_Init37
L__I2C_Init94:
;stm32f4xx_i2c.c,252 :: 		if ((result & I2C_CCR_CCR) == 0)
;stm32f4xx_i2c.c,256 :: 		}
L_I2C_Init37:
;stm32f4xx_i2c.c,258 :: 		tmpreg |= (uint16_t)(result | I2C_CCR_FS);
; result start address is: 12 (R3)
ORR	R2, R3, #32768
UXTH	R2, R2
; result end address is: 12 (R3)
ORR	R2, R4, R2, LSL #0
; tmpreg end address is: 16 (R4)
; tmpreg start address is: 24 (R6)
UXTH	R6, R2
;stm32f4xx_i2c.c,260 :: 		I2Cx->TRISE = (uint16_t)(((freqrange * (uint16_t)300) / (uint16_t)1000) + (uint16_t)1);
ADDW	R4, R0, #32
MOVW	R2, #300
MUL	R3, R5, R2
UXTH	R3, R3
; freqrange end address is: 20 (R5)
MOVW	R2, #1000
UDIV	R2, R3, R2
UXTH	R2, R2
ADDS	R2, R2, #1
STRH	R2, [R4, #0]
; tmpreg end address is: 24 (R6)
UXTH	R3, R6
;stm32f4xx_i2c.c,261 :: 		}
L_I2C_Init34:
;stm32f4xx_i2c.c,264 :: 		I2Cx->CCR = tmpreg;
; tmpreg start address is: 12 (R3)
ADDW	R2, R0, #28
STRH	R3, [R2, #0]
; tmpreg end address is: 12 (R3)
;stm32f4xx_i2c.c,266 :: 		I2Cx->CR1 |= I2C_CR1_PE;
LDRH	R2, [R0, #0]
ORR	R2, R2, #1
STRH	R2, [R0, #0]
;stm32f4xx_i2c.c,270 :: 		tmpreg = I2Cx->CR1;
LDRH	R3, [R0, #0]
;stm32f4xx_i2c.c,272 :: 		tmpreg &= CR1_CLEAR_MASK;
MOVW	R2, #64501
AND	R4, R3, R2, LSL #0
UXTH	R4, R4
;stm32f4xx_i2c.c,276 :: 		tmpreg |= (uint16_t)((uint32_t)I2C_InitStruct->I2C_Mode | I2C_InitStruct->I2C_Ack);
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADDW	R2, R1, #10
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
UXTH	R2, R2
ORR	R2, R4, R2, LSL #0
;stm32f4xx_i2c.c,278 :: 		I2Cx->CR1 = tmpreg;
STRH	R2, [R0, #0]
;stm32f4xx_i2c.c,282 :: 		I2Cx->OAR1 = (I2C_InitStruct->I2C_AcknowledgedAddress | I2C_InitStruct->I2C_OwnAddress1);
ADDW	R4, R0, #8
; I2Cx end address is: 0 (R0)
ADDW	R2, R1, #12
LDRH	R3, [R2, #0]
ADDW	R2, R1, #8
; I2C_InitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_i2c.c,283 :: 		}
L_end_I2C_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #32
BX	LR
; end of _I2C_Init
_I2C_StructInit:
;stm32f4xx_i2c.c,290 :: 		void I2C_StructInit(I2C_InitTypeDef* I2C_InitStruct)
; I2C_InitStruct start address is: 0 (R0)
; I2C_InitStruct end address is: 0 (R0)
; I2C_InitStruct start address is: 0 (R0)
;stm32f4xx_i2c.c,294 :: 		I2C_InitStruct->I2C_ClockSpeed = 5000;
MOVW	R1, #5000
MOVT	R1, #0
STR	R1, [R0, #0]
;stm32f4xx_i2c.c,296 :: 		I2C_InitStruct->I2C_Mode = I2C_Mode_I2C;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_i2c.c,298 :: 		I2C_InitStruct->I2C_DutyCycle = I2C_DutyCycle_2;
ADDS	R2, R0, #6
MOVW	R1, #49151
STRH	R1, [R2, #0]
;stm32f4xx_i2c.c,300 :: 		I2C_InitStruct->I2C_OwnAddress1 = 0;
ADDW	R2, R0, #8
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_i2c.c,302 :: 		I2C_InitStruct->I2C_Ack = I2C_Ack_Disable;
ADDW	R2, R0, #10
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_i2c.c,304 :: 		I2C_InitStruct->I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
ADDW	R2, R0, #12
; I2C_InitStruct end address is: 0 (R0)
MOVW	R1, #16384
STRH	R1, [R2, #0]
;stm32f4xx_i2c.c,305 :: 		}
L_end_I2C_StructInit:
BX	LR
; end of _I2C_StructInit
_I2C_Cmd:
;stm32f4xx_i2c.c,314 :: 		void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,319 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_Cmd38
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,322 :: 		I2Cx->CR1 |= I2C_CR1_PE;
LDRH	R2, [R0, #0]
ORR	R2, R2, #1
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,323 :: 		}
IT	AL
BAL	L_I2C_Cmd39
L_I2C_Cmd38:
;stm32f4xx_i2c.c,327 :: 		I2Cx->CR1 &= (uint16_t)~((uint16_t)I2C_CR1_PE);
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,328 :: 		}
L_I2C_Cmd39:
;stm32f4xx_i2c.c,329 :: 		}
L_end_I2C_Cmd:
BX	LR
; end of _I2C_Cmd
_I2C_GenerateSTART:
;stm32f4xx_i2c.c,338 :: 		void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,343 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_GenerateSTART40
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,346 :: 		I2Cx->CR1 |= I2C_CR1_START;
LDRH	R2, [R0, #0]
ORR	R2, R2, #256
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,347 :: 		}
IT	AL
BAL	L_I2C_GenerateSTART41
L_I2C_GenerateSTART40:
;stm32f4xx_i2c.c,351 :: 		I2Cx->CR1 &= (uint16_t)~((uint16_t)I2C_CR1_START);
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65279
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,352 :: 		}
L_I2C_GenerateSTART41:
;stm32f4xx_i2c.c,353 :: 		}
L_end_I2C_GenerateSTART:
BX	LR
; end of _I2C_GenerateSTART
_I2C_GenerateSTOP:
;stm32f4xx_i2c.c,362 :: 		void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,367 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_GenerateSTOP42
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,370 :: 		I2Cx->CR1 |= I2C_CR1_STOP;
LDRH	R2, [R0, #0]
ORR	R2, R2, #512
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,371 :: 		}
IT	AL
BAL	L_I2C_GenerateSTOP43
L_I2C_GenerateSTOP42:
;stm32f4xx_i2c.c,375 :: 		I2Cx->CR1 &= (uint16_t)~((uint16_t)I2C_CR1_STOP);
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65023
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,376 :: 		}
L_I2C_GenerateSTOP43:
;stm32f4xx_i2c.c,377 :: 		}
L_end_I2C_GenerateSTOP:
BX	LR
; end of _I2C_GenerateSTOP
_I2C_Send7bitAddress:
;stm32f4xx_i2c.c,390 :: 		void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, uint8_t I2C_Direction)
; I2C_Direction start address is: 8 (R2)
; Address start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_Direction end address is: 8 (R2)
; Address end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; Address start address is: 4 (R1)
; I2C_Direction start address is: 8 (R2)
;stm32f4xx_i2c.c,396 :: 		if (I2C_Direction != I2C_Direction_Transmitter)
CMP	R2, #0
IT	EQ
BEQ	L_I2C_Send7bitAddress44
; I2C_Direction end address is: 8 (R2)
;stm32f4xx_i2c.c,399 :: 		Address |= I2C_OAR1_ADD0;
ORR	R3, R1, #1
UXTB	R1, R3
;stm32f4xx_i2c.c,400 :: 		}
IT	AL
BAL	L_I2C_Send7bitAddress45
L_I2C_Send7bitAddress44:
;stm32f4xx_i2c.c,404 :: 		Address &= (uint8_t)~((uint8_t)I2C_OAR1_ADD0);
AND	R1, R1, #254
UXTB	R1, R1
; Address end address is: 4 (R1)
;stm32f4xx_i2c.c,405 :: 		}
L_I2C_Send7bitAddress45:
;stm32f4xx_i2c.c,407 :: 		I2Cx->DR = Address;
; Address start address is: 4 (R1)
ADDW	R3, R0, #16
; I2Cx end address is: 0 (R0)
STRH	R1, [R3, #0]
; Address end address is: 4 (R1)
;stm32f4xx_i2c.c,408 :: 		}
L_end_I2C_Send7bitAddress:
BX	LR
; end of _I2C_Send7bitAddress
_I2C_AcknowledgeConfig:
;stm32f4xx_i2c.c,417 :: 		void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,422 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_AcknowledgeConfig46
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,425 :: 		I2Cx->CR1 |= I2C_CR1_ACK;
LDRH	R2, [R0, #0]
ORR	R2, R2, #1024
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,426 :: 		}
IT	AL
BAL	L_I2C_AcknowledgeConfig47
L_I2C_AcknowledgeConfig46:
;stm32f4xx_i2c.c,430 :: 		I2Cx->CR1 &= (uint16_t)~((uint16_t)I2C_CR1_ACK);
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #64511
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,431 :: 		}
L_I2C_AcknowledgeConfig47:
;stm32f4xx_i2c.c,432 :: 		}
L_end_I2C_AcknowledgeConfig:
BX	LR
; end of _I2C_AcknowledgeConfig
_I2C_OwnAddress2Config:
;stm32f4xx_i2c.c,440 :: 		void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
; Address start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; Address end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; Address start address is: 4 (R1)
;stm32f4xx_i2c.c,442 :: 		uint16_t tmpreg = 0;
;stm32f4xx_i2c.c,448 :: 		tmpreg = I2Cx->OAR2;
ADDW	R4, R0, #12
; I2Cx end address is: 0 (R0)
LDRH	R3, [R4, #0]
;stm32f4xx_i2c.c,451 :: 		tmpreg &= (uint16_t)~((uint16_t)I2C_OAR2_ADD2);
MOVW	R2, #65281
ANDS	R3, R2
UXTH	R3, R3
;stm32f4xx_i2c.c,454 :: 		tmpreg |= (uint16_t)((uint16_t)Address & (uint16_t)0x00FE);
UXTB	R2, R1
; Address end address is: 4 (R1)
AND	R2, R2, #254
UXTH	R2, R2
ORR	R2, R3, R2, LSL #0
;stm32f4xx_i2c.c,457 :: 		I2Cx->OAR2 = tmpreg;
STRH	R2, [R4, #0]
;stm32f4xx_i2c.c,458 :: 		}
L_end_I2C_OwnAddress2Config:
BX	LR
; end of _I2C_OwnAddress2Config
_I2C_DualAddressCmd:
;stm32f4xx_i2c.c,467 :: 		void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,472 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_DualAddressCmd48
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,475 :: 		I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
ADDW	R3, R0, #12
; I2Cx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #1
STRH	R2, [R3, #0]
;stm32f4xx_i2c.c,476 :: 		}
IT	AL
BAL	L_I2C_DualAddressCmd49
L_I2C_DualAddressCmd48:
;stm32f4xx_i2c.c,480 :: 		I2Cx->OAR2 &= (uint16_t)~((uint16_t)I2C_OAR2_ENDUAL);
; I2Cx start address is: 0 (R0)
ADDW	R4, R0, #12
; I2Cx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65534
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_i2c.c,481 :: 		}
L_I2C_DualAddressCmd49:
;stm32f4xx_i2c.c,482 :: 		}
L_end_I2C_DualAddressCmd:
BX	LR
; end of _I2C_DualAddressCmd
_I2C_GeneralCallCmd:
;stm32f4xx_i2c.c,491 :: 		void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,496 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_GeneralCallCmd50
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,499 :: 		I2Cx->CR1 |= I2C_CR1_ENGC;
LDRH	R2, [R0, #0]
ORR	R2, R2, #64
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,500 :: 		}
IT	AL
BAL	L_I2C_GeneralCallCmd51
L_I2C_GeneralCallCmd50:
;stm32f4xx_i2c.c,504 :: 		I2Cx->CR1 &= (uint16_t)~((uint16_t)I2C_CR1_ENGC);
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65471
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,505 :: 		}
L_I2C_GeneralCallCmd51:
;stm32f4xx_i2c.c,506 :: 		}
L_end_I2C_GeneralCallCmd:
BX	LR
; end of _I2C_GeneralCallCmd
_I2C_SoftwareResetCmd:
;stm32f4xx_i2c.c,517 :: 		void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,522 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_SoftwareResetCmd52
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,525 :: 		I2Cx->CR1 |= I2C_CR1_SWRST;
LDRH	R2, [R0, #0]
ORR	R2, R2, #32768
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,526 :: 		}
IT	AL
BAL	L_I2C_SoftwareResetCmd53
L_I2C_SoftwareResetCmd52:
;stm32f4xx_i2c.c,530 :: 		I2Cx->CR1 &= (uint16_t)~((uint16_t)I2C_CR1_SWRST);
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #32767
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,531 :: 		}
L_I2C_SoftwareResetCmd53:
;stm32f4xx_i2c.c,532 :: 		}
L_end_I2C_SoftwareResetCmd:
BX	LR
; end of _I2C_SoftwareResetCmd
_I2C_StretchClockCmd:
;stm32f4xx_i2c.c,541 :: 		void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,546 :: 		if (NewState == DISABLE)
CMP	R1, #0
IT	NE
BNE	L_I2C_StretchClockCmd54
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,549 :: 		I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
LDRH	R2, [R0, #0]
ORR	R2, R2, #128
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,550 :: 		}
IT	AL
BAL	L_I2C_StretchClockCmd55
L_I2C_StretchClockCmd54:
;stm32f4xx_i2c.c,554 :: 		I2Cx->CR1 &= (uint16_t)~((uint16_t)I2C_CR1_NOSTRETCH);
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65407
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,555 :: 		}
L_I2C_StretchClockCmd55:
;stm32f4xx_i2c.c,556 :: 		}
L_end_I2C_StretchClockCmd:
BX	LR
; end of _I2C_StretchClockCmd
_I2C_FastModeDutyCycleConfig:
;stm32f4xx_i2c.c,567 :: 		void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, uint16_t I2C_DutyCycle)
; I2C_DutyCycle start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_DutyCycle end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_DutyCycle start address is: 4 (R1)
;stm32f4xx_i2c.c,572 :: 		if (I2C_DutyCycle != I2C_DutyCycle_16_9)
CMP	R1, #16384
IT	EQ
BEQ	L_I2C_FastModeDutyCycleConfig56
; I2C_DutyCycle end address is: 4 (R1)
;stm32f4xx_i2c.c,575 :: 		I2Cx->CCR &= I2C_DutyCycle_2;
ADDW	R4, R0, #28
; I2Cx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #49151
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_i2c.c,576 :: 		}
IT	AL
BAL	L_I2C_FastModeDutyCycleConfig57
L_I2C_FastModeDutyCycleConfig56:
;stm32f4xx_i2c.c,580 :: 		I2Cx->CCR |= I2C_DutyCycle_16_9;
; I2Cx start address is: 0 (R0)
ADDW	R3, R0, #28
; I2Cx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #16384
STRH	R2, [R3, #0]
;stm32f4xx_i2c.c,581 :: 		}
L_I2C_FastModeDutyCycleConfig57:
;stm32f4xx_i2c.c,582 :: 		}
L_end_I2C_FastModeDutyCycleConfig:
BX	LR
; end of _I2C_FastModeDutyCycleConfig
_I2C_NACKPositionConfig:
;stm32f4xx_i2c.c,605 :: 		void I2C_NACKPositionConfig(I2C_TypeDef* I2Cx, uint16_t I2C_NACKPosition)
; I2C_NACKPosition start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_NACKPosition end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_NACKPosition start address is: 4 (R1)
;stm32f4xx_i2c.c,612 :: 		if (I2C_NACKPosition == I2C_NACKPosition_Next)
CMP	R1, #2048
IT	NE
BNE	L_I2C_NACKPositionConfig58
; I2C_NACKPosition end address is: 4 (R1)
;stm32f4xx_i2c.c,615 :: 		I2Cx->CR1 |= I2C_NACKPosition_Next;
LDRH	R2, [R0, #0]
ORR	R2, R2, #2048
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,616 :: 		}
IT	AL
BAL	L_I2C_NACKPositionConfig59
L_I2C_NACKPositionConfig58:
;stm32f4xx_i2c.c,620 :: 		I2Cx->CR1 &= I2C_NACKPosition_Current;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,621 :: 		}
L_I2C_NACKPositionConfig59:
;stm32f4xx_i2c.c,622 :: 		}
L_end_I2C_NACKPositionConfig:
BX	LR
; end of _I2C_NACKPositionConfig
_I2C_SMBusAlertConfig:
;stm32f4xx_i2c.c,633 :: 		void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, uint16_t I2C_SMBusAlert)
; I2C_SMBusAlert start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_SMBusAlert end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_SMBusAlert start address is: 4 (R1)
;stm32f4xx_i2c.c,638 :: 		if (I2C_SMBusAlert == I2C_SMBusAlert_Low)
CMP	R1, #8192
IT	NE
BNE	L_I2C_SMBusAlertConfig60
; I2C_SMBusAlert end address is: 4 (R1)
;stm32f4xx_i2c.c,641 :: 		I2Cx->CR1 |= I2C_SMBusAlert_Low;
LDRH	R2, [R0, #0]
ORR	R2, R2, #8192
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,642 :: 		}
IT	AL
BAL	L_I2C_SMBusAlertConfig61
L_I2C_SMBusAlertConfig60:
;stm32f4xx_i2c.c,646 :: 		I2Cx->CR1 &= I2C_SMBusAlert_High;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #57343
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,647 :: 		}
L_I2C_SMBusAlertConfig61:
;stm32f4xx_i2c.c,648 :: 		}
L_end_I2C_SMBusAlertConfig:
BX	LR
; end of _I2C_SMBusAlertConfig
_I2C_ARPCmd:
;stm32f4xx_i2c.c,657 :: 		void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,662 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_ARPCmd62
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,665 :: 		I2Cx->CR1 |= I2C_CR1_ENARP;
LDRH	R2, [R0, #0]
ORR	R2, R2, #16
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,666 :: 		}
IT	AL
BAL	L_I2C_ARPCmd63
L_I2C_ARPCmd62:
;stm32f4xx_i2c.c,670 :: 		I2Cx->CR1 &= (uint16_t)~((uint16_t)I2C_CR1_ENARP);
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65519
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,671 :: 		}
L_I2C_ARPCmd63:
;stm32f4xx_i2c.c,672 :: 		}
L_end_I2C_ARPCmd:
BX	LR
; end of _I2C_ARPCmd
_I2C_SendData:
;stm32f4xx_i2c.c,695 :: 		void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
; Data start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; Data end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; Data start address is: 4 (R1)
;stm32f4xx_i2c.c,700 :: 		I2Cx->DR = Data;
ADDW	R2, R0, #16
; I2Cx end address is: 0 (R0)
STRH	R1, [R2, #0]
; Data end address is: 4 (R1)
;stm32f4xx_i2c.c,701 :: 		}
L_end_I2C_SendData:
BX	LR
; end of _I2C_SendData
_I2C_ReceiveData:
;stm32f4xx_i2c.c,708 :: 		uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
; I2Cx start address is: 0 (R0)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
;stm32f4xx_i2c.c,713 :: 		return (uint8_t)I2Cx->DR;
ADDW	R1, R0, #16
; I2Cx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTB	R0, R1
;stm32f4xx_i2c.c,714 :: 		}
L_end_I2C_ReceiveData:
BX	LR
; end of _I2C_ReceiveData
_I2C_TransmitPEC:
;stm32f4xx_i2c.c,739 :: 		void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,744 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_TransmitPEC64
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,747 :: 		I2Cx->CR1 |= I2C_CR1_PEC;
LDRH	R2, [R0, #0]
ORR	R2, R2, #4096
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,748 :: 		}
IT	AL
BAL	L_I2C_TransmitPEC65
L_I2C_TransmitPEC64:
;stm32f4xx_i2c.c,752 :: 		I2Cx->CR1 &= (uint16_t)~((uint16_t)I2C_CR1_PEC);
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #61439
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,753 :: 		}
L_I2C_TransmitPEC65:
;stm32f4xx_i2c.c,754 :: 		}
L_end_I2C_TransmitPEC:
BX	LR
; end of _I2C_TransmitPEC
_I2C_PECPositionConfig:
;stm32f4xx_i2c.c,770 :: 		void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, uint16_t I2C_PECPosition)
; I2C_PECPosition start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_PECPosition end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_PECPosition start address is: 4 (R1)
;stm32f4xx_i2c.c,775 :: 		if (I2C_PECPosition == I2C_PECPosition_Next)
CMP	R1, #2048
IT	NE
BNE	L_I2C_PECPositionConfig66
; I2C_PECPosition end address is: 4 (R1)
;stm32f4xx_i2c.c,778 :: 		I2Cx->CR1 |= I2C_PECPosition_Next;
LDRH	R2, [R0, #0]
ORR	R2, R2, #2048
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,779 :: 		}
IT	AL
BAL	L_I2C_PECPositionConfig67
L_I2C_PECPositionConfig66:
;stm32f4xx_i2c.c,783 :: 		I2Cx->CR1 &= I2C_PECPosition_Current;
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,784 :: 		}
L_I2C_PECPositionConfig67:
;stm32f4xx_i2c.c,785 :: 		}
L_end_I2C_PECPositionConfig:
BX	LR
; end of _I2C_PECPositionConfig
_I2C_CalculatePEC:
;stm32f4xx_i2c.c,794 :: 		void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,799 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_CalculatePEC68
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,802 :: 		I2Cx->CR1 |= I2C_CR1_ENPEC;
LDRH	R2, [R0, #0]
ORR	R2, R2, #32
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,803 :: 		}
IT	AL
BAL	L_I2C_CalculatePEC69
L_I2C_CalculatePEC68:
;stm32f4xx_i2c.c,807 :: 		I2Cx->CR1 &= (uint16_t)~((uint16_t)I2C_CR1_ENPEC);
; I2Cx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65503
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; I2Cx end address is: 0 (R0)
;stm32f4xx_i2c.c,808 :: 		}
L_I2C_CalculatePEC69:
;stm32f4xx_i2c.c,809 :: 		}
L_end_I2C_CalculatePEC:
BX	LR
; end of _I2C_CalculatePEC
_I2C_GetPEC:
;stm32f4xx_i2c.c,816 :: 		uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
; I2Cx start address is: 0 (R0)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
;stm32f4xx_i2c.c,821 :: 		return ((I2Cx->SR2) >> 8);
ADDW	R1, R0, #24
; I2Cx end address is: 0 (R0)
LDRH	R1, [R1, #0]
LSRS	R1, R1, #8
UXTB	R0, R1
;stm32f4xx_i2c.c,822 :: 		}
L_end_I2C_GetPEC:
BX	LR
; end of _I2C_GetPEC
_I2C_DMACmd:
;stm32f4xx_i2c.c,849 :: 		void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,854 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_DMACmd70
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,857 :: 		I2Cx->CR2 |= I2C_CR2_DMAEN;
ADDS	R3, R0, #4
; I2Cx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #2048
STRH	R2, [R3, #0]
;stm32f4xx_i2c.c,858 :: 		}
IT	AL
BAL	L_I2C_DMACmd71
L_I2C_DMACmd70:
;stm32f4xx_i2c.c,862 :: 		I2Cx->CR2 &= (uint16_t)~((uint16_t)I2C_CR2_DMAEN);
; I2Cx start address is: 0 (R0)
ADDS	R4, R0, #4
; I2Cx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_i2c.c,863 :: 		}
L_I2C_DMACmd71:
;stm32f4xx_i2c.c,864 :: 		}
L_end_I2C_DMACmd:
BX	LR
; end of _I2C_DMACmd
_I2C_DMALastTransferCmd:
;stm32f4xx_i2c.c,873 :: 		void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_i2c.c,878 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2C_DMALastTransferCmd72
; NewState end address is: 4 (R1)
;stm32f4xx_i2c.c,881 :: 		I2Cx->CR2 |= I2C_CR2_LAST;
ADDS	R3, R0, #4
; I2Cx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #4096
STRH	R2, [R3, #0]
;stm32f4xx_i2c.c,882 :: 		}
IT	AL
BAL	L_I2C_DMALastTransferCmd73
L_I2C_DMALastTransferCmd72:
;stm32f4xx_i2c.c,886 :: 		I2Cx->CR2 &= (uint16_t)~((uint16_t)I2C_CR2_LAST);
; I2Cx start address is: 0 (R0)
ADDS	R4, R0, #4
; I2Cx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #61439
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_i2c.c,887 :: 		}
L_I2C_DMALastTransferCmd73:
;stm32f4xx_i2c.c,888 :: 		}
L_end_I2C_DMALastTransferCmd:
BX	LR
; end of _I2C_DMALastTransferCmd
_I2C_ReadRegister:
;stm32f4xx_i2c.c,1011 :: 		uint16_t I2C_ReadRegister(I2C_TypeDef* I2Cx, uint8_t I2C_Register)
; I2C_Register start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
MOV	R2, R0
; I2C_Register end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 8 (R2)
; I2C_Register start address is: 4 (R1)
;stm32f4xx_i2c.c,1013 :: 		__IO uint32_t tmp = 0;
;stm32f4xx_i2c.c,1019 :: 		tmp = (uint32_t) I2Cx;
; tmp start address is: 0 (R0)
MOV	R0, R2
; I2Cx end address is: 8 (R2)
;stm32f4xx_i2c.c,1020 :: 		tmp += I2C_Register;
ADDS	R0, R0, R1
; I2C_Register end address is: 4 (R1)
;stm32f4xx_i2c.c,1023 :: 		return (*(__IO uint16_t *) tmp);
MOV	R2, R0
; tmp end address is: 0 (R0)
LDRH	R2, [R2, #0]
UXTH	R0, R2
;stm32f4xx_i2c.c,1024 :: 		}
L_end_I2C_ReadRegister:
BX	LR
; end of _I2C_ReadRegister
_I2C_ITConfig:
;stm32f4xx_i2c.c,1038 :: 		void I2C_ITConfig(I2C_TypeDef* I2Cx, uint16_t I2C_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; I2C_IT start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; I2C_IT end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f4xx_i2c.c,1045 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_I2C_ITConfig74
; NewState end address is: 8 (R2)
;stm32f4xx_i2c.c,1048 :: 		I2Cx->CR2 |= I2C_IT;
ADDS	R4, R0, #4
; I2Cx end address is: 0 (R0)
LDRH	R3, [R4, #0]
ORRS	R3, R1
; I2C_IT end address is: 4 (R1)
STRH	R3, [R4, #0]
;stm32f4xx_i2c.c,1049 :: 		}
IT	AL
BAL	L_I2C_ITConfig75
L_I2C_ITConfig74:
;stm32f4xx_i2c.c,1053 :: 		I2Cx->CR2 &= (uint16_t)~I2C_IT;
; I2C_IT start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
ADDS	R5, R0, #4
; I2Cx end address is: 0 (R0)
MVN	R4, R1
UXTH	R4, R4
; I2C_IT end address is: 4 (R1)
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f4xx_i2c.c,1054 :: 		}
L_I2C_ITConfig75:
;stm32f4xx_i2c.c,1055 :: 		}
L_end_I2C_ITConfig:
BX	LR
; end of _I2C_ITConfig
_I2C_CheckEvent:
;stm32f4xx_i2c.c,1097 :: 		ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, uint32_t I2C_EVENT)
; I2C_EVENT start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
MOV	R3, R0
; I2C_EVENT end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 12 (R3)
; I2C_EVENT start address is: 4 (R1)
;stm32f4xx_i2c.c,1099 :: 		uint32_t lastevent = 0;
;stm32f4xx_i2c.c,1100 :: 		uint32_t flag1 = 0, flag2 = 0;
;stm32f4xx_i2c.c,1101 :: 		ErrorStatus status = ERROR;
;stm32f4xx_i2c.c,1108 :: 		flag1 = I2Cx->SR1;
ADDW	R2, R3, #20
LDRH	R2, [R2, #0]
; flag1 start address is: 0 (R0)
UXTH	R0, R2
;stm32f4xx_i2c.c,1109 :: 		flag2 = I2Cx->SR2;
ADDW	R2, R3, #24
; I2Cx end address is: 12 (R3)
LDRH	R2, [R2, #0]
; flag2 start address is: 12 (R3)
UXTH	R3, R2
;stm32f4xx_i2c.c,1110 :: 		flag2 = flag2 << 16;
LSLS	R2, R3, #16
; flag2 end address is: 12 (R3)
;stm32f4xx_i2c.c,1113 :: 		lastevent = (flag1 | flag2) & FLAG_MASK;
ORR	R3, R0, R2, LSL #0
; flag1 end address is: 0 (R0)
MVN	R2, #-16777216
AND	R2, R3, R2, LSL #0
;stm32f4xx_i2c.c,1116 :: 		if ((lastevent & I2C_EVENT) == I2C_EVENT)
ANDS	R2, R1
CMP	R2, R1
IT	NE
BNE	L_I2C_CheckEvent76
; I2C_EVENT end address is: 4 (R1)
;stm32f4xx_i2c.c,1119 :: 		status = SUCCESS;
; status start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_i2c.c,1120 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_I2C_CheckEvent77
L_I2C_CheckEvent76:
;stm32f4xx_i2c.c,1124 :: 		status = ERROR;
; status start address is: 0 (R0)
MOVS	R0, #0
; status end address is: 0 (R0)
;stm32f4xx_i2c.c,1125 :: 		}
L_I2C_CheckEvent77:
;stm32f4xx_i2c.c,1127 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;stm32f4xx_i2c.c,1128 :: 		}
L_end_I2C_CheckEvent:
BX	LR
; end of _I2C_CheckEvent
_I2C_GetLastEvent:
;stm32f4xx_i2c.c,1145 :: 		uint32_t I2C_GetLastEvent(I2C_TypeDef* I2Cx)
; I2Cx start address is: 0 (R0)
MOV	R2, R0
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 8 (R2)
;stm32f4xx_i2c.c,1147 :: 		uint32_t lastevent = 0;
;stm32f4xx_i2c.c,1148 :: 		uint32_t flag1 = 0, flag2 = 0;
;stm32f4xx_i2c.c,1154 :: 		flag1 = I2Cx->SR1;
ADDW	R1, R2, #20
LDRH	R1, [R1, #0]
; flag1 start address is: 0 (R0)
UXTH	R0, R1
;stm32f4xx_i2c.c,1155 :: 		flag2 = I2Cx->SR2;
ADDW	R1, R2, #24
; I2Cx end address is: 8 (R2)
LDRH	R1, [R1, #0]
; flag2 start address is: 8 (R2)
UXTH	R2, R1
;stm32f4xx_i2c.c,1156 :: 		flag2 = flag2 << 16;
LSLS	R1, R2, #16
; flag2 end address is: 8 (R2)
;stm32f4xx_i2c.c,1159 :: 		lastevent = (flag1 | flag2) & FLAG_MASK;
ORR	R2, R0, R1, LSL #0
; flag1 end address is: 0 (R0)
MVN	R1, #-16777216
AND	R1, R2, R1, LSL #0
;stm32f4xx_i2c.c,1162 :: 		return lastevent;
MOV	R0, R1
;stm32f4xx_i2c.c,1163 :: 		}
L_end_I2C_GetLastEvent:
BX	LR
; end of _I2C_GetLastEvent
_I2C_GetFlagStatus:
;stm32f4xx_i2c.c,1200 :: 		FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, uint32_t I2C_FLAG)
; I2C_FLAG start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
MOV	R2, R0
; I2C_FLAG end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 8 (R2)
; I2C_FLAG start address is: 4 (R1)
;stm32f4xx_i2c.c,1202 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_i2c.c,1203 :: 		__IO uint32_t i2creg = 0, i2cxbase = 0;
;stm32f4xx_i2c.c,1210 :: 		i2cxbase = (uint32_t)I2Cx;
; i2cxbase start address is: 0 (R0)
MOV	R0, R2
; I2Cx end address is: 8 (R2)
;stm32f4xx_i2c.c,1213 :: 		i2creg = I2C_FLAG >> 28;
LSRS	R2, R1, #28
; i2creg start address is: 12 (R3)
MOV	R3, R2
;stm32f4xx_i2c.c,1216 :: 		I2C_FLAG &= FLAG_MASK;
MVN	R2, #-16777216
ANDS	R1, R2
;stm32f4xx_i2c.c,1218 :: 		if(i2creg != 0)
CMP	R3, #0
IT	EQ
BEQ	L_I2C_GetFlagStatus78
; i2creg end address is: 12 (R3)
;stm32f4xx_i2c.c,1221 :: 		i2cxbase += 0x14;
ADDS	R0, #20
;stm32f4xx_i2c.c,1222 :: 		}
IT	AL
BAL	L_I2C_GetFlagStatus79
L_I2C_GetFlagStatus78:
;stm32f4xx_i2c.c,1226 :: 		I2C_FLAG = (uint32_t)(I2C_FLAG >> 16);
LSRS	R1, R1, #16
;stm32f4xx_i2c.c,1228 :: 		i2cxbase += 0x18;
ADDS	R0, #24
; i2cxbase end address is: 0 (R0)
; I2C_FLAG end address is: 4 (R1)
;stm32f4xx_i2c.c,1229 :: 		}
L_I2C_GetFlagStatus79:
;stm32f4xx_i2c.c,1231 :: 		if(((*(__IO uint32_t *)i2cxbase) & I2C_FLAG) != (uint32_t)RESET)
; i2cxbase start address is: 0 (R0)
; I2C_FLAG start address is: 4 (R1)
MOV	R2, R0
; i2cxbase end address is: 0 (R0)
LDR	R2, [R2, #0]
ANDS	R2, R1
; I2C_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_I2C_GetFlagStatus80
;stm32f4xx_i2c.c,1234 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_i2c.c,1235 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_I2C_GetFlagStatus81
L_I2C_GetFlagStatus80:
;stm32f4xx_i2c.c,1239 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_i2c.c,1240 :: 		}
L_I2C_GetFlagStatus81:
;stm32f4xx_i2c.c,1243 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_i2c.c,1244 :: 		}
L_end_I2C_GetFlagStatus:
BX	LR
; end of _I2C_GetFlagStatus
_I2C_ClearFlag:
;stm32f4xx_i2c.c,1277 :: 		void I2C_ClearFlag(I2C_TypeDef* I2Cx, uint32_t I2C_FLAG)
; I2C_FLAG start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_FLAG end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_FLAG start address is: 4 (R1)
;stm32f4xx_i2c.c,1279 :: 		uint32_t flagpos = 0;
;stm32f4xx_i2c.c,1284 :: 		flagpos = I2C_FLAG & FLAG_MASK;
MVN	R2, #-16777216
AND	R2, R1, R2, LSL #0
; I2C_FLAG end address is: 4 (R1)
;stm32f4xx_i2c.c,1286 :: 		I2Cx->SR1 = (uint16_t)~flagpos;
ADDW	R3, R0, #20
; I2Cx end address is: 0 (R0)
MVN	R2, R2
UXTH	R2, R2
STRH	R2, [R3, #0]
;stm32f4xx_i2c.c,1287 :: 		}
L_end_I2C_ClearFlag:
BX	LR
; end of _I2C_ClearFlag
_I2C_GetITStatus:
;stm32f4xx_i2c.c,1311 :: 		ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, uint32_t I2C_IT)
; I2C_IT start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_IT end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_IT start address is: 4 (R1)
;stm32f4xx_i2c.c,1313 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_i2c.c,1314 :: 		uint32_t enablestatus = 0;
;stm32f4xx_i2c.c,1321 :: 		enablestatus = (uint32_t)(((I2C_IT & ITEN_MASK) >> 16) & (I2Cx->CR2)) ;
AND	R2, R1, #117440512
LSRS	R3, R2, #16
ADDS	R2, R0, #4
LDRH	R2, [R2, #0]
AND	R2, R3, R2, LSL #0
; enablestatus start address is: 16 (R4)
MOV	R4, R2
;stm32f4xx_i2c.c,1324 :: 		I2C_IT &= FLAG_MASK;
MVN	R2, #-16777216
AND	R3, R1, R2, LSL #0
; I2C_IT end address is: 4 (R1)
;stm32f4xx_i2c.c,1327 :: 		if (((I2Cx->SR1 & I2C_IT) != (uint32_t)RESET) && enablestatus)
ADDW	R2, R0, #20
; I2Cx end address is: 0 (R0)
LDRH	R2, [R2, #0]
ANDS	R2, R3
CMP	R2, #0
IT	EQ
BEQ	L__I2C_GetITStatus97
CMP	R4, #0
IT	EQ
BEQ	L__I2C_GetITStatus96
; enablestatus end address is: 16 (R4)
L__I2C_GetITStatus95:
;stm32f4xx_i2c.c,1330 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_i2c.c,1331 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_I2C_GetITStatus85
;stm32f4xx_i2c.c,1327 :: 		if (((I2Cx->SR1 & I2C_IT) != (uint32_t)RESET) && enablestatus)
L__I2C_GetITStatus97:
L__I2C_GetITStatus96:
;stm32f4xx_i2c.c,1335 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_i2c.c,1336 :: 		}
L_I2C_GetITStatus85:
;stm32f4xx_i2c.c,1338 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_i2c.c,1339 :: 		}
L_end_I2C_GetITStatus:
BX	LR
; end of _I2C_GetITStatus
_I2C_ClearITPendingBit:
;stm32f4xx_i2c.c,1371 :: 		void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, uint32_t I2C_IT)
; I2C_IT start address is: 4 (R1)
; I2Cx start address is: 0 (R0)
; I2C_IT end address is: 4 (R1)
; I2Cx end address is: 0 (R0)
; I2Cx start address is: 0 (R0)
; I2C_IT start address is: 4 (R1)
;stm32f4xx_i2c.c,1373 :: 		uint32_t flagpos = 0;
;stm32f4xx_i2c.c,1379 :: 		flagpos = I2C_IT & FLAG_MASK;
MVN	R2, #-16777216
AND	R2, R1, R2, LSL #0
; I2C_IT end address is: 4 (R1)
;stm32f4xx_i2c.c,1382 :: 		I2Cx->SR1 = (uint16_t)~flagpos;
ADDW	R3, R0, #20
; I2Cx end address is: 0 (R0)
MVN	R2, R2
UXTH	R2, R2
STRH	R2, [R3, #0]
;stm32f4xx_i2c.c,1383 :: 		}
L_end_I2C_ClearITPendingBit:
BX	LR
; end of _I2C_ClearITPendingBit
