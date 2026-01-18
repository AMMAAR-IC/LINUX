#!/bin/bash

DEST="$HOME/system-backup"
mkdir -p "$DEST"

echo "Backing up configs..."
cp -r ~/.bashrc ~/.zshrc ~/.config "$DEST" 2>/dev/null

tar -czf "$DEST/configs.tar.gz" "$DEST"/*
rm -rf "$DEST"/.bashrc "$DEST"/.zshrc "$DEST"/.config

echo "Backup stored at $DEST/configs.tar.gz"
