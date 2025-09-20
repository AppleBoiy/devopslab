#!/bin/bash
# Install Netdata and start service

set -e

echo "[INFO] Installing Netdata..."
curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh

echo "[INFO] Netdata installed. Access at http://$(curl -s ifconfig.me):19999"
