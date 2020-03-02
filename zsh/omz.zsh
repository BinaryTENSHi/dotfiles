# Load OMZ library
zinit for \
    OMZ::lib/clipboard.zsh \
    OMZ::lib/completion.zsh \
    OMZ::lib/git.zsh \
    OMZ::lib/grep.zsh \
    OMZ::lib/history.zsh \
    OMZ::lib/key-bindings.zsh \
    OMZ::lib/spectrum.zsh \
    OMZ::lib/theme-and-appearance.zsh \

# Load ohmyzsh plugins
zinit wait lucid for \
    OMZ::plugins/git/git.plugin.zsh \
    OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh \
    OMZ::plugins/asdf/asdf.plugin.zsh \
