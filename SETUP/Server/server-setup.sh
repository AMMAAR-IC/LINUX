#!/bin/bash

set -e

echo "==> Updating system"
pacman -Syu --noconfirm

echo "==> Installing core packages"
pacman -S --noconfirm \
git \
base-devel \
linux-headers \
openssh \
curl \
wget \
iproute2 \
tmux \
vim \
bash-completion \
htop \
iotop \
lsof \
rsync \
cronie \
ufw \
fail2ban

echo "==> Enabling services"
systemctl enable --now sshd
systemctl enable --now cronie
systemctl enable --now ufw

echo "==> Firewall basic rules"
ufw allow ssh
ufw --force enable

echo "==> Done. Server basics installed."
