# direnv
# Automatically export environment variables in folders
zinit \
    from"gh-r" \
    as"program" \
    mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' \
    pick"direnv" \
    src="zhook.zsh" \
    for @direnv/direnv

# fzf
# Fuzzy finder
zinit \
    from"gh-r" \
    as"program" \
    sbin"fzf" \
    for @junegunn/fzf

# rg
# Ripgrep
zinit \
    from"gh-r" \
    as"program" \
    sbin"ripgrep*/rg" \
    for @BurntSushi/ripgrep

# fd
# Fast find
zinit \
    from"gh-r" \
    as"program" \
    sbin"fd*/fd" \
    for @sharkdp/fd

# Evans
zinit \
    from"gh-r" \
    as"program" \
    sbin"evans" \
    for @ktr0731/evans

# Completion and history search
zinit for \
    https://github.com/junegunn/fzf/raw/master/shell/completion.zsh \
    https://github.com/junegunn/fzf/raw/master/shell/key-bindings.zsh
