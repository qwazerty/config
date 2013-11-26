# Set the current command as title
# Jobs display thanks to Chmool

set_title() {
    [ -n "$SSH_CONNECTION" ]
    print -Pn "\e]0;%(?:[ssh] :)%1(j:(%j) :)[%~] $1\a\a"
}

set_title_precmd() {
    set_title "${JOBS}%n@%m"
}

set_title_preexec() {
    CMD=$1
    case "$CMD" in
        "fg {0,}")
            CMD=`jobs %% | tr -s ' ' | cut -d' ' -f1,4-`
            ;;
        "fg %"*)
            CMD=`jobs ${1/fg /} | tr -s ' ' | cut -d' ' -f1,4-`
            ;;
    esac
    set_title $CMD
}

add-zsh-hook precmd set_title_precmd
add-zsh-hook preexec set_title_preexec
