#!/bin/bash
# Easily update dotfiles from https://github.com/mrlesmithjr/dotfiles to ensure we have the latest

set -e

cd "$DOTFILES_DIR" || exit
git stash
git pull
git stash pop
./install
