#!/bin/bash

echo "CPU model:"
lscpu | awk -F: '/Model name/ {print $2}'

echo
echo "Load average:"
uptime | awk -F'load average:' '{print $2}'

echo
echo "Top CPU consumers:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
