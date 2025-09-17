#!/bin/bash

echo "===== System Resource Usage Report ====="
echo

# --- CPU Usage ---
echo ">> Total CPU Usage:"
# mpstat is in sysstat package, fallback to top if missing
if command -v mpstat &>/dev/null; then
    mpstat 1 1 | awk '/Average/ && $12 ~ /[0-9.]+/ {print 100 - $12 "%"}'
else
    top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}'
fi
echo

# --- Memory Usage ---
echo ">> Memory Usage:"
free -m | awk 'NR==2{
    used=$3; free=$4; total=$2;
    perc=used*100/total;
    printf "Used: %d MB | Free: %d MB | Total: %d MB | Usage: %.2f%%\n", used, free, total, perc
}'
echo

# --- Disk Usage ---
echo ">> Disk Usage (root /):"
df -h / | awk 'NR==2{
    printf "Used: %s | Free: %s | Total: %s | Usage: %s\n", $3, $4, $2, $5
}'
echo

# --- Top 5 processes by CPU ---
echo ">> Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo

# --- Top 5 processes by Memory ---
echo ">> Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
echo

echo "===== End of Report ====="

