#!/bin/bash

echo "Memory usage:"
free -h

echo
echo "Swap usage:"
swapon --show || echo "No swap enabled"

echo
echo "Top memory consumers:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
