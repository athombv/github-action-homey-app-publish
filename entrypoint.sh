#!/bin/sh -l

cd /github/workspace/

npm ci --ignore-scripts
HOMEY_HEADLESS="1" HOMEY_HOMEY_PAT="$1" npx homey app publish

echo "url=https://tools.developer.homey.app/apps/app/$(cat app.json | jq --raw-output .id)" >> $GITHUB_OUTPUT