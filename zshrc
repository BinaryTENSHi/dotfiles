export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="binary"

# Use legacy completion for docker
zstyle ':omz:plugins:docker' legacy-completion yes

plugins=(
    brew
    direnv
    docker
    eza
    fzf
    git
    history-substring-search
    ssh-agent
    zsh-syntax-highlighting
)

# Include completions from brew installation
HOMEBREW=""
SYSTEM=$(uname)
if [[ $SYSTEM == "Linux" ]]; then
    HOMEBREW="/home/linuxbrew/.linuxbrew"
elif [[ $SYSTEM == "Darwin" ]]; then
    HOMEBREW="/opt/homebrew"
else
    echo "Unhandled: $SYSTEM"
    exit 1
fi
FPATH="$HOMEBREW/share/zsh/site-functions:${FPATH}"

# Let's go oh-my-zsh!
source "$ZSH/oh-my-zsh.sh"

# Source custom shell aliases
source "$HOME/dotfiles/zsh/alias.zsh"

# Do not auto update Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1

# Include cargo
source "$HOME/.cargo/env"

# Include local bin
export PATH="$HOME/.local/bin:$PATH"

. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"
