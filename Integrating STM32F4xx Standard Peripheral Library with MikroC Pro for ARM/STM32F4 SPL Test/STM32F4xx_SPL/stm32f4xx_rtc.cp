#line 1 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
#line 1 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
#line 1 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
#line 146 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef enum IRQn
{

 NonMaskableInt_IRQn = -14,
 MemoryManagement_IRQn = -12,
 BusFault_IRQn = -11,
 UsageFault_IRQn = -10,
 SVCall_IRQn = -5,
 DebugMonitor_IRQn = -4,
 PendSV_IRQn = -2,
 SysTick_IRQn = -1,

 WWDG_IRQn = 0,
 PVD_IRQn = 1,
 TAMP_STAMP_IRQn = 2,
 RTC_WKUP_IRQn = 3,
 FLASH_IRQn = 4,
 RCC_IRQn = 5,
 EXTI0_IRQn = 6,
 EXTI1_IRQn = 7,
 EXTI2_IRQn = 8,
 EXTI3_IRQn = 9,
 EXTI4_IRQn = 10,
 DMA1_Stream0_IRQn = 11,
 DMA1_Stream1_IRQn = 12,
 DMA1_Stream2_IRQn = 13,
 DMA1_Stream3_IRQn = 14,
 DMA1_Stream4_IRQn = 15,
 DMA1_Stream5_IRQn = 16,
 DMA1_Stream6_IRQn = 17,
 ADC_IRQn = 18,
 CAN1_TX_IRQn = 19,
 CAN1_RX0_IRQn = 20,
 CAN1_RX1_IRQn = 21,
 CAN1_SCE_IRQn = 22,
 EXTI9_5_IRQn = 23,
 TIM1_BRK_TIM9_IRQn = 24,
 TIM1_UP_TIM10_IRQn = 25,
 TIM1_TRG_COM_TIM11_IRQn = 26,
 TIM1_CC_IRQn = 27,
 TIM2_IRQn = 28,
 TIM3_IRQn = 29,
 TIM4_IRQn = 30,
 I2C1_EV_IRQn = 31,
 I2C1_ER_IRQn = 32,
 I2C2_EV_IRQn = 33,
 I2C2_ER_IRQn = 34,
 SPI1_IRQn = 35,
 SPI2_IRQn = 36,
 USART1_IRQn = 37,
 USART2_IRQn = 38,
 USART3_IRQn = 39,
 EXTI15_10_IRQn = 40,
 RTC_Alarm_IRQn = 41,
 OTG_FS_WKUP_IRQn = 42,
 TIM8_BRK_TIM12_IRQn = 43,
 TIM8_UP_TIM13_IRQn = 44,
 TIM8_TRG_COM_TIM14_IRQn = 45,
 TIM8_CC_IRQn = 46,
 DMA1_Stream7_IRQn = 47,
 FSMC_IRQn = 48,
 SDIO_IRQn = 49,
 TIM5_IRQn = 50,
 SPI3_IRQn = 51,
 UART4_IRQn = 52,
 UART5_IRQn = 53,
 TIM6_DAC_IRQn = 54,
 TIM7_IRQn = 55,
 DMA2_Stream0_IRQn = 56,
 DMA2_Stream1_IRQn = 57,
 DMA2_Stream2_IRQn = 58,
 DMA2_Stream3_IRQn = 59,
 DMA2_Stream4_IRQn = 60,
 ETH_IRQn = 61,
 ETH_WKUP_IRQn = 62,
 CAN2_TX_IRQn = 63,
 CAN2_RX0_IRQn = 64,
 CAN2_RX1_IRQn = 65,
 CAN2_SCE_IRQn = 66,
 OTG_FS_IRQn = 67,
 DMA2_Stream5_IRQn = 68,
 DMA2_Stream6_IRQn = 69,
 DMA2_Stream7_IRQn = 70,
 USART6_IRQn = 71,
 I2C3_EV_IRQn = 72,
 I2C3_ER_IRQn = 73,
 OTG_HS_EP1_OUT_IRQn = 74,
 OTG_HS_EP1_IN_IRQn = 75,
 OTG_HS_WKUP_IRQn = 76,
 OTG_HS_IRQn = 77,
 DCMI_IRQn = 78,
 CRYP_IRQn = 79,
 HASH_RNG_IRQn = 80,
 FPU_IRQn = 81
} IRQn_Type;
#line 1 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 51 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed short int_least16_t;
typedef signed int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned short uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cminstr.h"
#line 584 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cminstr.h"
static void __DSB(){
 asm dsb;
}
static void __WFI(){
 asm wfi;
}
static void __WFE(){
 asm wfe;
}

