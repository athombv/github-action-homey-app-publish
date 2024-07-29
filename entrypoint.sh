#!/bin/sh -l

set -e

cd /github/workspace/

docker build --build-arg NODE_AUTH_TOKEN .

npm ci --ignore-scripts
HOMEY_HEADLESS="1" HOMEY_PAT="$1" npx homey app publish

echo "url=https://tools.developer.homey.app/apps/app/$(cat app.json | jq --raw-output .id)" >> $GITHUB_OUTPUT
