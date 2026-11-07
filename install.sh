#!/usr/bin/env bash

PACKAGE_NAME=$(jq -r .KPlugin.Id package/metadata.json)

echo "Installing ${PACKAGE_NAME}"

cd widget
./install.sh
cd ..

if kpackagetool6 --type=KWin/Script --show "${PACKAGE_NAME}" > /dev/null 2>&1; then
    kpackagetool6 --type=KWin/Script --upgrade package
else
    kpackagetool6 --type=KWin/Script --install package
fi &&
echo "Successfully installed ${PACKAGE_NAME}" ||
echo "Installation failed"
