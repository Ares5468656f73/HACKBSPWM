#!/usr/bin/env bash

# Intenta encontrar el archivo .p10k.zsh en el sistema
p10k_config_file_path=$(find / -name .p10k.zsh 2>/dev/null | head -n 1)

# Verifica que se encontró el archivo de configuración
if [[ -z "$p10k_config_file_path" ]]; then
  echo "No se encontró el archivo .p10k.zsh. Asegúrate de que la ruta sea correcta."
  exit 1
fi

command -v curl >/dev/null 2>&1 || { echo >&2 "Curl no está instalado. Instálalo e inténtalo de nuevo."; exit 1; }
command -v git >/dev/null 2>&1 || { echo >&2 "Git no está instalado. Instálalo e inténtalo de nuevo."; exit 1; }

setup_oh_my_zsh () 
{
  if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh ya está instalado."
  else
    if ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
      echo "Error al instalar Oh My Zsh."
      exit 1
    fi
  fi
}

install_powerlevel10k () 
{
  # Instalación para el usuario normal
  if [ ! -d ~/powerlevel10k ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
  else
    echo "La carpeta ~/powerlevel10k ya existe. Omitiendo la clonación."
  fi

  # Instalación para root
  if [ "$(id -u)" -eq 0 ]; then
    if [ ! -d /root/powerlevel10k ]; then
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/powerlevel10k
      echo 'source /root/powerlevel10k/powerlevel10k.zsh-theme' >> /root/.zshrc
    else
      echo "La carpeta /root/powerlevel10k ya existe. Omitiendo la clonación."
    fi
  fi

  # Copiar la configuración de Powerlevel10k
  if [ -e "$HOME/.p10k.zsh" ]; then
    read -p "~/.p10k.zsh ya existe. ¿Deseas sobrescribirlo? (s/n): " choice
    case "$choice" in
      s|S ) rm "$HOME/.p10k.zsh";;
      * ) echo "No se sobrescribió ~/.p10k.zsh";;
    esac
  fi

  cp "$p10k_config_file_path" "$HOME/.p10k.zsh"

  if [ "$(id -u)" -eq 0 ]; then
    if [ -e /root/.p10k.zsh ]; then
      read -p "/root/.p10k.zsh ya existe. ¿Deseas sobrescribirlo? (s/n): " choice
      case "$choice" in
        s|S ) rm /root/.p10k.zsh;;
        * ) echo "No se sobrescribió /root/.p10k.zsh";;
      esac
    fi

    cp "$p10k_config_file_path" /root/.p10k.zsh
  fi
}

install_plugins () 
{
  if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  else
    echo "El plugin zsh-autosuggestions ya está instalado."
  fi

  if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  else
    echo "El plugin zsh-syntax-highlighting ya está instalado."
  fi
  
  if ! grep -q "zsh-autosuggestions" ~/.zshrc; then
    sed -i "s/plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/" ~/.zshrc
  fi
}

setup_oh_my_zsh
install_powerlevel10k
install_plugins
