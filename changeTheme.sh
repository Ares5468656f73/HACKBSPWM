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
  echo " " > ~/.config/kitty/color.ini

  echo "
  cursor_shape          Underline
  cursor_underline_thickness 1
  window_padding_width  20

  # Special
  foreground #a9b1d6
  background #1a1b26

  # Black
  color0 #414868
  color8 #414868

  # Red
  color1 #f7768e
  color9 #f7768e

  # Green
  color2  #73daca
  color10 #73daca

  # Yellow
  color3  #e0af68
  color11 #e0af68

  # Blue
  color4  #7aa2f7
  color12 #7aa2f7

  # Magenta
  color5  #bb9af7
  color13 #bb9af7

  # Cyan
  color6  #7dcfff
  color14 #7dcfff

  # White
  color7  #c0caf5
  color15 #c0caf5

  # Cursor
  cursor #c0caf5
  cursor_text_color #1a1b26

  # Selection highlight
  selection_foreground #7aa2f7
  selection_background #28344a
  " > ~/.config/kitty/color.ini

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
  
  echo " " > ~/.config/kitty/color.ini
  echo "
  # https://draculatheme.com/kitty

  foreground            #f8f8f2
  background            #282a36
  selection_foreground  #ffffff
  selection_background  #44475a

  url_color #8be9fd

  # black
  color0  #21222c
  color8  #6272a4

  # red
  color1  #ff5555
  color9  #ff6e6e

  # green
  color2  #50fa7b
  color10 #69ff94

  # yellow
  color3  #f1fa8c
  color11 #ffffa5

  # blue
  color4  #bd93f9
  color12 #d6acff

  # magenta
  color5  #ff79c6
  color13 #ff92df

  # cyan
  color6  #8be9fd
  color14 #a4ffff

  # white
  color7  #f8f8f2
  color15 #ffffff

  # Cursor colors
  cursor            #f8f8f2
  cursor_text_color background

  # Tab bar colors
  active_tab_foreground   #282a36
  active_tab_background   #f8f8f2
  inactive_tab_foreground #282a36
  inactive_tab_background #6272a4

  # Marks
  mark1_foreground #282a36
  mark1_background #ff5555

  # Splits/Windows
  active_border_color #f8f8f2
  inactive_border_color #6272a4
  " > ~/.config/kitty/color.ini
  
  bspc wm -r
  feh --bg-fill ~/Wallpapers/Dracula_Ship.png
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
  
  echo " " > ~/.config/kitty/color.ini

  echo "
  cursor_shape          Underline
  cursor_underline_thickness 1
  window_padding_width  20

  # Special
  foreground #42464e
  background #1e222a

  # Black
  color0 #1e222a
  color8 #1e222a

  # Red
  color1 #e06c75
  color9 #e06c75

  # Green
  color2  #98c379
  color10 #98c379

  # Yellow
  color3  #e5c07b
  color11 #e5c07b

  # Blue
  color4  #61afef
  color12 #61afef

  # Magenta
  color5  #c678dd
  color13 #c678dd

  # Cyan
  color6  #56b6c2
  color14 #56b6c2

  # White
  color7  #abb2bf
  color15 #abb2bf

  # Cursor
  cursor #c0caf5
  cursor_text_color #1a1b26

  # Selection highlight
  selection_foreground #7aa2f7
  selection_background #28344a
  " > ~/.config/kitty/color.ini

  bspc wm -r 
  feh --beg-fill ~/Wallpapers/Dark_theme.png
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
  
  echo " " > ~/.config/kitty/color.ini 

  echo " 
  cursor_shape          Underline
  cursor_underline_thickness 1
  window_padding_width  20

  # Special
  foreground #5C5F77
  background #24273A

  # Black
  color0 #24273A
  color8 #24273A

  # Red
  color1 #ed8796
  color9 #ed8796

  # Green
  color2  #a6da95
  color10 #a6da95

  # Yellow
  color3  #eed49f
  color11 #eed49f

  # Blue
  color4  #7dc4e4
  color12 #7dc4e4

  # Magenta
  color5  #c6a0f6
  color13 #c6a0f6

  # Cyan
  color6  #8bd5ca
  color14 #8bd5ca

  # White
  color7  #cad3f5
  color15 #cad3f5

  # Cursor
  cursor #c0caf5
  cursor_text_color #1a1b26

  # Selection highlight
  selection_foreground #7aa2f7
  selection_background #28344a
  

  " > ~/.config/kitty/color.ini 

  bspc wm -r 
  feh --bg-fill ~/Wallpapers/PinkFloyd_catppuccin.jpg
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
