#!/usr/bin/bash

# Colors
COLORS=(
  "green=\e[0;32m\033[1m"
  "end=\033[0m\e[0m"
  "red=\e[0;31m\033[1m"
  "blue=\e[0;34m\033[1m"
  "yellow=\e[0;33m\033[1m"
  "purple=\e[0;35m\033[1m"
  "turquoise=\e[0;36m\033[1m"
  "gray=\e[0;37m\033[1m"
)

for color in "${COLORS[@]}"; do
  eval $color
done

help_panel() {
  echo -e "\t\t${green}-i)${end} ${gray}Install the environment${end}"
  echo -e "\t\t${red}-r)${end} ${gray}Remove the environment${end}\n"
}

user=$(whoami)
dotfiles_path=$(find / -name "HACKBSPWM" 2>/dev/null)

if [ -z "$dotfiles_path" ]; then
  echo -e "${red}Error: HACKBSPWM directory not found.${end}"
  exit 1
fi

install_environment() {
  local packages="bspwm sxhkd kitty polybar rofi feh nmap zsh"
  local extra_packages="lsd bat"
  local os=$1
  local update_cmd install_cmd
  
  case $os in
    1)
      update_cmd="sudo apt update && sudo apt upgrade -y"
      install_cmd="sudo apt install -y $packages"
      ;;
    2)
      update_cmd="sudo pacman -Syu"
      install_cmd="sudo pacman -S --noconfirm $packages $extra_packages"
      ;;
    3)
      update_cmd="sudo dnf update -y && sudo dnf upgrade -y"
      install_cmd="sudo dnf install -y $packages"
      ;;
    *)
      echo -e "${yellow}Invalid option${end}"
      exit 1
      ;;
  esac

  if [ "$user" == "root" ]; then
    echo -e "${red}You can't perform this operation as root.${end}"
    exit 1
  fi

  eval $update_cmd
  eval $install_cmd

  chsh -s $(which zsh)

  if [[ $os == 1 ]]; then
    cd $dotfiles_path
    sudo dpkg -i bat_0.24.0_amd64.deb lsd_1.1.2_amd64.deb
  fi

  copy_config_files
  install_fonts
  setup_zsh
}

remove_environment() {
  local packages="bspwm sxhkd kitty polybar rofi feh nmap zsh"
  local os=$1
  local update_cmd remove_cmd
  
  case $os in
    1)
      update_cmd="sudo apt update && sudo apt upgrade -y"
      remove_cmd="sudo apt remove --purge -y $packages"
      ;;
    2)
      update_cmd="sudo pacman -Syu"
      remove_cmd="sudo pacman -R --noconfirm $packages"
      ;;
    3)
      update_cmd="sudo dnf update -y && sudo dnf upgrade -y"
      remove_cmd="sudo dnf remove -y $packages"
      ;;
    *)
      echo -e "${yellow}Invalid option${end}"
      exit 1
      ;;
  esac

  if [ "$user" == "root" ]; then
    echo -e "${red}You can't perform this operation as root.${end}"
    exit 1
  fi

  eval $update_cmd
  eval $remove_cmd

  remove_config_files
}

copy_config_files() {
  local config_dirs=("bspwm" "sxhkd" "polybar" "kitty" "rofi")
  local src_dir=$dotfiles_path

  for dir in "${config_dirs[@]}"; do
    cp -r $src_dir/$dir ~/.config
  done

  cp -r $src_dir/Wallpapers /home/$user
  chmod +x ~/.config/{bspwm,bspwm/scripts,sxhkd,polybar,polybar/scripts,kitty,rofi/themes}/*
  cp -r $src_dir/Scripts ~
  chmod +x ~/Scripts/*
}

install_fonts() {
  local fonts_dir="/usr/share/fonts"
  sudo cp -r $dotfiles_path/fonts $fonts_dir
}

setup_zsh() {
  local zsh_custom="$HOME/.oh-my-zsh/custom"
  local plugins_dir="$zsh_custom/plugins"
  
  if [ -f ~/.zshrc ]; then
    rm ~/.zshrc
  fi

  if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  cp $dotfiles_path/.zshrc ~

  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $plugins_dir/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $plugins_dir/zsh-autosuggestions
  chmod +x $plugins_dir/*

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
}

while getopts "ir" arg; do
  case $arg in
    i)
      echo -e "\n\t${green}Installing the environment${end}\n"
      sleep 1.5
      install_environment
      echo -e "${green}\n\tThe environment has been installed, please reboot the machine\n${end}"
      ;;
    r)
      echo -e "\n\t${red}Removing the environment${end}\n"
      sleep 1.5
      remove_environment
      echo -e "${red}\n\tThe environment has been removed, please reboot the machine\n${end}"
      ;;
    *)
      help_panel
      ;;
  esac
done

if [ $OPTIND -eq 1 ]; then
  help_panel
fi
