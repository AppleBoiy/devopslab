#!/bin/bash
# Remove Netdata and cleanup files

set -e

echo "[INFO] Stopping Netdata..."
sudo systemctl stop netdata

echo "[INFO] Removing Netdata..."
sudo apt-get remove --purge -y netdata

echo "[INFO] Cleaning test files..."
rm -f /tmp/netdata_test

echo "[INFO] Cleanup complete."