static uint32_t __REV(uint32_t value)
{
 asm rev R0, R0;
}
#line 1 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cmfunc.h"
#line 1 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4_simd.h"
#line 227 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
typedef union
{
 struct
 {



 uint32_t _reserved0:16;
 uint32_t GE:4;
 uint32_t _reserved1:7;

 uint32_t Q:1;
 uint32_t V:1;
 uint32_t C:1;
 uint32_t Z:1;
 uint32_t N:1;
 } b;
 uint32_t w;
} APSR_Type;
#line 250 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
typedef union
{
 struct
 {
 uint32_t ISR:9;
 uint32_t _reserved0:23;
 } b;
 uint32_t w;
} IPSR_Type;
#line 263 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
typedef union
{
 struct
 {
 uint32_t ISR:9;



 uint32_t _reserved0:7;
 uint32_t GE:4;
 uint32_t _reserved1:4;

 uint32_t T:1;
 uint32_t IT:2;
 uint32_t Q:1;
 uint32_t V:1;
 uint32_t C:1;
 uint32_t Z:1;
 uint32_t N:1;
 } b;
 uint32_t w;
} xPSR_Type;
#line 289 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
typedef union
{
 struct
 {
 uint32_t nPRIV:1;
 uint32_t SPSEL:1;
 uint32_t FPCA:1;
 uint32_t _reserved0:29;
 } b;
 uint32_t w;
} CONTROL_Type;
#line 312 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
typedef struct
{
  volatile  uint32_t ISER[8];
 uint32_t RESERVED0[24];
  volatile  uint32_t ICER[8];
 uint32_t RSERVED1[24];
  volatile  uint32_t ISPR[8];
 uint32_t RESERVED2[24];
  volatile  uint32_t ICPR[8];
 uint32_t RESERVED3[24];
  volatile  uint32_t IABR[8];
 uint32_t RESERVED4[56];
  volatile  uint8_t IP[240];
 uint32_t RESERVED5[644];
  volatile  uint32_t STIR;
} NVIC_Type;
#line 344 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
typedef struct
{
  volatile  uint32_t CPUID;
  volatile  uint32_t ICSR;
  volatile  uint32_t VTOR;
  volatile  uint32_t AIRCR;
  volatile  uint32_t SCR;
  volatile  uint32_t CCR;
  volatile  uint8_t SHP[12];
  volatile  uint32_t SHCSR;
  volatile  uint32_t CFSR;
  volatile  uint32_t HFSR;
  volatile  uint32_t DFSR;
  volatile  uint32_t MMFAR;
  volatile  uint32_t BFAR;
  volatile  uint32_t AFSR;
  volatile  uint32_t PFR[2];
  volatile  uint32_t DFR;
  volatile  uint32_t ADR;
  volatile  uint32_t MMFR[4];
  volatile  uint32_t ISAR[5];
 uint32_t RESERVED0[5];
  volatile  uint32_t CPACR;
} SCB_Type;
#line 561 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
typedef struct
{
 uint32_t RESERVED0[1];
  volatile  uint32_t ICTR;
  volatile  uint32_t ACTLR;
} SCnSCB_Type;
#line 599 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
typedef struct
{
  volatile  uint32_t CTRL;
  volatile  uint32_t LOAD;
  volatile  uint32_t VAL;
  volatile  uint32_t CALIB;
} SysTick_Type;
#line 649 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
typedef struct
{
  volatile  union
 {
  volatile  uint8_t u8;
  volatile  uint16_t u16;
  volatile  uint32_t u32;
 } PORT [32];
 uint32_t RESERVED0[864];
  volatile  uint32_t TER;
 uint32_t RESERVED1[15];
  volatile  uint32_t TPR;
 uint32_t RESERVED2[15];
  volatile  uint32_t TCR;
} ITM_Type;
#line 709 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
typedef struct
{
  volatile  uint32_t TYPE;
  volatile  uint32_t CTRL;
  volatile  uint32_t RNR;
  volatile  uint32_t RBAR;
  volatile  uint32_t RASR;
  volatile  uint32_t RBAR_A1;
  volatile  uint32_t RASR_A1;
  volatile  uint32_t RBAR_A2;
  volatile  uint32_t RASR_A2;
  volatile  uint32_t RBAR_A3;
  volatile  uint32_t RASR_A3;
} MPU_Type;
#line 784 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
typedef struct
{
 uint32_t RESERVED0[1];
  volatile  uint32_t FPCCR;
  volatile  uint32_t FPCAR;
  volatile  uint32_t FPDSCR;
  volatile  uint32_t MVFR0;
  volatile  uint32_t MVFR1;
} FPU_Type;
#line 889 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
typedef struct
{
  volatile  uint32_t DHCSR;
  volatile  uint32_t DCRSR;
  volatile  uint32_t DCRDR;
  volatile  uint32_t DEMCR;
} CoreDebug_Type;
#line 1046 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
 uint32_t reg_value;
 uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07);

 reg_value =  ((SCB_Type *) ( (0xE000E000UL)  + 0x0D00UL)  ) ->AIRCR;
 reg_value &= ~( (0xFFFFUL << 16 )  |  (7UL << 8 ) );
 reg_value = (reg_value |
 ((uint32_t)0x5FA <<  16 ) |
 (PriorityGroupTmp << 8));
  ((SCB_Type *) ( (0xE000E000UL)  + 0x0D00UL)  ) ->AIRCR = reg_value;
}
#line 1067 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   uint32_t NVIC_GetPriorityGrouping(void)
{
 return (( ((SCB_Type *) ( (0xE000E000UL)  + 0x0D00UL)  ) ->AIRCR &  (7UL << 8 ) ) >>  8 );
}
#line 1080 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   void NVIC_EnableIRQ(IRQn_Type IRQn)
{

  ((NVIC_Type *) ( (0xE000E000UL)  + 0x0100UL)  ) ->ISER[(uint32_t)((int32_t)IRQn) >> 5] = (uint32_t)(1 << ((uint32_t)((int32_t)IRQn) & (uint32_t)0x1F));
}
#line 1094 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ( (0xE000E000UL)  + 0x0100UL)  ) ->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));
}
#line 1109 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
 return((uint32_t) (( ((NVIC_Type *) ( (0xE000E000UL)  + 0x0100UL)  ) ->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));
}
#line 1122 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ( (0xE000E000UL)  + 0x0100UL)  ) ->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));
}
#line 1135 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ( (0xE000E000UL)  + 0x0100UL)  ) ->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));
}
#line 1148 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
 return((uint32_t)(( ((NVIC_Type *) ( (0xE000E000UL)  + 0x0100UL)  ) ->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));
}
#line 1165 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
 if(IRQn < 0) {
  ((SCB_Type *) ( (0xE000E000UL)  + 0x0D00UL)  ) ->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 -  4 )) & 0xff); }
 else {
  ((NVIC_Type *) ( (0xE000E000UL)  + 0x0100UL)  ) ->IP[(uint32_t)(IRQn)] = ((priority << (8 -  4 )) & 0xff); }
}
#line 1186 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

 if(IRQn < 0) {
 return((uint32_t)( ((SCB_Type *) ( (0xE000E000UL)  + 0x0D00UL)  ) ->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 -  4 ))); }
 else {
 return((uint32_t)( ((NVIC_Type *) ( (0xE000E000UL)  + 0x0100UL)  ) ->IP[(uint32_t)(IRQn)] >> (8 -  4 ))); }
}
#line 1210 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
 uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);
 uint32_t PreemptPriorityBits;
 uint32_t SubPriorityBits;

 PreemptPriorityBits = ((7 - PriorityGroupTmp) >  4 ) ?  4  : 7 - PriorityGroupTmp;
 SubPriorityBits = ((PriorityGroupTmp +  4 ) < 7) ? 0 : PriorityGroupTmp - 7 +  4 ;

 return (
 ((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
 ((SubPriority & ((1 << (SubPriorityBits )) - 1)))
 );
}
#line 1240 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority)
{
 uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);
 uint32_t PreemptPriorityBits;
 uint32_t SubPriorityBits;

 PreemptPriorityBits = ((7 - PriorityGroupTmp) >  4 ) ?  4  : 7 - PriorityGroupTmp;
 SubPriorityBits = ((PriorityGroupTmp +  4 ) < 7) ? 0 : PriorityGroupTmp - 7 +  4 ;

 *pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
 *pSubPriority = (Priority ) & ((1 << (SubPriorityBits )) - 1);
}
#line 1258 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   void NVIC_SystemReset(void)
{
#line 1261 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
 __DSB();
  ((SCB_Type *) ( (0xE000E000UL)  + 0x0D00UL)  ) ->AIRCR = ((0x5FA <<  16 ) |
 ( ((SCB_Type *) ( (0xE000E000UL)  + 0x0D00UL)  ) ->AIRCR &  (7UL << 8 ) ) |
  (1UL << 2 ) );
 __DSB();
 while(1);
}
#line 1290 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   uint32_t SysTick_Config(uint32_t ticks)
{
 if (ticks >  (0xFFFFFFUL << 0 ) ) return (1);

  ((SysTick_Type *) ( (0xE000E000UL)  + 0x0010UL)  ) ->LOAD = (ticks &  (0xFFFFFFUL << 0 ) ) - 1;
 NVIC_SetPriority (SysTick_IRQn, (1<< 4 ) - 1);
  ((SysTick_Type *) ( (0xE000E000UL)  + 0x0010UL)  ) ->VAL = 0;
  ((SysTick_Type *) ( (0xE000E000UL)  + 0x0010UL)  ) ->CTRL =  (1UL << 2 )  |
  (1UL << 1 )  |
  (1UL << 0 ) ;
 return (0);
}
#line 1315 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
extern volatile int32_t ITM_RxBuffer;
#line 1328 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   uint32_t ITM_SendChar (uint32_t ch)
{
 if (( ((CoreDebug_Type *) (0xE000EDF0UL) ) ->DEMCR &  (1UL << 24 ) ) &&
 ( ((ITM_Type *) (0xE0000000UL)  ) ->TCR &  (1UL << 0 ) ) &&
 ( ((ITM_Type *) (0xE0000000UL)  ) ->TER & (1UL << 0) ) )
 {
 while ( ((ITM_Type *) (0xE0000000UL)  ) ->PORT[0].u32 == 0);
  ((ITM_Type *) (0xE0000000UL)  ) ->PORT[0].u8 = (uint8_t) ch;
 }
 return (ch);
}
#line 1350 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   int32_t ITM_ReceiveChar (void) {
 int32_t ch = -1;

 if (ITM_RxBuffer !=  0x5AA55AA5 ) {
 ch = ITM_RxBuffer;
 ITM_RxBuffer =  0x5AA55AA5 ;
 }

 return (ch);
}
#line 1370 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/core_cm4.h"
static   int32_t ITM_CheckChar (void) {

 if (ITM_RxBuffer ==  0x5AA55AA5 ) {
 return (0);
 } else {
 return (1);
 }
}
#line 1 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/system_stm32f4xx.h"
#line 59 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/system_stm32f4xx.h"
extern uint32_t SystemCoreClock;
#line 86 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/system_stm32f4xx.h"
extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 254 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef int32_t s32;
typedef int16_t s16;
typedef int8_t s8;

typedef const int32_t sc32;
typedef const int16_t sc16;
typedef const int8_t sc8;

typedef  volatile  int32_t vs32;
typedef  volatile  int16_t vs16;
typedef  volatile  int8_t vs8;

typedef  volatile  int32_t vsc32;
typedef  volatile  int16_t vsc16;
typedef  volatile  int8_t vsc8;

typedef uint32_t u32;
typedef uint16_t u16;
typedef uint8_t u8;

typedef const uint32_t uc32;
typedef const uint16_t uc16;
typedef const uint8_t uc8;

typedef  volatile  uint32_t vu32;
typedef  volatile  uint16_t vu16;
typedef  volatile  uint8_t vu8;

typedef  volatile  uint32_t vuc32;
typedef  volatile  uint16_t vuc16;
typedef  volatile  uint8_t vuc8;

typedef enum {RESET = 0, SET = !RESET} FlagStatus, ITStatus;

typedef enum {DISABLE = 0, ENABLE = !DISABLE} FunctionalState;


typedef enum {ERROR = 0, SUCCESS = !ERROR} ErrorStatus;
#line 305 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t SR;
  volatile  uint32_t CR1;
  volatile  uint32_t CR2;
  volatile  uint32_t SMPR1;
  volatile  uint32_t SMPR2;
  volatile  uint32_t JOFR1;
  volatile  uint32_t JOFR2;
  volatile  uint32_t JOFR3;
  volatile  uint32_t JOFR4;
  volatile  uint32_t HTR;
  volatile  uint32_t LTR;
  volatile  uint32_t SQR1;
  volatile  uint32_t SQR2;
  volatile  uint32_t SQR3;
  volatile  uint32_t JSQR;
  volatile  uint32_t JDR1;
  volatile  uint32_t JDR2;
  volatile  uint32_t JDR3;
  volatile  uint32_t JDR4;
  volatile  uint32_t DR;
} ADC_TypeDef;

