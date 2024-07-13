#!/usr/bin/bash

getColor ()
{
  grep "$1" ~/.config/polybar/colors.ini | cut -d'=' -f2| tr -d ' '  
}

background=$(getColor "background")
backgroundAlt=$(getColor "background-alt")
foreground=$(getColor "foreground")
primary=$(getColor "primary")
secondary=$(getColor "secondary")
alert=$(getColor "alert")
disabled_bash=$(getColor "disabled")

# Doing the port scanner using nmap
OPEN_PORTS=$(nmap -p- --open -T4 localhost | grep 'open' | awk '{print $1}')

# See if there is open ports
if [ -z "$OPEN_PORTS" ]; then
    # Show secure icon with a color
    echo -e "%{F$primary} %{F-}"
else
    # Format the ports to show correctly in the polybar
    FORMATTED_PORTS=$(echo $OPEN_PORTS | tr '\n' ' ')
    # show the open ports
    echo "%{F$alert} %{F-} %{F$secondary}$FORMATTED_PORTS%{F-}"
fi
