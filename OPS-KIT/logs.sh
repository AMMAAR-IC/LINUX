#!/bin/bash

LOGDIR="/var/log"
echo "Recent critical logs:"
sudo grep -R "error\|fail\|critical" $LOGDIR 2>/dev/null | head -n 10

echo
echo "Triggering log rotation..."
./rotate.sh
