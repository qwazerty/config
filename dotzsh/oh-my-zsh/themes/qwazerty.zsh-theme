function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) %(?..%{$fg_bold[red]%})%_$(prompt_char)%{$reset_color%} '

RPROMPT='%{$fg_bold[red]%}$(git_prompt_info) ${time}'

time="%(?.%{$fg_bold[blue]%}.%{$fg[green]%})%*%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
