//Mapping new names to port/pins

//EMG 
#define emgSignal					GPIO*							//Input  - Processed EMG Signal Input 
#define emgOverridePin				GPIO*							//Input  - EMG Signal override button 
#define emgActiveLED				GPIO*							//Output - Lit during EMG timer execution 


//UART
#define WiredUartRx					GPIO*							//Input  - UART1 Recieve pin (Wired FTDI)
#define WiredUartTx					GPIO*							//Output - UART1 Transmit pin (Wired FTDI)
#define BluetoothRx					GPIO*							//Input  - UART2 Recieve pin (Bluetooth)
#define BluetoothTx					GPIO*							//Output - UART2 Transmit pin (Bluetooth)


//General MCU I/O
#define PinMotorEnable				GPIO*							//Output - Enable signal for ALL non-MCU IC's 
#define motorEnablePinMask			_GPIO_*							//Mask   - Mask value for motor enable pin 


//User I/O 
#define PinModeGrabButton			GPIO*							//Input  - User button to enable Grab mode 
#define PinModeGrabLED				GPIO*							//Output - LED to indicate hand is in Grab mode 
#define PinModePinchButton			GPIO*							//Input  - User button to enable Pinch mode 
#define PinModePinchLED				GPIO*							//Output - LED to indicate hand is in Pinch mode 
#define PinModePointButton			GPIO*							//Input  - User button to enable Point mode 
#define PinModePointLED				GPIO*							//Output - LED to indicate hand is in Point mode 
#define PinModeShakeButton			GPIO*							//Input  - User button to enable Hand Shake mode 
#define PinModeShakeLED				GPIO*							//Output - LED to indicate hand is in Hand Shake mode 
#define PinMasterResetButton		GPIO*							//Input  - Wakeup pin????? 
#define PinHandRunningLED			GPIO*							//Output - Active whenever hand is actively moving 
#define PinLowBatteryLED			GPIO*							//Output - Active whenever battery level is low      ??Maybe??

//****Fingers****
//Pointer - Motor 3
#define PinPointerDirection			GPIO*							//Output - Direction pin for Pointer motor driver 
#define PinPointerLimit				GPIO*							//Input  - Limit (home) switch for Pointer 
#define PinPointerISense			GPIO*							//Input  - Force sensing via motor current from Pointer motor driver 
#define PinPointerTipForce			GPIO*							//Input  - Flexiforce sensor on tip of Pointer 
#define PinPointerEncoderA			GPIO*							//Input  - Quadrature encoder channel A for Pointer motor 
#define PinPointerEncoderB			GPIO*							//Input  - Quadrature encoder channel B for Pointer motor 
#define MaskPointerPortBase			GPIO?_BASE						//Mask 	 - Base port address for pointer finger pins
#define MaskPointerDirPin			_GPIO_PINMASK_??				//Mask	 - Pin Mask for pointer finger direction pin 
#define ChannelPointerPWM			_PWM_CHANNEL?					//Chan   - PWM Channel used for pointer finger 
#define PinPointerPWM				_GPIO_MODULE_TIM?_CH?_PE?		//Output - PWM pin for Pointer motor driver
#define CounterPointerPosition		?????							//?????  - Address of the position counter for the pointer finger 

//Middle - Motor 4
#define PinMiddleDirection			GPIO*							//Output - Direction pin for Middle motor driver 
#define PinMiddleLimit				GPIO*							//Input  - Limit (home) switch for Middle 
#define PinMiddleISense				GPIO*							//Input  - Force sensing via motor current from Middle motor driver 
#define PinMiddleTipForce			GPIO*							//Input  - Flexiforce sensor on tip of Middle 
#define PinMiddleEncoderA			GPIO*							//Input  - Quadrature encoder channel A for Middle motor 
#define PinMiddleEncoderB			GPIO*							//Input  - Quadrature encoder channel B for Middle motor 
#define MaskMiddlePortBase			GPIO?_BASE						//Mask 	 - Base port address for Middle finger pins
#define MaskMiddleDirPin			_GPIO_PINMASK_??				//Mask	 - Pin Mask for Middle finger direction pin 
#define ChannelMiddlePWM			_PWM_CHANNEL?					//Chan   - PWM Channel used for Middle finger 
#define PinMiddlePWM				_GPIO_MODULE_TIM?_CH?_PE?		//Output - PWM pin for Middle motor driver
#define CounterMiddlePosition		?????							//?????  - Address of the position counter for the Middle finger 


