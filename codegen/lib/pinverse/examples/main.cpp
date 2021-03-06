//
// File: main.cpp
//
// MATLAB Coder version            : 3.3
// C/C++ source code generated on  : 20-Nov-2017 18:11:45
//

//***********************************************************************
// This automatically generated example C main file shows how to call
// entry-point functions that MATLAB Coder generated. You must customize
// this file for your application. Do not modify this file directly.
// Instead, make a copy of this file, modify it, and integrate it into
// your development environment.
//
// This file initializes entry-point function arguments to a default
// size and value before calling the entry-point functions. It does
// not store or use any values returned from the entry-point functions.
// If necessary, it does pre-allocate memory for returned values.
// You can use this file as a starting point for a main function that
// you can deploy in your application.
//
// After you copy the file, and before you deploy it, you must make the
// following changes:
// * For variable-size function arguments, change the example sizes to
// the sizes that your application requires.
// * Change the example values of function arguments to the values that
// your application requires.
// * If the entry-point functions return values, store these values or
// otherwise use them as required by your application.
//
//***********************************************************************
// Include Files
#include "rt_nonfinite.h"
#include "pinverse.h"
#include "main.h"
#include "pinverse_terminate.h"
#include "pinverse_initialize.h"

// Function Declarations
static void argInit_6x6_real32_T(float result[36]);
static float argInit_real32_T();
static void main_pinverse();

// Function Definitions

//
// Arguments    : float result[36]
// Return Type  : void
//
static void argInit_6x6_real32_T(float result[36])
{
  int idx0;
  int idx1;

  // Loop over the array to initialize each element.
  for (idx0 = 0; idx0 < 6; idx0++) {
    for (idx1 = 0; idx1 < 6; idx1++) {
      // Set the value of the array element.
      // Change this value to the value that the application requires.
      result[idx0 + 6 * idx1] = argInit_real32_T();
    }
  }
}

//
// Arguments    : void
// Return Type  : float
//
static float argInit_real32_T()
{
  return 0.0F;
}

//
// Arguments    : void
// Return Type  : void
//
static void main_pinverse()
{
  float fv0[36];
  float y[36];

  // Initialize function 'pinverse' input arguments.
  // Initialize function input argument 'x'.
  // Call the entry-point 'pinverse'.
  argInit_6x6_real32_T(fv0);
  pinverse(fv0, y);
}

//
// Arguments    : int argc
//                const char * const argv[]
// Return Type  : int
//
int main(int, const char * const [])
{
  // Initialize the application.
  // You do not need to do this more than one time.
  pinverse_initialize();

  // Invoke the entry-point functions.
  // You can call entry-point functions multiple times.
  main_pinverse();

  // Terminate the application.
  // You do not need to do this more than one time.
  pinverse_terminate();
  return 0;
}

//
// File trailer for main.cpp
//
// [EOF]
//
