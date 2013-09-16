autoload -U colors && colors
setopt prompt_subst

function prompt_char {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo %{$fg_bold[red]%}"("${ref#refs/heads/}")"%{$reset_color%}
}

function clock {
    echo "%(?.%{$fg_bold[blue]%}.%{$fg[green]%})%*%{$reset_color%}"
}

export PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) ${parse_git_branch}$(prompt_char)%{$reset_color%} '
export RPROMPT='$(parse_git_branch) $(clock)'
