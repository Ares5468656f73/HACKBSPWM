export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

source ~/.oh-my-zsh/oh-my-zsh.sh

# Detect distro for automatic updates and install pkg
function detect_distro {
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        DISTRO=$ID
    else
        DISTRO=$(uname -s)
    fi
    echo $DISTRO
}

# Install any pkg with pkgInstall <name_of_the_pkg>
function pkgInstall {
    local package=$1
    local distro=$(detect_distro)

    if command -v apt-get >/dev/null; then
        # Debian, Ubuntu, Linux Mint
        sudo apt-get update
        sudo apt-get install -y $package
    elif command -v dnf >/dev/null; then
        # Fedora
        sudo dnf install -y $package
    elif command -v pacman >/dev/null; then
        # Arch, Manjaro
        sudo pacman -S --noconfirm $package
    else
        echo "Unsupported distribution or package manager"
        return 1
    fi
}

# Auto upgrade
function systemUpgrade {
    local distro=$(detect_distro)

    if command -v apt-get >/dev/null; then
        # Debian, Ubuntu, Linux Mint
        sudo apt-get update
        sudo apt-get upgrade -y
    elif command -v dnf >/dev/null; then
        # Fedora
        sudo dnf upgrade --refresh -y
    elif command -v pacman >/dev/null; then
        # Arch, Manjaro
        sudo pacman -Syu --noconfirm
    else
        echo "Unsupported distribution or package manager"
        return 1
    fi
}

plugins=(git)

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# ls -> lsd | cat -> bat
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

# Plugins 
plugins=( 
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# Battery percentage function
get_battery_percentage() {
    cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "󱉝 "
}

# Number of process in execution
get_process_count() {
    ps aux | wc -l
}

PROMPT='%F{cyan} %n%f: %F{yellow}  %~%f $(git_prompt_info) %F{green}$(get_battery_percentage)%f %F{red}:$(get_process_count)%f %F{magenta} %f '
