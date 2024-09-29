#!/usr/bin/env python3

import curses
import os

# Define the Nerd Font icons for the menu options
menu_items = [
    '\uf011  SHUTDOWN  ',  # Power icon
    '\uf021  RESTART  ',   # Restart icon
    '\uf100  HOME SCREEN  ',  # Home icon
]

separator = '  '  # Separator icon (U+EB4D)

def menu(stdscr):
    # Disable cursor
    curses.curs_set(0)
    
    # Get terminal size
    height, width = stdscr.getmaxyx()
    
    current_selection = 0

    while True:
        stdscr.clear()

        # Display the menu with buttons and separator
        button_strs = []
        for idx, item in enumerate(menu_items):
            button_strs.append(f"  {item}  ")

        # Join buttons with separator and center horizontally
        full_menu_str = separator.join(button_strs)
        start_x = (width // 2) - (len(full_menu_str) // 2)

        # Display each button with the corresponding color
        for idx, button in enumerate(button_strs):
            if idx == current_selection:
                color = 1 if idx == 0 else (2 if idx == 1 else 3)
                stdscr.addstr(height // 2, start_x, f"[ {menu_items[idx]} ]", curses.color_pair(color) | curses.A_BOLD)
            else:
                color = 1 if idx == 0 else (2 if idx == 1 else 3)
                stdscr.addstr(height // 2, start_x, f"  {menu_items[idx]}  ", curses.color_pair(color))
            
            start_x += len(button) + len(separator)  # Move to the next position

        stdscr.refresh()

        # Get user input
        key = stdscr.getch()

        # Navigate through the menu using left and right arrow keys
        if key == curses.KEY_LEFT and current_selection > 0:
            current_selection -= 1
        elif key == curses.KEY_RIGHT and current_selection < len(menu_items) - 1:
            current_selection += 1
        elif key == ord('\n'):  # Execute selected option on Enter
            if current_selection == 0:  # Shutdown
                os.system('sudo shutdown now')
                break
            elif current_selection == 1:  # Restart
                os.system('sudo reboot now')
                break
            elif current_selection == 2:  # Go to home screen
                os.system('kill -9 -1')
                break
        elif key == 27:  # Exit on Escape key
            break

def main(stdscr):
    # Initialize color pairs with the specified colors
    curses.start_color()
    curses.init_pair(1, curses.COLOR_RED, curses.COLOR_BLACK)    # Shutdown button color (red #f7768e)
    curses.init_pair(2, curses.COLOR_YELLOW, curses.COLOR_BLACK)  # Restart button color (approx. #e0af68)
    curses.init_pair(3, curses.COLOR_CYAN, curses.COLOR_BLACK)    # Home Screen button color (approx. #73daca)
    
    # Run the menu
    menu(stdscr)

# Start curses
curses.wrapper(main)

