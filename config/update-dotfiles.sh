#!/bin/bash

set -e

cd "$DOTFILES_DIR" || exit
git stash
git pull
git stash pop
./install
