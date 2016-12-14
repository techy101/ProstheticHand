#ifndef DEFINES_H
#define DEFINES_H

/*
Prosthetic Hand Senior Design Project
12/2/2016
Matthew Varas
Donnell Jones
Rachel Mertz

 * File name:
    defines.h

 * Description:
    Creates human readable names for microcontroller pins and other values         
*/



// MISC
#define STR_MAX                                                                        15                                                                // Maximum string size 
#define UART_BAUD_RATE                                                        115200                                                        // UART baud rate 
#define CONTRACT                                                                0                                                                // Finger direction contracting
#define EXTEND                                                                        1                                                                // Finger direction extending

//EMG 
#define EMG_OVERRIDE_BUTTON                                                GPIOD_IDR.B3                                        // Input  - D3  - EMG Signal override button 
#define EMG_ACTIVE_LED                                                        GPIOB_ODR.B9                                        // Output - B9  - Lit during EMG timer execution 
#define CHANNEL_ADC_EMG                                                        1                                                                // Chan   - A1  - ADC1 channel 1 used for EMG

// AWD
#define high_level                                                        400                                                                                                        
#define low_level                                                         0
#define high_level2                                                        4095
#define low_level2                                                         400 


//General MCU I/O
#define MOTOR_ENABLE                                                        GPIOE_ODR.B0                                        // Output - E0  - Enable signal for ALL non-MCU IC's 
#define BATT_CHG_MON                                                        15                                                                // Chan   - C5  - ADC1 channel 15 used for battery charge current monitor

//User I/O 
#define GRAB_MODE_BUTTON                                                GPIOD_IDR.B11                                        // Input  - D11 - User button to enable Grab mode 
#define GRAB_MODE_LED                                                        GPIOD_ODR.B12                                        // Output - D12 - LED to indicate hand is in Grab mode 
#define PINCH_MODE_BUTTON                                                GPIOD_IDR.B7                                        // Input  - D7  - User button to enable Pinch mode 
#define PINCH_MODE_LED                                                        GPIOD_ODR.B14                                        // Output - D14 - LED to indicate hand is in Pinch mode 
#define POINT_MODE_BUTTON                                                GPIOD_IDR.B1                                        // Input  - D1  - User button to enable Point mode 
#define POINT_MODE_LED                                                        GPIOD_ODR.B15                                        // Output - D15 - LED to indicate hand is in Point mode 
#define SHAKE_MODE_BUTTON                                                GPIOD_IDR.B2                                        // Input  - D2  - User button to enable Hand Shake mode 
#define SHAKE_MODE_LED                                                        GPIOA_ODR.B8                                        // Output - A8  - LED to indicate hand is in Hand Shake mode 
#define WAKEUP_BUTTON                                                        GPIOA_IDR.B0                                        // Input  - A0  - Wakeup button (May be user defined for future)
#define HAND_RUNNING_LED                                                GPIOB_ODR.B8                                        // Output - B8  - Active whenever hand is actively moving 
#define LOW_BATTERY_LED                                                        GPIOB_ODR.B7                                        // Output - B7  - Active whenever battery level is low  
#define USER_DEF_BUTTON                                                        GPIOD_IDR.B4                                        // Input  - D4  - User defined button for future use 
#define CHANNEL_ADC_FORCE_KNOB                                        6                                                                // Chan   - A6  - ADC1 channel 6 used for force control knob 

//****Fingers****
//Pointer - Motor 3
#define POINTER_DIRECTION                                                GPIOE_ODR.B10                                        // Output - E10 - Direction pin for Pointer motor driver 
#define POINTER_LIMIT                                                        GPIOE_IDR.B15                                        // Input  - E15 - Limit (home) switch for Pointer 
#define POINTER_ENCODER_B                                                GPIOE_IDR.B12                                        // Input  - E12 - Quadrature encoder channel B for Pointer motor 
#define POINTER_PWM                                                                _PWM_CHANNEL1                                        // Chan   - E9  - TIM1 CH1 PWM Channel used for pointer finger 
#define CHANNEL_ADC_POINTER_TIP_FORCE                        7                                                                // Chan          - A7  - ADC1 channel 7 used for FlexiForce sensor on pointer finger
#define CHANNEL_ADC_POINTER_ISENSE                                4                                                                // Chan   - A4  - ADC1 channel 4 used for current sense on pointer finger

