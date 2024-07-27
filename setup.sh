#!/usr/bin/env bash

# Display help panel
show_help() {
  echo -e "\t-i) Install the environment"
  echo -e "\t-r) Remove the environment\n"
}

# Check if HACKBSPWM directory exists
dotfiles_path=$(find / -name "HACKBSPWM" 2>/dev/null)
if [ -z "$dotfiles_path" ]; then
  echo "Error: HACKBSPWM directory not found."
  exit 1
fi

user=$(whoami)
if [ "$user" == "root" ]; then
  echo "Operation cannot be performed as root."
  exit 1
fi

# Remove configuration files
remove_config_files() {
  rm -rf ~/.config/{bspwm,sxhkd,kitty,polybar,rofi} ~/Wallpapers ~/Scripts
}

# Copy configuration files
copy_config_files() {
  local config_dirs=("bspwm" "sxhkd" "kitty" "polybar" "rofi")
  local src_dir=$dotfiles_path

  for dir in "${config_dirs[@]}"; do
    cp -r "$src_dir/$dir" ~/.config
  done

  cp -r "$src_dir/Wallpapers" ~
  chmod +x ~/.config/{bspwm,bspwm/scripts,sxhkd,polybar,polybar/scripts,kitty,rofi/themes}/*
  cp -r "$src_dir/Scripts" ~
  chmod +x ~/Scripts/*
}

# Install fonts
install_fonts() {
  sudo cp -r "$dotfiles_path/fonts" /usr/share/fonts
}

# Setup Zsh for the current user
setup_zsh() {
  local zsh_custom="$HOME/.oh-my-zsh/custom"
  local plugins_dir="$zsh_custom/plugins"

  if [ -f ~/.zshrc ]; then
    rm ~/.zshrc
  fi

  if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  cp "$dotfiles_path/.zshrc_user" ~/.zshrc

  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$plugins_dir/zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-autosuggestions.git "$plugins_dir/zsh-autosuggestions"
  chmod +x "$plugins_dir"/*
}

# Setup Zsh for root
setup_root_zsh() {
  sudo bash -c '
    local zsh_custom="/root/.oh-my-zsh/custom"
    local plugins_dir="$zsh_custom/plugins"

    if [ -f /root/.zshrc ]; then
      rm /root/.zshrc
    fi

    if [ ! -d /root/.oh-my-zsh ]; then
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    cp "'$dotfiles_path'/.zshrc_root" /root/.zshrc

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$plugins_dir/zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$plugins_dir/zsh-autosuggestions"
    chmod +x "$plugins_dir"/*
  '
}

# Install the environment
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
      echo "Invalid option"
      exit 1
      ;;
  esac

  eval $update_cmd
  eval $install_cmd

  chsh -s $(which zsh)

  if [ "$os" -eq 1 ]; then
    cd "$dotfiles_path"
    sudo dpkg -i bat_0.24.0_amd64.deb lsd_1.1.2_amd64.deb
  fi

  copy_config_files
  install_fonts
  setup_zsh
  setup_root_zsh
}

# Remove the environment
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
      echo "Invalid option"
      exit 1
      ;;
  esac

  eval $update_cmd
  eval $remove_cmd

  remove_config_files
}

# Command line option parsing
while getopts "ir" opt; do
  case $opt in
    i)
      echo -e "\nInstalling the environment\n"
      sleep 1.5
      echo -e "Select your operating system:\n1) Debian/Ubuntu\n2) Arch\n3) Fedora"
      read -p "Enter the number corresponding to your OS: " os
      install_environment $os
      echo -e "\nThe environment has been installed, please reboot the machine\n"
      ;;
    r)
      echo -e "\nRemoving the environment\n"
      sleep 1.5
      echo -e "Select your operating system:\n1) Debian/Ubuntu\n2) Arch\n3) Fedora"
      read -p "Enter the number corresponding to your OS: " os
      remove_environment $os
      echo -e "\nThe environment has been removed, please reboot the machine\n"
      ;;
    *)
      show_help
      ;;
  esac
done

# Show the help panel if no options were passed
if [ $OPTIND -eq 1 ]; then
  show_help
fi