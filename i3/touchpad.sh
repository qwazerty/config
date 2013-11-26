if [ `synclient -l | grep TouchpadOff | gawk '{ print $3 }'` -eq 0 ]; then
    synclient TouchpadOff=1;
else
    synclient TouchpadOff=0;
fi
