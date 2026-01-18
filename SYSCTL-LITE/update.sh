#!/bin/bash

echo "Checking distro..."

if command -v pacman >/dev/null; then
  sudo pacman -Syu
elif command -v dnf >/dev/null; then
  sudo dnf upgrade
else
  echo "Unsupported package manager"
fi
