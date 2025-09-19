#! /bin/bash

aws s3 sync <local-directory> s3://<bucket-name> \
  --acl public-read \
  --exclude ".git/*" \
  --exclude ".gitignore" \
  --exclude "README.md" \
  --exclude ".github/*"