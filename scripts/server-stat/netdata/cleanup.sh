#!/usr/bin/env bash
#
# netdata-cleanup — remove Netdata and test artifacts
#
# Usage:
#   ./netdata-cleanup
#

set -euo pipefail

echo "stopping netdata..."
sudo systemctl stop netdata || true

echo "removing netdata..."
if command -v apt-get >/dev/null; then
    sudo apt-get remove --purge -y netdata
elif command -v yum >/dev/null; then
    sudo yum remove -y netdata
else
    echo "no supported package manager found" >&2
fi

echo "cleaning test files..."
rm -f /tmp/netdata_test

echo "cleanup complete."
