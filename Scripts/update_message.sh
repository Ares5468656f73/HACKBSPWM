#!/bin/bash

# Archivo donde se almacenará el mensaje
MESSAGE_FILE="$HOME/.config/polybar/scripts/message.txt"

# El nuevo mensaje se pasa como argumento al script
echo "󰯐 $1" > "$MESSAGE_FILE"

