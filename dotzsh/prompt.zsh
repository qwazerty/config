autoload -U colors && colors
setopt prompt_subst

function prompt_char {
    echo -n "%(?.%{$fg_bold[blue]%}.%{$fg_bold[red]%})"
    if [ $UID -eq 0 ]; then echo -n "#"; else echo -n $; fi
    echo -n "%{$reset_color%}"
}

function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "%{$fg_bold[red]%}(${ref#refs/heads/})%{$reset_color%} "
}

function clock {
    echo "%(?.%{$fg_bold[blue]%}.%{$fg_bold[red]%})%*%{$reset_color%}"
}

function preexec {
    typeset -gi CALCTIME=1
    typeset -gi CMDSTARTTIME=SECONDS
}

function precmd {
    if (( CALCTIME )); then
        typeset -gi TIMER_SHOW=SECONDS-CMDSTARTTIME
    fi
    typeset -gi CALCTIME=0
}

function timer_show {
    if [ "${TIMER_SHOW}" -ne 0 ]; then
        echo "%{$fg_bold[cyan]%}${TIMER_SHOW}s "
    fi
}

export PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) ${parse_git_branch}$(prompt_char)%{$reset_color%} '
export RPROMPT='$(timer_show)$(parse_git_branch)$(clock)'
