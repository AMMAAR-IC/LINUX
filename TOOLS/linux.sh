#!/usr/bin/env bash

case "$1" in
  --explain)
    shift
    source "$(dirname "$0")/modules/explain.sh" "$*"
    ;;
  *)
    echo "Usage:"
    echo "  linux.sh --explain \"command\""
    ;;
esac
