alias src='source ~/.bashrc'
alias us='setxkbmap us'
alias fr='setxkbmap fr'
alias l='ls --color'
alias la='ls -la'
alias ll='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias e='vim'
alias c='chromium-browser'
alias gadd='git add -v'
alias gcommit='git commit -am '
alias gpush='git push -v origin master'
alias gpull='git pull -v origin master'
alias glist='git diff --cached --name-only'
alias gstat='git status'
alias gshow='git ls-tree --name-only -r HEAD'
alias z='zlock -immed -text "Run little kitty. RUN!"'
alias back='~/test/background.sh'

# Mask chmod when creating file to prevent r/w if not user
umask 066

# NO CAPS LOCK !!!11!
setxkbmap -option ctrl:nocaps

rec_path()
{
   if [ `echo "$1" | wc` -lt 10 ]; then
      echo "$1"
   else
      rec_path ``
   fi
}

computed_path='\w'

clrblu='\[\e[0;36m\]'
clrred='\[\e[0;31m\]'
clrBred='\[\e[1;31m\]'
clrBblu='\[\e[1;34m\]'
clrrst='\[\e[0m\]'

PS1="${clrblu}[\t] ${clrred}[\u@${clrBblu}${computed_path}]\n\
${clrBred}\$${clrrst} "