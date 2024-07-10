#!/bin/bash

# Interface to monitor
INTERFACE="wlan0"  # Cambia esto a la interfaz que desees monitorizar

# Fetch network traffic data
TRAFFIC=$(vnstat -i $INTERFACE --oneline b 2>/dev/null | awk -F\; '{print " " $9 "B/s  " $10 "B/s"}')

echo $TRAFFIC
