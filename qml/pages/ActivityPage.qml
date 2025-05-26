import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import LowerHouseVoteLog

Rectangle {
    color: ThemeManager.secondaryPanel0

    // 会议时间统计部分
    Rectangle {
        id: countPart
        width: parent.width - 55
        height: 180
        color: "transparent"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20

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

                Row {
                    width: parent.width
                    spacing: 10

                    Text {
                        text: "最长会议时间"
                        color: PaletteManager.text
                    }

                    Text {
                        text: "2小时30分钟" // 这里需要根据实际数据设置
                        color: ThemeManager.color1
                    }
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

                Row {
                    width: parent.width
                    spacing: 10

                    Text {
                        text: "最短会议时间"
                        color: PaletteManager.text
                    }

                    Text {
                        text: "45分钟" // 这里需要根据实际数据设置
                        color: ThemeManager.color1
                    }
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

            // 平均会议时间
            Column {
                width: parent.width
                spacing: 5

                Row {
                    width: parent.width
                    spacing: 10

                    Text {
                        text: "平均会议时间"
                        color: PaletteManager.text
                    }

                    Text {
                        text: "1小时15分钟" // 这里需要根据实际数据设置
                        color: ThemeManager.color1
                    }
                }

                ProgressBar {
                    width: parent.width
                    height: 20
                    value: 0.4 // 这里需要根据实际数据设置
                    background: Rectangle {
                        color: ThemeManager.secondaryPanel1
                        radius: 5
                    }
                    contentItem: Rectangle {
                        color: ThemeManager.color2
                        radius: 5
                    }
                }
            }
        }
    }

    // 日历容器
    Rectangle {
        id: calendarContainer
        width: countPart.width
        height: parent.height - countPart.height - 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: countPart.bottom
        anchors.topMargin: 20
        anchors.bottomMargin: 20
        color: ThemeManager.surfaceElement0
        radius: 12

        Column {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 15

            // 月份选择器
            Rectangle {
                width: parent.width
                height: 50
                color: ThemeManager.secondaryPanel1
                radius: 8

                Row {
                    anchors.centerIn: parent
                    spacing: 20

                    Button {
                        text: "◀"
                        width: 36
                        height: 36
                        font.pixelSize: 16
                        background: Rectangle {
                            color: ThemeManager.surfaceElement0
                            radius: 18
                        }
                        contentItem: Text {
                            text: parent.text
                            color: ThemeManager.color4
                            font.pixelSize: parent.font.pixelSize
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: {
                            if (currentMonth > 0) {
                                currentMonth--
                            } else {
                                currentMonth = 11
                                currentYear--
                            }
                            monthGrid.month = currentMonth
                            monthGrid.year = currentYear
                        }
                    }

                    Text {
                        text: monthNames[currentMonth] + " " + currentYear
                        font.pixelSize: 20
                        font.bold: true
                        color: ThemeManager.color4
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Button {
                        text: "▶"
                        width: 36
                        height: 36
                        font.pixelSize: 16
                        background: Rectangle {
                            color: ThemeManager.surfaceElement0
                            radius: 18
                        }
                        contentItem: Text {
                            text: parent.text
                            color: ThemeManager.color4
                            font.pixelSize: parent.font.pixelSize
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: {
                            if (currentMonth < 11) {
                                currentMonth++
                            } else {
                                currentMonth = 0
                                currentYear++
                            }
                            monthGrid.month = currentMonth
                            monthGrid.year = currentYear
                        }
                    }
                }
            }

            // 星期标题栏
            Row {
                width: parent.width
                height: 30
                spacing: 0

                Repeater {
                    model: ["日", "一", "二", "三", "四", "五", "六"]
                    Rectangle {
                        width: parent.width / 7
                        height: parent.height
                        color: "transparent"

                        Text {
                            anchors.centerIn: parent
                            text: modelData
                            color: ThemeManager.color4
                            font.pixelSize: 14
                            font.bold: true
                        }
                    }
                }
            }

            MonthGrid {
                id: monthGrid
                width: parent.width
                height: parent.height - 95
                month: currentMonth
                year: currentYear

                // 自定义背景
                background: Rectangle {
                    color: ThemeManager.secondaryPanel1
                    radius: 8
                }

                // 自定义日期单元格
                delegate: Rectangle {
                    id: dayCell
                    property bool isToday: {
                        var today = new Date()
                        return day === today.getDate() &&
                               monthGrid.month === today.getMonth() &&
                               monthGrid.year === today.getFullYear()
                    }

                    property bool isCurrentMonth: monthGrid.month === month

                    color: {
                        if (isToday) {
                            return ThemeManager.color4
                        }
                        if (!isCurrentMonth) {
                            return ThemeManager.surfaceElement0
                        }
                        // 这里需要根据实际数据设置颜色深浅
                        var intensity = Math.random() // 示例：随机生成颜色深浅
                        return Qt.rgba(ThemeManager.color4.r, 
                                     ThemeManager.color4.g, 
                                     ThemeManager.color4.b, 
                                     intensity * 0.3 + 0.1)
                    }
                    radius: 8

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 2
                        color: "transparent"
                        radius: 6

                        Text {
                            anchors.centerIn: parent
                            text: day
                            color: {
                                if (isToday) {
                                    return ThemeManager.surfaceElement0
                                }
                                if (!isCurrentMonth) {
                                    return ThemeManager.color8
                                }
                                return ThemeManager.color4
                            }
                            font.pixelSize: 14
                            font.bold: isToday
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            if (isCurrentMonth) {
                                // 这里需要处理日期点击事件
                                console.log("Selected date:", monthGrid.year, monthGrid.month + 1, day)
                            }
                        }
                        onEntered: {
                            if (isCurrentMonth) {
                                parent.scale = 1.1
                                parent.color = Qt.rgba(ThemeManager.color4.r,
                                                     ThemeManager.color4.g,
                                                     ThemeManager.color4.b,
                                                     0.5)
                            }
                        }
                        onExited: {
                            parent.scale = 1.0
                            if (isCurrentMonth) {
                                parent.color = Qt.rgba(ThemeManager.color4.r,
                                                     ThemeManager.color4.g,
                                                     ThemeManager.color4.b,
                                                     Math.random() * 0.3 + 0.1)
                            }
                        }
                    }

                    Behavior on scale {
                        NumberAnimation {
                            duration: 100
                            easing.type: Easing.OutQuad
                        }
                    }

                    Behavior on color {
                        ColorAnimation {
                            duration: 200
                            easing.type: Easing.InOutQuad
                        }
                    }
                }
            }
        }
    }

    // 属性
    property int currentMonth: new Date().getMonth()
    property int currentYear: new Date().getFullYear()
    property var monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", 
                            "七月", "八月", "九月", "十月", "十一月", "十二月"]
}
