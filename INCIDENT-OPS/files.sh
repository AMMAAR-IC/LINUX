#!/bin/bash

echo "Recently modified files (last 24h):"
sudo find /etc /bin /usr/bin -type f -mtime -1 2>/dev/null | head -n 10

echo
echo "World-writable files:"
sudo find / -type f -perm -0002 2>/dev/null | head -n 10
