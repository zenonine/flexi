#!/bin/bash

# This script creates/updates credentials.json file which is used
# to authorize publisher when publishing packages to pub.dev

# Checking whether the secrets are available as environment
# variables or not.
if [ -z "${PUB_CACHE}" ]; then
  echo "Missing PUB_CACHE environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_PUBLISH_ACCESS_TOKEN}" ]; then
  echo "Missing PUB_DEV_PUBLISH_ACCESS_TOKEN environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_PUBLISH_REFRESH_TOKEN}" ]; then
  echo "Missing PUB_DEV_PUBLISH_REFRESH_TOKEN environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_PUBLISH_ID_TOKEN}" ]; then
  echo "Missing PUB_DEV_PUBLISH_ID_TOKEN environment variable"
  exit 1
fi

if [ -z "${PUB_DEV_PUBLISH_EXPIRATION}" ]; then
  echo "Missing PUB_DEV_PUBLISH_EXPIRATION environment variable"
  exit 1
fi

echo "${PUB_CACHE}"
echo "${PUB_CACHE}/credentials.json"

# Create credentials.json file.
cat <<EOF > "${PUB_CACHE}/credentials.json"
{
  "accessToken": "${PUB_DEV_PUBLISH_ACCESS_TOKEN}",
  "refreshToken": "${PUB_DEV_PUBLISH_REFRESH_TOKEN}",
  "idToken": "${PUB_DEV_PUBLISH_ID_TOKEN}",
  "tokenEndpoint": "https://accounts.google.com/o/oauth2/token",
  "scopes": [
    "openid",
    "https://www.googleapis.com/auth/userinfo.email"
  ],
  "expiration": ${PUB_DEV_PUBLISH_EXPIRATION}
}
EOF

ls -la "${PUB_CACHE}"