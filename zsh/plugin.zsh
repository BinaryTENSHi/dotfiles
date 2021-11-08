# $PATH wrapper
# Must be loaded synchronously: other scripts use the sbin ice
zinit light NorthIsUp/z-a-bin-gem-node

# ZSH completions
zinit ice wait blockf lucid \
    atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# Syntax highlighting
zinit ice wait lucid \
    atinit"zpcompinit; zpcdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

# History substring search
zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search
