#!/usr/bin/env bash

# Kill all running instances of Polybar
killall -q polybar

# Wait until processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar main --config=~/.config/polybar/config.ini &
