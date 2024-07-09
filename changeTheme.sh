#/usr/bin/env bash

# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

helpPanel ()
{
  echo "\n${grayColour} ▄████▄   ██░ ██  ▄▄▄       ███▄    █   ▄████ ▓█████    ▄▄▄█████▓ ██░ ██ ▓█████  ███▄ ▄███▓▓█████ ${endColour}"
  sleep 0.02
  echo "${grayColour}▒██▀ ▀█  ▓██░ ██▒▒████▄     ██ ▀█   █  ██▒ ▀█▒▓█   ▀    ▓  ██▒ ▓▒▓██░ ██▒▓█   ▀ ▓██▒▀█▀ ██▒▓█   ▀ ${endColour}"
  sleep 0.02
  echo "${grayColour}▒▓█    ▄ ▒██▀▀██░▒██  ▀█▄  ▓██  ▀█ ██▒▒██░▄▄▄░▒███      ▒ ▓██░ ▒░▒██▀▀██░▒███   ▓██    ▓██░▒███   ${endColour}"
  sleep 0.02
  echo "${grayColour}▒▓▓▄ ▄██▒░▓█ ░██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█  ██▓▒▓█  ▄    ░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄ ▒██    ▒██ ▒▓█  ▄ ${endColour}"
  sleep 0.02
  echo "${grayColour}▒ ▓███▀ ░░▓█▒░██▓ ▓█   ▓██▒▒██░   ▓██░░▒▓███▀▒░▒████▒     ▒██▒ ░ ░▓█▒░██▓░▒████▒▒██▒   ░██▒░▒████▒${endColour}"
  sleep 0.02
  echo "${grayColour}░ ░▒ ▒  ░ ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒░   ▒ ▒  ░▒   ▒ ░░ ▒░ ░     ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░░ ▒░   ░  ░░░ ▒░ ░${endColour}"
  sleep 0.02
  echo "${grayColour}  ░  ▒    ▒ ░▒░ ░  ▒   ▒▒ ░░ ░░   ░ ▒░  ░   ░  ░ ░  ░       ░     ▒ ░▒░ ░ ░ ░  ░░  ░      ░ ░ ░  ░${endColour}"
  sleep 0.02
  echo "${grayColour}░         ░  ░░ ░  ░   ▒      ░   ░ ░ ░ ░   ░    ░        ░       ░  ░░ ░   ░   ░      ░      ░   ${endColour}"
  sleep 0.02
  echo "${grayColour}░ ░       ░  ░  ░      ░  ░         ░       ░    ░  ░             ░  ░  ░   ░  ░       ░      ░  ░${endColour}"
  sleep 0.02
  echo "${grayColour}░                                                                                                 ${endColour}\n"
  sleep 0.02
  echo "\t${grayColour}Avalible themes${endColour}"
  echo "\t\t${blueColour}-m)${endColour} ${grayColour}Main theme (the default of this enviroment)${endColour}"
  echo "\t\t${yellowColour}-d)${endColour} ${grayColour}Dark color inspire in NVCHAD${endColour}"
  echo "\t\t${purpleColour}-c)${endColour} ${grayColour}Catppuccin theme${endColour}"
  echo "\t\t${turquoiseColour}-v)${endColour} ${grayColour}Dracula theme${endColour}"
}

changeToMain ()
{
  echo " " > ~/.config/polybar/colors.ini

  echo "
  [colors]
  background = #1a1b26
  background-alt = #414868
  foreground = #a9b1d6
  primary = #7aa2f7
  secondary = #e0af68
  alert = #f7768e
  disabled = #707880
  " > ~/.config/polybar/colors.ini
  bspc wm -r 
}

changeToDracula ()
{
  echo " " > ~/.config/polybar/colors.ini

  echo "
  [colors]
  background = #282a36
  background-alt = #44475a
  foreground = #f8f8f2
  primary = #bd93f9
  secondary = #f1fa8c
  alert = #ff5555
  disabled = #44475a
  " > ~/.config/polybar/colors.ini
  
  bspc wm -r
}

changeToDark ()
{
  echo " " > ~/.config/polybar/colors.ini

  echo "
  [colors]
  background = #1e222a
  background-alt = #565c64
  foreground = #abb2bf
  primary = #61afef
  secondary = #e5c07b
  alert = #e06c75
  disabled = #42464e 
  " > ~/.config/polybar/colors.ini
  
  bspc wm -r 
}

changeToCatppuccin ()
{
  echo " " > ~/.config/polybar/colors.ini

  echo "
  [colors]
  background = #24273a
  background-alt = #5c5f77
  foreground = #cad3f5
  primary = #7dc4e4
  secondary = #eed49f
  alert = #ed8796
  disabled = #6c6f85
  " > ~/.config/polybar/colors.ini
  
  bspc wm -r 
}

parameter_counter=0

while getopts "mdcv" arg; do
  case $arg in
    m)
      parameter_counter=$((parameter_counter + 1));;
    d)
      parameter_counter=$((parameter_counter + 2));;
    c)
      parameter_counter=$((parameter_counter + 3));;
    v)
      parameter_counter=$((parameter_counter + 4));;
  esac
done

if [ $parameter_counter -eq 0 ]; then
  helpPanel
elif [ $parameter_counter -eq 1 ]; then
  changeToMain
elif [ $parameter_counter -eq 2 ]; then
  changeToDark
elif [ $parameter_counter -eq 3 ]; then
  changeToCatppuccin
elif [ $parameter_counter -eq 4 ]; then
  changeToDracula
else
  helpPanel
fi
