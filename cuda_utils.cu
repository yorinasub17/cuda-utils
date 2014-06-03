// Copyright 2014, Captricity Inc.
// All rights reserved.
//
// Author: yoriy@captricity.com
//
// CUDA Utilities
//
// Contains various utility functions that are callable from CPP

#include <stdio.h>
#include <cuda.h>
#include "cuda_utils.h"

void warmCuda()
{
    cudaFree(0);
}

void waitForDevice()
{
    cudaDeviceSynchronize();
}

void checkError(char* message)
{
    cudaError_t error = cudaGetLastError();
    if (error != cudaSuccess)
    {
        fprintf(stderr,"ERROR: %s: %s\n", message, cudaGetErrorString(error) );
    }
}

void checkMemory()
{
    size_t free_byte, total_byte;
    double free_db, total_db, used_db;
    cudaMemGetInfo(&free_byte, &total_byte);
    free_db = (double)free_byte;
    total_db = (double)total_byte;
    used_db = total_db - free_db;
    printf("GPU memory usage: used = %f, free = %f MB, total = %f MB\n", used_db/1024.0/1024.0, free_db/1024.0/1024.0, total_db/1024.0/1024.0);
}
