echo "Running security checks..."
echo "-------------------------"

# Firewall
if systemctl is-active --quiet ufw || systemctl is-active --quiet firewalld; then
  echo "[OK] Firewall active"
else
  echo "[WARN] Firewall not active"
fi

# SSH root login
if grep -q "^PermitRootLogin no" /etc/ssh/sshd_config 2>/dev/null; then
  echo "[OK] Root SSH login disabled"
else
  echo "[WARN] Root SSH login may be enabled"
fi

# World-writable files
WW_FILES=$(find / -xdev -type f -perm -0002 2>/dev/null | head -n 5)
if [[ -z "$WW_FILES" ]]; then
  echo "[OK] No world-writable files found"
else
  echo "[WARN] World-writable files detected:"
  echo "$WW_FILES"
fi

echo "Security check completed."
