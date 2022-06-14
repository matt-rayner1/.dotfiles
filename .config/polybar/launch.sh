#!/usr/bin/env bash

# Terminate running bar instances
killall -q polybar

# Launch bar
echo "---" | tee -a /tmp/polybar1.log
polybar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bar launched..."
