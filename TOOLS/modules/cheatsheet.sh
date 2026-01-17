CATEGORY="$1"

print_files() {
  cat <<EOF
FILES & DIRECTORIES
-------------------
ls        → list files
pwd       → current directory
cd        → change directory
cp        → copy files
mv        → move/rename files
rm        → remove files
mkdir     → create directory
du -sh    → directory size
df -h     → disk usage
EOF
}

print_network() {
  cat <<EOF
NETWORKING
----------
ip a      → show interfaces
ip r      → routing table
ping      → test connectivity
ss -tuln  → open ports
curl      → http requests
wget      → download files
EOF
}

print_process() {
  cat <<EOF
PROCESSES
---------
ps aux    → process list
top       → live process view
htop     → enhanced top
kill      → terminate process
nice     → priority
EOF
}

print_system() {
  cat <<EOF
SYSTEM
------
uname -a  → kernel info
uptime    → system runtime
free -h   → memory usage
lsblk     → disks
mount     → mounted fs
EOF
}

print_git() {
  cat <<EOF
GIT
---
git clone → copy repo
git status→ repo state
git add   → stage files
git commit→ commit changes
git push  → upload changes
EOF
}

print_commit() {
  cat <<EOF
GIT COMMIT
---
git add .
git commit -m "about"
git push origin main
EOF
}

case "$CATEGORY" in
  files) print_files ;;
  network) print_network ;;
  process) print_process ;;
  system) print_system ;;
  git) print_git ;;
  git-commit) print_commit ;;
  "" )
    echo "Available cheat sheets:"
    echo "  files"
    echo "  network"
    echo "  process"
    echo "  system"
    echo "  git"
    ;;
  *)
    echo "Unknown category: $CATEGORY"
    echo "Run without arguments to see available categories."
    ;;
esac
