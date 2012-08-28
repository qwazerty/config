alias us='setxkbmap us'
alias fr='setxkbmap fr'
alias la='ls -la'
alias l='ls'
alias ll='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias e='vim'
alias c='chromium-browser'
alias gadd='git add -v'
alias gcommit='git commit -am '
alias gpush='git push -v origin master'
alias gpull='git pull -v origin master'
alias sw4='telnet towel.blinkenlights.nl'

# Tchou-tchou !
alias disable-sl='alias ls="ls --color" && sed -i "s/alias ls/alias ls/" ~/.bashrc'
alias enable-sl='alias ls="sl" && sed -i "s/#*alias ls/alias ls/" ~/.bashrc'

# NO CAPS LOCK !!!11!
setxkbmap -option ctrl:nocaps

#Color branches
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}
 
PS1='\t \[\033[01;37m\]\w\[\033[00;35m\]$(parse_git_branch)\[\033[00m\] \$ ' 

#gitinit function for initialize a git repo
gitinit(){
        git init
        touch .gitignore
        echo -e "# Compiled source #\n###################\n\n*.com\n*.class\n*.dll\n*.exe\n*.o\n*.so\n\n\n# Packages\n############\n# it's better to unpack these files and commit the raw source\n# git has its own built in compression methods\n*.7z\n*.dmg\n*.gz\n*.iso\n*.jar\n*.rar\n*.tar\n*.zip\n\n\n# Logs and databases #\n######################\n*.log\n*.sql\n*.sqlite\n\n# OS generated files #\n######################\n.DS_Store\n.DS_Store?\nehthumbs.db\nIcon?\nThumbs.db" >> .gitignore
        git add .gitignore
        git commit -m "first commit"
        echo -e "\n########\nFirst empty commit... now adding README file\n########\n"
        username=`id -nu`
        current_date=`date`
        touch README
        echo -e "\nGit repo by $username\n Automatically generated on $current_date" >> README
        echo -e "########\nREADME file added...\n########\n"
        git add README
        git commit -am "\nadding README file infos to repository"
        echo -e "\n########\nDone, have fun $username!\n########\n"
}
