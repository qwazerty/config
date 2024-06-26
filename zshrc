#################################
# dotzshrc config file          #
# by Kevin "qwazerty" Houdebert #
#################################

# Set the editor to vim
export EDITOR='vim'

# Set pager
export PAGER='less'

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
alias g='git'
alias ..='source ~/.zshrc'

# Start ssh-agent
alias ssha='ssh-agent | grep -v echo > ~/.ssh/ssh.agent && source ~/.ssh/ssh.agent && ssh-add'
alias sshk='eval $(ssh-agent -k); rm ~/.ssh/ssh.agent'
alias sshr='ssh-keygen -R'
alias ssht='ssh-keygen -R $(terraform show | grep default_ip_address | cut -d "=" -f2)'
tlscrt(){ openssl x509 -in $1 -text -noout }
tlscsr(){ openssl req -text -noout -verify -in $1 }
tlskey(){ openssl rsa -in $1 -check }
pfx(){ PASSPHRASE=$(pwgen -s 14 -1); openssl pkcs12 -export -out $1.pfx -inkey $1.key -in $1.crt -password pass:$PASSPHRASE; echo $PASSPHRASE > $1.txt; echo "Passphrase: $PASSPHRASE" }
pem(){ ls *.crt | sed 's/\.crt//' | xargs -I {} bash -c "cat {}.key {}.crt > {}.pem" }
crt(){ txt=""; while read line; do txt="$txt$line\n"; [ "${line//END}" != "$line" ] && { echo $txt; printf -- "$txt" | openssl x509 -text -noout; txt="" }; done < $@ }

# Custom
copypasta(){ export PROMPT="# "; unset RPROMPT }
netawk() { awk 'function hextodec(str,ret,n,i,k,c){ ret = 0; n = length(str); for (i = 1; i <= n; i++) { c = tolower(substr(str, i, 1)); k = index("123456789abcdef", c); ret = ret * 16 + k }; return ret }
function getIP(str,ret){ ret=hextodec(substr(str,index(str,":")-2,2)); for (i=5; i>0; i-=2) { ret = ret"."hextodec(substr(str,i,2)) }; ret = ret":"hextodec(substr(str,index(str,":")+1,4)); return ret }
NR > 1 {{if(NR==2)print "Local - Remote";local=getIP($2);remote=getIP($3)}{print local" - "remote}}' /proc/net/tcp }
gfor(){ for i in *; do cd "$i"; echo -e "\e[0;33m=== $i ===\e[0m"; $@; cd - >/dev/null; done }
gprune(){ git filter-branch -f --index-filter "git rm -rf --cached --ignore-unmatch $@" HEAD }
tft(){ echo $@ | xargs -I@ echo -target='@' | xargs echo terraform apply }
drun(){ docker run -it $1 bash }
dprune(){ docker stop $(docker ps -q); docker container prune -f; docker image prune -af; docker volume prune -f }
alias k='kubectl'
alias ksys='kubectl --namespace=kube-system'
alias klog='kubectl logs -f'
krun(){ kubectl run -it --image $1 -- bash }
ktop(){ kubectl get nodes --no-headers | awk '{print $1}' | xargs -I {} sh -c 'echo {}; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo' }

# UNsafe SSH
alias unssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias unscp='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias unsshdss='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -oHostKeyAlgorithms=+ssh-dss'

# Ping test
alias pt='ping www.google.com'
alias myip='curl ifconfig.co'
scurl(){ while true; do curl -s --write-out "[%{http_code}] %{time_total}s\\n" -s "$@" | grep -E --color '\[[^2][0-9]{2}\]|$'; sleep 1; done }
qcurl(){ while true; do curl -s -o/dev/null --write-out "[%{http_code}] %{time_total}s\\n" "$@" | grep -E --color '\[[^2][0-9]{2}\]|$'; sleep 1; done }
qfcurl(){ while true; do curl -s -o/dev/null --write-out "[%{http_code}] %{time_total}s\\n" "$@" | grep -E --color '\[[^2][0-9]{2}\]|$'; done }
tcurl(){ while true; do curl -s -o/dev/null --write-out "dns:[%{time_namelookup}s] connect:[%{time_connect}s] appconnect:[%{time_appconnect}s]\
  pretransfer:[%{time_pretransfer}s] redirect:[%{time_redirect}s] starttransfer:[%{time_starttransfer}s] - total:[%{time_total}s]\\n" "$@";
  sleep 1;
  done
}
tlscurl(){ curl -sv "$@" 2>&1 | grep 'Server certificate' -A6 }

# Source ssh-agent
#[[ -e ~/.ssh/ssh.agent ]] && . ~/.ssh/ssh.agent
#ssh-add -l &>/dev/null || { ssha; }

# Binding emacs mode bindings keys
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word

# Zsh autoload
autoload -Uz compinit bashcompinit colors vcs_info select-word-style
compinit
bashcompinit
colors
select-word-style bash

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
  [[ "$KUBE_CONTEXT" =~ "prod" ]] && KUBE_BG="%{$bg[red]%}" || KUBE_BG="%{$reset_color%}"
}

export PROMPT='%{$fg[yellow]%}%n%{$fg[red]%}@%m %{$fg[blue]%}%3~ %(?.%{$fg[blue]%}.%{$fg[red]%})%#%{$reset_color%} '
export RPROMPT='${KUBE_BG}${KUBE_CONTEXT}${vcs_info_msg_0_}%{$fg[blue]%}%*%{$reset_color%}'

true
