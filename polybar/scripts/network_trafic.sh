#!/usr/bin/env bash

# Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"  # Color para los números de paquetes
grayColour="\e[0;37m\033[1m"

# Íconos de Nerd Font
icon_iface=" "  # Icono de Ethernet
icon_rx=""       # Icono de descarga
icon_tx=""       # Icono de subida
icon_separator="---------------------------"

# Función para mostrar los paquetes transmitidos y recibidos
function show_network_packets() {
    clear  # Limpiar la pantalla antes de mostrar la información
    while true; do
        clear  # Limpiar la pantalla en cada actualización
        # Leer el archivo /proc/net/dev, ignorar las dos primeras líneas de encabezados
        while read -r line; do
            # Procesar las líneas que contienen datos de interfaces
            if [[ $line == *:* ]]; then
                iface=$(echo "$line" | awk '{print $1}' | sed 's/:$//')  # Eliminar el ':' al final
                rx_packets=$(echo "$line" | awk '{print $3}')          # Paquetes recibidos
                tx_packets=$(echo "$line" | awk '{print $11}')         # Paquetes transmitidos
                
                # Imprimir la información con colores
                echo -e "${blueColour}${icon_iface}${endColour} ${iface}"
                echo -e "  ${redColour}${icon_rx}${endColour} Paquetes recibidos: ${turquoiseColour}${rx_packets}${endColour}"
                echo -e "  ${greenColour}${icon_tx}${endColour} Paquetes transmitidos: ${turquoiseColour}${tx_packets}${endColour}"
                echo -e "${yellowColour}${icon_separator}${endColour}"
            fi
        done < <(tail -n +3 /proc/net/dev)  # Ignorar las dos primeras líneas
        
        sleep 2  # Pausa de 2 segundos antes de actualizar la información
    done
}

# Ejecutar la función
show_network_packets

