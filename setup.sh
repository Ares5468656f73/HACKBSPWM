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
  echo -e "\t\t${greenColour}-i)${endColour} ${grayColour}Install the environment${endColour}"
  echo -e "\t\t${redColour}-r)${endColour} ${grayColour}Remove the environment${endColour}\n"
}

user=$(whoami)

dotfiles_path=$(find / -name "HACKBSPWM" 2>/dev/null)

install_enviroment(){
  cd 
  mkdir backups

  ########################
  # Install the programs #
  ########################

  echo -e "\n${grayColour}▄████▄   ██░ ██  ▒█████   ▒█████    ██████ ▓█████      ██████▓██   ██▓  ██████ ▄▄▄█████▓▓█████  ███▄ ▄███▓
▒██▀ ▀█  ▓██░ ██▒▒██▒  ██▒▒██▒  ██▒▒██    ▒ ▓█   ▀    ▒██    ▒ ▒██  ██▒▒██    ▒ ▓  ██▒ ▓▒▓█   ▀ ▓██▒▀█▀ ██▒
▒▓█    ▄ ▒██▀▀██░▒██░  ██▒▒██░  ██▒░ ▓██▄   ▒███      ░ ▓██▄    ▒██ ██░░ ▓██▄   ▒ ▓██░ ▒░▒███   ▓██    ▓██░
▒▓▓▄ ▄██▒░▓█ ░██ ▒██   ██░▒██   ██░  ▒   ██▒▒▓█  ▄      ▒   ██▒ ░ ▐██▓░  ▒   ██▒░ ▓██▓ ░ ▒▓█  ▄ ▒██    ▒██ 
▒ ▓███▀ ░░▓█▒░██▓░ ████▓▒░░ ████▓▒░▒██████▒▒░▒████▒   ▒██████▒▒ ░ ██▒▓░▒██████▒▒  ▒██▒ ░ ░▒████▒▒██▒   ░██▒
░ ░▒ ▒  ░ ▒ ░░▒░▒░ ▒░▒░▒░ ░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░░░ ▒░ ░   ▒ ▒▓▒ ▒ ░  ██▒▒▒ ▒ ▒▓▒ ▒ ░  ▒ ░░   ░░ ▒░ ░░ ▒░   ░  ░
░  ▒    ▒ ░▒░ ░  ░ ▒ ▒░   ░ ▒ ▒░ ░ ░▒  ░ ░ ░ ░  ░   ░ ░▒  ░ ░▓██ ░▒░ ░ ░▒  ░ ░    ░     ░ ░  ░░  ░      ░
░         ░  ░░ ░░ ░ ░ ▒  ░ ░ ░ ▒  ░  ░  ░     ░      ░  ░  ░  ▒ ▒ ░░  ░  ░  ░    ░         ░   ░      ░   
░ ░       ░  ░  ░    ░ ░      ░ ░        ░     ░  ░         ░  ░ ░           ░              ░  ░       ░   
░                                                              ░ ░                                         ${endColour}"  
  echo -e "\t${redColour}Debian -> 1${endColour}"
  sleep 0.02
  echo -e "\t${blueColour}Arch -> 2${endColour}"
  sleep 0.02
  echo -e "\t${turquoiseColour}Fedora -> 3${endColour}"
  read OS
  
  if [ "$OS" == "1" ]; then
    if [ "$user" == "root" ]; then
      echo -e "${redColour}You cant perform this operation like root"
    else
      sudo apt update && sudo apt upgrade
      sleep 0.1
      sudo apt install bspwm sxhkd kitty polybar kitty rofi feh nmap zsh
      chsh -s $(which zsh)
      cd $dotfiles_path
      sudo dpkg -i bat_0.24.0_amd64.deb
      sudo dpkg -i lsd_1.1.2_amd64.deb        
    fi
  elif [ "$OS" == "2" ]; then
    if [ "$user" == "root" ]; then
      echo -e "${redColour}You cant perform this operation like root"
    else
      sudo pacman -Syu
      sleep 0.1
      sudo pacman -Syu bspwm sxhkd kitty polybar kitty rofi feh nmap zsh lsd bat
      chsh -s $(which zsh)
    fi
  elif [ "$OS" == "3" ]; then
    if [ "$user" == "root" ]; then
      echo -e "${redColour}You cant perform this operation like root"
    else
      sudo dnf update && sudo dnf upgrade
      sleep 0.1
      sudo dnf install bspwm sxhkd kitty polybar kitty rofi feh nmap zsh
      chsh -s $(which zsh)
    fi
  else
      echo -e "${yellowColour}Invalid option${endColour}"  
      cd 
      rm -r backups
      kill -SIGINT $$   
  fi

  ####################################################
  # Copy the config files in the current directories #
  ####################################################
  
  cd 
  if [ -e ~/.zshrc ]; then
    cp .zshrc ~/backups
    rm .zshrc
  else
    :  
  fi

  cp -r $dotfiles_path/bspwm ~/.config 
  cp -r $dotfiles_path/sxhkd ~/.config
  cp -r $dotfiles_path/polybar ~/.config
  cp -r $dotfiles_path/kitty ~/.config
  cp -r $dotfiles_path/rofi ~/.config
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
  if [ -e ~/.config/polybar/config ]; then
    rm confi   
  fi
  cd scripts/
  chmod +x *
  cd 
  cd ~/.config/kitty
  chmod +x *
  cd 
  cd ~/.config/rofi/themes 
  chmod +x *
  cd
  cp -r $dotfiles_path/Scripts .
  cd ~/Scripts/
  chmod +x *

  ###############################
  # Install powerlevel10k theme #
  ###############################
  
  if [ "$user" == "root" ]; then
    exit
    cd
  else
    cd
  fi
  
  cp -r $dotfiles_path/powerlevel10k .

  if [ -e ~/.p10k.zsh ]; then
    rm .p10k.zsh
  fi

  cp $dotfiles_path/.p10k.zsh .

  sudo su 
  cd
  
  cp -r $dotfiles_path/powerlevel10k .
  
  if [ -e ~/.p10k.zsh ]; then
    rm .p10k.zsh
  fi

  cp $dotfiles_path/.p10k.zsh_root .
  mv .p10k.zsh_root .p10k.zsh

  ##############################
  # Install the necesary fonts #
  ##############################

  if [ "$user" == "root" ]; then
    cp -r $dotfiles_path/fonts /usr/share/fonts/
  elif [ "$user" != "root" ]; then
    sudo cp -r $dotfiles_path/fonts /usr/share/fonts/ 
  fi
}

