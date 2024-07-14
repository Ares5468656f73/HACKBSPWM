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
      echo -e "${redColour}You cant perform this operation like root${endColour}"
    elif [ "$user" != "root" ]; then
      sudo apt update && sudo apt upgrade
      sleep 0.1
      sudo apt install bspwm sxhkd kitty polybar kitty rofi feh nmap zsh
      chsh -s $(which zsh)
    fi
  elif [ "$getDistro" == "arch" ] || [ "$getDistro" == "Arch" ] || [ "$getDistro_secondary" == "arch" ] || [ "$getDistro_secondary" == "Arch" ]; then
    if [ "$user" == "root" ]; then
      echo -e "${redColour}You cant perform this operation like root${endColour}"
    elif [ "$user" != "root" ]; then
      sudo pacman -Syu
      sleep 0.1
      sudo pacman -S bspwm sxhkd kitty polybar kitty rofi feh nmap zsh
      chsh -s $(which zsh)
    fi    
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
  rm config
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
  
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

  rm .p10k.zsh
  cd
  cp $dotfiles_path/.p10k.zsh /home/$user

  if [ "$user" == "root" ]; then
    cd
    chsh -s $(which zsh)

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    
    rm .p10k.zsh
    cp $dotfiles_path/.p10k.zsh_root .
    mv .p10k.zsh_root .p10k.zsh
  elif [ "$user" != "root" ]; then
    sudo su
    cd
    chsh -s $(which zsh)
    
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    
    rm .p10k.zsh
    cp $dotfiles_path/.p10k.zsh_root .
    mv .p10k.zsh_root .p10k.zsh
  fi

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
  sleep 1
  chmod +x changeTheme.sh
  ./changeTheme.sh -m 
}

remove_enviroment(){  
  
  if [ "$getDistro" == "debian" ] || [ "$getDistro" == "Debian" ] || [ "$getDistro_secondary" == "debian" ] || [ "$getDistro_secondary" == "Debian" ]; then   
    if [ "$user" == "root" ]; then
      echo -e "${redColour}You cant perform this operation like root${endColour}"
    elif [ "$user" != "root" ]; then
      sudo apt update && sudo apt upgrade
      sleep 0.1
      sudo apt remove bspwm sxhkd kitty polybar kitty rofi feh nmap zsh
      chsh -s $(which bash)
    fi
  elif [ "$getDistro" == "arch" ] || [ "$getDistro" == "Arch" ] || [ "$getDistro_secondary" == "arch" ] || [ "$getDistro_secondary" == "Arch" ]; then
    if [ "$user" == "root" ]; then
      echo -e "${redColour}You cant perform this operation like root${endColour}"
    elif [ "$user" != "root" ]; then
      sudo pacman -Syu
      sleep 0.1
      sudo pacman -R bspwm sxhkd kitty polybar kitty rofi feh bat lsd nmap zsh
      chsh -s $(which bash)
    fi    
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
  cd 
  rm -r ~/Scripts/
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