typedef struct
{
  volatile  uint32_t CSR;
  volatile  uint32_t CCR;
#line 334 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
  volatile  uint32_t CDR;
} ADC_Common_TypeDef;
#line 342 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t TIR;
  volatile  uint32_t TDTR;
  volatile  uint32_t TDLR;
  volatile  uint32_t TDHR;
} CAN_TxMailBox_TypeDef;
#line 354 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t RIR;
  volatile  uint32_t RDTR;
  volatile  uint32_t RDLR;
  volatile  uint32_t RDHR;
} CAN_FIFOMailBox_TypeDef;
#line 366 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t FR1;
  volatile  uint32_t FR2;
} CAN_FilterRegister_TypeDef;
#line 376 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t MCR;
  volatile  uint32_t MSR;
  volatile  uint32_t TSR;
  volatile  uint32_t RF0R;
  volatile  uint32_t RF1R;
  volatile  uint32_t IER;
  volatile  uint32_t ESR;
  volatile  uint32_t BTR;
 uint32_t RESERVED0[88];
 CAN_TxMailBox_TypeDef sTxMailBox[3];
 CAN_FIFOMailBox_TypeDef sFIFOMailBox[2];
 uint32_t RESERVED1[12];
  volatile  uint32_t FMR;
  volatile  uint32_t FM1R;
 uint32_t RESERVED2;
  volatile  uint32_t FS1R;
 uint32_t RESERVED3;
  volatile  uint32_t FFA1R;
 uint32_t RESERVED4;
  volatile  uint32_t FA1R;
 uint32_t RESERVED5[8];
 CAN_FilterRegister_TypeDef sFilterRegister[28];
} CAN_TypeDef;
#line 406 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t DR;
  volatile  uint8_t IDR;
 uint8_t RESERVED0;
 uint16_t RESERVED1;
  volatile  uint32_t CR;
} CRC_TypeDef;
#line 419 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t SWTRIGR;
  volatile  uint32_t DHR12R1;
  volatile  uint32_t DHR12L1;
  volatile  uint32_t DHR8R1;
  volatile  uint32_t DHR12R2;
  volatile  uint32_t DHR12L2;
  volatile  uint32_t DHR8R2;
  volatile  uint32_t DHR12RD;
  volatile  uint32_t DHR12LD;
  volatile  uint32_t DHR8RD;
  volatile  uint32_t DOR1;
  volatile  uint32_t DOR2;
  volatile  uint32_t SR;
} DAC_TypeDef;
#line 441 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t IDCODE;
  volatile  uint32_t CR;
  volatile  uint32_t APB1FZ;
  volatile  uint32_t APB2FZ;
}DBGMCU_TypeDef;
#line 453 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t SR;
  volatile  uint32_t RISR;
  volatile  uint32_t IER;
  volatile  uint32_t MISR;
  volatile  uint32_t ICR;
  volatile  uint32_t ESCR;
  volatile  uint32_t ESUR;
  volatile  uint32_t CWSTRTR;
  volatile  uint32_t CWSIZER;
  volatile  uint32_t DR;
} DCMI_TypeDef;
#line 472 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t NDTR;
  volatile  uint32_t PAR;
  volatile  uint32_t M0AR;
  volatile  uint32_t M1AR;
  volatile  uint32_t FCR;
} DMA_Stream_TypeDef;

