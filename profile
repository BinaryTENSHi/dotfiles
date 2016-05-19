PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=24
PANEL_FONT_NORMAL="-*-terminus-medium-r-normal-*-12-*-*-*-c-*-*-1"
PANEL_FONT_JAPANESE="-misc-kochi gothic-medium-r-normal--10-0-0-0-p-0-iso10646-1"

export PANEL_FIFO PANEL_HEIGHT PANEL_FONT_NORMAL PANEL_FONT_JAPANESE
export PATH=$PATH:~/.config/bspwm/panel
export PATH=$PATH:~/.cabal/bin

# rvm
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

