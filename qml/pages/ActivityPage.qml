import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import LowerHouseVoteLog

Rectangle {
    color: ThemeManager.secondaryPanel0

    // 会议时间统计部分
    Rectangle {
        id: countPart
        width: parent.width - 55
        height: 135
        color: "transparent"
        anchors.horizontalCenter: parent.horizontalCenter

        Column {
            anchors.fill: parent
            spacing: 15

            Text {
                text: "会议时间统计"
                font.pixelSize: 20
                font.bold: true
                color: PaletteManager.text
            }

            // 最长会议时间
            Column {
                width: parent.width
                spacing: 5

                Text {
                    text: "最长会议时间"
                    color: PaletteManager.text
                }

                ProgressBar {
                    width: parent.width
                    height: 20
                    value: 0.5 // 这里需要根据实际数据设置
                    background: Rectangle {
                        color: Qt.darker(ThemeManager.success)
                        radius: 5
                    }
                    contentItem: Rectangle {
                        color: ThemeManager.color9
                        radius: 5
                    }
                }
            }

            // 最短会议时间
            Column {
                width: parent.width
                spacing: 5

                Text {
                    text: "最短会议时间"
                    color: PaletteManager.text
                }

                ProgressBar {
                    width: parent.width
                    height: 20
                    value: 0.3 // 这里需要根据实际数据设置
                    background: Rectangle {
                        color: ThemeManager.secondaryPanel1
                        radius: 5
                    }
                    contentItem: Rectangle {
                        color: ThemeManager.color1
                        radius: 5
                    }
                }
            }
        }
    }

    Rectangle {
        id: cendlarContainer
        width: countPart.width
        height: parent.height - countPart.height - 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: countPart.bottom
        anchors.topMargin: 15
        anchors.bottomMargin: 5
        color: ThemeManager.surfaceElement0

        MonthGrid {
            id: monthGrid
            width: parent.width
            height: 350
            month: new Date().getMonth()
            year: new Date().getFullYear()

            // 自定义背景
            background: Rectangle {
                color: ThemeManager.secondaryPanel1
                radius: 8
            }

            // 自定义日期单元格
            delegate: Rectangle {
                color: {
                    // 这里需要根据实际数据设置颜色深浅
                    var intensity = Math.random() // 示例：随机生成颜色深浅
                    return Qt.rgba(0.2, 0.4, 0.8, intensity)
                }
                radius: 4

                Text {
                    anchors.centerIn: parent
                    text: "!"
                    font.pixelSize: 12
                }
            }
        }
    }
}