typedef struct
{
  volatile  uint32_t LISR;
  volatile  uint32_t HISR;
  volatile  uint32_t LIFCR;
  volatile  uint32_t HIFCR;
} DMA_TypeDef;
#line 494 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t MACCR;
  volatile  uint32_t MACFFR;
  volatile  uint32_t MACHTHR;
  volatile  uint32_t MACHTLR;
  volatile  uint32_t MACMIIAR;
  volatile  uint32_t MACMIIDR;
  volatile  uint32_t MACFCR;
  volatile  uint32_t MACVLANTR;
 uint32_t RESERVED0[2];
  volatile  uint32_t MACRWUFFR;
  volatile  uint32_t MACPMTCSR;
 uint32_t RESERVED1[2];
  volatile  uint32_t MACSR;
  volatile  uint32_t MACIMR;
  volatile  uint32_t MACA0HR;
  volatile  uint32_t MACA0LR;
  volatile  uint32_t MACA1HR;
  volatile  uint32_t MACA1LR;
  volatile  uint32_t MACA2HR;
  volatile  uint32_t MACA2LR;
  volatile  uint32_t MACA3HR;
  volatile  uint32_t MACA3LR;
 uint32_t RESERVED2[40];
  volatile  uint32_t MMCCR;
  volatile  uint32_t MMCRIR;
  volatile  uint32_t MMCTIR;
  volatile  uint32_t MMCRIMR;
  volatile  uint32_t MMCTIMR;
 uint32_t RESERVED3[14];
  volatile  uint32_t MMCTGFSCCR;
  volatile  uint32_t MMCTGFMSCCR;
 uint32_t RESERVED4[5];
  volatile  uint32_t MMCTGFCR;
 uint32_t RESERVED5[10];
  volatile  uint32_t MMCRFCECR;
  volatile  uint32_t MMCRFAECR;
 uint32_t RESERVED6[10];
  volatile  uint32_t MMCRGUFCR;
 uint32_t RESERVED7[334];
  volatile  uint32_t PTPTSCR;
  volatile  uint32_t PTPSSIR;
  volatile  uint32_t PTPTSHR;
  volatile  uint32_t PTPTSLR;
  volatile  uint32_t PTPTSHUR;
  volatile  uint32_t PTPTSLUR;
  volatile  uint32_t PTPTSAR;
  volatile  uint32_t PTPTTHR;
  volatile  uint32_t PTPTTLR;
  volatile  uint32_t RESERVED8;
  volatile  uint32_t PTPTSSR;
 uint32_t RESERVED9[565];
  volatile  uint32_t DMABMR;
  volatile  uint32_t DMATPDR;
  volatile  uint32_t DMARPDR;
  volatile  uint32_t DMARDLAR;
  volatile  uint32_t DMATDLAR;
  volatile  uint32_t DMASR;
  volatile  uint32_t DMAOMR;
  volatile  uint32_t DMAIER;
  volatile  uint32_t DMAMFBOCR;
  volatile  uint32_t DMARSWTR;
 uint32_t RESERVED10[8];
  volatile  uint32_t DMACHTDR;
  volatile  uint32_t DMACHRDR;
  volatile  uint32_t DMACHTBAR;
  volatile  uint32_t DMACHRBAR;
} ETH_TypeDef;
#line 568 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t IMR;
  volatile  uint32_t EMR;
  volatile  uint32_t RTSR;
  volatile  uint32_t FTSR;
  volatile  uint32_t SWIER;
  volatile  uint32_t PR;
} EXTI_TypeDef;
#line 582 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t ACR;
  volatile  uint32_t KEYR;
  volatile  uint32_t OPTKEYR;
  volatile  uint32_t SR;
  volatile  uint32_t CR;
  volatile  uint32_t OPTCR;
} FLASH_TypeDef;
#line 596 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t BTCR[8];
} FSMC_Bank1_TypeDef;
#line 605 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t BWTR[7];
} FSMC_Bank1E_TypeDef;
#line 614 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t PCR2;
  volatile  uint32_t SR2;
  volatile  uint32_t PMEM2;
  volatile  uint32_t PATT2;
 uint32_t RESERVED0;
  volatile  uint32_t ECCR2;
} FSMC_Bank2_TypeDef;
#line 628 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t PCR3;
  volatile  uint32_t SR3;
  volatile  uint32_t PMEM3;
  volatile  uint32_t PATT3;
 uint32_t RESERVED0;
  volatile  uint32_t ECCR3;
} FSMC_Bank3_TypeDef;
#line 642 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t PCR4;
  volatile  uint32_t SR4;
  volatile  uint32_t PMEM4;
  volatile  uint32_t PATT4;
  volatile  uint32_t PIO4;
} FSMC_Bank4_TypeDef;
#line 655 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t MODER;
  volatile  uint32_t OTYPER;
  volatile  uint32_t OSPEEDR;
  volatile  uint32_t PUPDR;
  volatile  uint32_t IDR;
  volatile  uint32_t ODR;
  volatile  uint16_t BSRRL;
  volatile  uint16_t BSRRH;
  volatile  uint32_t LCKR;
  volatile  uint32_t AFR[2];
} GPIO_TypeDef;
#line 673 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t MEMRMP;
  volatile  uint32_t PMC;
  volatile  uint32_t EXTICR[4];
 uint32_t RESERVED[2];
  volatile  uint32_t CMPCR;
} SYSCFG_TypeDef;
#line 686 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint16_t CR1;
 uint16_t RESERVED0;
  volatile  uint16_t CR2;
 uint16_t RESERVED1;
  volatile  uint16_t OAR1;
 uint16_t RESERVED2;
  volatile  uint16_t OAR2;
 uint16_t RESERVED3;
  volatile  uint16_t DR;
 uint16_t RESERVED4;
  volatile  uint16_t SR1;
 uint16_t RESERVED5;
  volatile  uint16_t SR2;
 uint16_t RESERVED6;
  volatile  uint16_t CCR;
 uint16_t RESERVED7;
  volatile  uint16_t TRISE;
 uint16_t RESERVED8;
} I2C_TypeDef;
#line 712 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t KR;
  volatile  uint32_t PR;
  volatile  uint32_t RLR;
  volatile  uint32_t SR;
} IWDG_TypeDef;
#line 724 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t CSR;
} PWR_TypeDef;
#line 734 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t PLLCFGR;
  volatile  uint32_t CFGR;
  volatile  uint32_t CIR;
  volatile  uint32_t AHB1RSTR;
  volatile  uint32_t AHB2RSTR;
  volatile  uint32_t AHB3RSTR;
 uint32_t RESERVED0;
  volatile  uint32_t APB1RSTR;
  volatile  uint32_t APB2RSTR;
 uint32_t RESERVED1[2];
  volatile  uint32_t AHB1ENR;
  volatile  uint32_t AHB2ENR;
  volatile  uint32_t AHB3ENR;
 uint32_t RESERVED2;
  volatile  uint32_t APB1ENR;
  volatile  uint32_t APB2ENR;
 uint32_t RESERVED3[2];
  volatile  uint32_t AHB1LPENR;
  volatile  uint32_t AHB2LPENR;
  volatile  uint32_t AHB3LPENR;
 uint32_t RESERVED4;
  volatile  uint32_t APB1LPENR;
  volatile  uint32_t APB2LPENR;
 uint32_t RESERVED5[2];
  volatile  uint32_t BDCR;
  volatile  uint32_t CSR;
 uint32_t RESERVED6[2];
  volatile  uint32_t SSCGR;
  volatile  uint32_t PLLI2SCFGR;
} RCC_TypeDef;
#line 772 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t TR;
  volatile  uint32_t DR;
  volatile  uint32_t CR;
  volatile  uint32_t ISR;
  volatile  uint32_t PRER;
  volatile  uint32_t WUTR;
  volatile  uint32_t CALIBR;
  volatile  uint32_t ALRMAR;
  volatile  uint32_t ALRMBR;
  volatile  uint32_t WPR;
  volatile  uint32_t SSR;
  volatile  uint32_t SHIFTR;
  volatile  uint32_t TSTR;
  volatile  uint32_t TSDR;
  volatile  uint32_t TSSSR;
  volatile  uint32_t CALR;
  volatile  uint32_t TAFCR;
  volatile  uint32_t ALRMASSR;
  volatile  uint32_t ALRMBSSR;
 uint32_t RESERVED7;
  volatile  uint32_t BKP0R;
  volatile  uint32_t BKP1R;
  volatile  uint32_t BKP2R;
  volatile  uint32_t BKP3R;
  volatile  uint32_t BKP4R;
  volatile  uint32_t BKP5R;
  volatile  uint32_t BKP6R;
  volatile  uint32_t BKP7R;
  volatile  uint32_t BKP8R;
  volatile  uint32_t BKP9R;
  volatile  uint32_t BKP10R;
  volatile  uint32_t BKP11R;
  volatile  uint32_t BKP12R;
  volatile  uint32_t BKP13R;
  volatile  uint32_t BKP14R;
  volatile  uint32_t BKP15R;
  volatile  uint32_t BKP16R;
  volatile  uint32_t BKP17R;
  volatile  uint32_t BKP18R;
  volatile  uint32_t BKP19R;
} RTC_TypeDef;
#line 820 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t POWER;
  volatile  uint32_t CLKCR;
  volatile  uint32_t ARG;
  volatile  uint32_t CMD;
  volatile  uint32_t RESPCMD;
  volatile  uint32_t RESP1;
  volatile  uint32_t RESP2;
  volatile  uint32_t RESP3;
  volatile  uint32_t RESP4;
  volatile  uint32_t DTIMER;
  volatile  uint32_t DLEN;
  volatile  uint32_t DCTRL;
  volatile  uint32_t DCOUNT;
  volatile  uint32_t STA;
  volatile  uint32_t ICR;
  volatile  uint32_t MASK;
 uint32_t RESERVED0[2];
  volatile  uint32_t FIFOCNT;
 uint32_t RESERVED1[13];
  volatile  uint32_t FIFO;
} SDIO_TypeDef;
#line 848 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint16_t CR1;
 uint16_t RESERVED0;
  volatile  uint16_t CR2;
 uint16_t RESERVED1;
  volatile  uint16_t SR;
 uint16_t RESERVED2;
  volatile  uint16_t DR;
 uint16_t RESERVED3;
  volatile  uint16_t CRCPR;
 uint16_t RESERVED4;
  volatile  uint16_t RXCRCR;
 uint16_t RESERVED5;
  volatile  uint16_t TXCRCR;
 uint16_t RESERVED6;
  volatile  uint16_t I2SCFGR;
 uint16_t RESERVED7;
  volatile  uint16_t I2SPR;
 uint16_t RESERVED8;
} SPI_TypeDef;
#line 874 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint16_t CR1;
 uint16_t RESERVED0;
  volatile  uint16_t CR2;
 uint16_t RESERVED1;
  volatile  uint16_t SMCR;
 uint16_t RESERVED2;
  volatile  uint16_t DIER;
 uint16_t RESERVED3;
  volatile  uint16_t SR;
 uint16_t RESERVED4;
  volatile  uint16_t EGR;
 uint16_t RESERVED5;
  volatile  uint16_t CCMR1;
 uint16_t RESERVED6;
  volatile  uint16_t CCMR2;
 uint16_t RESERVED7;
  volatile  uint16_t CCER;
 uint16_t RESERVED8;
  volatile  uint32_t CNT;
  volatile  uint16_t PSC;
 uint16_t RESERVED9;
  volatile  uint32_t ARR;
  volatile  uint16_t RCR;
 uint16_t RESERVED10;
  volatile  uint32_t CCR1;
  volatile  uint32_t CCR2;
  volatile  uint32_t CCR3;
  volatile  uint32_t CCR4;
  volatile  uint16_t BDTR;
 uint16_t RESERVED11;
  volatile  uint16_t DCR;
 uint16_t RESERVED12;
  volatile  uint16_t DMAR;
 uint16_t RESERVED13;
  volatile  uint16_t OR;
 uint16_t RESERVED14;
} TIM_TypeDef;
#line 918 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint16_t SR;
 uint16_t RESERVED0;
  volatile  uint16_t DR;
 uint16_t RESERVED1;
  volatile  uint16_t BRR;
 uint16_t RESERVED2;
  volatile  uint16_t CR1;
 uint16_t RESERVED3;
  volatile  uint16_t CR2;
 uint16_t RESERVED4;
  volatile  uint16_t CR3;
 uint16_t RESERVED5;
  volatile  uint16_t GTPR;
 uint16_t RESERVED6;
} USART_TypeDef;
#line 940 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t CFR;
  volatile  uint32_t SR;
} WWDG_TypeDef;
#line 951 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t SR;
  volatile  uint32_t DR;
  volatile  uint32_t DOUT;
  volatile  uint32_t DMACR;
  volatile  uint32_t IMSCR;
  volatile  uint32_t RISR;
  volatile  uint32_t MISR;
  volatile  uint32_t K0LR;
  volatile  uint32_t K0RR;
  volatile  uint32_t K1LR;
  volatile  uint32_t K1RR;
  volatile  uint32_t K2LR;
  volatile  uint32_t K2RR;
  volatile  uint32_t K3LR;
  volatile  uint32_t K3RR;
  volatile  uint32_t IV0LR;
  volatile  uint32_t IV0RR;
  volatile  uint32_t IV1LR;
  volatile  uint32_t IV1RR;
} CRYP_TypeDef;
#line 979 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t DIN;
  volatile  uint32_t STR;
  volatile  uint32_t HR[5];
  volatile  uint32_t IMR;
  volatile  uint32_t SR;
 uint32_t RESERVED[52];
  volatile  uint32_t CSR[51];
} HASH_TypeDef;
#line 995 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
typedef struct
{
  volatile  uint32_t CR;
  volatile  uint32_t SR;
  volatile  uint32_t DR;
} RNG_TypeDef;
#line 53 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
typedef struct
{
#line 56 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint32_t RTC_HourFormat;
#line 59 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint32_t RTC_AsynchPrediv;
#line 62 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint32_t RTC_SynchPrediv;
}RTC_InitTypeDef;
#line 68 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
typedef struct
{
#line 73 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint8_t RTC_Hours;
#line 76 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint8_t RTC_Minutes;
#line 79 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint8_t RTC_Seconds;
#line 82 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint8_t RTC_H12;
}RTC_TimeTypeDef;
#line 88 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
typedef struct
{
#line 91 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint8_t RTC_WeekDay;
#line 94 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint8_t RTC_Month;
#line 97 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint8_t RTC_Date;
#line 100 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint8_t RTC_Year;
}RTC_DateTypeDef;
#line 106 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
typedef struct
{
 RTC_TimeTypeDef RTC_AlarmTime;
#line 111 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint32_t RTC_AlarmMask;
#line 114 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint32_t RTC_AlarmDateWeekDaySel;
#line 120 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
 uint8_t RTC_AlarmDateWeekDay;
}RTC_AlarmTypeDef;
#line 781 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
ErrorStatus RTC_DeInit(void);


ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct);
void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct);
void RTC_WriteProtectionCmd(FunctionalState NewState);
ErrorStatus RTC_EnterInitMode(void);
void RTC_ExitInitMode(void);
ErrorStatus RTC_WaitForSynchro(void);
ErrorStatus RTC_RefClockCmd(FunctionalState NewState);
void RTC_BypassShadowCmd(FunctionalState NewState);


ErrorStatus RTC_SetTime(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_TimeStruct);
void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct);
void RTC_GetTime(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_TimeStruct);
uint32_t RTC_GetSubSecond(void);
ErrorStatus RTC_SetDate(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct);
void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct);
void RTC_GetDate(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct);


void RTC_SetAlarm(uint32_t RTC_Format, uint32_t RTC_Alarm, RTC_AlarmTypeDef* RTC_AlarmStruct);
void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct);
void RTC_GetAlarm(uint32_t RTC_Format, uint32_t RTC_Alarm, RTC_AlarmTypeDef* RTC_AlarmStruct);
ErrorStatus RTC_AlarmCmd(uint32_t RTC_Alarm, FunctionalState NewState);
void RTC_AlarmSubSecondConfig(uint32_t RTC_Alarm, uint32_t RTC_AlarmSubSecondValue, uint32_t RTC_AlarmSubSecondMask);
uint32_t RTC_GetAlarmSubSecond(uint32_t RTC_Alarm);


void RTC_WakeUpClockConfig(uint32_t RTC_WakeUpClock);
void RTC_SetWakeUpCounter(uint32_t RTC_WakeUpCounter);
uint32_t RTC_GetWakeUpCounter(void);
ErrorStatus RTC_WakeUpCmd(FunctionalState NewState);


void RTC_DayLightSavingConfig(uint32_t RTC_DayLightSaving, uint32_t RTC_StoreOperation);
uint32_t RTC_GetStoreOperation(void);


void RTC_OutputConfig(uint32_t RTC_Output, uint32_t RTC_OutputPolarity);


