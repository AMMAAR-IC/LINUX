echo "Installing compilers and build tools..."

case "$DISTRO" in
  arch)
    pacman -Sy --noconfirm \
      base-devel \
      gcc \
      clang \
      cmake \
      make \
      gdb \
      jdk-openjdk
    ;;
  
  fedora)
    dnf groupinstall -y "Development Tools"
    dnf install -y \
      clang \
      cmake \
      gdb \
      java-latest-openjdk-devel
    ;;
  
  ubuntu|debian|kali)
    apt update
    apt install -y \
      build-essential \
      gcc \
      g++ \
      clang \
      cmake \
      make \
      gdb \
      default-jdk
    ;;
  
  *)
    echo "Unsupported distro: $DISTRO"
    exit 1
    ;;
esac

echo "Compiler toolchain installation completed."
