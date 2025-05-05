import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        width: 300
        height: 300
        color: "red"
        anchors.centerIn: parent
    }
}
