import QtQuick
import QtQuick.Controls
import LowerHouseVoteLog 1.0

Window {
    id: mainWindow

    height: 540
    title: qsTr("Lower house vote log")
    visible: true
    width: 720

    // 全局颜色过渡动画
    Behavior on color {
        ColorAnimation {
            duration: 500
            easing.type: Easing.InOutQuad
        }
    }

    color: ThemeManager.backgroundPanel

    Sidebar {
        id: sidebar
        collapsedWidth: 70
        expandedWidth: 250
    }
}
