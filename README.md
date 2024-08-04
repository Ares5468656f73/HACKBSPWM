# ***Pentesting Environment on Linux***

![](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExY3RyMWM5MDR5dGl5NG4ydDVndWI2MGZtbmY5Zmwzbm9zbnV0aHlmbyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/B4dt6rXq6nABilHTYM/giphy.webp)

This pentesting environment is specifically configured for Linux and utilizes the following tools and configurations:

***Window Manager ≡ [bspwm](https://github.com/baskerville/bspwm)*** 

## Preview

---

![Preview-1](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/Preview1.png)

![Preview-2](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/Preview2.png)

![Preview-4](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/Preview3.png)

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

## Change theme
---
>[!TIP]
>Change the color theme

To change the theme for your polybar and your kitty and also the background you only need to execute de [`changeTheme.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Scripts/changeTheme.sh) script.


There are ***4*** available themes, thanks to 

| Name | Description |
|--------|-------------|
| [S4vitar](https://www.youtube.com/@s4vitar) | For main theme color and also for introduce me in cybersecurity world. Thanks S4vi por que se tensó |
| [Catppuccin](https://catppuccin.com/) | Obviously for the catppuccin theme |
| [Tokyo](https://github.com/ares5468656f73) | Colors by me ;) |


## Rofi
---
![Rofi theme](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/RofiPreview.png)

The original `rofi` theme was from [adi1090x](https://github.com/adi1090x/rofi/tree/master)

# ZSHRC
---
New `.zshrc` for [user](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/.zshrc_user) and [root](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/.zshrc_root)

With new ***prompt*** 

![PromptMainPreview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/PromptMainPreview.png)
![PromptCatppuccinPreview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/PromptCatppuccinPreview.png)
![PromptTokyoPreview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/PromptTokyoPreview.png)

##### **And also new functions**
![pkgInstall](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/pkgInstallPreview.png)
---
![systemUpgrade](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/systemUpgradePreview.png)
---
![startServer](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/startServerPreview.png)

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
