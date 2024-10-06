#!/usr/bin/env bash

battery_percentage=$(upower -i $(upower -e | grep battery) | grep percentage | awk '{print $2}' | tr -d "%")
battery_status=$(upower -i $(upower -e | grep battery) | grep state | awk '{print $2}')

# Verifica si upower falló
if [ -z "$battery_percentage" ] || [ -z "$battery_status" ]; then
  echo "%{F#f7768e}󱉝 %{F-}"  # Muestra un ícono de error si no se obtiene información de la batería
elif [ "$battery_status" == "charging" ]; then
  echo "%{F#73daca} $battery_percentage%%{F-}"  # Muestra el icono de carga
else
  echo "%{F#7dcfff} $battery_percentage%%{F-}"  # Muestra el porcentaje cuando no está cargando
fi
