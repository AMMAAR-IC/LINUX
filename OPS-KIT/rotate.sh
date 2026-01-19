#!/bin/bash

DEST="$HOME/log-archive"
mkdir -p "$DEST"

sudo find /var/log -type f -name "*.log" -size +1M -exec cp {} "$DEST" \;

tar -czf "$DEST/logs-$(date +%F).tar.gz" "$DEST"/*
rm -f "$DEST"/*.log

echo "Logs archived."
