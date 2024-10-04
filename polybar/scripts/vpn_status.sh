#!/usr/bin/env bash

# Check if VPN is running
if pgrep -x "openvpn" > /dev/null; then
    # VPN active
    echo "%{F#7aa2f7} %{F-}"
else
    # VPN inactive
    echo "%{F#f7768e} %{F-}"
fi 