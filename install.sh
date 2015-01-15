#!/bin/bash

# check for zsh
if ! hash zsh 2>/dev/null; then
  echo "zsh is not installed."
  exit 1
fi

# install antigen
mkdir -p ~/.antigen/
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen/antigen.zsh

# install NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# vim tmp
mkdir ~/tmp/

# backup folder
mkdir ~/dotbackup/

# symlink files
symlink() {
  mv ~/.$1 ~/dotbackup/$1
  ln -s ~/dotfiles/$1 ~/.$1
}

symlink "zshrc"
symlink "vimrc"
symlink "gitconfig"

