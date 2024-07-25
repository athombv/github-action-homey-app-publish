# Homey App Publish

This GitHub Action will publish a Homey app to the Homey App Store.

## Inputs

## personal_access_token

The app's owner Personal Access Token. This can be found at https://tools.developer.homey.app/me.

## Outputs

## url

An URL to the Homey Developer Tools, where the release can be managed.

## Example usage

```name: Publish Homey App

on:
  workflow_dispatch:

jobs:  
    main:
      name: Update App Version
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v3
        
        - name: Publish
          uses: athombv/github-action-homey-app-publish@master
          id: publish
          with:
            personal_access_token: ${{ secrets.HOMEY_PAT }}

        - name: URL
          run: |
            echo "Manage your app at ${{ steps.publish.outputs.url }}." >> $GITHUB_STEP_SUMMARY
```