source ~/.antigen/antigen.zsh

# Cygwin
if [[ `uname -o` == "Cygwin" ]]
then
  unhash -fm "\-antigen-ensure-repo"
  function -antigen-ensure-repo { }

  alias ccl="echo '' > /dev/clipboard"
fi

antigen-bundles <<EOBUNDLES
sudo
git
pip
command-not-found
vagrant
gem
ssh-agent

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

if [[ $kernel == *"gentoo"* ]]
then
  alias sps="sudo emerge -s"
  alias spi="sudo emerge --ask"
  alias spu="sudo emerge --ask -uDU --with-bdeps=y @world"
  alias spr="sudo emerge --ask --unmerge"
  alias spar="sudo emerge --ask --depclean"
elif [[ $kernel != *"ARCH" ]]
then
  alias sps="sudo apt-cache search"
  alias spi="sudo apt-get install"
  alias spu="sudo apt-get update && sudo apt-get upgrade"
  alias spdu="sudo apt-get update && sudo apt-get dist-upgrade"
  alias spr="sudo apt-get remove"
  alias spar="sudo apt-get autoremove"
fi

# because muscle memory
alias vim=nvim
export VISUAL=nvim
export EDITOR=$VISUAL

# set color terminal
TERM=xterm-256color

# cabal
export PATH=$PATH:~/.cabal/bin

# rvm
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# npm
export PATH="${HOME}/.npm-packages/bin:$PATH"
