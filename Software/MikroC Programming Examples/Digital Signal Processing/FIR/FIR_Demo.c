/*
 * Project name:
     FIR_Demo (FIR library test example)
 * Description:
      The input signal is a sum of two sine waves: 1 kHz and 15 kHz.
      This is processed by an FIR lowpass filter with cutoff frequency 6 kHz.
      The lowpass filter eliminates the 15 kHz signal leaving only the 1 kHz
      sine wave at the output. At the end of processing, result is checked
      with CMSIS SNR function against expected waveform.
      Note that SNR_THRESHOLD_F32 is set lower because of quantization noise
      introduced during f32-q15-f32 conversions, and q15 processing.

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

#define TEST_LENGTH_SAMPLES 320
#define SNR_THRESHOLD_F32   17
#define BLOCK_SIZE          32
#define NUM_TAPS            30

// The input signal and reference output (computed with MATLAB)
// are defined externally 
// -------------------------------------------------------------------
extern float32_t testInput_f32_1kHz_15kHz[TEST_LENGTH_SAMPLES];
extern float32_t refOutput[TEST_LENGTH_SAMPLES];


// Declare Test output buffer for verification
// -------------------------------------------------------------------
static float32_t testOutput[TEST_LENGTH_SAMPLES];


// Declare State buffer of size (numTaps + blockSize - 1)
// -------------------------------------------------------------------
q15_t firStateQ15[BLOCK_SIZE + NUM_TAPS - 1];
q15_t inputQ15[TEST_LENGTH_SAMPLES];
q15_t outputQ15[TEST_LENGTH_SAMPLES];

// -------------------------------------------------------------------
// FIR filter order = 28 (29 taps)
// Low pass cut-off frequency: 6kHz
// Sample rate: 48kHz (Nyquist = 24)
// Coefficients are generated using MATLAB function:
// fliplr(fir1(28, 6/24)) and converted to q15
// Number of coefficients must be even, so last 0x0000 is added
// -------------------------------------------------------------------

const q15_t firCoeffsQ15[NUM_TAPS] = {
0xFFC4, 0xFFCC, 0x0000, 0x0079, 0x0109, 0x0118, 0x0000, 0xFDC6,
0xFBA1, 0xFBBB, 0x0000, 0x08A8, 0x137B, 0x1C89, 0x2010, 0x1C89,
0x137B, 0x08A8, 0x0000, 0xFBBB, 0xFBA1, 0xFDC6, 0x0000, 0x0118,
0x0109, 0x0079, 0x0000, 0xFFCC, 0xFFC4, 0x0000
};

uint32_t blockSize = BLOCK_SIZE;                         
uint32_t numBlocks = TEST_LENGTH_SAMPLES/BLOCK_SIZE;
uint16_t numTaps = NUM_TAPS;
float32_t  snr;
uint16_t cnt;

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
TFIR_Instance S;
char status;

  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0); // Set PORTA.0  as digital output
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_4); // Set PORTA.4  as digital output
  GPIOA_ODR.B0 = 0;
  GPIOA_ODR.B4 = 0;

  // Call FIR init function to initialize the instance structure
  FIR_Init(&S, numTaps, (q15_t *) firCoeffsQ15, firStateQ15, blockSize);
        
  // Convert input data from float to Q15
  // -------------------------------------------------------------------
  for(cnt = 0; cnt < TEST_LENGTH_SAMPLES; cnt++) {
    inputQ15[cnt] = Q15_Ftoi(testInput_f32_1kHz_15kHz[cnt]/2);
  }

  // Call the FIR process function for every blockSize samples
  // ---------------------------------------------------------------
  for(cnt = 0; cnt < numBlocks; cnt++) {
    FIR_Fast(&S, inputQ15 + (cnt * blockSize), outputQ15 + (cnt * blockSize), blockSize);
  }

  //  Convert result back to float
  // ----------------------------------
  for(cnt = 0; cnt < TEST_LENGTH_SAMPLES; cnt++) {
    testOutput[cnt] = Q15_Itof(outputQ15[cnt])*2;
  }

  // Classical CMSIS SNR test
  snr = SNRCalc(refOutput, testOutput, TEST_LENGTH_SAMPLES);

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