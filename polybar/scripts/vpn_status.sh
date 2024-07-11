#!/bin/bash

# Check if VPN is running
if pgrep -x "openvpn" > /dev/null; then
    echo " VPN: On"
else
    echo " VPN: Off"
fi
