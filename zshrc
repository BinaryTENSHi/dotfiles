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

# package manager
local kernel=`uname -r`

alias sps="sudo pacman -Ss"
alias spi="sudo pacman -Sy"
alias spu="sudo pacman -Syu"
alias spr="sudo pacman -Rns"
alias sas="sudo aura -As"
alias sai="sudo aura -Axy"
alias sau="sudo aura -Axyu"
alias sar="sudo aura -Rns"

if [[ $kernel != *"ARCH" ]]
then
  alias sps="sudo apt-cache search"
  alias spi="sudo apt-get install"
  alias spu="sudo apt-get update && sudo apt-get upgrade"
  alias spdu="sudo apt-get update && sudo apt-get dist-upgrade"
  alias spr="sudo apt-get remove"
  alias spar="sudo apt-get autoremove"
fi

# cygwin clear clipboard
alias ccl="echo '' > /dev/clipboard"

# because muscle memory
alias nano=vim
export VISUAL=vim
export EDITOR=$VISUAL

# set color terminal
TERM=xterm-256color

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# nvm
export NVM_DIR="/home/$USERNAME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# git-hub
source ~/.git-hub/init

