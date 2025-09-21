#!/usr/bin/env bash
#
# netdata-setup — install Netdata and start service
#
# Usage:
#   ./netdata-setup
#

set -euo pipefail

echo "installing netdata..."
curl -fsSL https://get.netdata.cloud/kickstart.sh -o /tmp/netdata-kickstart.sh
sh /tmp/netdata-kickstart.sh

echo "netdata installed"
echo "dashboard: http://$(curl -s ifconfig.me):19999"
