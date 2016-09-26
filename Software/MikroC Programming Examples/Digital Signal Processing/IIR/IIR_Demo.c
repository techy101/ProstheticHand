/*
 * Project name:
    IIR_Demo (IIR library test example)
 * Description:
    The input signal is a sum of two sine waves: 1 kHz and 15 kHz.
    This is processed by an IIR lowpass filter with cutoff frequency 6 kHz.
    The lowpass filter eliminates the 15 kHz signal leaving only the 1 kHz
    sine wave at the output. At the end of processing, result is checked
    with CMSIS SNR function against expected waveform.
    Note that there is no CMSIS counterpart for this example,
    however, it is analogous to IIR Lowpass Filter Example.

 * Test configuration:
     MCU:             STM32F107VC
                      http://www.st.com/st-web-ui/static/active/en/resource/technical/document/reference_manual/CD00171190.pdf
     dev.board:       EasyMx v7 for STM32 ® ARM ®
                      http://www.mikroe.com/easymx-pro/stm32/
     Oscillator:      HSE-PLL, 72.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - None.
*/

#include "stdint.h"
#include "__Dsp.h"

#define TESTLENGTH 320
#define BLOCKSIZE 32
#define NUMBLOCKS (TESTLENGTH/BLOCKSIZE)
#define NUMSTAGES 2
#define SNR_THRESHOLD_F32 27

// External declarations for input and output buffers
// -------------------------------------------------------------------
extern float32_t testInput_f32_1kHz_15kHz[TESTLENGTH];
static float32_t testOutput[TESTLENGTH];
extern float32_t RefOutput[TESTLENGTH];

// Q15 state buffers. Each state = 4 variables (assuming a0 = 1).
// -------------------------------------------------------------------
static q15_t biquadState1[4*NUMSTAGES];
static q15_t biquadState2[4*NUMSTAGES];
static q15_t biquadState3[4*NUMSTAGES];

// Input and output blocks temporary buffers
// -------------------------------------------------------------------
q15_t outputQ15[BLOCKSIZE];
q15_t inputQ15[BLOCKSIZE];

// Coefficients for Butterworth 2nd order double low pass sections
// Low pass cut-off frequency: 6kHz
// Sample rate: 48kHz
// Some values exceed q.15 range, therefore coefficient are halved
// This is compensated by setting postShift = 1
// -------------------------------------------------------------------
q15_t coeffTable[6*NUMSTAGES] =
    {1053, 0, 2107, 1053, 19100, -6930, 1053, 0, 2107, 1053, 19100, -6930};

const TEST_SUCCESS = 0;
const TEST_FAILURE = 1;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// --------------------------------------------------------------------
// Calculation of SNR.
// Parameters:
//  *pRef         pointer to the reference buffer
//  *pTest        pointer to the test buffer
//   buffSize     total number of samples
// Returns:       SNR
// --------------------------------------------------------------------

float SNRCalc(float *pRef, float *pTest, uint32_t buffSize) {
  float EnergySignal = 0, EnergyError = 0;
  uint32_t i;
  float SNR;
  int temp;
  int *test;

  for (i = 0; i < buffSize; i++) {
    // Checking for a NAN value in pRef array
    test = (int *)(&pRef[i]);
    temp = *test;
    if(temp == 0x7FC00000) {
      return(0);
    }

    // Checking for a NAN value in pTest array
    test = (int *)(&pTest[i]);
    temp =  *test;
    if(temp == 0x7FC00000) {
      return(0);
    }
    EnergySignal += pRef[i] * pRef[i];
    EnergyError += (pRef[i] - pTest[i]) * (pRef[i] - pTest[i]);
  }

  // Checking for a NAN value in EnergyError
  test = (int *)(&EnergyError);
  temp = *test;
  if(temp == 0x7FC00000) {
    return(0);
  }
  SNR = 10 * log10 (EnergySignal / EnergyError);
  return (SNR);
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

void main(void) {
  float32_t  *inputF32, snr;
  TIIR_Instance S1, S2, S3;
  int i, j;
  int32_t status;
  inputF32 = testInput_f32_1kHz_15kHz;
  
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_4); // Set PORTA.0 and PORTA.4 as digital output
  GPIOA_ODR.B0 = 0;
  GPIOA_ODR.B4 = 0;

  // Initialize the state and coefficient buffers for all biquad sections
  IIR_Init(&S1, NUMSTAGES,  (q15_t *) coeffTable, biquadState1, 1);
  IIR_Init(&S2, NUMSTAGES,  (q15_t *) coeffTable, biquadState2, 1);
  IIR_Init(&S3, NUMSTAGES,  (q15_t *) coeffTable, biquadState3, 1);

  for(i=0; i < NUMBLOCKS; i++) {
    // Convert block of input data from float to Q15
    // Input scaling is done here, for smaller quantization noise
    // -------------------------------------------------------------------
    for(j = 0; j < BLOCKSIZE; j++) {
      inputQ15[j] = Q15_Ftoi(inputF32[(i*BLOCKSIZE) + j]/4);
    }


    // Call 3 double cascades of 2nd order section
    // Total filter order = 12
    // -------------------------------------------------------------------
    IIR_Fast(&S1, inputQ15,  outputQ15, BLOCKSIZE);
    IIR_Fast(&S2, outputQ15, outputQ15, BLOCKSIZE);
    IIR_Fast(&S3, outputQ15, outputQ15, BLOCKSIZE);

    // Convert Q15 result back to float
    // -------------------------------------------------------------------
    for(j = 0; j < BLOCKSIZE; j++) {
      testOutput[(i*BLOCKSIZE) + j] = Q15_Itof(outputQ15[j])*4;
    }
  }

  // Classical CMSIS SNR test
  snr = SNRCalc(refOutput, testOutput, TESTLENGTH);
  if (snr < SNR_THRESHOLD_F32) {
    status = TEST_FAILURE;
  }
  else {
    status = TEST_SUCCESS;
  }

  if( status != TEST_SUCCESS) {
    // Loop here if the signal does not match the reference output.
    GPIOA_ODR.B0 = 0;
    GPIOA_ODR.B4 = 1;
  }
  else {
    // OK, but main function does not return.
    GPIOA_ODR.B0 = 1;
    GPIOA_ODR.B4 = 1;
  }
}