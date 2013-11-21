# Set the current command as title
# Jobs display thanks to Chmool

set_title() {
    unset TITLE_SSH
    unset JOBS
    [ `jobs %% | wc -l` -gt 0 ] && JOBS="(%j) "
    [ -n "$SSH_CONNECTION" ] && TITLE_SSH="[ssh] "
    print -Pn "\e]0;${TITLE_SSH}${JOBS}[%~] $1\a\a"
}

set_title_precmd() {
    set_title "${JOBS}%n@%m"
}

set_title_preexec() {
    CMD=`echo $1 | tr -s " "`
    case "$CMD" in
        ("fg" | "fg ")
            CMD=`jobs %% | tr -s ' ' | cut -d' ' -f1,4-`
            ;;
        ("fg %"*)
            CMD=`jobs ${1/fg /} | tr -s ' ' | cut -d' ' -f1,4-`
            ;;
    esac
    set_title $CMD
}

add-zsh-hook precmd set_title_precmd
add-zsh-hook preexec set_title_preexec
