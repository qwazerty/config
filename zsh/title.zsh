# Set the current command as title
# Jobs display thanks to Chmool

title_jobs() {
    TITLE_JOBS=$(jobs | wc -l 2>/dev/null)
    [ $TITLE_JOBS -ne 0 ] && echo "($TITLE_JOBS) "
}

title_path() {
    if [[ "$PWD" =~ ^"$HOME"(/|$) ]]; then
        echo "[~${PWD#$HOME}]"
    else
        echo "[$PWD]"
    fi
}

title_ssh() {
    [ -n "$SSH_CONNECTION" ] && echo "[ssh] "
}

set_title() {
    echo -n "\e]2;$(title_ssh)$(title_jobs)$(title_path) $1\a\a"
}

set_title_precmd() {
    set_title "${JOBS}${USER}@${HOST}"
}

set_title_preexec() {
    set_title $1
}

if [ "$TERM" != "linux" ]; then
    add-zsh-hook precmd set_title_precmd
    add-zsh-hook preexec set_title_preexec
fi
