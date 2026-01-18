echo "Installing IDEs..."

case "$DISTRO" in
  arch)
    pacman -Sy --noconfirm code
    ;;
  fedora)
    dnf install -y code
    ;;
  ubuntu|debian|kali)
    apt update
    apt install -y code
    ;;
  *)
    echo "Unsupported distro: $DISTRO"
    exit 1
    ;;
esac

echo "IDE installation completed."
