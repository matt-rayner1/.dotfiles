#!/usr/bin/env bash

# Terminate running bar instances
killall -q polybar

# Launch bar
#echo "---" | tee -a /tmp/polybar1.log
#polybar 2>&1 | tee -a /tmp/polybar1.log & disown

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload main &
    done
else
    polybar --reload main &
fi


echo "Bar launched..."
