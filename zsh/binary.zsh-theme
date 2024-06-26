# Based on the 'theunraveler' zsh theme

PROMPT='%{$FG[033]%}[%m %c] %{$reset_color%}'
[[ $UID -eq 0 ]] && PROMPT='%{$fg[red]%}[%m %c] %{$reset_color%}'

RPROMPT='%{$FG[033]%}$(git_prompt_info)%{$reset_color%} $(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%}A"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}M"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}D"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[033]%}R"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}U"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}U"

