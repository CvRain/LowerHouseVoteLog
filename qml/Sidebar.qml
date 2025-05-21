import QtQuick
import QtQuick.Controls
import LowerHouseVoteLog 1.0

Item {
    property bool expanded: false
    property color iconColor: ThemeManager.color0
    property color textColor: ThemeManager.color0

    property int expandedWidth: 200
    property int collapsedWidth: 60

    id: sidebar
    width: expanded ? expandedWidth : collapsedWidth
    height: parent.height
    anchors.left: parent.left

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
            id: repeater

            model: [{
                    "icon": "📊",
                    "title": "数据统计"
                }, {
                    "icon": "📝",
                    "title": "投票记录"
                }, {
                    "icon": "⚙️",
                    "title": "设置"
                }]

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
                            opacity: sidebar.expanded ? 1 : 0
                            visible: sidebar.expanded

                            Behavior on color {
                                ColorAnimation {
                                    duration: 500
                                    easing.type: Easing.InOutQuad
                                }
                            }

                            Behavior on opacity {
                                NumberAnimation {
                                    duration: 200
                                    easing.type: Easing.InOutCubic
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // 主题切换按钮
    Rectangle {
        id: themeButton
        width: 40
        height: 40
        radius: 20
        color: ThemeManager.surfaceElement1
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 10
        z: 2
        visible: sidebar.expanded

        // 监听主题变化
        Connections {
            target: ThemeManager
            function onThemeChanged() {
                themeButton.color = ThemeManager.surfaceElement1
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }

        Text {
            anchors.centerIn: parent
            text: "🎨"
            font.pixelSize: 20
            color: ThemeManager.color0

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
                themeMenu.visible = !themeMenu.visible
                if (themeMenu.visible) {
                    themeMenu.startAnimations()
                }
            }
            onEntered: parent.color = ThemeManager.surfaceElement2
            onExited: parent.color = ThemeManager.surfaceElement1
        }
    }

    ThemeMenu {
        id: themeMenu
        anchors.right: themeButton.right
        anchors.bottom: themeButton.bottom
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

        // 监听主题变化
        Connections {
            target: ThemeManager
            function onThemeChanged() {
                toggleButton.color = ThemeManager.surfaceElement1
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }

        Text {
            anchors.centerIn: parent
            text: sidebar.expanded ? "◀" : "▶"
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
                sidebar.expanded = !sidebar.expanded
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
