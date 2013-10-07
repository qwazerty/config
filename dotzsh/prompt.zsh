autoload -U colors && colors
setopt prompt_subst

function prompt_char {
    echo -n "%(?.%{$fg[blue]%}.%{$fg[red]%})"
    if [ $UID -eq 0 ]; then echo -n "#"; else echo -n $; fi
    echo -n "%{$reset_color%}"
}

function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "%{$fg[red]%}(${ref#refs/heads/})%{$reset_color%} "
}

function clock {
    echo "%(?.%{$fg[blue]%}.%{$fg[red]%})%*%{$reset_color%}"
}

function preexec {
    CALCTIME=1
    CMDSTARTTIME=$SECONDS
}

function precmd {
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

export PROMPT='%(!.%{$fg[red]%}.%{$fg[yellow]%}%n%{$fg[red]%}@)%m %{$fg[blue]%}%~ ${parse_git_branch}$(prompt_char)%{$reset_color%} '
export RPROMPT='$(timer_show)$(parse_git_branch)$(clock)'
