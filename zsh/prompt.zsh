autoload -U colors && colors
setopt prompt_subst

function prompt_char {
    echo -n "%(?.%{$fg[blue]%}.%{$fg[red]%})"
    if [ $UID -eq 0 ]; then echo -n "#"; else echo -n $; fi
    echo -n "%{$reset_color%}"
}

function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "%{$fg[red]%}(%{$fg[cyan]%}${ref#refs/heads/}%{$fg[red]%})%{$reset_color%} "
}

function clock {
    echo "%(?.%{$fg[blue]%}.%{$fg[red]%})%*%{$reset_color%}"
}

function prompt_preexec {
    CALCTIME=1
    CMDSTARTTIME=$SECONDS
}

function prompt_precmd {
    if (( CALCTIME )); then
        TIMER_SHOW=$(($SECONDS-$CMDSTARTTIME))
    fi
    CALCTIME=0
}

function timer_show {
    timer=$TIMER_SHOW
    if [ "$timer" -ne 0 ]; then
        tmp=$timer
        timer=$(($tmp / 60)):$(printf "%02d" $(($tmp % 60)))
        echo "%{$fg[red]%}(%{$fg[cyan]%}$timer%{$fg[red]%}) "
    fi
}

function prompt_ssh {
    if [ -n "$SSH_CONNECTION" ]; then
        echo "%{$fg[magenta]%}"
    else
        echo "%{$fg[red]%}"
    fi
}

function prompt_ssh_agent {
    if ssh-add -l >/dev/null 2>&1; then
        echo "%{$fg[red]%}(%{$fg[cyan]%}ssh%{$fg[red]%}) %{$reset_color%}"
    fi
}

add-zsh-hook precmd prompt_precmd
add-zsh-hook preexec prompt_preexec

export PROMPT='%(!.$(prompt_ssh).%{$fg[yellow]%}%n$(prompt_ssh)@)%m %{$fg[blue]%}%~ $(prompt_char)%{$reset_color%} '
export RPROMPT='$(timer_show)$(prompt_ssh_agent)$(parse_git_branch)$(clock)'
