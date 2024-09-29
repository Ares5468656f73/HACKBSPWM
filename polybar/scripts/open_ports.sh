#!/usr/bin/env bash

getColor ()
{
  grep "$1" ~/.config/polybar/colors.ini | cut -d'=' -f2| tr -d ' '  
}

primary=$(getColor "active")
alert=$(getColor "alert")

# Doing the port scanner using nmap
OPEN_PORTS=$(nmap -p- --open -min-rate 5000 -n -Pn localhost | grep 'open' | awk '{print $1}')

# See if there is open ports
if [ -z "$OPEN_PORTS" ]; then
    # Show secure icon with a color
    echo -e "%{F$primary} %{F-}"
else
    # Format the ports to show correctly in the polybar
    FORMATTED_PORTS=$(echo $OPEN_PORTS | tr '\n' ' ')
    # show the open ports
    echo "%{F$alert}󰦞 %{F-} %{F$secondary}$FORMATTED_PORTS%{F-}"
fi
