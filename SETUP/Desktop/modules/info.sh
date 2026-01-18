echo "System Information"
echo "------------------"

echo "Hostname      : $(hostname)"
echo "User          : $(whoami)"
echo "OS            : $(. /etc/os-release && echo $PRETTY_NAME)"
echo "Kernel        : $(uname -r)"
echo "Uptime        : $(uptime -p)"
echo "Architecture  : $(uname -m)"

echo
echo "CPU:"
lscpu | grep -E 'Model name|Socket|Thread|Core|CPU\(s\)'

echo
echo "Memory:"
free -h

echo
echo "Disk:"
lsblk
