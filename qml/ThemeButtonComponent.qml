import QtQuick

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
