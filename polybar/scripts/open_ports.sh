#!/bin/bash

# Dirección IP local (localhost)
TARGET="127.0.0.1"

# Realiza el escaneo con nmap y filtra los resultados para obtener solo los puertos abiertos
OPEN_PORTS=$(nmap -p- --open -T4 $TARGET | grep 'open' | awk '{print $1}')

# Verifica si hay puertos abiertos
if [ -z "$OPEN_PORTS" ]; then
    echo " "
else
    # Formatea los puertos abiertos para que se vean bien en Polybar
    FORMATTED_PORTS=$(echo $OPEN_PORTS | tr '\n' ' ')
    echo " :$FORMATTED_PORTS"
fi

