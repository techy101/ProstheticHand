#line 1 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
#line 1 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
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
#line 55 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
typedef struct
{
#line 58 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_Prescaler;
#line 61 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_CounterMode;
#line 65 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint32_t TIM_Period;
#line 68 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_ClockDivision;
#line 77 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint8_t TIM_RepetitionCounter;
} TIM_TimeBaseInitTypeDef;
#line 84 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
typedef struct
{
#line 87 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_OCMode;
#line 90 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_OutputState;
#line 94 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_OutputNState;
#line 97 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint32_t TIM_Pulse;
#line 100 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_OCPolarity;
#line 104 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_OCNPolarity;
#line 108 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_OCIdleState;
#line 112 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_OCNIdleState;
} TIM_OCInitTypeDef;
#line 119 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
typedef struct
{
#line 123 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_Channel;
#line 126 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_ICPolarity;
#line 129 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_ICSelection;
#line 132 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_ICPrescaler;
#line 135 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_ICFilter;
} TIM_ICInitTypeDef;
#line 143 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
typedef struct
{
#line 147 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_OSSRState;
#line 150 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_OSSIState;
#line 153 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_LOCKLevel;
#line 157 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_DeadTime;
#line 160 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_Break;
#line 163 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_BreakPolarity;
#line 166 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
 uint16_t TIM_AutomaticOutput;
} TIM_BDTRInitTypeDef;
#line 1026 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_tim.h"
void TIM_DeInit(TIM_TypeDef* TIMx);
void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct);
void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct);
void TIM_PrescalerConfig(TIM_TypeDef* TIMx, uint16_t Prescaler, uint16_t TIM_PSCReloadMode);
void TIM_CounterModeConfig(TIM_TypeDef* TIMx, uint16_t TIM_CounterMode);
void TIM_SetCounter(TIM_TypeDef* TIMx, uint32_t Counter);
void TIM_SetAutoreload(TIM_TypeDef* TIMx, uint32_t Autoreload);
uint32_t TIM_GetCounter(TIM_TypeDef* TIMx);
uint16_t TIM_GetPrescaler(TIM_TypeDef* TIMx);
void TIM_UpdateDisableConfig(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_UpdateRequestConfig(TIM_TypeDef* TIMx, uint16_t TIM_UpdateSource);
void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_SelectOnePulseMode(TIM_TypeDef* TIMx, uint16_t TIM_OPMode);
void TIM_SetClockDivision(TIM_TypeDef* TIMx, uint16_t TIM_CKD);
void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState);


void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC3Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC4Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_SelectOCxM(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode);
void TIM_SetCompare1(TIM_TypeDef* TIMx, uint32_t Compare1);
void TIM_SetCompare2(TIM_TypeDef* TIMx, uint32_t Compare2);
void TIM_SetCompare3(TIM_TypeDef* TIMx, uint32_t Compare3);
void TIM_SetCompare4(TIM_TypeDef* TIMx, uint32_t Compare4);
void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ForcedOC3Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ForcedOC4Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC3PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC4PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC1FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_OC2FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_OC3FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_OC4FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_ClearOC3Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity);
void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_OC2NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity);
void TIM_OC3PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity);
void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_CCxCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCx);
void TIM_CCxNCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCxN);


void TIM_ICInit(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct);
void TIM_ICStructInit(TIM_ICInitTypeDef* TIM_ICInitStruct);
void TIM_PWMIConfig(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct);
uint32_t TIM_GetCapture1(TIM_TypeDef* TIMx);
uint32_t TIM_GetCapture2(TIM_TypeDef* TIMx);
uint32_t TIM_GetCapture3(TIM_TypeDef* TIMx);
uint32_t TIM_GetCapture4(TIM_TypeDef* TIMx);
void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetIC3Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);


void TIM_BDTRConfig(TIM_TypeDef* TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct);
void TIM_BDTRStructInit(TIM_BDTRInitTypeDef* TIM_BDTRInitStruct);
void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_CCPreloadControl(TIM_TypeDef* TIMx, FunctionalState NewState);


void TIM_ITConfig(TIM_TypeDef* TIMx, uint16_t TIM_IT, FunctionalState NewState);
void TIM_GenerateEvent(TIM_TypeDef* TIMx, uint16_t TIM_EventSource);
FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, uint16_t TIM_FLAG);
void TIM_ClearFlag(TIM_TypeDef* TIMx, uint16_t TIM_FLAG);
ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, uint16_t TIM_IT);
void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, uint16_t TIM_IT);
void TIM_DMAConfig(TIM_TypeDef* TIMx, uint16_t TIM_DMABase, uint16_t TIM_DMABurstLength);
void TIM_DMACmd(TIM_TypeDef* TIMx, uint16_t TIM_DMASource, FunctionalState NewState);
void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState);


void TIM_InternalClockConfig(TIM_TypeDef* TIMx);
void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource);
void TIM_TIxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_TIxExternalCLKSource,
 uint16_t TIM_ICPolarity, uint16_t ICFilter);
void TIM_ETRClockMode1Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
 uint16_t ExtTRGFilter);
void TIM_ETRClockMode2Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler,
 uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter);


void TIM_SelectInputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource);
void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_TRGOSource);
void TIM_SelectSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_SlaveMode);
void TIM_SelectMasterSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_MasterSlaveMode);
void TIM_ETRConfig(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
 uint16_t ExtTRGFilter);


void TIM_EncoderInterfaceConfig(TIM_TypeDef* TIMx, uint16_t TIM_EncoderMode,
 uint16_t TIM_IC1Polarity, uint16_t TIM_IC2Polarity);
void TIM_SelectHallSensor(TIM_TypeDef* TIMx, FunctionalState NewState);


void TIM_RemapConfig(TIM_TypeDef* TIMx, uint16_t TIM_Remap);
#line 1 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rcc.h"
#line 1 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx.h"
#line 48 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rcc.h"
typedef struct
{
 uint32_t SYSCLK_Frequency;
 uint32_t HCLK_Frequency;
 uint32_t PCLK1_Frequency;
 uint32_t PCLK2_Frequency;
}RCC_ClocksTypeDef;
#line 444 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_rcc.h"
void RCC_DeInit(void);


void RCC_HSEConfig(uint8_t RCC_HSE);
ErrorStatus RCC_WaitForHSEStartUp(void);
void RCC_AdjustHSICalibrationValue(uint8_t HSICalibrationValue);
void RCC_HSICmd(FunctionalState NewState);
void RCC_LSEConfig(uint8_t RCC_LSE);
void RCC_LSICmd(FunctionalState NewState);

