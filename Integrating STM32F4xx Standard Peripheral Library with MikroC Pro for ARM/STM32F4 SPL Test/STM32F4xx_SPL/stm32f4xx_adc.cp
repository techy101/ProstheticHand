#line 1 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
#line 1 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
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
#line 53 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
typedef struct
{
#line 56 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
 uint32_t ADC_Resolution;
#line 60 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
 FunctionalState ADC_ScanConvMode;
#line 63 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
 FunctionalState ADC_ContinuousConvMode;
#line 67 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
 uint32_t ADC_ExternalTrigConvEdge;
#line 71 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
 uint32_t ADC_ExternalTrigConv;
#line 74 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
 uint32_t ADC_DataAlign;
#line 78 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
 uint8_t ADC_NbrOfConversion;
}ADC_InitTypeDef;
#line 84 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
typedef struct
{
#line 88 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
 uint32_t ADC_Mode;
#line 91 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
 uint32_t ADC_Prescaler;
#line 95 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
 uint32_t ADC_DMAAccessMode;
#line 98 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
 uint32_t ADC_TwoSamplingDelay;

}ADC_CommonInitTypeDef;
#line 582 "c:/users/shawon/desktop/arm media/stm32f4 spl test/stm32f4xx_spl/stm32f4xx_adc.h"
void ADC_DeInit(void);


void ADC_Init(ADC_TypeDef* ADCx, ADC_InitTypeDef* ADC_InitStruct);
void ADC_StructInit(ADC_InitTypeDef* ADC_InitStruct);
void ADC_CommonInit(ADC_CommonInitTypeDef* ADC_CommonInitStruct);
void ADC_CommonStructInit(ADC_CommonInitTypeDef* ADC_CommonInitStruct);
void ADC_Cmd(ADC_TypeDef* ADCx, FunctionalState NewState);


void ADC_AnalogWatchdogCmd(ADC_TypeDef* ADCx, uint32_t ADC_AnalogWatchdog);
void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold,uint16_t LowThreshold);
void ADC_AnalogWatchdogSingleChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel);


void ADC_TempSensorVrefintCmd(FunctionalState NewState);
void ADC_VBATCmd(FunctionalState NewState);


void ADC_RegularChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel, uint8_t Rank, uint8_t ADC_SampleTime);
void ADC_SoftwareStartConv(ADC_TypeDef* ADCx);
FlagStatus ADC_GetSoftwareStartConvStatus(ADC_TypeDef* ADCx);
void ADC_EOCOnEachRegularChannelCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_ContinuousModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_DiscModeChannelCountConfig(ADC_TypeDef* ADCx, uint8_t Number);
void ADC_DiscModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx);
uint32_t ADC_GetMultiModeConversionValue(void);


void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_DMARequestAfterLastTransferCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_MultiModeDMARequestAfterLastTransferCmd(FunctionalState NewState);


void ADC_InjectedChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel, uint8_t Rank, uint8_t ADC_SampleTime);
void ADC_InjectedSequencerLengthConfig(ADC_TypeDef* ADCx, uint8_t Length);
void ADC_SetInjectedOffset(ADC_TypeDef* ADCx, uint8_t ADC_InjectedChannel, uint16_t Offset);
void ADC_ExternalTrigInjectedConvConfig(ADC_TypeDef* ADCx, uint32_t ADC_ExternalTrigInjecConv);
void ADC_ExternalTrigInjectedConvEdgeConfig(ADC_TypeDef* ADCx, uint32_t ADC_ExternalTrigInjecConvEdge);
void ADC_SoftwareStartInjectedConv(ADC_TypeDef* ADCx);
FlagStatus ADC_GetSoftwareStartInjectedConvCmdStatus(ADC_TypeDef* ADCx);
void ADC_AutoInjectedConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_InjectedDiscModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
uint16_t ADC_GetInjectedConversionValue(ADC_TypeDef* ADCx, uint8_t ADC_InjectedChannel);


