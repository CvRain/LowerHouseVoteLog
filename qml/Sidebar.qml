import QtQuick
import QtQuick.Controls
import LowerHouseVoteLog 1.0

Item {
    id: sidebar
    width: expanded ? expandedWidth : collapsedWidth
    height: parent.height
    anchors.left: parent.left

    property bool expanded: false
    property color iconColor: ThemeManager.color0
    property color textColor: ThemeManager.color0
    
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
        visible: expanded

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

    // 主题选择轨道
    Item {
        id: themeMenu
        visible: false
        anchors.right: themeButton.right
        anchors.bottom: themeButton.bottom
        width: 200
        height: 200
        z: 1

        property var themeButtons: []
        property int animationDelay: 100  // 每个按钮的动画延迟时间

        // 监听侧边栏的展开状态
        Connections {
            target: sidebar
            function onExpandedChanged() {
                if (!expanded) {
                    themeMenu.visible = false
                }
            }
        }

        function startAnimations() {
            for (var i = 0; i < themeButtons.length; i++) {
                themeButtons[i].startAnimation(i * animationDelay)
            }
        }

        Component.onCompleted: {
            var themes = [
                { text: "Latte", theme: PaletteManager.Latte, icon: "☕" },
                { text: "Frappe", theme: PaletteManager.Frappe, icon: "🍹" },
                { text: "Macchiato", theme: PaletteManager.Macchiato, icon: "🥤" },
                { text: "Mocha", theme: PaletteManager.Mocha, icon: "🍫" }
            ]

            // 计算按钮位置，使其分布在9点到12点之间
            for (var i = 0; i < themes.length; i++) {
                // 将角度范围限制在180度到270度之间（9点到12点）
                var angle = (180 + (i * 90 / (themes.length - 1))) * Math.PI / 180
                var radius = 80  // 半径
                var x = Math.cos(angle) * radius
                var y = Math.sin(angle) * radius

                var button = themeButtonComponent.createObject(themeMenu, {
                    "x": x + 150,
                    "y": y + 150,
                    "themeData": themes[i]
                })
                themeButtons.push(button)
            }
        }

        Component {
            id: themeButtonComponent
            Rectangle {
                id: themeButton
                width: 36
                height: 36
                radius: 18
                color: ThemeManager.surfaceElement1
                opacity: 0
                scale: 0

                property var themeData

                Behavior on color {
                    ColorAnimation {
                        duration: 500
                        easing.type: Easing.InOutQuad
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: themeData.icon
                    font.pixelSize: 18
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
                        ThemeManager.setTheme(themeData.theme)
                        themeMenu.visible = false
                    }
                    onEntered: parent.color = ThemeManager.surfaceElement2
                    onExited: parent.color = ThemeManager.surfaceElement1
                }

                function startAnimation(delay) {
                    opacity = 0
                    scale = 0
                    opacityTimer.interval = delay
                    scaleTimer.interval = delay
                    opacityTimer.start()
                    scaleTimer.start()
                }

                Timer {
                    id: opacityTimer
                    repeat: false
                    onTriggered: opacityAnimation.start()
                }

                Timer {
                    id: scaleTimer
                    repeat: false
                    onTriggered: scaleAnimation.start()
                }

                PropertyAnimation {
                    id: opacityAnimation
                    target: themeButton
                    property: "opacity"
                    to: 1
                    duration: 300
                    easing.type: Easing.OutBack
                }

                PropertyAnimation {
                    id: scaleAnimation
                    target: themeButton
                    property: "scale"
                    to: 1
                    duration: 300
                    easing.type: Easing.OutBack
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
