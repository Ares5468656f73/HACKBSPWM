#!/usr/bin/env bash

# Nombre de la barra que deseas controlar
BAR_NAME="shutdown_buttons"

# Verificar si la barra está en ejecución
if pgrep -x "polybar" -a | grep -q "$BAR_NAME"; then
    # Si está en ejecución, cerrarla con pkill
    pkill -f "polybar $BAR_NAME"
    # Restaurar el padding del monitor a su valor original (ej. 0px en todos lados)
    bspc config top_padding 40
else
    # Aumentar el padding superior para hacer espacio para la barra (ej. 30px)
    bspc config top_padding 0
    # Lanzar la barra
    polybar $BAR_NAME &
fi

