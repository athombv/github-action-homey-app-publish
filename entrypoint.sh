#!/bin/sh -l

set -eo pipefail

cd /github/workspace/

npm ci --ignore-scripts
HOMEY_HEADLESS="1" HOMEY_PAT="$1" npx homey app publish 2>&1 | tee /tmp/homey-app-publish.log

echo "url=https://tools.developer.homey.app/apps/app/$(cat app.json | jq --raw-output .id)" >> $GITHUB_OUTPUT

# The last line the Homey CLI prints names the page of the build it has just uploaded.
BUILD_URL="$(grep -oE 'https://tools\.developer\.homey\.app/apps/app/[^/[:space:]]+/build/[0-9]+' /tmp/homey-app-publish.log | tail -n 1 || true)"
echo "build_url=${BUILD_URL}" >> $GITHUB_OUTPUT
