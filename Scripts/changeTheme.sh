#/usr/bin/env bash

helpPanel ()
{
  echo -e "\tAvalible themes"
  echo -e "\t\t-m) Main theme"
  echo -e "\t\t-c) Catppuccin theme"
  echo -e "\t\t-t) Tokyo theme"
}

changeToTokyo ()
{
  echo " " > ~/.config/polybar/colors.ini
  
  echo "
[colors]
background = #16161e
background-alt = #1a1b26
foreground = #a9b1d6
primary = #698cd6
secondary = #e0af68
alert = #f7768e
disabled = #414868
" > ~/.config/polybar/colors.ini

  echo " " > ~/.config/kitty/color.ini

  echo "
# Tokyo Night color scheme for kitty terminal emulator
# https://github.com/davidmathers/tokyo-night-kitty-theme
#
# Based on Tokyo Night color theme for Visual Studio Code
# https://github.com/enkia/tokyo-night-vscode-theme

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
selection_foreground none
selection_background #28344a

# The color for highlighting URLs on mouse-over
url_color #9ece6a

# Window borders
active_border_color #3d59a1
inactive_border_color #101014
bell_border_color #e0af68

# Tab bar
tab_bar_style fade
tab_fade 1
active_tab_foreground   #3d59a1
active_tab_background   #16161e
active_tab_font_style   bold
inactive_tab_foreground #787c99
inactive_tab_background #16161e
inactive_tab_font_style bold
tab_bar_background #101014

# Title bar
macos_titlebar_color #16161e

# Storm
# background #24283b
# cursor_text_color #24283b
# active_tab_background   #1f2335
# inactive_tab_background #1f2335
# macos_titlebar_color #1f2335
" > ~/.config/kitty/color.ini

  bspc wm -r
  pkill -USR1 -f kitty
  feh --bg-fill ~/Wallpapers/90s_Girl.jpg
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
foreground #a9b1d6
background #1a1b26
color0 #414868
color8 #414868
color1 #f7768e
color9 #f7768e
color2  #73daca
color10 #73daca
color3  #e0af68
color11 #e0af68
color4  #7aa2f7
color12 #7aa2f7
color5  #bb9af7
color13 #bb9af7
color6  #7dcfff
color14 #7dcfff
color7  #c0caf5
color15 #c0caf5
cursor #c0caf5
cursor_text_color #1a1b26
selection_foreground #7aa2f7
selection_background #28344a
" > ~/.config/kitty/color.ini

  bspc wm -r
  pkill -USR1 -f kitty
  feh --bg-fill ~/Wallpapers/Main_wallpaper.jpg
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
foreground              #cdd6f4
background              #1e1e2e
selection_foreground    #1e1e2e
selection_background    #f5e0dc
cursor                  #f5e0dc
cursor_text_color       #1e1e2e
url_color               #f5e0dc
active_border_color     #b4befe
inactive_border_color   #6c7086
bell_border_color       #f9e2af
active_tab_foreground   #11111b
active_tab_background   #cba6f7
inactive_tab_foreground #cdd6f4
inactive_tab_background #181825
tab_bar_background      #11111b
mark1_foreground #1e1e2e
mark1_background #b4befe
mark2_foreground #1e1e2e
mark2_background #cba6f7
mark3_foreground #1e1e2e
mark3_background #74c7ec
color0 #45475a
color8 #585b70
color1 #f38ba8
color9 #f38ba8
color2  #a6e3a1
color10 #a6e3a1
color3  #f9e2af
color11 #f9e2af
color4  #89b4fa
color12 #89b4fa
color5  #f5c2e7
color13 #f5c2e7
color6  #94e2d5
color14 #94e2d5
color7  #bac2de
color15 #a6adc8 
cursor #c0caf5
cursor_text_color #1a1b26
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
    c)
      parameter_counter=$((parameter_counter + 3));;
    t)
      parameter_counter=$((parameter_counter + 5));;
  esac
done

if [ $parameter_counter -eq 0 ]; then
  helpPanel
elif [ $parameter_counter -eq 1 ]; then
  changeToMain
elif [ $parameter_counter -eq 3 ]; then
  changeToCatppuccin
elif [ $parameter_counter -eq 5 ]; then
  changeToTokyo
else
  helpPanel
fi
