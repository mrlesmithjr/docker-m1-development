#!/bin/bash

set -e

sudo apt-get update -y
sudo apt-get install -y --no-install-recommends build-essential zlib1g-dev libffi-dev \
    libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev

# Define where dotfiles repo exists
DOTFILES_DIR="$HOME/.dotfiles"

export PYENV_ROOT="$HOME/.pyenv"

if [ ! -d "$PYENV_ROOT" ]; then
    git clone https://github.com/pyenv/pyenv.git "$PYENV_ROOT"
    git clone https://github.com/pyenv/pyenv-update.git "$PYENV_ROOT/plugins/pyenv-update"
    git clone https://github.com/pyenv/pyenv-virtualenv.git "$PYENV_ROOT/plugins/pyenv-virtualenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if [ -f "$DOTFILES_DIR/.python-version" ]; then
        pyenv install "$(cat "$DOTFILES_DIR/.python-version")"
        pyenv global "$(cat "$DOTFILES_DIR/.python-version")"
    else
        DEFAULT_PYTHON_VERSION=$(pyenv install --list | grep -v - | grep -v a | grep -v b | grep -v mini | grep -v rc | tail -1 | awk '{ print $1 }')
        pyenv install "$DEFAULT_PYTHON_VERSION"
        pyenv global "$DEFAULT_PYTHON_VERSION"
    fi
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    pip install --upgrade pip pip-tools
    pip-sync "$DOTFILES_DIR/requirements.txt" "$DOTFILES_DIR/requirements-dev.txt"
else
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    if which brew >/dev/null; then
        alias brew='env PATH=${PATH//$(pyenv root)\/shims:/} brew'
    fi
fi
