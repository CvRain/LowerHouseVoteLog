import QtQuick
import QtQuick.Controls
import LowerHouseVoteLog 1.0
import "./components"
import "./pages"

ApplicationWindow {
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
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        collapsedWidth: 70
        expandedWidth: 250
    }

    //主内容区域
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
        replaceEnter: Transition {
            PropertyAnimation {
                property: "y"
                from: stackView.height
                to: 0
                duration: 300
                easing.type: Easing.OutCubic
            }
        }
        replaceExit: Transition {
            PropertyAnimation {
                property: "y"
                from: 0
                to: -stackView.height
                duration: 300
                easing.type: Easing.InCubic
            }
        }
    }

    // Start Vote 页面
    Component {
        id: startVotePage
        StartVotePage {}
    }

    // Activity 页面
    Component {
        id: activityPage
        ActivityPage {}
    }

    // User 页面
    Component {
        id: userPage
        UserPage {}
    }

    // 监听侧边栏页面切换
    Connections {
        target: sidebar
        function onCurrentIndexChanged() {
            if (sidebar.currentIndex === 0) {
                stackView.replace(startVotePage);
            } else if (sidebar.currentIndex === 1) {
                stackView.replace(activityPage);
            } else if (sidebar.currentIndex === 2) {
                stackView.replace(userPage);
            }
        }
    }
}
