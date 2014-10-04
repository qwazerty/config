#!/bin/bash

if [ -e ~/.mybindsym.sh ]; then
    ~/.mybindsym.sh $1
    exit
fi

XF86AudioMute() {
    amixer set Master 100%- unmute
}

XF86AudioLowerVolume() {
    amixer set Master 5%- unmute
}

XF86AudioRaiseVolume() {
    amixer set Master 5%+ unmute
}

XF86AudioPlay() {
    exit
}

XF86MonBrightnessDown() {
    xbacklight -dec 10
}

XF86MonBrightnessUp() {
    xbacklight -inc 10
}

XF86Tools() {
    exit
}

XF86HomePage() {
    exit
}

XF86Mail() {
    exit
}

XF86Reload() {
    exit
}

XF86Launch6() {
    if [ `synclient -l | grep TouchpadOff | gawk '{ print $3 }'` -eq 0 ]; then
        synclient TouchpadOff=1
    else
        synclient TouchpadOff=0
    fi
}

Zlock () {
    killall ssh-agent
    if which metalock >/dev/null 2>&1; then
        metalock
    elif which i3lock >/dev/null 2>&1; then
        if [ -e ~/stuff/random/background.png ]; then
            i3lock -i ~/stuff/random/background.png
        else
            i3lock -c 420042
        fi
    fi
}

Zsuspend () {
    Zlock
    sudo pm-suspend-hybrid
}

Print () {
    XF86Launch6
}

$1
