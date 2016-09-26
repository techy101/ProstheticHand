_main:
;main.c,57 :: 		void main() {
;main.c,59 :: 		motor_1_init();                             //Initialize hardware for motor 1
BL	_motor_1_init+0
;main.c,60 :: 		motor_1_pwm_init();                         //Initialize PWM for motor 1
BL	_motor_1_pwm_init+0
;main.c,61 :: 		interrupt_init();                           //Initialize external hardware interrupts
BL	_interrupt_init+0
;main.c,62 :: 		UART_Wired_init();
BL	_UART_Wired_init+0
;main.c,63 :: 		UART_BT_init();
BL	_UART_BT_init+0
;main.c,64 :: 		NVIC_IntEnable(IVT_INT_USART1);
MOVW	R0, #53
BL	_NVIC_IntEnable+0
;main.c,65 :: 		NVIC_IntEnable(IVT_INT_USART2);
MOVW	R0, #54
BL	_NVIC_IntEnable+0
;main.c,66 :: 		SYSCFGEN_bit = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R2, [R0, #0]
;main.c,67 :: 		SYSCFG_EXTICR1=0b0010001000000000;
MOVW	R1, #8704
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;main.c,68 :: 		EXTI_IMR = EXTI_IMR | 0b1100;
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;main.c,69 :: 		EXTI_RTSR =  0b0;
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;main.c,70 :: 		EXTI_FTSR = EXTI_RTSR | 0b1100;
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;main.c,72 :: 		RXNEIE_USART1_CR1_bit =1;
MOVW	R0, #lo_addr(RXNEIE_USART1_CR1_bit+0)
MOVT	R0, #hi_addr(RXNEIE_USART1_CR1_bit+0)
STR	R2, [R0, #0]
;main.c,73 :: 		RXNEIE_USART2_CR1_bit =1;
MOVW	R0, #lo_addr(RXNEIE_USART2_CR1_bit+0)
MOVT	R0, #hi_addr(RXNEIE_USART2_CR1_bit+0)
STR	R2, [R0, #0]
;main.c,74 :: 		TCIE_bit = 1;
MOVW	R0, #lo_addr(TCIE_bit+0)
MOVT	R0, #hi_addr(TCIE_bit+0)
STR	R2, [R0, #0]
;main.c,75 :: 		TXEIE_bit = 1;
MOVW	R0, #lo_addr(TXEIE_bit+0)
MOVT	R0, #hi_addr(TXEIE_bit+0)
STR	R2, [R0, #0]
;main.c,77 :: 		while(1) {                                  //Infinite loop
L_main0:
;main.c,78 :: 		motor_1_pwm_sweep();                 //Call motor sweep function
BL	_motor_1_pwm_sweep+0
;main.c,80 :: 		if(change_direction_flag) {            //Check if it's time to change motor direction
MOVW	R0, #lo_addr(_change_direction_flag+0)
MOVT	R0, #hi_addr(_change_direction_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main2
;main.c,81 :: 		motor_1_toggle_direction();       //Call motor direction change function
BL	_motor_1_toggle_direction+0
;main.c,82 :: 		}
L_main2:
;main.c,84 :: 		if(motor_enable_flag) {                //Check if motor enable button has been pressed
MOVW	R0, #lo_addr(_motor_enable_flag+0)
MOVT	R0, #hi_addr(_motor_enable_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main3
;main.c,85 :: 		all_motors_toggle_enable();       //Call motor enable toggle function
BL	_all_motors_toggle_enable+0
;main.c,86 :: 		}
L_main3:
;main.c,88 :: 		delay_ms(1);                           //Delay for functionality
MOVW	R7, #55998
MOVT	R7, #0
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;main.c,89 :: 		}
IT	AL
BAL	L_main0
;main.c,90 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_motor_1_init:
;main.c,98 :: 		void motor_1_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,99 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_14 | _GPIO_PINMASK_15);        //Enable digital output for enable pin (D0) and direction pin (D1)
MOVW	R1, #49152
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;main.c,100 :: 		GPIOE_ODR.B14 = 0;                                                           //Turn on motor enable (active low)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,101 :: 		GPIOE_ODR.B15 = 1;                                                           //Set initial direction
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,102 :: 		}
L_end_motor_1_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_init
_motor_1_pwm_init:
;main.c,106 :: 		void motor_1_pwm_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,107 :: 		pwm_period = PWM_TIM1_Init(pwm_frequency);                                  //Set PWM base frequency to 100Hz
MOVW	R0, #lo_addr(_pwm_frequency+0)
MOVT	R0, #hi_addr(_pwm_frequency+0)
LDRH	R0, [R0, #0]
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;main.c,108 :: 		PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);          //PWM duty cycle to "current_duty" on Timer 1, channel 1
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;main.c,109 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                  //Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;main.c,110 :: 		}
L_end_motor_1_pwm_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_pwm_init
_motor_1_pwm_sweep:
;main.c,114 :: 		void motor_1_pwm_sweep() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,115 :: 		if(current_duty < pwm_period) {                                             //Check duty cycle is < 100%
MOVW	R0, #lo_addr(_pwm_period+0)
MOVT	R0, #hi_addr(_pwm_period+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_motor_1_pwm_sweep6
;main.c,116 :: 		current_duty += 10;                                                    //Increment duty cycle by 10ms
MOVW	R1, #lo_addr(_current_duty+0)
MOVT	R1, #hi_addr(_current_duty+0)
LDRH	R0, [R1, #0]
ADDS	R0, #10
STRH	R0, [R1, #0]
;main.c,117 :: 		}
IT	AL
BAL	L_motor_1_pwm_sweep7
L_motor_1_pwm_sweep6:
;main.c,119 :: 		current_duty = 0;                                                      //Reset duty cycle to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
STRH	R1, [R0, #0]
;main.c,121 :: 		delay_ms(50);                                                          //Delay 50ms to prevent hard direction change on motor gears
MOVW	R7, #47486
MOVT	R7, #42
NOP
NOP
L_motor_1_pwm_sweep8:
SUBS	R7, R7, #1
BNE	L_motor_1_pwm_sweep8
NOP
NOP
NOP
;main.c,122 :: 		}
L_motor_1_pwm_sweep7:
;main.c,123 :: 		PWM_TIM1_Set_Duty(current_duty, _PWM_NON_INVERTED, _PWM_CHANNEL1);          //Activate new duty cycle
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;main.c,124 :: 		}
L_end_motor_1_pwm_sweep:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_pwm_sweep
_motor_1_toggle_direction:
;main.c,128 :: 		void motor_1_toggle_direction() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,130 :: 		motor1Direction = ~motor1Direction;
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,131 :: 		change_direction_flag = 0;                                                  //Disable change direction flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_change_direction_flag+0)
MOVT	R0, #hi_addr(_change_direction_flag+0)
STRH	R1, [R0, #0]
;main.c,132 :: 		UART1_Write_Text("Direction changed\n");                                    //And send data via UART
MOVW	R0, #lo_addr(?lstr1_main+0)
MOVT	R0, #hi_addr(?lstr1_main+0)
BL	_UART1_Write_Text+0
;main.c,133 :: 		UART2_Write_Text("Direction changed\n");                                    //And send data via UART
MOVW	R0, #lo_addr(?lstr2_main+0)
MOVT	R0, #hi_addr(?lstr2_main+0)
BL	_UART2_Write_Text+0
;main.c,134 :: 		}
L_end_motor_1_toggle_direction:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _motor_1_toggle_direction
_all_motors_toggle_enable:
;main.c,138 :: 		void all_motors_toggle_enable() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,139 :: 		GPIOE_ODR.B14 = ~GPIOE_ODR.B14;                                               //Toggle enable pins on ALL motor driver chips
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;main.c,140 :: 		motor_enable_flag = 0;                                                      //Reset motor enable flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_motor_enable_flag+0)
MOVT	R0, #hi_addr(_motor_enable_flag+0)
STRH	R1, [R0, #0]
;main.c,141 :: 		UART1_Write_Text("Motor Enable changed\n");                                    //And send data via UART
MOVW	R0, #lo_addr(?lstr3_main+0)
MOVT	R0, #hi_addr(?lstr3_main+0)
BL	_UART1_Write_Text+0
;main.c,142 :: 		UART2_Write_Text("Motor Enable changed\n");                                    //And send data via UART
MOVW	R0, #lo_addr(?lstr4_main+0)
MOVT	R0, #hi_addr(?lstr4_main+0)
BL	_UART2_Write_Text+0
;main.c,143 :: 		}
L_end_all_motors_toggle_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _all_motors_toggle_enable
_UART_Wired_init:
;main.c,148 :: 		void UART_Wired_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,149 :: 		UART1_Init(115200);              // Initialize UART module at 115200 bps
MOV	R0, #115200
BL	_UART1_Init+0
;main.c,150 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_UART_Wired_init10:
SUBS	R7, R7, #1
BNE	L_UART_Wired_init10
NOP
NOP
NOP
;main.c,152 :: 		UART1_Write_Text("Start FTDI Wired");
MOVW	R0, #lo_addr(?lstr5_main+0)
MOVT	R0, #hi_addr(?lstr5_main+0)
BL	_UART1_Write_Text+0
;main.c,153 :: 		UART1_Write(13);
MOVS	R0, #13
BL	_UART1_Write+0
;main.c,154 :: 		UART1_Write(10);
MOVS	R0, #10
BL	_UART1_Write+0
;main.c,155 :: 		}
L_end_UART_Wired_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UART_Wired_init
_UART_BT_init:
;main.c,157 :: 		void UART_BT_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,159 :: 		UART2_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PD56);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART2_PD56+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART2_PD56+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOV	R0, #115200
BL	_UART2_Init_Advanced+0
ADD	SP, SP, #4
;main.c,160 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_UART_BT_init12:
SUBS	R7, R7, #1
BNE	L_UART_BT_init12
NOP
NOP
NOP
;main.c,164 :: 		UART2_Write_Text("Start Bluetooth");
MOVW	R0, #lo_addr(?lstr6_main+0)
MOVT	R0, #hi_addr(?lstr6_main+0)
BL	_UART2_Write_Text+0
;main.c,165 :: 		UART2_Write(13);
MOVS	R0, #13
BL	_UART2_Write+0
;main.c,166 :: 		UART2_Write(10);
MOVS	R0, #10
BL	_UART2_Write+0
;main.c,167 :: 		}
L_end_UART_BT_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UART_BT_init
_interrupt_init:
;main.c,172 :: 		void interrupt_init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,174 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);  // Enable digital input through buttons D0 and D1
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;main.c,178 :: 		SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;main.c,179 :: 		SYSCFG_EXTICR1 = 0x00000033;         // Map external interrupt on PD0 and PD1         **Changed to 3300 from 0300 to (Ref Man p.294)
MOVS	R1, #51
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;main.c,180 :: 		EXTI_RTSR = 0x00000003;              // Set interrupt on Rising edge (PD0 and PD1)
MOVS	R1, #3
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;main.c,181 :: 		EXTI_FTSR = 0x00000000;              // Set Interrupt on Falling edge (none)
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;main.c,182 :: 		EXTI_IMR |= 0x00000003;              // Unmask bits 0 and 1 to interrupt on those lines
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;main.c,183 :: 		NVIC_IntEnable(IVT_INT_EXTI0);      //Enable external interrupt for enable pin
MOVW	R0, #22
BL	_NVIC_IntEnable+0
;main.c,184 :: 		NVIC_IntEnable(IVT_INT_EXTI1);      //Enable external interrupt for direction pin
MOVW	R0, #23
BL	_NVIC_IntEnable+0
;main.c,185 :: 		}
L_end_interrupt_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interrupt_init
_EnableInt:
;main.c,187 :: 		void EnableInt() iv IVT_INT_EXTI0 ics ICS_AUTO {
;main.c,188 :: 		EXTI_PR.B0 = 1;                     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;main.c,189 :: 		motor_enable_flag = 1;    // Toggle Direction(Pin)
MOVS	R1, #1
MOVW	R0, #lo_addr(_motor_enable_flag+0)
MOVT	R0, #hi_addr(_motor_enable_flag+0)
STRH	R1, [R0, #0]
;main.c,190 :: 		}
L_end_EnableInt:
BX	LR
; end of _EnableInt
_DirectionInt:
;main.c,192 :: 		void DirectionInt() iv IVT_INT_EXTI1 ics ICS_AUTO {
;main.c,193 :: 		EXTI_PR.B1 = 1;                     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;main.c,194 :: 		change_direction_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_change_direction_flag+0)
MOVT	R0, #hi_addr(_change_direction_flag+0)
STRH	R1, [R0, #0]
;main.c,195 :: 		}
L_end_DirectionInt:
BX	LR
; end of _DirectionInt
_USART1_INT:
;main.c,197 :: 		void USART1_INT() iv IVT_INT_USART1 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,198 :: 		if(UART1_Data_ready()) {      //If data is received from Wired UART
BL	_UART1_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_USART1_INT14
;main.c,199 :: 		uart_rd = UART1_Read();   //Read the received data
BL	_UART1_Read+0
MOVW	R1, #lo_addr(_uart_rd+0)
MOVT	R1, #hi_addr(_uart_rd+0)
STRB	R0, [R1, #0]
;main.c,201 :: 		if(uart_rd == 'd') {
UXTB	R0, R0
CMP	R0, #100
IT	NE
BNE	L_USART1_INT15
;main.c,202 :: 		change_direction_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_change_direction_flag+0)
MOVT	R0, #hi_addr(_change_direction_flag+0)
STRH	R1, [R0, #0]
;main.c,203 :: 		}
IT	AL
BAL	L_USART1_INT16
L_USART1_INT15:
;main.c,205 :: 		else if(uart_rd == 'e') {
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
LDRB	R0, [R0, #0]
CMP	R0, #101
IT	NE
BNE	L_USART1_INT17
;main.c,206 :: 		motor_enable_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_motor_enable_flag+0)
MOVT	R0, #hi_addr(_motor_enable_flag+0)
STRH	R1, [R0, #0]
;main.c,207 :: 		}
IT	AL
BAL	L_USART1_INT18
L_USART1_INT17:
;main.c,209 :: 		else if(uart_rd == 's') {
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
LDRB	R0, [R0, #0]
CMP	R0, #115
IT	NE
BNE	L_USART1_INT19
;main.c,210 :: 		if(pwm_stopped == 0) {
MOVW	R0, #lo_addr(_pwm_stopped+0)
MOVT	R0, #hi_addr(_pwm_stopped+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_USART1_INT20
;main.c,211 :: 		PWM_TIM1_Stop(_PWM_CHANNEL1);
MOVS	R0, #0
BL	_PWM_TIM1_Stop+0
;main.c,212 :: 		pwm_stopped = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pwm_stopped+0)
MOVT	R0, #hi_addr(_pwm_stopped+0)
STRH	R1, [R0, #0]
;main.c,213 :: 		UART1_Write_Text("PWM Stopped\n");                                    //And send data via UART
MOVW	R0, #lo_addr(?lstr7_main+0)
MOVT	R0, #hi_addr(?lstr7_main+0)
BL	_UART1_Write_Text+0
;main.c,214 :: 		UART2_Write_Text("PWM Stopped\n");                                    //And send data via UART
MOVW	R0, #lo_addr(?lstr8_main+0)
MOVT	R0, #hi_addr(?lstr8_main+0)
BL	_UART2_Write_Text+0
;main.c,215 :: 		}
IT	AL
BAL	L_USART1_INT21
L_USART1_INT20:
;main.c,218 :: 		motor_1_pwm_init();
BL	_motor_1_pwm_init+0
;main.c,219 :: 		pwm_stopped = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pwm_stopped+0)
MOVT	R0, #hi_addr(_pwm_stopped+0)
STRH	R1, [R0, #0]
;main.c,220 :: 		UART1_Write_Text("PWM Started\n");                                    //And send data via UART
MOVW	R0, #lo_addr(?lstr9_main+0)
MOVT	R0, #hi_addr(?lstr9_main+0)
BL	_UART1_Write_Text+0
;main.c,221 :: 		UART2_Write_Text("PWM Started\n");                                    //And send data via UART
MOVW	R0, #lo_addr(?lstr10_main+0)
MOVT	R0, #hi_addr(?lstr10_main+0)
BL	_UART2_Write_Text+0
;main.c,222 :: 		}
L_USART1_INT21:
;main.c,223 :: 		}
L_USART1_INT19:
L_USART1_INT18:
L_USART1_INT16:
;main.c,224 :: 		}
L_USART1_INT14:
;main.c,226 :: 		}
L_end_USART1_INT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART1_INT
_USART2_INT:
;main.c,228 :: 		void USART2_INT() iv IVT_INT_USART2 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,229 :: 		if (UART2_Data_Ready()) {     //If data is received from Bluetooth UART
BL	_UART2_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_USART2_INT22
;main.c,230 :: 		uart_rd = UART2_Read();  //Read the received data
BL	_UART2_Read+0
MOVW	R1, #lo_addr(_uart_rd+0)
MOVT	R1, #hi_addr(_uart_rd+0)
STRB	R0, [R1, #0]
;main.c,232 :: 		if(uart_rd == 'd') {
UXTB	R0, R0
CMP	R0, #100
IT	NE
BNE	L_USART2_INT23
;main.c,233 :: 		change_direction_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_change_direction_flag+0)
MOVT	R0, #hi_addr(_change_direction_flag+0)
STRH	R1, [R0, #0]
;main.c,234 :: 		}
IT	AL
BAL	L_USART2_INT24
L_USART2_INT23:
;main.c,236 :: 		else if(uart_rd == 'e') {
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
LDRB	R0, [R0, #0]
CMP	R0, #101
IT	NE
BNE	L_USART2_INT25
;main.c,237 :: 		motor_enable_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_motor_enable_flag+0)
MOVT	R0, #hi_addr(_motor_enable_flag+0)
STRH	R1, [R0, #0]
;main.c,238 :: 		}
IT	AL
BAL	L_USART2_INT26
L_USART2_INT25:
;main.c,240 :: 		else if(uart_rd == 's') {
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
LDRB	R0, [R0, #0]
CMP	R0, #115
IT	NE
BNE	L_USART2_INT27
;main.c,241 :: 		if(pwm_stopped == 0) {
MOVW	R0, #lo_addr(_pwm_stopped+0)
MOVT	R0, #hi_addr(_pwm_stopped+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_USART2_INT28
;main.c,242 :: 		PWM_TIM1_Stop(_PWM_CHANNEL1);
MOVS	R0, #0
BL	_PWM_TIM1_Stop+0
;main.c,243 :: 		pwm_stopped = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pwm_stopped+0)
MOVT	R0, #hi_addr(_pwm_stopped+0)
STRH	R1, [R0, #0]
;main.c,244 :: 		UART1_Write_Text("PWM Stopped\n");                                    //And send data via UART
MOVW	R0, #lo_addr(?lstr11_main+0)
MOVT	R0, #hi_addr(?lstr11_main+0)
BL	_UART1_Write_Text+0
;main.c,245 :: 		UART2_Write_Text("PWM Stopped\n");                                    //And send data via UART
MOVW	R0, #lo_addr(?lstr12_main+0)
MOVT	R0, #hi_addr(?lstr12_main+0)
BL	_UART2_Write_Text+0
;main.c,246 :: 		}
IT	AL
BAL	L_USART2_INT29
L_USART2_INT28:
;main.c,249 :: 		motor_1_pwm_init();
BL	_motor_1_pwm_init+0
;main.c,250 :: 		pwm_stopped = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pwm_stopped+0)
MOVT	R0, #hi_addr(_pwm_stopped+0)
STRH	R1, [R0, #0]
;main.c,251 :: 		UART1_Write_Text("PWM Started\n");                                    //And send data via UART
MOVW	R0, #lo_addr(?lstr13_main+0)
MOVT	R0, #hi_addr(?lstr13_main+0)
BL	_UART1_Write_Text+0
;main.c,252 :: 		UART2_Write_Text("PWM Started\n");                                    //And send data via UART
MOVW	R0, #lo_addr(?lstr14_main+0)
MOVT	R0, #hi_addr(?lstr14_main+0)
BL	_UART2_Write_Text+0
;main.c,253 :: 		}
L_USART2_INT29:
;main.c,254 :: 		}
L_USART2_INT27:
L_USART2_INT26:
L_USART2_INT24:
;main.c,255 :: 		}
L_USART2_INT22:
;main.c,256 :: 		}
L_end_USART2_INT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USART2_INT
