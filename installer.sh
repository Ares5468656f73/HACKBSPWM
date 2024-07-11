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

getOS=$(lsb_release -a | head -n 1 | awk '{print $3}')
getDistro=$(cat /etc/os-release | grep ID_LIKE | cut -d '=' -f 2)
getDistro_secondary=$(cat /etc/os-release | grep ID | cut -d '=' -f 2 | sed -n '2p')

install_enviroment(){
  cd 
  mkdir backups
  if [ "$getDistro" = "debian" ] || [ "$getDistro" == "Debian" ] || [ "$getDistro_secondary" == "debian" ] || [ "$getDistro_secondary" == "Debian" ]; then   
    if [ "$user" == "root" ]; then
      apt update && apt upgrade
      sleep 0.1
<<<<<<< HEAD
      apt install bspwm sxhkd kitty polybar kitty rofi feh vnstat zsh
      systemctl enable vnstat
      systemctl start vnstat
      chsh -s $(which zsh)
    elif [ "$user" != "root" ]; then
      sudo apt update && sudo apt upgrade
      sleep 0.1
      sudo apt install bspwm sxhkd kitty polybar kitty rofi feh vnstat zsh
      sudo systemctl enable vnstat
      sudo systemctl start vnstat
      chsh -s $(which zsh)
=======
      apt install bspwm sxhkd kitty polybar kitty rofi feh vnstat
      systemctl enable vnstat
      systemctl start vnstat
    elif [ "$user" != "root" ]; then
      sudo apt update && sudo apt upgrade
      sleep 0.1
      sudo apt install bspwm sxhkd kitty polybar kitty rofi feh vnstat
      sudo systemctl enable vnstat
      sudo systemctl start vnstat
>>>>>>> a5b8b14e8fb7625287faa1e7de793ac9dc926d76
    fi
  elif [ "$getDistro" == "arch" ] || [ "$getDistro" == "Arch" ] || [ "$getDistro_secondary" == "arch" ] || [ "$getDistro_secondary" == "Arch" ]; then
    if [ "$user" == "root" ]; then
      pacman -Syu
      sleep 0.1
<<<<<<< HEAD
      pacman -S bspwm sxhkd kitty polybar kitty rofi feh vnstat zsh
      systemctl enable vnstat
      systemctl start vnstat
      chsh -s $(which zsh)
    elif [ "$user" != "root" ]; then
      sudo pacman -Syu
      sleep 0.1
      sudo pacman -S bspwm sxhkd kitty polybar kitty rofi feh vnstat zsh
      sudo systemctl enable vnstat
      sudo systemctl start vnstat
      chsh -s $(which zsh)
    fi    
=======
      pacman -S bspwm sxhkd kitty polybar kitty rofi feh vnstat
      systemctl enable vnstat
      systemctl start vnstat
    elif [ "$user" != "root" ]; then
      sudo pacman -Syu
      sleep 0.1
      sudo pacman -S bspwm sxhkd kitty polybar kitty rofi feh vnstat
      sudo systemctl enable vnstat
      sudo systemctl start vnstat
    fi    
  elif [ "$getOS" = "Parrot" ]; then
    if [ "$user" == "root" ]; then
      parrot-upgrade
      sleep 0.1
      apt install bspwm sxhkd kitty polybar kitty rofi feh vnstat
      systemctl enable vnstat
      systemctl start vnstat
    elif [ "$user" != "root" ]; then
      sudo parrot-upgrade
      sleep 0.1
      sudo apt install bspwm sxhkd kitty polybar kitty rofi feh vnstat
      systemctl enable vnstat
      systemctl start vnstat
    fi
>>>>>>> a5b8b14e8fb7625287faa1e7de793ac9dc926d76
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
<<<<<<< HEAD
  rm config
=======
>>>>>>> a5b8b14e8fb7625287faa1e7de793ac9dc926d76
  cd scripts/
  chmod +x *
  cd 
  cd ~/.config/kitty
  chmod +x *
  cd 
  cd ~/.config/rofi/themes 
  chmod +x *
  cd
  
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

  rm .p10k.zsh
  cd
  cp $dotfiles_path/.p10k.zsh /home/$user

  if [ "$user" == "root" ]; then
    cp -r $dotfiles_path/fonts /usr/share/fonts/
  elif [ "$user" != "root" ]; then
    sudo cp -r $dotfiles_path/fonts /usr/share/fonts/ 
  fi

  cd $dotfiles_path
  
  if [ "$getDistro" == "debian" ] || [ "$getDistro" == "Debian" ] || [ "$getDistro_secondary" == "debian" ] || [ "$getDistro_secondary" == "Debian" ]; then   
    if [ "$user" == "root" ]; then
      dpkg -i bat_0.24.0_amd64.deb
      dpkg -i lsd_1.1.2_amd64.deb
    elif [ "$user" != "root" ]; then
      sudo dpkg -i bat_0.24.0_amd64.deb
      sudo dpkg -i lsd_1.1.2_amd64.deb
    fi
  elif [ "$getDistro" == "arch" ] || [ "$getDistro" == "Arch" ] || [ "$getDistro_secondary" == "arch" ] || [ "$getDistro_secondary" == "Arch" ] ; then
    if [ "$user" == "root" ]; then
      pacman -S bat lsd
    elif [ "$user" != "root" ]; then
      sudo pacman -S bat lsd
    fi
  fi

  cd 
  cp .zshrc ~/backups
  rm .zshrc
  cp $dotfiles_path/.zshrc .
  cd 
  cd $dotfiles_path
<<<<<<< HEAD
  sleep 1
  chmod +x changeTheme.sh
=======
>>>>>>> a5b8b14e8fb7625287faa1e7de793ac9dc926d76
  ./changeTheme.sh -m 
}

