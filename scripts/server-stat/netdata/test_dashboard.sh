#!/bin/bash
# Generate system load to test dashboard

echo "[INFO] Generating CPU load for 60 seconds..."
timeout 60s bash -c "while :; do :; done" &

echo "[INFO] Generating disk load..."
dd if=/dev/zero of=/tmp/netdata_test bs=1M count=500 oflag=direct 2>/dev/null

echo "[INFO] Test complete. Visit dashboard to check charts and alerts."
