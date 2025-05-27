import QtQuick
import QtQuick.Controls
import LowerHouseVoteLog

Item {
    id: sidebar
    property bool expanded: false
    property color iconColor: ThemeManager.color0
    property color textColor: ThemeManager.color0
    property int currentIndex: 0 // 添加当前页面索引属性

    property int expandedWidth: 200
    property int collapsedWidth: 60
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

        // 菜单项
        Repeater {
            id: repeater
            model: [{
                    "icon": "qrc:/res/img/clock.svg",
                    "title": qsTr("今日议程")
                }, {
                    "icon": "qrc:/res/img/calendar.svg",
                    "title": qsTr("历史议程")
                }, {
                    "icon": "qrc:/res/img/user.svg",
                    "title": qsTr("用户管理")
                }]

            delegate: MenuItem {
                iconSource: modelData.icon
                title: modelData.title
                isSelected: sidebar.currentIndex === index
                isExpanded: sidebar.expanded
                onClicked: {
                    sidebar.currentIndex = index
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
        color: ThemeManager.surfaceElement0
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 10
        z: 2
        visible: sidebar.expanded

        // 监听主题变化
        Connections {
            target: ThemeManager
            function onThemeChanged() {
                themeButton.color = ThemeManager.surfaceElement0
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

        Image {
            anchors.centerIn: parent
            source: "qrc:/res/img/painting.svg"
            fillMode: Image.PreserveAspectFit
            width: parent.width * 0.6
            height: parent.height * 0.6
            opacity: 0.7
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
            onEntered: parent.color = ThemeManager.surfaceElement1
            onExited: parent.color = ThemeManager.surfaceElement0
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
        color: ThemeManager.surfaceElement0
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 10

        // 监听主题变化
        Connections {
            target: ThemeManager
            function onThemeChanged() {
                toggleButton.color = ThemeManager.surfaceElement0
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

        Canvas {
            id: arrowImage
            anchors.centerIn: parent
            width: 20
            height: 20

            property color arrowColor: PaletteManager.subtext0
            property real rotationAngle: 0

            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()
                ctx.strokeStyle = arrowColor
                ctx.lineWidth = 2
                ctx.beginPath()
                ctx.moveTo(0, 0)
                ctx.lineTo(width, height / 2)
                ctx.lineTo(0, height)
                ctx.stroke()
            }

            Behavior on rotationAngle {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }

            rotation: sidebar.expanded ? 180 : 0
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                sidebar.expanded = !sidebar.expanded
            }
            onEntered: parent.color = ThemeManager.surfaceElement1
            onExited: parent.color = ThemeManager.surfaceElement0
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
