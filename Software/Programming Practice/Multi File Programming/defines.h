#ifndef DEFINES_H
#define DEFINES_H

//Mapping new names to port/pins

//EMG 
#define PIN_EMG_OVERRIDE							GPIO*							//Input  - EMG Signal override button 
#define PIN_EMG_ACTIVE_LED							GPIO*							//Output - Lit during EMG timer execution 
#define CHANNEL_EMG_ADC								_ADC_CHANNEL_?					//Chan	 - ADC channel used for EMG 
#define MASK_AWD_PORT_BASE							GPIO?_BASE 						//Mask   - Base port used for the AWD ADC pin 
#define MASK_AWD_INPUT_PIN							_GPIO_PINMASK_?					//Mask   - Pin mask for AWD ADC pin 
#define CHANNEL_ADC_EMG_SIGNAL						?								//Chan   - ADC channel number used for EMG signal input 


//UART
#define WIRED_UART_RX								GPIO*							//Input  - UART1 Recieve pin (Wired FTDI)
#define WIRED_UARD_TX								GPIO*							//Output - UART1 Transmit pin (Wired FTDI)
#define BLUETOOTH_UART_RX							GPIO*							//Input  - UART2 Recieve pin (Bluetooth)
#define BLUETOOTH_UART_TX							GPIO*							//Output - UART2 Transmit pin (Bluetooth)


//General MCU I/O
#define PIN_MOTOR_ENABLE							GPIO*							//Output - Enable signal for ALL non-MCU IC's 
#define MASK_MOTOR_ENABLE_PIN						_GPIO_*							//Mask   - Mask value for motor enable pin 


//User I/O 
#define PIN_MODE_GRAB_BUTTON						GPIO*							//Input  - User button to enable Grab mode 
#define PIN_MODE_GRAB_LED							GPIO*							//Output - LED to indicate hand is in Grab mode 
#define PIN_MODE_PINCH_BUTTON						GPIO*							//Input  - User button to enable Pinch mode 
#define PIN_MODE_PINCH_LED							GPIO*							//Output - LED to indicate hand is in Pinch mode 
#define PIN_MODE_POINT_BUTTON						GPIO*							//Input  - User button to enable Point mode 
#define PIN_MODE_POINT_LED							GPIO*							//Output - LED to indicate hand is in Point mode 
#define PIN_MODE_SHAKE_BUTTON						GPIO*							//Input  - User button to enable Hand Shake mode 
#define PIN_MODE_SHAKE_LED							GPIO*							//Output - LED to indicate hand is in Hand Shake mode 
#define PIN_MASTER_RESET_BUTTON						GPIO*							//Input  - Wakeup pin????? 
#define PIN_HAND_RUNNING_LED						GPIO*							//Output - Active whenever hand is actively moving 
#define PIN_LOW_BATTERY_LED							GPIO*							//Output - Active whenever battery level is low      ??Maybe??

//****Fingers****
//Pointer - Motor 3
#define PIN_POINTER_DIRECTION						GPIO*							//Output - Direction pin for Pointer motor driver 
#define PIN_POINTER_LIMIT							GPIO*							//Input  - Limit (home) switch for Pointer 
#define PIN_POINTER_ISENSE							GPIO*							//Input  - Force sensing via motor current from Pointer motor driver 
#define PIN_POINTER_TIP_FORCE						GPIO*							//Input  - Flexiforce sensor on tip of Pointer 
#define PIN_POINTER_ENCODER_A						GPIO*							//Input  - Quadrature encoder channel A for Pointer motor 
#define PIN_POINTER_ENCODER_B						GPIO*							//Input  - Quadrature encoder channel B for Pointer motor 
#define MASK_POINTER_PORT_BASE						GPIO?_BASE						//Mask 	 - Base port address for pointer finger pins
#define MASK_POINTER_DIR_PIN						_GPIO_PINMASK_??				//Mask	 - Pin Mask for pointer finger direction pin 
#define CHANNEL_POINTER_PWM							_PWM_CHANNEL?					//Chan   - PWM Channel used for pointer finger 
#define PIN_POINTER_PWM								_GPIO_MODULE_TIM?_CH?_PE?		//Output - PWM pin for Pointer motor driver
#define COUNTER_POINTER_POSITION					?????							//?????  - Address of the position counter for the pointer finger
#define CHANNEL_ADC_POINTER_TIP_FORCE				?								//Chan	 - ADC channel number used for FlexiForce sensor on pointer finger
#define CHANNEL_ADC_POINTER_ISENSE					?								//Chan   - ADC channel number used for current sense on pointer finger

