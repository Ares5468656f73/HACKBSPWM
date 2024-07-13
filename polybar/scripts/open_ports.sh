#!/usr/bin/bash

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

# Realiza el escaneo con nmap y filtra los resultados para obtener solo los puertos abiertos
OPEN_PORTS=$(nmap -p- --open -T4 localhost | grep 'open' | awk '{print $1}')

# Verifica si hay puertos abiertos
if [ -z "$OPEN_PORTS" ]; then
    # Mostrar un ícono sin puertos abiertos con el color de alerta
    echo -e "%{F$primary} %{F-}"
else
    # Formatea los puertos abiertos para que se vean bien en Polybar
    FORMATTED_PORTS=$(echo $OPEN_PORTS | tr '\n' ' ')
    # Mostrar los puertos abiertos con el color primario
    echo "%{F$alert} %{F-} %{F$secondary}$FORMATTED_PORTS%{F-}"
fi
