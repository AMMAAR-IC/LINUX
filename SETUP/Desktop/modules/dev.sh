echo "Installing developer tools..."

case "$DISTRO" in
  arch)
    pacman -Sy --noconfirm \
      git \
      curl \
      wget \
      python \
      python-pip \
      nodejs \
      npm \
      docker
    systemctl enable --now docker
    ;;
  
  fedora)
    dnf install -y \
      git \
      curl \
      wget \
      python3 \
      python3-pip \
      nodejs \
      npm \
      docker
    systemctl enable --now docker
    ;;
  
  ubuntu|debian|kali)
    apt update
    apt install -y \
      git \
      curl \
      wget \
      python3 \
      python3-pip \
      nodejs \
      npm \
      docker.io
    systemctl enable --now docker
    ;;
  
  *)
    echo "Unsupported distro: $DISTRO"
    exit 1
    ;;
esac

echo "Developer tools installation completed."
