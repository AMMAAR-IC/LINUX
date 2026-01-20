#!/bin/bash

echo "Last logins:"
last -a | head -n 10

echo
echo "Currently logged-in users:"
who

echo
echo "Users with shell access:"
awk -F: '$7 !~ /nologin/ {print $1 ":" $7}' /etc/passwd
