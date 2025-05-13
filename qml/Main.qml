import QtQuick
import QtQuick.Controls
import LowerHouseVoteLog 1.0

Window {
    id: mainWindow

    title: qsTr("Hello World")
    visible: true
    width: 360
    height: 740

    Text {
        id: text
        text: ThemeManager.currentThemeType
        font.pixelSize: 32
        color: ThemeManager.lavender
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 15
    }

    Button {
        id: button

        property int number: 0

        text: button.number
        font.pixelSize: 12
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: text.bottom
        anchors.topMargin: 15

        width: 150
        height: 200

        onClicked: {
            console.debug(ThemeManager.currentThemeType)
            ThemeManager.currentThemeType = ThemeManager.Mocha
            button.number += 1
        }

        background: Rectangle {
            color: ThemeManager.peach
        }
    }
}
