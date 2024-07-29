#!/bin/sh -l

set -e

cd /github/workspace/

echo "//npm.pkg.github.com/:_authToken=$NODE_AUTH_TOKEN" > ~/.npmrc
echo "@olivierzal:registry=https://npm.pkg.github.com/" >> ~/.npmrc

npm ci --ignore-scripts
HOMEY_HEADLESS="1" HOMEY_PAT="$1" npx homey app publish

echo "url=https://tools.developer.homey.app/apps/app/$(cat app.json | jq --raw-output .id)" >> $GITHUB_OUTPUT