//Ring - Motor 5
#define PinRingDirection			GPIO*							//Output - Direction pin for Ring motor driver 
#define PinRingLimit				GPIO*							//Input  - Limit (home) switch for Ring 
#define PinRingISense				GPIO*							//Input  - Force sensing via motor current from Ring motor driver 
#define PinRingTipForce				GPIO*							//Input  - Flexiforce sensor on tip of Ring 
#define PinRingEncoderA				GPIO*							//Input  - Quadrature encoder channel A for Ring motor 
#define PinRingEncoderB				GPIO*							//Input  - Quadrature encoder channel B for Ring motor 
#define MaskRingPortBase			GPIO?_BASE						//Mask 	 - Base port address for Ring finger pins
#define MaskRingDirPin				_GPIO_PINMASK_??				//Mask	 - Pin Mask for Ring finger direction pin 
#define ChannelRingPWM				_PWM_CHANNEL?					//Chan   - PWM Channel used for Ring finger 
#define PinRingPWM					_GPIO_MODULE_TIM?_CH?_PE?		//Output - PWM pin for Ring motor driver
#define CounterRingPosition			?????							//?????  - Address of the position counter for the Ring finger 


//Pinky - Motor 6
#define PinPinkyDirection			GPIO*							//Output - Direction pin for Pinky motor driver 
#define PinPinkyLimit				GPIO*							//Input  - Limit (home) switch for Pinky 
#define PinPinkyISense				GPIO*							//Input  - Force sensing via motor current from Pinky motor driver 
#define PinPinkyTipForce			GPIO*							//Input  - Flexiforce sensor on tip of Pinky 
#define PinPinkyEncoderA			GPIO*							//Input  - Quadrature encoder channel A for Pinky motor 
#define PinPinkyEncoderB			GPIO*							//Input  - Quadrature encoder channel B for Pinky motor 
#define MaskPinkyPortBase			GPIO?_BASE						//Mask 	 - Base port address for Pinky pins
#define MaskPinkyDirPin				_GPIO_PINMASK_??				//Mask	 - Pin Mask for Pinky direction pin 
#define ChannelPinkyPWM				_PWM_CHANNEL?					//Chan   - PWM Channel used for Pinky
#define PinPinkyPWM					_GPIO_MODULE_TIM?_CH?_PE?		//Output - PWM pin for Pinky motor driver
#define CounterPinkyPosition		?????							//?????  - Address of the position counter for the pinky


//Thumb - Motor 1
#define PinThumbDirection			GPIO*							//Output - Direction pin for Thumb motor driver 
#define PinThumbLimit				GPIO*							//Input  - Limit (home) switch for Thumb 
#define PinThumbISense				GPIO*							//Input  - Force sensing via motor current from Thumb motor driver 
#define PinThumbTipForce			GPIO*							//Input  - Flexiforce sensor on tip of Thumb 
#define PinThumbEncoderA			GPIO*							//Input  - Quadrature encoder channel A for Thumb motor 
#define PinThumbEncoderB			GPIO*							//Input  - Quadrature encoder channel B for Thumb motor 
#define MaskThumbPortBase			GPIO?_BASE						//Mask 	 - Base port address for Thumb pins
#define MaskThumbDirPin				_GPIO_PINMASK_??				//Mask	 - Pin Mask for Thumb direction pin 
#define ChannelThumbPWM				_PWM_CHANNEL?					//Chan   - PWM Channel used for Thumb
#define PinThumbPWM					_GPIO_MODULE_TIM?_CH?_PE?		//Output - PWM pin for Thumb motor driver
#define CounterThumbPosition		?????							//?????  - Address of the position counter for the Thumb


//Thumb Articulation - Motor 2       ******UNKNOWN AT THIS POINT*****
#define PinThumbArticDirection		GPIO*							//Output - Direction pin for Thumb Articulation motor driver 
#define PinThumbArticLimit			GPIO*							//Input  - Limit (home) switch for Thumb Articulation 
#define PinThumbArticISense			GPIO*							//Input  - Force sensing via motor current from Thumb Articulation motor driver 
#define PinThumbArticTipForce		GPIO*							//Input  - Flexiforce sensor on tip of Thumb Articulation 
#define PinThumbArticEncoderA		GPIO*							//Input  - Quadrature encoder channel A for Thumb Articulation motor 
#define PinThumbArticEncoderB		GPIO*							//Input  - Quadrature encoder channel B for Thumb Articulation motor 
#define MaskThumbArticPortBase		GPIO?_BASE						//Mask 	 - Base port address for Thumb Articulation pins
#define MaskThumbArticDirPin		_GPIO_PINMASK_??				//Mask	 - Pin Mask for Thumb Articulation pin 
#define ChannelThumbArticPWM		_PWM_CHANNEL?					//Chan   - PWM Channel used for Thumb Articulation
#define PinThumbArticPWM			_GPIO_MODULE_TIM?_CH?_PE?		//Output - PWM pin for Thumb Articulation motor driver
#define CounterthumbArticPosition	?????							//?????  - Address of the position counter for the thumb articulation 




























