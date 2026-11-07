/*
    SPDX-FileCopyrightText: 2022 author-name
    SPDX-License-Identifier: GPL-3.0-or-later
*/

import QtQuick

import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid
import org.kde.plasma.plasma5support as Plasma5Support
import org.kde.kirigami as Kirigami

PlasmoidItem {
    id: root

    preferredRepresentation: compactRepresentation
    Plasmoid.backgroundHints: PlasmaCore.Types.ConfigurableBackground

    compactRepresentation: Item {
        MouseArea {
            anchors.fill: parent
            onClicked: command.exec()
        }

        Kirigami.Icon {
            anchors.fill: parent
            source: Plasmoid.configuration.icon
        }
    }

    Plasma5Support.DataSource {
        id: command
        engine: "executable"
        connectedSources: []
        onNewData: {
            disconnectSource(sourceName);
        }
        function exec() {
            connectSource('qdbus6 org.kde.kglobalaccel /component/kwin invokeShortcut "Exquisite"');
        }
    }
}
