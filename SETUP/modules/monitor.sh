while true; do
  clear
  echo "System Monitor (Ctrl+C to exit)"
  echo "-------------------------------"
  echo "Uptime: $(uptime -p)"
  echo
  echo "CPU Load:"
  uptime
  echo
  echo "Memory:"
  free -h
  echo
  echo "Disk:"
  df -h /
  sleep 2
done
