#!/bin/bash

# Archivo donde se almacenará el mensaje
MESSAGE_FILE="$HOME/.config/polybar/scripts/message.txt"

# Si el archivo no existe, crea uno con un mensaje predeterminado
if [ ! -f "$MESSAGE_FILE" ]; then
    echo "󰓾 No target" > "$MESSAGE_FILE"
fi

# Lee el mensaje del archivo y lo muestra en Polybar
cat "$MESSAGE_FILE"

