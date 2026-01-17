#!/bin/bash

set -e

echo "======================================"
echo " EliteBook Performance DISABLE Script"
echo " Restore default Linux behavior"
echo "======================================"

if [[ $EUID -ne 0 ]]; then
  echo "❌ Run as root: sudo ./elitebook-disable-performance.sh"
  exit 1
fi

echo "[1/8] Resetting CPU governor to powersave..."
if command -v cpupower &>/dev/null; then
  cpupower frequency-set -g powersave || true
fi

echo "[2/8] Disabling cpupower service..."
systemctl disable --now cpupower 2>/dev/null || true

echo "[3/8] Disabling thermald..."
systemctl disable --now thermald 2>/dev/null || true

echo "[4/8] Removing Energy Performance Bias service..."
systemctl disable epb.service 2>/dev/null || true
rm -f /etc/systemd/system/epb.service
systemctl daemon-reload

echo "[5/8] Restoring NVMe I/O scheduler rules..."
rm -f /etc/udev/rules.d/60-iosched.rules

for disk in /sys/block/nvme*/queue/scheduler; do
  echo mq-deadline > "$disk" 2>/dev/null || true
done

echo "[6/8] Restoring swappiness to default..."
rm -f /etc/sysctl.d/99-swappiness.conf
sysctl -w vm.swappiness=60

echo "[7/8] Restoring Intel GPU defaults..."
GRUB_FILE="/etc/default/grub"

sed -i 's/i915.enable_psr=0//g' "$GRUB_FILE"
sed -i 's/i915.enable_dc=0//g' "$GRUB_FILE"

sed -i 's/  */ /g' "$GRUB_FILE"

grub-mkconfig -o /boot/grub/grub.cfg

echo "[8/8] Done."

echo "======================================"
echo " ✅ Performance tweaks DISABLED"
echo " 🔁 REBOOT REQUIRED"
echo "======================================"
