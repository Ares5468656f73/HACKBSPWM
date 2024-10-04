#!/usr/bin/env bash

# Doing the port scanner using nmap
OPEN_PORTS=$(nmap -p- --open -min-rate 5000 -n -Pn localhost | grep 'open' | awk '{print $1}')

# See if there is open ports
if [ -z "$OPEN_PORTS" ]; then
    # Show secure icon with a color
    echo -e "%{F#7aa2f7} %{F-}"
else
    # Format the ports to show correctly in the polybar
    FORMATTED_PORTS=$(echo $OPEN_PORTS | tr '\n' ' ')
    # show the open ports
    echo "%{F#f7768e}󰦞 %{F-} %{#e0af68}$FORMATTED_PORTS%{F-}"
fi