void RCC_PLLConfig(uint32_t RCC_PLLSource, uint32_t PLLM, uint32_t PLLN, uint32_t PLLP, uint32_t PLLQ);
void RCC_PLLCmd(FunctionalState NewState);
void RCC_PLLI2SConfig(uint32_t PLLI2SN, uint32_t PLLI2SR);
void RCC_PLLI2SCmd(FunctionalState NewState);

void RCC_ClockSecuritySystemCmd(FunctionalState NewState);
void RCC_MCO1Config(uint32_t RCC_MCO1Source, uint32_t RCC_MCO1Div);
void RCC_MCO2Config(uint32_t RCC_MCO2Source, uint32_t RCC_MCO2Div);


void RCC_SYSCLKConfig(uint32_t RCC_SYSCLKSource);
uint8_t RCC_GetSYSCLKSource(void);
void RCC_HCLKConfig(uint32_t RCC_SYSCLK);
void RCC_PCLK1Config(uint32_t RCC_HCLK);
void RCC_PCLK2Config(uint32_t RCC_HCLK);
void RCC_GetClocksFreq(RCC_ClocksTypeDef* RCC_Clocks);


void RCC_RTCCLKConfig(uint32_t RCC_RTCCLKSource);
void RCC_RTCCLKCmd(FunctionalState NewState);
void RCC_BackupResetCmd(FunctionalState NewState);
void RCC_I2SCLKConfig(uint32_t RCC_I2SCLKSource);

void RCC_AHB1PeriphClockCmd(uint32_t RCC_AHB1Periph, FunctionalState NewState);
void RCC_AHB2PeriphClockCmd(uint32_t RCC_AHB2Periph, FunctionalState NewState);
void RCC_AHB3PeriphClockCmd(uint32_t RCC_AHB3Periph, FunctionalState NewState);
void RCC_APB1PeriphClockCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);
void RCC_APB2PeriphClockCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);

void RCC_AHB1PeriphResetCmd(uint32_t RCC_AHB1Periph, FunctionalState NewState);
void RCC_AHB2PeriphResetCmd(uint32_t RCC_AHB2Periph, FunctionalState NewState);
void RCC_AHB3PeriphResetCmd(uint32_t RCC_AHB3Periph, FunctionalState NewState);
void RCC_APB1PeriphResetCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);
void RCC_APB2PeriphResetCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);

void RCC_AHB1PeriphClockLPModeCmd(uint32_t RCC_AHB1Periph, FunctionalState NewState);
void RCC_AHB2PeriphClockLPModeCmd(uint32_t RCC_AHB2Periph, FunctionalState NewState);
void RCC_AHB3PeriphClockLPModeCmd(uint32_t RCC_AHB3Periph, FunctionalState NewState);
void RCC_APB1PeriphClockLPModeCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);
void RCC_APB2PeriphClockLPModeCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);


void RCC_ITConfig(uint8_t RCC_IT, FunctionalState NewState);
FlagStatus RCC_GetFlagStatus(uint8_t RCC_FLAG);
void RCC_ClearFlag(void);
ITStatus RCC_GetITStatus(uint8_t RCC_IT);
void RCC_ClearITPendingBit(uint8_t RCC_IT);
#line 146 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
static void TI1_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
 uint16_t TIM_ICFilter);
static void TI2_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
 uint16_t TIM_ICFilter);
static void TI3_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
 uint16_t TIM_ICFilter);
static void TI4_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
 uint16_t TIM_ICFilter);
#line 200 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_DeInit(TIM_TypeDef* TIMx)
{

  ((void)0) ;

 if (TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0000) ) )
 {
 RCC_APB2PeriphResetCmd( ((uint32_t)0x00000001) , ENABLE);
 RCC_APB2PeriphResetCmd( ((uint32_t)0x00000001) , DISABLE);
 }
 else if (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x0000) ) )
 {
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000001) , ENABLE);
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000001) , DISABLE);
 }
 else if (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x0400) ) )
 {
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000002) , ENABLE);
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000002) , DISABLE);
 }
 else if (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x0800) ) )
 {
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000004) , ENABLE);
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000004) , DISABLE);
 }
 else if (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x0C00) ) )
 {
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000008) , ENABLE);
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000008) , DISABLE);
 }
 else if (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x1000) ) )
 {
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000010) , ENABLE);
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000010) , DISABLE);
 }
 else if (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x1400) ) )
 {
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000020) , ENABLE);
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000020) , DISABLE);
 }
 else if (TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0400) ) )
 {
 RCC_APB2PeriphResetCmd( ((uint32_t)0x00000002) , ENABLE);
 RCC_APB2PeriphResetCmd( ((uint32_t)0x00000002) , DISABLE);
 }
 else if (TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x4000) ) )
 {
 RCC_APB2PeriphResetCmd( ((uint32_t)0x00010000) , ENABLE);
 RCC_APB2PeriphResetCmd( ((uint32_t)0x00010000) , DISABLE);
 }
 else if (TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x4400) ) )
 {
 RCC_APB2PeriphResetCmd( ((uint32_t)0x00020000) , ENABLE);
 RCC_APB2PeriphResetCmd( ((uint32_t)0x00020000) , DISABLE);
 }
 else if (TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x4800) ) )
 {
 RCC_APB2PeriphResetCmd( ((uint32_t)0x00040000) , ENABLE);
 RCC_APB2PeriphResetCmd( ((uint32_t)0x00040000) , DISABLE);
 }
 else if (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x1800) ) )
 {
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000040) , ENABLE);
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000040) , DISABLE);
 }
 else if (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x1C00) ) )
 {
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000080) , ENABLE);
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000080) , DISABLE);
 }
 else
 {
 if (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x2000) ) )
 {
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000100) , ENABLE);
 RCC_APB1PeriphResetCmd( ((uint32_t)0x00000100) , DISABLE);
 }
 }
}
#line 288 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
{
 uint16_t tmpcr1 = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;

 tmpcr1 = TIMx->CR1;

 if((TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0000) ) ) || (TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0400) ) )||
 (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x0000) ) ) || (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x0400) ) )||
 (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x0800) ) ) || (TIMx ==  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x0C00) ) ))
 {

 tmpcr1 &= (uint16_t)(~( ((uint16_t)0x0010)  |  ((uint16_t)0x0060) ));
 tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_CounterMode;
 }

 if((TIMx !=  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x1000) ) ) && (TIMx !=  ((TIM_TypeDef *) ( ((uint32_t)0x40000000)  + 0x1400) ) ))
 {

 tmpcr1 &= (uint16_t)(~ ((uint16_t)0x0300) );
 tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_ClockDivision;
 }

 TIMx->CR1 = tmpcr1;


 TIMx->ARR = TIM_TimeBaseInitStruct->TIM_Period ;


 TIMx->PSC = TIM_TimeBaseInitStruct->TIM_Prescaler;

 if ((TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0000) ) ) || (TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0400) ) ))
 {

 TIMx->RCR = TIM_TimeBaseInitStruct->TIM_RepetitionCounter;
 }