void ADC_ITConfig(ADC_TypeDef* ADCx, uint16_t ADC_IT, FunctionalState NewState);
FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, uint8_t ADC_FLAG);
void ADC_ClearFlag(ADC_TypeDef* ADCx, uint8_t ADC_FLAG);
ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx, uint16_t ADC_IT);
void ADC_ClearITPendingBit(ADC_TypeDef* ADCx, uint16_t ADC_IT);
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
#line 212 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_DeInit(void)
{

 RCC_APB2PeriphResetCmd( ((uint32_t)0x00000100) , ENABLE);


 RCC_APB2PeriphResetCmd( ((uint32_t)0x00000100) , DISABLE);
}
#line 234 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_Init(ADC_TypeDef* ADCx, ADC_InitTypeDef* ADC_InitStruct)
{
 uint32_t tmpreg1 = 0;
 uint8_t tmpreg2 = 0;

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;



 tmpreg1 = ADCx->CR1;


 tmpreg1 &=  ((uint32_t)0xFCFFFEFF) ;
#line 259 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
 tmpreg1 |= (uint32_t)(((uint32_t)ADC_InitStruct->ADC_ScanConvMode << 8) | ADC_InitStruct->ADC_Resolution);

 ADCx->CR1 = tmpreg1;


 tmpreg1 = ADCx->CR2;


 tmpreg1 &=  ((uint32_t)0xC0FFF7FD) ;
#line 276 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
 tmpreg1 |= (uint32_t)(ADC_InitStruct->ADC_DataAlign | ADC_InitStruct->ADC_ExternalTrigConv |
#line 278 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
 ADC_InitStruct->ADC_ExternalTrigConvEdge | ((uint32_t)ADC_InitStruct->ADC_ContinuousConvMode << 1));


 ADCx->CR2 = tmpreg1;


 tmpreg1 = ADCx->SQR1;


 tmpreg1 &=  ((uint32_t)0xFF0FFFFF) ;



 tmpreg2 |= (uint8_t)(ADC_InitStruct->ADC_NbrOfConversion - (uint8_t)1);
 tmpreg1 |= ((uint32_t)tmpreg2 << 20);


 ADCx->SQR1 = tmpreg1;
}
#line 309 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_StructInit(ADC_InitTypeDef* ADC_InitStruct)
{

 ADC_InitStruct->ADC_Resolution =  ((uint32_t)0x00000000) ;


 ADC_InitStruct->ADC_ScanConvMode = DISABLE;


 ADC_InitStruct->ADC_ContinuousConvMode = DISABLE;


 ADC_InitStruct->ADC_ExternalTrigConvEdge =  ((uint32_t)0x00000000) ;


 ADC_InitStruct->ADC_ExternalTrigConv =  ((uint32_t)0x00000000) ;


 ADC_InitStruct->ADC_DataAlign =  ((uint32_t)0x00000000) ;


 ADC_InitStruct->ADC_NbrOfConversion = 1;
}
#line 340 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_CommonInit(ADC_CommonInitTypeDef* ADC_CommonInitStruct)
{
 uint32_t tmpreg1 = 0;

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 tmpreg1 =  ((ADC_Common_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x2300) ) ->CCR;


 tmpreg1 &=  ((uint32_t)0xFFFC30E0) ;
#line 361 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
 tmpreg1 |= (uint32_t)(ADC_CommonInitStruct->ADC_Mode |
 ADC_CommonInitStruct->ADC_Prescaler |
 ADC_CommonInitStruct->ADC_DMAAccessMode |
 ADC_CommonInitStruct->ADC_TwoSamplingDelay);


  ((ADC_Common_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x2300) ) ->CCR = tmpreg1;
}
#line 376 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_CommonStructInit(ADC_CommonInitTypeDef* ADC_CommonInitStruct)
{

 ADC_CommonInitStruct->ADC_Mode =  ((uint32_t)0x00000000) ;


 ADC_CommonInitStruct->ADC_Prescaler =  ((uint32_t)0x00000000) ;


 ADC_CommonInitStruct->ADC_DMAAccessMode =  ((uint32_t)0x00000000) ;


 ADC_CommonInitStruct->ADC_TwoSamplingDelay =  ((uint32_t)0x00000000) ;
}
#line 398 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_Cmd(ADC_TypeDef* ADCx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;
 if (NewState != DISABLE)
 {

 ADCx->CR2 |= (uint32_t) ((uint32_t)0x00000001) ;
 }
 else
 {

 ADCx->CR2 &= (uint32_t)(~ ((uint32_t)0x00000001) );
 }
}
#line 456 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_AnalogWatchdogCmd(ADC_TypeDef* ADCx, uint32_t ADC_AnalogWatchdog)
{
 uint32_t tmpreg = 0;

  ((void)0) ;
  ((void)0) ;


 tmpreg = ADCx->CR1;


 tmpreg &=  ((uint32_t)0xFF3FFDFF) ;


 tmpreg |= ADC_AnalogWatchdog;


 ADCx->CR1 = tmpreg;
}
#line 485 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold,
 uint16_t LowThreshold)
{

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 ADCx->HTR = HighThreshold;


 ADCx->LTR = LowThreshold;
}
#line 526 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_AnalogWatchdogSingleChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel)
{
 uint32_t tmpreg = 0;

  ((void)0) ;
  ((void)0) ;


 tmpreg = ADCx->CR1;


 tmpreg &=  ((uint32_t)0xFFFFFFE0) ;


 tmpreg |= ADC_Channel;


 ADCx->CR1 = tmpreg;
}
#line 591 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_TempSensorVrefintCmd(FunctionalState NewState)
{

  ((void)0) ;
 if (NewState != DISABLE)
 {

  ((ADC_Common_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x2300) ) ->CCR |= (uint32_t) ((uint32_t)0x00800000) ;
 }
 else
 {

  ((ADC_Common_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x2300) ) ->CCR &= (uint32_t)(~ ((uint32_t)0x00800000) );
 }
}
#line 613 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_VBATCmd(FunctionalState NewState)
{

  ((void)0) ;
 if (NewState != DISABLE)
 {

  ((ADC_Common_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x2300) ) ->CCR |= (uint32_t) ((uint32_t)0x00400000) ;
 }
 else
 {

  ((ADC_Common_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x2300) ) ->CCR &= (uint32_t)(~ ((uint32_t)0x00400000) );
 }
}
#line 714 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_RegularChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel, uint8_t Rank, uint8_t ADC_SampleTime)
{
 uint32_t tmpreg1 = 0, tmpreg2 = 0;

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 if (ADC_Channel >  ((uint8_t)0x09) )
 {

 tmpreg1 = ADCx->SMPR1;


 tmpreg2 =  ((uint32_t)0x00000007)  << (3 * (ADC_Channel - 10));


 tmpreg1 &= ~tmpreg2;


 tmpreg2 = (uint32_t)ADC_SampleTime << (3 * (ADC_Channel - 10));


 tmpreg1 |= tmpreg2;


 ADCx->SMPR1 = tmpreg1;
 }
 else
 {

 tmpreg1 = ADCx->SMPR2;


 tmpreg2 =  ((uint32_t)0x00000007)  << (3 * ADC_Channel);


 tmpreg1 &= ~tmpreg2;


 tmpreg2 = (uint32_t)ADC_SampleTime << (3 * ADC_Channel);


 tmpreg1 |= tmpreg2;


 ADCx->SMPR2 = tmpreg1;
 }

 if (Rank < 7)
 {

 tmpreg1 = ADCx->SQR3;


 tmpreg2 =  ((uint32_t)0x0000001F)  << (5 * (Rank - 1));


 tmpreg1 &= ~tmpreg2;


 tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 1));


 tmpreg1 |= tmpreg2;


 ADCx->SQR3 = tmpreg1;
 }

 else if (Rank < 13)
 {

 tmpreg1 = ADCx->SQR2;


 tmpreg2 =  ((uint32_t)0x0000001F)  << (5 * (Rank - 7));


 tmpreg1 &= ~tmpreg2;


 tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 7));


 tmpreg1 |= tmpreg2;


 ADCx->SQR2 = tmpreg1;
 }

 else
 {

 tmpreg1 = ADCx->SQR1;


 tmpreg2 =  ((uint32_t)0x0000001F)  << (5 * (Rank - 13));


 tmpreg1 &= ~tmpreg2;


 tmpreg2 = (uint32_t)ADC_Channel << (5 * (Rank - 13));


 tmpreg1 |= tmpreg2;


 ADCx->SQR1 = tmpreg1;
 }
}
#line 834 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
{

  ((void)0) ;


 ADCx->CR2 |= (uint32_t) ((uint32_t)0x40000000) ;
}
#line 848 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
FlagStatus ADC_GetSoftwareStartConvStatus(ADC_TypeDef* ADCx)
{
 FlagStatus bitstatus = RESET;

  ((void)0) ;


 if ((ADCx->CR2 &  ((uint32_t)0x00400000) ) != (uint32_t)RESET)
 {

 bitstatus = SET;
 }
 else
 {

 bitstatus = RESET;
 }


 return bitstatus;
}
#line 878 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_EOCOnEachRegularChannelCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

 ADCx->CR2 |= (uint32_t) ((uint32_t)0x00000400) ;
 }
 else
 {

 ADCx->CR2 &= (uint32_t)(~ ((uint32_t)0x00000400) );
 }
}
#line 903 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_ContinuousModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

 ADCx->CR2 |= (uint32_t) ((uint32_t)0x00000002) ;
 }
 else
 {

 ADCx->CR2 &= (uint32_t)(~ ((uint32_t)0x00000002) );
 }
}
#line 929 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_DiscModeChannelCountConfig(ADC_TypeDef* ADCx, uint8_t Number)
{
 uint32_t tmpreg1 = 0;
 uint32_t tmpreg2 = 0;


  ((void)0) ;
  ((void)0) ;


 tmpreg1 = ADCx->CR1;


 tmpreg1 &=  ((uint32_t)0xFFFF1FFF) ;


 tmpreg2 = Number - 1;
 tmpreg1 |= tmpreg2 << 13;


 ADCx->CR1 = tmpreg1;
}
#line 961 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_DiscModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;

 if (NewState != DISABLE)
 {

 ADCx->CR1 |= (uint32_t) ((uint32_t)0x00000800) ;
 }
 else
 {

 ADCx->CR1 &= (uint32_t)(~ ((uint32_t)0x00000800) );
 }
}
#line 984 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
{

  ((void)0) ;


 return (uint16_t) ADCx->DR;
}
#line 1005 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
uint32_t ADC_GetMultiModeConversionValue(void)
{

 return (*( volatile  uint32_t *)  ((uint32_t)0x40012308) );
}
#line 1054 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;
 if (NewState != DISABLE)
 {

 ADCx->CR2 |= (uint32_t) ((uint32_t)0x00000100) ;
 }
 else
 {

 ADCx->CR2 &= (uint32_t)(~ ((uint32_t)0x00000100) );
 }
}
#line 1078 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_DMARequestAfterLastTransferCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;
 if (NewState != DISABLE)
 {

 ADCx->CR2 |= (uint32_t) ((uint32_t)0x00000200) ;
 }
 else
 {

 ADCx->CR2 &= (uint32_t)(~ ((uint32_t)0x00000200) );
 }
}
#line 1105 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_MultiModeDMARequestAfterLastTransferCmd(FunctionalState NewState)
{

  ((void)0) ;
 if (NewState != DISABLE)
 {

  ((ADC_Common_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x2300) ) ->CCR |= (uint32_t) ((uint32_t)0x00002000) ;
 }
 else
 {

  ((ADC_Common_TypeDef *) ( ( ((uint32_t)0x40000000)  + 0x00010000)  + 0x2300) ) ->CCR &= (uint32_t)(~ ((uint32_t)0x00002000) );
 }
}
#line 1192 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_InjectedChannelConfig(ADC_TypeDef* ADCx, uint8_t ADC_Channel, uint8_t Rank, uint8_t ADC_SampleTime)
{
 uint32_t tmpreg1 = 0, tmpreg2 = 0, tmpreg3 = 0;

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;
  ((void)0) ;

 if (ADC_Channel >  ((uint8_t)0x09) )
 {

 tmpreg1 = ADCx->SMPR1;

 tmpreg2 =  ((uint32_t)0x00000007)  << (3*(ADC_Channel - 10));

 tmpreg1 &= ~tmpreg2;

 tmpreg2 = (uint32_t)ADC_SampleTime << (3*(ADC_Channel - 10));

 tmpreg1 |= tmpreg2;

 ADCx->SMPR1 = tmpreg1;
 }
 else
 {

 tmpreg1 = ADCx->SMPR2;

 tmpreg2 =  ((uint32_t)0x00000007)  << (3 * ADC_Channel);

 tmpreg1 &= ~tmpreg2;

 tmpreg2 = (uint32_t)ADC_SampleTime << (3 * ADC_Channel);

 tmpreg1 |= tmpreg2;

 ADCx->SMPR2 = tmpreg1;
 }


 tmpreg1 = ADCx->JSQR;

 tmpreg3 = (tmpreg1 &  ((uint32_t)0x00300000) )>> 20;

 tmpreg2 =  ((uint32_t)0x0000001F)  << (5 * (uint8_t)((Rank + 3) - (tmpreg3 + 1)));

 tmpreg1 &= ~tmpreg2;

 tmpreg2 = (uint32_t)ADC_Channel << (5 * (uint8_t)((Rank + 3) - (tmpreg3 + 1)));

 tmpreg1 |= tmpreg2;

 ADCx->JSQR = tmpreg1;
}
#line 1255 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_InjectedSequencerLengthConfig(ADC_TypeDef* ADCx, uint8_t Length)
{
 uint32_t tmpreg1 = 0;
 uint32_t tmpreg2 = 0;

  ((void)0) ;
  ((void)0) ;


 tmpreg1 = ADCx->JSQR;


 tmpreg1 &=  ((uint32_t)0xFFCFFFFF) ;


 tmpreg2 = Length - 1;
 tmpreg1 |= tmpreg2 << 20;


 ADCx->JSQR = tmpreg1;
}
#line 1290 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_SetInjectedOffset(ADC_TypeDef* ADCx, uint8_t ADC_InjectedChannel, uint16_t Offset)
{
  volatile  uint32_t tmp = 0;

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;

 tmp = (uint32_t)ADCx;
 tmp += ADC_InjectedChannel;


 *( volatile  uint32_t *) tmp = (uint32_t)Offset;
}
#line 1328 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_ExternalTrigInjectedConvConfig(ADC_TypeDef* ADCx, uint32_t ADC_ExternalTrigInjecConv)
{
 uint32_t tmpreg = 0;

  ((void)0) ;
  ((void)0) ;


 tmpreg = ADCx->CR2;


 tmpreg &=  ((uint32_t)0xFFF0FFFF) ;


 tmpreg |= ADC_ExternalTrigInjecConv;


 ADCx->CR2 = tmpreg;
}
#line 1362 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_ExternalTrigInjectedConvEdgeConfig(ADC_TypeDef* ADCx, uint32_t ADC_ExternalTrigInjecConvEdge)
{
 uint32_t tmpreg = 0;

  ((void)0) ;
  ((void)0) ;

 tmpreg = ADCx->CR2;

 tmpreg &=  ((uint32_t)0xFFCFFFFF) ;

 tmpreg |= ADC_ExternalTrigInjecConvEdge;

 ADCx->CR2 = tmpreg;
}
#line 1383 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_SoftwareStartInjectedConv(ADC_TypeDef* ADCx)
{

  ((void)0) ;

 ADCx->CR2 |= (uint32_t) ((uint32_t)0x00400000) ;
}
#line 1396 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
FlagStatus ADC_GetSoftwareStartInjectedConvCmdStatus(ADC_TypeDef* ADCx)
{
 FlagStatus bitstatus = RESET;

  ((void)0) ;


 if ((ADCx->CR2 &  ((uint32_t)0x00400000) ) != (uint32_t)RESET)
 {

 bitstatus = SET;
 }
 else
 {

 bitstatus = RESET;
 }

 return bitstatus;
}
#line 1425 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_AutoInjectedConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;
 if (NewState != DISABLE)
 {

 ADCx->CR1 |= (uint32_t) ((uint32_t)0x00000400) ;
 }
 else
 {

 ADCx->CR1 &= (uint32_t)(~ ((uint32_t)0x00000400) );
 }
}
#line 1451 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_InjectedDiscModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState)
{

  ((void)0) ;
  ((void)0) ;
 if (NewState != DISABLE)
 {

 ADCx->CR1 |= (uint32_t) ((uint32_t)0x00001000) ;
 }
 else
 {

 ADCx->CR1 &= (uint32_t)(~ ((uint32_t)0x00001000) );
 }
}
#line 1479 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
uint16_t ADC_GetInjectedConversionValue(ADC_TypeDef* ADCx, uint8_t ADC_InjectedChannel)
{
  volatile  uint32_t tmp = 0;


  ((void)0) ;
  ((void)0) ;

 tmp = (uint32_t)ADCx;
 tmp += ADC_InjectedChannel +  ((uint8_t)0x28) ;


 return (uint16_t) (*( volatile  uint32_t*) tmp);
}
#line 1587 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_ITConfig(ADC_TypeDef* ADCx, uint16_t ADC_IT, FunctionalState NewState)
{
 uint32_t itmask = 0;

  ((void)0) ;
  ((void)0) ;
  ((void)0) ;


 itmask = (uint8_t)ADC_IT;
 itmask = (uint32_t)0x01 << itmask;

 if (NewState != DISABLE)
 {

 ADCx->CR1 |= itmask;
 }
 else
 {

 ADCx->CR1 &= (~(uint32_t)itmask);
 }
}
#line 1624 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, uint8_t ADC_FLAG)
{
 FlagStatus bitstatus = RESET;

  ((void)0) ;
  ((void)0) ;


 if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
 {

 bitstatus = SET;
 }
 else
 {

 bitstatus = RESET;
 }

 return bitstatus;
}
#line 1659 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_ClearFlag(ADC_TypeDef* ADCx, uint8_t ADC_FLAG)
{

  ((void)0) ;
  ((void)0) ;


 ADCx->SR = ~(uint32_t)ADC_FLAG;
}
#line 1680 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx, uint16_t ADC_IT)
{
 ITStatus bitstatus = RESET;
 uint32_t itmask = 0, enablestatus = 0;


  ((void)0) ;
  ((void)0) ;


 itmask = ADC_IT >> 8;


 enablestatus = (ADCx->CR1 & ((uint32_t)0x01 << (uint8_t)ADC_IT)) ;


 if (((ADCx->SR & itmask) != (uint32_t)RESET) && enablestatus)
 {

 bitstatus = SET;
 }
 else
 {

 bitstatus = RESET;
 }

 return bitstatus;
}
#line 1721 "C:/Users/Shawon/Desktop/ARM Media/STM32F4 SPL Test/STM32F4xx_SPL/stm32f4xx_adc.c"
void ADC_ClearITPendingBit(ADC_TypeDef* ADCx, uint16_t ADC_IT)
{
 uint8_t itmask = 0;

  ((void)0) ;
  ((void)0) ;

 itmask = (uint8_t)(ADC_IT >> 8);

 ADCx->SR = ~(uint32_t)itmask;
}
