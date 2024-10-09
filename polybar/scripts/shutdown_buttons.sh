#!/bin/bash

# Colors
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
cyanColour="\e[0;36m\033[1m"
magentaColour="\e[0;35m\033[1m"
grayColour="\e[0;37m\033[1m"
endColour="\033[0m\e[0m"

# Nerd Font Icons
icon_shutdown=""  # Power off
icon_reboot=""    # Reboot
icon_logout=""    # Logout
icon_cancel=""    # Cancel
icon_system=""    # System icon
icon_arrow=""    # Arrow for options

# Title and menu header
function title() {
    echo -e "${blueColour}╔═══════════════════════════════════╗${endColour}"
    echo -e "${blueColour}║         ${cyanColour}${icon_system}  System Control Menu${blueColour}    ║${endColour}"
    echo -e "${blueColour}╚═══════════════════════════════════╝${endColour}"
}

# Menu options
function show_menu() {
    echo -e "${yellowColour}➤ Choose an option:${endColour}"
    echo -e "${greenColour}   ${icon_arrow} 1) ${icon_shutdown} Shutdown${endColour}"
    echo -e "${greenColour}   ${icon_arrow} 2) ${icon_reboot} Reboot${endColour}"
    echo -e "${greenColour}   ${icon_arrow} 3) ${icon_logout} Logout${endColour}"
    echo -e "${greenColour}   ${icon_arrow} 4) ${icon_cancel} Cancel${endColour}"
}

# Loading animation (simple dot animation)
function loading_animation() {
    local i=0
    local spin='|/-\'
    while [ $i -lt 3 ]; do
        i=$((i+1))
        printf "\r%s" "${spin:i%${#spin}:1}"
        sleep 0.3
    done
    printf "\r   \n"
}

# Function to execute the selected action
function execute_action() {
    case $1 in
        1)
            echo -e "${redColour}${icon_shutdown} Shutting down...${endColour}"
            loading_animation
            systemctl poweroff
            ;;
        2)
            echo -e "${redColour}${icon_reboot} Rebooting...${endColour}"
            loading_animation
            systemctl reboot
            ;;
        3)
            echo -e "${redColour}${icon_logout} Logging out...${endColour}"
            loading_animation
            kill -9 -1
            ;;
        4)
            echo -e "${greenColour}${icon_cancel} Operation canceled.${endColour}"
            exit
            ;;
        *)
            echo -e "${redColour}Invalid option!${endColour}"
            ;;
    esac
}

# Display the menu and handle user input
title
show_menu
read -p "Select an option [1-4]: " option
execute_action $option
