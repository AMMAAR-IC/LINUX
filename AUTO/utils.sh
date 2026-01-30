#!/bin/sh

log() {
  echo "[`date '+%H:%M:%S'`] $1" >> "$LOG"
}

run() {
  log "RUN: $*"
  "$@"
}
