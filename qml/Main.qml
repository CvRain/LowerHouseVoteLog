import QtQuick
import UserManager 1.0

Window {
    id: mainWindow

    title: qsTr("Hello World")
    visible: true
    width: 360
    height: 740

    Text {
        id: textText
        text: {
            if (UserManager.checkUserExist())
                return "has user"
            return "no user"
        }

        anchors.centerIn: parent
    }

    Text {
        text: UserManager.helloWorld()
    }

    Rectangle {
        color: ThemeLatte.theme.background.backgroundPane
        width: 200
        height: 200
        anchors.centerIn: parent
    }
}
