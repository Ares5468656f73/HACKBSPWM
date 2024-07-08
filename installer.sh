#!/usr/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

help_panel(){
  echo -e "\n\t${yellowColour}-h)${endColour} ${grayColour}Show this panel${endColour}"
  echo -e "\t${yellowColour}-i)${endColour} ${grayColour}Install the environment${endColour}"
  echo -e "\t${yellowColour}-r)${endColour} ${grayColour}Remove the environment${endColour}\n"
}

user=$(whoami)

dotfiles_path=$(find / -name "HACKBSPWM" 2>/dev/null)

install_enviroment(){
  cd 
  mkdir backups

  if [ "$user" == "root" ]; then
    apt update && apt upgrade
    sleep 0.1
    apt install bspwm sxhkd kitty polybar kitty rofi feh
  elif [ "$user" != "root" ]; then
    sudo apt update && sudo apt upgrade
    sleep 0.1
    sudo apt install bspwm sxhkd kitty polybar kitty rofi feh
  fi

  cp -r $dotfiles_path/bspwm ~/.config 
  cp -r $dotfiles_path/sxhkd ~/.config
  cp -r $dotfiles_path/polybar ~/.config
  cp -r $dotfiles_path/kitty ~/.config
  cp -r $dotfiles_path/rofi ~/.config
  cp $dotfiles_path/.p10k.zsh /home/$user
  cp -r $dotfiles_path/powerlevel10k /home/$user
  cp -r $dotfiles_path/Wallpapers /home/$user 

  cd
  cd ~/.config/bspwm
  chmod +x *
  cd ~/.config/bspwm/scripts 
  chmod +x *
  cd 
  cd ~/.config/sxhkd
  chmod +x *
  cd
  cd ~/.config/polybar
  chmod +x *
  cd 
  cd ~/.config/kitty
  chmod +x *
  cd 
  cd ~/.config/rofi/themes 
  chmod +x *

  if [ "$user" == "root" ]; then
    cp -r $dotfiles_path/fonts /usr/share/fonts/
  elif [ "$user" != "root" ]; then
    sudo cp -r $dotfiles_path/fonts /usr/share/fonts/ 
  fi

  cd $dotfiles_path

  if [ "$user" == "root" ]; then
    dpkg -i bat_0.24.0_amd64.deb
    dpkg -i lsd_1.1.2_amd64.deb
  elif [ "$user" != "root" ]; then
    sudo dpkg -i bat_0.24.0_amd64.deb
    sudo dpkg -i lsd_1.1.2_amd64.deb
  fi

  cd 
  cp .zshrc ~/backups
  rm .zshrc
  cp $dotfiles_path/.zshrc .
}

remove_enviroment(){  
  if [ "$user" == "root" ]; then
    apt update && apt upgrade
    sleep 0.1
    apt remove bspwm sxhkd kitty polybar kitty rofi feh
  elif [ "$user" != "root" ]; then
    sudo apt update && sudo apt upgrade
    sleep 0.1
    sudo apt remove bspwm sxhkd kitty polybar kitty rofi feh
  fi

  rm -r ~/.config/bspwm   
  rm -r ~/.config/kitty 
  rm -r ~/.config/sxhkd 
  rm -r ~/.config/polybar 
  rm -r ~/.config/rofi 
  cd 
  rm -r Wallpapers
  rm -r powerlevel10k
  rm .p10k.zsh

  cd 
  rm .zshrc
  cd ~/backups/.zshrc .
  rm -r backups
}

parameter_counter=0

while getopts "hir" arg; do
  case $arg in
    h)
      parameter_counter=$((parameter_counter + 1));;
    i)
      parameter_counter=$((parameter_counter + 2));;
    r)
      parameter_counter=$((parameter_counter + 3));;
  esac
done

if [ $parameter_counter -eq 0 ]; then
  echo -e "\n${greenColour} ▄▄   ▄▄ ▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄   ▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄     ▄ ▄▄   ▄▄ ${endColour}"
  sleep 0.1
  echo -e "${greenColour}█  █ █  █      █       █   █ █ █  ▄    █       █       █ █ ▄ █ █  █▄█  █${endColour}"
  sleep 0.1
  echo -e "${greenColour}█  █▄█  █  ▄   █       █   █▄█ █ █▄█   █  ▄▄▄▄▄█    ▄  █ ██ ██ █       █${endColour}"
  sleep 0.1
  echo -e "${greenColour}█       █ █▄█  █     ▄▄█      ▄█       █ █▄▄▄▄▄█   █▄█ █       █       █${endColour}"
  sleep 0.1
  echo -e "${greenColour}█   ▄   █      █    █  █     █▄█  ▄   ██▄▄▄▄▄  █    ▄▄▄█       █       █${endColour}"
  sleep 0.1
  echo -e "${greenColour}█  █ █  █  ▄   █    █▄▄█    ▄  █ █▄█   █▄▄▄▄▄█ █   █   █   ▄   █ ██▄██ █${endColour}"
  sleep 0.1
  echo -e "${greenColour}█▄▄█ █▄▄█▄█ █▄▄█▄▄▄▄▄▄▄█▄▄▄█ █▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄█   █▄▄█ █▄▄█▄█   █▄█${endColour}\n"
  sleep 0.1
  help_panel
elif [ $parameter_counter -eq 1 ]; then
  help_panel
elif [ $parameter_counter -eq 2 ]; then
  echo -e "\n\t${redColour}Installing the environment${endColour}\n"
  sleep 1.5
  install_enviroment
elif [ $parameter_counter -eq 3 ]; then
  echo -e "\n\t${redColour}Removing the environment${endColour}\n"
  sleep 1.5
  remove_enviroment
fi
