#!/bin/bash

# This script creates/updates credentials.json file which is used
# to authorize publisher when publishing packages to pub.dev

# Checking whether the secrets are available as environment
# variables or not.
if [ -z "${PUB_DEV_CREDENTIALS}" ]; then
  echo "Missing PUB_DEV_CREDENTIALS environment variable"
  exit 1
fi

mkdir ~/.pub-cache

echo '1634479524118'
echo 'PUB_DEV_CREDENTIALS 1634479524118'

# Create credentials.json file.
cat <<EOF > ~/.pub-cache/credentials.json
${PUB_DEV_CREDENTIALS}
EOF

echo '1634479524118'
echo 'PUB_DEV_CREDENTIALS 1634479524118'
