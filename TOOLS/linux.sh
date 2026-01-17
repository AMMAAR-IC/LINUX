#!/usr/bin/env bash

case "$1" in
  --explain)
    shift
    source "$(dirname "$0")/modules/explain.sh" "$*"
    ;;
  --cheatsheet)
    shift
    source "$(dirname "$0")/modules/cheatsheet.sh" "$1"
    ;;
  *)
    echo "Usage:"
    echo "  linux.sh --explain \"command\""
    echo "  linux.sh --cheatsheet [category]"
    ;;
esac
