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
  echo -e "\n${grayColour} ▄████▄   ██░ ██  ▄▄▄       ███▄    █   ▄████ ▓█████    ▄▄▄█████▓ ██░ ██ ▓█████  ███▄ ▄███▓▓█████ ${endColour}"
  sleep 0.02
  echo -e "${grayColour}▒██▀ ▀█  ▓██░ ██▒▒████▄     ██ ▀█   █  ██▒ ▀█▒▓█   ▀    ▓  ██▒ ▓▒▓██░ ██▒▓█   ▀ ▓██▒▀█▀ ██▒▓█   ▀ ${endColour}"
  sleep 0.02
  echo -e "${grayColour}▒▓█    ▄ ▒██▀▀██░▒██  ▀█▄  ▓██  ▀█ ██▒▒██░▄▄▄░▒███      ▒ ▓██░ ▒░▒██▀▀██░▒███   ▓██    ▓██░▒███   ${endColour}"
  sleep 0.02
  echo -e "${grayColour}▒▓▓▄ ▄██▒░▓█ ░██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█  ██▓▒▓█  ▄    ░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄ ▒██    ▒██ ▒▓█  ▄ ${endColour}"
  sleep 0.02
  echo -e "${grayColour}▒ ▓███▀ ░░▓█▒░██▓ ▓█   ▓██▒▒██░   ▓██░░▒▓███▀▒░▒████▒     ▒██▒ ░ ░▓█▒░██▓░▒████▒▒██▒   ░██▒░▒████▒${endColour}"
  sleep 0.02
  echo -e "${grayColour}░ ░▒ ▒  ░ ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒░   ▒ ▒  ░▒   ▒ ░░ ▒░ ░     ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░░ ▒░   ░  ░░░ ▒░ ░${endColour}"
  sleep 0.02
  echo -e "${grayColour}  ░  ▒    ▒ ░▒░ ░  ▒   ▒▒ ░░ ░░   ░ ▒░  ░   ░  ░ ░  ░       ░     ▒ ░▒░ ░ ░ ░  ░░  ░      ░ ░ ░  ░${endColour}"
  sleep 0.02
  echo -e "${grayColour}░         ░  ░░ ░  ░   ▒      ░   ░ ░ ░ ░   ░    ░        ░       ░  ░░ ░   ░   ░      ░      ░   ${endColour}"
  sleep 0.02
  echo -e "${grayColour}░ ░       ░  ░  ░      ░  ░         ░       ░    ░  ░             ░  ░  ░   ░  ░       ░      ░  ░${endColour}"
  sleep 0.02
  echo -e "${grayColour}░                                                                                                 ${endColour}\n"
  sleep 0.02
  echo -e "\t${grayColour}Avalible themes${endColour}"
  echo -e "\t\t${blueColour}-m)${endColour} ${grayColour}Main theme${endColour}"
  echo -e "\t\t${yellowColour}-d)${endColour} ${grayColour}Dark color${endColour}"
  echo -e "\t\t${purpleColour}-c)${endColour} ${grayColour}Catppuccin theme${endColour}"
  echo -e "\t\t${grayColour}-t)${endColour} ${grayColour}Tokyo theme${endColour}"
}

changeToTokyo ()
{
  echo " " > ~/.config/polybar/colors.ini
  
  echo "
  [colors]
  background = #0d0f14
  background-alt = #252b3a
  foreground = #dbe3bb
  primary = #51b1d9
  secondary = #d99441
  alert = #e56a66
  disabled = #3e4860
  " > ~/.config/polybar/colors.ini

  echo " " > ~/.config/kitty/color.ini

  echo "
  cursor_shape          Underline
  cursor_underline_thickness 1
  window_padding_width  20

  # Special
  foreground #dbe3bb
  background #0d0f14

  # Black
  color0 #0e0e0e
  color8 #0e0e0e

  # Red
  color1 #e56a66
  color9 #e56a66

  # Green
  color2  #81a780
  color10 #81a780

  # Yellow
  color3  #d99441
  color11 #d99441

  # Blue
  color4  #51b1d9
  color12 #51b1d9

  # Magenta
  color5  #8a7ac9
  color13 #8a7ac9

  # Cyan
  color6  #3d87a5
  color14 #3d87a5

  # White
  color7  #dbe3bb
  color15 #dbe3bb

  # Cursor
  cursor #c0caf5
  cursor_text_color #1a1b26

  # Selection highlight
  selection_foreground #7aa2f7
  selection_background #28344a
  " > ~/.config/kitty/color.ini

  bspc wm -r
  pkill -USR1 -f kitty
  feh --bg-fill ~/Wallpapers/Retrofuturistic_tokyo.jpg
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
  pkill -USR1 -f kitty
  feh --bg-fill ~/Wallpapers/Main_wallpaper.jpg
}

