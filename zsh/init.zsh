# Get the directory this script is in
SCRIPTDIR=${0:A:h}

# Load zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Set zsh options
setopt AUTO_PUSHD # automatically pushd on cd
setopt HIST_SAVE_NO_DUPS # do not save duplicate
setopt HIST_IGNORE_ALL_DUPS # remove old duplicates

# Set default editor
alias vim="nvim"
export EDITOR=vim

# Load OhMyZsh stuff
source "$SCRIPTDIR/omz.zsh"

# Load plugins
source "$SCRIPTDIR/plugin.zsh"

# Load external binaries
source "$SCRIPTDIR/external.zsh"

# Load aliases
source "$SCRIPTDIR/alias.zsh"

# Load additional PATHs
source "$SCRIPTDIR/path.zsh"

# Load theme
zinit snippet "$SCRIPTDIR/binary.zsh-theme"
