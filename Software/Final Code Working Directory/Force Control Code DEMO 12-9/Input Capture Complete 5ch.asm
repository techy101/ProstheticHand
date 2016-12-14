_main:
;Input Capture Complete 5ch.c,144 :: 		void main() {
SUB	SP, SP, #4
;Input Capture Complete 5ch.c,147 :: 		init_UART();                                                            // Configure and Initialize UART serial communications
BL	_init_UART+0
;Input Capture Complete 5ch.c,148 :: 		init_GPIO();                                                            // Configure MCU I/O
BL	_init_GPIO+0
;Input Capture Complete 5ch.c,149 :: 		init_pointer_PWM();
BL	_init_pointer_PWM+0
;Input Capture Complete 5ch.c,152 :: 		InitTimer5();                  // Timer3 init
BL	_InitTimer5+0
;Input Capture Complete 5ch.c,155 :: 		ADC1_LTR = low_level;        // Set AWD guard window initial lower threshold
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,156 :: 		ADC1_HTR = high_level;       // Set AWD guard window initial upper threshold
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,157 :: 		ADC1_CR2bits.CONT = 1;       // Enable ADC1 continuous conversion mode
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,158 :: 		ADC1_SQR3bits.SQ1 = 3;       // Set first channel in continuous coversion sequence to channel 3
MOVS	R2, #3
MOVW	R1, #lo_addr(ADC1_SQR3bits+0)
MOVT	R1, #hi_addr(ADC1_SQR3bits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #0, #5
STRB	R0, [R1, #0]
;Input Capture Complete 5ch.c,159 :: 		ADC1_CR1bits.AWDSGL = 1;     // Enable single channel monitoring mode for AWD
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,160 :: 		ADC1_CR1 |= 3;               // Set channel 3 as the single monitored AWD channel
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,161 :: 		ADC1_CR1bits.AWDEN = 1;      // Enable Analog watchdog on regular channels
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,162 :: 		ADC1_CR2bits.SWSTART = 1;    // Start ADC1 Conversions
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,163 :: 		ADC1_CR1bits.AWDIE = 1;      // Enable analog watchdog interrupt
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R3, [R0, #0]
;Input Capture Complete 5ch.c,164 :: 		NVIC_IntEnable(IVT_INT_ADC); // Enable global ADC interrupt
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,167 :: 		strcpy(fngr_pointer.name, "fngr_pointer");
MOVW	R0, #lo_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr1_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,168 :: 		strcpy(fngr_middle.name, "fngr_middle");
MOVW	R0, #lo_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr2_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,169 :: 		strcpy(fngr_ring.name, "fngr_ring");
MOVW	R0, #lo_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr3_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,170 :: 		strcpy(fngr_pinky.name, "fngr_pinky");
MOVW	R0, #lo_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr4_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,171 :: 		strcpy(fngr_thumb.name, "fngr_thumb");
MOVW	R0, #lo_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr5_Input_32Capture_32Complete_325ch+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_strcpy+0
;Input Capture Complete 5ch.c,174 :: 		init_finger(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,175 :: 		init_finger(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,176 :: 		init_finger(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,177 :: 		init_finger(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,178 :: 		init_finger(&fngr_thumb);
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_init_finger+0
;Input Capture Complete 5ch.c,181 :: 		ADC1_init();
BL	_ADC1_Init+0
;Input Capture Complete 5ch.c,184 :: 		UART1_Write_Text("\n\n\rProgram Has Started!\n\r");
MOVW	R0, #lo_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr6_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,185 :: 		delay_ms(500);
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
;Input Capture Complete 5ch.c,188 :: 		init_timer11();                                                         // Initialize timer 11, used for sampling
BL	_init_timer11+0
;Input Capture Complete 5ch.c,189 :: 		init_input_capture();                                                   // Initialize input capture channels
BL	_init_input_capture+0
;Input Capture Complete 5ch.c,191 :: 		setP = SP_LOW;                                                             // Medium touch to begin
MOVW	R0, #lo_addr(_SP_LOW+0)
MOVT	R0, #hi_addr(_SP_LOW+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,192 :: 		change_SP_flag = 1;                                                     // Light touch next time
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_change_SP_flag+0)
MOVT	R0, #hi_addr(_change_SP_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,195 :: 		while(1) {
L_main2:
;Input Capture Complete 5ch.c,197 :: 		if (poll_flag) {                                                     // Calculate finger state values (Set by timer 3)
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main4
;Input Capture Complete 5ch.c,198 :: 		poll_flag = 0;                                                    // Clear flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,199 :: 		sample_finger(&fngr_pointer);                                     // Call state calculation function for each finger - equivalent of sampling
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,200 :: 		sample_finger(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,201 :: 		sample_finger(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,202 :: 		sample_finger(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,203 :: 		sample_finger(&fngr_thumb);
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,206 :: 		if(fngr_pointer.position_actual >= FULLY_CONTRACTED) {
MOVW	R0, #lo_addr(_FULLY_CONTRACTED+0)
MOVT	R0, #hi_addr(_FULLY_CONTRACTED+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+20)
MOVT	R0, #hi_addr(_fngr_pointer+20)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L_main5
;Input Capture Complete 5ch.c,207 :: 		while(fngr_pointer.position_actual >= FULLY_EXTENDED) {
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
;Input Capture Complete 5ch.c,208 :: 		sample_finger(&fngr_pointer);
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,209 :: 		fngr_pointer.direction_desired = EXTEND;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,210 :: 		POINTER_DIRECTION = EXTEND;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,211 :: 		}
IT	AL
BAL	L_main6
L_main7:
;Input Capture Complete 5ch.c,212 :: 		}
L_main5:
;Input Capture Complete 5ch.c,214 :: 		MPV = fngr_pointer.tip_force;                                     // Store the sampled value locally
MOVW	R2, #lo_addr(_fngr_pointer+76)
MOVT	R2, #hi_addr(_fngr_pointer+76)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,216 :: 		dutyCycle = Pcontrol_force(&fngr_pointer, setP, MPV);  // apply P control; input is finger, SP, MPV
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
;Input Capture Complete 5ch.c,233 :: 		move_pointer_finger(&fngr_pointer, dutyCycle);                 // apply duty cycle
UXTH	R1, R0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_move_pointer_finger+0
;Input Capture Complete 5ch.c,236 :: 		if(abs(MPV - setP) < MARGIN)
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
;Input Capture Complete 5ch.c,238 :: 		move_pointer_finger(&fngr_pointer, 0);                       // stop the motor
MOVS	R1, #0
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_move_pointer_finger+0
;Input Capture Complete 5ch.c,240 :: 		fngr_pointer.direction_desired = EXTEND;                     // Set up to EXTEND back from setpoint to mechanical 0
MOVS	R1, #1
MOVW	R0, #lo_addr(_fngr_pointer+26)
MOVT	R0, #hi_addr(_fngr_pointer+26)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,241 :: 		POINTER_DIRECTION = fngr_pointer.direction_desired;
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,243 :: 		poll_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,244 :: 		NVIC_IntDisable(IVT_INT_TIM1_TRG_COM_TIM11);                   // stop sampling with timer 11
MOVW	R0, #42
BL	_NVIC_IntDisable+0
;Input Capture Complete 5ch.c,247 :: 		UART1_Write_Text("\n\n************* PV stabilized at ");       // HOORAH
MOVW	R0, #lo_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr7_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,248 :: 		IntToStr(MPV, toStr);
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_toStr+0)
MOVT	R1, #hi_addr(_toStr+0)
BL	_IntToStr+0
;Input Capture Complete 5ch.c,249 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_toStr+0)
MOVT	R0, #hi_addr(_toStr+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,251 :: 		UART_Write_Text("\n\r***************** Setpoint was ");   // display it
MOVW	R0, #lo_addr(?lstr8_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr8_Input_32Capture_32Complete_325ch+0)
BL	_UART_Write_Text+0
;Input Capture Complete 5ch.c,252 :: 		IntToStr(setP, toStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_toStr+0)
MOVT	R1, #hi_addr(_toStr+0)
BL	_IntToStr+0
;Input Capture Complete 5ch.c,253 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_toStr+0)
MOVT	R0, #hi_addr(_toStr+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,254 :: 		UART1_Write_Text("\n\n\n\n\r");
MOVW	R0, #lo_addr(?lstr9_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr9_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,257 :: 		if(change_SP_flag == 0)   {
MOVW	R0, #lo_addr(_change_SP_flag+0)
MOVT	R0, #hi_addr(_change_SP_flag+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main9
;Input Capture Complete 5ch.c,258 :: 		setP = SP_LOW;                                          // Switch to low setpoint for next time
MOVW	R0, #lo_addr(_SP_LOW+0)
MOVT	R0, #hi_addr(_SP_LOW+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,259 :: 		change_SP_flag = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_change_SP_flag+0)
MOVT	R0, #hi_addr(_change_SP_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,260 :: 		}
IT	AL
BAL	L_main10
L_main9:
;Input Capture Complete 5ch.c,261 :: 		else if(change_SP_flag == 1)     {
MOVW	R0, #lo_addr(_change_SP_flag+0)
MOVT	R0, #hi_addr(_change_SP_flag+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main11
;Input Capture Complete 5ch.c,262 :: 		setP = SP_HIGH;                                          // Normally would switch to high setpoint for next time
MOVW	R0, #lo_addr(_SP_HIGH+0)
MOVT	R0, #hi_addr(_SP_HIGH+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,263 :: 		change_SP_flag = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_change_SP_flag+0)
MOVT	R0, #hi_addr(_change_SP_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,264 :: 		}
L_main11:
L_main10:
;Input Capture Complete 5ch.c,266 :: 		UART_Write_Text("\n***************** New setpoint = ");   // display it
MOVW	R0, #lo_addr(?lstr10_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr10_Input_32Capture_32Complete_325ch+0)
BL	_UART_Write_Text+0
;Input Capture Complete 5ch.c,267 :: 		IntToStr(setP, toStr);
MOVW	R0, #lo_addr(_setP+0)
MOVT	R0, #hi_addr(_setP+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_toStr+0)
MOVT	R1, #hi_addr(_toStr+0)
BL	_IntToStr+0
;Input Capture Complete 5ch.c,268 :: 		UART1_Write_Text(ToStr);
MOVW	R0, #lo_addr(_toStr+0)
MOVT	R0, #hi_addr(_toStr+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,269 :: 		UART1_Write_Text("\n\n\n\n\r");
MOVW	R0, #lo_addr(?lstr11_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr11_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,271 :: 		move_pointer_finger(&fngr_pointer, 100);                     // Restart the motor
MOVS	R1, #100
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_move_pointer_finger+0
;Input Capture Complete 5ch.c,272 :: 		NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);                  // Start sampling with timer 11 again
MOVW	R0, #42
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,273 :: 		sample_finger(&fngr_pointer);                                // Sample to get current position
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,274 :: 		while(fngr_pointer.position_actual >= FULLY_EXTENDED)   {
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
;Input Capture Complete 5ch.c,275 :: 		sample_finger(&fngr_pointer);                           // Make sure finger extends backward before resuming force control
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_sample_finger+0
;Input Capture Complete 5ch.c,276 :: 		MPV = fngr_pointer.tip_force;                           // Store the force value for comparison
MOVW	R0, #lo_addr(_fngr_pointer+76)
MOVT	R0, #hi_addr(_fngr_pointer+76)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_MPV+0)
MOVT	R0, #hi_addr(_MPV+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,277 :: 		}
IT	AL
BAL	L_main12
L_main13:
;Input Capture Complete 5ch.c,279 :: 		POINTER_DIRECTION = CONTRACT;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,280 :: 		}
L_main8:
;Input Capture Complete 5ch.c,281 :: 		}
L_main4:
;Input Capture Complete 5ch.c,283 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main63
MOVW	R0, #lo_addr(_TERMINAL_PRINT_THRESH+0)
MOVT	R0, #hi_addr(_TERMINAL_PRINT_THRESH+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_terminal_print_count+0)
MOVT	R0, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L__main62
L__main61:
;Input Capture Complete 5ch.c,285 :: 		print_finger_info(&fngr_pointer);                                 // Print statistics to terminal for each finger     - PUT BACK IN
MOVW	R0, #lo_addr(_fngr_pointer+0)
MOVT	R0, #hi_addr(_fngr_pointer+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,286 :: 		print_finger_info(&fngr_middle);
MOVW	R0, #lo_addr(_fngr_middle+0)
MOVT	R0, #hi_addr(_fngr_middle+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,287 :: 		print_finger_info(&fngr_ring);
MOVW	R0, #lo_addr(_fngr_ring+0)
MOVT	R0, #hi_addr(_fngr_ring+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,288 :: 		print_finger_info(&fngr_pinky);
MOVW	R0, #lo_addr(_fngr_pinky+0)
MOVT	R0, #hi_addr(_fngr_pinky+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,289 :: 		print_finger_info(&fngr_thumb);
MOVW	R0, #lo_addr(_fngr_thumb+0)
MOVT	R0, #hi_addr(_fngr_thumb+0)
BL	_print_finger_info+0
;Input Capture Complete 5ch.c,290 :: 		UART1_Write_Text("\n\n\n\n\n\n\n\r");                             //PUT BACK IN
MOVW	R0, #lo_addr(?lstr12_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr12_Input_32Capture_32Complete_325ch+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,283 :: 		if (poll_flag && (terminal_print_count >= TERMINAL_PRINT_THRESH)) {  // Set number of polling events has occured => Print statistics to terminal
L__main63:
L__main62:
;Input Capture Complete 5ch.c,292 :: 		}
IT	AL
BAL	L_main2
;Input Capture Complete 5ch.c,293 :: 		} // Main ends here
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Pcontrol_force:
;Input Capture Complete 5ch.c,302 :: 		unsigned int Pcontrol_force(struct finger *fngr, unsigned int SP, unsigned int MPV)
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
;Input Capture Complete 5ch.c,306 :: 		if((SP-MPV) < 0)                // moved past SP
SUB	R3, R6, R7
UXTH	R3, R3
CMP	R3, #0
IT	CS
BCS	L_Pcontrol_force17
;Input Capture Complete 5ch.c,307 :: 		fngr->direction_desired = EXTEND;              // Move back
ADDW	R4, R5, #26
MOVS	R3, #1
STRH	R3, [R4, #0]
IT	AL
BAL	L_Pcontrol_force18
L_Pcontrol_force17:
;Input Capture Complete 5ch.c,309 :: 		fngr->direction_desired = CONTRACT;         // Keep going
ADDW	R4, R5, #26
MOVS	R3, #0
STRH	R3, [R4, #0]
L_Pcontrol_force18:
;Input Capture Complete 5ch.c,311 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0)     {
MOVW	R3, #lo_addr(?lstr13_Input_32Capture_32Complete_325ch+0)
MOVT	R3, #hi_addr(?lstr13_Input_32Capture_32Complete_325ch+0)
MOV	R1, R3
MOV	R0, R5
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_Pcontrol_force19
;Input Capture Complete 5ch.c,312 :: 		POINTER_DIRECTION = fngr->direction_desired;
ADDW	R3, R5, #26
; fngr end address is: 20 (R5)
LDRH	R4, [R3, #0]
MOVW	R3, #lo_addr(GPIOE_ODR+0)
MOVT	R3, #hi_addr(GPIOE_ODR+0)
STR	R4, [R3, #0]
;Input Capture Complete 5ch.c,313 :: 		}
L_Pcontrol_force19:
;Input Capture Complete 5ch.c,315 :: 		duty_cycle = FORCE_K*abs(SP-MPV);    // proportional control
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
;Input Capture Complete 5ch.c,317 :: 		if(duty_cycle > 100)
CMP	R3, #100
IT	LS
BLS	L_Pcontrol_force20
;Input Capture Complete 5ch.c,318 :: 		duty_cycle = 100;       // cap duty cycle
MOVS	R0, #100
IT	AL
BAL	L_Pcontrol_force21
L_Pcontrol_force20:
;Input Capture Complete 5ch.c,319 :: 		else if(duty_cycle < 20)
CMP	R0, #20
IT	CS
BCS	L__Pcontrol_force60
;Input Capture Complete 5ch.c,320 :: 		duty_cycle = 20;       // boost duty cycle
MOVS	R0, #20
; duty_cycle end address is: 0 (R0)
IT	AL
BAL	L_Pcontrol_force22
L__Pcontrol_force60:
;Input Capture Complete 5ch.c,319 :: 		else if(duty_cycle < 20)
;Input Capture Complete 5ch.c,320 :: 		duty_cycle = 20;       // boost duty cycle
L_Pcontrol_force22:
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
L_Pcontrol_force21:
;Input Capture Complete 5ch.c,322 :: 		return duty_cycle;
; duty_cycle start address is: 0 (R0)
; duty_cycle end address is: 0 (R0)
;Input Capture Complete 5ch.c,323 :: 		}
L_end_Pcontrol_force:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Pcontrol_force
_move_pointer_finger:
;Input Capture Complete 5ch.c,327 :: 		void move_pointer_finger(struct finger *fngr, unsigned int duty_cycle)
; duty_cycle start address is: 4 (R1)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R4, R1
; duty_cycle end address is: 4 (R1)
; fngr end address is: 0 (R0)
; fngr start address is: 0 (R0)
; duty_cycle start address is: 16 (R4)
;Input Capture Complete 5ch.c,329 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0)
MOVW	R2, #lo_addr(?lstr14_Input_32Capture_32Complete_325ch+0)
MOVT	R2, #hi_addr(?lstr14_Input_32Capture_32Complete_325ch+0)
MOV	R1, R2
; fngr end address is: 0 (R0)
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_move_pointer_finger23
;Input Capture Complete 5ch.c,330 :: 		PWM_TIM1_Set_Duty(duty_cycle*(PWM_PERIOD_TIM1/100), _PWM_NON_INVERTED, POINTER_PWM);       // set new duty cycle
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
;Input Capture Complete 5ch.c,333 :: 		}
L_end_move_pointer_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _move_pointer_finger
_timer2_ISR:
;Input Capture Complete 5ch.c,339 :: 		void timer2_ISR() iv IVT_INT_TIM2 {
;Input Capture Complete 5ch.c,342 :: 		if(TIM2_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR24
;Input Capture Complete 5ch.c,343 :: 		TIM2_SR.UIF = 0;                                                        // Clear timer 2 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,344 :: 		tim2_overflow_count++;                                                  // Increment timer 2 overflow counter
MOVW	R1, #lo_addr(_tim2_overflow_count+0)
MOVT	R1, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,345 :: 		}
L_timer2_ISR24:
;Input Capture Complete 5ch.c,349 :: 		if (TIM2_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM2_SR+0)
MOVT	R1, #hi_addr(TIM2_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer2_ISR25
;Input Capture Complete 5ch.c,350 :: 		fngr_thumb.enc_start_time = fngr_thumb.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+36)
MOVT	R2, #hi_addr(_fngr_thumb+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+32)
MOVT	R0, #hi_addr(_fngr_thumb+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,351 :: 		fngr_thumb.enc_end_time = TIM2_CCR1;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,352 :: 		fngr_thumb.enc_overflow_start = fngr_thumb.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_thumb+48)
MOVT	R2, #hi_addr(_fngr_thumb+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_thumb+44)
MOVT	R0, #hi_addr(_fngr_thumb+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,353 :: 		fngr_thumb.enc_overflow_end = tim2_overflow_count;                      // Store number of timer 2 overflows for thumb
MOVW	R0, #lo_addr(_tim2_overflow_count+0)
MOVT	R0, #hi_addr(_tim2_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,354 :: 		fngr_thumb.enc_chan_b = THUMB_ENCODER_B;                               // Sample the second encoder channel (For direction)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_thumb+28)
MOVT	R0, #hi_addr(_fngr_thumb+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,355 :: 		fngr_thumb.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_thumb+16)
MOVT	R1, #hi_addr(_fngr_thumb+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,356 :: 		}
L_timer2_ISR25:
;Input Capture Complete 5ch.c,357 :: 		}
L_end_timer2_ISR:
BX	LR
; end of _timer2_ISR
_timer3_ISR:
;Input Capture Complete 5ch.c,361 :: 		void timer3_ISR() iv IVT_INT_TIM3 {
;Input Capture Complete 5ch.c,364 :: 		if(TIM3_SR.UIF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR26
;Input Capture Complete 5ch.c,365 :: 		TIM3_SR.UIF = 0;                                                        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,366 :: 		tim3_overflow_count++;                                                  // Increment timer 3 overflow counter
MOVW	R1, #lo_addr(_tim3_overflow_count+0)
MOVT	R1, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,367 :: 		}
L_timer3_ISR26:
;Input Capture Complete 5ch.c,370 :: 		if (TIM3_SR.CC1IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR27
;Input Capture Complete 5ch.c,371 :: 		fngr_pointer.enc_start_time = fngr_pointer.enc_end_time;                // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+36)
MOVT	R2, #hi_addr(_fngr_pointer+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+32)
MOVT	R0, #hi_addr(_fngr_pointer+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,372 :: 		fngr_pointer.enc_end_time = TIM3_CCR1;                                  // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR1+0)
MOVT	R0, #hi_addr(TIM3_CCR1+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,373 :: 		fngr_pointer.enc_overflow_start = fngr_pointer.enc_overflow_end;        // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pointer+48)
MOVT	R2, #hi_addr(_fngr_pointer+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pointer+44)
MOVT	R0, #hi_addr(_fngr_pointer+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,374 :: 		fngr_pointer.enc_overflow_end = tim3_overflow_count;                    // Store number of timer 3 overflows for Pointer finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,375 :: 		fngr_pointer.enc_chan_b = POINTER_ENCODER_B;                           // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pointer+28)
MOVT	R0, #hi_addr(_fngr_pointer+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,376 :: 		fngr_pointer.position_temp++;                                           // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pointer+16)
MOVT	R1, #hi_addr(_fngr_pointer+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,377 :: 		}
L_timer3_ISR27:
;Input Capture Complete 5ch.c,381 :: 		if (TIM3_SR.CC2IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR28
;Input Capture Complete 5ch.c,382 :: 		fngr_middle.enc_start_time = fngr_middle.enc_end_time;                  // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+36)
MOVT	R2, #hi_addr(_fngr_middle+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+32)
MOVT	R0, #hi_addr(_fngr_middle+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,383 :: 		fngr_middle.enc_end_time = TIM3_CCR2;                                   // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR2+0)
MOVT	R0, #hi_addr(TIM3_CCR2+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,384 :: 		fngr_middle.enc_overflow_start = fngr_middle.enc_overflow_end;          // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_middle+48)
MOVT	R2, #hi_addr(_fngr_middle+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_middle+44)
MOVT	R0, #hi_addr(_fngr_middle+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,385 :: 		fngr_middle.enc_overflow_end = tim3_overflow_count;                     // Store number of timer 3 overflows for Middle finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,386 :: 		fngr_middle.enc_chan_b = MIDDLE_ENCODER_B;                             // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_middle+28)
MOVT	R0, #hi_addr(_fngr_middle+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,387 :: 		fngr_middle.position_temp++;                                            // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_middle+16)
MOVT	R1, #hi_addr(_fngr_middle+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,388 :: 		}
L_timer3_ISR28:
;Input Capture Complete 5ch.c,391 :: 		if (TIM3_SR.CC3IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR29
;Input Capture Complete 5ch.c,392 :: 		fngr_ring.enc_start_time = fngr_ring.enc_end_time;                      // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+36)
MOVT	R2, #hi_addr(_fngr_ring+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+32)
MOVT	R0, #hi_addr(_fngr_ring+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,393 :: 		fngr_ring.enc_end_time = TIM3_CCR3;                                     // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR3+0)
MOVT	R0, #hi_addr(TIM3_CCR3+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,394 :: 		fngr_ring.enc_overflow_start = fngr_ring.enc_overflow_end;              // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_ring+48)
MOVT	R2, #hi_addr(_fngr_ring+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_ring+44)
MOVT	R0, #hi_addr(_fngr_ring+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,395 :: 		fngr_ring.enc_overflow_end = tim3_overflow_count;                       // Store number of timer 3 overflows for Ring finger
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,396 :: 		fngr_ring.enc_chan_b = RING_ENCODER_B;                                 // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_ring+28)
MOVT	R0, #hi_addr(_fngr_ring+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,397 :: 		fngr_ring.position_temp++;                                              // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_ring+16)
MOVT	R1, #hi_addr(_fngr_ring+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,398 :: 		}
L_timer3_ISR29:
;Input Capture Complete 5ch.c,401 :: 		if (TIM3_SR.CC4IF == 1) {
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_timer3_ISR30
;Input Capture Complete 5ch.c,402 :: 		fngr_pinky.enc_start_time = fngr_pinky.enc_end_time;                    // Store previous captured value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+36)
MOVT	R2, #hi_addr(_fngr_pinky+36)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+32)
MOVT	R0, #hi_addr(_fngr_pinky+32)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,403 :: 		fngr_pinky.enc_end_time = TIM3_CCR4;                                    // Read stored input capture time
MOVW	R0, #lo_addr(TIM3_CCR4+0)
MOVT	R0, #hi_addr(TIM3_CCR4+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,404 :: 		fngr_pinky.enc_overflow_start = fngr_pinky.enc_overflow_end;            // Store previous overflow value for next calculation
MOVW	R2, #lo_addr(_fngr_pinky+48)
MOVT	R2, #hi_addr(_fngr_pinky+48)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_fngr_pinky+44)
MOVT	R0, #hi_addr(_fngr_pinky+44)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,405 :: 		fngr_pinky.enc_overflow_end = tim3_overflow_count;                      // Store number of timer 3 overflows for Pinky
MOVW	R0, #lo_addr(_tim3_overflow_count+0)
MOVT	R0, #hi_addr(_tim3_overflow_count+0)
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Input Capture Complete 5ch.c,406 :: 		fngr_pinky.enc_chan_b = PINKY_ENCODER_B;                               // Sample the second encoder channel state (For direction)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_fngr_pinky+28)
MOVT	R0, #hi_addr(_fngr_pinky+28)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,407 :: 		fngr_pinky.position_temp++;                                             // Increment total input capture event counter
MOVW	R1, #lo_addr(_fngr_pinky+16)
MOVT	R1, #hi_addr(_fngr_pinky+16)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Input Capture Complete 5ch.c,408 :: 		}
L_timer3_ISR30:
;Input Capture Complete 5ch.c,409 :: 		}
L_end_timer3_ISR:
BX	LR
; end of _timer3_ISR
_timer11_ISR:
;Input Capture Complete 5ch.c,413 :: 		void timer11_ISR() iv IVT_INT_TIM1_TRG_COM_TIM11 {
;Input Capture Complete 5ch.c,415 :: 		TIM11_SR.UIF = 0;                                                           // Clear timer 11 interrupt flag
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_SR+0)
MOVT	R0, #hi_addr(TIM11_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,416 :: 		poll_flag = 1;                                                              // Set poll flag for main loop
MOVS	R1, #1
MOVW	R0, #lo_addr(_poll_flag+0)
MOVT	R0, #hi_addr(_poll_flag+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,417 :: 		terminal_print_count++;                                                     // Increment the debug print counter
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,418 :: 		}
L_end_timer11_ISR:
BX	LR
; end of _timer11_ISR
_init_GPIO:
;Input Capture Complete 5ch.c,425 :: 		void init_GPIO() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,430 :: 		_GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #4096
;Input Capture Complete 5ch.c,429 :: 		GPIO_Config(&GPIOE_BASE,                                                    // Pointer Encoder Channel B
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
;Input Capture Complete 5ch.c,430 :: 		_GPIO_PINMASK_12, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,433 :: 		_GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #2048
;Input Capture Complete 5ch.c,432 :: 		GPIO_Config(&GPIOA_BASE,                                                    // Middle Encoder Channel B
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
;Input Capture Complete 5ch.c,433 :: 		_GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,436 :: 		_GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #32768
;Input Capture Complete 5ch.c,435 :: 		GPIO_Config(&GPIOB_BASE,                                                    // Ring Encoder Channel B
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;Input Capture Complete 5ch.c,436 :: 		_GPIO_PINMASK_15, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,439 :: 		_GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #512
;Input Capture Complete 5ch.c,438 :: 		GPIO_Config(&GPIOD_BASE,                                                    // Pinky Encoder Channel B
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
;Input Capture Complete 5ch.c,439 :: 		_GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,442 :: 		_GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #322
MOVW	R1, #2048
;Input Capture Complete 5ch.c,441 :: 		GPIO_Config(&GPIOC_BASE,                                                    // Thumb Encoder Channel B
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;Input Capture Complete 5ch.c,442 :: 		_GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_INPUT | _GPIO_CFG_PULL_DOWN);
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,445 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);                         // Pointer direction
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,446 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_10);                         // Middle direction
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,447 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_13);                         // Ring direction
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,448 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_8);                          // Pinky direction
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,449 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12);                         // Thumb direction
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,450 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_0);                          // Motor enable: may not use in this test
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,453 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_1);                          // For awd debug test
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Input Capture Complete 5ch.c,454 :: 		}
L_end_init_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_GPIO
_init_pointer_PWM:
;Input Capture Complete 5ch.c,458 :: 		void init_pointer_PWM( ) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,460 :: 		PWM_PERIOD_TIM1 = PWM_TIM1_Init(PWM_FREQ_HZ);                                   // Set PWM base frequency to 100 Hz
MOVW	R0, #lo_addr(_PWM_FREQ_HZ+0)
MOVT	R0, #hi_addr(_PWM_FREQ_HZ+0)
LDR	R0, [R0, #0]
BL	_PWM_TIM1_Init+0
MOVW	R1, #lo_addr(_PWM_PERIOD_TIM1+0)
MOVT	R1, #hi_addr(_PWM_PERIOD_TIM1+0)
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,461 :: 		PWM_TIM1_Set_Duty(100*(PWM_PERIOD_TIM1/100), _PWM_NON_INVERTED, POINTER_PWM);    // Set 70% duty on Timer 1, channel 1
MOVS	R1, #100
UDIV	R1, R0, R1
UXTH	R1, R1
MOVS	R0, #100
MULS	R0, R1, R0
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM1_Set_Duty+0
;Input Capture Complete 5ch.c,462 :: 		PWM_TIM1_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM1_CH1_PE9);                 // Start PWM
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH1_PE9+0)
MOVS	R0, #0
BL	_PWM_TIM1_Start+0
;Input Capture Complete 5ch.c,463 :: 		}
L_end_init_pointer_PWM:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_pointer_PWM
_init_finger:
;Input Capture Complete 5ch.c,467 :: 		void init_finger(struct finger *fngr)
; fngr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R12, R0
; fngr end address is: 0 (R0)
; fngr start address is: 48 (R12)
;Input Capture Complete 5ch.c,469 :: 		fngr->position_actual = 0;
ADD	R2, R12, #20
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Complete 5ch.c,470 :: 		fngr->direction_desired = CONTRACT;
ADD	R2, R12, #26
MOVS	R1, #0
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,472 :: 		if (strcmp(fngr->name, "fngr_pointer") == 0) {
MOVW	R1, #lo_addr(?lstr15_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr15_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger31
;Input Capture Complete 5ch.c,473 :: 		POINTER_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,474 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_7);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #128
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,475 :: 		}
IT	AL
BAL	L_init_finger32
L_init_finger31:
;Input Capture Complete 5ch.c,476 :: 		else if (strcmp(fngr->name, "fngr_middle") == 0) {
; fngr start address is: 48 (R12)
MOVW	R1, #lo_addr(?lstr16_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr16_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger33
;Input Capture Complete 5ch.c,477 :: 		MIDDLE_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,478 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_9);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #512
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,479 :: 		}
IT	AL
BAL	L_init_finger34
L_init_finger33:
;Input Capture Complete 5ch.c,480 :: 		else if (strcmp(fngr->name, "fngr_ring") == 0) {
; fngr start address is: 48 (R12)
MOVW	R1, #lo_addr(?lstr17_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr17_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger35
;Input Capture Complete 5ch.c,481 :: 		RING_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,482 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_11);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #2048
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,483 :: 		}
IT	AL
BAL	L_init_finger36
L_init_finger35:
;Input Capture Complete 5ch.c,484 :: 		else if (strcmp(fngr->name, "fngr_pinky") == 0) {
; fngr start address is: 48 (R12)
MOVW	R1, #lo_addr(?lstr18_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr18_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger37
;Input Capture Complete 5ch.c,485 :: 		PINKY_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,486 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_13);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #8192
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,488 :: 		}
IT	AL
BAL	L_init_finger38
L_init_finger37:
;Input Capture Complete 5ch.c,489 :: 		else if (strcmp(fngr->name, "fngr_thumb") == 0) {
; fngr start address is: 48 (R12)
MOVW	R1, #lo_addr(?lstr19_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr19_Input_32Capture_32Complete_325ch+0)
MOV	R0, R12
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_init_finger39
;Input Capture Complete 5ch.c,490 :: 		THUMB_DIRECTION = fngr->direction_desired;
ADD	R1, R12, #26
; fngr end address is: 48 (R12)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
STR	R2, [R1, #0]
;Input Capture Complete 5ch.c,491 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);     // Set active ADC channel for Pointer finger   - 3 is not on the resources list but I know it works
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;Input Capture Complete 5ch.c,492 :: 		}
L_init_finger39:
L_init_finger38:
L_init_finger36:
L_init_finger34:
L_init_finger32:
;Input Capture Complete 5ch.c,493 :: 		}
L_end_init_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_finger
_init_UART:
;Input Capture Complete 5ch.c,497 :: 		void init_UART() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,499 :: 		UART1_Init(UART_BAUD_RATE);                                                 // Configure UART 1
MOV	R0, #115200
BL	_UART1_Init+0
;Input Capture Complete 5ch.c,500 :: 		Delay_ms(200);                                                              // Wait for UART to stabilize
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_init_UART40:
SUBS	R7, R7, #1
BNE	L_init_UART40
NOP
NOP
NOP
;Input Capture Complete 5ch.c,501 :: 		UART_Write_Text("\rUART Init Complete\r\n");                                // *** DEBUG *** Print test statement to terminal
MOVW	R0, #lo_addr(?lstr20_Input_32Capture_32Complete_325ch+0)
MOVT	R0, #hi_addr(?lstr20_Input_32Capture_32Complete_325ch+0)
BL	_UART_Write_Text+0
;Input Capture Complete 5ch.c,502 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_init_input_capture:
;Input Capture Complete 5ch.c,506 :: 		void init_input_capture() {
SUB	SP, SP, #24
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,510 :: 		RCC_APB1ENR.TIM3EN = 1;                                                     // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,511 :: 		TIM3_CR1.CEN = 0;                                                           // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,512 :: 		TIM3_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM3_CR2+0)
MOVT	R0, #hi_addr(TIM3_CR2+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,513 :: 		TIM3_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
MOVW	R0, #lo_addr(_ENCODER_TIM_PSC+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_PSC+0)
STR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,514 :: 		TIM3_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
MOVW	R0, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_ENCODER_TIM_RELOAD+0)
STR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,515 :: 		TIM3_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,519 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_6, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,520 :: 		TIM3_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,521 :: 		TIM3_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,522 :: 		TIM3_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,523 :: 		TIM3_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,524 :: 		TIM3_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,528 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_7, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,529 :: 		TIM3_CCMR1_Input |= 0x100;                                                  // Set capture channel 2 as input on TI2 (CC2S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,530 :: 		TIM3_CCER.CC2P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,531 :: 		TIM3_CCER.CC2NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,532 :: 		TIM3_CCER.CC2E = 1;                                                         // Enable capture on channel 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,533 :: 		TIM3_DIER.CC2IE = 1;                                                        // Enable interrupt on capture channel 2
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,537 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_8, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,538 :: 		TIM3_CCMR2_Input |= 0x01;                                                   // Set capture channel 3 as input on TI3 (CC3S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,539 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,540 :: 		TIM3_CCER.CC3NP = 0;                                                         // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,541 :: 		TIM3_CCER.CC3E = 1;                                                         // Enable capture on channel 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,542 :: 		TIM3_DIER.CC3IE = 1;                                                        // Enable interrupt on capture channel 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,546 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_4, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM3 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #32
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,547 :: 		TIM3_CCMR2_Input |= 0x100;                                                  // Set capture channel 4 as input on TI4 (CC4S = 01)
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(TIM3_CCMR2_Input+0)
MOVT	R0, #hi_addr(TIM3_CCMR2_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,548 :: 		TIM3_CCER.CC3P = 0;                                                         // Set capture on rising edge event
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,549 :: 		TIM3_CCER.CC3NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,550 :: 		TIM3_CCER.CC4E = 1;                                                         // Enable capture on channel 4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CCER+0)
MOVT	R0, #hi_addr(TIM3_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,551 :: 		TIM3_DIER.CC4IE = 1;                                                        // Enable interrupt on capture channel 4
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,555 :: 		RCC_APB1ENR.TIM2EN = 1;                                                     // Enable clock gating for timer module 5
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,556 :: 		TIM2_CR1.CEN = 0;                                                           // Disable timer/counter
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,557 :: 		TIM2_CR2.TI1S = 0;                                                          // TIM3_CH1 connected to TI1 Input (1 would be Ch1, 2, 3 XOR to TI1)
MOVW	R0, #lo_addr(TIM2_CR2+0)
MOVT	R0, #hi_addr(TIM2_CR2+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,558 :: 		TIM2_PSC = ENCODER_TIM_PSC;                                                 // Set timer 3 prescaler
LDR	R0, [SP, #20]
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,559 :: 		TIM2_ARR = ENCODER_TIM_RELOAD;                                              // Set timer 3 Auto Reload value
LDR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,560 :: 		TIM2_CR1 |= 0;                                                              // Set counter direction as upcounting (DIR bit)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,564 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_5, _GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_AF_TIM2 | _GPIO_CFG_PULL_DOWN);
MOVW	R2, #264
MOVT	R2, #16
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;Input Capture Complete 5ch.c,565 :: 		TIM2_CCMR1_Input |= 0x01;                                                   // Set capture channel 1 as input on TI1 (CC1S = 01)
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,566 :: 		TIM2_CCER.CC1P = 0;                                                         // Set capture on rising edge event
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,567 :: 		TIM2_CCER.CC1NP = 0;                                                        // ^^ Continuation of above
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,568 :: 		TIM2_CCER.CC1E = 1;                                                         // Enable capture on channel 1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CCER+0)
MOVT	R0, #hi_addr(TIM2_CCER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,569 :: 		TIM2_DIER.CC1IE = 1;                                                        // Enable interrupt on capture channel 1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,573 :: 		TIM3_DIER.UIE = 1;                                                          // Enable overflow interrupt Timer 3
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,574 :: 		TIM2_DIER.UIE = 1;                                                          // Enable overflow interrupt for Timer 2
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,575 :: 		NVIC_IntEnable(IVT_INT_TIM3);                                               // Enable timer 3 ISR
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,576 :: 		NVIC_IntEnable(IVT_INT_TIM2);                                               // Enable timer 2 ISR
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,577 :: 		TIM3_CR1.CEN = 1;                                                           // Enable timer 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,578 :: 		TIM2_CR1.CEN = 1;                                                           // Enable Timer 2
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,582 :: 		encoder_timer_period_ms = (long double) 1000.0 / (MCU_FREQUENCY / (ENCODER_TIM_PSC + 1));
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
;Input Capture Complete 5ch.c,583 :: 		}
L_end_init_input_capture:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _init_input_capture
_init_timer11:
;Input Capture Complete 5ch.c,588 :: 		void init_timer11() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,590 :: 		RCC_APB2ENR.TIM11EN = 1;                                                    // Enable clock for timer 11
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,591 :: 		TIM11_CR1.CEN = 0;                                                          // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,592 :: 		TIM11_PSC = SAMPLE_TIM_PSC;                                                 // Set timer 11 prescaler
MOVW	R0, #lo_addr(_SAMPLE_TIM_PSC+0)
MOVT	R0, #hi_addr(_SAMPLE_TIM_PSC+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM11_PSC+0)
MOVT	R0, #hi_addr(TIM11_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,593 :: 		TIM11_ARR = SAMPLE_TIM_RELOAD;                                              // Set timer 11 overflow value
MOVW	R0, #lo_addr(_SAMPLE_TIM_RELOAD+0)
MOVT	R0, #hi_addr(_SAMPLE_TIM_RELOAD+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM11_ARR+0)
MOVT	R0, #hi_addr(TIM11_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,594 :: 		NVIC_IntEnable(IVT_INT_TIM1_TRG_COM_TIM11);                                 // Enable timer 11 interrupt
MOVW	R0, #42
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,595 :: 		TIM11_DIER.UIE = 1;                                                         // Timer 11 update interrupt enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM11_DIER+0)
MOVT	R0, #hi_addr(TIM11_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,596 :: 		TIM11_CR1.CEN = 1;                                                          // Enable timer/counter
MOVW	R0, #lo_addr(TIM11_CR1+0)
MOVT	R0, #hi_addr(TIM11_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,597 :: 		}
L_end_init_timer11:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_timer11
_sample_finger:
;Input Capture Complete 5ch.c,604 :: 		void sample_finger( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R9, R0
; fngr end address is: 0 (R0)
; fngr start address is: 36 (R9)
;Input Capture Complete 5ch.c,611 :: 		fngr->enc_overflow_delta = (unsigned long) fngr->enc_overflow_end - fngr->enc_overflow_start;
ADD	R3, R9, #52
ADD	R1, R9, #48
LDR	R2, [R1, #0]
ADD	R1, R9, #44
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,614 :: 		fngr->enc_overflow_ticks = (unsigned long) fngr->enc_overflow_delta * (ENCODER_TIM_RELOAD - 3);
ADD	R3, R9, #56
ADD	R1, R9, #52
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_ENCODER_TIM_RELOAD+0)
MOVT	R1, #hi_addr(_ENCODER_TIM_RELOAD+0)
LDR	R1, [R1, #0]
SUBS	R1, R1, #3
MULS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,617 :: 		fngr->enc_delta_ticks = (unsigned long) fngr->enc_end_time - fngr->enc_start_time;
ADD	R3, R9, #40
ADD	R1, R9, #36
LDR	R2, [R1, #0]
ADD	R1, R9, #32
LDR	R1, [R1, #0]
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,620 :: 		fngr->enc_total_ticks = (unsigned long) fngr->enc_overflow_ticks + fngr->enc_delta_ticks;
ADD	R3, R9, #60
ADD	R1, R9, #56
LDR	R2, [R1, #0]
ADD	R1, R9, #40
LDR	R1, [R1, #0]
ADDS	R1, R2, R1
STR	R1, [R3, #0]
;Input Capture Complete 5ch.c,623 :: 		fngr->input_sig_period = (long double) fngr->enc_total_ticks * encoder_timer_period_ms;
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
;Input Capture Complete 5ch.c,626 :: 		fngr->input_sig_frequency = (unsigned long) 1000.0 / fngr->input_sig_period;
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
;Input Capture Complete 5ch.c,627 :: 		if (fngr->input_sig_frequency > 20000.0)                                    // NEW: Handles startup error
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
BLE	L_sample_finger42
;Input Capture Complete 5ch.c,628 :: 		fngr->input_sig_frequency = 0;
ADD	R2, R9, #64
MOVS	R1, #0
STR	R1, [R2, #0]
L_sample_finger42:
;Input Capture Complete 5ch.c,631 :: 		if (fngr->enc_chan_b == 1) {                                                // Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_sample_finger43
;Input Capture Complete 5ch.c,632 :: 		fngr->direction_actual = CONTRACT;
ADD	R2, R9, #24
MOVS	R1, #0
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,633 :: 		fngr->position_actual += (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
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
;Input Capture Complete 5ch.c,634 :: 		}
IT	AL
BAL	L_sample_finger44
L_sample_finger43:
;Input Capture Complete 5ch.c,636 :: 		else if (fngr->enc_chan_b == 0) {                                           // Counter Clockwise
ADD	R1, R9, #28
LDRH	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_sample_finger45
;Input Capture Complete 5ch.c,637 :: 		fngr->direction_actual = EXTEND;
ADD	R2, R9, #24
MOVS	R1, #1
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,638 :: 		fngr->position_actual -= (fngr->position_temp / NORMALIZATION_CONSTANT);                       // Calculate new position
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
;Input Capture Complete 5ch.c,639 :: 		}
IT	AL
BAL	L_sample_finger46
L_sample_finger45:
;Input Capture Complete 5ch.c,642 :: 		fngr->direction_actual = 7;
ADD	R2, R9, #24
MOVS	R1, #7
STRH	R1, [R2, #0]
;Input Capture Complete 5ch.c,643 :: 		}
L_sample_finger46:
L_sample_finger44:
;Input Capture Complete 5ch.c,656 :: 		fngr->position_temp = 0;
ADD	R2, R9, #16
MOVS	R1, #0
STR	R1, [R2, #0]
;Input Capture Complete 5ch.c,663 :: 		if(strcmp(fngr->name, "fngr_pointer") == 0)   {
MOVW	R1, #lo_addr(?lstr21_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr21_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger47
;Input Capture Complete 5ch.c,664 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_POINTER_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #7
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,665 :: 		}
IT	AL
BAL	L_sample_finger48
L_sample_finger47:
;Input Capture Complete 5ch.c,666 :: 		else if (strcmp(fngr->name, "fngr_middle") == 0) {
; fngr start address is: 36 (R9)
MOVW	R1, #lo_addr(?lstr22_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr22_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger49
;Input Capture Complete 5ch.c,667 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_MIDDLE_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #9
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,668 :: 		}
IT	AL
BAL	L_sample_finger50
L_sample_finger49:
;Input Capture Complete 5ch.c,669 :: 		else if (strcmp(fngr->name, "fngr_ring") == 0) {
; fngr start address is: 36 (R9)
MOVW	R1, #lo_addr(?lstr23_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr23_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger51
;Input Capture Complete 5ch.c,670 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_RING_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #11
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,671 :: 		}
IT	AL
BAL	L_sample_finger52
L_sample_finger51:
;Input Capture Complete 5ch.c,672 :: 		else if (strcmp(fngr->name, "fngr_pinky") == 0) {
; fngr start address is: 36 (R9)
MOVW	R1, #lo_addr(?lstr24_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr24_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger53
;Input Capture Complete 5ch.c,673 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_PINKY_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #13
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,674 :: 		}
IT	AL
BAL	L_sample_finger54
L_sample_finger53:
;Input Capture Complete 5ch.c,675 :: 		else if (strcmp(fngr->name, "fngr_thumb") == 0) {
; fngr start address is: 36 (R9)
MOVW	R1, #lo_addr(?lstr25_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr25_Input_32Capture_32Complete_325ch+0)
MOV	R0, R9
BL	_strcmp+0
CMP	R0, #0
IT	NE
BNE	L_sample_finger55
;Input Capture Complete 5ch.c,676 :: 		fngr->tip_force = ADC1_Get_Sample(CHANNEL_ADC_THUMB_TIP_FORCE);
ADD	R1, R9, #76
; fngr end address is: 36 (R9)
STR	R1, [SP, #4]
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;Input Capture Complete 5ch.c,677 :: 		}
L_sample_finger55:
L_sample_finger54:
L_sample_finger52:
L_sample_finger50:
L_sample_finger48:
;Input Capture Complete 5ch.c,678 :: 		}
L_end_sample_finger:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _sample_finger
_print_finger_info:
;Input Capture Complete 5ch.c,682 :: 		void print_finger_info( struct finger *fngr) {
; fngr start address is: 0 (R0)
SUB	SP, SP, #36
STR	LR, [SP, #0]
MOV	R8, R0
; fngr end address is: 0 (R0)
; fngr start address is: 32 (R8)
;Input Capture Complete 5ch.c,689 :: 		UART1_Write_Text("\n\rFinger Name: ");                                      //Print name of current finger to terminal
MOVW	R1, #lo_addr(?lstr26_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr26_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,690 :: 		UART1_Write_Text(fngr->name);
MOV	R0, R8
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,691 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr27_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr27_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,693 :: 		LongWordToStr(fngr->input_sig_frequency, frequency_text);                   // Print input capture signal frequency to terminal
ADD	R2, SP, #4
ADD	R1, R8, #64
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongWordToStr+0
;Input Capture Complete 5ch.c,694 :: 		UART1_Write_Text("Frequency of incoming signal (Hz): ");
MOVW	R1, #lo_addr(?lstr28_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr28_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,695 :: 		UART1_Write_Text(frequency_text);
ADD	R1, SP, #4
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,696 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr29_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr29_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,699 :: 		UART1_Write_Text("Direction of movement:             ");
MOVW	R1, #lo_addr(?lstr30_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr30_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,700 :: 		if(fngr->direction_actual == EXTEND)
ADD	R1, R8, #24
LDRH	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_print_finger_info56
;Input Capture Complete 5ch.c,701 :: 		UART1_Write_Text("EXTEND ");
MOVW	R1, #lo_addr(?lstr31_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr31_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
IT	AL
BAL	L_print_finger_info57
L_print_finger_info56:
;Input Capture Complete 5ch.c,703 :: 		UART1_Write_Text("CONTRACT ");
MOVW	R1, #lo_addr(?lstr32_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr32_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
L_print_finger_info57:
;Input Capture Complete 5ch.c,705 :: 		UART1_Write_Text("\n\r");
MOVW	R1, #lo_addr(?lstr33_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr33_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,707 :: 		LongToStr(fngr->position_actual, position_text);                            // Print total number of input events (position) to terminal
ADD	R2, SP, #19
ADD	R1, R8, #20
LDR	R1, [R1, #0]
MOV	R0, R1
MOV	R1, R2
BL	_LongToStr+0
;Input Capture Complete 5ch.c,708 :: 		UART1_Write_Text("Position of finger:                ");
MOVW	R1, #lo_addr(?lstr34_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr34_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,709 :: 		UART1_Write_Text(position_text);
ADD	R1, SP, #19
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,710 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr35_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr35_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,712 :: 		IntToStr(fngr->tip_force, toStr);                            // Print Flexiforce value (16-bit unsigned) to terminal
ADD	R1, R8, #76
; fngr end address is: 32 (R8)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
MOVW	R1, #lo_addr(_toStr+0)
MOVT	R1, #hi_addr(_toStr+0)
BL	_IntToStr+0
;Input Capture Complete 5ch.c,713 :: 		UART1_Write_Text("Force applied to tip of finger:                ");
MOVW	R1, #lo_addr(?lstr36_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr36_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,714 :: 		UART1_Write_Text(toStr);
MOVW	R0, #lo_addr(_toStr+0)
MOVT	R0, #hi_addr(_toStr+0)
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,715 :: 		UART1_Write_Text("\n\n\n\r");
MOVW	R1, #lo_addr(?lstr37_Input_32Capture_32Complete_325ch+0)
MOVT	R1, #hi_addr(?lstr37_Input_32Capture_32Complete_325ch+0)
MOV	R0, R1
BL	_UART1_Write_Text+0
;Input Capture Complete 5ch.c,717 :: 		terminal_print_count = 0;                                                   // Reset counter for terminal printing
MOVS	R2, #0
MOVW	R1, #lo_addr(_terminal_print_count+0)
MOVT	R1, #hi_addr(_terminal_print_count+0)
STRH	R2, [R1, #0]
;Input Capture Complete 5ch.c,718 :: 		}
L_end_print_finger_info:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _print_finger_info
_ADC_AWD:
;Input Capture Complete 5ch.c,724 :: 		void ADC_AWD() iv IVT_INT_ADC ics ICS_AUTO {
;Input Capture Complete 5ch.c,725 :: 		ADC1_CR1bits.AWDIE = 0;       // Disabling analog interrupt (disable)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,726 :: 		ADC1_SRbits.AWD = 0;          // Reset status bit
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,727 :: 		if(ADC1_HTR <= 1000) {
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
LDR	R0, [R0, #0]
CMP	R0, #1000
IT	HI
BHI	L_ADC_AWD58
;Input Capture Complete 5ch.c,728 :: 		TIM5_SR.UIF = 0;        // Clear timer 3 interrupt bit
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_SR+0)
MOVT	R0, #hi_addr(TIM5_SR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,729 :: 		TIM5_CNT = 0x00;        // Reset timer value to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM5_CNT+0)
MOVT	R0, #hi_addr(TIM5_CNT+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,730 :: 		ADC1_HTR = high_level2; // Set high threshold to MAX
MOVW	R1, #4095
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,731 :: 		ADC1_LTR = low_level2;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,732 :: 		TIM5_DIER.UIE = 1;      // CC1 Update Interrupt Enable
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,733 :: 		}else {
IT	AL
BAL	L_ADC_AWD59
L_ADC_AWD58:
;Input Capture Complete 5ch.c,734 :: 		TIM5_DIER.UIE = 0;      // Disable timer interrupt
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,735 :: 		ADC1_HTR = high_level;  // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,736 :: 		ADC1_LTR = low_level;   // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,737 :: 		}
L_ADC_AWD59:
;Input Capture Complete 5ch.c,738 :: 		ADC1_CR1bits.AWDIE = 1;       //Enable analog interrupt (enabled)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,739 :: 		}
L_end_ADC_AWD:
BX	LR
; end of _ADC_AWD
_InitTimer5:
;Input Capture Complete 5ch.c,743 :: 		void InitTimer5(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Input Capture Complete 5ch.c,744 :: 		RCC_APB1ENR.TIM5EN = 1;        // Enable clock gating for timer module 3
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,745 :: 		TIM5_CR1.CEN = 0;              // Disable timer/counter
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,746 :: 		TIM5_PSC = 7874;               // Set timer 3 prescaler (need to determine value)
MOVW	R1, #7874
MOVW	R0, #lo_addr(TIM5_PSC+0)
MOVT	R0, #hi_addr(TIM5_PSC+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,747 :: 		TIM5_ARR = 63999;              // Set timer 3 overflow value at max
MOVW	R1, #63999
MOVW	R0, #lo_addr(TIM5_ARR+0)
MOVT	R0, #hi_addr(TIM5_ARR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,748 :: 		NVIC_IntEnable(IVT_INT_TIM5);  // Enable timer 3 interrupt
MOVW	R0, #66
BL	_NVIC_IntEnable+0
;Input Capture Complete 5ch.c,749 :: 		TIM5_CR1.CEN = 1;              // Enable timer/counter
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM5_CR1+0)
MOVT	R0, #hi_addr(TIM5_CR1+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,750 :: 		}
L_end_InitTimer5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer5
_Timer5_interrupt:
;Input Capture Complete 5ch.c,753 :: 		void Timer5_interrupt() iv IVT_INT_TIM5 { // Interrupt handler if 6 s have past
;Input Capture Complete 5ch.c,754 :: 		TIM5_SR.UIF = 0;                     // Clear timer 3 interrupt bit
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM5_SR+0)
MOVT	R0, #hi_addr(TIM5_SR+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,755 :: 		ADC1_HTR = high_level;               // Set high threshold to 400
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,756 :: 		ADC1_LTR = low_level;                // Set low threshold to 0
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,757 :: 		TIM5_DIER.UIE = 0;                   // Disable timer interrupt
MOVW	R0, #lo_addr(TIM5_DIER+0)
MOVT	R0, #hi_addr(TIM5_DIER+0)
STR	R2, [R0, #0]
;Input Capture Complete 5ch.c,758 :: 		analogGo = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_analogGo+0)
MOVT	R0, #hi_addr(_analogGo+0)
STRH	R1, [R0, #0]
;Input Capture Complete 5ch.c,759 :: 		GPIOD_ODR.B1 = 1;                              //DEBUG
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Input Capture Complete 5ch.c,760 :: 		}
L_end_Timer5_interrupt:
BX	LR
; end of _Timer5_interrupt