//Middle - Motor 4
#define PIN_MIDDLE_DIRECTION						GPIO*							//Output - Direction pin for middle finger motor driver 
#define PIN_MIDDLE_LIMIT							GPIO*							//Input  - Limit (home) switch for middle finger 
#define PIN_MIDDLE_ISENSE							GPIO*							//Input  - Force sensing via motor current from middle finger motor driver 
#define PIN_MIDDLE_TIP_FORCE						GPIO*							//Input  - Flexiforce sensor on tip of middle finger 
#define PIN_MIDDLE_ENCODER_A						GPIO*							//Input  - Quadrature encoder channel A for middle finger motor 
#define PIN_MIDDLE_ENCODER_B						GPIO*							//Input  - Quadrature encoder channel B for middle finger motor 
#define MASK_MIDDLE_PORT_BASE						GPIO?_BASE						//Mask 	 - Base port address for middle finger pins
#define MASK_MIDDLE_DIR_PIN							_GPIO_PINMASK_??				//Mask	 - Pin Mask for middle finger direction pin 
#define CHANNEL_MIDDLE_PWM							_PWM_CHANNEL?					//Chan   - PWM Channel used for middle finger 
#define PIN_MIDDLE_PWM								_GPIO_MODULE_TIM?_CH?_PE?		//Output - PWM pin for middle finger motor driver
#define COUNTER_MIDDLE_POSITION						?????							//?????  - Address of the position counter for the middle finger
#define CHANNEL_ADC_MIDDLE_TIP_FORCE				?								//Chan	 - ADC channel number used for FlexiForce sensor on middle finger
#define CHANNEL_ADC_MIDDLE_ISENSE					?								//Chan   - ADC channel number used for current sense on middle finger


//Ring - Motor 5
#define PIN_RING_DIRECTION							GPIO*							//Output - Direction pin for ring finger motor driver 
#define PIN_RING_LIMIT								GPIO*							//Input  - Limit (home) switch for ring finger 
#define PIN_RING_ISENSE								GPIO*							//Input  - Force sensing via motor current from ring finger motor driver 
#define PIN_RING_TIP_FORCE							GPIO*							//Input  - Flexiforce sensor on tip of ring finger 
#define PIN_RING_ENCODER_A							GPIO*							//Input  - Quadrature encoder channel A for ring finger motor 
#define PIN_RING_ENCODER_B							GPIO*							//Input  - Quadrature encoder channel B for ring finger motor 
#define MASK_RING_PORT_BASE							GPIO?_BASE						//Mask 	 - Base port address for ring finger pins
#define MASK_RING_DIR_PIN							_GPIO_PINMASK_??				//Mask	 - Pin Mask for ring finger direction pin 
#define CHANNEL_RING_PWM							_PWM_CHANNEL?					//Chan   - PWM Channel used for ring finger 
#define PIN_RING_PWM								_GPIO_MODULE_TIM?_CH?_PE?		//Output - PWM pin for ring finger motor driver
#define COUNTER_RING_POSITION						?????							//?????  - Address of the position counter for the ring finger 
#define CHANNEL_ADC_RING_TIP_FORCE					?								//Chan	 - ADC channel number used for FlexiForce sensor on ring finger
#define CHANNEL_ADC_RING_ISENSE						?								//Chan   - ADC channel number used for current sense on ring finger


//Pinky - Motor 6
#define PIN_PINKY_DIRECTION							GPIO*							//Output - Direction pin for pinky motor driver 
#define PIN_PINKY_LIMIT								GPIO*							//Input  - Limit (home) switch for pinky  
#define PIN_PINKY_ISENSE							GPIO*							//Input  - Force sensing via motor current from pinky motor driver 
#define PIN_PINKY_TIP_FORCE							GPIO*							//Input  - Flexiforce sensor on tip of pinky  
#define PIN_PINKY_ENCODER_A							GPIO*							//Input  - Quadrature encoder channel A for pinky motor 
#define PIN_PINKY_ENCODER_B							GPIO*							//Input  - Quadrature encoder channel B for pinky motor 
#define MASK_PINKY_PORT_BASE						GPIO?_BASE						//Mask 	 - Base port address for pinky pins
#define MASK_PINKY_DIR_PIN							_GPIO_PINMASK_??				//Mask	 - Pin Mask for pinky direction pin 
#define CHANNEL_PINKY_PWM							_PWM_CHANNEL?					//Chan   - PWM Channel used for pinky  
#define PIN_PINKY_PWM								_GPIO_MODULE_TIM?_CH?_PE?		//Output - PWM pin for pinky motor driver
#define COUNTER_PINKY_POSITION						?????							//?????  - Address of the position counter for the pinky  
#define CHANNEL_ADC_PINKY_TIP_FORCE					?								//Chan	 - ADC channel number used for FlexiForce sensor on pinky
#define CHANNEL_ADC_PINKY_ISENSE					?								//Chan   - ADC channel number used for current sense on pinky


