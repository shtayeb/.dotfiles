#!/bin/bash
# Install dotfiles using GNU Stow

cd "$(dirname "$0")"

# Install stow if not present
if ! command -v stow &> /dev/null; then
    echo "Installing stow..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install stow
    else
        sudo apt install stow
    fi
fi

# Stow all packages
stow -v zsh tmux nvim wezterm git scripts

echo "Dotfiles installed!"
