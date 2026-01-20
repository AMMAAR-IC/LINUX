#!/bin/bash

echo "Top CPU processes:"
ps -eo pid,user,comm,%cpu --sort=-%cpu | head -n 6

echo
echo "Processes running from /tmp:"
sudo find /proc/*/exe -ls 2>/dev/null | grep "/tmp" || echo "None found"
