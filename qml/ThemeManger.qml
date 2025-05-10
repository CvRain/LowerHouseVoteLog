pragma Singleton

import QtQuick

QtObject {
    readonly property var themes: [{
            "name": "latte",
            "background": {
                "backgroundPane": "red",
                "secondaryPane0": "1",
                "secondaryPane1": "1",
                "surfaceElement0": "1",
                "surfaceElement1": "1",
                "surfaceElement2": "1",
                "overlays": "1"
            },
            "typography": {
                "bodyCopy": "",
                "mainHeadline": "",
                "labels": "",
                "subtle": "",
                "link": "",
                "success": "",
                "warning": "",
                "error": "",
                "tags": "",
                "selectionBackground": "",
                "cursor": ""
            },
            "terminal": {
                "cursor": "",
                "cursorText": "",
                "activeBorder": "",
                "inactiveBorder": "",
                "bellBorder": "",
                "color0": "",
                "color1": "",
                "color2": "",
                "color3": "",
                "color4": "",
                "color5": "",
                "color6": "",
                "color7": "",
                "color8": "",
                "color9": "",
                "color10": "",
                "color11": "",
                "color12": "",
                "color13": "",
                "color14": "",
                "color15": "",
                "color16": "",
                "color17": ""
            }
        }, {
            "name": "frappe",
            "background": {
                "backgroundPane": "red",
                "secondaryPane0": "1",
                "secondaryPane1": "1",
                "surfaceElement0": "1",
                "surfaceElement1": "1",
                "surfaceElement2": "1",
                "overlays": "1"
            },
            "typography": {
                "bodyCopy": "",
                "mainHeadline": "",
                "labels": "",
                "subtle": "",
                "link": "",
                "success": "",
                "warning": "",
                "error": "",
                "tags": "",
                "selectionBackground": "",
                "cursor": ""
            },
            "terminal": {
                "cursor": "",
                "cursorText": "",
                "activeBorder": "",
                "inactiveBorder": "",
                "bellBorder": "",
                "color0": "",
                "color1": "",
                "color2": "",
                "color3": "",
                "color4": "",
                "color5": "",
                "color6": "",
                "color7": "",
                "color8": "",
                "color9": "",
                "color10": "",
                "color11": "",
                "color12": "",
                "color13": "",
                "color14": "",
                "color15": "",
                "color16": "",
                "color17": ""
            }
        }, {
            "name": "macchiato",
            "background": {
                "backgroundPane": "red",
                "secondaryPane0": "1",
                "secondaryPane1": "1",
                "surfaceElement0": "1",
                "surfaceElement1": "1",
                "surfaceElement2": "1",
                "overlays": "1"
            },
            "typography": {
                "bodyCopy": "",
                "mainHeadline": "",
                "labels": "",
                "subtle": "",
                "link": "",
                "success": "",
                "warning": "",
                "error": "",
                "tags": "",
                "selectionBackground": "",
                "cursor": ""
            },
            "terminal": {
                "cursor": "",
                "cursorText": "",
                "activeBorder": "",
                "inactiveBorder": "",
                "bellBorder": "",
                "color0": "",
                "color1": "",
                "color2": "",
                "color3": "",
                "color4": "",
                "color5": "",
                "color6": "",
                "color7": "",
                "color8": "",
                "color9": "",
                "color10": "",
                "color11": "",
                "color12": "",
                "color13": "",
                "color14": "",
                "color15": "",
                "color16": "",
                "color17": ""
            }
        }, {
            "name": "mocha",
            "background": {
                "backgroundPane": "red",
                "secondaryPane0": "1",
                "secondaryPane1": "1",
                "surfaceElement0": "1",
                "surfaceElement1": "1",
                "surfaceElement2": "1",
                "overlays": "1"
            },
            "typography": {
                "bodyCopy": "",
                "mainHeadline": "",
                "labels": "",
                "subtle": "",
                "link": "",
                "success": "",
                "warning": "",
                "error": "",
                "tags": "",
                "selectionBackground": "",
                "cursor": ""
            },
            "terminal": {
                "cursor": "",
                "cursorText": "",
                "activeBorder": "",
                "inactiveBorder": "",
                "bellBorder": "",
                "color0": "",
                "color1": "",
                "color2": "",
                "color3": "",
                "color4": "",
                "color5": "",
                "color6": "",
                "color7": "",
                "color8": "",
                "color9": "",
                "color10": "",
                "color11": "",
                "color12": "",
                "color13": "",
                "color14": "",
                "color15": "",
                "color16": "",
                "color17": ""
            }
        }]

    property int currentThemeIndex: 0

    readonly property var currentTheme: themes[currentThemeIndex]
}
