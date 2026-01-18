#!/bin/bash

echo "IP Address:"
ip addr show | awk '/inet / {print $2}'

echo "Default Gateway:"
ip route | awk '/default/ {print $3}'

echo "Internet Test:"
ping -c 2 8.8.8.8 >/dev/null && echo "Online" || echo "Offline"
