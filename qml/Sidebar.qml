import QtQuick
import QtQuick.Controls
import LowerHouseVoteLog 1.0

Item {
    id: sidebar
    width: expanded ? expandedWidth : collapsedWidth
    height: parent.height
    anchors.left: parent.left

    property bool expanded: false
    property color iconColor: "#ffffff"
    property color textColor: "#ffffff"
    
    property int expandedWidth: 200
    property int collapsedWidth: 60
    

    // 背景
    Rectangle {
        id: background
        anchors.fill: parent
        color: ThemeManager.secondaryPanel1

        Behavior on color {
            ColorAnimation {
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }
    }

    // 菜单项列表
    Column {
        id: menuColumn
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 20
        spacing: 10

        // 示例菜单项
        Repeater {
            model: [
                { icon: "📊", title: "数据统计" },
                { icon: "📝", title: "投票记录" },
                { icon: "⚙️", title: "设置" }
            ]

            delegate: Item {
                width: parent.width
                height: 50

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 5
                    color: "transparent"
                    radius: 8

                    Row {
                        anchors.centerIn: parent
                        spacing: 10

                        Text {
                            text: modelData.icon
                            font.pixelSize: 24
                            color: ThemeManager.color0
                            anchors.verticalCenter: parent.verticalCenter

                            Behavior on color {
                                ColorAnimation {
                                    duration: 500
                                    easing.type: Easing.InOutQuad
                                }
                            }
                        }

                        Text {
                            text: modelData.title
                            color: ThemeManager.color0
                            font.pixelSize: 16
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                            opacity: expanded ? 1 : 0
                            visible: expanded

                            Behavior on color {
                                ColorAnimation {
                                    duration: 500
                                    easing.type: Easing.InOutQuad
                                }
                            }
                        }
                    }
                }
            }
        }

        // 主题切换部分
        Item {
            width: parent.width
            height: expanded ? 180 : 50
            anchors.topMargin: 20

            Rectangle {
                anchors.fill: parent
                anchors.margins: 5
                color: ThemeManager.surfaceElement0
                radius: 8

                Behavior on color {
                    ColorAnimation {
                        duration: 500
                        easing.type: Easing.InOutQuad
                    }
                }

                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 8
                    visible: expanded

                    Text {
                        text: "主题设置"
                        color: ThemeManager.color0
                        font.pixelSize: 16
                        font.bold: true

                        Behavior on color {
                            ColorAnimation {
                                duration: 500
                                easing.type: Easing.InOutQuad
                            }
                        }
                    }

                    Repeater {
                        model: [
                            { text: "Latte", theme: PaletteManager.Latte, icon: "☕" },
                            { text: "Frappe", theme: PaletteManager.Frappe, icon: "🍹" },
                            { text: "Macchiato", theme: PaletteManager.Macchiato, icon: "🥤" },
                            { text: "Mocha", theme: PaletteManager.Mocha, icon: "🍫" }
                        ]

                        delegate: Rectangle {
                            width: parent.width
                            height: 36
                            radius: 6
                            color: ThemeManager.surfaceElement1

                            Behavior on color {
                                ColorAnimation {
                                    duration: 500
                                    easing.type: Easing.InOutQuad
                                }
                            }

                            Row {
                                anchors.centerIn: parent
                                spacing: 8

                                Text {
                                    text: modelData.icon
                                    font.pixelSize: 18
                                    color: ThemeManager.color0
                                    anchors.verticalCenter: parent.verticalCenter

                                    Behavior on color {
                                        ColorAnimation {
                                            duration: 500
                                            easing.type: Easing.InOutQuad
                                        }
                                    }
                                }

                                Text {
                                    text: modelData.text
                                    color: ThemeManager.color0
                                    font.pixelSize: 14
                                    anchors.verticalCenter: parent.verticalCenter

                                    Behavior on color {
                                        ColorAnimation {
                                            duration: 500
                                            easing.type: Easing.InOutQuad
                                        }
                                    }
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: {
                                    ThemeManager.setTheme(modelData.theme)
                                }

                                onEntered: parent.color = ThemeManager.surfaceElement2
                                onExited: parent.color = ThemeManager.surfaceElement1
                            }
                        }
                    }
                }

                // 主题图标（收起状态显示）
                Text {
                    anchors.centerIn: parent
                    text: "🎨"
                    font.pixelSize: 24
                    color: ThemeManager.color0
                    visible: !expanded

                    Behavior on color {
                        ColorAnimation {
                            duration: 500
                            easing.type: Easing.InOutQuad
                        }
                    }
                }
            }
        }
    }

    // 展开/收起按钮
    Rectangle {
        id: toggleButton
        width: 40
        height: 40
        radius: 20
        color: ThemeManager.surfaceElement1
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 10

        Behavior on color {
            ColorAnimation {
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }

        Text {
            anchors.centerIn: parent
            text: expanded ? "◀" : "▶"
            color: ThemeManager.color0
            font.pixelSize: 16

            Behavior on color {
                ColorAnimation {
                    duration: 500
                    easing.type: Easing.InOutQuad
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                expanded = !expanded
            }
            onEntered: parent.color = ThemeManager.surfaceElement2
            onExited: parent.color = ThemeManager.surfaceElement1
        }
    }

    // 展开/收起动画
    Behavior on width {
        NumberAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }
}
