#!/bin/bash

set -e

sudo apt-get update -y
sudo apt-get install -y --no-install-recommends build-essential curl file git procps
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
