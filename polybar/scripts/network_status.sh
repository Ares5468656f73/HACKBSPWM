#!/usr/bin/env bash

network=$(ip a | grep "192" | awk '{print $2}' | cut -d'/' -f1)
if [ $? -eq 0 ]; then
  echo "%{F#7aa2f7}󰖟 %{F-}$network"
else
  echo "%{F#e0af68}󰪎 %{F-}"
fi
