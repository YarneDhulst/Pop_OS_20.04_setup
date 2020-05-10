#!/bin/sh
apt-get update
apt install docker.io -y
systemctl enable --now docker
usermod -aG docker $SUDO_USER
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
if docker run hello-world | grep -q "Hello from Docker!"; then
    clear
    docker --version
    printf "${GREEN}[OK] Docker installed${NC}\n"   
else
    printf "${RED}[X] Docker install failed${NC}\n"
fi