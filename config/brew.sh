#!/bin/bash

set -e

if [[ $(arch) != "aarch64" ]]; then
    sudo apt-get update -y
    sudo apt-get install -y --no-install-recommends build-essential curl file git procps
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
