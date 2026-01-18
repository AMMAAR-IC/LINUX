#!/bin/bash

echo "Cleaning package cache..."
sudo rm -rf /var/cache/pacman/pkg/* 2>/dev/null
sudo rm -rf /var/cache/dnf 2>/dev/null

echo "Removing temp files..."
rm -rf /tmp/*

echo "Cleanup complete."
