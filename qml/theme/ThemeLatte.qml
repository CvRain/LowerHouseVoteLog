pragma Singleton

import QtQuick

QtObject {
    id: root
    readonly property color rosewater: "#dc8a78"
    readonly property color flamingo: "#dd7878"
    readonly property color pink: "#ea76cb"
    readonly property color mauve: "#8839ef"
    readonly property color red: "#d20f39"
    readonly property color maroon: "#e64553"
    readonly property color peach: "#fe640b"
    readonly property color yellow: "#df8e1d"
    readonly property color green: "#40a02b"
    readonly property color teal: "#179299"
    readonly property color sky: "#04a5e5"
    readonly property color sapphire: "#209fb5"
    readonly property color blue: "#1e66f5"
    readonly property color lavender: "#7287fd"
    readonly property color text: "#4c4f69"
    readonly property color subtext1: "#5c5f77"
    readonly property color subtext0: "#6c6f85"
    readonly property color overlay2: "#7c7f93"
    readonly property color overlay1: "#8c8fa1"
    readonly property color overlay0: "#9ca0b0"
    readonly property color surface2: "#acb0be"
    readonly property color surface1: "#bcc0cc"
    readonly property color surface0: "#ccd0da"
    readonly property color base: "#eff1f5"
    readonly property color mantle: "#e6e9ef"
    readonly property color crust: "#dce0e8"

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
            "selectionBackground": root.overlay2,
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