//Middle - Motor 4
#define MIDDLE_DIRECTION                                                GPIOB_ODR.B10                                        // Output - B10 - Direction pin for MIDDLE motor driver 
#define MIDDLE_LIMIT                                                        GPIOB_IDR.B12                                        // Input  - B12 - Limit (home) switch for MIDDLE 
#define MIDDLE_ENCODER_B                                                GPIOA_IDR.B11                                        // Input  - A11 - Quadrature encoder channel B for MIDDLE motor 
#define MIDDLE_PWM                                                                _PWM_CHANNEL2                                        // Chan   - E11 - TIM1 CH2 PWM Channel used for MIDDLE finger 
#define CHANNEL_ADC_MIDDLE_TIP_FORCE                        9                                                                // Chan          - B1  - ADC1 channel 9 used for FlexiForce sensor on middle finger
#define CHANNEL_ADC_MIDDLE_ISENSE                                8                                                                // Chan   - B0  - ADC1 channel 8 used for current sense on middle finger


//Ring - Motor 5
#define RING_DIRECTION                                                        GPIOB_ODR.B13                                        // Output - B13 - Direction pin for RING motor driver 
#define RING_LIMIT                                                                GPIOB_IDR.B14                                        // Input  - B14 - Limit (home) switch for RING 
#define RING_ENCODER_B                                                        GPIOB_IDR.B15                                        // Input  - B15 - Quadrature encoder channel B for RING motor 
#define RING_PWM                                                                _PWM_CHANNEL3                                        // Chan   - E13 - TIM1 CH3 PWM Channel used for RING finger 
#define CHANNEL_ADC_RING_TIP_FORCE                                11                                                                // Chan          - C1  - ADC1 channel 11 used for FlexiForce sensor on ring finger
#define CHANNEL_ADC_RING_ISENSE                                        10                                                                // Chan   - C0  - ADC1 channel 10 Used for current sense on ring finger


//Pinky - Motor 6
#define PINKY_DIRECTION                                                        GPIOD_ODR.B8                                         // Output - D8  - Direction pin for PINKY motor driver 
#define PINKY_LIMIT                                                                GPIOD_IDR.B10                                        // Input  - D10 - Limit (home) switch for PINKY 
#define PINKY_ENCODER_B                                                        GPIOD_IDR.B9                                        // Input  - D9  - Quadrature encoder channel B for PINKY motor 
#define PINKY_PWM                                                                _PWM_CHANNEL4                                        // Chan   - E14 - TIM1 CH4 PWM Channel used for PINKY finger 
#define CHANNEL_ADC_PINKY_TIP_FORCE                                13                                                                // Chan          - C3  - ADC1 channel 13 used for FlexiForce sensor on pinky
#define CHANNEL_ADC_PINKY_ISENSE                                12                                                                // Chan   - C2  - ADC1 channel 12 used for current sense on pinky


//Thumb - Motor 1        
#define THUMB_DIRECTION                                                        GPIOC_ODR.B12                                        // Output - C12 - Direction pin for THUMB motor driver 
#define THUMB_LIMIT                                                                GPIOE_IDR.B8                                        // Input  - E8  - Limit (home) switch for THUMB 
#define THUMB_ENCODER_B                                                        GPIOC_IDR.B11                                        // Input  - C11 - Quadrature encoder channel B for THUMB motor 
#define THUMB_PWM                                                                _PWM_CHANNEL1                                        // Chan   - B6  - TIM4 CH1 PWM Channel used for THUMB finger 
#define CHANNEL_ADC_THUMB_TIP_FORCE                                3                                                                // Chan          - A3  - ADC1 channel 3 used for FlexiForce sensor on thumb
#define CHANNEL_ADC_THUMB_ISENSE                                2                                                                // Chan   - A2  - ADC1 channel 2 used for current sense on thumb



#endif