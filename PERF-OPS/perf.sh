#!/bin/bash

case "$1" in
  --cpu)      ./cpu.sh ;;
  --memory)   ./memory.sh ;;
  --disk)     ./disk.sh ;;
  --battery)  ./battery.sh ;;
  --snapshot) ./snapshot.sh ;;
  *)
    echo "Usage:"
    echo "./perf.sh --cpu | --memory | --disk | --battery | --snapshot"
    ;;
esac
