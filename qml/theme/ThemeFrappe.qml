pragma Singleton

import QtQuick

QtObject {
    id: root
    readonly property color rosewater: "#f2d5cf"
    readonly property color flamingo: "#eebebe"
    readonly property color pink: "#f4b8e4"
    readonly property color mauve: "#ca9ee6"
    readonly property color red: "#e78284"
    readonly property color maroon: "#ea999c"
    readonly property color peach: "#ef9f76"
    readonly property color yellow: "#e5c890"
    readonly property color green: "#a6d189"
    readonly property color teal: "#81c8be"
    readonly property color sky: "#99d1db"
    readonly property color sapphire: "#85c1dc"
    readonly property color blue: "#8caaee"
    readonly property color lavender: "#babbf1"
    readonly property color text: "#c6d0f5"
    readonly property color subtext1: "#b5bfe2"
    readonly property color subtext0: "#a5adce"
    readonly property color overlay2: "#949cbb"
    readonly property color overlay1: "#838ba7"
    readonly property color overlay0: "#737994"
    readonly property color surface2: "#626880"
    readonly property color surface1: "#51576d"
    readonly property color surface0: "#414559"
    readonly property color base: "#303446"
    readonly property color mantle: "#292c3c"
    readonly property color crust: "#232634"

    readonly property var theme: {
        "name": "frappe",
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
