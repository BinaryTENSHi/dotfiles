#!/usr/bin/env bash

set -euo pipefail

# Ensure oh-my-zsh is installed
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Ensure zsh-syntax-highlighting is cloned
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi

# Ensure doomemacs is cloned
if [[ ! -d "$HOME/.config/emacs" ]]; then
    mkdir -p "$HOME/.config/"
    git clone https://github.com/hlissner/doom-emacs \
        "$HOME/.config/emacs"
fi

# Ensure tpm is cloned
if [[ ! -d "$HOME/.config/tmux/plugins/tpm" ]]; then
    mkdir -p "$HOME/.config/tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm \
        "$HOME/.config/tmux/plugins/tpm"
fi

# Install terminfo
tic -x -o "$HOME/.terminfo" "$HOME/dotfiles/misc/xterm-emacs.src"
