#!/bin/sh -l

set -e

cd /github/workspace/

npm ci --ignore-scripts

# When the app does not depend on the Homey CLI, `npx` installs it on demand.
# Done here with `--ignore-scripts`, that install runs no install script:
# the next command finds the CLI installed.
npx --ignore-scripts homey --version

HOMEY_HEADLESS="1" HOMEY_PAT="$1" npx homey app publish

echo "url=https://tools.developer.homey.app/apps/app/$(cat app.json | jq --raw-output .id)" >> $GITHUB_OUTPUT