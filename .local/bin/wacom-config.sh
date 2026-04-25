#!/bin/sh

for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done

stylus="Wacom One by Wacom M Pen stylus"
# configure the buttons on ${stylus} with your xsetwacom commands...
xsetwacom set "${stylus}" MapToOutput DisplayPort-0
