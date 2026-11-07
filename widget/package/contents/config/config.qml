/*
    SPDX-FileCopyrightText: 2022 author-name
    SPDX-License-Identifier: GPL-3.0-or-later
*/

import QtQuick
import QtQml

import org.kde.plasma.configuration

ConfigModel {
    id: configModel

    ConfigCategory {
         name: i18n("General")
         icon: "preferences"
         source: "config/configGeneral.qml"
    }
}
