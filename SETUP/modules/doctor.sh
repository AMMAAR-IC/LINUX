echo "Running system diagnostics..."
echo "-----------------------------"

# Internet check
if ping -c 1 archlinux.org &>/dev/null; then
  echo "[OK] Internet connection"
else
  echo "[FAIL] No internet connection"
fi

# Disk space check (need at least 10GB)
FREE_DISK=$(df / | awk 'NR==2 {print $4}')
if (( FREE_DISK > 10485760 )); then
  echo "[OK] Disk space sufficient"
else
  echo "[WARN] Low disk space (<10GB)"
fi

# RAM check
TOTAL_RAM=$(free -m | awk '/Mem:/ {print $2}')
if (( TOTAL_RAM >= 4096 )); then
  echo "[OK] RAM: ${TOTAL_RAM}MB"
else
  echo "[WARN] Low RAM: ${TOTAL_RAM}MB"
fi

# CPU architecture
ARCH=$(uname -m)
echo "[INFO] CPU Architecture: $ARCH"

# Package manager check
case "$DISTRO" in
  arch)
    command -v pacman &>/dev/null && echo "[OK] pacman available"
    ;;
  fedora)
    command -v dnf &>/dev/null && echo "[OK] dnf available"
    ;;
  ubuntu|debian|kali)
    command -v apt &>/dev/null && echo "[OK] apt available"
    ;;
esac

# Broken packages (best effort)
case "$DISTRO" in
  ubuntu|debian|kali)
    dpkg --audit && echo "[OK] No broken packages" || echo "[WARN] Broken packages detected"
    ;;
esac

echo "-----------------------------"
echo "Doctor check completed."
