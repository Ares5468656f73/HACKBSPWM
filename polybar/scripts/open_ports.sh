#!/bin/bash

# List open ports
PORTS=$(netstat -tuln | grep LISTEN | awk '{print $4}' | cut -d':' -f2 | tr '\n' ' ')
echo " Ports: $PORTS"
