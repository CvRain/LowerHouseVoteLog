import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import LowerHouseVoteLog

Rectangle {
    color: "transparent"

    // 主布局容器
    Rectangle {
        anchors.fill: parent
        anchors.margins: 20
        color: ThemeManager.secondaryPanel0
        radius: 10

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 30

            // 会议状态显示
            Text {
                id: meetingStatusText
                text: "当前无进行中的会议"
                font.family: FontManager.hanYi.name
                font.pixelSize: 28
                color: ThemeManager.color0
                Layout.alignment: Qt.AlignHCenter
            }

            // 计时器显示
            Rectangle {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 300
                Layout.preferredHeight: 120
                color: ThemeManager.surfaceElement0
                radius: 8

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 10

                    Text {
                        id: timerDisplay
                        text: "00:00:00"
                        font.family: FontManager.hanYi.name
                        font.pixelSize: 48
                        color: ThemeManager.color0
                        Layout.alignment: Qt.AlignHCenter
                    }

                    Text {
                        id: timeDisplayText
                        text: "距离上次会议: 0天0小时0分钟"
                        font.family: FontManager.hanYi.name
                        font.pixelSize: 16
                        color: ThemeManager.color0
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }

            // 会议控制按钮组
            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 20

                Button {
                    id: meetingControlButton
                    text: "开始会议"
                    font.family: FontManager.hanYi.name
                    font.pixelSize: 18
                    Layout.preferredWidth: 120
                    Layout.preferredHeight: 40

                    onClicked: {
                        if (text === "开始会议") {
                            text = "结束会议"
                            meetingStatusText.text = "会议进行中"
                            pauseButton.visible = true
                            cancelButton.visible = true
                            timer.start()
                            // TODO: 调用后端开始会议接口
                        } else {
                            text = "开始会议"
                            meetingStatusText.text = "当前无进行中的会议"
                            pauseButton.visible = false
                            cancelButton.visible = false
                            timer.stop()
                            meetingInfoDialog.open()
                            // TODO: 调用后端结束会议接口
                        }
                    }
                }

                Button {
                    id: pauseButton
                    text: "暂停"
                    font.family: FontManager.hanYi.name
                    font.pixelSize: 18
                    Layout.preferredWidth: 120
                    Layout.preferredHeight: 40
                    visible: false

                    onClicked: {
                        if (text === "暂停") {
                            text = "继续"
                            timer.stop()
                            // TODO: 调用后端暂停会议接口
                        } else {
                            text = "暂停"
                            timer.start()
                            // TODO: 调用后端继续会议接口
                        }
                    }
                }

                Button {
                    id: cancelButton
                    text: "取消会议"
                    font.family: FontManager.hanYi.name
                    font.pixelSize: 18
                    Layout.preferredWidth: 120
                    Layout.preferredHeight: 40
                    visible: false

                    onClicked: {
                        meetingControlButton.text = "开始会议"
                        meetingStatusText.text = "当前无进行中的会议"
                        pauseButton.visible = false
                        cancelButton.visible = false
                        timer.stop()
                        timerDisplay.text = "00:00:00"
                        // TODO: 调用后端取消会议接口
                    }
                }
            }
        }
    }

    // 会议信息输入对话框
    Dialog {
        id: meetingInfoDialog
        title: "会议信息"
        modal: true
        anchors.centerIn: parent
        width: 500
        height: 200

        Rectangle {
            anchors.fill: parent
            color: ThemeManager.secondaryPanel1
            radius: 10

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15

                TextField {
                    id: meetingTitleInput
                    placeholderText: "请输入会议主题"
                    Layout.fillWidth: true
                    font.family: FontManager.hanYi.name
                    font.pixelSize: 16
                    background: Rectangle {
                        color: ThemeManager.surfaceElement1
                        radius: 5
                    }
                }

                TextField {
                    id: meetingNotesInput
                    placeholderText: "请输入会议笔记"
                    Layout.fillWidth: true
                    font.family: FontManager.hanYi.name
                    font.pixelSize: 16
                    background: Rectangle {
                        color: ThemeManager.surfaceElement1
                        radius: 5
                    }
                }

                RowLayout {
                    Layout.alignment: Qt.AlignRight
                    spacing: 10

                    Button {
                        text: "取消"
                        font.family: FontManager.hanYi.name
                        onClicked: meetingInfoDialog.close()
                    }

                    Button {
                        text: "保存"
                        font.family: FontManager.hanYi.name
                        onClicked: {
                            // TODO: 调用后端保存会议信息接口
                            meetingInfoDialog.close()
                        }
                    }
                }
            }
        }
    }

    // 计时器
    Timer {
        id: timer
        interval: 1000
        repeat: true
        onTriggered: {
            var currentTime = timerDisplay.text.split(":")
            var hours = parseInt(currentTime[0])
            var minutes = parseInt(currentTime[1])
            var seconds = parseInt(currentTime[2])
            
            seconds++
            if (seconds >= 60) {
                seconds = 0
                minutes++
                if (minutes >= 60) {
                    minutes = 0
                    hours++
                }
            }
            
            timerDisplay.text = String(hours).padStart(2, '0') + ":" +
                               String(minutes).padStart(2, '0') + ":" +
                               String(seconds).padStart(2, '0')
        }
    }
} 