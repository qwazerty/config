PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

[ -e ~/.myxinitrc ] && . ~/.myxinitrc
[ -e ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -d ~/.Xresources.d ] && xrdb -merge ~/.Xresources.d/*
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
setxkbmap us
setxkbmap -option caps:none
xset -dpms
xset r rate 200 80
xset s on
exec /usr/bin/i3
