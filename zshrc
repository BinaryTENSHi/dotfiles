export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="binary"

plugins=(
    git
    history-substring-search
    ssh-agent
    zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# Source custom shell aliases
source "$HOME/dotfiles/zsh/alias.zsh"

# Add ~/.local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"
