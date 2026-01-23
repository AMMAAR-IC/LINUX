#!/bin/bash

echo "Disk usage:"
df -h /

echo
echo "Largest directories in /home:"
du -h /home 2>/dev/null | sort -hr | head -n 5

echo
echo "Disk I/O wait:"
iostat 2>/dev/null | awk 'NR>6 {print}'
