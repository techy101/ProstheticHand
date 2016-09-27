stm32f4xx_spi___DSB:
;core_cminstr.h,584 :: 		static void __DSB(){
;core_cminstr.h,585 :: 		asm dsb;
DSB	#15
;core_cminstr.h,586 :: 		}
L_end___DSB:
BX	LR
; end of stm32f4xx_spi___DSB
stm32f4xx_spi___WFI:
;core_cminstr.h,587 :: 		static void __WFI(){
;core_cminstr.h,588 :: 		asm wfi;
WFI
;core_cminstr.h,589 :: 		}
L_end___WFI:
BX	LR
; end of stm32f4xx_spi___WFI
stm32f4xx_spi___WFE:
;core_cminstr.h,590 :: 		static void __WFE(){
;core_cminstr.h,591 :: 		asm wfe;
WFE
;core_cminstr.h,592 :: 		}
L_end___WFE:
BX	LR
; end of stm32f4xx_spi___WFE
stm32f4xx_spi___REV:
;core_cminstr.h,594 :: 		static uint32_t __REV(uint32_t value)
;core_cminstr.h,596 :: 		asm rev R0, R0;
REV	R0, R0
;core_cminstr.h,597 :: 		}
L_end___REV:
BX	LR
; end of stm32f4xx_spi___REV
stm32f4xx_spi_NVIC_SetPriorityGrouping:
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
; end of stm32f4xx_spi_NVIC_SetPriorityGrouping
stm32f4xx_spi_NVIC_GetPriorityGrouping:
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
; end of stm32f4xx_spi_NVIC_GetPriorityGrouping
stm32f4xx_spi_NVIC_EnableIRQ:
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
; end of stm32f4xx_spi_NVIC_EnableIRQ
stm32f4xx_spi_NVIC_DisableIRQ:
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
; end of stm32f4xx_spi_NVIC_DisableIRQ
stm32f4xx_spi_NVIC_GetPendingIRQ:
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
BEQ	L_stm32f4xx_spi_NVIC_GetPendingIRQ0
; ?FLOC__stm32f4xx_spi_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_spi_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_spi_NVIC_GetPendingIRQ1
L_stm32f4xx_spi_NVIC_GetPendingIRQ0:
; ?FLOC__stm32f4xx_spi_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_spi_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
L_stm32f4xx_spi_NVIC_GetPendingIRQ1:
; ?FLOC__stm32f4xx_spi_NVIC_GetPendingIRQ?T47 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_spi_NVIC_GetPendingIRQ?T47 end address is: 0 (R0)
;core_cm4.h,1112 :: 		}
L_end_NVIC_GetPendingIRQ:
BX	LR
; end of stm32f4xx_spi_NVIC_GetPendingIRQ
stm32f4xx_spi_NVIC_SetPendingIRQ:
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
; end of stm32f4xx_spi_NVIC_SetPendingIRQ
stm32f4xx_spi_NVIC_ClearPendingIRQ:
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
; end of stm32f4xx_spi_NVIC_ClearPendingIRQ
stm32f4xx_spi_NVIC_GetActive:
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
BEQ	L_stm32f4xx_spi_NVIC_GetActive2
; ?FLOC__stm32f4xx_spi_NVIC_GetActive?T78 start address is: 0 (R0)
MOVS	R0, #1
; ?FLOC__stm32f4xx_spi_NVIC_GetActive?T78 end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_spi_NVIC_GetActive3
L_stm32f4xx_spi_NVIC_GetActive2:
; ?FLOC__stm32f4xx_spi_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, #0
; ?FLOC__stm32f4xx_spi_NVIC_GetActive?T78 end address is: 0 (R0)
L_stm32f4xx_spi_NVIC_GetActive3:
; ?FLOC__stm32f4xx_spi_NVIC_GetActive?T78 start address is: 0 (R0)
MOV	R0, R0
; ?FLOC__stm32f4xx_spi_NVIC_GetActive?T78 end address is: 0 (R0)
;core_cm4.h,1151 :: 		}
L_end_NVIC_GetActive:
BX	LR
; end of stm32f4xx_spi_NVIC_GetActive
stm32f4xx_spi_NVIC_SetPriority:
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
BGE	L_stm32f4xx_spi_NVIC_SetPriority4
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
BAL	L_stm32f4xx_spi_NVIC_SetPriority5
L_stm32f4xx_spi_NVIC_SetPriority4:
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
L_stm32f4xx_spi_NVIC_SetPriority5:
;core_cm4.h,1171 :: 		}
L_end_NVIC_SetPriority:
BX	LR
; end of stm32f4xx_spi_NVIC_SetPriority
stm32f4xx_spi_NVIC_GetPriority:
;core_cm4.h,1186 :: 		static __INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
; IRQn start address is: 0 (R0)
; IRQn end address is: 0 (R0)
; IRQn start address is: 0 (R0)
;core_cm4.h,1189 :: 		if(IRQn < 0) {
CMP	R0, #0
IT	GE
BGE	L_stm32f4xx_spi_NVIC_GetPriority6
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
L_stm32f4xx_spi_NVIC_GetPriority6:
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
; end of stm32f4xx_spi_NVIC_GetPriority
stm32f4xx_spi_NVIC_EncodePriority:
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
BLS	L_stm32f4xx_spi_NVIC_EncodePriority8
; ?FLOC__stm32f4xx_spi_NVIC_EncodePriority?T118 start address is: 12 (R3)
MOV	R3, #4
; ?FLOC__stm32f4xx_spi_NVIC_EncodePriority?T118 end address is: 12 (R3)
IT	AL
BAL	L_stm32f4xx_spi_NVIC_EncodePriority9
L_stm32f4xx_spi_NVIC_EncodePriority8:
RSB	R3, R4, #7
; ?FLOC__stm32f4xx_spi_NVIC_EncodePriority?T118 start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_spi_NVIC_EncodePriority?T118 end address is: 0 (R0)
MOV	R3, R0
L_stm32f4xx_spi_NVIC_EncodePriority9:
; ?FLOC__stm32f4xx_spi_NVIC_EncodePriority?T118 start address is: 12 (R3)
; PreemptPriorityBits start address is: 0 (R0)
MOV	R0, R3
; ?FLOC__stm32f4xx_spi_NVIC_EncodePriority?T118 end address is: 12 (R3)
;core_cm4.h,1217 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R3, R4, #4
CMP	R3, #7
IT	CS
BCS	L_stm32f4xx_spi_NVIC_EncodePriority10
; PriorityGroupTmp end address is: 16 (R4)
; ?FLOC__stm32f4xx_spi_NVIC_EncodePriority?T122 start address is: 20 (R5)
MOV	R5, #0
; ?FLOC__stm32f4xx_spi_NVIC_EncodePriority?T122 end address is: 20 (R5)
IT	AL
BAL	L_stm32f4xx_spi_NVIC_EncodePriority11
L_stm32f4xx_spi_NVIC_EncodePriority10:
; PriorityGroupTmp start address is: 16 (R4)
SUBS	R5, R4, #7
; PriorityGroupTmp end address is: 16 (R4)
ADDS	R5, R5, #4
; ?FLOC__stm32f4xx_spi_NVIC_EncodePriority?T122 start address is: 20 (R5)
; ?FLOC__stm32f4xx_spi_NVIC_EncodePriority?T122 end address is: 20 (R5)
L_stm32f4xx_spi_NVIC_EncodePriority11:
;core_cm4.h,1220 :: 		((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
; ?FLOC__stm32f4xx_spi_NVIC_EncodePriority?T122 start address is: 20 (R5)
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
; ?FLOC__stm32f4xx_spi_NVIC_EncodePriority?T122 end address is: 20 (R5)
SUBS	R3, R3, #1
AND	R3, R2, R3, LSL #0
; SubPriority end address is: 8 (R2)
ORR	R3, R4, R3, LSL #0
;core_cm4.h,1222 :: 		);
MOV	R0, R3
;core_cm4.h,1223 :: 		}
L_end_NVIC_EncodePriority:
BX	LR
; end of stm32f4xx_spi_NVIC_EncodePriority
stm32f4xx_spi_NVIC_DecodePriority:
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
BLS	L_stm32f4xx_spi_NVIC_DecodePriority12
; ?FLOC__stm32f4xx_spi_NVIC_DecodePriority?T136 start address is: 16 (R4)
MOV	R4, #4
; ?FLOC__stm32f4xx_spi_NVIC_DecodePriority?T136 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_spi_NVIC_DecodePriority13
L_stm32f4xx_spi_NVIC_DecodePriority12:
RSB	R4, R5, #7
; ?FLOC__stm32f4xx_spi_NVIC_DecodePriority?T136 start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_spi_NVIC_DecodePriority?T136 end address is: 4 (R1)
MOV	R4, R1
L_stm32f4xx_spi_NVIC_DecodePriority13:
; ?FLOC__stm32f4xx_spi_NVIC_DecodePriority?T136 start address is: 16 (R4)
; PreemptPriorityBits start address is: 4 (R1)
MOV	R1, R4
; ?FLOC__stm32f4xx_spi_NVIC_DecodePriority?T136 end address is: 16 (R4)
;core_cm4.h,1247 :: 		SubPriorityBits     = ((PriorityGroupTmp + __NVIC_PRIO_BITS) < 7) ? 0 : PriorityGroupTmp - 7 + __NVIC_PRIO_BITS;
ADDS	R4, R5, #4
CMP	R4, #7
IT	CS
BCS	L_stm32f4xx_spi_NVIC_DecodePriority14
; PriorityGroupTmp end address is: 20 (R5)
; ?FLOC__stm32f4xx_spi_NVIC_DecodePriority?T140 start address is: 16 (R4)
MOV	R4, #0
; ?FLOC__stm32f4xx_spi_NVIC_DecodePriority?T140 end address is: 16 (R4)
IT	AL
BAL	L_stm32f4xx_spi_NVIC_DecodePriority15
L_stm32f4xx_spi_NVIC_DecodePriority14:
; PriorityGroupTmp start address is: 20 (R5)
SUBS	R4, R5, #7
; PriorityGroupTmp end address is: 20 (R5)
ADDS	R4, R4, #4
; ?FLOC__stm32f4xx_spi_NVIC_DecodePriority?T140 start address is: 20 (R5)
MOV	R5, R4
; ?FLOC__stm32f4xx_spi_NVIC_DecodePriority?T140 end address is: 20 (R5)
MOV	R4, R5
L_stm32f4xx_spi_NVIC_DecodePriority15:
; ?FLOC__stm32f4xx_spi_NVIC_DecodePriority?T140 start address is: 16 (R4)
; SubPriorityBits start address is: 24 (R6)
MOV	R6, R4
;core_cm4.h,1249 :: 		*pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
LSR	R5, R0, R4
; ?FLOC__stm32f4xx_spi_NVIC_DecodePriority?T140 end address is: 16 (R4)
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
; end of stm32f4xx_spi_NVIC_DecodePriority
stm32f4xx_spi_NVIC_SystemReset:
;core_cm4.h,1258 :: 		static __INLINE void NVIC_SystemReset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;core_cm4.h,1261 :: 		buffered write are completed before reset */
BL	stm32f4xx_spi___DSB+0
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
BL	stm32f4xx_spi___DSB+0
;core_cm4.h,1266 :: 		while(1);                                                    /* wait until reset */
L_stm32f4xx_spi_NVIC_SystemReset16:
IT	AL
BAL	L_stm32f4xx_spi_NVIC_SystemReset16
;core_cm4.h,1267 :: 		}
L_end_NVIC_SystemReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_spi_NVIC_SystemReset
stm32f4xx_spi_SysTick_Config:
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
BLS	L_stm32f4xx_spi_SysTick_Config18
; ticks end address is: 0 (R0)
MOVS	R0, #1
IT	AL
BAL	L_end_SysTick_Config
L_stm32f4xx_spi_SysTick_Config18:
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
BL	stm32f4xx_spi_NVIC_SetPriority+0
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
; end of stm32f4xx_spi_SysTick_Config
stm32f4xx_spi_ITM_SendChar:
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
BEQ	L_stm32f4xx_spi_ITM_SendChar79
MOVW	R1, #3712
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_spi_ITM_SendChar80
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
MOVW	R1, #3584
MOVT	R1, #57344
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	EQ
BEQ	L_stm32f4xx_spi_ITM_SendChar81
L_stm32f4xx_spi_ITM_SendChar75:
;core_cm4.h,1334 :: 		while (ITM->PORT[0].u32 == 0);
L_stm32f4xx_spi_ITM_SendChar22:
; ch end address is: 0 (R0)
; ch start address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #57344
LDR	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_stm32f4xx_spi_ITM_SendChar23
IT	AL
BAL	L_stm32f4xx_spi_ITM_SendChar22
L_stm32f4xx_spi_ITM_SendChar23:
;core_cm4.h,1335 :: 		ITM->PORT[0].u8 = (uint8_t) ch;
UXTB	R2, R0
MOVW	R1, #0
MOVT	R1, #57344
STRB	R2, [R1, #0]
; ch end address is: 0 (R0)
;core_cm4.h,1331 :: 		(ITM->TCR & ITM_TCR_ITMENA_Msk)                  &&      /* ITM enabled */
IT	AL
BAL	L_stm32f4xx_spi_ITM_SendChar78
L_stm32f4xx_spi_ITM_SendChar79:
L_stm32f4xx_spi_ITM_SendChar78:
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_spi_ITM_SendChar77
L_stm32f4xx_spi_ITM_SendChar80:
L_stm32f4xx_spi_ITM_SendChar77:
;core_cm4.h,1332 :: 		(ITM->TER & (1UL << 0)        )                    )     /* ITM Port #0 enabled */
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
IT	AL
BAL	L_stm32f4xx_spi_ITM_SendChar76
L_stm32f4xx_spi_ITM_SendChar81:
L_stm32f4xx_spi_ITM_SendChar76:
;core_cm4.h,1337 :: 		return (ch);
; ch start address is: 0 (R0)
; ch end address is: 0 (R0)
;core_cm4.h,1338 :: 		}
L_end_ITM_SendChar:
BX	LR
; end of stm32f4xx_spi_ITM_SendChar
stm32f4xx_spi_ITM_ReceiveChar:
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
BEQ	L_stm32f4xx_spi_ITM_ReceiveChar24
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
L_stm32f4xx_spi_ITM_ReceiveChar24:
;core_cm4.h,1358 :: 		return (ch);
LDR	R0, [SP, #0]
;core_cm4.h,1359 :: 		}
L_end_ITM_ReceiveChar:
ADD	SP, SP, #4
BX	LR
; end of stm32f4xx_spi_ITM_ReceiveChar
stm32f4xx_spi_ITM_CheckChar:
;core_cm4.h,1370 :: 		static __INLINE int32_t ITM_CheckChar (void) {
;core_cm4.h,1372 :: 		if (ITM_RxBuffer == ITM_RXBUFFER_EMPTY) {
MOVW	R0, #lo_addr(_ITM_RxBuffer+0)
MOVT	R0, #hi_addr(_ITM_RxBuffer+0)
LDR	R1, [R0, #0]
MOVW	R0, #23205
MOVT	R0, #23205
CMP	R1, R0
IT	NE
BNE	L_stm32f4xx_spi_ITM_CheckChar25
;core_cm4.h,1373 :: 		return (0);                                 /* no character available */
MOV	R0, #0
IT	AL
BAL	L_end_ITM_CheckChar
;core_cm4.h,1374 :: 		} else {
L_stm32f4xx_spi_ITM_CheckChar25:
;core_cm4.h,1375 :: 		return (1);                                 /*    character available */
MOVS	R0, #1
;core_cm4.h,1377 :: 		}
L_end_ITM_CheckChar:
BX	LR
; end of stm32f4xx_spi_ITM_CheckChar
_SPI_I2S_DeInit:
;stm32f4xx_spi.c,224 :: 		void SPI_I2S_DeInit(SPI_TypeDef* SPIx)
; SPIx start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
;stm32f4xx_spi.c,229 :: 		if (SPIx == SPI1)
MOVW	R1, #12288
MOVT	R1, #16385
CMP	R0, R1
IT	NE
BNE	L_SPI_I2S_DeInit27
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,232 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_SPI1, ENABLE);
MOVS	R1, #1
MOV	R0, #4096
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_spi.c,234 :: 		RCC_APB2PeriphResetCmd(RCC_APB2Periph_SPI1, DISABLE);
MOVS	R1, #0
MOV	R0, #4096
BL	_RCC_APB2PeriphResetCmd+0
;stm32f4xx_spi.c,235 :: 		}
IT	AL
BAL	L_SPI_I2S_DeInit28
L_SPI_I2S_DeInit27:
;stm32f4xx_spi.c,236 :: 		else if (SPIx == SPI2)
; SPIx start address is: 0 (R0)
MOVW	R1, #14336
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_SPI_I2S_DeInit29
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,239 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_SPI2, ENABLE);
MOVS	R1, #1
MOV	R0, #16384
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_spi.c,241 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_SPI2, DISABLE);
MOVS	R1, #0
MOV	R0, #16384
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_spi.c,242 :: 		}
IT	AL
BAL	L_SPI_I2S_DeInit30
L_SPI_I2S_DeInit29:
;stm32f4xx_spi.c,245 :: 		if (SPIx == SPI3)
; SPIx start address is: 0 (R0)
MOVW	R1, #15360
MOVT	R1, #16384
CMP	R0, R1
IT	NE
BNE	L_SPI_I2S_DeInit31
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,248 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_SPI3, ENABLE);
MOVS	R1, #1
MOV	R0, #32768
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_spi.c,250 :: 		RCC_APB1PeriphResetCmd(RCC_APB1Periph_SPI3, DISABLE);
MOVS	R1, #0
MOV	R0, #32768
BL	_RCC_APB1PeriphResetCmd+0
;stm32f4xx_spi.c,251 :: 		}
L_SPI_I2S_DeInit31:
;stm32f4xx_spi.c,252 :: 		}
L_SPI_I2S_DeInit30:
L_SPI_I2S_DeInit28:
;stm32f4xx_spi.c,253 :: 		}
L_end_SPI_I2S_DeInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SPI_I2S_DeInit
_SPI_Init:
;stm32f4xx_spi.c,263 :: 		void SPI_Init(SPI_TypeDef* SPIx, SPI_InitTypeDef* SPI_InitStruct)
; SPI_InitStruct start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_InitStruct end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_InitStruct start address is: 4 (R1)
;stm32f4xx_spi.c,265 :: 		uint16_t tmpreg = 0;
;stm32f4xx_spi.c,283 :: 		tmpreg = SPIx->CR1;
LDRH	R2, [R0, #0]
;stm32f4xx_spi.c,285 :: 		tmpreg &= CR1_CLEAR_MASK;
AND	R4, R2, #12352
UXTH	R4, R4
;stm32f4xx_spi.c,294 :: 		tmpreg |= (uint16_t)((uint32_t)SPI_InitStruct->SPI_Direction | SPI_InitStruct->SPI_Mode |
LDRH	R2, [R1, #0]
UXTH	R3, R2
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_spi.c,295 :: 		SPI_InitStruct->SPI_DataSize | SPI_InitStruct->SPI_CPOL |
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
ORRS	R3, R2
ADDS	R2, R1, #6
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_spi.c,296 :: 		SPI_InitStruct->SPI_CPHA | SPI_InitStruct->SPI_NSS |
ADDW	R2, R1, #8
LDRH	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #10
LDRH	R2, [R2, #0]
ORRS	R3, R2
;stm32f4xx_spi.c,297 :: 		SPI_InitStruct->SPI_BaudRatePrescaler | SPI_InitStruct->SPI_FirstBit);
ADDW	R2, R1, #12
LDRH	R2, [R2, #0]
ORRS	R3, R2
ADDW	R2, R1, #14
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
UXTH	R2, R2
ORR	R2, R4, R2, LSL #0
;stm32f4xx_spi.c,299 :: 		SPIx->CR1 = tmpreg;
STRH	R2, [R0, #0]
;stm32f4xx_spi.c,302 :: 		SPIx->I2SCFGR &= (uint16_t)~((uint16_t)SPI_I2SCFGR_I2SMOD);
ADDW	R4, R0, #28
LDRH	R3, [R4, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_spi.c,305 :: 		SPIx->CRCPR = SPI_InitStruct->SPI_CRCPolynomial;
ADDW	R3, R0, #16
; SPIx end address is: 0 (R0)
ADDW	R2, R1, #16
; SPI_InitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;stm32f4xx_spi.c,306 :: 		}
L_end_SPI_Init:
BX	LR
; end of _SPI_Init
_I2S_Init:
;stm32f4xx_spi.c,327 :: 		void I2S_Init(SPI_TypeDef* SPIx, I2S_InitTypeDef* I2S_InitStruct)
; I2S_InitStruct start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; I2S_InitStruct end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; I2S_InitStruct start address is: 4 (R1)
;stm32f4xx_spi.c,329 :: 		uint16_t tmpreg = 0, i2sdiv = 2, i2sodd = 0, packetlength = 1;
;stm32f4xx_spi.c,330 :: 		uint32_t tmp = 0, i2sclk = 0;
;stm32f4xx_spi.c,332 :: 		uint32_t pllm = 0, plln = 0, pllr = 0;
;stm32f4xx_spi.c,346 :: 		SPIx->I2SCFGR &= I2SCFGR_CLEAR_MASK;
ADDW	R4, R0, #28
LDRH	R3, [R4, #0]
MOVW	R2, #61504
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_spi.c,347 :: 		SPIx->I2SPR = 0x0002;
ADDW	R3, R0, #32
MOVW	R2, #2
STRH	R2, [R3, #0]
;stm32f4xx_spi.c,350 :: 		tmpreg = SPIx->I2SCFGR;
ADDW	R2, R0, #28
LDRH	R2, [R2, #0]
; tmpreg start address is: 24 (R6)
UXTH	R6, R2
;stm32f4xx_spi.c,353 :: 		if(I2S_InitStruct->I2S_AudioFreq == I2S_AudioFreq_Default)
ADDW	R2, R1, #8
LDR	R2, [R2, #0]
CMP	R2, #2
IT	NE
BNE	L_I2S_Init32
;stm32f4xx_spi.c,355 :: 		i2sodd = (uint16_t)0;
; i2sodd start address is: 16 (R4)
MOVW	R4, #0
;stm32f4xx_spi.c,356 :: 		i2sdiv = (uint16_t)2;
; i2sdiv start address is: 20 (R5)
MOVW	R5, #2
;stm32f4xx_spi.c,357 :: 		}
; i2sodd end address is: 16 (R4)
; i2sdiv end address is: 20 (R5)
IT	AL
BAL	L_I2S_Init33
L_I2S_Init32:
;stm32f4xx_spi.c,362 :: 		if(I2S_InitStruct->I2S_DataFormat == I2S_DataFormat_16b)
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_I2S_Init34
;stm32f4xx_spi.c,365 :: 		packetlength = 1;
; packetlength start address is: 28 (R7)
MOVS	R7, #1
;stm32f4xx_spi.c,366 :: 		}
; packetlength end address is: 28 (R7)
IT	AL
BAL	L_I2S_Init35
L_I2S_Init34:
;stm32f4xx_spi.c,370 :: 		packetlength = 2;
; packetlength start address is: 28 (R7)
MOVW	R7, #2
; packetlength end address is: 28 (R7)
;stm32f4xx_spi.c,371 :: 		}
L_I2S_Init35:
;stm32f4xx_spi.c,389 :: 		if ((RCC->CFGR & RCC_CFGR_I2SSRC) != 0)
; packetlength start address is: 28 (R7)
MOVW	R2, #14344
MOVT	R2, #16386
LDR	R2, [R2, #0]
AND	R2, R2, #8388608
CMP	R2, #0
IT	EQ
BEQ	L_I2S_Init36
;stm32f4xx_spi.c,391 :: 		RCC->CFGR &= ~(uint32_t)RCC_CFGR_I2SSRC;
MOVW	R4, #14344
MOVT	R4, #16386
LDR	R3, [R4, #0]
MVN	R2, #8388608
AND	R2, R3, R2, LSL #0
STR	R2, [R4, #0]
;stm32f4xx_spi.c,392 :: 		}
L_I2S_Init36:
;stm32f4xx_spi.c,396 :: 		(RCC_PLLI2SCFGR_PLLI2SN >> 6));
MOVW	R4, #14468
MOVT	R4, #16386
LDR	R3, [R4, #0]
MOVW	R2, #32704
MOVT	R2, #0
AND	R2, R3, R2, LSL #0
LSRS	R3, R2, #6
MOVW	R2, #511
MOVT	R2, #0
AND	R5, R3, R2, LSL #0
;stm32f4xx_spi.c,400 :: 		(RCC_PLLI2SCFGR_PLLI2SR >> 28));
MOV	R2, R4
LDR	R2, [R2, #0]
AND	R2, R2, #1879048192
LSRS	R2, R2, #28
AND	R4, R2, #7
;stm32f4xx_spi.c,403 :: 		pllm = (uint32_t)(RCC->PLLCFGR & RCC_PLLCFGR_PLLM);
MOVW	R2, #14340
MOVT	R2, #16386
LDR	R2, [R2, #0]
AND	R3, R2, #63
;stm32f4xx_spi.c,406 :: 		i2sclk = (uint32_t)(((HSE_VALUE / pllm) * plln) / pllr);
MOVW	R2, #30784
MOVT	R2, #381
UDIV	R2, R2, R3
MULS	R2, R5, R2
UDIV	R2, R2, R4
; i2sclk start address is: 16 (R4)
MOV	R4, R2
;stm32f4xx_spi.c,410 :: 		if(I2S_InitStruct->I2S_MCLKOutput == I2S_MCLKOutput_Enable)
ADDS	R2, R1, #6
LDRH	R2, [R2, #0]
CMP	R2, #512
IT	NE
BNE	L_I2S_Init37
; packetlength end address is: 28 (R7)
;stm32f4xx_spi.c,413 :: 		tmp = (uint16_t)(((((i2sclk / 256) * 10) / I2S_InitStruct->I2S_AudioFreq)) + 5);
LSRS	R3, R4, #8
; i2sclk end address is: 16 (R4)
MOV	R2, #10
MULS	R3, R2, R3
ADDW	R2, R1, #8
LDR	R2, [R2, #0]
UDIV	R3, R3, R2
ADDS	R3, R3, #5
; tmp start address is: 12 (R3)
UXTH	R3, R3
;stm32f4xx_spi.c,414 :: 		}
; tmp end address is: 12 (R3)
IT	AL
BAL	L_I2S_Init38
L_I2S_Init37:
;stm32f4xx_spi.c,418 :: 		tmp = (uint16_t)(((((i2sclk / (32 * packetlength)) *10 ) / I2S_InitStruct->I2S_AudioFreq)) + 5);
; i2sclk start address is: 16 (R4)
; packetlength start address is: 28 (R7)
LSLS	R2, R7, #5
; packetlength end address is: 28 (R7)
UDIV	R3, R4, R2
; i2sclk end address is: 16 (R4)
MOV	R2, #10
MULS	R3, R2, R3
ADDW	R2, R1, #8
LDR	R2, [R2, #0]
UDIV	R3, R3, R2
ADDS	R3, R3, #5
; tmp start address is: 12 (R3)
UXTH	R3, R3
; tmp end address is: 12 (R3)
;stm32f4xx_spi.c,419 :: 		}
L_I2S_Init38:
;stm32f4xx_spi.c,422 :: 		tmp = tmp / 10;
; tmp start address is: 12 (R3)
MOV	R2, #10
UDIV	R4, R3, R2
; tmp end address is: 12 (R3)
;stm32f4xx_spi.c,425 :: 		i2sodd = (uint16_t)(tmp & (uint16_t)0x0001);
AND	R3, R4, #1
;stm32f4xx_spi.c,428 :: 		i2sdiv = (uint16_t)((tmp - i2sodd) / 2);
UXTH	R2, R3
SUB	R2, R4, R2
LSRS	R2, R2, #1
; i2sdiv start address is: 16 (R4)
UXTH	R4, R2
;stm32f4xx_spi.c,431 :: 		i2sodd = (uint16_t) (i2sodd << 8);
UXTH	R2, R3
LSLS	R2, R2, #8
; i2sodd start address is: 12 (R3)
UXTH	R3, R2
; i2sdiv end address is: 16 (R4)
; i2sodd end address is: 12 (R3)
UXTH	R5, R4
UXTH	R4, R3
;stm32f4xx_spi.c,432 :: 		}
L_I2S_Init33:
;stm32f4xx_spi.c,435 :: 		if ((i2sdiv < 2) || (i2sdiv > 0xFF))
; i2sodd start address is: 16 (R4)
; i2sdiv start address is: 20 (R5)
CMP	R5, #2
IT	LT
BLT	L__I2S_Init84
CMP	R5, #255
IT	GT
BGT	L__I2S_Init83
; i2sodd end address is: 16 (R4)
; i2sdiv end address is: 20 (R5)
IT	AL
BAL	L_I2S_Init41
L__I2S_Init84:
L__I2S_Init83:
;stm32f4xx_spi.c,438 :: 		i2sdiv = 2;
; i2sdiv start address is: 20 (R5)
MOVW	R5, #2
;stm32f4xx_spi.c,439 :: 		i2sodd = 0;
; i2sodd start address is: 16 (R4)
MOVW	R4, #0
; i2sodd end address is: 16 (R4)
; i2sdiv end address is: 20 (R5)
;stm32f4xx_spi.c,440 :: 		}
L_I2S_Init41:
;stm32f4xx_spi.c,443 :: 		SPIx->I2SPR = (uint16_t)((uint16_t)i2sdiv | (uint16_t)(i2sodd | (uint16_t)I2S_InitStruct->I2S_MCLKOutput));
; i2sodd start address is: 16 (R4)
; i2sdiv start address is: 20 (R5)
ADDW	R3, R0, #32
ADDS	R2, R1, #6
LDRH	R2, [R2, #0]
ORR	R2, R4, R2, LSL #0
UXTH	R2, R2
; i2sodd end address is: 16 (R4)
ORR	R2, R5, R2, LSL #0
; i2sdiv end address is: 20 (R5)
STRH	R2, [R3, #0]
;stm32f4xx_spi.c,448 :: 		(uint16_t)I2S_InitStruct->I2S_CPOL))));
LDRH	R5, [R1, #0]
ADDS	R2, R1, #2
LDRH	R4, [R2, #0]
ADDS	R2, R1, #4
LDRH	R3, [R2, #0]
ADDW	R2, R1, #12
; I2S_InitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
UXTH	R2, R2
ORR	R2, R4, R2, LSL #0
UXTH	R2, R2
ORR	R2, R5, R2, LSL #0
UXTH	R2, R2
ORR	R2, R2, #2048
UXTH	R2, R2
ORR	R3, R6, R2, LSL #0
; tmpreg end address is: 24 (R6)
;stm32f4xx_spi.c,451 :: 		SPIx->I2SCFGR = tmpreg;
ADDW	R2, R0, #28
; SPIx end address is: 0 (R0)
STRH	R3, [R2, #0]
;stm32f4xx_spi.c,452 :: 		}
L_end_I2S_Init:
BX	LR
; end of _I2S_Init
_SPI_StructInit:
;stm32f4xx_spi.c,459 :: 		void SPI_StructInit(SPI_InitTypeDef* SPI_InitStruct)
; SPI_InitStruct start address is: 0 (R0)
; SPI_InitStruct end address is: 0 (R0)
; SPI_InitStruct start address is: 0 (R0)
;stm32f4xx_spi.c,463 :: 		SPI_InitStruct->SPI_Direction = SPI_Direction_2Lines_FullDuplex;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f4xx_spi.c,465 :: 		SPI_InitStruct->SPI_Mode = SPI_Mode_Slave;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_spi.c,467 :: 		SPI_InitStruct->SPI_DataSize = SPI_DataSize_8b;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_spi.c,469 :: 		SPI_InitStruct->SPI_CPOL = SPI_CPOL_Low;
ADDS	R2, R0, #6
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_spi.c,471 :: 		SPI_InitStruct->SPI_CPHA = SPI_CPHA_1Edge;
ADDW	R2, R0, #8
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_spi.c,473 :: 		SPI_InitStruct->SPI_NSS = SPI_NSS_Hard;
ADDW	R2, R0, #10
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_spi.c,475 :: 		SPI_InitStruct->SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_2;
ADDW	R2, R0, #12
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_spi.c,477 :: 		SPI_InitStruct->SPI_FirstBit = SPI_FirstBit_MSB;
ADDW	R2, R0, #14
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_spi.c,479 :: 		SPI_InitStruct->SPI_CRCPolynomial = 7;
ADDW	R2, R0, #16
; SPI_InitStruct end address is: 0 (R0)
MOVW	R1, #7
STRH	R1, [R2, #0]
;stm32f4xx_spi.c,480 :: 		}
L_end_SPI_StructInit:
BX	LR
; end of _SPI_StructInit
_I2S_StructInit:
;stm32f4xx_spi.c,487 :: 		void I2S_StructInit(I2S_InitTypeDef* I2S_InitStruct)
; I2S_InitStruct start address is: 0 (R0)
; I2S_InitStruct end address is: 0 (R0)
; I2S_InitStruct start address is: 0 (R0)
;stm32f4xx_spi.c,491 :: 		I2S_InitStruct->I2S_Mode = I2S_Mode_SlaveTx;
MOVW	R1, #0
STRH	R1, [R0, #0]
;stm32f4xx_spi.c,494 :: 		I2S_InitStruct->I2S_Standard = I2S_Standard_Phillips;
ADDS	R2, R0, #2
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_spi.c,497 :: 		I2S_InitStruct->I2S_DataFormat = I2S_DataFormat_16b;
ADDS	R2, R0, #4
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_spi.c,500 :: 		I2S_InitStruct->I2S_MCLKOutput = I2S_MCLKOutput_Disable;
ADDS	R2, R0, #6
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_spi.c,503 :: 		I2S_InitStruct->I2S_AudioFreq = I2S_AudioFreq_Default;
ADDW	R2, R0, #8
MOV	R1, #2
STR	R1, [R2, #0]
;stm32f4xx_spi.c,506 :: 		I2S_InitStruct->I2S_CPOL = I2S_CPOL_Low;
ADDW	R2, R0, #12
; I2S_InitStruct end address is: 0 (R0)
MOVW	R1, #0
STRH	R1, [R2, #0]
;stm32f4xx_spi.c,507 :: 		}
L_end_I2S_StructInit:
BX	LR
; end of _I2S_StructInit
_SPI_Cmd:
;stm32f4xx_spi.c,516 :: 		void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_spi.c,521 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_SPI_Cmd42
; NewState end address is: 4 (R1)
;stm32f4xx_spi.c,524 :: 		SPIx->CR1 |= SPI_CR1_SPE;
LDRH	R2, [R0, #0]
ORR	R2, R2, #64
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,525 :: 		}
IT	AL
BAL	L_SPI_Cmd43
L_SPI_Cmd42:
;stm32f4xx_spi.c,529 :: 		SPIx->CR1 &= (uint16_t)~((uint16_t)SPI_CR1_SPE);
; SPIx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65471
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,530 :: 		}
L_SPI_Cmd43:
;stm32f4xx_spi.c,531 :: 		}
L_end_SPI_Cmd:
BX	LR
; end of _SPI_Cmd
_I2S_Cmd:
;stm32f4xx_spi.c,541 :: 		void I2S_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_spi.c,547 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_I2S_Cmd44
; NewState end address is: 4 (R1)
;stm32f4xx_spi.c,550 :: 		SPIx->I2SCFGR |= SPI_I2SCFGR_I2SE;
ADDW	R3, R0, #28
; SPIx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #1024
STRH	R2, [R3, #0]
;stm32f4xx_spi.c,551 :: 		}
IT	AL
BAL	L_I2S_Cmd45
L_I2S_Cmd44:
;stm32f4xx_spi.c,555 :: 		SPIx->I2SCFGR &= (uint16_t)~((uint16_t)SPI_I2SCFGR_I2SE);
; SPIx start address is: 0 (R0)
ADDW	R4, R0, #28
; SPIx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #64511
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_spi.c,556 :: 		}
L_I2S_Cmd45:
;stm32f4xx_spi.c,557 :: 		}
L_end_I2S_Cmd:
BX	LR
; end of _I2S_Cmd
_SPI_DataSizeConfig:
;stm32f4xx_spi.c,568 :: 		void SPI_DataSizeConfig(SPI_TypeDef* SPIx, uint16_t SPI_DataSize)
; SPI_DataSize start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_DataSize end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_DataSize start address is: 4 (R1)
;stm32f4xx_spi.c,574 :: 		SPIx->CR1 &= (uint16_t)~SPI_DataSize_16b;
LDRH	R3, [R0, #0]
MOVW	R2, #63487
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
;stm32f4xx_spi.c,576 :: 		SPIx->CR1 |= SPI_DataSize;
LDRH	R2, [R0, #0]
ORRS	R2, R1
; SPI_DataSize end address is: 4 (R1)
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,577 :: 		}
L_end_SPI_DataSizeConfig:
BX	LR
; end of _SPI_DataSizeConfig
_SPI_BiDirectionalLineConfig:
;stm32f4xx_spi.c,588 :: 		void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, uint16_t SPI_Direction)
; SPI_Direction start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_Direction end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_Direction start address is: 4 (R1)
;stm32f4xx_spi.c,593 :: 		if (SPI_Direction == SPI_Direction_Tx)
CMP	R1, #16384
IT	NE
BNE	L_SPI_BiDirectionalLineConfig46
; SPI_Direction end address is: 4 (R1)
;stm32f4xx_spi.c,596 :: 		SPIx->CR1 |= SPI_Direction_Tx;
LDRH	R2, [R0, #0]
ORR	R2, R2, #16384
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,597 :: 		}
IT	AL
BAL	L_SPI_BiDirectionalLineConfig47
L_SPI_BiDirectionalLineConfig46:
;stm32f4xx_spi.c,601 :: 		SPIx->CR1 &= SPI_Direction_Rx;
; SPIx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #49151
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,602 :: 		}
L_SPI_BiDirectionalLineConfig47:
;stm32f4xx_spi.c,603 :: 		}
L_end_SPI_BiDirectionalLineConfig:
BX	LR
; end of _SPI_BiDirectionalLineConfig
_SPI_NSSInternalSoftwareConfig:
;stm32f4xx_spi.c,614 :: 		void SPI_NSSInternalSoftwareConfig(SPI_TypeDef* SPIx, uint16_t SPI_NSSInternalSoft)
; SPI_NSSInternalSoft start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_NSSInternalSoft end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_NSSInternalSoft start address is: 4 (R1)
;stm32f4xx_spi.c,619 :: 		if (SPI_NSSInternalSoft != SPI_NSSInternalSoft_Reset)
MOVW	R2, #65279
CMP	R1, R2
IT	EQ
BEQ	L_SPI_NSSInternalSoftwareConfig48
; SPI_NSSInternalSoft end address is: 4 (R1)
;stm32f4xx_spi.c,622 :: 		SPIx->CR1 |= SPI_NSSInternalSoft_Set;
LDRH	R2, [R0, #0]
ORR	R2, R2, #256
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,623 :: 		}
IT	AL
BAL	L_SPI_NSSInternalSoftwareConfig49
L_SPI_NSSInternalSoftwareConfig48:
;stm32f4xx_spi.c,627 :: 		SPIx->CR1 &= SPI_NSSInternalSoft_Reset;
; SPIx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #65279
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,628 :: 		}
L_SPI_NSSInternalSoftwareConfig49:
;stm32f4xx_spi.c,629 :: 		}
L_end_SPI_NSSInternalSoftwareConfig:
BX	LR
; end of _SPI_NSSInternalSoftwareConfig
_SPI_SSOutputCmd:
;stm32f4xx_spi.c,638 :: 		void SPI_SSOutputCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_spi.c,643 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_SPI_SSOutputCmd50
; NewState end address is: 4 (R1)
;stm32f4xx_spi.c,646 :: 		SPIx->CR2 |= (uint16_t)SPI_CR2_SSOE;
ADDS	R3, R0, #4
; SPIx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #4
STRH	R2, [R3, #0]
;stm32f4xx_spi.c,647 :: 		}
IT	AL
BAL	L_SPI_SSOutputCmd51
L_SPI_SSOutputCmd50:
;stm32f4xx_spi.c,651 :: 		SPIx->CR2 &= (uint16_t)~((uint16_t)SPI_CR2_SSOE);
; SPIx start address is: 0 (R0)
ADDS	R4, R0, #4
; SPIx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65531
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_spi.c,652 :: 		}
L_SPI_SSOutputCmd51:
;stm32f4xx_spi.c,653 :: 		}
L_end_SPI_SSOutputCmd:
BX	LR
; end of _SPI_SSOutputCmd
_SPI_TIModeCmd:
;stm32f4xx_spi.c,669 :: 		void SPI_TIModeCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_spi.c,675 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_SPI_TIModeCmd52
; NewState end address is: 4 (R1)
;stm32f4xx_spi.c,678 :: 		SPIx->CR2 |= SPI_CR2_FRF;
ADDS	R3, R0, #4
; SPIx end address is: 0 (R0)
LDRH	R2, [R3, #0]
ORR	R2, R2, #16
STRH	R2, [R3, #0]
;stm32f4xx_spi.c,679 :: 		}
IT	AL
BAL	L_SPI_TIModeCmd53
L_SPI_TIModeCmd52:
;stm32f4xx_spi.c,683 :: 		SPIx->CR2 &= (uint16_t)~SPI_CR2_FRF;
; SPIx start address is: 0 (R0)
ADDS	R4, R0, #4
; SPIx end address is: 0 (R0)
LDRH	R3, [R4, #0]
MOVW	R2, #65519
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_spi.c,684 :: 		}
L_SPI_TIModeCmd53:
;stm32f4xx_spi.c,685 :: 		}
L_end_SPI_TIModeCmd:
BX	LR
; end of _SPI_TIModeCmd
_I2S_FullDuplexConfig:
;stm32f4xx_spi.c,706 :: 		void I2S_FullDuplexConfig(SPI_TypeDef* I2Sxext, I2S_InitTypeDef* I2S_InitStruct)
; I2S_InitStruct start address is: 4 (R1)
; I2Sxext start address is: 0 (R0)
; I2S_InitStruct end address is: 4 (R1)
; I2Sxext end address is: 0 (R0)
; I2Sxext start address is: 0 (R0)
; I2S_InitStruct start address is: 4 (R1)
;stm32f4xx_spi.c,708 :: 		uint16_t tmpreg = 0, tmp = 0;
; tmp start address is: 24 (R6)
MOVW	R6, #0
;stm32f4xx_spi.c,719 :: 		I2Sxext->I2SCFGR &= I2SCFGR_CLEAR_MASK;
ADDW	R4, R0, #28
LDRH	R3, [R4, #0]
MOVW	R2, #61504
AND	R2, R3, R2, LSL #0
STRH	R2, [R4, #0]
;stm32f4xx_spi.c,720 :: 		I2Sxext->I2SPR = 0x0002;
ADDW	R3, R0, #32
MOVW	R2, #2
STRH	R2, [R3, #0]
;stm32f4xx_spi.c,723 :: 		tmpreg = I2Sxext->I2SCFGR;
ADDW	R2, R0, #28
LDRH	R2, [R2, #0]
; tmpreg start address is: 20 (R5)
UXTH	R5, R2
;stm32f4xx_spi.c,726 :: 		if ((I2S_InitStruct->I2S_Mode == I2S_Mode_MasterTx) || (I2S_InitStruct->I2S_Mode == I2S_Mode_SlaveTx))
LDRH	R2, [R1, #0]
CMP	R2, #512
IT	EQ
BEQ	L__I2S_FullDuplexConfig88
LDRH	R2, [R1, #0]
CMP	R2, #0
IT	EQ
BEQ	L__I2S_FullDuplexConfig87
IT	AL
BAL	L_I2S_FullDuplexConfig56
; tmp end address is: 24 (R6)
L__I2S_FullDuplexConfig88:
L__I2S_FullDuplexConfig87:
;stm32f4xx_spi.c,728 :: 		tmp = I2S_Mode_SlaveRx;
; tmp start address is: 24 (R6)
MOVW	R6, #256
;stm32f4xx_spi.c,729 :: 		}
IT	AL
BAL	L_I2S_FullDuplexConfig57
L_I2S_FullDuplexConfig56:
;stm32f4xx_spi.c,732 :: 		if ((I2S_InitStruct->I2S_Mode == I2S_Mode_MasterRx) || (I2S_InitStruct->I2S_Mode == I2S_Mode_SlaveRx))
LDRH	R2, [R1, #0]
CMP	R2, #768
IT	EQ
BEQ	L__I2S_FullDuplexConfig90
LDRH	R2, [R1, #0]
CMP	R2, #256
IT	EQ
BEQ	L__I2S_FullDuplexConfig89
; tmp end address is: 24 (R6)
IT	AL
BAL	L_I2S_FullDuplexConfig60
L__I2S_FullDuplexConfig90:
L__I2S_FullDuplexConfig89:
;stm32f4xx_spi.c,734 :: 		tmp = I2S_Mode_SlaveTx;
; tmp start address is: 8 (R2)
MOVW	R2, #0
; tmp end address is: 8 (R2)
UXTH	R6, R2
;stm32f4xx_spi.c,735 :: 		}
L_I2S_FullDuplexConfig60:
;stm32f4xx_spi.c,736 :: 		}
; tmp start address is: 24 (R6)
; tmp end address is: 24 (R6)
L_I2S_FullDuplexConfig57:
;stm32f4xx_spi.c,742 :: 		(uint16_t)I2S_InitStruct->I2S_CPOL))));
; tmp start address is: 24 (R6)
ADDS	R2, R1, #2
LDRH	R4, [R2, #0]
ADDS	R2, R1, #4
LDRH	R3, [R2, #0]
ADDW	R2, R1, #12
; I2S_InitStruct end address is: 4 (R1)
LDRH	R2, [R2, #0]
ORR	R2, R3, R2, LSL #0
UXTH	R2, R2
ORR	R2, R4, R2, LSL #0
UXTH	R2, R2
ORR	R2, R6, R2, LSL #0
UXTH	R2, R2
; tmp end address is: 24 (R6)
ORR	R2, R2, #2048
UXTH	R2, R2
ORR	R3, R5, R2, LSL #0
; tmpreg end address is: 20 (R5)
;stm32f4xx_spi.c,745 :: 		I2Sxext->I2SCFGR = tmpreg;
ADDW	R2, R0, #28
; I2Sxext end address is: 0 (R0)
STRH	R3, [R2, #0]
;stm32f4xx_spi.c,746 :: 		}
L_end_I2S_FullDuplexConfig:
BX	LR
; end of _I2S_FullDuplexConfig
_SPI_I2S_ReceiveData:
;stm32f4xx_spi.c,781 :: 		uint16_t SPI_I2S_ReceiveData(SPI_TypeDef* SPIx)
; SPIx start address is: 0 (R0)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
;stm32f4xx_spi.c,787 :: 		return SPIx->DR;
ADDW	R1, R0, #12
; SPIx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;stm32f4xx_spi.c,788 :: 		}
L_end_SPI_I2S_ReceiveData:
BX	LR
; end of _SPI_I2S_ReceiveData
_SPI_I2S_SendData:
;stm32f4xx_spi.c,797 :: 		void SPI_I2S_SendData(SPI_TypeDef* SPIx, uint16_t Data)
; Data start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; Data end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; Data start address is: 4 (R1)
;stm32f4xx_spi.c,803 :: 		SPIx->DR = Data;
ADDW	R2, R0, #12
; SPIx end address is: 0 (R0)
STRH	R1, [R2, #0]
; Data end address is: 4 (R1)
;stm32f4xx_spi.c,804 :: 		}
L_end_SPI_I2S_SendData:
BX	LR
; end of _SPI_I2S_SendData
_SPI_CalculateCRC:
;stm32f4xx_spi.c,886 :: 		void SPI_CalculateCRC(SPI_TypeDef* SPIx, FunctionalState NewState)
; NewState start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; NewState start address is: 4 (R1)
;stm32f4xx_spi.c,891 :: 		if (NewState != DISABLE)
CMP	R1, #0
IT	EQ
BEQ	L_SPI_CalculateCRC61
; NewState end address is: 4 (R1)
;stm32f4xx_spi.c,894 :: 		SPIx->CR1 |= SPI_CR1_CRCEN;
LDRH	R2, [R0, #0]
ORR	R2, R2, #8192
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,895 :: 		}
IT	AL
BAL	L_SPI_CalculateCRC62
L_SPI_CalculateCRC61:
;stm32f4xx_spi.c,899 :: 		SPIx->CR1 &= (uint16_t)~((uint16_t)SPI_CR1_CRCEN);
; SPIx start address is: 0 (R0)
LDRH	R3, [R0, #0]
MOVW	R2, #57343
AND	R2, R3, R2, LSL #0
STRH	R2, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,900 :: 		}
L_SPI_CalculateCRC62:
;stm32f4xx_spi.c,901 :: 		}
L_end_SPI_CalculateCRC:
BX	LR
; end of _SPI_CalculateCRC
_SPI_TransmitCRC:
;stm32f4xx_spi.c,908 :: 		void SPI_TransmitCRC(SPI_TypeDef* SPIx)
; SPIx start address is: 0 (R0)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
;stm32f4xx_spi.c,914 :: 		SPIx->CR1 |= SPI_CR1_CRCNEXT;
LDRH	R1, [R0, #0]
ORR	R1, R1, #4096
STRH	R1, [R0, #0]
; SPIx end address is: 0 (R0)
;stm32f4xx_spi.c,915 :: 		}
L_end_SPI_TransmitCRC:
BX	LR
; end of _SPI_TransmitCRC
_SPI_GetCRC:
;stm32f4xx_spi.c,926 :: 		uint16_t SPI_GetCRC(SPI_TypeDef* SPIx, uint8_t SPI_CRC)
; SPI_CRC start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_CRC end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_CRC start address is: 4 (R1)
;stm32f4xx_spi.c,928 :: 		uint16_t crcreg = 0;
;stm32f4xx_spi.c,932 :: 		if (SPI_CRC != SPI_CRC_Rx)
CMP	R1, #1
IT	EQ
BEQ	L_SPI_GetCRC63
; SPI_CRC end address is: 4 (R1)
;stm32f4xx_spi.c,935 :: 		crcreg = SPIx->TXCRCR;
ADDW	R2, R0, #24
; SPIx end address is: 0 (R0)
LDRH	R0, [R2, #0]
; crcreg start address is: 0 (R0)
;stm32f4xx_spi.c,936 :: 		}
; crcreg end address is: 0 (R0)
IT	AL
BAL	L_SPI_GetCRC64
L_SPI_GetCRC63:
;stm32f4xx_spi.c,940 :: 		crcreg = SPIx->RXCRCR;
; SPIx start address is: 0 (R0)
ADDW	R2, R0, #20
; SPIx end address is: 0 (R0)
LDRH	R0, [R2, #0]
; crcreg start address is: 0 (R0)
; crcreg end address is: 0 (R0)
;stm32f4xx_spi.c,941 :: 		}
L_SPI_GetCRC64:
;stm32f4xx_spi.c,943 :: 		return crcreg;
; crcreg start address is: 0 (R0)
; crcreg end address is: 0 (R0)
;stm32f4xx_spi.c,944 :: 		}
L_end_SPI_GetCRC:
BX	LR
; end of _SPI_GetCRC
_SPI_GetCRCPolynomial:
;stm32f4xx_spi.c,951 :: 		uint16_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
; SPIx start address is: 0 (R0)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
;stm32f4xx_spi.c,957 :: 		return SPIx->CRCPR;
ADDW	R1, R0, #16
; SPIx end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;stm32f4xx_spi.c,958 :: 		}
L_end_SPI_GetCRCPolynomial:
BX	LR
; end of _SPI_GetCRCPolynomial
_SPI_I2S_DMACmd:
;stm32f4xx_spi.c,988 :: 		void SPI_I2S_DMACmd(SPI_TypeDef* SPIx, uint16_t SPI_I2S_DMAReq, FunctionalState NewState)
; NewState start address is: 8 (R2)
; SPI_I2S_DMAReq start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; SPI_I2S_DMAReq end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_I2S_DMAReq start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f4xx_spi.c,995 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_SPI_I2S_DMACmd65
; NewState end address is: 8 (R2)
;stm32f4xx_spi.c,998 :: 		SPIx->CR2 |= SPI_I2S_DMAReq;
ADDS	R4, R0, #4
; SPIx end address is: 0 (R0)
LDRH	R3, [R4, #0]
ORRS	R3, R1
; SPI_I2S_DMAReq end address is: 4 (R1)
STRH	R3, [R4, #0]
;stm32f4xx_spi.c,999 :: 		}
IT	AL
BAL	L_SPI_I2S_DMACmd66
L_SPI_I2S_DMACmd65:
;stm32f4xx_spi.c,1003 :: 		SPIx->CR2 &= (uint16_t)~SPI_I2S_DMAReq;
; SPI_I2S_DMAReq start address is: 4 (R1)
; SPIx start address is: 0 (R0)
ADDS	R5, R0, #4
; SPIx end address is: 0 (R0)
MVN	R4, R1
UXTH	R4, R4
; SPI_I2S_DMAReq end address is: 4 (R1)
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f4xx_spi.c,1004 :: 		}
L_SPI_I2S_DMACmd66:
;stm32f4xx_spi.c,1005 :: 		}
L_end_SPI_I2S_DMACmd:
BX	LR
; end of _SPI_I2S_DMACmd
_SPI_I2S_ITConfig:
;stm32f4xx_spi.c,1097 :: 		void SPI_I2S_ITConfig(SPI_TypeDef* SPIx, uint8_t SPI_I2S_IT, FunctionalState NewState)
; NewState start address is: 8 (R2)
; SPI_I2S_IT start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; NewState end address is: 8 (R2)
; SPI_I2S_IT end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_I2S_IT start address is: 4 (R1)
; NewState start address is: 8 (R2)
;stm32f4xx_spi.c,1099 :: 		uint16_t itpos = 0, itmask = 0 ;
;stm32f4xx_spi.c,1107 :: 		itpos = SPI_I2S_IT >> 4;
LSRS	R3, R1, #4
UXTB	R3, R3
; SPI_I2S_IT end address is: 4 (R1)
; itpos start address is: 4 (R1)
UXTB	R1, R3
;stm32f4xx_spi.c,1110 :: 		itmask = (uint16_t)1 << (uint16_t)itpos;
MOVW	R3, #1
LSLS	R3, R1
; itpos end address is: 4 (R1)
; itmask start address is: 4 (R1)
UXTH	R1, R3
;stm32f4xx_spi.c,1112 :: 		if (NewState != DISABLE)
CMP	R2, #0
IT	EQ
BEQ	L_SPI_I2S_ITConfig67
; NewState end address is: 8 (R2)
;stm32f4xx_spi.c,1115 :: 		SPIx->CR2 |= itmask;
ADDS	R4, R0, #4
; SPIx end address is: 0 (R0)
LDRH	R3, [R4, #0]
ORRS	R3, R1
; itmask end address is: 4 (R1)
STRH	R3, [R4, #0]
;stm32f4xx_spi.c,1116 :: 		}
IT	AL
BAL	L_SPI_I2S_ITConfig68
L_SPI_I2S_ITConfig67:
;stm32f4xx_spi.c,1120 :: 		SPIx->CR2 &= (uint16_t)~itmask;
; itmask start address is: 4 (R1)
; SPIx start address is: 0 (R0)
ADDS	R5, R0, #4
; SPIx end address is: 0 (R0)
MVN	R4, R1
UXTH	R4, R4
; itmask end address is: 4 (R1)
LDRH	R3, [R5, #0]
ANDS	R3, R4
STRH	R3, [R5, #0]
;stm32f4xx_spi.c,1121 :: 		}
L_SPI_I2S_ITConfig68:
;stm32f4xx_spi.c,1122 :: 		}
L_end_SPI_I2S_ITConfig:
BX	LR
; end of _SPI_I2S_ITConfig
_SPI_I2S_GetFlagStatus:
;stm32f4xx_spi.c,1141 :: 		FlagStatus SPI_I2S_GetFlagStatus(SPI_TypeDef* SPIx, uint16_t SPI_I2S_FLAG)
; SPI_I2S_FLAG start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_I2S_FLAG end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_I2S_FLAG start address is: 4 (R1)
;stm32f4xx_spi.c,1143 :: 		FlagStatus bitstatus = RESET;
;stm32f4xx_spi.c,1149 :: 		if ((SPIx->SR & SPI_I2S_FLAG) != (uint16_t)RESET)
ADDW	R2, R0, #8
; SPIx end address is: 0 (R0)
LDRH	R2, [R2, #0]
ANDS	R2, R1
UXTH	R2, R2
; SPI_I2S_FLAG end address is: 4 (R1)
CMP	R2, #0
IT	EQ
BEQ	L_SPI_I2S_GetFlagStatus69
;stm32f4xx_spi.c,1152 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_spi.c,1153 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_SPI_I2S_GetFlagStatus70
L_SPI_I2S_GetFlagStatus69:
;stm32f4xx_spi.c,1157 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_spi.c,1158 :: 		}
L_SPI_I2S_GetFlagStatus70:
;stm32f4xx_spi.c,1160 :: 		return  bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_spi.c,1161 :: 		}
L_end_SPI_I2S_GetFlagStatus:
BX	LR
; end of _SPI_I2S_GetFlagStatus
_SPI_I2S_ClearFlag:
;stm32f4xx_spi.c,1182 :: 		void SPI_I2S_ClearFlag(SPI_TypeDef* SPIx, uint16_t SPI_I2S_FLAG)
; SPI_I2S_FLAG start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_I2S_FLAG end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_I2S_FLAG start address is: 4 (R1)
;stm32f4xx_spi.c,1189 :: 		SPIx->SR = (uint16_t)~SPI_I2S_FLAG;
ADDW	R3, R0, #8
; SPIx end address is: 0 (R0)
MVN	R2, R1
; SPI_I2S_FLAG end address is: 4 (R1)
STRH	R2, [R3, #0]
;stm32f4xx_spi.c,1190 :: 		}
L_end_SPI_I2S_ClearFlag:
BX	LR
; end of _SPI_I2S_ClearFlag
_SPI_I2S_GetITStatus:
;stm32f4xx_spi.c,1207 :: 		ITStatus SPI_I2S_GetITStatus(SPI_TypeDef* SPIx, uint8_t SPI_I2S_IT)
; SPI_I2S_IT start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_I2S_IT end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_I2S_IT start address is: 4 (R1)
;stm32f4xx_spi.c,1209 :: 		ITStatus bitstatus = RESET;
;stm32f4xx_spi.c,1210 :: 		uint16_t itpos = 0, itmask = 0, enablestatus = 0;
;stm32f4xx_spi.c,1217 :: 		itpos = 0x01 << (SPI_I2S_IT & 0x0F);
AND	R3, R1, #15
MOVS	R2, #1
LSL	R4, R2, R3
UXTH	R4, R4
;stm32f4xx_spi.c,1220 :: 		itmask = SPI_I2S_IT >> 4;
LSRS	R2, R1, #4
UXTB	R2, R2
; SPI_I2S_IT end address is: 4 (R1)
; itmask start address is: 4 (R1)
UXTB	R1, R2
;stm32f4xx_spi.c,1223 :: 		itmask = 0x01 << itmask;
MOVS	R2, #1
LSL	R3, R2, R1
UXTH	R3, R3
; itmask end address is: 4 (R1)
;stm32f4xx_spi.c,1226 :: 		enablestatus = (SPIx->CR2 & itmask) ;
ADDS	R2, R0, #4
LDRH	R2, [R2, #0]
ANDS	R2, R3
; enablestatus start address is: 4 (R1)
UXTH	R1, R2
;stm32f4xx_spi.c,1229 :: 		if (((SPIx->SR & itpos) != (uint16_t)RESET) && enablestatus)
ADDW	R2, R0, #8
; SPIx end address is: 0 (R0)
LDRH	R2, [R2, #0]
ANDS	R2, R4
UXTH	R2, R2
CMP	R2, #0
IT	EQ
BEQ	L__SPI_I2S_GetITStatus93
CMP	R1, #0
IT	EQ
BEQ	L__SPI_I2S_GetITStatus92
; enablestatus end address is: 4 (R1)
L__SPI_I2S_GetITStatus91:
;stm32f4xx_spi.c,1232 :: 		bitstatus = SET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #1
;stm32f4xx_spi.c,1233 :: 		}
; bitstatus end address is: 0 (R0)
IT	AL
BAL	L_SPI_I2S_GetITStatus74
;stm32f4xx_spi.c,1229 :: 		if (((SPIx->SR & itpos) != (uint16_t)RESET) && enablestatus)
L__SPI_I2S_GetITStatus93:
L__SPI_I2S_GetITStatus92:
;stm32f4xx_spi.c,1237 :: 		bitstatus = RESET;
; bitstatus start address is: 0 (R0)
MOVS	R0, #0
; bitstatus end address is: 0 (R0)
;stm32f4xx_spi.c,1238 :: 		}
L_SPI_I2S_GetITStatus74:
;stm32f4xx_spi.c,1240 :: 		return bitstatus;
; bitstatus start address is: 0 (R0)
; bitstatus end address is: 0 (R0)
;stm32f4xx_spi.c,1241 :: 		}
L_end_SPI_I2S_GetITStatus:
BX	LR
; end of _SPI_I2S_GetITStatus
_SPI_I2S_ClearITPendingBit:
;stm32f4xx_spi.c,1262 :: 		void SPI_I2S_ClearITPendingBit(SPI_TypeDef* SPIx, uint8_t SPI_I2S_IT)
; SPI_I2S_IT start address is: 4 (R1)
; SPIx start address is: 0 (R0)
; SPI_I2S_IT end address is: 4 (R1)
; SPIx end address is: 0 (R0)
; SPIx start address is: 0 (R0)
; SPI_I2S_IT start address is: 4 (R1)
;stm32f4xx_spi.c,1264 :: 		uint16_t itpos = 0;
;stm32f4xx_spi.c,1270 :: 		itpos = 0x01 << (SPI_I2S_IT & 0x0F);
AND	R3, R1, #15
; SPI_I2S_IT end address is: 4 (R1)
MOVS	R2, #1
LSLS	R2, R3
UXTH	R2, R2
;stm32f4xx_spi.c,1273 :: 		SPIx->SR = (uint16_t)~itpos;
ADDW	R3, R0, #8
; SPIx end address is: 0 (R0)
MVN	R2, R2
STRH	R2, [R3, #0]
;stm32f4xx_spi.c,1274 :: 		}
L_end_SPI_I2S_ClearITPendingBit:
BX	LR
; end of _SPI_I2S_ClearITPendingBit
