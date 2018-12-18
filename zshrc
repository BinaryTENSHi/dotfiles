source ~/.antigen/antigen.zsh

antigen bundles <<EOBUNDLES
sudo
git
command-not-found
ssh-agent

robbyrussell/oh-my-zsh lib/

zsh-users/zsh-completions src
zsh-users/zsh-history-substring-search
zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen theme ~/dotfiles/themes/ binary

antigen apply

alias l="ls -laF"
alias c="clear"

# package manager
local distro=$(awk -F= '/^ID=/{gsub(/"/, "", $2); print $2}' /etc/os-release)

if [[ $distro == "arch" ]]
then
  alias sps="sudo pacman -Ss"
  alias spi="sudo pacman -Sy"
  alias spu="sudo pacman -Syu"
  alias spr="sudo pacman -Rns"
  alias sas="sudo aura -As"
  alias sai="sudo aura -Axy"
  alias sau="sudo aura -Axyu"
  alias sar="sudo aura -Rns"
elif [[ $distro == "gentoo" ]]
then
  alias sps="sudo emerge -s"
  alias spi="sudo emerge --ask"
  alias spu="sudo emerge --ask -uDU --with-bdeps=y @world"
  alias spr="sudo emerge --ask --unmerge"
  alias spar="sudo emerge --ask --depclean"
elif [[ $distro == "ubuntu" ]]
then
  alias sps="sudo apt search"
  alias spi="sudo apt install"
  alias spu="sudo apt update && sudo apt upgrade"
  alias spdu="sudo apt update && sudo apt dist-upgrade"
  alias spr="sudo apt remove"
  alias spar="sudo apt autoremove"
elif [[ $distro == "fedora" ]]
then
  alias sps="sudo dnf search"
  alias spi="sudo dnf install"
  alias spu="sudo dnf update"
  alias spr="sudo dnf remove"
  alias spar="sudo dnf autoremove"
fi

# because muscle memory
alias vim=nvim
export VISUAL=nvim
export EDITOR=$VISUAL

# set color terminal
TERM=xterm-256color

