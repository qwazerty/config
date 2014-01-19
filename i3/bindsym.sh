#!/bin/bash

if [ -e ~/.mybindsym.sh ]; then
    ~/.mybindsym.sh $1
    exit
fi

XF86AudioMute() {
    amixer -c 0 set Master mute
}

XF86AudioLowerVolume() {
    amixer -c 0 set Master 2- unmute
}

XF86AudioRaiseVolume() {
    amixer -c 0 set Master 2+ unmute
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
    i3lock -c 420042
}

Zsuspend () {
    exit
}

Print () {
    exit
}

case "$1" in
    XF86AudioMute)
        XF86AudioMute
        ;;
    XF86AudioLowerVolume)
        XF86AudioLowerVolume
        ;;
    XF86AudioRaiseVolume)
        XF86AudioRaiseVolume
        ;;
    XF86AudioPlay)
        XF86AudioPlay
        ;;
    XF86Tools)
        XF86Tools
        ;;
    XF86HomePage)
        XF86HomePage
        ;;
    XF86Mail)
        XF86Mail
        ;;
    XF86Reload)
        XF86Reload
        ;;
    XF86Launch6)
        XF86Launch6
        ;;
    Zlock)
        Zlock
        ;;
    Zsuspend)
        Zsuspend
        ;;
    Print)
        Print
        ;;
esac
