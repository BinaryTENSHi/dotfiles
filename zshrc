source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load defaults from ohmyzsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/spectrum.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh

# Load theme
zinit snippet ~/dotfiles/themes/binary.zsh-theme

# Load ohmyzsh plugins
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zinit snippet OMZ::plugins/asdf/asdf.plugin.zsh

# Load direnv
zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

# Load miscellaneous
zinit ice wait blockf atpull'zinit creinstall -q .' lucid
zinit light zsh-users/zsh-completions

zinit ice wait atinit"zpcompinit; zpcdreplay" lucid
zinit light zdharma/fast-syntax-highlighting

zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search

zinit ice wait lucid
zinit light zinit-zsh/z-a-bin-gem-node

# Load fzf
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin
zinit snippet https://github.com/junegunn/fzf/raw/master/shell/completion.zsh
zinit snippet https://github.com/junegunn/fzf/raw/master/shell/key-bindings.zsh

# Load exa
zinit ice from"gh-r" as"program" mv"exa-* -> exa"
zinit load ogham/exa

zinit ice as'completion' mv"*.zsh -> _exa"
zinit snippet https://github.com/ogham/exa/raw/master/contrib/completions.zsh

alias ls="exa"
alias lt="exa --tree"

# Load bat
zinit ice from"gh-r" bpick"bat-v*-x86_64-unknown-linux-gnu*" \
    mv"bat-*/bat -> bat" \
    sbin"bat"
zinit load sharkdp/bat

alias cat="bat"

# setopt
setopt AUTO_PUSHD # automatically pushd on cd
setopt HIST_SAVE_NO_DUPS # do not save duplicate
setopt HIST_IGNORE_ALL_DUPS # remove old duplicates

# Aliases
alias lsa="ls -lah"
alias l="ls -laF"
alias ll="ls -lh"
alias la="ls -lAh"

alias c="clear"

# Git
alias gcla="git cola"

# Package manager
local distro=$(awk -F= '/^ID=/{gsub(/"/, "", $2); print $2}' /etc/os-release)

if [[ $distro == "arch" ]]
then
  alias sps="sudo yay -Ss"
  alias spi="sudo yay -Sy"
  alias spu="sudo yay -Syu"
  alias spr="sudo yay -Rns"
elif [[ $distro == "ubuntu" ]]
then
  alias sps="sudo apt search"
  alias spi="sudo apt install"
  alias spu="sudo apt update && sudo apt dist-upgrade"
  alias spr="sudo apt remove"
  alias spar="sudo apt autoremove"
fi

# Systemd
alias ssctl="sudo systemctl"
