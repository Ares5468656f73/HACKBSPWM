#!/usr/bin/env bash

battery_percentage=$(upower -i $(upower -e | grep battery) | grep percentage | awk '{print $2}' | tr -d "%")
battery_status=$(upower -i $(upower -e | grep battery) | grep state | awk '{print $2}')

# Check if it doesnt have battery
if [ -z "$battery_percentage" ] || [ -z "$battery_status" ]; then
  echo "%{F#f7768e}󱉝 %{F-}"  
elif [ "$battery_status" == "charging" ]; then
  echo "%{F#73daca} $battery_percentage%%{F-}"  # Chargin
else
  echo "%{F#7dcfff} $battery_percentage%%{F-}"  # Normal
fi