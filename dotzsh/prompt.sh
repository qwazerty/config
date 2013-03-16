# Zsh prompt
#PS1="\n${rt}[\t] ${cR}[\u@\h:${cB}\w] \$(print_return \${ret_})\n${cR}\$${clr} "
# This will set the default prompt to the walters theme

autoload -U colors && colors

NEWLINE="
"

PS_DATE=`date +%R`

PS_WD=`pwd`

LEFT_P1="$NEWLINE%{$fg_bold[red]%}[%T]%{$reset_color%}$fg_bold[magenta]-\
$reset_color%{$fg_bold[green][%~]$reset_color%}"

LEFT_P2="$NEWLINE%{$fg_bold[magenta]%}%#%{$reset_color%} "

RIGHT_P1="[%{$fg_bold[cyan]%}%n%{$fg_bold[red]%}@\
%{$fg_bold[blue]%}%M%{$reset_color%}]"

PROMPT="$LEFT_P1$LEFT_P2"
