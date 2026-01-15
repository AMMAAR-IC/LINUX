#!/usr/bin/env bash

set -e

if [[ $EUID -ne 0 ]]; then
  echo "Run as root (use sudo)"
  exit 1
fi

usage() {
  echo "Usage: setup.sh --ide"
  exit 1
}

[[ $# -eq 0 ]] && usage

# Detect distro
if [[ -f /etc/os-release ]]; then
  . /etc/os-release
  DISTRO="$ID"
else
  echo "Cannot detect distro"
  exit 1
fi

case "$1" in
  --ide)
    source "$(dirname "$0")/modules/ide.sh"
    ;;
  --dev)
    source "$(dirname "$0")/modules/dev.sh"
    ;;
  --compilers)
    source "$(dirname "$0")/modules/compilers.sh"
    ;;
  *)
    usage
    ;;
esac
