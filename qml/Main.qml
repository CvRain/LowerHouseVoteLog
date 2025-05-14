import QtQuick
import QtQuick.Controls
import LowerHouseVoteLog 1.0

Window {
    id: mainWindow

    height: 740
    title: qsTr("主题切换演示")
    visible: true
    width: 360

    // 背景色随主题变化
    Rectangle {
        anchors.fill: parent
        color: ThemeManager.base

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
        color: ThemeManager.text
        font.pixelSize: 24
        text: ThemeManager.currentThemeText
    }
    Column {
        anchors.centerIn: parent
        spacing: 20

        Repeater {
            model: [{
                    "text": "Latte",
                    "theme": ThemeManager.Latte
                }, {
                    "text": "Frappe",
                    "theme": ThemeManager.Frappe
                }, {
                    "text": "Macchiato",
                    "theme": ThemeManager.Macchiato
                }, {
                    "text": "Mocha",
                    "theme": ThemeManager.Mocha
                }]

            delegate: Button {
                height: 50
                text: modelData.text
                width: 200

                background: Rectangle {
                    border.color: ThemeManager.overlay0
                    border.width: 1
                    color: ThemeManager.surface0
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
                    color: ThemeManager.text
                    horizontalAlignment: Text.AlignHCenter
                    text: parent.text
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {

                    ThemeManager.currentThemeType = modelData.theme
                    //ThemeManager.changeTheme(modelData.theme)
                }
            }
        }
    }
}
