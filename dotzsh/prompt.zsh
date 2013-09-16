autoload -U colors && colors

function prompt_char {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F{11}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn

precmd () {
    vcs_info
    zstyle ':vcs_info:*' formats '-%F{blue}[%F{red}%u%b%c%F{blue}]%F{red}'
}

setopt prompt_subst

PROMPT="%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) ${vcs_info_msg_0_}%_$(prompt_char)%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
