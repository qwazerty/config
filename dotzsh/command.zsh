# The following lines were added by compinstall
zstyle :compinstall filename '/home/qwazerty/.zshrc'

autoload -U compinit promptinit
compinit
promptinit
# End of lines added by compinstall

# Disable beep sound
unsetopt beep

# Disable matching
unsetopt nomatch

# Disable extented globing
unsetopt extendedglob

set_title() {
    echo -en "\e]0;$1\a"
}

set_title_precmd() {
    set_title $SHELL
}

set_title_preexec() {
    set_title $1
}

add-zsh-hook precmd set_title_precmd
add-zsh-hook preexec set_title_preexec
