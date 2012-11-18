#! /bin/bash

STATE=`amixer get Master | egrep 'Playback.*?\[o' | awk '{ print $6 }'`

if [ $STATE == '[on]' ]; then
    amixer set Master mute
else
    amixer set Master unmute
fi
