#!/bin/bash

set -e

echo "======================================"
echo " EliteBook Performance Tuning Script"
echo " Arch Linux | Intel | EliteBook"
echo "======================================"

if [[ $EUID -ne 0 ]]; then
  echo "❌ Run as root: sudo ./elitebook-performance.sh"
  exit 1
fi

echo "[1/9] Installing required packages..."
pacman -Sy --noconfirm cpupower thermald lm_sensors

echo "[2/9] Enabling CPU performance governor..."
systemctl enable --now cpupower
cpupower frequency-set -g performance

echo "[3/9] Enabling thermald..."
systemctl enable --now thermald

echo "[4/9] Setting Energy Performance Bias..."
for cpu in /sys/devices/system/cpu/cpu*/power/energy_perf_bias; do
  echo 6 > "$cpu"
done

cat <<EOF > /etc/systemd/system/epb.service
[Unit]
Description=Set Energy Performance Bias

[Service]
Type=oneshot
ExecStart=/bin/bash -c 'echo 6 > /sys/devices/system/cpu/cpu*/power/energy_perf_bias'

[Install]
WantedBy=multi-user.target
EOF

systemctl enable epb.service

echo "[5/9] Setting NVMe I/O scheduler..."
for disk in /sys/block/nvme*/queue/scheduler; do
  echo none > "$disk"
done

cat <<EOF > /etc/udev/rules.d/60-iosched.rules
ACTION=="add|change", KERNEL=="nvme*", ATTR{queue/scheduler}="none"
EOF

echo "[6/9] Reducing swappiness..."
echo "vm.swappiness=10" > /etc/sysctl.d/99-swappiness.conf
sysctl -p /etc/sysctl.d/99-swappiness.conf

echo "[7/9] Removing TLP if present..."
systemctl disable tlp --now 2>/dev/null || true
pacman -Rns --noconfirm tlp 2>/dev/null || true

echo "[8/9] Fixing Intel GPU stutter..."
GRUB_FILE="/etc/default/grub"

if grep -q "i915.enable_psr" "$GRUB_FILE"; then
  echo "Intel GPU params already set."
else
  sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="/GRUB_CMDLINE_LINUX_DEFAULT="i915.enable_psr=0 i915.enable_dc=0 /' "$GRUB_FILE"
  grub-mkconfig -o /boot/grub/grub.cfg
fi

echo "[9/9] Done."

echo "======================================"
echo " ✅ Performance tuning complete"
echo " 🔁 REBOOT REQUIRED"
echo "======================================"
