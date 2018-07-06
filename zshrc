#################################
# dotzshrc config file          #
# by Kevin "qwazerty" Houdebert #
#################################

# Set the editor to vim
export EDITOR='vim'

# Set pager
export PAGER='less'

# Set language to en_US.utf8
export LANG=en_US.UTF-8

# Set TERMINAL for i3-sensible-terminal
export TERMINAL=urxvt

if [[ -n "$TMUX" ]]; then
  export TERM=screen-256color
fi

# Set NNTP Server for epita newsgroups (slrn)
export NNTPSERVER=news.epita.fr

# History file path
export HISTFILE=~/.histfile

# Zsh session history size
export HISTSIZE=100000

# History file size
export SAVEHIST=100000

# Color for less
export LESS_TERMCAP_mb=$(printf "\e[0;31m")
export LESS_TERMCAP_md=$(printf "\e[0;31m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[0;44;33m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[0;32m")

# Common aliases
alias ls='ls --color'
alias l='ls'
alias la='ls -la'
alias ll='ls -l'
alias am='alsamixer'

alias wm_name='xprop | grep WM_CLASS'
alias tmux='tmux -2'
alias g='git'
alias ..='source ~/.zshrc'

# Setxkbmap aliases
alias us='setxkbmap us'
alias usi='setxkbmap us_intl'
alias fr='setxkbmap fr'
alias dv='setxkbmap us dvorak-alt-intl'

# Start ssh-agent
alias ssha='ssh-agent | grep -v echo > ~/.ssh/ssh.agent && source ~/.ssh/ssh.agent && ssh-add'
alias sshk='eval $(ssh-agent -k); rm ~/.ssh/ssh.agent'
alias sshr='ssh-keygen -R'
alias ssht='ssh-keygen -R $(terraform show | grep default_ip_address | cut -d "=" -f2)'

# Custom
alias aursh='bash <(curl aur.sh)'
alias taa='terraform apply -auto-approve'
alias tdf='terraform destroy -force'
alias tda='terraform destroy -force && terraform apply -auto-approve'

# UNsafe SSH
alias unssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias unscp='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

# Ping test
alias pt='ping www.google.com'
alias ptt='ping www.acu.epita.fr'
alias myip='curl ifconfig.co'
scurl(){ while true; do curl --write-out "[%{http_code}] %{time_total}s\\n" -s "$1"; sleep 1; done }
qcurl(){ while true; do curl --write-out "[%{http_code}] %{time_total}s\\n" -s -o/dev/null "$1"; sleep 1; done }

# Source ssh-agent
[[ -e ~/.ssh/ssh.agent ]] && . ~/.ssh/ssh.agent
ssh-add -l &>/dev/null || { ssha; }

# Binding emacs mode bindings keys
bindkey -e
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "${terminfo[kdch1]}" delete-char

# Zsh completion
autoload -U compinit
compinit

# Disable beep sound
unsetopt beep

# Disable matching
unsetopt nomatch

# Disable extented globing
unsetopt extendedglob

# Ignore duplicate in history
setopt histignoredups

zstyle ':completion:*' verbose true
zstyle ':completion:*' menu select=1
zstyle ':vcs_info:*' enable git
type kubectl >/dev/null && source <(kubectl completion zsh)

autoload -U colors && colors
setopt prompt_subst

# Load custom conf file
[[ -e ~/.myzshrc ]] && source ~/.myzshrc
[[ -d ~/.zsh/ ]] && for i in ~/.zsh/*; do source $i; done

export PROMPT='%{$fg[yellow]%}%n%{$fg[red]%}@%m %{$fg[blue]%}%3~ %(?.%{$fg[blue]%}.%{$fg[red]%})%#%{$reset_color%} '
export RPROMPT='$(__git_ps1 "%%{$fg[red]%%}(%%{$fg[cyan]%%}%s%%{$fg[red]%%}) ")%{$fg[blue]%}%*%{$reset_color%}'

true