ErrorStatus RTC_CoarseCalibConfig(uint32_t RTC_CalibSign, uint32_t Value);
ErrorStatus RTC_CoarseCalibCmd(FunctionalState NewState);
void RTC_CalibOutputCmd(FunctionalState NewState);
void RTC_CalibOutputConfig(uint32_t RTC_CalibOutput);
ErrorStatus RTC_SmoothCalibConfig(uint32_t RTC_SmoothCalibPeriod,
 uint32_t RTC_SmoothCalibPlusPulses,
 uint32_t RTC_SmouthCalibMinusPulsesValue);


void RTC_TimeStampCmd(uint32_t RTC_TimeStampEdge, FunctionalState NewState);
void RTC_GetTimeStamp(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_StampTimeStruct,
 RTC_DateTypeDef* RTC_StampDateStruct);
uint32_t RTC_GetTimeStampSubSecond(void);


void RTC_TamperTriggerConfig(uint32_t RTC_Tamper, uint32_t RTC_TamperTrigger);
void RTC_TamperCmd(uint32_t RTC_Tamper, FunctionalState NewState);
void RTC_TamperFilterConfig(uint32_t RTC_TamperFilter);
void RTC_TamperSamplingFreqConfig(uint32_t RTC_TamperSamplingFreq);
void RTC_TamperPinsPrechargeDuration(uint32_t RTC_TamperPrechargeDuration);
void RTC_TimeStampOnTamperDetectionCmd(FunctionalState NewState);
void RTC_TamperPullUpCmd(FunctionalState NewState);


void RTC_WriteBackupRegister(uint32_t RTC_BKP_DR, uint32_t Data);
uint32_t RTC_ReadBackupRegister(uint32_t RTC_BKP_DR);
#line 853 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rtc.h"
void RTC_TamperPinSelection(uint32_t RTC_TamperPin);
void RTC_TimeStampPinSelection(uint32_t RTC_TimeStampPin);
void RTC_OutputTypeConfig(uint32_t RTC_OutputType);


ErrorStatus RTC_SynchroShiftConfig(uint32_t RTC_ShiftAdd1S, uint32_t RTC_ShiftSubFS);


