#!/usr/bin/env bash

# Name of the bar, this will help for future bars
BAR_NAME="shutdown_buttons"

# Check if bar is executing
if pgrep -x "polybar" -a | grep -q "$BAR_NAME"; then
    # if it is executing, kill it
    pkill -f "polybar $BAR_NAME"
    # restore the padding after resize
    bspc config top_padding 40
else
    # increase the padding to open the bar
    bspc config top_padding 0
    # launch the bar
    polybar $BAR_NAME &
fi

