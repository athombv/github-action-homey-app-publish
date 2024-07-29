#!/bin/sh -l

set -e

cd /github/workspace/

cp $NPM_CONFIG_USERCONFIG .npmrc
docker build --build-arg NODE_AUTH_TOKEN .

npm ci --ignore-scripts
HOMEY_HEADLESS="1" HOMEY_PAT="$1" npx homey app publish

echo "url=https://tools.developer.homey.app/apps/app/$(cat app.json | jq --raw-output .id)" >> $GITHUB_OUTPUT