#line 331 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
 TIMx->EGR =  ((uint16_t)0x0001) ;
}
#line 340 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
{

 TIM_TimeBaseInitStruct->TIM_Period = 0xFFFFFFFF;
 TIM_TimeBaseInitStruct->TIM_Prescaler = 0x0000;
 TIM_TimeBaseInitStruct->TIM_ClockDivision =  ((uint16_t)0x0000) ;
 TIM_TimeBaseInitStruct->TIM_CounterMode =  ((uint16_t)0x0000) ;
 TIM_TimeBaseInitStruct->TIM_RepetitionCounter = 0x0000;
}
#line 360 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_PrescalerConfig(TIM_TypeDef* TIMx, uint16_t Prescaler, uint16_t TIM_PSCReloadMode)
{

  ((void)0) ;
  ((void)0) ;

 TIMx->PSC = Prescaler;

 TIMx->EGR = TIM_PSCReloadMode;
}
#line 383 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_CounterModeConfig(TIM_TypeDef* TIMx, uint16_t TIM_CounterMode)
{
 uint16_t tmpcr1 = 0;


  ((void)0) ;
  ((void)0) ;

 tmpcr1 = TIMx->CR1;


 tmpcr1 &= (uint16_t)~( ((uint16_t)0x0010)  |  ((uint16_t)0x0060) );


 tmpcr1 |= TIM_CounterMode;


 TIMx->CR1 = tmpcr1;
}
#line 409 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SetCounter(TIM_TypeDef* TIMx, uint32_t Counter)
{

  ((void)0) ;


 TIMx->CNT = Counter;
}
#line 424 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SetAutoreload(TIM_TypeDef* TIMx, uint32_t Autoreload)
{

  ((void)0) ;


 TIMx->ARR = Autoreload;
}
#line 438 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
uint32_t TIM_GetCounter(TIM_TypeDef* TIMx)
{

  ((void)0) ;


 return TIMx->CNT;
}
#line 452 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
uint16_t TIM_GetPrescaler(TIM_TypeDef* TIMx)
{

  ((void)0) ;


 return TIMx->PSC;
}
#line 468 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_UpdateDisableConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

 TIMx->CR1 |=  ((uint16_t)0x0002) ;
 }
 else
 {

 TIMx->CR1 &= (uint16_t)~ ((uint16_t)0x0002) ;
 }
}
#line 497 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_UpdateRequestConfig(TIM_TypeDef* TIMx, uint16_t TIM_UpdateSource)
{

  ((void)0) ;
  ((void)0) ;

 if (TIM_UpdateSource !=  ((uint16_t)0x0000) )
 {

 TIMx->CR1 |=  ((uint16_t)0x0004) ;
 }
 else
 {

 TIMx->CR1 &= (uint16_t)~ ((uint16_t)0x0004) ;
 }
}
#line 522 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

 TIMx->CR1 |=  ((uint16_t)0x0080) ;
 }
 else
 {

 TIMx->CR1 &= (uint16_t)~ ((uint16_t)0x0080) ;
 }
}
#line 549 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SelectOnePulseMode(TIM_TypeDef* TIMx, uint16_t TIM_OPMode)
{

  ((void)0) ;
  ((void)0) ;


 TIMx->CR1 &= (uint16_t)~ ((uint16_t)0x0008) ;


 TIMx->CR1 |= TIM_OPMode;
}
#line 572 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SetClockDivision(TIM_TypeDef* TIMx, uint16_t TIM_CKD)
{

  ((void)0) ;
  ((void)0) ;


 TIMx->CR1 &= (uint16_t)(~ ((uint16_t)0x0300) );


 TIMx->CR1 |= TIM_CKD;
}
#line 592 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

 TIMx->CR1 |=  ((uint16_t)0x0001) ;
 }
 else
 {

 TIMx->CR1 &= (uint16_t)~ ((uint16_t)0x0001) ;
 }
}
#line 671 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
 uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 TIMx->CCER &= (uint16_t)~ ((uint16_t)0x0001) ;


 tmpccer = TIMx->CCER;

 tmpcr2 = TIMx->CR2;


 tmpccmrx = TIMx->CCMR1;


 tmpccmrx &= (uint16_t)~ ((uint16_t)0x0070) ;
 tmpccmrx &= (uint16_t)~ ((uint16_t)0x0003) ;

 tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;


 tmpccer &= (uint16_t)~ ((uint16_t)0x0002) ;

 tmpccer |= TIM_OCInitStruct->TIM_OCPolarity;


 tmpccer |= TIM_OCInitStruct->TIM_OutputState;

 if((TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0000) ) ) || (TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0400) ) ))
 {
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 tmpccer &= (uint16_t)~ ((uint16_t)0x0008) ;

 tmpccer |= TIM_OCInitStruct->TIM_OCNPolarity;

 tmpccer &= (uint16_t)~ ((uint16_t)0x0004) ;


 tmpccer |= TIM_OCInitStruct->TIM_OutputNState;

 tmpcr2 &= (uint16_t)~ ((uint16_t)0x0100) ;
 tmpcr2 &= (uint16_t)~ ((uint16_t)0x0200) ;

 tmpcr2 |= TIM_OCInitStruct->TIM_OCIdleState;

 tmpcr2 |= TIM_OCInitStruct->TIM_OCNIdleState;
 }

 TIMx->CR2 = tmpcr2;


 TIMx->CCMR1 = tmpccmrx;


 TIMx->CCR1 = TIM_OCInitStruct->TIM_Pulse;


 TIMx->CCER = tmpccer;
}
#line 752 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
 uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 TIMx->CCER &= (uint16_t)~ ((uint16_t)0x0010) ;


 tmpccer = TIMx->CCER;

 tmpcr2 = TIMx->CR2;


 tmpccmrx = TIMx->CCMR1;


 tmpccmrx &= (uint16_t)~ ((uint16_t)0x7000) ;
 tmpccmrx &= (uint16_t)~ ((uint16_t)0x0300) ;


 tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);


 tmpccer &= (uint16_t)~ ((uint16_t)0x0020) ;

 tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 4);


 tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 4);

 if((TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0000) ) ) || (TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0400) ) ))
 {
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 tmpccer &= (uint16_t)~ ((uint16_t)0x0080) ;

 tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 4);

 tmpccer &= (uint16_t)~ ((uint16_t)0x0040) ;


 tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 4);

 tmpcr2 &= (uint16_t)~ ((uint16_t)0x0400) ;
 tmpcr2 &= (uint16_t)~ ((uint16_t)0x0800) ;

 tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 2);

 tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 2);
 }

 TIMx->CR2 = tmpcr2;


 TIMx->CCMR1 = tmpccmrx;


 TIMx->CCR2 = TIM_OCInitStruct->TIM_Pulse;


 TIMx->CCER = tmpccer;
}
#line 833 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC3Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
 uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 TIMx->CCER &= (uint16_t)~ ((uint16_t)0x0100) ;


 tmpccer = TIMx->CCER;

 tmpcr2 = TIMx->CR2;


 tmpccmrx = TIMx->CCMR2;


 tmpccmrx &= (uint16_t)~ ((uint16_t)0x0070) ;
 tmpccmrx &= (uint16_t)~ ((uint16_t)0x0003) ;

 tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;


 tmpccer &= (uint16_t)~ ((uint16_t)0x0200) ;

 tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 8);


 tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 8);

 if((TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0000) ) ) || (TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0400) ) ))
 {
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 tmpccer &= (uint16_t)~ ((uint16_t)0x0800) ;

 tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 8);

 tmpccer &= (uint16_t)~ ((uint16_t)0x0400) ;


 tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 8);

 tmpcr2 &= (uint16_t)~ ((uint16_t)0x1000) ;
 tmpcr2 &= (uint16_t)~ ((uint16_t)0x2000) ;

 tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 4);

 tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 4);
 }

 TIMx->CR2 = tmpcr2;


 TIMx->CCMR2 = tmpccmrx;


 TIMx->CCR3 = TIM_OCInitStruct->TIM_Pulse;


 TIMx->CCER = tmpccer;
}
#line 913 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC4Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
 uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 TIMx->CCER &= (uint16_t)~ ((uint16_t)0x1000) ;


 tmpccer = TIMx->CCER;

 tmpcr2 = TIMx->CR2;


 tmpccmrx = TIMx->CCMR2;


 tmpccmrx &= (uint16_t)~ ((uint16_t)0x7000) ;
 tmpccmrx &= (uint16_t)~ ((uint16_t)0x0300) ;


 tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);


 tmpccer &= (uint16_t)~ ((uint16_t)0x2000) ;

 tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 12);


 tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 12);

 if((TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0000) ) ) || (TIMx ==  ((TIM_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x0400) ) ))
 {
  ((void)0) ;

 tmpcr2 &=(uint16_t) ~ ((uint16_t)0x4000) ;

 tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 6);
 }

 TIMx->CR2 = tmpcr2;


 TIMx->CCMR2 = tmpccmrx;


 TIMx->CCR4 = TIM_OCInitStruct->TIM_Pulse;


 TIMx->CCER = tmpccer;
}
#line 976 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct)
{

 TIM_OCInitStruct->TIM_OCMode =  ((uint16_t)0x0000) ;
 TIM_OCInitStruct->TIM_OutputState =  ((uint16_t)0x0000) ;
 TIM_OCInitStruct->TIM_OutputNState =  ((uint16_t)0x0000) ;
 TIM_OCInitStruct->TIM_Pulse = 0x00000000;
 TIM_OCInitStruct->TIM_OCPolarity =  ((uint16_t)0x0000) ;
 TIM_OCInitStruct->TIM_OCNPolarity =  ((uint16_t)0x0000) ;
 TIM_OCInitStruct->TIM_OCIdleState =  ((uint16_t)0x0000) ;
 TIM_OCInitStruct->TIM_OCNIdleState =  ((uint16_t)0x0000) ;
}
#line 1012 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SelectOCxM(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode)
{
 uint32_t tmp = 0;
 uint16_t tmp1 = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;

 tmp = (uint32_t) TIMx;
 tmp +=  ((uint16_t)0x0018) ;

 tmp1 =  ((uint16_t)0x0001)  << (uint16_t)TIM_Channel;


 TIMx->CCER &= (uint16_t) ~tmp1;

 if((TIM_Channel ==  ((uint16_t)0x0000) ) ||(TIM_Channel ==  ((uint16_t)0x0008) ))
 {
 tmp += (TIM_Channel>>1);


 *( volatile  uint32_t *) tmp &=  ((uint16_t)0xFF8F) ;


 *( volatile  uint32_t *) tmp |= TIM_OCMode;
 }
 else
 {
 tmp += (uint16_t)(TIM_Channel - (uint16_t)4)>> (uint16_t)1;


 *( volatile  uint32_t *) tmp &=  ((uint16_t)0x8FFF) ;


 *( volatile  uint32_t *) tmp |= (uint16_t)(TIM_OCMode << 8);
 }
}
#line 1058 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SetCompare1(TIM_TypeDef* TIMx, uint32_t Compare1)
{

  ((void)0) ;


 TIMx->CCR1 = Compare1;
}
#line 1074 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SetCompare2(TIM_TypeDef* TIMx, uint32_t Compare2)
{

  ((void)0) ;


 TIMx->CCR2 = Compare2;
}
#line 1089 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SetCompare3(TIM_TypeDef* TIMx, uint32_t Compare3)
{

  ((void)0) ;


 TIMx->CCR3 = Compare3;
}
#line 1104 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SetCompare4(TIM_TypeDef* TIMx, uint32_t Compare4)
{

  ((void)0) ;


 TIMx->CCR4 = Compare4;
}
#line 1122 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
 uint16_t tmpccmr1 = 0;


  ((void)0) ;
  ((void)0) ;
 tmpccmr1 = TIMx->CCMR1;


 tmpccmr1 &= (uint16_t)~ ((uint16_t)0x0070) ;


 tmpccmr1 |= TIM_ForcedAction;


 TIMx->CCMR1 = tmpccmr1;
}
#line 1151 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
 uint16_t tmpccmr1 = 0;


  ((void)0) ;
  ((void)0) ;
 tmpccmr1 = TIMx->CCMR1;


 tmpccmr1 &= (uint16_t)~ ((uint16_t)0x7000) ;


 tmpccmr1 |= (uint16_t)(TIM_ForcedAction << 8);


 TIMx->CCMR1 = tmpccmr1;
}
#line 1179 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ForcedOC3Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
 uint16_t tmpccmr2 = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccmr2 = TIMx->CCMR2;


 tmpccmr2 &= (uint16_t)~ ((uint16_t)0x0070) ;


 tmpccmr2 |= TIM_ForcedAction;


 TIMx->CCMR2 = tmpccmr2;
}
#line 1208 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ForcedOC4Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
 uint16_t tmpccmr2 = 0;


  ((void)0) ;
  ((void)0) ;
 tmpccmr2 = TIMx->CCMR2;


 tmpccmr2 &= (uint16_t)~ ((uint16_t)0x7000) ;


 tmpccmr2 |= (uint16_t)(TIM_ForcedAction << 8);


 TIMx->CCMR2 = tmpccmr2;
}
#line 1236 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
 uint16_t tmpccmr1 = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccmr1 = TIMx->CCMR1;


 tmpccmr1 &= (uint16_t)(~ ((uint16_t)0x0008) );


 tmpccmr1 |= TIM_OCPreload;


 TIMx->CCMR1 = tmpccmr1;
}
#line 1266 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
 uint16_t tmpccmr1 = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccmr1 = TIMx->CCMR1;


 tmpccmr1 &= (uint16_t)(~ ((uint16_t)0x0800) );


 tmpccmr1 |= (uint16_t)(TIM_OCPreload << 8);


 TIMx->CCMR1 = tmpccmr1;
}
#line 1295 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC3PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
 uint16_t tmpccmr2 = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccmr2 = TIMx->CCMR2;


 tmpccmr2 &= (uint16_t)(~ ((uint16_t)0x0008) );


 tmpccmr2 |= TIM_OCPreload;


 TIMx->CCMR2 = tmpccmr2;
}
#line 1324 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC4PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
 uint16_t tmpccmr2 = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccmr2 = TIMx->CCMR2;


 tmpccmr2 &= (uint16_t)(~ ((uint16_t)0x0800) );


 tmpccmr2 |= (uint16_t)(TIM_OCPreload << 8);


 TIMx->CCMR2 = tmpccmr2;
}
#line 1353 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC1FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
 uint16_t tmpccmr1 = 0;


  ((void)0) ;
  ((void)0) ;


 tmpccmr1 = TIMx->CCMR1;


 tmpccmr1 &= (uint16_t)~ ((uint16_t)0x0004) ;


 tmpccmr1 |= TIM_OCFast;


 TIMx->CCMR1 = tmpccmr1;
}
#line 1384 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC2FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
 uint16_t tmpccmr1 = 0;


  ((void)0) ;
  ((void)0) ;


 tmpccmr1 = TIMx->CCMR1;


 tmpccmr1 &= (uint16_t)(~ ((uint16_t)0x0400) );


 tmpccmr1 |= (uint16_t)(TIM_OCFast << 8);


 TIMx->CCMR1 = tmpccmr1;
}
#line 1414 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC3FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
 uint16_t tmpccmr2 = 0;


  ((void)0) ;
  ((void)0) ;


 tmpccmr2 = TIMx->CCMR2;


 tmpccmr2 &= (uint16_t)~ ((uint16_t)0x0004) ;


 tmpccmr2 |= TIM_OCFast;


 TIMx->CCMR2 = tmpccmr2;
}
#line 1444 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC4FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
 uint16_t tmpccmr2 = 0;


  ((void)0) ;
  ((void)0) ;


 tmpccmr2 = TIMx->CCMR2;


 tmpccmr2 &= (uint16_t)(~ ((uint16_t)0x0400) );


 tmpccmr2 |= (uint16_t)(TIM_OCFast << 8);


 TIMx->CCMR2 = tmpccmr2;
}
#line 1474 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
 uint16_t tmpccmr1 = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccmr1 = TIMx->CCMR1;


 tmpccmr1 &= (uint16_t)~ ((uint16_t)0x0080) ;


 tmpccmr1 |= TIM_OCClear;


 TIMx->CCMR1 = tmpccmr1;
}
#line 1504 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
 uint16_t tmpccmr1 = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccmr1 = TIMx->CCMR1;


 tmpccmr1 &= (uint16_t)~ ((uint16_t)0x8000) ;


 tmpccmr1 |= (uint16_t)(TIM_OCClear << 8);


 TIMx->CCMR1 = tmpccmr1;
}
#line 1533 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ClearOC3Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
 uint16_t tmpccmr2 = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccmr2 = TIMx->CCMR2;


 tmpccmr2 &= (uint16_t)~ ((uint16_t)0x0080) ;


 tmpccmr2 |= TIM_OCClear;


 TIMx->CCMR2 = tmpccmr2;
}
#line 1562 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
 uint16_t tmpccmr2 = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccmr2 = TIMx->CCMR2;


 tmpccmr2 &= (uint16_t)~ ((uint16_t)0x8000) ;


 tmpccmr2 |= (uint16_t)(TIM_OCClear << 8);


 TIMx->CCMR2 = tmpccmr2;
}
#line 1591 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
 uint16_t tmpccer = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccer = TIMx->CCER;


 tmpccer &= (uint16_t)(~ ((uint16_t)0x0002) );
 tmpccer |= TIM_OCPolarity;


 TIMx->CCER = tmpccer;
}
#line 1618 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
{
 uint16_t tmpccer = 0;

  ((void)0) ;
  ((void)0) ;

 tmpccer = TIMx->CCER;


 tmpccer &= (uint16_t)~ ((uint16_t)0x0008) ;
 tmpccer |= TIM_OCNPolarity;


 TIMx->CCER = tmpccer;
}
#line 1645 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
 uint16_t tmpccer = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccer = TIMx->CCER;


 tmpccer &= (uint16_t)(~ ((uint16_t)0x0020) );
 tmpccer |= (uint16_t)(TIM_OCPolarity << 4);


 TIMx->CCER = tmpccer;
}
#line 1672 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC2NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
{
 uint16_t tmpccer = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccer = TIMx->CCER;


 tmpccer &= (uint16_t)~ ((uint16_t)0x0080) ;
 tmpccer |= (uint16_t)(TIM_OCNPolarity << 4);


 TIMx->CCER = tmpccer;
}
#line 1699 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC3PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
 uint16_t tmpccer = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccer = TIMx->CCER;


 tmpccer &= (uint16_t)~ ((uint16_t)0x0200) ;
 tmpccer |= (uint16_t)(TIM_OCPolarity << 8);


 TIMx->CCER = tmpccer;
}
#line 1726 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
{
 uint16_t tmpccer = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccer = TIMx->CCER;


 tmpccer &= (uint16_t)~ ((uint16_t)0x0800) ;
 tmpccer |= (uint16_t)(TIM_OCNPolarity << 8);


 TIMx->CCER = tmpccer;
}
#line 1753 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
 uint16_t tmpccer = 0;


  ((void)0) ;
  ((void)0) ;

 tmpccer = TIMx->CCER;


 tmpccer &= (uint16_t)~ ((uint16_t)0x2000) ;
 tmpccer |= (uint16_t)(TIM_OCPolarity << 12);


 TIMx->CCER = tmpccer;
}
#line 1784 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_CCxCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCx)
{
 uint16_t tmp = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;

 tmp =  ((uint16_t)0x0001)  << TIM_Channel;


 TIMx->CCER &= (uint16_t)~ tmp;


 TIMx->CCER |= (uint16_t)(TIM_CCx << TIM_Channel);
}
#line 1814 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_CCxNCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCxN)
{
 uint16_t tmp = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;

 tmp =  ((uint16_t)0x0004)  << TIM_Channel;


 TIMx->CCER &= (uint16_t) ~tmp;


 TIMx->CCER |= (uint16_t)(TIM_CCxN << TIM_Channel);
}
#line 1896 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ICInit(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
{

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;

 if (TIM_ICInitStruct->TIM_Channel ==  ((uint16_t)0x0000) )
 {

 TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
 TIM_ICInitStruct->TIM_ICSelection,
 TIM_ICInitStruct->TIM_ICFilter);

 TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
 }
 else if (TIM_ICInitStruct->TIM_Channel ==  ((uint16_t)0x0004) )
 {

  ((void)0) ;
 TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
 TIM_ICInitStruct->TIM_ICSelection,
 TIM_ICInitStruct->TIM_ICFilter);

 TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
 }
 else if (TIM_ICInitStruct->TIM_Channel ==  ((uint16_t)0x0008) )
 {

  ((void)0) ;
 TI3_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
 TIM_ICInitStruct->TIM_ICSelection,
 TIM_ICInitStruct->TIM_ICFilter);

 TIM_SetIC3Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
 }
 else
 {

  ((void)0) ;
 TI4_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
 TIM_ICInitStruct->TIM_ICSelection,
 TIM_ICInitStruct->TIM_ICFilter);

 TIM_SetIC4Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
 }
}
#line 1952 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ICStructInit(TIM_ICInitTypeDef* TIM_ICInitStruct)
{

 TIM_ICInitStruct->TIM_Channel =  ((uint16_t)0x0000) ;
 TIM_ICInitStruct->TIM_ICPolarity =  ((uint16_t)0x0000) ;
 TIM_ICInitStruct->TIM_ICSelection =  ((uint16_t)0x0001) ;
 TIM_ICInitStruct->TIM_ICPrescaler =  ((uint16_t)0x0000) ;
 TIM_ICInitStruct->TIM_ICFilter = 0x00;
}
#line 1971 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_PWMIConfig(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
{
 uint16_t icoppositepolarity =  ((uint16_t)0x0000) ;
 uint16_t icoppositeselection =  ((uint16_t)0x0001) ;


  ((void)0) ;


 if (TIM_ICInitStruct->TIM_ICPolarity ==  ((uint16_t)0x0000) )
 {
 icoppositepolarity =  ((uint16_t)0x0002) ;
 }
 else
 {
 icoppositepolarity =  ((uint16_t)0x0000) ;
 }

 if (TIM_ICInitStruct->TIM_ICSelection ==  ((uint16_t)0x0001) )
 {
 icoppositeselection =  ((uint16_t)0x0002) ;
 }
 else
 {
 icoppositeselection =  ((uint16_t)0x0001) ;
 }
 if (TIM_ICInitStruct->TIM_Channel ==  ((uint16_t)0x0000) )
 {

 TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
 TIM_ICInitStruct->TIM_ICFilter);

 TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);

 TI2_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);

 TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
 }
 else
 {

 TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
 TIM_ICInitStruct->TIM_ICFilter);

 TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);

 TI1_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);

 TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
 }
}
#line 2028 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
uint32_t TIM_GetCapture1(TIM_TypeDef* TIMx)
{

  ((void)0) ;


 return TIMx->CCR1;
}
#line 2043 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
uint32_t TIM_GetCapture2(TIM_TypeDef* TIMx)
{

  ((void)0) ;


 return TIMx->CCR2;
}
#line 2057 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
uint32_t TIM_GetCapture3(TIM_TypeDef* TIMx)
{

  ((void)0) ;


 return TIMx->CCR3;
}
#line 2071 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
uint32_t TIM_GetCapture4(TIM_TypeDef* TIMx)
{

  ((void)0) ;


 return TIMx->CCR4;
}
#line 2091 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{

  ((void)0) ;
  ((void)0) ;


 TIMx->CCMR1 &= (uint16_t)~ ((uint16_t)0x000C) ;


 TIMx->CCMR1 |= TIM_ICPSC;
}
#line 2116 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{

  ((void)0) ;
  ((void)0) ;


 TIMx->CCMR1 &= (uint16_t)~ ((uint16_t)0x0C00) ;


 TIMx->CCMR1 |= (uint16_t)(TIM_ICPSC << 8);
}
#line 2140 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SetIC3Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{

  ((void)0) ;
  ((void)0) ;


 TIMx->CCMR2 &= (uint16_t)~ ((uint16_t)0x000C) ;


 TIMx->CCMR2 |= TIM_ICPSC;
}
#line 2164 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{

  ((void)0) ;
  ((void)0) ;


 TIMx->CCMR2 &= (uint16_t)~ ((uint16_t)0x0C00) ;


 TIMx->CCMR2 |= (uint16_t)(TIM_ICPSC << 8);
}
#line 2217 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_BDTRConfig(TIM_TypeDef* TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct)
{

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
#line 2230 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
 TIMx->BDTR = (uint32_t)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
 TIM_BDTRInitStruct->TIM_LOCKLevel | TIM_BDTRInitStruct->TIM_DeadTime |
 TIM_BDTRInitStruct->TIM_Break | TIM_BDTRInitStruct->TIM_BreakPolarity |
 TIM_BDTRInitStruct->TIM_AutomaticOutput;
}
#line 2242 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_BDTRStructInit(TIM_BDTRInitTypeDef* TIM_BDTRInitStruct)
{

 TIM_BDTRInitStruct->TIM_OSSRState =  ((uint16_t)0x0000) ;
 TIM_BDTRInitStruct->TIM_OSSIState =  ((uint16_t)0x0000) ;
 TIM_BDTRInitStruct->TIM_LOCKLevel =  ((uint16_t)0x0000) ;
 TIM_BDTRInitStruct->TIM_DeadTime = 0x00;
 TIM_BDTRInitStruct->TIM_Break =  ((uint16_t)0x0000) ;
 TIM_BDTRInitStruct->TIM_BreakPolarity =  ((uint16_t)0x0000) ;
 TIM_BDTRInitStruct->TIM_AutomaticOutput =  ((uint16_t)0x0000) ;
}
#line 2261 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

 TIMx->BDTR |=  ((uint16_t)0x8000) ;
 }
 else
 {

 TIMx->BDTR &= (uint16_t)~ ((uint16_t)0x8000) ;
 }
}
#line 2286 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

 TIMx->CR2 |=  ((uint16_t)0x0004) ;
 }
 else
 {

 TIMx->CR2 &= (uint16_t)~ ((uint16_t)0x0004) ;
 }
}
#line 2311 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_CCPreloadControl(TIM_TypeDef* TIMx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;
 if (NewState != DISABLE)
 {

 TIMx->CR2 |=  ((uint16_t)0x0001) ;
 }
 else
 {

 TIMx->CR2 &= (uint16_t)~ ((uint16_t)0x0001) ;
 }
}
#line 2368 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ITConfig(TIM_TypeDef* TIMx, uint16_t TIM_IT, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

 TIMx->DIER |= TIM_IT;
 }
 else
 {

 TIMx->DIER &= (uint16_t)~TIM_IT;
 }
}
#line 2406 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_GenerateEvent(TIM_TypeDef* TIMx, uint16_t TIM_EventSource)
{

  ((void)0) ;
  ((void)0) ;


 TIMx->EGR = TIM_EventSource;
}
#line 2439 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)
{
 ITStatus bitstatus = RESET;

  ((void)0) ;
  ((void)0) ;


 if ((TIMx->SR & TIM_FLAG) != (uint16_t)RESET)
 {
 bitstatus = SET;
 }
 else
 {
 bitstatus = RESET;
 }
 return bitstatus;
}
#line 2481 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ClearFlag(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)
{

  ((void)0) ;


 TIMx->SR = (uint16_t)~TIM_FLAG;
}
#line 2509 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, uint16_t TIM_IT)
{
 ITStatus bitstatus = RESET;
 uint16_t itstatus = 0x0, itenable = 0x0;

  ((void)0) ;
  ((void)0) ;

 itstatus = TIMx->SR & TIM_IT;

 itenable = TIMx->DIER & TIM_IT;
 if ((itstatus != (uint16_t)RESET) && (itenable != (uint16_t)RESET))
 {
 bitstatus = SET;
 }
 else
 {
 bitstatus = RESET;
 }
 return bitstatus;
}
#line 2550 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, uint16_t TIM_IT)
{

  ((void)0) ;


 TIMx->SR = (uint16_t)~TIM_IT;
}
#line 2587 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_DMAConfig(TIM_TypeDef* TIMx, uint16_t TIM_DMABase, uint16_t TIM_DMABurstLength)
{

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 TIMx->DCR = TIM_DMABase | TIM_DMABurstLength;
}
#line 2614 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_DMACmd(TIM_TypeDef* TIMx, uint16_t TIM_DMASource, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

 TIMx->DIER |= TIM_DMASource;
 }
 else
 {

 TIMx->DIER &= (uint16_t)~TIM_DMASource;
 }
}
#line 2640 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

 TIMx->CR2 |=  ((uint16_t)0x0008) ;
 }
 else
 {

 TIMx->CR2 &= (uint16_t)~ ((uint16_t)0x0008) ;
 }
}
#line 2679 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_InternalClockConfig(TIM_TypeDef* TIMx)
{

  ((void)0) ;


 TIMx->SMCR &= (uint16_t)~ ((uint16_t)0x0007) ;
}
#line 2700 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)
{

  ((void)0) ;
  ((void)0) ;


 TIM_SelectInputTrigger(TIMx, TIM_InputTriggerSource);


 TIMx->SMCR |=  ((uint16_t)0x0007) ;
}
#line 2730 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_TIxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_TIxExternalCLKSource,
 uint16_t TIM_ICPolarity, uint16_t ICFilter)
{

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 if (TIM_TIxExternalCLKSource ==  ((uint16_t)0x0060) )
 {
 TI2_Config(TIMx, TIM_ICPolarity,  ((uint16_t)0x0001) , ICFilter);
 }
 else
 {
 TI1_Config(TIMx, TIM_ICPolarity,  ((uint16_t)0x0001) , ICFilter);
 }

 TIM_SelectInputTrigger(TIMx, TIM_TIxExternalCLKSource);

 TIMx->SMCR |=  ((uint16_t)0x0007) ;
}
#line 2770 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ETRClockMode1Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler,
 uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)
{
 uint16_t tmpsmcr = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;

 TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);


 tmpsmcr = TIMx->SMCR;


 tmpsmcr &= (uint16_t)~ ((uint16_t)0x0007) ;


 tmpsmcr |=  ((uint16_t)0x0007) ;


 tmpsmcr &= (uint16_t)~ ((uint16_t)0x0070) ;
 tmpsmcr |=  ((uint16_t)0x0070) ;


 TIMx->SMCR = tmpsmcr;
}
#line 2817 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ETRClockMode2Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler,
 uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)
{

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);


 TIMx->SMCR |=  ((uint16_t)0x4000) ;
}
#line 2885 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SelectInputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)
{
 uint16_t tmpsmcr = 0;


  ((void)0) ;
  ((void)0) ;


 tmpsmcr = TIMx->SMCR;


 tmpsmcr &= (uint16_t)~ ((uint16_t)0x0070) ;


 tmpsmcr |= TIM_InputTriggerSource;


 TIMx->SMCR = tmpsmcr;
}
#line 2928 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_TRGOSource)
{

  ((void)0) ;
  ((void)0) ;


 TIMx->CR2 &= (uint16_t)~ ((uint16_t)0x0070) ;

 TIMx->CR2 |= TIM_TRGOSource;
}
#line 2952 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SelectSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_SlaveMode)
{

  ((void)0) ;
  ((void)0) ;


 TIMx->SMCR &= (uint16_t)~ ((uint16_t)0x0007) ;


 TIMx->SMCR |= TIM_SlaveMode;
}
#line 2975 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SelectMasterSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_MasterSlaveMode)
{

  ((void)0) ;
  ((void)0) ;


 TIMx->SMCR &= (uint16_t)~ ((uint16_t)0x0080) ;


 TIMx->SMCR |= TIM_MasterSlaveMode;
}
#line 3005 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_ETRConfig(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler,
 uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)
{
 uint16_t tmpsmcr = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;

 tmpsmcr = TIMx->SMCR;


 tmpsmcr &=  ((uint16_t)0x00FF) ;


 tmpsmcr |= (uint16_t)(TIM_ExtTRGPrescaler | (uint16_t)(TIM_ExtTRGPolarity | (uint16_t)(ExtTRGFilter << (uint16_t)8)));


 TIMx->SMCR = tmpsmcr;
}
#line 3063 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_EncoderInterfaceConfig(TIM_TypeDef* TIMx, uint16_t TIM_EncoderMode,
 uint16_t TIM_IC1Polarity, uint16_t TIM_IC2Polarity)
{
 uint16_t tmpsmcr = 0;
 uint16_t tmpccmr1 = 0;
 uint16_t tmpccer = 0;


  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 tmpsmcr = TIMx->SMCR;


 tmpccmr1 = TIMx->CCMR1;


 tmpccer = TIMx->CCER;


 tmpsmcr &= (uint16_t)~ ((uint16_t)0x0007) ;
 tmpsmcr |= TIM_EncoderMode;


 tmpccmr1 &= ((uint16_t)~ ((uint16_t)0x0003) ) & ((uint16_t)~ ((uint16_t)0x0300) );
 tmpccmr1 |=  ((uint16_t)0x0001)  |  ((uint16_t)0x0100) ;


 tmpccer &= ((uint16_t)~ ((uint16_t)0x0002) ) & ((uint16_t)~ ((uint16_t)0x0020) );
 tmpccer |= (uint16_t)(TIM_IC1Polarity | (uint16_t)(TIM_IC2Polarity << (uint16_t)4));


 TIMx->SMCR = tmpsmcr;


 TIMx->CCMR1 = tmpccmr1;


 TIMx->CCER = tmpccer;
}
#line 3115 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_SelectHallSensor(TIM_TypeDef* TIMx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

 TIMx->CR2 |=  ((uint16_t)0x0080) ;
 }
 else
 {

 TIMx->CR2 &= (uint16_t)~ ((uint16_t)0x0080) ;
 }
}
#line 3166 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
void TIM_RemapConfig(TIM_TypeDef* TIMx, uint16_t TIM_Remap)
{

  ((void)0) ;
  ((void)0) ;


 TIMx->OR = TIM_Remap;
}
#line 3197 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
static void TI1_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
 uint16_t TIM_ICFilter)
{
 uint16_t tmpccmr1 = 0, tmpccer = 0;


 TIMx->CCER &= (uint16_t)~ ((uint16_t)0x0001) ;
 tmpccmr1 = TIMx->CCMR1;
 tmpccer = TIMx->CCER;


 tmpccmr1 &= ((uint16_t)~ ((uint16_t)0x0003) ) & ((uint16_t)~ ((uint16_t)0x00F0) );
 tmpccmr1 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));


 tmpccer &= (uint16_t)~( ((uint16_t)0x0002)  |  ((uint16_t)0x0008) );
 tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t) ((uint16_t)0x0001) );


 TIMx->CCMR1 = tmpccmr1;
 TIMx->CCER = tmpccer;
}
#line 3238 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
static void TI2_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
 uint16_t TIM_ICFilter)
{
 uint16_t tmpccmr1 = 0, tmpccer = 0, tmp = 0;


 TIMx->CCER &= (uint16_t)~ ((uint16_t)0x0010) ;
 tmpccmr1 = TIMx->CCMR1;
 tmpccer = TIMx->CCER;
 tmp = (uint16_t)(TIM_ICPolarity << 4);


 tmpccmr1 &= ((uint16_t)~ ((uint16_t)0x0300) ) & ((uint16_t)~ ((uint16_t)0xF000) );
 tmpccmr1 |= (uint16_t)(TIM_ICFilter << 12);
 tmpccmr1 |= (uint16_t)(TIM_ICSelection << 8);


 tmpccer &= (uint16_t)~( ((uint16_t)0x0020)  |  ((uint16_t)0x0080) );
 tmpccer |= (uint16_t)(tmp | (uint16_t) ((uint16_t)0x0010) );


 TIMx->CCMR1 = tmpccmr1 ;
 TIMx->CCER = tmpccer;
}
#line 3280 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
static void TI3_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
 uint16_t TIM_ICFilter)
{
 uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;


 TIMx->CCER &= (uint16_t)~ ((uint16_t)0x0100) ;
 tmpccmr2 = TIMx->CCMR2;
 tmpccer = TIMx->CCER;
 tmp = (uint16_t)(TIM_ICPolarity << 8);


 tmpccmr2 &= ((uint16_t)~ ((uint16_t)0x0003) ) & ((uint16_t)~ ((uint16_t)0x00F0) );
 tmpccmr2 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));


 tmpccer &= (uint16_t)~( ((uint16_t)0x0200)  |  ((uint16_t)0x0800) );
 tmpccer |= (uint16_t)(tmp | (uint16_t) ((uint16_t)0x0100) );


 TIMx->CCMR2 = tmpccmr2;
 TIMx->CCER = tmpccer;
}
#line 3321 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_tim.c"
static void TI4_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
 uint16_t TIM_ICFilter)
{
 uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;


 TIMx->CCER &= (uint16_t)~ ((uint16_t)0x1000) ;
 tmpccmr2 = TIMx->CCMR2;
 tmpccer = TIMx->CCER;
 tmp = (uint16_t)(TIM_ICPolarity << 12);


 tmpccmr2 &= ((uint16_t)~ ((uint16_t)0x0300) ) & ((uint16_t)~ ((uint16_t)0xF000) );
 tmpccmr2 |= (uint16_t)(TIM_ICSelection << 8);
 tmpccmr2 |= (uint16_t)(TIM_ICFilter << 12);


 tmpccer &= (uint16_t)~( ((uint16_t)0x2000)  |  ((uint16_t)0x8000) );
 tmpccer |= (uint16_t)(tmp | (uint16_t) ((uint16_t)0x1000) );


 TIMx->CCMR2 = tmpccmr2;
 TIMx->CCER = tmpccer ;
}
