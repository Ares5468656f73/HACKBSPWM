#!/usr/bin/env bash

# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m" 
grayColour="\e[0;37m\033[1m"

icon_iface=" "  
icon_rx=""       
icon_tx=""       
icon_separator="---------------------------"

function show_network_packets() {
    clear
    while true; do
        clear  # Clear the screen in every iteration
        # Read the /proc/net/dev
        while read -r line; do
            if [[ $line == *:* ]]; then
                iface=$(echo "$line" | awk '{print $1}' | sed 's/:$//') 
                rx_packets=$(echo "$line" | awk '{print $3}')          # Packages received
                tx_packets=$(echo "$line" | awk '{print $11}')         # Packets transmitted
                
                # Print the color information
                echo -e "${blueColour}${icon_iface}${endColour} ${iface}"
                echo -e "  ${redColour}${icon_rx}${endColour} Packages received: ${turquoiseColour}${rx_packets}${endColour}"
                echo -e "  ${greenColour}${icon_tx}${endColour} Packets transmitted: ${turquoiseColour}${tx_packets}${endColour}"
                echo -e "${yellowColour}${icon_separator}${endColour}"
            fi
        done < <(tail -n +3 /proc/net/dev) 
        
        sleep 2 
    done
}

show_network_packets