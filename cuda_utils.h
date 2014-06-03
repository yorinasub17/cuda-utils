// Copyright 2014, Captricity Inc.
// All rights reserved.
//
// Author: yoriy@captricity.com
//
// CUDA Utilities
//
// Defines the CUDA utility functions available for use that are callable from CPP

#ifndef CUDA_UTILS_H_
#define CUDA_UTILS_H_

// Initializes the CUDA device context (loading of code) by triggering a no-op
// device call
void warmCuda();

// Waits for outstanding device calls to finish before proceeding
void waitForDevice();

// Checks for any CUDA errors and outputs error messages
void checkError(char* message);

// Checks current GPU memory usage and outputs to stdout
void checkMemory();

#endif
