if [[ -f "/etc/os-release" ]]; then
  # Distro independent package manager
  local distro=$(awk -F= '/^ID=/{gsub(/"/, "", $2); print $2}' /etc/os-release)

  if [[ $distro == "arch" ]]
  then
    alias sps="yay -Ss"
    alias spi="yay -Sy"
    alias spu="yay -Syu"
    alias spr="yay -Rns"
  elif [[ $distro == "ubuntu" ]]
  then
    alias sps="sudo apt search"
    alias spi="sudo apt install"
    alias spu="sudo apt update && sudo apt dist-upgrade"
    alias spr="sudo apt remove"
    alias spar="sudo apt autoremove"
  fi
fi

# Systemd
alias ssctl="sudo systemctl"
alias usctl="systemctl --user"

# Editor
alias vim="TERM=xterm-emacs command emacsclient -nw"
