_main:
;Input Capture Complete 5ch.c,171 :: 		void main() {
SUB	SP, SP, #4
;Input Capture Complete 5ch.c,174 :: 		init_UART();                                                            // Configure and Initialize UART serial communications
BL	_init_UART+0
;Input Capture Complete 5ch.c,175 :: 		init_GPIO();                                                            // Configure MCU I/O
BL	_init_GPIO+0
;Input Capture Complete 5ch.c,176 :: 		init_pointer_PWM();
BL	_init_pointer_PWM+0
;Input Capture Complete 5ch.c,179 :: 		InitTimer5();                  // Timer3 init
BL	_InitTimer5+0
;Input Capture Complete 5ch.c,182 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);     // Set active ADC channels
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,183 :: 		ADC1_Init();                                                // Initialize ADC1
BL	_ADC1_Init+0
;Input Capture Complete 5ch.c,186 :: 		ADC1_LTR = low_level;        // Set AWD guard window initial lower threshold
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,187 :: 		ADC1_HTR = high_level;       // Set AWD guard window initial upper threshold
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,188 :: 		ADC1_CR2bits.CONT = 1;       // Enable ADC1 continuous conversion mode
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,189 :: 		ADC1_SQR3bits.SQ1 = 3;       // Set first channel in continuous coversion sequence to channel 3
MOVS	R2, #3
MOVW	R1, #lo_addr(ADC1_SQR3bits+0)
MOVT	R1, #hi_addr(ADC1_SQR3bits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #0, #5
STRB	R0, [R1, #0]
;Input Capture Complete 5ch.c,190 :: 		ADC1_SQR3bits.SQ2 = 4;       // Set second channel in continuous coversion sequence to channel 4 - NEW
MOVS	R2, #4
MOVW	R1, #lo_addr(ADC1_SQR3bits+0)
MOVT	R1, #hi_addr(ADC1_SQR3bits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #5, #5
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,191 :: 		ADC1_CR1bits.AWDSGL = 1;     // Enable single channel monitoring mode for AWD
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,192 :: 		ADC1_CR1 |= 3;               // Set channel 3 as the single monitored AWD channel
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,193 :: 		ADC1_CR1bits.AWDEN = 1;      // Enable Analog watchdog on regular channels
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,194 :: 		ADC1_CR2bits.SWSTART = 1;    // Start ADC1 Conversions
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,195 :: 		ADC1_CR1bits.AWDIE = 1;      // Enable analog watchdog interrupt
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,196 :: 		NVIC_IntEnable(IVT_INT_ADC); // Enable global ADC interrupt
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,199 :: 		strcpy(fngr_pointer.name, "fngr_pointer");
MOVW	R0, #lo_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,200 :: 		strcpy(fngr_middle.name, "fngr_middle");
MOVW	R0, #lo_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,201 :: 		strcpy(fngr_ring.name, "fngr_ring");
MOVW	R0, #lo_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,202 :: 		strcpy(fngr_pinky.name, "fngr_pinky");
MOVW	R0, #lo_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,203 :: 		strcpy(fngr_thumb.name, "fngr_thumb");
MOVW	R0, #lo_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,206 :: 		init_finger(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,209 :: 		UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
MOVW	R0, #lo_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,210 :: 		delay_ms(500);
MOVW	R7, #16126
MOVT	R7, #427
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;Input Capture Complete 5ch.c,213 :: 		init_timer11();                                                         // Initialize timer 11, used for sampling
BL	_init_timer11+0
;Input Capture Complete 5ch.c,214 :: 		init_input_capture();                                                   // Initialize input capture channels
BL	_init_input_capture+0
;Input Capture Complete 5ch.c,216 :: 		setP = SP_LOW;                                                             // Medium touch to begin
MOVW	R0, #lo_addr(_SP_LOW+0)
MOVT	R0, #hi_addr(_SP_LOW+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,217 :: 		change_SP_flag = 1;                                                     // Light touch next time
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_change_SP_flag+0)
MOVT	R0, #hi_addr(_change_SP_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,220 :: 		while(1) {
L_main2:
;Input Capture Complete 5ch.c,222 :: 		if (poll_flag) {                                                     // Calculate finger state values (Set by timer 3)
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;Input Capture Complete 5ch.c,223 :: 		poll_flag = 0;                                                    // Clear flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,224 :: 		sample_finger(&fngr_pointer);                                     // Call state calculation function for each finger - equivalent of sampling
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,231 :: 		if(fngr_pointer.position_actual >= FULLY_CONTRACTED) {
MOVW	R0, #lo_addr(_FULLY_CONTRACTED+0)
MOVT	R0, #hi_addr(_FULLY_CONTRACTED+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+20)
MOVT	R0, #hi_addr(_fngr_pointer+20)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L_main5
;Input Capture Complete 5ch.c,232 :: 		while(fngr_pointer.position_actual >= FULLY_EXTENDED) {
L_main6:
MOVW	R0, #lo_addr(_FULLY_EXTENDED+0)
MOVT	R0, #hi_addr(_FULLY_EXTENDED+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+20)
MOVT	R0, #hi_addr(_fngr_pointer+20)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	LT
BLT	L_main7
;Input Capture Complete 5ch.c,233 :: 		sample_finger(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,234 :: 		fngr_pointer.direction_desired = EXTEND;
MOVW	R2, #lo_addr(_EXTEND+0)
MOVT	R2, #hi_addr(_EXTEND+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,235 :: 		POINTER_DIRECTION = EXTEND;
MOV	R0, R2
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,236 :: 		}
IT	AL
BAL	L_main6
L_main7:
;Input Capture Complete 5ch.c,237 :: 		}
L_main5:
;Input Capture Complete 5ch.c,239 :: 		MPV = fngr_pointer.tip_force;                                     // Store the sampled value locally
MOVW	R2, #lo_addr(_fngr_pointer+76)
MOVT	R2, #hi_addr(_fngr_pointer+76)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,241 :: 		dutyCycle = Pcontrol_force(&fngr_pointer, setP, MPV);  // apply P control; input is finger, SP, MPV
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
UXTH	R2, R1
UXTH	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_Pcontrol_force+0
MOVW	R1, #lo_addr(_dutyCycle+0)
MOVT	R1, #hi_addr(_dutyCycle+0)
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,258 :: 		move_pointer_finger(&fngr_pointer, dutyCycle);                 // apply duty cycle
UXTH	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_move_pointer_finger+0
;Input Capture Complete 5ch.c,261 :: 		if(abs(MPV - setP) < MARGIN)
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRH	R0, [R0, #0]
SUB	R0, R0, R1
SXTH	R0, R0
BL	_abs+0
MOVW	R1, #lo_addr(_MARGIN+0)
MOVT	R1, #hi_addr(_MARGIN+0)
LDRSH	R1, [R1, #0]
CMP	R0, R1
IT	GE
BGE	L_main8
;Input Capture Complete 5ch.c,263 :: 		move_pointer_finger(&fngr_pointer, 0);                       // stop the motor
MOVS	R1, #0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_move_pointer_finger+0
;Input Capture Complete 5ch.c,265 :: 		fngr_pointer.direction_desired = EXTEND;                     // Set up to EXTEND back from setpoint to mechanical 0
MOVW	R2, #lo_addr(_EXTEND+0)
MOVT	R2, #hi_addr(_EXTEND+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,266 :: 		POINTER_DIRECTION = fngr_pointer.direction_desired;
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,268 :: 		poll_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,269 :: 		NVIC_IntDisable(IVT_INT_TIM1_TRG_COM_TIM11);                   // stop sampling with timer 11
MOVW	R0, #42
BL	_NVIC_IntDisable+0
;Input Capture Complete 5ch.c,272 :: 		UART1_Write_Text("\n\n************* PV stabilized at ");       // HOORAH
MOVW	R0, #lo_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,273 :: 		IntToStr(MPV, toStr);
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_toStr+0)
MOVT	R1, #hi_addr(_toStr+0)
BL	_IntToStr+0
;Input Capture Complete 5ch.c,274 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_toStr+0)
MOVT	R0, #hi_addr(_toStr+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,276 :: 		UART_Write_Text("\n\r***************** Setpoint was ");   // display it
MOVW	R0, #lo_addr(?lstr8_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr8_Input_32Capture_32Complete_325ch+0)
BL	_UART_Write_Text+0
;Input Capture Complete 5ch.c,277 :: 		IntToStr(setP, toStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_toStr+0)
MOVT	R1, #hi_addr(_toStr+0)
BL	_IntToStr+0
;Input Capture Complete 5ch.c,278 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_toStr+0)
MOVT	R0, #hi_addr(_toStr+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,279 :: 		UART1_Write_Text("\n\n\n\n\r");
MOVW	R0, #lo_addr(?lstr9_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr9_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,282 :: 		if(change_SP_flag == 0)   {
MOVW	R0, #lo_addr(_change_SP_flag+0)
MOVT	R0, #hi_addr(_change_SP_flag+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main9
;Input Capture Complete 5ch.c,283 :: 		setP = SP_LOW;                                          // Switch to low setpoint for next time
MOVW	R0, #lo_addr(_SP_LOW+0)
MOVT	R0, #hi_addr(_SP_LOW+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,284 :: 		change_SP_flag = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_change_SP_flag+0)
MOVT	R0, #hi_addr(_change_SP_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,285 :: 		}
IT	AL
BAL	L_main10
L_main9:
;Input Capture Complete 5ch.c,286 :: 		else if(change_SP_flag == 1)     {
MOVW	R0, #lo_addr(_change_SP_flag+0)
MOVT	R0, #hi_addr(_change_SP_flag+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main11
;Input Capture Complete 5ch.c,287 :: 		setP = SP_LOW;                                          // Normally would switch to high setpoint for next time
MOVW	R0, #lo_addr(_SP_LOW+0)
MOVT	R0, #hi_addr(_SP_LOW+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,288 :: 		change_SP_flag = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_change_SP_flag+0)
MOVT	R0, #hi_addr(_change_SP_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,289 :: 		}
L_main11:
L_main10:
;Input Capture Complete 5ch.c,291 :: 		UART_Write_Text("\n***************** New setpoint = ");   // display it
MOVW	R0, #lo_addr(?lstr10_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr10_Input_32Capture_32Complete_325ch+0)
BL	_UART_Write_Text+0
;Input Capture Complete 5ch.c,292 :: 		IntToStr(setP, toStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_toStr+0)
MOVT	R1, #hi_addr(_toStr+0)
BL	_IntToStr+0
;Input Capture Complete 5ch.c,293 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_toStr+0)
MOVT	R0, #hi_addr(_toStr+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,294 :: 		UART1_Write_Text("\n\n\n\n\r");
MOVW	R0, #lo_addr(?lstr11_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr11_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,296 :: 		move_pointer_finger(&fngr_pointer, 100);                     // Restart the motor
MOVS	R1, #100
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_move_pointer_finger+0
;Input Capture Complete 5ch.c,297 :: 		NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);                  // Start sampling with timer 11 again
MOVW	R0, #42
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,298 :: 		sample_finger(&fngr_pointer);                                // Sample to get current position
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,299 :: 		while(fngr_pointer.position_actual >= FULLY_EXTENDED)   {
L_main12:
MOVW	R0, #lo_addr(_FULLY_EXTENDED+0)
MOVT	R0, #hi_addr(_FULLY_EXTENDED+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+20)
MOVT	R0, #hi_addr(_fngr_pointer+20)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	LT
BLT	L_main13
;Input Capture Complete 5ch.c,300 :: 		sample_finger(&fngr_pointer);                           // Make sure finger extends backward before resuming force control
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,301 :: 		MPV = fngr_pointer.tip_force;                           // Store the force value for comparison
MOVW	R0, #lo_addr(_fngr_pointer+76)
MOVT	R0, #hi_addr(_fngr_pointer+76)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,302 :: 		}
IT	AL
BAL	L_main12
L_main13:
;Input Capture Complete 5ch.c,304 :: 		POINTER_DIRECTION = CONTRACT;
MOVW	R0, #lo_addr(_CONTRACT+0)
MOVT	R0, #hi_addr(_CONTRACT+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,305 :: 		}
L_main8:
;Input Capture Complete 5ch.c,306 :: 		}
L_main4:
;Input Capture Complete 5ch.c,308 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main47
MOVW	R0, #lo_addr(_TERMINAL_PRINT_THRESH+0)
MOVT	R0, #hi_addr(_TERMINAL_PRINT_THRESH+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_terminal_print_count+0)
MOVT	R0, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L__main46
L__main45:
;Input Capture Complete 5ch.c,310 :: 		print_finger_info(&fngr_pointer);                                 // Print statistics to terminal for each finger     - PUT BACK IN
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,315 :: 		UART1_Write_Text("\n\n\n\n\n\n\n\r");                             //PUT BACK IN
MOVW	R0, #lo_addr(?lstr12_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr12_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,308 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
L__main47:
L__main46:
;Input Capture Complete 5ch.c,317 :: 		}
IT	AL
BAL	L_main2
;Input Capture Complete 5ch.c,318 :: 		} // Main ends here
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Pcontrol_force:
;Input Capture Complete 5ch.c,327 :: 		unsigned int Pcontrol_force(struct finger *fngr, unsigned int SP, unsigned int MPV)
; MPV start address is: 8 (R2)
; SP start address is: 4 (R1)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
UXTH	R6, R1
UXTH	R7, R2
; MPV end address is: 8 (R2)
; SP end address is: 4 (R1)
; fngr end address is: 0 (R0)
; fngr start address is: 20 (R5)
; SP start address is: 24 (R6)
; MPV start address is: 28 (R7)
;Input Capture Complete 5ch.c,331 :: 		if((SP-MPV) < 0)                // moved past SP
SUB	R3, R6, R7
UXTH	R3, R3
CMP	R3, #0
IT	CS
BCS	L_Pcontrol_force17
;Input Capture Complete 5ch.c,332 :: 		fngr->direction_desired = EXTEND;              // Move back
ADDW	R4, R5, #26
MOVW	R3, #lo_addr(_EXTEND+0)
MOVT	R3, #hi_addr(_EXTEND+0)
LDRSH	R3, [R3, #0]
STRH	R3, [R4, #0]
IT	AL
BAL	L_Pcontrol_force18
L_Pcontrol_force17:
;Input Capture Complete 5ch.c,334 :: 		fngr->direction_desired = CONTRACT;         // Keep going
ADDW	R4, R5, #26
MOVW	R3, #lo_addr(_CONTRACT+0)
MOVT	R3, #hi_addr(_CONTRACT+0)
LDRSH	R3, [R3, #0]
STRH	R3, [R4, #0]
L_Pcontrol_force18:
;Input Capture Complete 5ch.c,336 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0)     {
MOVW	R3, #lo_addr(?lstr13_Input_32Capture_32Complete_325ch+0)
MOVT	R3, #hi_addr(?lstr13_Input_32Capture_32Complete_325ch+0)
MOV	R1, R3
MOV	R0, R5
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Pcontrol_force19
;Input Capture Complete 5ch.c,337 :: 		POINTER_DIRECTION = fngr->direction_desired;
ADDW	R3, R5, #26
; fngr end address is: 20 (R5)
LDRH	R4, [R3, #0]
MOVW	R3, #lo_addr(GPIOE_ODR+0)
MOVT	R3, #hi_addr(GPIOE_ODR+0)
STR	R4, [R3, #0]
;Input Capture Complete 5ch.c,338 :: 		}
L_Pcontrol_force19:
;Input Capture Complete 5ch.c,340 :: 		duty_cycle = FORCE_K*abs(SP-MPV);    // proportional control
SUB	R3, R6, R7
; SP end address is: 24 (R6)
; MPV end address is: 28 (R7)
SXTH	R0, R3
BL	_abs+0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R3, #lo_addr(_FORCE_K+0)
MOVT	R3, #hi_addr(_FORCE_K+0)
VLDR	#1, S0, [R3, #0]
VMUL.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
UXTH	R3, R3
; duty_cycle start address is: 0 (R0)
UXTH	R0, R3
;Input Capture Complete 5ch.c,342 :: 		if(duty_cycle > 100)
CMP	R3, #100
IT	LS
BLS	L_Pcontrol_force20
;Input Capture Complete 5ch.c,343 :: 		duty_cycle = 100;       // cap duty cycle
MOVS	R0, #100
IT	AL
BAL	L_Pcontrol_force21
L_Pcontrol_force20:
;Input Capture Complete 5ch.c,344 :: 		else if(duty_cycle < 20)
CMP	R0, #20
IT	CS
BCS	L__Pcontrol_force44
;Input Capture Complete 5ch.c,345 :: 		duty_cycle = 20;       // boost duty cycle
MOVS	R0, #20
; duty_cycle end address is: 0 (R0)
IT	AL
BAL	L_Pcontrol_force22
L__Pcontrol_force44:
;Input Capture Complete 5ch.c,344 :: 		else if(duty_cycle < 20)
;Input Capture Complete 5ch.c,345 :: 		duty_cycle = 20;       // boost duty cycle
L_Pcontrol_force22:
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
L_Pcontrol_force21:
;Input Capture Complete 5ch.c,347 :: 		return duty_cycle;
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
;Input Capture Complete 5ch.c,348 :: 		}
L_end_Pcontrol_force:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pcontrol_force
_move_pointer_finger:
;Input Capture Complete 5ch.c,352 :: 		void move_pointer_finger(struct finger *fngr, unsigned int duty_cycle)
; duty_cycle start address is: 4 (R1)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R4, R1
; duty_cycle end address is: 4 (R1)
; fngr end address is: 0 (R0)
; fngr start address is: 0 (R0)
; duty_cycle start address is: 16 (R4)
;Input Capture Complete 5ch.c,354 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0)
MOVW	R2, #lo_addr(?lstr14_Input_32Capture_32Complete_325ch+0)
MOVT	R2, #hi_addr(?lstr14_Input_32Capture_32Complete_325ch+0)
MOV	R1, R2
; fngr end address is: 0 (R0)
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_pointer_finger23
;Input Capture Complete 5ch.c,355 :: 		PWM_TIM1_Set_Duty(duty_cycle*(PWM_PERIOD_TIM1/100), _PWM_NON_INVERTED, POINTER_PWM);       // set new duty cycle
MOVW	R2, #lo_addr(_PWM_PERIOD_TIM1+0)
MOVT	R2, #hi_addr(_PWM_PERIOD_TIM1+0)
LDRH	R3, [R2, #0]
MOVS	R2, #100
UDIV	R2, R3, R2
UXTH	R2, R2
MULS	R2, R4, R2
; duty_cycle end address is: 16 (R4)
MOVS	R1, #0
UXTH	R0, R2
MOVS	R2, #0
BL	_PWM_TIM1_Set_Duty+0
L_move_pointer_finger23:
;Input Capture Complete 5ch.c,358 :: 		}
L_end_move_pointer_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _move_pointer_finger
_timer2_ISR:
;Input Capture Complete 5ch.c,364 :: 		void timer2_ISR() iv IVT_INT_TIM2 {
;Input Capture Complete 5ch.c,367 :: 		if(TIM2_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR24
;Input Capture Complete 5ch.c,368 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,369 :: 		tim2_overflow_count++;                                                  // Increment timer 2 overflow counter
MOVW	R1, #lo_addr(_tim2_overflow_count+0)
MOVT	R1, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,370 :: 		}
L_timer2_ISR24:
;Input Capture Complete 5ch.c,374 :: 		if (TIM2_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR25
;Input Capture Complete 5ch.c,375 :: 		fngr_thumb.enc_start_time = fngr_thumb.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+36)
MOVT	R2, #hi_addr(_fngr_thumb+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+32)
MOVT	R0, #hi_addr(_fngr_thumb+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,376 :: 		fngr_thumb.enc_end_time = TIM2_CCR1;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,377 :: 		fngr_thumb.enc_overflow_start = fngr_thumb.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+48)
MOVT	R2, #hi_addr(_fngr_thumb+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+44)
MOVT	R0, #hi_addr(_fngr_thumb+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,378 :: 		fngr_thumb.enc_overflow_end = tim2_overflow_count;                      // Store number of timer 2 overflows for thumb
MOVW	R0, #lo_addr(_tim2_overflow_count+0)
MOVT	R0, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,379 :: 		fngr_thumb.enc_chan_b = FNGR_THUMB_ENC_B;                               // Sample the second encoder channel (For direction)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_thumb+28)
MOVT	R0, #hi_addr(_fngr_thumb+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,380 :: 		fngr_thumb.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_thumb+16)
MOVT	R1, #hi_addr(_fngr_thumb+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,381 :: 		}
L_timer2_ISR25:
;Input Capture Complete 5ch.c,382 :: 		}
L_end_timer2_ISR:
BX	LR
; end of _timer2_ISR
_timer3_ISR:
;Input Capture Complete 5ch.c,386 :: 		void timer3_ISR() iv IVT_INT_TIM3 {
;Input Capture Complete 5ch.c,389 :: 		if(TIM3_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR26
;Input Capture Complete 5ch.c,390 :: 		TIM3_SR.UIF = 0;                                                        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,391 :: 		tim3_overflow_count++;                                                  // Increment timer 3 overflow counter
MOVW	R1, #lo_addr(_tim3_overflow_count+0)
MOVT	R1, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,392 :: 		}
L_timer3_ISR26:
;Input Capture Complete 5ch.c,395 :: 		if (TIM3_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR27
;Input Capture Complete 5ch.c,396 :: 		fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;                // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+36)
MOVT	R2, #hi_addr(_fngr_pointer+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+32)
MOVT	R0, #hi_addr(_fngr_pointer+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,397 :: 		fngr_pointer.enc_end_time = TIM3_CCR1;                                  // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR1+0)
MOVT	R0, #hi_addr(TIM3_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,398 :: 		fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;        // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+48)
MOVT	R2, #hi_addr(_fngr_pointer+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+44)
MOVT	R0, #hi_addr(_fngr_pointer+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,399 :: 		fngr_pointer.enc_overflow_end = tim3_overflow_count;                    // Store number of timer 3 overflows for Pointer finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,400 :: 		fngr_pointer.enc_chan_b = FNGR_POINTER_ENC_B;                           // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+28)
MOVT	R0, #hi_addr(_fngr_pointer+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,401 :: 		fngr_pointer.position_temp++;                                           // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pointer+16)
MOVT	R1, #hi_addr(_fngr_pointer+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,402 :: 		}
L_timer3_ISR27:
;Input Capture Complete 5ch.c,406 :: 		if (TIM3_SR.CC2IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR28
;Input Capture Complete 5ch.c,407 :: 		fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+36)
MOVT	R2, #hi_addr(_fngr_middle+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+32)
MOVT	R0, #hi_addr(_fngr_middle+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,408 :: 		fngr_middle.enc_end_time = TIM3_CCR2;                                   // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR2+0)
MOVT	R0, #hi_addr(TIM3_CCR2+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,409 :: 		fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+48)
MOVT	R2, #hi_addr(_fngr_middle+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+44)
MOVT	R0, #hi_addr(_fngr_middle+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,410 :: 		fngr_middle.enc_overflow_end = tim3_overflow_count;                     // Store number of timer 3 overflows for Middle finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,411 :: 		fngr_middle.enc_chan_b = FNGR_MIDDLE_ENC_B;                             // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_middle+28)
MOVT	R0, #hi_addr(_fngr_middle+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,412 :: 		fngr_middle.position_temp++;                                            // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_middle+16)
MOVT	R1, #hi_addr(_fngr_middle+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,413 :: 		}
L_timer3_ISR28:
;Input Capture Complete 5ch.c,416 :: 		if (TIM3_SR.CC3IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR29
;Input Capture Complete 5ch.c,417 :: 		fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+36)
MOVT	R2, #hi_addr(_fngr_ring+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+32)
MOVT	R0, #hi_addr(_fngr_ring+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,418 :: 		fngr_ring.enc_end_time = TIM3_CCR3;                                     // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR3+0)
MOVT	R0, #hi_addr(TIM3_CCR3+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,419 :: 		fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+48)
MOVT	R2, #hi_addr(_fngr_ring+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+44)
MOVT	R0, #hi_addr(_fngr_ring+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,420 :: 		fngr_ring.enc_overflow_end = tim3_overflow_count;                       // Store number of timer 3 overflows for Ring finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,421 :: 		fngr_ring.enc_chan_b = FNGR_RING_ENC_B;                                 // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_ring+28)
MOVT	R0, #hi_addr(_fngr_ring+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,422 :: 		fngr_ring.position_temp++;                                              // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_ring+16)
MOVT	R1, #hi_addr(_fngr_ring+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,423 :: 		}
L_timer3_ISR29:
;Input Capture Complete 5ch.c,426 :: 		if (TIM3_SR.CC4IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR30
;Input Capture Complete 5ch.c,427 :: 		fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+36)
MOVT	R2, #hi_addr(_fngr_pinky+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+32)
MOVT	R0, #hi_addr(_fngr_pinky+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,428 :: 		fngr_pinky.enc_end_time = TIM3_CCR4;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR4+0)
MOVT	R0, #hi_addr(TIM3_CCR4+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,429 :: 		fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+48)
MOVT	R2, #hi_addr(_fngr_pinky+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+44)
MOVT	R0, #hi_addr(_fngr_pinky+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,430 :: 		fngr_pinky.enc_overflow_end = tim3_overflow_count;                      // Store number of timer 3 overflows for Pinky
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,431 :: 		fngr_pinky.enc_chan_b = FNGR_PINKY_ENC_B;                               // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pinky+28)
MOVT	R0, #hi_addr(_fngr_pinky+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,432 :: 		fngr_pinky.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pinky+16)
MOVT	R1, #hi_addr(_fngr_pinky+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,433 :: 		}
L_timer3_ISR30:
;Input Capture Complete 5ch.c,434 :: 		}
L_end_timer3_ISR:
BX	LR
; end of _timer3_ISR
_timer11_ISR:
;Input Capture Complete 5ch.c,438 :: 		void timer11_ISR() iv IVT_INT_TIM1_TRG_COM_TIM11 {
;Input Capture Complete 5ch.c,440 :: 		TIM11_SR.UIF = 0;                                                           // Clear timer 11 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_SR+0)
MOVT	R0, #hi_addr(TIM11_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,441 :: 		poll_flag = 1;                                                              // Set poll flag for main loop
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,442 :: 		terminal_print_count++;                                                     // Increment the debug print counter
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,443 :: 		}
L_end_timer11_ISR:
BX	LR
; end of _timer11_ISR
_init_GPIO:
;Input Capture Complete 5ch.c,450 :: 		void init_GPIO() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,453 :: 		GPIO_Digital_Input(&GPIOE_BASE, _GPIO_PINMASK_12);                          // Pointer motor encoder channel B
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Complete 5ch.c,454 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_11);                          // Middle motor encoder channel B
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Complete 5ch.c,455 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_15);                          // Ring motor encoder channel B
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Complete 5ch.c,456 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_9);                           // Pinky motor encoder channel B
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;Input Capture Complete 5ch.c,457 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_11);                          // Thumb motor encoder channel B
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,460 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                         // Pointer direction
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,461 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);                          // Motor enable: may not use in this test
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,464 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);                          // For awd debug test
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,465 :: 		}
L_end_init_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_GPIO
_init_pointer_PWM:
;Input Capture Complete 5ch.c,469 :: 		void init_pointer_PWM( ) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,471 :: 		PWM_PERIOD_TIM1 = PWM_TIM1_Init(PWM_FREQ_HZ);                                   // Set PWM base frequency to 100 Hz
MOVW	R0, #lo_addr(_PWM_FREQ_HZ+0)
MOVT	R0, #hi_addr(_PWM_FREQ_HZ+0)
LDR	R0, [R0, #0]
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_PWM_PERIOD_TIM1+0)
MOVT	R1, #hi_addr(_PWM_PERIOD_TIM1+0)
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,472 :: 		PWM_TIM1_Set_Duty(100*(PWM_PERIOD_TIM1/100), _PWM_NON_INVERTED, POINTER_PWM);    // Set 70% duty on Timer 1, channel 1
MOVS	R1, #100
UDIV	R1, R0, R1
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,473 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;Input Capture Complete 5ch.c,474 :: 		}
L_end_init_pointer_PWM:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_pointer_PWM
_init_finger:
;Input Capture Complete 5ch.c,478 :: 		void init_finger(struct finger *fngr)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
; fngr end address is: 0 (R0)
; fngr start address is: 16 (R4)
;Input Capture Complete 5ch.c,480 :: 		fngr->position_actual = 0;
ADDW	R2, R4, #20
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Complete 5ch.c,481 :: 		fngr->direction_desired = CONTRACT;
ADDW	R2, R4, #26
MOVW	R1, #lo_addr(_CONTRACT+0)
MOVT	R1, #hi_addr(_CONTRACT+0)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,483 :: 		if (strcmp(fngr->name, "fngr_pointer") == 0) {
MOVW	R1, #lo_addr(?lstr15_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr15_Input_32Capture_32Complete_325ch+0)
MOV	R0, R4
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger31
;Input Capture Complete 5ch.c,484 :: 		POINTER_DIRECTION = fngr->direction_desired;
ADDW	R1, R4, #26
; fngr end address is: 16 (R4)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,486 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,487 :: 		ADC1_Init();                                                // Initialize ADC1
BL	_ADC1_Init+0
;Input Capture Complete 5ch.c,488 :: 		}
L_init_finger31:
;Input Capture Complete 5ch.c,501 :: 		}
L_end_init_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_finger
_init_UART:
;Input Capture Complete 5ch.c,505 :: 		void init_UART() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,507 :: 		UART1_Init(UART_BAUD_RATE);                                                 // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;Input Capture Complete 5ch.c,508 :: 		Delay_ms(200);                                                              // Wait for UART to stabilize
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_init_UART32:
SUBS	R7, R7, #1
BNE	L_init_UART32
NOP
NOP
NOP
;Input Capture Complete 5ch.c,509 :: 		UART_Write_Text("\rUART Init Complete\r\n");                                // *** DEBUG *** Print test statement to terminal
MOVW	R0, #lo_addr(?lstr16_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr16_Input_32Capture_32Complete_325ch+0)
BL	_UART_Write_Text+0
;Input Capture Complete 5ch.c,510 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_init_input_capture:
;Input Capture Complete 5ch.c,514 :: 		void init_input_capture() {
SUB	SP, SP, #24
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,518 :: 		RCC_APB1ENR.TIM3EN = 1;                                                     // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,519 :: 		TIM3_CR1.CEN = 0;                                                           // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,520 :: 		TIM3_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM3_CR2+0)
MOVT	R0, #hi_addr(TIM3_CR2+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,521 :: 		TIM3_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
STR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,522 :: 		TIM3_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
STR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,523 :: 		TIM3_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,526 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH1_PC6);                 // Configure alternate function for C6 as Timer 3 Channel 1
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM3_CH1_PC6+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM3_CH1_PC6+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Complete 5ch.c,527 :: 		TIM3_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,528 :: 		TIM3_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,529 :: 		TIM3_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,530 :: 		TIM3_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,531 :: 		TIM3_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,534 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH2_PC7);                 // Configure alternate function for pin C7 as Timer 3 Channel 2
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM3_CH2_PC7+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM3_CH2_PC7+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Complete 5ch.c,535 :: 		TIM3_CCMR1_Input |= 0x100;                                                  // Set capture channel 2 as input on TI2 (CC2S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,536 :: 		TIM3_CCER.CC2P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,537 :: 		TIM3_CCER.CC2NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,538 :: 		TIM3_CCER.CC2E = 1;                                                         // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,539 :: 		TIM3_DIER.CC2IE = 1;                                                        // Enable interrupt on capture channel 2
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,542 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH3_PC8);                 // Configure alternate function for pin BC8 as Timer 3 Channel 3
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM3_CH3_PC8+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM3_CH3_PC8+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Complete 5ch.c,543 :: 		TIM3_CCMR2_Input |= 0x01;                                                   // Set capture channel 3 as input on TI3 (CC3S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,544 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,545 :: 		TIM3_CCER.CC3NP = 0;                                                         // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,546 :: 		TIM3_CCER.CC3E = 1;                                                         // Enable capture on channel 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,547 :: 		TIM3_DIER.CC3IE = 1;                                                        // Enable interrupt on capture channel 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,550 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM3_CH4_PC9);                 // Configure alternate function for pin C9 as Timer 3 Channel 4
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM3_CH4_PC9+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM3_CH4_PC9+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Complete 5ch.c,551 :: 		TIM3_CCMR2_Input |= 0x100;                                                  // Set capture channel 4 as input on TI4 (CC4S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,552 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,553 :: 		TIM3_CCER.CC3NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,554 :: 		TIM3_CCER.CC4E = 1;                                                         // Enable capture on channel 4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,555 :: 		TIM3_DIER.CC4IE = 1;                                                        // Enable interrupt on capture channel 4
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,559 :: 		RCC_APB1ENR.TIM2EN = 1;                                                     // Enable clock gating for timer module 5
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,560 :: 		TIM2_CR1.CEN = 0;                                                           // Disable timer/counter
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,561 :: 		TIM2_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM2_CR2+0)
MOVT	R0, #hi_addr(TIM2_CR2+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,562 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
LDR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,563 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
LDR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,564 :: 		TIM2_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,567 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_TIM2_CH1_PA5);                 // Configure alternate function for A5 as Timer 2 Channel 1
MOVW	R0, #lo_addr(__GPIO_MODULE_TIM2_CH1_PA5+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_TIM2_CH1_PA5+0)
BL	_GPIO_Alternate_Function_Enable+0
;Input Capture Complete 5ch.c,568 :: 		TIM2_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,569 :: 		TIM2_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,570 :: 		TIM2_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,571 :: 		TIM2_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,572 :: 		TIM2_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,576 :: 		TIM3_DIER.UIE = 1;                                                          // Enable overflow interrupt Timer 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,577 :: 		TIM2_DIER.UIE = 1;                                                          // Enable overflow interrupt for Timer 2
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,578 :: 		NVIC_IntEnable(IVT_INT_TIM3);                                               // Enable timer 3 ISR
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,579 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                               // Enable timer 2 ISR
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,580 :: 		TIM3_CR1.CEN = 1;                                                           // Enable timer 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,581 :: 		TIM2_CR1.CEN = 1;                                                           // Enable Timer 2
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,585 :: 		encoder_timer_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
LDR	R0, [SP, #20]
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
UXTH	R1, R1
MOVW	R0, #lo_addr(_MCU_FREQUENCY+0)
MOVT	R0, #hi_addr(_MCU_FREQUENCY+0)
LDR	R0, [R0, #0]
UDIV	R0, R0, R1
BL	__UnsignedIntegralToLongDouble+0
STRD	R0, R1, [SP, #12]
MOV	R0, #0
MOVW	R1, #16384
MOVT	R1, #16527
VMOV	S0, R0
VMOV	S1, R1
STRD	R2, R3, [SP, #4]
LDRD	R2, R3, [SP, #12]
VMOV	R0, S0
VMOV	R1, S1
BL	__Div_DP+0
LDRD	R2, R3, [SP, #4]
MOVW	R2, #lo_addr(_encoder_timer_period_ms+0)
MOVT	R2, #hi_addr(_encoder_timer_period_ms+0)
STRD	R0, R1, [R2, #0]
;Input Capture Complete 5ch.c,586 :: 		}
L_end_init_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _init_input_capture
_init_timer11:
;Input Capture Complete 5ch.c,591 :: 		void init_timer11() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,593 :: 		RCC_APB2ENR.TIM11EN = 1;                                                    // Enable clock for timer 11
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,594 :: 		TIM11_CR1.CEN = 0;                                                          // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,595 :: 		TIM11_PSC = SAMPLE_TIM_PSC;                                                 // Set timer 11 prescaler
MOVW	R0, #lo_addr(_SAMPLE_TIM_PSC+0)
MOVT	R0, #hi_addr(_SAMPLE_TIM_PSC+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM11_PSC+0)
MOVT	R0, #hi_addr(TIM11_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,596 :: 		TIM11_ARR = SAMPLE_TIM_RELOAD;                                              // Set timer 11 overflow value
MOVW	R0, #lo_addr(_SAMPLE_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_SAMPLE_TIM_RELOAD+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM11_ARR+0)
MOVT	R0, #hi_addr(TIM11_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,597 :: 		NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);                                 // Enable timer 11 interrupt
MOVW	R0, #42
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,598 :: 		TIM11_DIER.UIE = 1;                                                         // Timer 11 update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_DIER+0)
MOVT	R0, #hi_addr(TIM11_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,599 :: 		TIM11_CR1.CEN = 1;                                                          // Enable timer/counter
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,600 :: 		}
L_end_init_timer11:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_timer11
_sample_finger:
;Input Capture Complete 5ch.c,607 :: 		void sample_finger( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R9, R0
; fngr end address is: 0 (R0)
; fngr start address is: 36 (R9)
;Input Capture Complete 5ch.c,610 :: 		fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;
ADD	R3, R9, #52
ADD	R1, R9, #48
LDR	R2, [R1, #0]
ADD	R1, R9, #44
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,613 :: 		fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);
ADD	R3, R9, #56
ADD	R1, R9, #52
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R1, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R1, #0]
SUBS	R1, R1, #3
MULS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,616 :: 		fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;
ADD	R3, R9, #40
ADD	R1, R9, #36
LDR	R2, [R1, #0]
ADD	R1, R9, #32
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,619 :: 		fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;
ADD	R3, R9, #60
ADD	R1, R9, #56
LDR	R2, [R1, #0]
ADD	R1, R9, #40
LDR	R1, [R1, #0]
ADDS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,622 :: 		fngr->input_sig_period = (long double) fngr->enc_total_ticks * encoder_timer_period_ms;
ADD	R1, R9, #68
STR	R1, [SP, #4]
ADD	R1, R9, #60
LDR	R1, [R1, #0]
MOV	R0, R1
BL	__UnsignedIntegralToLongDouble+0
MOVW	R2, #lo_addr(_encoder_timer_period_ms+0)
MOVT	R2, #hi_addr(_encoder_timer_period_ms+0)
VLDR	#1, D0, [R2, #0]
VMOV	R2, S0
VMOV	R3, S1
BL	__Mul_DP+0
LDR	R2, [SP, #4]
STRD	R0, R1, [R2, #0]
;Input Capture Complete 5ch.c,625 :: 		fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
ADD	R1, R9, #64
STR	R1, [SP, #8]
ADD	R1, R9, #68
STR	R1, [SP, #4]
MOV	R1, #1000
VMOV	S0, R1
VMOV	R0, S0
BL	__UnsignedIntegralToLongDouble+0
LDR	R2, [SP, #4]
LDRD	R2, R3, [R2, #0]
BL	__Div_DP+0
BL	__LongDoubleToUnsignedIntegral+0
LDR	R1, [SP, #8]
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,626 :: 		if (fngr->input_sig_frequency > 20000.0)                                    // NEW: Handles startup error
ADD	R1, R9, #64
LDR	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#0, S1, S1
MOVW	R1, #16384
MOVT	R1, #18076
VMOV	S0, R1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_sample_finger34
;Input Capture Complete 5ch.c,627 :: 		fngr->input_sig_frequency = 0;
ADD	R2, R9, #64
MOVS	R1, #0
STR	R1, [R2, #0]
L_sample_finger34:
;Input Capture Complete 5ch.c,630 :: 		if (fngr->enc_chan_b == 1) {                                                // Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_sample_finger35
;Input Capture Complete 5ch.c,631 :: 		fngr->direction_actual = CONTRACT;
ADD	R2, R9, #24
MOVW	R1, #lo_addr(_CONTRACT+0)
MOVT	R1, #hi_addr(_CONTRACT+0)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,632 :: 		fngr->position_actual += (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
ADD	R3, R9, #20
ADD	R1, R9, #16
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_NORMALIZATION_CONSTANT+0)
MOVT	R1, #hi_addr(_NORMALIZATION_CONSTANT+0)
LDRH	R1, [R1, #0]
SDIV	R2, R2, R1
LDR	R1, [R3, #0]
ADDS	R1, R1, R2
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,633 :: 		}
IT	AL
BAL	L_sample_finger36
L_sample_finger35:
;Input Capture Complete 5ch.c,635 :: 		else if (fngr->enc_chan_b == 0) {                                           // Counter Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_sample_finger37
;Input Capture Complete 5ch.c,636 :: 		fngr->direction_actual = EXTEND;
ADD	R2, R9, #24
MOVW	R1, #lo_addr(_EXTEND+0)
MOVT	R1, #hi_addr(_EXTEND+0)
LDRSH	R1, [R1, #0]
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,637 :: 		fngr->position_actual -= (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
ADD	R3, R9, #20
ADD	R1, R9, #16
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_NORMALIZATION_CONSTANT+0)
MOVT	R1, #hi_addr(_NORMALIZATION_CONSTANT+0)
LDRH	R1, [R1, #0]
SDIV	R2, R2, R1
LDR	R1, [R3, #0]
SUB	R1, R1, R2
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,638 :: 		}
IT	AL
BAL	L_sample_finger38
L_sample_finger37:
;Input Capture Complete 5ch.c,641 :: 		fngr->direction_actual = 7;
ADD	R2, R9, #24
MOVS	R1, #7
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,642 :: 		}
L_sample_finger38:
L_sample_finger36:
;Input Capture Complete 5ch.c,655 :: 		fngr->position_temp = 0;
ADD	R2, R9, #16
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Complete 5ch.c,657 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0)   {
MOVW	R1, #lo_addr(?lstr17_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr17_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger39
;Input Capture Complete 5ch.c,658 :: 		pointer_average = ADC1_Get_Sample(3);
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R1, #lo_addr(_pointer_average+0)
MOVT	R1, #hi_addr(_pointer_average+0)
VSTR	#1, S1, [R1, #0]
;Input Capture Complete 5ch.c,659 :: 		fngr->tip_force = (unsigned int)(((fngr->tip_force*4)+ pointer_average)/5);         // read analog value from channel 7 - pointer
ADD	R2, R9, #76
LDRH	R1, [R2, #0]
LSLS	R1, R1, #2
UXTH	R1, R1
VMOV	S0, R1
VCVT.F32	#0, S0, S0
VADD.F32	S1, S0, S1
VMOV.F32	S0, #5
VDIV.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
UXTH	R1, R1
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,660 :: 		POINTER_DIRECTION = fngr->direction_desired;
ADD	R1, R9, #26
; fngr end address is: 36 (R9)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,661 :: 		}
L_sample_finger39:
;Input Capture Complete 5ch.c,663 :: 		}
L_end_sample_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _sample_finger
_print_finger_info:
;Input Capture Complete 5ch.c,667 :: 		void print_finger_info( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #36
STR	LR, [SP, #0]
MOV	R8, R0
; fngr end address is: 0 (R0)
; fngr start address is: 32 (R8)
;Input Capture Complete 5ch.c,674 :: 		UART1_Write_Text("\n\rFinger Name: ");                                      //Print name of current finger to terminal
MOVW	R1, #lo_addr(?lstr18_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr18_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,675 :: 		UART1_Write_Text(fngr->name);
MOV	R0, R8
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,676 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr19_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr19_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,678 :: 		LongWordToStr(fngr->input_sig_frequency, frequency_text);                   // Print input capture signal frequency to terminal
ADD	R2, SP, #4
ADD	R1, R8, #64
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;Input Capture Complete 5ch.c,679 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R1, #lo_addr(?lstr20_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr20_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,680 :: 		UART1_Write_Text(frequency_text);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,681 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr21_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr21_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,684 :: 		UART1_Write_Text("Direction of movement:             ");
MOVW	R1, #lo_addr(?lstr22_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr22_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,685 :: 		if(fngr->direction_actual == EXTEND)
ADD	R1, R8, #24
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_EXTEND+0)
MOVT	R1, #hi_addr(_EXTEND+0)
LDRSH	R1, [R1, #0]
CMP	R2, R1
IT	NE
BNE	L_print_finger_info40
;Input Capture Complete 5ch.c,686 :: 		UART1_Write_Text("EXTEND ");
MOVW	R1, #lo_addr(?lstr23_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr23_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
IT	AL
BAL	L_print_finger_info41
L_print_finger_info40:
;Input Capture Complete 5ch.c,688 :: 		UART1_Write_Text("CONTRACT ");
MOVW	R1, #lo_addr(?lstr24_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr24_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
L_print_finger_info41:
;Input Capture Complete 5ch.c,690 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr25_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr25_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,692 :: 		LongToStr(fngr->position_actual, position_text);                            // Print total number of input events (position) to terminal
ADD	R2, SP, #19
ADD	R1, R8, #20
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongToStr+0
;Input Capture Complete 5ch.c,693 :: 		UART1_Write_Text("Position of finger:                ");
MOVW	R1, #lo_addr(?lstr26_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr26_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,694 :: 		UART1_Write_Text(position_text);
ADD	R1, SP, #19
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,695 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr27_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr27_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,697 :: 		IntToStr(fngr->tip_force, toStr);                            // Print Flexiforce value (16-bit unsigned) to terminal
ADD	R1, R8, #76
; fngr end address is: 32 (R8)
LDRH	R1, [R1, #0]
SXTH	R1, R1
SXTH	R0, R1
MOVW	R1, #lo_addr(_toStr+0)
MOVT	R1, #hi_addr(_toStr+0)
BL	_IntToStr+0
;Input Capture Complete 5ch.c,698 :: 		UART1_Write_Text("Force applied to tip of finger:                ");
MOVW	R1, #lo_addr(?lstr28_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr28_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,699 :: 		UART1_Write_Text(toStr);
MOVW	R0, #lo_addr(_toStr+0)
MOVT	R0, #hi_addr(_toStr+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,700 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr29_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr29_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,702 :: 		terminal_print_count = 0;                                                   // Reset counter for terminal printing
MOVS	R2, #0
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
STRH	R2, [R1, #0]
;Input Capture Complete 5ch.c,703 :: 		}
L_end_print_finger_info:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _print_finger_info
_ADC_AWD:
;Input Capture Complete 5ch.c,709 :: 		void ADC_AWD() iv IVT_INT_ADC ics ICS_AUTO {
;Input Capture Complete 5ch.c,710 :: 		ADC1_CR1bits.AWDIE = 0;       // Disabling analog interrupt (disable)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,711 :: 		ADC1_SRbits.AWD = 0;          // Reset status bit
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,712 :: 		if(ADC1_HTR <= 1000) {
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
LDR	R0, [R0, #0]
CMP	R0, #1000
IT	HI
BHI	L_ADC_AWD42
;Input Capture Complete 5ch.c,713 :: 		TIM5_SR.UIF = 0;        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_SR+0)
MOVT	R0, #hi_addr(TIM5_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,714 :: 		TIM5_CNT = 0x00;        // Reset timer value to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM5_CNT+0)
MOVT	R0, #hi_addr(TIM5_CNT+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,715 :: 		ADC1_HTR = high_level2; // Set high threshold to MAX
MOVW	R1, #4095
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,716 :: 		ADC1_LTR = low_level2;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,717 :: 		TIM5_DIER.UIE = 1;      // CC1 Update Interrupt Enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,718 :: 		}else {
IT	AL
BAL	L_ADC_AWD43
L_ADC_AWD42:
;Input Capture Complete 5ch.c,719 :: 		TIM5_DIER.UIE = 0;      // Disable timer interrupt
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,720 :: 		ADC1_HTR = high_level;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,721 :: 		ADC1_LTR = low_level;   // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,722 :: 		}
L_ADC_AWD43:
;Input Capture Complete 5ch.c,723 :: 		ADC1_CR1bits.AWDIE = 1;       //Enable analog interrupt (enabled)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,724 :: 		}
L_end_ADC_AWD:
BX	LR
; end of _ADC_AWD
_InitTimer5:
;Input Capture Complete 5ch.c,728 :: 		void InitTimer5(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,729 :: 		RCC_APB1ENR.TIM5EN = 1;        // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,730 :: 		TIM5_CR1.CEN = 0;              // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,731 :: 		TIM5_PSC = 7874;               // Set timer 3 prescaler (need to determine value)
MOVW	R1, #7874
MOVW	R0, #lo_addr(TIM5_PSC+0)
MOVT	R0, #hi_addr(TIM5_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,732 :: 		TIM5_ARR = 63999;              // Set timer 3 overflow value at max
MOVW	R1, #63999
MOVW	R0, #lo_addr(TIM5_ARR+0)
MOVT	R0, #hi_addr(TIM5_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,733 :: 		NVIC_IntEnable(IVT_INT_TIM5);  // Enable timer 3 interrupt
MOVW	R0, #66
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,734 :: 		TIM5_CR1.CEN = 1;              // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,735 :: 		}
L_end_InitTimer5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer5
_Timer5_interrupt:
;Input Capture Complete 5ch.c,738 :: 		void Timer5_interrupt() iv IVT_INT_TIM5 { // Interrupt handler if 6 s have past
;Input Capture Complete 5ch.c,739 :: 		TIM5_SR.UIF = 0;                     // Clear timer 3 interrupt bit
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM5_SR+0)
MOVT	R0, #hi_addr(TIM5_SR+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,740 :: 		ADC1_HTR = high_level;               // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,741 :: 		ADC1_LTR = low_level;                // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,742 :: 		TIM5_DIER.UIE = 0;                   // Disable timer interrupt
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,743 :: 		analogGo = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,744 :: 		GPIOD_ODR.B1 = 1;                              //DEBUG
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,745 :: 		}
L_end_Timer5_interrupt:
BX	LR
; end of _Timer5_interrupt
