import QtQuick
import QtQuick.Controls
import LowerHouseVoteLog

Item {
    id: menuItem
    width: parent.width
    height: 50

    property string iconSource: ""
    property string title: ""
    property bool isSelected: false
    property bool isExpanded: false

    Rectangle {
        anchors.fill: parent
        anchors.margins: 5
        color: {
            if (isSelected) {
                return ThemeManager.surfaceElement1
            } else if (isHovered) {
                return ThemeManager.surfaceElement0
            } else {
                return "transparent"
            }
        }
        radius: 8

        property bool isHovered: false
        Behavior on color {
            ColorAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

        Row {
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            spacing: 10

            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: iconSource
                fillMode: Image.PreserveAspectFit
                width: 30
                height: 30
                opacity: isSelected ? 1.0 : 0.7
                Behavior on opacity {
                    NumberAnimation {
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }
                }
            }

            Text {
                text: menuItem.title
                color: {
                    let isIndex = menuItem.isSelected
                    if (PaletteManager.currentThemeType == PaletteManager.Latte) {
                        return isIndex ? PaletteManager.rosewater : ThemeManager.subtle
                    }
                    return isIndex ? ThemeManager.color1 : ThemeManager.color8
                }

                anchors.verticalCenter: parent.verticalCenter
                opacity: menuItem.isExpanded ? 1 : 0
                visible: menuItem.isExpanded
                font.family: FontManager.hanYi.name
                font.pixelSize: 16
                transform: Translate {
                    x: menuItem.isExpanded ? 0 : -20
                }
                Behavior on color {
                    ColorAnimation {
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }
                }

                Behavior on opacity {
                    NumberAnimation {
                        duration: 200
                        easing.type: Easing.InOutCubic
                    }
                }

                Behavior on transform {
                    NumberAnimation {
                        duration: 200
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                menuItem.clicked()
            }
            onEntered: {
                parent.isHovered = true
            }
            onExited: {
                parent.isHovered = false
            }
        }
    }

    signal clicked()
} 