changeToDark ()
{
  echo " " > ~/.config/polybar/colors.ini

  echo "
  [colors]
  background = #1e2128
  background-alt = #565c64
  foreground = #abb2bf
  primary = #62aeef
  secondary = #e5c07a
  alert = #e06b74
  disabled = #42464e 
  " > ~/.config/polybar/colors.ini
  
  echo " " > ~/.config/kitty/color.ini

  echo "
  cursor_shape          Underline
  cursor_underline_thickness 1
  window_padding_width  20

  # Special
  foreground #abb2bf
  background #1e2128

  # Black
  color0 #32363d
  color8 #50545b

  # Red
  color1 #e06b74
  color9 #ea757e

  # Green
  color2  #98c379
  color10 #a2cd83

  # Yellow
  color3  #e5c07a
  color11 #efca84

  # Blue
  color4  #62aeef
  color12 #6cb8f9

  # Magenta
  color5  #c778dd
  color13 #d282e7

  # Cyan
  color6  #55b6c2
  color14 #5fc0cc

  # White
  color7  #abb2bf
  color15 #b5bcc9

  # Cursor
  cursor #c0caf5
  cursor_text_color #1a1b26

  # Selection highlight
  selection_foreground #7aa2f7
  selection_background #28344a
  " > ~/.config/kitty/color.ini

  bspc wm -r
  pkill -USR1 -f kitty
  feh --bg-fill ~/Wallpapers/Nasa_aesthetic.png
}

changeToCatppuccin ()
{
  echo " " > ~/.config/polybar/colors.ini

  echo "
  [colors]
  background = #1e1e2e
  background-alt = #313244
  foreground = #cdd6f4
  primary = #89dceb
  secondary = #f9e2af
  alert = #f38ba8
  disabled = #45475a 
  " > ~/.config/polybar/colors.ini
  
  echo " " > ~/.config/kitty/color.ini 

  echo " 
  cursor_shape          Underline
  cursor_underline_thickness 1
  window_padding_width  20

  # The basic colors
  foreground              #cdd6f4
  background              #1e1e2e
  selection_foreground    #1e1e2e
  selection_background    #f5e0dc

  # Cursor colors
  cursor                  #f5e0dc
  cursor_text_color       #1e1e2e

  # URL underline color when hovering with mouse
  url_color               #f5e0dc

  # Kitty window border colors
  active_border_color     #b4befe
  inactive_border_color   #6c7086
  bell_border_color       #f9e2af

  # Tab bar colors
  active_tab_foreground   #11111b
  active_tab_background   #cba6f7
  inactive_tab_foreground #cdd6f4
  inactive_tab_background #181825
  tab_bar_background      #11111b

  # Colors for marks (marked text in the terminal)
  mark1_foreground #1e1e2e
  mark1_background #b4befe
  mark2_foreground #1e1e2e
  mark2_background #cba6f7
  mark3_foreground #1e1e2e
  mark3_background #74c7ec

  # The 16 terminal colors

  # black
  color0 #45475a
  color8 #585b70

  # red
  color1 #f38ba8
  color9 #f38ba8

  # green
  color2  #a6e3a1
  color10 #a6e3a1

  # yellow
  color3  #f9e2af
  color11 #f9e2af

  # blue
  color4  #89b4fa
  color12 #89b4fa

  # magenta
  color5  #f5c2e7
  color13 #f5c2e7

  # cyan
  color6  #94e2d5
  color14 #94e2d5

  # white
  color7  #bac2de
  color15 #a6adc8 

  # Cursor
  cursor #c0caf5
  cursor_text_color #1a1b26

  # Selection highlight
  selection_foreground #7aa2f7
  selection_background #28344a
  " > ~/.config/kitty/color.ini 

  bspc wm -r 
  pkill -USR1 -f kitty
  feh --bg-fill ~/Wallpapers/Cat_leaves.png
}

parameter_counter=0

while getopts "mdcvt" arg; do
  case $arg in
    m)
      parameter_counter=$((parameter_counter + 1));;
    d)
      parameter_counter=$((parameter_counter + 2));;
    c)
      parameter_counter=$((parameter_counter + 3));;
    v)
      parameter_counter=$((parameter_counter + 4));;
    t)
      parameter_counter=$((parameter_counter + 5));;
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
elif [ $parameter_counter -eq 5 ]; then
  changeToTokyo
else
  helpPanel
fi
