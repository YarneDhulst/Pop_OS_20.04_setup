#!/bin/sh
apt-get update
apt install nvidia-cuda-toolkit -y
clear
nvcc --version
nvcc -o ../output_files/test_cuda_install ../files/test_cuda_install.cu
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
if ../output_files/test_cuda_install | grep -q "Max error: 0.000000"; then
    printf "${GREEN}[OK] Cuda installed${NC}\n" 
else
    printf "${RED}[X] Cuda install failed${NC}\n"
fi
rm ../output_files/test_cuda_install