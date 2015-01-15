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

# symlink files
mv ~/.zshrc{,.bak}
ln -s ~/dotfiles/zshrc ~/.zshrc
mv ~/.vimrc{,.bak}
ln -s ~/dotfiles/vimrc ~/.vimrc

