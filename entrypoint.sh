#!/bin/sh -l

set -e

cd /github/workspace/

if [ -f "/home/runner/work/_temp/.npmrc" ]; then
    echo "Contenu du fichier .npmrc:"
    cat /home/runner/work/_temp/.npmrc
else
    echo "Le fichier .npmrc n'existe pas dans le répertoire spécifié."
fi

npm ci --ignore-scripts
HOMEY_HEADLESS="1" HOMEY_PAT="$1" npx homey app publish

echo "url=https://tools.developer.homey.app/apps/app/$(cat app.json | jq --raw-output .id)" >> $GITHUB_OUTPUT
