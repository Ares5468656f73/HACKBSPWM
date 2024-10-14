# 🚀 **Pentesting Environment on Linux**

This pentesting environment is specifically designed for Linux, utilizing cutting-edge tools and configurations to provide a seamless experience.

## 🖥️ **Window Manager ≡ [bspwm](https://github.com/baskerville/bspwm)**

A tiling window manager that organizes windows in a binary tree format, offering efficient workspace management.

## 🌟 **Preview**

---

![Main Preview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/Main_preview.gif?raw=true)

## ⚙️ **Installation**

---

To automatically configure the pentesting environment, use the [`setup.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/setup.sh) script included in this repository.

### **Step 1: Clone the Repository**

Clone this repository to your local machine:

```bash
git clone https://github.com/Ares5468656f73/HACKBSPWM.git
cd HACKBSPWM
```

### **Step 2: Run the Setup Script**

Run the **setup.sh** script to install and configure all necessary tools:

```bash
chmod +x setup.sh
./installer.sh
```

💡 **Tip**: After the script finishes, log out and back in to apply all changes.

## 🛠️ **Polybar Modules**

---

![Rofi Theme Preview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/New_modules_preview.gif?raw=true)
---

![Polybar Preview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/Polybar_preview.png?raw=true)

> [!NOTE]
> 
> There are 5 new modules

### 🔋 Battery Module [`battery_status.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/polybar/scripts/battery_status.sh)

Displays the battery percentage and charging status.

### 🔒 VPN Module [`vpn_status.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/polybar/scripts/vpn_status.sh)

Indicates whether a VPN connection is active (lock icon turns red).

### 🔌 Open Ports Module [`open_ports.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/polybar/scripts/open_ports.sh)

Checks for any open ports on the machine.

### 🤖 AI Integration Module [`chatgpt.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/polybar/scripts/chatgpt.sh)

Clicking this module allows you to interact with ChatGPT.

🔧 **Setup**: Don't forget to update your API key!

### 🔘 Shutdown Buttons [`launch_shutdown_buttons.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/polybar/scripts/launch_shutdown_buttons.sh)

Manage shutdown options with this handy script.

## 🐚 **Change the Shell**

---

> ℹ️ **Note**: You can change the shell as part of the [`setup.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/setup.sh) process using the [`setup_zsh.sh`](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/zsh_setup/setup_zsh.sh) script.

## 🎨 **Rofi Theme**

---

![Rofi Theme Preview](https://github.com/Ares5468656f73/HACKBSPWM/blob/main/Preview/Rofi_theme_preview.png?raw=true)

Original theme by [adi1090x](https://github.com/adi1090x/rofi/tree/master).

## 🔧 **Tool Details**

---

Here are some of the tools and technologies used in this environment:

- [**bspwm**](https://github.com/baskerville/bspwm): Tiling window manager.
- [**sxhkd**](https://github.com/baskerville/sxhkd): X hotkey daemon for mapping keys to commands.
- [**kitty**](https://github.com/kovidgoyal/kitty.git): Fast and feature-rich terminal emulator.
- [**bat**](https://github.com/sharkdp/bat): A `cat` clone with syntax highlighting.
- [**lsd**](https://github.com/lsd-rs/lsd): Modern alternative to `ls` with colorful output.

💡 **Fonts**: [HackNerdFonts](https://www.nerdfonts.com/) and [Monocraft](https://github.com/IdreesInc/Monocraft).

## 📄 **License**

---

> [!CAUTION]
> 
> There are 5 new modules

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

For more information, visit [github.com/Ares5468656f73](https://github.com/Ares5468656f73/HACKBSPWM.git).
