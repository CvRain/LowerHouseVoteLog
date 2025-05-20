import QtQuick

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
    property int animationDelay: 100 // 每个按钮的动画延迟时间

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
        var themes = [{
                          "text": "Latte",
                          "theme": PaletteManager.Latte,
                          "icon": "☕"
                      }, {
                          "text": "Frappe",
                          "theme": PaletteManager.Frappe,
                          "icon": "🍹"
                      }, {
                          "text": "Macchiato",
                          "theme": PaletteManager.Macchiato,
                          "icon": "🥤"
                      }, {
                          "text": "Mocha",
                          "theme": PaletteManager.Mocha,
                          "icon": "🍫"
                      }]

        // 计算按钮位置，使其分布在9点到12点之间
        for (var i = 0; i < themes.length; i++) {
            // 将角度范围限制在180度到270度之间（9点到12点）
            var angle = (180 + (i * 90 / (themes.length - 1))) * Math.PI / 180
            var radius = 80 // 半径
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
