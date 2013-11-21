# Set the current command as title
# Jobs display thanks to Chmool

set_title() {
    unset TITLE_SSH
    [ -n "$SSH_CONNECTION" ] && TITLE_SSH="[ssh] "
    print -Pn "\e]0;${TITLE_SSH}[%~] $1\a\a"
}

set_title_precmd() {
    unset JOBS
    [ `print -Pn %j` -gt 0 ] && JOBS="(%j) "
    set_title $JOBS$0
}

set_title_preexec() {
    set_title $1
}

add-zsh-hook precmd set_title_precmd
add-zsh-hook preexec set_title_preexec