remove_enviroment ()
{
  echo -e "${greenColour}Choose system${endColour}"
  echo -e "\t${redColour}Debian -> 1${endColour}"
  sleep 0.02
  echo -e "\t${blueColour}Arch -> 2${endColour}"
  sleep 0.02
  echo -e "\t${turquoiseColour}Fedora -> 3${endColour}"
  read OS
  if [ "$OS" == "1" ]; then
    if [ "$user" == "root" ]; then
      echo -e "${redColour}You cant perform this operation like root"
    else
      sudo apt update && sudo apt upgrade
      sleep 0.1
      sudo apt remove bspwm sxhkd kitty polybar kitty rofi feh nmap zsh
      chsh -s $(which zsh)
      cd $dotfiles_path
      sudo dpkg -r bat_0.24.0_amd64.deb
      sudo dpkg -r lsd_1.1.2_amd64.deb        
    fi
  elif [ "$OS" == "2" ]; then
    if [ "$user" == "root" ]; then
      echo -e "${redColour}You cant perform this operation like root"
    else
      sudo pacman -Syu
      sleep 0.1
      sudo pacman -R bspwm sxhkd kitty polybar kitty rofi feh nmap zsh lsd bat
      chsh -s $(which zsh)
    fi
  elif [ "$OS" == "3" ]; then
    if [ "$user" == "root" ]; then
      echo -e "${redColour}You cant perform this operation like root"
    else
      sudo dnf update && sudo dnf upgrade
      sleep 0.1
      sudo dnf remove bspwm sxhkd kitty polybar kitty rofi feh nmap zsh 
      chsh -s $(which zsh)
    fi
  else
    echo -e "${yellowColour}Invalid option${endColour}"  
    kill -SIGINT $$   
  fi
  
  ######################################################
  # Remove the config files in the current directories #
  ######################################################

  cd
  cp $dotfiles_path/.zshrc .
  cd 

  rm -r ~/.config/bspwm/ 
  rm -r ~/.config/sxhkd/
  rm -r ~/.config/polybar/
  rm -r ~/.config/kitty/
  rm -r ~/.config/rofi/
  rm -r /home/$user/Wallpapers

  ##############################
  # Remove powerlevel10k theme #
  ##############################

  if [ "$user" != "root" ]; then
    cd
    sudo su 
    rm -r powerlevel10k .p10k.zsh
  elif [ "$user" == "root" ]; then
    cd
    rm -r powerlevel10k .p10k.zsh
  fi  
}

