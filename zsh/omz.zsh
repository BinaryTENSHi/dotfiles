# Load OMZ library
zinit lucid for \
    OMZL::clipboard.zsh \
    OMZL::completion.zsh \
    OMZL::git.zsh \
    OMZL::grep.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh \
    OMZL::spectrum.zsh \
    OMZL::theme-and-appearance.zsh

# Load ohmyzsh plugins
zinit lucid for \
    OMZP::git \
    OMZP::ssh-agent \
    OMZP::asdf

# Load completions
zinit lucid for \
    as"completion" \
        OMZP::docker/completions/_docker
