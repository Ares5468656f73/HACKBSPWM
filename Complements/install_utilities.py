#!/usr/bin/env python3

import os 

total_programs = ['neovim', 'ranger', 'xclip', 'git', 'curl', 'wget', 'firefox', 'neofetch']  # The total programs to choose
user_programs = []  # The programs user chooses

# Ask user which programs to install
for program in total_programs:
    try:
        user_choices = int(input(f"Do you want to install: {program}\n1-Yes\n2-No\n\t->"))
        match user_choices:
            case 1:
                user_programs.append(program)
            case 2:
                pass
            case _:
                print("Invalid option")
    except ValueError:
        print("Please enter a valid number")
    print(f"Selected programs so far: {user_programs}")

# Function to get the Linux distro base
def get_distro_base():
    try:
        with open("/etc/os-release") as f:
            for line in f:
                if line.startswith("ID_LIKE="):
                    # Extract the base of the distribution
                    distro_base = line.strip().split("=")[1].replace('"', '').lower()
                    if "debian" in distro_base:
                        return "debian"
                    elif "arch" in distro_base:
                        return "arch"
                    elif "rhel" in distro_base or "fedora" in distro_base:
                        return "fedora"
    except FileNotFoundError:
        return None

# Function to install selected programs based on the distro
def install_programs():
    distro = get_distro_base()  # Call the function to get the distro base
    if not distro:
        print("Could not detect the distribution base.")
        return
    
    if not user_programs:
        print("No programs selected for installation.")
        return
    
    # Convert the list of programs into a string
    programs_to_install = ' '.join(user_programs)

    match distro:
        case "debian":
            os.system(f"sudo apt update && sudo apt install -y {programs_to_install}")
        case "arch":
            os.system(f"sudo pacman -Syu {programs_to_install}")
            install_ly_decision = int(input("Do you want to install ly windows display?\n1-Yes\n2-No\n\t-> "))
            match install_ly_decision:
                case 1:
                    os.system("sudo pacman -S --needed base-delevel git")
                    os.system("cd /opt")
                    os.system("sudo git clone https://aur.archlinux.org/yay.git")
                    os.system("sudo chown -R $(whoami):$(whoami) yay")
                    os.system("cd yay")
                    os.system("makepkg -si")
                    os.system("yay -S ly")
                case 2:
                    pass
                case _:
                    pass
        case "fedora":
            os.system(f"sudo dnf install -y {programs_to_install}")
        case _:
            print("Unsupported distribution.")

# Run the installation
install_programs()
