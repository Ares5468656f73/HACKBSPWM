#!/usr/bin/env bash

# File were message will be loaded
MESSAGE_FILE="$HOME/.config/polybar/scripts/message.txt"

# If file doesn`t exist create one with a default message
if [ ! -f "$MESSAGE_FILE" ]; then
    echo "%{F#e0af68}󰓾 %{F-}No target" > "$MESSAGE_FILE"
fi

# Read the file
cat ~/.config/polybar/scripts/message.txt