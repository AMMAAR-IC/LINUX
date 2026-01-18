#!/bin/bash

case "$1" in
  --status)  ./status.sh ;;
  --cleanup) ./cleanup.sh ;;
  --backup)  ./backup.sh ;;
  --network) ./network.sh ;;
  --update)  ./update.sh ;;
  *)
    echo "Usage:"
    echo "./sysctl.sh --status | --cleanup | --backup | --network | --update"
    ;;
esac
