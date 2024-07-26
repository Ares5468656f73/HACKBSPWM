# **Pentesting Environment on Linux**

![](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExY3RyMWM5MDR5dGl5NG4ydDVndWI2MGZtbmY5Zmwzbm9zbnV0aHlmbyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/B4dt6rXq6nABilHTYM/giphy.webp)

This pentesting environment is specifically configured for Linux and utilizes the following tools and configurations:

***Window Manager ≡ [bspwm](https://github.com/baskerville/bspwm)*** 

## Images

---

![Preview-1](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/MainTheme.png)

![Preview-2](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/CatppuccinTheme.png)

![Preview-3](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/DraculaTheme.png)

![Preview-4](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/DarkTheme.png)

![Preview-5](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/TokyoTheme)

## **Installation**
---
To automatically configure the pentesting environment, use the [`installer.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/setup.sh) script included in this repository.

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
##### *You will see this*
![FirstPart](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/SetupPreview-1.png)
![SecondPart](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/SetupPreview-2.png)

After the script has finished, log out and log back in to apply all changes.

## Change theme
---
>[!TIP]
>Change the color theme

To change the theme for your polybar and your kitty and also the background you only need to execute de [`changeTheme.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Scripts/changeTheme.sh) script. You will see this:

![ChangeThemePreview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/ChangeThemePreview.png)

There are ***5*** available themes, thanks to 

| Name | Description |
|--------|-------------|
| [S4vitar](https://www.youtube.com/@s4vitar) | For main theme color and also for introduce me in cybersecurity world. Thanks S4vi por que se tensó |
| [Catppuccin](https://catppuccin.com/) | Obviously for the catppuccin theme |
| [Dracula](https://draculatheme.com/) | Obviously for the dracula theme |
| [Dark](https://archcraft.io/) | I took the colors of this distro which i used to use |
| [Tokyo](https://github.com/rxyhn/yoru) | This mf inspired me to create my own environment |


## Rofi
---
![Rofi theme](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/RofiPreview.png)

The original `rofi` theme was from [adi1090x](https://github.com/adi1090x/rofi/tree/master)

Image and colors were from *me* (It`s fucking awesome)

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
>### [**powerlevel10k**](https://github.com/romkatv/powerlevel10k)
>
>powerlevel10k is a highly customizable zsh theme that provides useful information in the prompt.
>
>### [**bat**](https://github.com/sharkdp/bat)
>
>bat is a cat clone with syntax highlighting and integrated pagination.
>
>### [**lsd**](https://github.com/lsd-rs/lsd)
>
>lsd is a modern alternative to ls with a beautiful colorized output.

Fonts were from [HackNerdFonts](https://www.nerdfonts.com/), [Monocraf](https://github.com/IdreesInc/Monocraft) and [Google](https://fonts.google.com/noto/specimen/Noto+Serif+TC)

## **License**

---

This project is licensed under the MIT License. See the LICENSE file for details.

[https://github.com/Ares5468656f73/HACKBSPWM.git](https://github.com/Ares5468656f73/HACKBSPWM.git)

[Ares](https://github.com/Ares5468656f73/)

>[!WARNING]
>This `README.md` file provides comprehensive information about the pentesting >environment, how to install it using the `setup.sh` script, a brief description >of each tool included, and the contents of the scrips.