parameter_counter=0

while getopts "ir" arg; do
  case $arg in
    i)
      parameter_counter=$((parameter_counter + 2));;
    r)
      parameter_counter=$((parameter_counter + 3));;
  esac
done

if [ $parameter_counter -eq 0 ]; then

  echo -e "\n${yellowColour}██░ ██  ▄▄▄       ▄████▄   ██ ▄█▀ ▄▄▄▄     ██████  ██▓███   █     █░ ███▄ ▄███▓${endColour}"
  sleep 0.1
  echo -e "${yellowColour}▓██░ ██▒▒████▄    ▒██▀ ▀█   ██▄█▒ ▓█████▄ ▒██    ▒ ▓██░  ██▒▓█░ █ ░█░▓██▒▀█▀ ██▒${endColour}"
  sleep 0.1
  echo -e "${yellowColour}▒██▀▀██░▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▒██▒ ▄██░ ▓██▄   ▓██░ ██▓▒▒█░ █ ░█ ▓██    ▓██░${endColour}"
  sleep 0.1
  echo -e "${yellowColour}░▓█ ░██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ▒██░█▀    ▒   ██▒▒██▄█▓▒ ▒░█░ █ ░█ ▒██    ▒██ ${endColour}"
  sleep 0.1
  echo -e "${yellowColour}░▓█▒░██▓ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄░▓█  ▀█▓▒██████▒▒▒██▒ ░  ░░░██▒██▓ ▒██▒   ░██▒${endColour}"
  sleep 0.1
  echo -e "${yellowColour}▒ ░░▒░▒ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒░▒▓███▀▒▒ ▒▓▒ ▒ ░▒▓▒░ ░  ░░ ▓░▒ ▒  ░ ▒░   ░  ░${endColour}"
  sleep 0.1
  echo -e "${yellowColour}▒ ░▒░ ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░▒░▒   ░ ░ ░▒  ░ ░░▒ ░       ▒ ░ ░  ░  ░      ░${endColour}"
  sleep 0.1
  echo -e "${yellowColour}░  ░░ ░  ░   ▒   ░        ░ ░░ ░  ░    ░ ░  ░  ░  ░░         ░   ░  ░      ░   ${endColour}"
  sleep 0.1
  echo -e "${yellowColour}░  ░  ░      ░  ░░ ░      ░  ░    ░            ░               ░           ░   ${endColour}"
  sleep 0.1
  echo -e "${yellowColour}                ░                     ░                                         ${endColour}\n"
  help_panel
elif [ $parameter_counter -eq 2 ]; then
  echo -e "\n\t${greenColour}Installing the environment${endColour}\n"
  sleep 1.5
  install_enviroment
  sleep 1 
  echo -e "${greenColour}\n\tThe environment has been installed, please reboot the machine\n${endColour}"
elif [ $parameter_counter -eq 3 ]; then
  echo -e "\n\t${redColour}Removing the environment${endColour}\n"
  sleep 1.5
  remove_enviroment
  sleep 1 
  echo -e "${redColour}\n\tThe environment has been removed, please reboot the machine\n${endColour}"
fi
