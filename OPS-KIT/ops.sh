#!/bin/bash

case "$1" in
  --logs)      ./logs.sh ;;
  --services)  ./services.sh ;;
  --security)  ./security.sh ;;
  --monitor)   ./monitor.sh ;;
  --rotate)    ./rotate.sh ;;
  *)
    echo "Usage:"
    echo "./ops.sh --logs | --services | --security | --monitor | --rotate"
    ;;
esac
