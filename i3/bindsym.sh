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
    i3lock -c 424242
}

Zsuspend () {
    Zlock
    sudo pm-suspend-hybrid
}

Print () {
    XF86Launch6
}

$1
