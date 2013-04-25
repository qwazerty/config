# Zsh prompt
#PS1="\n${rt}[\t] ${cR}[\u@\h:${cB}\w] \$(print_return \${ret_})\n${cR}\$${clr} "
# This will set the default prompt to the walters theme

# precmd : stuff that need to be refreshed before each prompt display
function precmd ()
{
    # Refresh VCS infos (used for GIT in our case)
    vcs_info

    # Set TERMWIDTH as number of colums minus one.
    local TERMWIDTH
    (( TERMWIDTH = $COLUMNS - 1 ))

    # System infos : username@hostname:tty(SHLVL)
    SYSINFOS="%n@%M:%l(%L)"
    # FULL System informations with fancy stuff
    SYSINFOS_FULL=$PRE_SYSINFOS$SYSINFOS$POST_SYSINFOS

    # FULL Working directory with fancy stuff
    WD_FULL=$RET$PRE_WD$WD$POST_WD

    # GIT Infos : currently only the current branch name
    GIT_INFOS=${vcs_info_msg_0_}

    # ${[varname]:-[string]} returns the value of ${[varname]} normally,
    # but uses [string] instead if ${[varname]} doesn't exist.
    # ${:-[string]} is a quick way to do variable-related things to fixed strings.
    # ${([flags])[varname]} uses the flags to alter how the value of the
    # variable is handled. The percent sign causes prompt expansion to be done
    # on the variable.
    local SYSINFOS_len=${#${(%):-$SYSINFOS_FULL}}
    local WD_len=${#${(%):-$WD}}
    local WD_FULL_len=${#${(%):-$WD_FULL}}

    # Truncates the path if it's too long to hold on a single line

    WD_NEWLEN=0
    FILLBAR=""
    if [[ "$SYSINFOS_len + $WD_FULL_len" -gt $TERMWIDTH ]]; then
        ((WD_NEWLEN=$TERMWIDTH - $SYSINFOS_len - ($WD_FULL_len - $WD_len)))
    else
        FILLBAR="$SHIFT_IN\${(l.(($TERMWIDTH - ($SYSINFOS_len + $WD_FULL_len)))..${HBAR}.)}$SHIFT_OUT"
    fi
    # Truncates the working directory string
    WD_truncated="%$WD_NEWLEN<...<$WD%<<"

    # Refresh the old values, apply colors  and apply the SHIFTs on fancy stuff around it

    SYSINFOS="%B$COL_SYSINFOS%n%b$COL_INFOS@%B$COL_SYSINFOS%M%b$COL_INFOS:%l(%L)"
    WD_FULL=%b$COL_LINES$SHIFT_IN$PRE_WD$SHIFT_OUT%B$COL_WD$WD_truncated%b$COL_LINES$SHIFT_IN$POST_WD$SHIFT_OUT
    SYSINFOS_FULL=$SHIFT_IN$PRE_SYSINFOS$SHIFT_OUT$SYSINFOS%b$COL_LINES$SHIFT_IN$POST_SYSINFOS$SHIFT_OUT
    # RINFOS ; Random informations displayed on the RPROMPT
    SECOND_LINE="$SHIFT_IN$LL_CORNER$SHIFT_OUT$GIT_INFOS%B$COL_PROMPT> %b"
    RINFOS_FULL="%B%S$PR_RED$RET%s$COL_TIME$TIME %b$COL_INFOS$DATE%b$COL_LINES$SHIFT_IN$LR_CORNER$SHIFT_OUT$PR_NO_COLOR"
}

# precmd is called just before the prompt is printed
function __precmd() {

    #title "zsh" "%m:%55<...<%~"
    local TERMWIDTH
    (( TERMWIDTH = $COLUMNS - 1 ))

    LP1="%{$fg_bold[red]%}[%T]%{$reset_color%}$fg_bold[magenta]-$reset_color%{$fg_bold[green][%~]$reset_color%}"

    LP2="%{$fg_bold[magenta]%}%#%{$reset_color%} "

    RP1="[%{$fg_bold[cyan]%}%n%{$fg_bold[red]%}@%{$fg_bold[blue]%}%M%{$reset_color%}]"

    LP1_LEN="${#${(%):-$LP1}}"
    RP1_LEN="${#${(%):-$RP1}}"

    HBAR="-"

    FILLER="\${(l.(($TERMWIDTH - ($LP1_LEN + $RP1_LEN)))..${HBAR}.)}"

}

function prompt_load_special_chars ()
{
    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}
    SET_CHARSET="%{$terminfo[enacs]%}"
    SHIFT_IN="%{$terminfo[smacs]%}"
    SHIFT_OUT="%{$terminfo[rmacs]%}"
    HBAR=${altchar[q]:--}
    UL_CORNER=${altchar[l]:--}
    UR_CORNER=${altchar[k]:--}
    LL_CORNER=${altchar[m]:--}
    LR_CORNER=${altchar[j]:--}
}

function prompt_load_vcs_infos ()
{
    # VCS Support
    autoload -Uz vcs_info
    # Format the vcs infos to only get the git branch
    zstyle ':vcs_info:*' actionformats \
        '%F{13}%F{13}%b%F{11}|%F{9}%a%F{11}%f'
    zstyle ':vcs_info:*' formats \
        '%F{13}%F{5}#%b%F{14}%f'
    zstyle ':vcs_info:*' enable git hg
}

function prompt_load_default_colors()
{
    COL_SYSINFOS=$PR_CYAN   # SYSINFOS Color
    COL_WD=$PR_BLUE         # Working Directory Color
    COL_INFOS=$PR_YELLOW    # Color of secondary Infos (separator, date, etc)
    COL_LINES=$PR_CYAN      # Global Color (Lines, etc)
    COL_TIME=$PR_GREEN      # Hour color
    COL_PROMPT=$PR_BLUE     # Prompt color
}

function prompt_load_avalon_colors()
{
    COL_SYSINFOS=$PR_GREEN  # SYSINFOS Color
    COL_WD=$PR_BLUE         # Working Directory Color
    COL_INFOS=$PR_YELLOW    # Color of secondary Infos (separator, date, etc)
    COL_LINES=$PR_GREEN     # Global Color (Lines, etc)
    COL_TIME=$PR_CYAN       # Hour color
    COL_PROMPT=$PR_BLUE     # Prompt color
}

function prompt_load_colors ()
{
    # See if we can use colors.
    autoload colors zsh/terminfo

    if [[ "$terminfo[colors]" -ge 8 ]]; then
        colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
        eval PR_$color='%{$fg[${(L)color}]%}'
        #eval PR_BOLD_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"

    # Set the colors depending on the hostname
    if [ $HOST = "avalon" ]; then
        prompt_load_avalon_colors
    else
        prompt_load_default_colors
    fi
}

# Stuff that only needs to be set once (when a new instance of zsh is ran)
function prompt_setprompt ()
{
    setopt prompt_subst
    setopt extended_glob

    prompt_load_special_chars
    prompt_load_vcs_infos
    prompt_load_colors

    # Working directory
    WD="%~"
    # Pre working directory : characters to display before wd
    PRE_WD="$UL_CORNER$HBAR("
    # Post working directory : characters to display after wd
    POST_WD=")$HBAR"

    # Pre system infos : characters to display before sysinfos
    PRE_SYSINFOS="$HBAR("
    # Post system infos : characters to display after sysinfos
    POST_SYSINFOS=")$HBAR$UR_CORNER"

    # RET : empty if return value is 0, value else
    RET="%(?..[%?]%s~)"

    # HOUR formated HOUR:MINUTES
    TIME="%D{%H:%M}"

    # DATE formated
    DATE="%D{%a,%b} %D{%d}"

    # (e) flag : cause a variable to undergo variable substitution
    export PROMPT='
$SET_CHARSER\
$WD_FULL\
${(e)FILLBAR}\
$SYSINFOS_FULL\

$SECOND_LINE\
'

    export RPROMPT='$RINFOS_FULL'
}

prompt_setprompt
