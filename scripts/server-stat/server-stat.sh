#!/usr/bin/env bash
#
# sys-report — quick system resource usage summary
#
# Usage:
#   ./sys-report
#

set -euo pipefail

echo "===== system resource usage report ====="

# --- cpu usage ---
echo
echo ">> cpu usage:"
if command -v mpstat &>/dev/null; then
    mpstat 1 1 | awk '/Average/ && $12 ~ /[0-9.]+/ {print 100 - $12 "%"}'
else
    top -bn1 | awk -F',' '/Cpu\(s\)/ {gsub(" ", "", $4); print 100 - $4 "%"}'
fi

# --- memory usage ---
echo
echo ">> memory usage:"
free -m | awk 'NR==2{
    used=$3; free=$4; total=$2;
    perc=used*100/total;
    printf "used: %d MB | free: %d MB | total: %d MB | usage: %.2f%%\n", used, free, total, perc
}'

# --- disk usage ---
echo
echo ">> disk usage (/):"
df -h / | awk 'NR==2{
    printf "used: %s | free: %s | total: %s | usage: %s\n", $3, $4, $2, $5
}'

# --- top processes by cpu ---
echo
echo ">> top 5 processes (cpu):"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

# --- top processes by memory ---
echo
echo ">> top 5 processes (memory):"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6

echo
echo "===== end of report ====="
