#!/bin/bash

case "$1" in
  --users)     ./users.sh ;;
  --processes) ./processes.sh ;;
  --files)     ./files.sh ;;
  --network)   ./network.sh ;;
  --report)    ./report.sh ;;
  *)
    echo "Usage:"
    echo "./incident.sh --users | --processes | --files | --network | --report"
    ;;
esac