remove_enviroment(){  
  
  if [ "$getDistro" == "debian" ] || [ "$getDistro" == "Debian" ] || [ "$getDistro_secondary" == "debian" ] || [ "$getDistro_secondary" == "Debian" ]; then   
    if [ "$user" == "root" ]; then
      apt update && apt upgrade
      sleep 0.1
<<<<<<< HEAD
      apt remove bspwm sxhkd kitty polybar kitty rofi feh vnstat zsh
      chsh -s $(which bash)
    elif [ "$user" != "root" ]; then
      sudo apt update && sudo apt upgrade
      sleep 0.1
      sudo apt remove bspwm sxhkd kitty polybar kitty rofi feh vnstat zsh
      chsh -s $(which bash)
=======
      apt remove bspwm sxhkd kitty polybar kitty rofi feh vnstat
    elif [ "$user" != "root" ]; then
      sudo apt update && sudo apt upgrade
      sleep 0.1
      sudo apt remove bspwm sxhkd kitty polybar kitty rofi feh vnstat
>>>>>>> a5b8b14e8fb7625287faa1e7de793ac9dc926d76
    fi
  elif [ "$getDistro" == "arch" ] || [ "$getDistro" == "Arch" ] || [ "$getDistro_secondary" == "arch" ] || [ "$getDistro_secondary" == "Arch" ]; then
    if [ "$user" == "root" ]; then
      pacman -Syu
      sleep 0.1
<<<<<<< HEAD
      pacman -R bspwm sxhkd kitty polybar kitty rofi feh bat lsd vnstat zsh
      chsh -s $(which bash)
    elif [ "$user" != "root" ]; then
      sudo pacman -Syu
      sleep 0.1
      sudo pacman -R bspwm sxhkd kitty polybar kitty rofi feh bat lsd vnstat zsh
      chsh -s $(which bash)
    fi    
=======
      pacman -R bspwm sxhkd kitty polybar kitty rofi feh bat lsd vnstat
    elif [ "$user" != "root" ]; then
      sudo pacman -Syu
      sleep 0.1
      sudo pacman -R bspwm sxhkd kitty polybar kitty rofi feh bat lsd vnstat
    fi    
  elif [ "$getOS" = "Parrot" ]; then
    if [ "$user" == "root" ]; then
      parrot-upgrade
      sleep 0.1
      apt remove bspwm sxhkd kitty polybar kitty rofi feh vnstat
    elif [ "$user" != "root" ]; then
      sudo parrot-upgrade
      sleep 0.1
      sudo apt remove bspwm sxhkd kitty polybar kitty rofi feh vnstat
    fi
>>>>>>> a5b8b14e8fb7625287faa1e7de793ac9dc926d76
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
  cp ~/backups/.zshrc .
  rm -r backups
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
  echo -e "${redColour}\n\t██╗  ██╗ █████╗  ██████╗██╗  ██╗██████╗ ███████╗██████╗ ██╗    ██╗███╗   ███╗${endColour}"
  sleep 0.025
  echo -e "${redColour}\t██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔════╝██╔══██╗██║    ██║████╗ ████║${endColour}"
  sleep 0.025
  echo -e "${redColour}\t███████║███████║██║     █████╔╝ ██████╔╝███████╗██████╔╝██║ █╗ ██║██╔████╔██║${endColour}"
  sleep 0.025
  echo -e "${redColour}\t██╔══██║██╔══██║██║     ██╔═██╗ ██╔══██╗╚════██║██╔═══╝ ██║███╗██║██║╚██╔╝██║${endColour}"
  sleep 0.025
  echo -e "${redColour}\t██║  ██║██║  ██║╚██████╗██║  ██╗██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║${endColour}"
  sleep 0.025
  echo -e "${redColour}\t╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝${endColour}\n"
  sleep 0.025
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
