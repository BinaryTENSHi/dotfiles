source ~/.antigen/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/
antigen theme ~/dotfiles/themes/ binary

antigen bundle git
antigen bundle pip
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

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

