# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# keymap.sh for SCRIPTS
# Change keymap by looping through a given set of keymap (us and fr here)

#!/bin/bash

keymaps=('us' 'us_intl')

layout=$(setxkbmap -query | grep "layout" | grep -Eo "[^ ]*$")
current="$layout"
next=0
loop=0
keynum=${#keymaps}

while [[ $loop < 2 ]]; do
    for map in "${keymaps[@]}"; do
        if [ $next == 1 ]; then
            setxkbmap $map
            notify-send -t 2000 "Keymap Changed" "$map"
            exit 0
        fi
        if [[ "$map" = "$current" ]]; then
            next=1
        fi
    done
    loop=$(($loop + 1))
done

# EOF
