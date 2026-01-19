#!/bin/bash

echo "Running services:"
systemctl list-units --type=service --state=running | head -n 10

echo
read -p "Restart a service? (name or blank): " svc

[ -n "$svc" ] && sudo systemctl restart "$svc" && echo "$svc restarted"
