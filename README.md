# **Pentesting Environment on Linux**

This pentesting environment is specifically configured for Linux and utilizes the following tools and configurations:

| Window Manager | bspwm |
| --- | --- |
| Keybinding Manager  | sxhkd |
| Terminal | kitty |
| Terminal theme | powerlevel10k |
| File Viewer | bat |
| Directory Listing | lsd |

## Images

---

![DarkTheme](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/DarkTheme.png)

![MainTheme](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/MainTheme.png)

![DraculaTheme](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/DraculaTheme.png)

![CatppuccinTheme](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/CatppuccinTheme.png)

## **Installation**

---

To automatically configure the pentesting environment, use the [`installer.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/installer.sh) script included in this repository.

### **Clone the Repository**

Clone this repository to your local machine.

```bash
git clone https://github.com/Ares5468656f73/HACKBSPWM.git
cd HACKBSPWM
```

Run the **installer.sh** script to install and configure all the necessary tools.

```bash
chmod +x installer.sh
./installer.sh
```

After the script has finished, log out and log back in to apply all changes.

## Change theme

---

To change the theme for your polybar and your kitty and also the background you only need to execute de [`changeTheme.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/changeTheme.sh) script. You will see this:

![ChangeThemePreview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/ChangeThemePreview.png)

The only thing yout need to do if put a parameter, for example if you want to chenge to Catppuccin theme you run:

```bash
./changeTheme.sh -c
```

To get the changes in your kitty you need to close and open a new terminal, after you log out, reboot or shutdown the machine the theme will apply

## **Tool Details**

---

### **bspwm**

bspwm is a tiling window manager that organizes windows in a binary tree format.

### **sxhkd**

sxhkd is a simple X hotkey daemon that maps key combinations to commands.

### **kitty**

kitty is a fast and feature-rich terminal emulator.

### **powerlevel10k**

powerlevel10k is a highly customizable zsh theme that provides useful information in the prompt.

### **bat**

bat is a cat clone with syntax highlighting and integrated pagination.

### **lsd**

lsd is a modern alternative to ls with a beautiful colorized output

## **Credits**

---

The enviroment was configured by me :)

The kitty and polybar colors are from [s4vitar](https://www.youtube.com/@s4vitar), [dracula](https://draculatheme.com/), [catppuccin](https://catppuccin.com/), [nvchad](https://nvchad.com/)

Icons and fonts were from [HackNerdFonts](https://www.nerdfonts.com/)

## **License**

---

This project is licensed under the MIT License. See the LICENSE file for details.

[https://github.com/Ares5468656f73/HACKBSPWM.git](https://github.com/Ares5468656f73/HACKBSPWM.git)

[Ares](https://github.com/Ares5468656f73/)

This `README.md` file provides comprehensive information about the pentesting environment, how to install it using the `installer.sh` script, a brief description of each tool included, and the contents of the `installer.sh` script itself.
