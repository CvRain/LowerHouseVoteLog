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
                    "title": "Start Vote"
                }, {
                    "icon": "qrc:/res/img/calendar.svg",
                    "title": "Activity"
                }]

            delegate: Item {
                width: parent.width
                height: 50

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 5
                    color: sidebar.currentIndex
                           === index ? ThemeManager.surfaceElement2 : "transparent"
                    radius: 8

                    Row {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 10

                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            source: modelData.icon
                            fillMode: Image.PreserveAspectFit
                            width: 30
                            height: 30
                            smooth: true
                            mipmap: true
                            antialiasing: true
                            cache: false
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

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sidebar.currentIndex = index
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

        Image {
            anchors.centerIn: parent
            source: "qrc:/res/img/painting.svg"
            fillMode: Image.PreserveAspectFit
            width: parent.width * 0.6
            height: parent.height * 0.6
            smooth: true
            mipmap: true
            antialiasing: true
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

        Canvas {
            id: arrowImage
            anchors.centerIn: parent
            width: 20
            height: 20

            property color arrowColor: ThemeManager.color0
            property real rotationAngle: 0

            // 添加旋转动画
            Behavior on rotationAngle {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }

            transform: Rotation {
                origin.x: arrowImage.width / 2
                origin.y: arrowImage.height / 2
                angle: arrowImage.rotationAngle
            }

            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()

                // 设置箭头颜色
                ctx.strokeStyle = arrowColor
                ctx.lineWidth = 2
                ctx.lineCap = "round"
                ctx.lineJoin = "round"

                // 计算箭头位置
                var centerX = width / 2
                var centerY = height / 2
                var arrowLength = width * 0.4
                var arrowWidth = width * 0.2

                // 绘制箭头主体
                ctx.beginPath()
                ctx.moveTo(centerX - arrowLength / 2, centerY)
                ctx.lineTo(centerX + arrowLength / 2, centerY)

                // 绘制箭头头部
                if (sidebar.expanded) {
                    // 向左箭头
                    ctx.lineTo(centerX + arrowLength / 2 - arrowWidth,
                               centerY - arrowWidth)
                    ctx.moveTo(centerX + arrowLength / 2, centerY)
                    ctx.lineTo(centerX + arrowLength / 2 - arrowWidth,
                               centerY + arrowWidth)
                } else {
                    // 向右箭头
                    ctx.lineTo(centerX - arrowLength / 2 + arrowWidth,
                               centerY - arrowWidth)
                    ctx.moveTo(centerX - arrowLength / 2, centerY)
                    ctx.lineTo(centerX - arrowLength / 2 + arrowWidth,
                               centerY + arrowWidth)
                }

                ctx.stroke()
            }

            // 监听主题颜色变化
            Connections {
                target: ThemeManager
                function onThemeChanged() {
                    arrowImage.arrowColor = ThemeManager.color0
                    arrowImage.requestPaint()
                }
            }

            // 监听展开状态变化
            Connections {
                target: sidebar
                function onExpandedChanged() {
                    arrowImage.rotationAngle = sidebar.expanded ? 180 : 0
                    arrowImage.requestPaint()
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
