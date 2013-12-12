[ -e ~/.myxinitrc ] && . ~/.myxinitrc
[ -e ~/.Xresources ] && xrdb ~/.Xresources
setxkbmap us
xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'
setterm -blank 0 -powersave off -powerdown 0
xset -dpms
xset r rate 200 80
xset s off
#exec i3
