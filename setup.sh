#!/usr/bin/env bash

# Función para mostrar el panel de ayuda
help_panel() {
  echo -e "\t-i) Instalar el entorno"
  echo -e "\t-r) Eliminar el entorno\n"
}

# Verifica si el directorio HACKBSPWM existe
dotfiles_path=$(find / -name "HACKBSPWM" 2>/dev/null)
if [ -z "$dotfiles_path" ]; then
  echo "Error: Directorio HACKBSPWM no encontrado."
  exit 1
fi

user=$(whoami)
if [ "$user" == "root" ]; then
  echo "No puedes realizar esta operación como root."
  exit 1
fi

# Función para eliminar archivos de configuración
remove_config_files() {
  rm -rf ~/.config/{bspwm,sxhkd,kitty,polybar,rofi} ~/Wallpapers ~/Scripts
}

# Función para copiar archivos de configuración
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

# Función para instalar fuentes
install_fonts() {
  sudo cp -r "$dotfiles_path/fonts" /usr/share/fonts
}

# Función para configurar Zsh para el usuario actual
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

# Función para configurar Zsh para root
setup_root_zsh() {
  sudo su -c 'bash -s' <<'EOF'
    local zsh_custom="/root/.oh-my-zsh/custom"
    local plugins_dir="$zsh_custom/plugins"

    if [ -f /root/.zshrc ]; then
      rm /root/.zshrc
    fi

    if [ ! -d /root/.oh-my-zsh ]; then
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    cp "$dotfiles_path/.zshrc_root" /root/.zshrc

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$plugins_dir/zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$plugins_dir/zsh-autosuggestions"
    chmod +x "$plugins_dir"/*
EOF
}

# Función para instalar el entorno
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
      echo "Opción inválida"
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

# Función para eliminar el entorno
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
      echo "Opción inválida"
      exit 1
      ;;
  esac

  eval $update_cmd
  eval $remove_cmd

  remove_config_files
}

# Parseo de opciones de línea de comandos
while getopts "ir" arg; do
  case $arg in
    i)
      echo -e "\nInstalando el entorno\n"
      sleep 1.5
      echo -e "Seleccione su sistema operativo:\n1) Debian/Ubuntu\n2) Arch\n3) Fedora"
      read -p "Ingrese el número correspondiente a su SO: " os
      install_environment $os
      echo -e "\nEl entorno ha sido instalado, por favor reinicie la máquina\n"
      ;;
    r)
      echo -e "\nEliminando el entorno\n"
      sleep 1.5
      echo -e "Seleccione su sistema operativo:\n1) Debian/Ubuntu\n2) Arch\n3) Fedora"
      read -p "Ingrese el número correspondiente a su SO: " os
      remove_environment $os
      echo -e "\nEl entorno ha sido eliminado, por favor reinicie la máquina\n"
      ;;
    *)
      help_panel
      ;;
  esac
done

# Mostrar el panel de ayuda si no se pasaron opciones
if [ $OPTIND -eq 1 ]; then
  help_panel
fi