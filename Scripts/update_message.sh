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

# Message file
MESSAGE_FILE="$HOME/.config/polybar/scripts/message.txt"

# Add the new message
echo "%{F$alert}󰯐 %{F-}%{F$secondary}$1%{F-}" > "$MESSAGE_FILE"


