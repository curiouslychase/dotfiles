#!/bin/bash
# Bootstrap script for fresh machine setup
# Creates directory structure and clones dotfiles
#
# Run with:
#   curl -fsSL https://raw.githubusercontent.com/curiouslychase/dotfiles/main/init.sh | bash

set -e

DOTFILES_DIR="$HOME/src/github.com/curiouslychase/dotfiles"
DOTFILES_REPO="git@github.com:curiouslychase/dotfiles.git"

# Create directory structure
mkdir -p "$HOME/src/github.com/curiouslychase"

# Clone dotfiles if not already present
if [ -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles already exist at $DOTFILES_DIR"
else
    echo "Cloning dotfiles..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    echo "Dotfiles cloned to $DOTFILES_DIR"
fi
