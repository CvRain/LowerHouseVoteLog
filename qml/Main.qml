import QtQuick
import QtQuick.Controls
import LowerHouseVoteLog 1.0

Window {
    id: mainWindow

    height: 540
    title: qsTr("Lower house vote log")
    visible: true
    width: 720

    // 背景色随主题变化
    Rectangle {
        anchors.fill: parent
        color: ThemeManager.backgroundPanel

        Behavior on color {

            PropertyAnimation {
                property: "color"
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }
    }
    Text {
        id: themeText

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 30
        color: PaletteManager.text
        font.pixelSize: 24
        text: PaletteManager.currentThemeText
    }
    Column {
        anchors.centerIn: parent
        spacing: 20

        Repeater {
            model: [{
                    "text": "Latte",
                    "theme": PaletteManager.Latte
                }, {
                    "text": "Frappe",
                    "theme": PaletteManager.Frappe
                }, {
                    "text": "Macchiato",
                    "theme": PaletteManager.Macchiato
                }, {
                    "text": "Mocha",
                    "theme": PaletteManager.Mocha
                }]

            delegate: Button {
                height: 50
                text: modelData.text
                width: 200

                background: Rectangle {
                    border.color: PaletteManager.overlay0
                    border.width: 1
                    color: PaletteManager.surface0
                    radius: 8

                    Behavior on color {

                        PropertyAnimation {
                            property: "color"
                            duration: 450
                            easing.type: Easing.OutInCubic
                        }
                    }
                }
                contentItem: Text {
                    color: PaletteManager.text
                    horizontalAlignment: Text.AlignHCenter
                    text: parent.text
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {
                    ThemeManager.setTheme(modelData.theme)
                }
            }
        }
    }
}
