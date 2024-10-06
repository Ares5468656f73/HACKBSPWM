#!/usr/bin/env bash

battery_percentage=$(upower -i $(upower -e | grep battery) | grep percentage | awk '{print $2}' | tr -d "%")
battery_status=$(upower -i $(upower -e | grep battery) | grep state | awk '{print $2}')

if [ -z "$battery_percentage" ] || [ -z "$battery_status" ]; then
  echo "%{F#f7768e}󱉝 %{F-}"  # If battery doesnt exist
elif [ "$battery_status" == "charging" ]; then
  echo "%{F#73daca} $battery_percentage%%{F-}"  # if it is charging
else
  echo "%{F#7dcfff} $battery_percentage%%{F-}"  # normal percentage
fi
