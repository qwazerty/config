PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

[ -e ~/.myxinitrc ] && . ~/.myxinitrc
[ -e ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -d ~/.Xresources.d ] && xrdb -merge ~/.Xresources.d/*
setxkbmap us
setxkbmap -option caps:none
setterm -blank 0 -powersave off -powerdown 0
xset -dpms
xset r rate 200 80
xset s off
exec /usr/bin/i3
