# $PATH wrapper
# Must be loaded synchronously: other scripts use the sbin ice
zinit load NorthIsUp/z-a-bin-gem-node

# Syntax highlighting
# ZSH completions
zinit lucid for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

# History substring search
zinit load zsh-users/zsh-history-substring-search
