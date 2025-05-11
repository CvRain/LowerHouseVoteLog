pragma Singleton

import QtQuick

QtObject {
    id: root
    readonly property color rosewater: "#f5e0dc"
    readonly property color flamingo: "#f2cdcd"
    readonly property color pink: "#f5c2e7"
    readonly property color mauve: "#cba6f7"
    readonly property color red: "#f38ba8"
    readonly property color maroon: "#eba0ac"
    readonly property color peach: "#fab387"
    readonly property color yellow: "#f9e2af"
    readonly property color green: "#a6e3a1"
    readonly property color teal: "#94e2d5"
    readonly property color sky: "#89dceb"
    readonly property color sapphire: "#74c7ec"
    readonly property color blue: "#89b4fa"
    readonly property color lavender: "#b4befe"
    readonly property color text: "#cdd6f4"
    readonly property color subtext1: "#bac2de"
    readonly property color subtext0: "#a6adc8"
    readonly property color overlay2: "#9399b2"
    readonly property color overlay1: "#7f849c"
    readonly property color overlay0: "#6c7086"
    readonly property color surface2: "#585b70"
    readonly property color surface1: "#45475a"
    readonly property color surface0: "#313244"
    readonly property color base: "#1e1e2e"
    readonly property color mantle: "#181825"
    readonly property color crust: "#11111b"

    readonly property var theme: {
        "name": "latte",
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
