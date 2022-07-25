#!/bin/sh

CURRENT_STATUS=$(playerctl --player=spotify status)

if [[ $CURRENT_STATUS == "Playing" ]]; then
    spotifyctl -q pause
    polybar-msg action "#spotify-playpause.hook.1" >/dev/null
elif [[ $CURRENT_STATUS == "Paused" ]]; then 
    spotifyctl -q playpause
    polybar-msg action "#spotify-playpause.hook.0" >/dev/null
fi
