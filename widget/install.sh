#!/usr/bin/env bash

PROJECT_ID=$(jq -r .KPlugin.Id package/metadata.json)

echo "Installing ${PROJECT_ID}"

if kpackagetool6 --type=Plasma/Applet --show "${PROJECT_ID}" > /dev/null 2>&1; then
    kpackagetool6 --type=Plasma/Applet --upgrade package
else
    kpackagetool6 --type=Plasma/Applet --install package
fi &&
echo "Successfully installed ${PROJECT_ID}" ||
echo "Installation failed"