void RTC_ITConfig(uint32_t RTC_IT, FunctionalState NewState);
FlagStatus RTC_GetFlagStatus(uint32_t RTC_FLAG);
void RTC_ClearFlag(uint32_t RTC_FLAG);
ITStatus RTC_GetITStatus(uint32_t RTC_IT);
void RTC_ClearITPendingBit(uint32_t RTC_IT);
#line 316 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
static uint8_t RTC_ByteToBcd2(uint8_t Value);
static uint8_t RTC_Bcd2ToByte(uint8_t Value);
#line 373 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_DeInit(void)
{
  volatile  uint32_t wutcounter = 0x00;
 uint32_t wutwfstatus = 0x00;
 ErrorStatus status = ERROR;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


 if (RTC_EnterInitMode() == ERROR)
 {
 status = ERROR;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TR = (uint32_t)0x00000000;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->DR = (uint32_t)0x00002101;

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= (uint32_t)0x00000007;


 do
 {
 wutwfstatus =  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000004) ;
 wutcounter++;
 } while((wutcounter !=  ((uint32_t) 0x00010000) ) && (wutwfstatus == 0x00));

 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000004) ) == RESET)
 {
 status = ERROR;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= (uint32_t)0x00000000;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WUTR = (uint32_t)0x0000FFFF;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->PRER = (uint32_t)0x007F00FF;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CALIBR = (uint32_t)0x00000000;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ALRMAR = (uint32_t)0x00000000;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ALRMBR = (uint32_t)0x00000000;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->SHIFTR = (uint32_t)0x00000000;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CALR = (uint32_t)0x00000000;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ALRMASSR = (uint32_t)0x00000000;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ALRMBSSR = (uint32_t)0x00000000;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR = (uint32_t)0x00000000;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR = 0x00000000;

 if(RTC_WaitForSynchro() == ERROR)
 {
 status = ERROR;
 }
 else
 {
 status = SUCCESS;
 }
 }
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

 return status;
}
#line 455 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
{
 ErrorStatus status = ERROR;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


 if (RTC_EnterInitMode() == ERROR)
 {
 status = ERROR;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= ((uint32_t)~( ((uint32_t)0x00000040) ));

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR |= ((uint32_t)(RTC_InitStruct->RTC_HourFormat));


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->PRER = (uint32_t)(RTC_InitStruct->RTC_SynchPrediv);
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->PRER |= (uint32_t)(RTC_InitStruct->RTC_AsynchPrediv << 16);


 RTC_ExitInitMode();

 status = SUCCESS;
 }

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

 return status;
}
#line 501 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
{

 RTC_InitStruct->RTC_HourFormat =  ((uint32_t)0x00000000) ;


 RTC_InitStruct->RTC_AsynchPrediv = (uint32_t)0x7F;


 RTC_InitStruct->RTC_SynchPrediv = (uint32_t)0xFF;
}
#line 523 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_WriteProtectionCmd(FunctionalState NewState)
{

  ((void)0) ;

 if (NewState != DISABLE)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;
 }
}
#line 550 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_EnterInitMode(void)
{
  volatile  uint32_t initcounter = 0x00;
 ErrorStatus status = ERROR;
 uint32_t initstatus = 0x00;


 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000040) ) == (uint32_t)RESET)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR = (uint32_t) ((uint32_t)0xFFFFFFFF) ;


 do
 {
 initstatus =  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000040) ;
 initcounter++;
 } while((initcounter !=  ((uint32_t) 0x00010000) ) && (initstatus == 0x00));

 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000040) ) != RESET)
 {
 status = SUCCESS;
 }
 else
 {
 status = ERROR;
 }
 }
 else
 {
 status = SUCCESS;
 }

 return (status);
}
#line 595 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_ExitInitMode(void)
{

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &= (uint32_t)~ ((uint32_t)0x00000080) ;
}
#line 617 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_WaitForSynchro(void)
{
  volatile  uint32_t synchrocounter = 0;
 ErrorStatus status = ERROR;
 uint32_t synchrostatus = 0x00;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &= (uint32_t) ((uint32_t)0xFFFFFF5F) ;


 do
 {
 synchrostatus =  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000020) ;
 synchrocounter++;
 } while((synchrocounter !=  ((uint32_t) 0x00020000) ) && (synchrostatus == 0x00));

 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000020) ) != RESET)
 {
 status = SUCCESS;
 }
 else
 {
 status = ERROR;
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

 return (status);
}
#line 660 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_RefClockCmd(FunctionalState NewState)
{
 ErrorStatus status = ERROR;


  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


 if (RTC_EnterInitMode() == ERROR)
 {
 status = ERROR;
 }
 else
 {
 if (NewState != DISABLE)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR |=  ((uint32_t)0x00000010) ;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= ~ ((uint32_t)0x00000010) ;
 }

 RTC_ExitInitMode();

 status = SUCCESS;
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

 return status;
}
#line 708 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_BypassShadowCmd(FunctionalState NewState)
{

  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;

 if (NewState != DISABLE)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR |= (uint8_t) ((uint32_t)0x00000020) ;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= (uint8_t)~ ((uint32_t)0x00000020) ;
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;
}
#line 763 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_SetTime(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_TimeStruct)
{
 uint32_t tmpreg = 0;
 ErrorStatus status = ERROR;


  ((void)0) ;

 if (RTC_Format ==  ((uint32_t)0x000000000) )
 {
 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &  ((uint32_t)0x00000040) ) != (uint32_t)RESET)
 {
  ((void)0) ;
  ((void)0) ;
 }
 else
 {
 RTC_TimeStruct->RTC_H12 = 0x00;
  ((void)0) ;
 }
  ((void)0) ;
  ((void)0) ;
 }
 else
 {
 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &  ((uint32_t)0x00000040) ) != (uint32_t)RESET)
 {
 tmpreg = RTC_Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
  ((void)0) ;
  ((void)0) ;
 }
 else
 {
 RTC_TimeStruct->RTC_H12 = 0x00;
  ((void)0) ;
 }
  ((void)0) ;
  ((void)0) ;
 }


 if (RTC_Format !=  ((uint32_t)0x000000000) )
 {
#line 809 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
 tmpreg = (((uint32_t)(RTC_TimeStruct->RTC_Hours) << 16) | ((uint32_t)(RTC_TimeStruct->RTC_Minutes) << 8) | ((uint32_t)RTC_TimeStruct->RTC_Seconds) | ((uint32_t)(RTC_TimeStruct->RTC_H12) << 16));
 }
 else
 {
#line 816 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
 tmpreg = (uint32_t)(((uint32_t)RTC_ByteToBcd2(RTC_TimeStruct->RTC_Hours) << 16) | ((uint32_t)RTC_ByteToBcd2(RTC_TimeStruct->RTC_Minutes) << 8) | ((uint32_t)RTC_ByteToBcd2(RTC_TimeStruct->RTC_Seconds)) | (((uint32_t)RTC_TimeStruct->RTC_H12) << 16));
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


 if (RTC_EnterInitMode() == ERROR)
 {
 status = ERROR;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TR = (uint32_t)(tmpreg &  ((uint32_t)0x007F7F7F) );


 RTC_ExitInitMode();


 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &  ((uint32_t)0x00000020) ) == RESET)
 {
 if (RTC_WaitForSynchro() == ERROR)
 {
 status = ERROR;
 }
 else
 {
 status = SUCCESS;
 }
 }
 else
 {
 status = SUCCESS;
 }
 }

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

 return status;
}
#line 866 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
{

 RTC_TimeStruct->RTC_H12 =  ((uint8_t)0x00) ;
 RTC_TimeStruct->RTC_Hours = 0;
 RTC_TimeStruct->RTC_Minutes = 0;
 RTC_TimeStruct->RTC_Seconds = 0;
}
#line 885 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_GetTime(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_TimeStruct)
{
 uint32_t tmpreg = 0;


  ((void)0) ;


 tmpreg = (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TR &  ((uint32_t)0x007F7F7F) );


 RTC_TimeStruct->RTC_Hours = (uint8_t)((tmpreg & ( ((uint32_t)0x00300000)  |  ((uint32_t)0x000F0000) )) >> 16);
 RTC_TimeStruct->RTC_Minutes = (uint8_t)((tmpreg & ( ((uint32_t)0x00007000)  |  ((uint32_t)0x00000F00) )) >>8);
 RTC_TimeStruct->RTC_Seconds = (uint8_t)(tmpreg & ( ((uint32_t)0x00000070)  |  ((uint32_t)0x0000000F) ));
 RTC_TimeStruct->RTC_H12 = (uint8_t)((tmpreg & ( ((uint32_t)0x00400000) )) >> 16);


 if (RTC_Format ==  ((uint32_t)0x000000000) )
 {

 RTC_TimeStruct->RTC_Hours = (uint8_t)RTC_Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
 RTC_TimeStruct->RTC_Minutes = (uint8_t)RTC_Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
 RTC_TimeStruct->RTC_Seconds = (uint8_t)RTC_Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
 }
}
#line 918 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
uint32_t RTC_GetSubSecond(void)
{
 uint32_t tmpreg = 0;


 tmpreg = (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->SSR);


 (void) ( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->DR);

 return (tmpreg);
}
#line 943 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_SetDate(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct)
{
 uint32_t tmpreg = 0;
 ErrorStatus status = ERROR;


  ((void)0) ;

 if ((RTC_Format ==  ((uint32_t)0x000000000) ) && ((RTC_DateStruct->RTC_Month & 0x10) == 0x10))
 {
 RTC_DateStruct->RTC_Month = (RTC_DateStruct->RTC_Month & (uint32_t)~(0x10)) + 0x0A;
 }
 if (RTC_Format ==  ((uint32_t)0x000000000) )
 {
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
 }
 else
 {
  ((void)0) ;
 tmpreg = RTC_Bcd2ToByte(RTC_DateStruct->RTC_Month);
  ((void)0) ;
 tmpreg = RTC_Bcd2ToByte(RTC_DateStruct->RTC_Date);
  ((void)0) ;
 }
  ((void)0) ;


 if (RTC_Format !=  ((uint32_t)0x000000000) )
 {
#line 977 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
 tmpreg = ((((uint32_t)RTC_DateStruct->RTC_Year) << 16) | (((uint32_t)RTC_DateStruct->RTC_Month) << 8) | ((uint32_t)RTC_DateStruct->RTC_Date) | (((uint32_t)RTC_DateStruct->RTC_WeekDay) << 13));
 }
 else
 {
#line 984 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
 tmpreg = (((uint32_t)RTC_ByteToBcd2(RTC_DateStruct->RTC_Year) << 16) | ((uint32_t)RTC_ByteToBcd2(RTC_DateStruct->RTC_Month) << 8) | ((uint32_t)RTC_ByteToBcd2(RTC_DateStruct->RTC_Date)) | ((uint32_t)RTC_DateStruct->RTC_WeekDay << 13));
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


 if (RTC_EnterInitMode() == ERROR)
 {
 status = ERROR;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->DR = (uint32_t)(tmpreg &  ((uint32_t)0x00FFFF3F) );


 RTC_ExitInitMode();


 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &  ((uint32_t)0x00000020) ) == RESET)
 {
 if (RTC_WaitForSynchro() == ERROR)
 {
 status = ERROR;
 }
 else
 {
 status = SUCCESS;
 }
 }
 else
 {
 status = SUCCESS;
 }
 }

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

 return status;
}
#line 1034 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
{

 RTC_DateStruct->RTC_WeekDay =  ((uint8_t)0x01) ;
 RTC_DateStruct->RTC_Date = 1;
 RTC_DateStruct->RTC_Month =  ((uint8_t)0x01) ;
 RTC_DateStruct->RTC_Year = 0;
}
#line 1053 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_GetDate(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct)
{
 uint32_t tmpreg = 0;


  ((void)0) ;


 tmpreg = (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->DR &  ((uint32_t)0x00FFFF3F) );


 RTC_DateStruct->RTC_Year = (uint8_t)((tmpreg & ( ((uint32_t)0x00F00000)  |  ((uint32_t)0x000F0000) )) >> 16);
 RTC_DateStruct->RTC_Month = (uint8_t)((tmpreg & ( ((uint32_t)0x00001000)  |  ((uint32_t)0x00000F00) )) >> 8);
 RTC_DateStruct->RTC_Date = (uint8_t)(tmpreg & ( ((uint32_t)0x00000030)  |  ((uint32_t)0x0000000F) ));
 RTC_DateStruct->RTC_WeekDay = (uint8_t)((tmpreg & ( ((uint32_t)0x0000E000) )) >> 13);


 if (RTC_Format ==  ((uint32_t)0x000000000) )
 {

 RTC_DateStruct->RTC_Year = (uint8_t)RTC_Bcd2ToByte(RTC_DateStruct->RTC_Year);
 RTC_DateStruct->RTC_Month = (uint8_t)RTC_Bcd2ToByte(RTC_DateStruct->RTC_Month);
 RTC_DateStruct->RTC_Date = (uint8_t)RTC_Bcd2ToByte(RTC_DateStruct->RTC_Date);
 }
}
#line 1113 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_SetAlarm(uint32_t RTC_Format, uint32_t RTC_Alarm, RTC_AlarmTypeDef* RTC_AlarmStruct)
{
 uint32_t tmpreg = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;

 if (RTC_Format ==  ((uint32_t)0x000000000) )
 {
 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &  ((uint32_t)0x00000040) ) != (uint32_t)RESET)
 {
  ((void)0) ;
  ((void)0) ;
 }
 else
 {
 RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = 0x00;
  ((void)0) ;
 }
  ((void)0) ;
  ((void)0) ;

 if(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel ==  ((uint32_t)0x00000000) )
 {
  ((void)0) ;
 }
 else
 {
  ((void)0) ;
 }
 }
 else
 {
 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &  ((uint32_t)0x00000040) ) != (uint32_t)RESET)
 {
 tmpreg = RTC_Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
  ((void)0) ;
  ((void)0) ;
 }
 else
 {
 RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = 0x00;
  ((void)0) ;
 }

  ((void)0) ;
  ((void)0) ;

 if(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel ==  ((uint32_t)0x00000000) )
 {
 tmpreg = RTC_Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
  ((void)0) ;
 }
 else
 {
 tmpreg = RTC_Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
  ((void)0) ;
 }
 }


 if (RTC_Format !=  ((uint32_t)0x000000000) )
 {
#line 1185 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
 tmpreg = (((uint32_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) << 16) | ((uint32_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) << 8) | ((uint32_t)RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | ((uint32_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12) << 16) | ((uint32_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) << 24) | ((uint32_t)RTC_AlarmStruct->RTC_AlarmDateWeekDaySel) | ((uint32_t)RTC_AlarmStruct->RTC_AlarmMask));
 }
 else
 {
#line 1195 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
 tmpreg = (((uint32_t)RTC_ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) << 16) | ((uint32_t)RTC_ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) << 8) | ((uint32_t)RTC_ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | ((uint32_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12) << 16) | ((uint32_t)RTC_ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay) << 24) | ((uint32_t)RTC_AlarmStruct->RTC_AlarmDateWeekDaySel) | ((uint32_t)RTC_AlarmStruct->RTC_AlarmMask));
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


 if (RTC_Alarm ==  ((uint32_t)0x00000100) )
 {
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ALRMAR = (uint32_t)tmpreg;
 }
 else
 {
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ALRMBR = (uint32_t)tmpreg;
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;
}
#line 1224 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
{

 RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 =  ((uint8_t)0x00) ;
 RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
 RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
 RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;


 RTC_AlarmStruct->RTC_AlarmDateWeekDaySel =  ((uint32_t)0x00000000) ;
 RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;


 RTC_AlarmStruct->RTC_AlarmMask =  ((uint32_t)0x00000000) ;
}
#line 1254 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_GetAlarm(uint32_t RTC_Format, uint32_t RTC_Alarm, RTC_AlarmTypeDef* RTC_AlarmStruct)
{
 uint32_t tmpreg = 0;


  ((void)0) ;
  ((void)0) ;


 if (RTC_Alarm ==  ((uint32_t)0x00000100) )
 {
 tmpreg = (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ALRMAR);
 }
 else
 {
 tmpreg = (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ALRMBR);
 }
#line 1274 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
 RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint32_t)((tmpreg & ( ((uint32_t)0x00300000)  |  ((uint32_t)0x000F0000) )) >> 16);
#line 1276 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
 RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint32_t)((tmpreg & ( ((uint32_t)0x00007000)  |  ((uint32_t)0x00000F00) )) >> 8);
