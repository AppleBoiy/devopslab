#!/usr/bin/env bash
#
# dummy-install — install and start dummy systemd service
#
# Usage:
#   ./dummy-install
#

set -euo pipefail

echo "copying service file..."
sudo cp dummy.service /etc/systemd/system/

echo "reloading systemd..."
sudo systemctl daemon-reload

echo "enabling service..."
sudo systemctl enable dummy

echo "starting service..."
sudo systemctl start dummy

echo "dummy service installed and started"
