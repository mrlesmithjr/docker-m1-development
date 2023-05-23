#!/bin/bash

# Installs Homebrew except on aarch64 platforms because it is not supported

set -e

if [[ $(arch) != "aarch64" ]]; then
    sudo apt-get update -y
    sudo apt-get install -y --no-install-recommends build-essential curl file git procps
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
