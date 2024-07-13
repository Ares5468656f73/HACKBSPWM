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

# Archivo donde se almacenará el mensaje
MESSAGE_FILE="$HOME/.config/polybar/scripts/message.txt"

# Si el archivo no existe, crea uno con un mensaje predeterminado
if [ ! -f "$MESSAGE_FILE" ]; then
    echo "%{F$secondary}󰓾 %{F-}No target" > "$MESSAGE_FILE"
fi

# Lee el mensaje del archivo y lo muestra en Polybar
cat "$MESSAGE_FILE"

