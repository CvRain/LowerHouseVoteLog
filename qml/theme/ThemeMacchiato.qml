pragma Singleton

import QtQuick

QtObject {
    id: root
    readonly property color rosewater: "#f4dbd6"
    readonly property color flamingo: "#f0c6c6"
    readonly property color pink: "#f5bde6"
    readonly property color mauve: "#c6a0f6"
    readonly property color red: "#ed8796"
    readonly property color maroon: "#ee99a0"
    readonly property color peach: "#f5a97f"
    readonly property color yellow: "#eed49f"
    readonly property color green: "#a6da95"
    readonly property color teal: "#8bd5ca"
    readonly property color sky: "#91d7e3"
    readonly property color sapphire: "#7dc4e4"
    readonly property color blue: "#8aadf4"
    readonly property color lavender: "#b7bdf8"
    readonly property color text: "#cad3f5"
    readonly property color subtext1: "#b8c0e0"
    readonly property color subtext0: "#a5adcb"
    readonly property color overlay2: "#939ab7"
    readonly property color overlay1: "#8087a2"
    readonly property color overlay0: "#6e738d"
    readonly property color surface2: "#5b6078"
    readonly property color surface1: "#494d64"
    readonly property color surface0: "#363a4f"
    readonly property color base: "#24273a"
    readonly property color mantle: "#1e2030"
    readonly property color crust: "#181926"

    readonly property var theme: {
        "name": "macchiato",
        "background": {
            "backgroundPane": root.base,
            "secondaryPane0": root.crust,
            "secondaryPane1": root.mantle,
            "surfaceElement0": root.surface0,
            "surfaceElement1": root.surface1,
            "surfaceElement2": root.surface2,
            "overlay0": root.overlay0,
            "overlay1": root.overlay1,
            "overlay2": root.overlay2
        },
        "typography": {
            "bodyCopy": root.text,
            "mainHeadline": root.text,
            "label0": root.subtext0,
            "label1": root.subtext1,
            "subtle": root.overlay1,
            "link": root.blue,
            "success": root.green,
            "warning": root.yellow,
            "error": root.red,
            "tags": root.blue,
            "selectionBackground": Qt.rgba(root.overlay2, 0.2),
            "cursor": root.rosewater
        },
        "terminal": {
            "cursor": root.rosewater,
            "cursorText": root.base,
            "activeBorder": root.lavender,
            "inactiveBorder": root.overlay0,
            "bellBorder": root.yellow,
            "color0": root.subtext1,
            "color1": root.red,
            "color2": root.green,
            "color3": root.yellow,
            "color4": root.blue,
            "color5": root.pink,
            "color6": root.teal,
            "color7": root.surface2,
            "color8": root.subtext0,
            "color9": Qt.lighter(root.red),
            "color10": Qt.lighter(root.green),
            "color11": Qt.lighter(root.yellow),
            "color12": Qt.lighter(root.blue),
            "color13": Qt.lighter(root.pink),
            "color14": Qt.lighter(root.teal),
            "color15": root.surface1,
            "color16": root.peach,
            "color17": root.rosewater
        }
    }
}
