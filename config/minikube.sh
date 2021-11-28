#!/bin/bash

set -e

ARCH=$(arch)

if [ "$ARCH" == "aarch64" ]; then
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_arm64.deb
    sudo dpkg -i minikube_latest_arm64.deb
elif [ "$ARCH" == "i386" ]; then
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
    sudo dpkg -i minikube_latest_amd64.deb
fi
