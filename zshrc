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

alias tmux='tmux -2'
alias g='git'
alias ..='source ~/.zshrc'

# Start ssh-agent
alias ssha='ssh-agent | grep -v echo > ~/.ssh/ssh.agent && source ~/.ssh/ssh.agent && ssh-add'
alias sshk='eval $(ssh-agent -k); rm ~/.ssh/ssh.agent'
alias sshr='ssh-keygen -R'
alias ssht='ssh-keygen -R $(terraform show | grep default_ip_address | cut -d "=" -f2)'
pfx(){ PASSPHRASE=$(pwgen -s 14 -1); openssl pkcs12 -export -out $1.pfx -inkey $1.key -in $1.crt -password pass:$PASSPHRASE; echo $PASSPHRASE > $1.txt; echo "Passphrase: $PASSPHRASE" }

# Custom
alias taa='terraform apply -auto-approve'
alias tdf='terraform destroy -force'
alias tda='terraform destroy -force && terraform apply -auto-approve'
alias k='kubectl'
ktop(){ kubectl get nodes --no-headers | awk '{print $1}' | xargs -I {} sh -c 'echo {}; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo' }

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
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Zsh autoload
autoload -Uz compinit colors vcs_info
compinit
colors

# Disable beep sound
unsetopt beep

# Disable matching
unsetopt nomatch

# Disable extented globing
unsetopt extendedglob

# Ignore duplicate in history
setopt histignoredups

# Set prompt substitution
setopt prompt_subst

zstyle ':completion:*' verbose true
zstyle ':completion:*' menu select=1
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%{$fg[red]%}(%{$fg[cyan]%}%b%{$fg[red]%}) "
type kubectl >/dev/null && source <(kubectl completion zsh)
type helm >/dev/null && source <(helm completion zsh)

# Load custom conf file
[[ -e ~/.myzshrc ]] && source ~/.myzshrc
[[ -d ~/.zsh/ ]] && for i in ~/.zsh/*; do source $i; done

precmd(){
  vcs_info
  [[ -e ~/.kube/config ]] && KUBE_CONTEXT="%{$fg[red]%}(%{$fg[cyan]%}$(grep -oP 'current-context: \K[-\w]+' ~/.kube/config)%{$fg[red]%}) "
}

export PROMPT='%{$fg[yellow]%}%n%{$fg[red]%}@%m %{$fg[blue]%}%3~ %(?.%{$fg[blue]%}.%{$fg[red]%})%#%{$reset_color%} '
export RPROMPT='${KUBE_CONTEXT}${vcs_info_msg_0_}%{$fg[blue]%}%*%{$reset_color%}'

true
