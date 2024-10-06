# ***Pentesting Environment on Linux***

This pentesting environment is specifically configured for Linux and utilizes the following tools and configurations:

***Window Manager ≡ [bspwm](https://github.com/baskerville/bspwm)*** 

## Preview

---

![Preview-1](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/Main.png)


## **Installation**
---
To automatically configure the pentesting environment, use the [`setup.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/setup.sh) script included in this repository.

### **Clone the Repository**

Clone this repository to your local machine.

```bash
git clone https://github.com/Ares5468656f73/HACKBSPWM.git
cd HACKBSPWM
```

Run the **setup.sh** script to install and configure all the necessary tools.

```bash
chmod +x setup.sh
./installer.sh
```

After the script has finished, log out and log back in to apply all changes.

## Modules in polybar
The polybar have 5 icons in polybar
![Preview-1](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/Polybar_preview.png)
#### Battery module [`battery_status.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/polybar/scripts/battery_status.sh)
The battery module print the actual percentage of the battery and if it is charging
#### VPN module [`vpn_status.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/polybar/scripts/vpn_status.sh)
Is the lock which is red, check is VPN its running 
#### Open ports module [`open_ports.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/polybar/scripts/open_ports.sh)
It checks if the machine has open ports
#### AI integration module [`chatgpt.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/polybar/scripts/chatgpt.sh)
If you click it you will see this:
![Video AI](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/AI.mp4)
###### This is the input you give, to configure it you need to:
![AI script preview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/AI_preview.png)
You need to change the api key
#### Shudown buttons [`launch_shutdown_buttons.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/polybar/scripts/launch_shutdown_buttons.sh)
![Shutdown video](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/Buttons_preview.mp4)

## Change shell 
---
>[!TIP]
>Change the shell

Now the shell if configure apart of the [`setup.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/setup.sh) with [`setup_zsh.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/zsh_setup/setup_zsh.sh) script.


## Rofi
---
![Rofi theme](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/RofiPreview.png)

The original `rofi` theme was from [adi1090x](https://github.com/adi1090x/rofi/tree/master)

>[!IMPORTANT]
>## **Tool Details**
>
>### [**bspwm**](https://github.com/baskerville/bspwm)
>
>bspwm is a tiling window manager that organizes windows in a binary tree format.
>
>### [**sxhkd**](https://github.com/baskerville/sxhkd)
>
>sxhkd is a simple X hotkey daemon that maps key combinations to commands.
>
>### [**kitty**](https://github.com/kovidgoyal/kitty.git)
>
>kitty is a fast and feature-rich terminal emulator.
>
>### [**bat**](https://github.com/sharkdp/bat)
>
>bat is a cat clone with syntax highlighting and integrated pagination.
>
>### [**lsd**](https://github.com/lsd-rs/lsd)
>
>lsd is a modern alternative to ls with a beautiful colorized output.

Fonts were from [HackNerdFonts](https://www.nerdfonts.com/) and [Monocraft](https://github.com/IdreesInc/Monocraft) 

## **License**

---

This project is licensed under the MIT License. See the LICENSE file for details.

[github.com/Ares5468656f73](https://github.com/Ares5468656f73/HACKBSPWM.git)

>[!WARNING]
>This `README.md` file provides comprehensive information about the pentesting >environment, how to install it using the `setup.sh` script, a brief description >of each tool included, and the contents of the scrips.
