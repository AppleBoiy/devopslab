#!/usr/bin/env bash
#
# netdata-test — generate system load for dashboard testing
#
# Usage:
#   ./netdata-test
#

set -euo pipefail

echo "generating cpu load (60s)..."
timeout 60s bash -c "while :; do :; done" &

echo "generating disk load..."
dd if=/dev/zero of=/tmp/netdata_test bs=1M count=500 oflag=direct status=none

echo "test complete — check the netdata dashboard"
