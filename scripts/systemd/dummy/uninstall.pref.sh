#!/usr/bin/env bash
#
# dummy-uninstall — remove dummy systemd service
#
# Usage:
#   ./dummy-uninstall
#

set -euo pipefail

echo "stopping dummy..."
sudo systemctl stop dummy || true

echo "disabling dummy..."
sudo systemctl disable dummy || true

echo "removing service file..."
sudo rm -f /etc/systemd/system/dummy.service

echo "reloading systemd..."
sudo systemctl daemon-reload

echo "dummy service uninstalled"
