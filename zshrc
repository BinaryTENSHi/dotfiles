source ~/.antigen/antigen.zsh

antigen-bundles <<EOBUNDLES
colored-man
sudo
git
pip
command-not-found
vagrant
gem

robbyrussell/oh-my-zsh lib/

zsh-users/zsh-completions src
zsh-users/zsh-history-substring-search
zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen-theme ~/dotfiles/themes/ binary

antigen-apply

alias l="ls -laF"
alias c="clear"

alias spi="sudo pacman -S"
alias spu="sudo pacman -Syu"
alias spr="sudo pacman -Rns"

# cygwin clear clipboard
alias ccl="echo '' > /dev/clipboard"

# because muscle memory
alias nano=vim
export VISUAL=vim
export EDITOR=$VISUAL

# set color terminal
TERM=xterm-256color

