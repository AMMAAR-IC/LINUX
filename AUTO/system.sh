#!/bin/sh

. "$HOME/auto/utils.sh"

run sudo pacman -Syu --noconfirm
run sudo pacman -Sc --noconfirm
run journalctl --vacuum-time=7d