//Thumb - Motor 1
#define PIN_THUMB_DIRECTION							GPIO*							//Output - Direction pin for thumb motor driver 
#define PIN_THUMB_LIMIT								GPIO*							//Input  - Limit (home) switch for thumb 
#define PIN_THUMB_ISENSE							GPIO*							//Input  - Force sensing via motor current from thumb motor driver 
#define PIN_THUMB_TIP_FORCE							GPIO*							//Input  - Flexiforce sensor on tip of thumb 
#define PIN_THUMB_ENCODER_A							GPIO*							//Input  - Quadrature encoder channel A for thumb motor 
#define PIN_THUMB_ENCODER_B							GPIO*							//Input  - Quadrature encoder channel B for thumb motor 
#define MASK_THUMB_PORT_BASE						GPIO?_BASE						//Mask 	 - Base port address for thumb pins
#define MASK_THUMB_DIR_PIN							_GPIO_PINMASK_??				//Mask	 - Pin Mask for thumb direction pin 
#define CHANNEL_THUMB_PWM							_PWM_CHANNEL?					//Chan   - PWM Channel used for thumb 
#define PIN_THUMB_PWM								_GPIO_MODULE_TIM?_CH?_PE?		//Output - PWM pin for thumb motor driver
#define COUNTER_THUMB_POSITION						?????							//?????  - Address of the position counter for the thumb 
#define CHANNEL_ADC_THUMB_TIP_FORCE					?								//Chan	 - ADC channel number used for FlexiForce sensor on thumb
#define CHANNEL_ADC_THUMB_ISENSE					?								//Chan   - ADC channel number used for current sense on thumb


//Thumb Articulation - Motor 2       ******UNKNOWN AT THIS POINT*****
#define PIN_THUMB_ARTIC_DIRECTION					GPIO*							//Output - Direction pin for thumb articulation motor driver 
#define PIN_THUMB_ARTIC_LIMIT						GPIO*							//Input  - Limit (home) switch for thumb articulation
#define PIN_THUMB_ARTIC_ISENSE						GPIO*							//Input  - Force sensing via motor current from thumb articulation motor driver 
#define PIN_THUMB_ARTIC_TIP_FORCE					GPIO*							//Input  - Flexiforce sensor on tip of thumb articulation 
#define PIN_THUMB_ARTIC_ENCODER_A					GPIO*							//Input  - Quadrature encoder channel A for thumb articulation motor 
#define PIN_THUMB_ARTIC_ENCODER_B					GPIO*							//Input  - Quadrature encoder channel B for thumb articulation motor 
#define MASK_THUMB_ARTIC_PORT_BASE					GPIO?_BASE						//Mask 	 - Base port address for thumb articulation pins
#define MASK_THUMB_ARTIC_DIR_PIN					_GPIO_PINMASK_??				//Mask	 - Pin Mask for thumb articulation direction pin 
#define CHANNEL_THUMB_ARTIC_PWM						_PWM_CHANNEL?					//Chan   - PWM Channel used for thumb articulation 
#define PIN_THUMB_ARTIC_PWM							_GPIO_MODULE_TIM?_CH?_PE?		//Output - PWM pin for thumb articulation motor driver
#define COUNTER_THUMB_ARTIC_POSITION				?????							//?????  - Address of the position counter for the thumb articulation
#define CHANNEL_ADC_THUMB_ARTIC_TIP_FORCE			?								//Chan	 - ADC channel number used for FlexiForce sensor on thumb articulation
#define CHANNEL_ADC_THUMB_ARTIC_ISENSE				?								//Chan   - ADC channel number used for current sense on thumb articulation




























