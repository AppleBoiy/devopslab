#!/usr/bin/env bash
#
# s3-make-bucket — quick helper to create an S3 bucket
#
# Usage:
#   ./s3-make-bucket <bucket-name>
#

set -euo pipefail

BUCKET=${1:-}

if [[ -z "$BUCKET" ]]; then
    echo "Usage: $0 <bucket-name>" >&2
    exit 1
fi

echo "Creating bucket: $BUCKET"
aws s3 mb "s3://$BUCKET"

echo "Bucket '$BUCKET' created."
