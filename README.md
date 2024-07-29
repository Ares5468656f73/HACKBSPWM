# ***Pentesting Environment on Linux***

![](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExY3RyMWM5MDR5dGl5NG4ydDVndWI2MGZtbmY5Zmwzbm9zbnV0aHlmbyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/B4dt6rXq6nABilHTYM/giphy.webp)

This pentesting environment is specifically configured for Linux and utilizes the following tools and configurations:

***Window Manager ≡ [bspwm](https://github.com/baskerville/bspwm)*** 

## Preview

---

![GeneralPreview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/Floating_preview.mp4)

![Preview-1](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/MainTheme.png)

![Preview-2](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/CatppuccinTheme.png)

![Preview-4](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/DarkTheme.png)

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

There are ***4*** available themes, thanks to 

| Name | Description |
|--------|-------------|
| [S4vitar](https://www.youtube.com/@s4vitar) | For main theme color and also for introduce me in cybersecurity world. Thanks S4vi por que se tensó |
| [Catppuccin](https://catppuccin.com/) | Obviously for the catppuccin theme |
| [Dark](https://archcraft.io/) | I took the colors of this distro which i used to use |
| [Tokyo](https://github.com/ares5468656f73) | Colors by me ;) |


## Rofi
---
![Rofi theme](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/RofiPreview.png)

The original `rofi` theme was from [adi1090x](https://github.com/adi1090x/rofi/tree/master)

Image and colors were from *me* (It`s fucking awesome)

# ZSHRC
---
New `.zshrc` for [user](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/.zshrc_user) and [root](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/.zshrc_root)

With new ***prompt*** 

![PromptMainPreview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/PromptMainPreview.png)
![PromptCatppuccinPreview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/PromptCatppuccinPreview.png)
![PromptDarkPreview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/PromptDarkPreview.png)
![PromptTokyoPreview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/PromptTokyoPreview.png)

##### **And also new functions**
![pkgInstall](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/pkgInstall_Preview.png)
---
![systemUpgrade](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/systemUpgrade_Preview.png)
---
![startServer](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/startServer_Preview.png)

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

Fonts were from [HackNerdFonts](https://www.nerdfonts.com/) and [Monocraf](https://github.com/IdreesInc/Monocraft) 

## **License**

---

This project is licensed under the MIT License. See the LICENSE file for details.

[https://github.com/Ares5468656f73/HACKBSPWM.git](https://github.com/Ares5468656f73/HACKBSPWM.git)

[Ares](https://github.com/Ares5468656f73/)

>[!WARNING]
>This `README.md` file provides comprehensive information about the pentesting >environment, how to install it using the `setup.sh` script, a brief description >of each tool included, and the contents of the scrips.
