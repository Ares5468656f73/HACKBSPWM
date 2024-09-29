#!/usr/bin/env bash

getColor ()
{
  grep "$1" ~/.config/polybar/colors.ini | cut -d'=' -f2| tr -d ' '  
}

secondary=$(getColor "secondary")

# File were message will be loaded
MESSAGE_FILE="$HOME/.config/polybar/scripts/message.txt"

# If file doesn`t exist create one with a default message
if [ ! -f "$MESSAGE_FILE" ]; then
    echo "%{F$secondary}󰓾 %{F-}No target" > "$MESSAGE_FILE"
fi

# Read the file
cat ~/.config/polybar/scripts/message.txt
