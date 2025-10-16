#include "../include/cuda.cuh"
#include <stdio.h>
#include <string.h>

/**
 * @brief Says hello from the GPU.
 */
__global__ void HelloWorldKernel(char *gpuName)
{
    printf("%s says: Hello, World!\n", gpuName);
}

/**
 * @brief Tells the GPU to say hello.
 */
void HelloWorld()
{
    cudaError_t error;

    /* Try to locate an eligible GPU. */
    int deviceNumber;
    error = cudaGetDevice(&deviceNumber);
    if (error != cudaSuccess)
    {
        fprintf(stderr, "Failure finding a NVIDIA GPU: %s\n", cudaGetErrorString(error));
        exit(EXIT_FAILURE);
    }

    /* Try to get the said GPU's device properties. */
    cudaDeviceProp gpu;
    error = cudaGetDeviceProperties_v2(&gpu, deviceNumber);
    if (error != cudaSuccess)
    {
        fprintf(stderr, "Failure getting gpu%d's device properties: %s\n", deviceNumber, cudaGetErrorString(error));
        exit(EXIT_FAILURE);
    }

    /* Copy the gpu's name to the device. */
    char *gpuName;
    cudaMalloc(&gpuName, sizeof(gpu.name));
    cudaMemcpy(gpuName, gpu.name, sizeof(gpu.name), cudaMemcpyHostToDevice);

    /* Say hello. */
    HelloWorldKernel<<<1, 1>>>(gpuName);
    cudaDeviceSynchronize();

    /* Free the gpu's name. */
    cudaFree(gpuName);
}