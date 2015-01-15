source ~/.antigen/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/
antigen theme af-magic

antigen bundle git
antigen bundle pip
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

alias l="ls -laF"
alias c="clear"

# cygwin clear clipboard
alias ccl="echo '' > /dev/clipboard"

# because muscle memory
alias nano=vim
export VISUAL=vim
export EDITOR=$VISUAL

# set color terminal
TERM=xterm-256color

