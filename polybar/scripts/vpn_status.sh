#!/bin/bash

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

# Check if VPN is running
if pgrep -x "openvpn" > /dev/null; then
    # VPN active
    echo "%{F$primary} %{F-}"
else
    # VPN inactive
    echo "%{F$alert} %{F-}"
fi
