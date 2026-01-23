#!/bin/bash

OUT="perf-snapshot-$(date +%F_%H-%M).txt"

{
  echo "=== CPU ==="
  ./cpu.sh
  echo
  echo "=== MEMORY ==="
  ./memory.sh
  echo
  echo "=== DISK ==="
  ./disk.sh
  echo
  echo "=== BATTERY ==="
  ./battery.sh
} > "$OUT"

echo "Performance snapshot saved to $OUT"
