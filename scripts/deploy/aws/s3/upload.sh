#!/usr/bin/env bash
#
# s3-sync — quick & dirty uploader to S3
#
# Usage:
#   ./s3-sync <local-directory> <bucket-name>
#

set -euo pipefail

LOCALDIR=${1:-}
BUCKET=${2:-}

if [[ -z "$LOCALDIR" || -z "$BUCKET" ]]; then
    echo "Usage: $0 <local-directory> <bucket-name>" >&2
    exit 1
fi

[[ -d "$LOCALDIR" ]] || {
    echo "Error: local directory not found: $LOCALDIR" >&2
    exit 1
}

echo "Syncing $LOCALDIR -> s3://$BUCKET ..."

aws s3 sync "$LOCALDIR" "s3://$BUCKET" \
  --acl public-read \
  --exclude ".git/*" \
  --exclude ".gitignore" \
  --exclude "README.md" \
  --exclude ".github/*"

echo "Done."