#line 1278 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
 RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint32_t)(tmpreg & ( ((uint32_t)0x00000070)  |  ((uint32_t)0x0000000F) ));
 RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (uint32_t)((tmpreg &  ((uint32_t)0x00400000) ) >> 16);
 RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint32_t)((tmpreg & ( ((uint32_t)0x30000000)  |  ((uint32_t)0x0F000000) )) >> 24);
 RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (uint32_t)(tmpreg &  ((uint32_t)0x40000000) );
 RTC_AlarmStruct->RTC_AlarmMask = (uint32_t)(tmpreg &  ((uint32_t)0x80808080) );

 if (RTC_Format ==  ((uint32_t)0x000000000) )
 {
#line 1287 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
 RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = RTC_Bcd2ToByte(RTC_AlarmStruct-> RTC_AlarmTime.RTC_Hours);
#line 1289 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
 RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = RTC_Bcd2ToByte(RTC_AlarmStruct-> RTC_AlarmTime.RTC_Minutes);
#line 1291 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
 RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = RTC_Bcd2ToByte(RTC_AlarmStruct-> RTC_AlarmTime.RTC_Seconds);
 RTC_AlarmStruct->RTC_AlarmDateWeekDay = RTC_Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
 }
}
#line 1308 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_AlarmCmd(uint32_t RTC_Alarm, FunctionalState NewState)
{
  volatile  uint32_t alarmcounter = 0x00;
 uint32_t alarmstatus = 0x00;
 ErrorStatus status = ERROR;


  ((void)0) ;
  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


 if (NewState != DISABLE)
 {
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR |= (uint32_t)RTC_Alarm;

 status = SUCCESS;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= (uint32_t)~RTC_Alarm;


 do
 {
 alarmstatus =  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR & (RTC_Alarm >> 8);
 alarmcounter++;
 } while((alarmcounter !=  ((uint32_t) 0x00010000) ) && (alarmstatus == 0x00));

 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR & (RTC_Alarm >> 8)) == RESET)
 {
 status = ERROR;
 }
 else
 {
 status = SUCCESS;
 }
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

 return status;
}
#line 1402 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_AlarmSubSecondConfig(uint32_t RTC_Alarm, uint32_t RTC_AlarmSubSecondValue, uint32_t RTC_AlarmSubSecondMask)
{
 uint32_t tmpreg = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


 tmpreg = (uint32_t) (uint32_t)(RTC_AlarmSubSecondValue) | (uint32_t)(RTC_AlarmSubSecondMask);

 if (RTC_Alarm ==  ((uint32_t)0x00000100) )
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ALRMASSR = tmpreg;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ALRMBSSR = tmpreg;
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

}
#line 1443 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
uint32_t RTC_GetAlarmSubSecond(uint32_t RTC_Alarm)
{
 uint32_t tmpreg = 0;


 if (RTC_Alarm ==  ((uint32_t)0x00000100) )
 {
 tmpreg = (uint32_t)(( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ALRMASSR) &  ((uint32_t)0x00007FFF) );
 }
 else
 {
 tmpreg = (uint32_t)(( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ALRMBSSR) &  ((uint32_t)0x00007FFF) );
 }

 return (tmpreg);
}
#line 1492 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_WakeUpClockConfig(uint32_t RTC_WakeUpClock)
{

  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= (uint32_t)~ ((uint32_t)0x00000007) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR |= (uint32_t)RTC_WakeUpClock;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;
}
#line 1519 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_SetWakeUpCounter(uint32_t RTC_WakeUpCounter)
{

  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WUTR = (uint32_t)RTC_WakeUpCounter;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;
}
#line 1540 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
uint32_t RTC_GetWakeUpCounter(void)
{

 return ((uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WUTR &  ((uint32_t)0x0000FFFF) ));
}
#line 1552 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
{
  volatile  uint32_t wutcounter = 0x00;
 uint32_t wutwfstatus = 0x00;
 ErrorStatus status = ERROR;


  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;

 if (NewState != DISABLE)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR |= (uint32_t) ((uint32_t)0x00000400) ;
 status = SUCCESS;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= (uint32_t)~ ((uint32_t)0x00000400) ;

 do
 {
 wutwfstatus =  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000004) ;
 wutcounter++;
 } while((wutcounter !=  ((uint32_t) 0x00010000) ) && (wutwfstatus == 0x00));

 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000004) ) == RESET)
 {
 status = ERROR;
 }
 else
 {
 status = SUCCESS;
 }
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

 return status;
}
#line 1629 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_DayLightSavingConfig(uint32_t RTC_DayLightSaving, uint32_t RTC_StoreOperation)
{

  ((void)0) ;
  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= (uint32_t)~( ((uint32_t)0x00040000) );


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR |= (uint32_t)(RTC_DayLightSaving | RTC_StoreOperation);


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;
}
#line 1656 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
uint32_t RTC_GetStoreOperation(void)
{
 return ( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &  ((uint32_t)0x00040000) );
}
#line 1695 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_OutputConfig(uint32_t RTC_Output, uint32_t RTC_OutputPolarity)
{

  ((void)0) ;
  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= (uint32_t)~( ((uint32_t)0x00600000)  |  ((uint32_t)0x00100000) );


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR |= (uint32_t)(RTC_Output | RTC_OutputPolarity);


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;
}
#line 1749 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_CoarseCalibConfig(uint32_t RTC_CalibSign, uint32_t Value)
{
 ErrorStatus status = ERROR;


  ((void)0) ;
  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


 if (RTC_EnterInitMode() == ERROR)
 {
 status = ERROR;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CALIBR = (uint32_t)(RTC_CalibSign | Value);

 RTC_ExitInitMode();

 status = SUCCESS;
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

 return status;
}
#line 1790 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_CoarseCalibCmd(FunctionalState NewState)
{
 ErrorStatus status = ERROR;


  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


 if (RTC_EnterInitMode() == ERROR)
 {
 status = ERROR;
 }
 else
 {
 if (NewState != DISABLE)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR |= (uint32_t) ((uint32_t)0x00000080) ;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= (uint32_t)~ ((uint32_t)0x00000080) ;
 }

 RTC_ExitInitMode();

 status = SUCCESS;
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

 return status;
}
#line 1836 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_CalibOutputCmd(FunctionalState NewState)
{

  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;

 if (NewState != DISABLE)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR |= (uint32_t) ((uint32_t)0x00800000) ;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= (uint32_t)~ ((uint32_t)0x00800000) ;
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;
}
#line 1868 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_CalibOutputConfig(uint32_t RTC_CalibOutput)
{

  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= (uint32_t)~( ((uint32_t)0x00080000) );


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR |= (uint32_t)RTC_CalibOutput;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;
}
#line 1904 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_SmoothCalibConfig(uint32_t RTC_SmoothCalibPeriod,
 uint32_t RTC_SmoothCalibPlusPulses,
 uint32_t RTC_SmouthCalibMinusPulsesValue)
{
 ErrorStatus status = ERROR;
 uint32_t recalpfcount = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00010000) ) != RESET)
 {

 while ((( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00010000) ) != RESET) && (recalpfcount !=  ((uint32_t) 0x00020000) ))
 {
 recalpfcount++;
 }
 }


 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00010000) ) == RESET)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CALR = (uint32_t)((uint32_t)RTC_SmoothCalibPeriod | (uint32_t)RTC_SmoothCalibPlusPulses | (uint32_t)RTC_SmouthCalibMinusPulsesValue);

 status = SUCCESS;
 }
 else
 {
 status = ERROR;
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

 return (ErrorStatus)(status);
}
#line 1980 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_TimeStampCmd(uint32_t RTC_TimeStampEdge, FunctionalState NewState)
{
 uint32_t tmpreg = 0;


  ((void)0) ;
  ((void)0) ;


 tmpreg = (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR & (uint32_t)~( ((uint32_t)0x00000008)  |  ((uint32_t)0x00000800) ));


 if (NewState != DISABLE)
 {
 tmpreg |= (uint32_t)(RTC_TimeStampEdge |  ((uint32_t)0x00000800) );
 }
 else
 {
 tmpreg |= (uint32_t)(RTC_TimeStampEdge);
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR = (uint32_t)tmpreg;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;
}
#line 2024 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_GetTimeStamp(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_StampTimeStruct,
 RTC_DateTypeDef* RTC_StampDateStruct)
{
 uint32_t tmptime = 0, tmpdate = 0;


  ((void)0) ;


 tmptime = (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TSTR &  ((uint32_t)0x007F7F7F) );
 tmpdate = (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TSDR &  ((uint32_t)0x00FFFF3F) );


 RTC_StampTimeStruct->RTC_Hours = (uint8_t)((tmptime & ( ((uint32_t)0x00300000)  |  ((uint32_t)0x000F0000) )) >> 16);
 RTC_StampTimeStruct->RTC_Minutes = (uint8_t)((tmptime & ( ((uint32_t)0x00007000)  |  ((uint32_t)0x00000F00) )) >> 8);
 RTC_StampTimeStruct->RTC_Seconds = (uint8_t)(tmptime & ( ((uint32_t)0x00000070)  |  ((uint32_t)0x0000000F) ));
 RTC_StampTimeStruct->RTC_H12 = (uint8_t)((tmptime & ( ((uint32_t)0x00400000) )) >> 16);


 RTC_StampDateStruct->RTC_Year = 0;
 RTC_StampDateStruct->RTC_Month = (uint8_t)((tmpdate & ( ((uint32_t)0x00001000)  |  ((uint32_t)0x00000F00) )) >> 8);
 RTC_StampDateStruct->RTC_Date = (uint8_t)(tmpdate & ( ((uint32_t)0x00000030)  |  ((uint32_t)0x0000000F) ));
 RTC_StampDateStruct->RTC_WeekDay = (uint8_t)((tmpdate & ( ((uint32_t)0x0000E000) )) >> 13);


 if (RTC_Format ==  ((uint32_t)0x000000000) )
 {

 RTC_StampTimeStruct->RTC_Hours = (uint8_t)RTC_Bcd2ToByte(RTC_StampTimeStruct->RTC_Hours);
 RTC_StampTimeStruct->RTC_Minutes = (uint8_t)RTC_Bcd2ToByte(RTC_StampTimeStruct->RTC_Minutes);
 RTC_StampTimeStruct->RTC_Seconds = (uint8_t)RTC_Bcd2ToByte(RTC_StampTimeStruct->RTC_Seconds);


 RTC_StampDateStruct->RTC_Month = (uint8_t)RTC_Bcd2ToByte(RTC_StampDateStruct->RTC_Month);
 RTC_StampDateStruct->RTC_Date = (uint8_t)RTC_Bcd2ToByte(RTC_StampDateStruct->RTC_Date);
 RTC_StampDateStruct->RTC_WeekDay = (uint8_t)RTC_Bcd2ToByte(RTC_StampDateStruct->RTC_WeekDay);
 }
}
#line 2068 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
uint32_t RTC_GetTimeStampSubSecond(void)
{

 return (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TSSSR);
}
#line 2103 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_TamperTriggerConfig(uint32_t RTC_Tamper, uint32_t RTC_TamperTrigger)
{

  ((void)0) ;
  ((void)0) ;

 if (RTC_TamperTrigger ==  ((uint32_t)0x00000000) )
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR &= (uint32_t)((uint32_t)~(RTC_Tamper << 1));
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR |= (uint32_t)(RTC_Tamper << 1);
 }
}
#line 2129 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_TamperCmd(uint32_t RTC_Tamper, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR |= (uint32_t)RTC_Tamper;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR &= (uint32_t)~RTC_Tamper;
 }
}
#line 2160 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_TamperFilterConfig(uint32_t RTC_TamperFilter)
{

  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR &= (uint32_t)~( ((uint32_t)0x00001800) );


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR |= (uint32_t)RTC_TamperFilter;
}
#line 2194 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_TamperSamplingFreqConfig(uint32_t RTC_TamperSamplingFreq)
{

  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR &= (uint32_t)~( ((uint32_t)0x00000700) );


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR |= (uint32_t)RTC_TamperSamplingFreq;
}
#line 2217 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_TamperPinsPrechargeDuration(uint32_t RTC_TamperPrechargeDuration)
{

  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR &= (uint32_t)~( ((uint32_t)0x00006000) );


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR |= (uint32_t)RTC_TamperPrechargeDuration;
}
#line 2237 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_TimeStampOnTamperDetectionCmd(FunctionalState NewState)
{

  ((void)0) ;

 if (NewState != DISABLE)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR |= (uint32_t) ((uint32_t)0x00000080) ;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR &= (uint32_t)~ ((uint32_t)0x00000080) ;
 }
}
#line 2260 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_TamperPullUpCmd(FunctionalState NewState)
{

  ((void)0) ;

 if (NewState != DISABLE)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR &= (uint32_t)~ ((uint32_t)0x00008000) ;
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR |= (uint32_t) ((uint32_t)0x00008000) ;
 }
}
#line 2301 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_WriteBackupRegister(uint32_t RTC_BKP_DR, uint32_t Data)
{
  volatile  uint32_t tmp = 0;


  ((void)0) ;

 tmp =  ( ((uint32_t)0x40000000)  + 0x2800)  + 0x50;
 tmp += (RTC_BKP_DR * 4);


 *( volatile  uint32_t *)tmp = (uint32_t)Data;
}
#line 2322 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
uint32_t RTC_ReadBackupRegister(uint32_t RTC_BKP_DR)
{
  volatile  uint32_t tmp = 0;


  ((void)0) ;

 tmp =  ( ((uint32_t)0x40000000)  + 0x2800)  + 0x50;
 tmp += (RTC_BKP_DR * 4);


 return (*( volatile  uint32_t *)tmp);
}
#line 2362 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_TamperPinSelection(uint32_t RTC_TamperPin)
{

  ((void)0) ;

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR &= (uint32_t)~( ((uint32_t)0x00010000) );
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR |= (uint32_t)(RTC_TamperPin);
}
#line 2379 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_TimeStampPinSelection(uint32_t RTC_TimeStampPin)
{

  ((void)0) ;

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR &= (uint32_t)~( ((uint32_t)0x00020000) );
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR |= (uint32_t)(RTC_TimeStampPin);
}
#line 2398 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_OutputTypeConfig(uint32_t RTC_OutputType)
{

  ((void)0) ;

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR &= (uint32_t)~( ((uint32_t)0x00040000) );
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR |= (uint32_t)(RTC_OutputType);
}
#line 2436 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ErrorStatus RTC_SynchroShiftConfig(uint32_t RTC_ShiftAdd1S, uint32_t RTC_ShiftSubFS)
{
 ErrorStatus status = ERROR;
 uint32_t shpfcount = 0;


  ((void)0) ;
  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;


 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000008) ) != RESET)
 {

 while ((( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000008) ) != RESET) && (shpfcount !=  ((uint32_t) 0x00001000) ))
 {
 shpfcount++;
 }
 }


 if (( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000008) ) == RESET)
 {

 if(( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &  ((uint32_t)0x00000010) ) == RESET)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->SHIFTR = (uint32_t)(uint32_t)(RTC_ShiftSubFS) | (uint32_t)(RTC_ShiftAdd1S);

 if(RTC_WaitForSynchro() == ERROR)
 {
 status = ERROR;
 }
 else
 {
 status = SUCCESS;
 }
 }
 else
 {
 status = ERROR;
 }
 }
 else
 {
 status = ERROR;
 }


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;

 return (ErrorStatus)(status);
}
#line 2555 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_ITConfig(uint32_t RTC_IT, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xCA;
  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0x53;

 if (NewState != DISABLE)
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR |= (uint32_t)(RTC_IT & ~ ((uint32_t)0x00000004) );

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR |= (uint32_t)(RTC_IT &  ((uint32_t)0x00000004) );
 }
 else
 {

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR &= (uint32_t)~(RTC_IT & (uint32_t)~ ((uint32_t)0x00000004) );

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR &= (uint32_t)~(RTC_IT &  ((uint32_t)0x00000004) );
 }

  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->WPR = 0xFF;
}
#line 2603 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
FlagStatus RTC_GetFlagStatus(uint32_t RTC_FLAG)
{
 FlagStatus bitstatus = RESET;
 uint32_t tmpreg = 0;


  ((void)0) ;


 tmpreg = (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)( ((uint32_t)0x00001000)  | ((uint32_t)0x00000800)  | ((uint32_t)0x00000400)  | ((uint32_t)0x00000200)  | ((uint32_t)0x00000100)  | ((uint32_t)0x00000040)  | ((uint32_t)0x00000020)  | ((uint32_t)0x00000010)  | ((uint32_t)0x00000004)  | ((uint32_t)0x00000002)  | ((uint32_t)0x00000001)  | ((uint32_t)0x00002000)  | ((uint32_t)0x00010000)  | ((uint32_t)0x00000008) )) );


 if ((tmpreg & RTC_FLAG) != (uint32_t)RESET)
 {
 bitstatus = SET;
 }
 else
 {
 bitstatus = RESET;
 }
 return bitstatus;
}
#line 2639 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_ClearFlag(uint32_t RTC_FLAG)
{

  ((void)0) ;


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR = (uint32_t)((uint32_t)(~((RTC_FLAG |  ((uint32_t)0x00000080) )& 0x0000FFFF) | (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000080) )));
}
#line 2659 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
ITStatus RTC_GetITStatus(uint32_t RTC_IT)
{
 ITStatus bitstatus = RESET;
 uint32_t tmpreg = 0, enablestatus = 0;


  ((void)0) ;


 tmpreg = (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->TAFCR & ( ((uint32_t)0x00000004) ));


 enablestatus = (uint32_t)(( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->CR & RTC_IT) | (tmpreg & (RTC_IT >> 15)));


 tmpreg = (uint32_t)(( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR & (uint32_t)(RTC_IT >> 4)));


 if ((enablestatus != (uint32_t)RESET) && ((tmpreg & 0x0000FFFF) != (uint32_t)RESET))
 {
 bitstatus = SET;
 }
 else
 {
 bitstatus = RESET;
 }
 return bitstatus;
}
#line 2699 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
void RTC_ClearITPendingBit(uint32_t RTC_IT)
{
 uint32_t tmpreg = 0;


  ((void)0) ;


 tmpreg = (uint32_t)(RTC_IT >> 4);


  ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR = (uint32_t)((uint32_t)(~((tmpreg |  ((uint32_t)0x00000080) )& 0x0000FFFF) | (uint32_t)( ((RTC_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2800) ) ->ISR &  ((uint32_t)0x00000080) )));
}
#line 2722 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
static uint8_t RTC_ByteToBcd2(uint8_t Value)
{
 uint8_t bcdhigh = 0;

 while (Value >= 10)
 {
 bcdhigh++;
 Value -= 10;
 }

 return ((uint8_t)(bcdhigh << 4) | Value);
}
#line 2740 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_rtc.c"
static uint8_t RTC_Bcd2ToByte(uint8_t Value)
{
 uint8_t tmp = 0;
 tmp = ((uint8_t)(Value & (uint8_t)0xF0) >> (uint8_t)0x4) * 10;
 return (tmp + (Value & (uint8_t)0x0F));
}
