#!/bin/bash

set -e

# Define where dotfiles repo exists
DOTFILES_DIR="$HOME/.dotfiles"

export PYENV_ROOT="$HOME/.pyenv"

if [ ! -d "$PYENV_ROOT" ]; then
    git clone https://github.com/pyenv/pyenv.git "$PYENV_ROOT"
    git clone https://github.com/pyenv/pyenv-virtualenv.git "$PYENV_ROOT/plugins/pyenv-virtualenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    DEFAULT_PYTHON_VERSION=$(pyenv install --list | grep -v - | grep -v b | grep -v mini | grep -v rc | tail -1 | awk '{ print $1 }')
    pyenv install "$DEFAULT_PYTHON_VERSION"
    pyenv global "$DEFAULT_PYTHON_VERSION"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    pip install --upgrade pip pip-tools
    pip-sync "$DOTFILES_DIR/requirements.txt" "$DOTFILES_DIR/requirements-dev.txt"
else
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi
