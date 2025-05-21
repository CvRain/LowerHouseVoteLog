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

    // 主内容区域
    StackView {
        id: stackView
        anchors {
            left: sidebar.right
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        initialItem: startVotePage

        // 自定义页面切换动画
        pushEnter: Transition {
            PropertyAnimation {
                property: "y"
                from: stackView.height
                to: 0
                duration: 300
                easing.type: Easing.OutCubic
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "y"
                from: 0
                to: -stackView.height
                duration: 300
                easing.type: Easing.InCubic
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "y"
                from: -stackView.height
                to: 0
                duration: 300
                easing.type: Easing.OutCubic
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "y"
                from: 0
                to: stackView.height
                duration: 300
                easing.type: Easing.InCubic
            }
        }
    }

    // Start Vote 页面
    Component {
        id: startVotePage
        Rectangle {
            color: "transparent"
            Text {
                anchors.centerIn: parent
                text: "Start Vote Page"
                font.pixelSize: 24
                color: ThemeManager.color0
            }
        }
    }

    // Activity 页面
    Component {
        id: activityPage
        Rectangle {
            color: "transparent"
            Text {
                anchors.centerIn: parent
                text: "Activity Page"
                font.pixelSize: 24
                color: ThemeManager.color0
            }
        }
    }

    // 监听侧边栏页面切换
    Connections {
        target: sidebar
        function onCurrentIndexChanged() {
            if (sidebar.currentIndex === 0) {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    stackView.push(startVotePage)
                }
            } else if (sidebar.currentIndex === 1) {
                stackView.push(activityPage)
            }
        }
    }
}
