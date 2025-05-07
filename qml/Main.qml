import QtQuick

Window {
    id: mainWindow

    height: 480
    title: qsTr("Hello World")
    visible: true
    width: 640

    Rectangle {
        id: rectangle

        anchors.centerIn: parent
        color: "#747474"
        height: 200
        radius: 45
        width: 200

        Behavior on radius{
            NumberAnimation{
                duration: 300
                easing: Easing.InOutCirc
            }
        }

        MouseArea {
            anchors.fill: parent

            onClicked: function () {
                console.log("clicked!");
                rectangle.radius = (rectangle.radius + 15) % 55;
            }
        }
    }
}
