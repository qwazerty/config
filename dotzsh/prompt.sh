# Zsh prompt
#PS1="\n${rt}[\t] ${cR}[\u@\h:${cB}\w] \$(print_return \${ret_})\n${cR}\$${clr} "
# This will set the default prompt to the walters theme

autoload -U colors && colors

PROMPT="
%{$fg_bold[red]%}[%T]%{$reset_color%}$fg_bold[magenta]-$reset_color\
%{$fg_bold[green][%~]$reset_color%}
%{$fg_bold[magenta]%}$%{$reset_color%} "
RPROMPT="[%{$fg_bold[cyan]%}%n%{$fg_bold[red]%}@\
%{$fg_bold[blue]%}%M%{$reset_color%}]"
