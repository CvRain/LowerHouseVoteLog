pragma Singleton

import QtQuick

QtObject {
    readonly property var themes: [ThemeLatte.theme, ThemeFrappe.theme, ThemeMacchiato.theme, ThemeMocha.theme]

    property int currentThemeIndex: 0

    readonly property var currentTheme: themes[currentThemeIndex]
}
