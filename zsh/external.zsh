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
    for direnv/direnv

# fzf
# Fuzzy finder
zinit \
    from"gh-r" \
    sbin"fzf" \
    for junegunn/fzf-bin

# Completion and history search
zinit for \
    https://github.com/junegunn/fzf/raw/master/shell/completion.zsh \
    https://github.com/junegunn/fzf/raw/master/shell/key-bindings.zsh
