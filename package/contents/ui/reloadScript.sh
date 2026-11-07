#!/usr/bin/env bash

SCRIPT_NAME="${1:-exquisite}"

qdbus6 org.kde.KWin /Scripting org.kde.kwin.Scripting.unloadScript "${SCRIPT_NAME}"

for _ in {1..20}; do
    [ "$(qdbus6 org.kde.KWin /Scripting org.kde.kwin.Scripting.isScriptLoaded "${SCRIPT_NAME}")" == "false" ] && break
    sleep 0.1
done

qdbus6 org.kde.KWin /Scripting org.kde.kwin.Scripting.start
