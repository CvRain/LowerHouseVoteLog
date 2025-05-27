import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import LowerHouseVoteLog

Rectangle {
    color: ThemeManager.secondaryPanel0

    // 用户列表容器
    Rectangle {
        id: userListContainer
        width: parent.width - 55
        height: parent.height - 40
        color: ThemeManager.surfaceElement0
        radius: 12
        anchors.centerIn: parent

        Column {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 15

            // 标题栏
            Row {
                width: parent.width
                height: 40
                spacing: 15

                Text {
                    text: "用户管理"
                    font.pixelSize: 20
                    font.bold: true
                    color: ThemeManager.color0
                    anchors.verticalCenter: parent.verticalCenter
                }

                Item { Layout.fillWidth: true }

                Button {
                    text: "添加用户"
                    font.pixelSize: 14
                    anchors.verticalCenter: parent.verticalCenter
                    background: Rectangle {
                        color: ThemeManager.color4
                        radius: 5
                    }
                    contentItem: Text {
                        text: parent.text
                        color: ThemeManager.surfaceElement0
                        font.pixelSize: parent.font.pixelSize
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked: {
                        nameInput.text = ""
                        signatureInput.text = ""
                        userDialog.open()
                    }
                }
            }

            // 用户列表
            ListView {
                id: userListView
                width: parent.width
                height: parent.height - 55
                clip: true
                spacing: 10
                model: ListModel {}

                delegate: Rectangle {
                    width: parent.width
                    height: 60
                    color: ThemeManager.surfaceElement1
                    radius: 8

                    Row {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 15

                        Column {
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 5

                            Text {
                                text: model.name
                                font.pixelSize: 16
                                font.bold: true
                                color: ThemeManager.color0
                            }

                            Text {
                                text: model.signature
                                font.pixelSize: 14
                                color: ThemeManager.color8
                            }
                        }

                        Item { Layout.fillWidth: true }

                        Row {
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 10

                            Button {
                                text: "编辑"
                                font.pixelSize: 14
                                background: Rectangle {
                                    color: ThemeManager.color4
                                    radius: 5
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: ThemeManager.surfaceElement0
                                    font.pixelSize: parent.font.pixelSize
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                onClicked: {
                                    nameInput.text = model.name
                                    signatureInput.text = model.signature
                                    currentUserId = model.id
                                    userDialog.open()
                                }
                            }

                            Button {
                                text: "删除"
                                font.pixelSize: 14
                                background: Rectangle {
                                    color: ThemeManager.color1
                                    radius: 5
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: ThemeManager.surfaceElement0
                                    font.pixelSize: parent.font.pixelSize
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                onClicked: {
                                    deleteConfirmDialog.userId = model.id
                                    deleteConfirmDialog.open()
                                }
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.color = ThemeManager.surfaceElement2
                        onExited: parent.color = ThemeManager.surfaceElement1
                    }
                }
            }
        }
    }

    // 用户信息编辑对话框
    Dialog {
        id: userDialog
        title: "用户信息"
        modal: true
        anchors.centerIn: parent
        width: 400
        height: 250

        Rectangle {
            anchors.fill: parent
            color: ThemeManager.surfaceElement0
            radius: 10

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15

                TextField {
                    id: nameInput
                    placeholderText: "请输入用户名"
                    Layout.fillWidth: true
                    font.pixelSize: 14
                    background: Rectangle {
                        color: ThemeManager.surfaceElement1
                        radius: 5
                    }
                }

                TextField {
                    id: signatureInput
                    placeholderText: "请输入签名"
                    Layout.fillWidth: true
                    font.pixelSize: 14
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
                        font.pixelSize: 14
                        background: Rectangle {
                            color: ThemeManager.surfaceElement1
                            radius: 5
                        }
                        contentItem: Text {
                            text: parent.text
                            color: ThemeManager.color0
                            font.pixelSize: parent.font.pixelSize
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: userDialog.close()
                    }

                    Button {
                        text: "保存"
                        font.pixelSize: 14
                        background: Rectangle {
                            color: ThemeManager.color4
                            radius: 5
                        }
                        contentItem: Text {
                            text: parent.text
                            color: ThemeManager.surfaceElement0
                            font.pixelSize: parent.font.pixelSize
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: {
                            if (currentUserId === -1) {
                                // 创建新用户
                                if (UserManager.createUser(nameInput.text, signatureInput.text)) {
                                    userDialog.close()
                                }
                            } else {
                                // 更新用户信息
                                if (UserManager.updateUserName(currentUserId, nameInput.text) &&
                                    UserManager.updateUserSignature(currentUserId, signatureInput.text)) {
                                    userDialog.close()
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // 删除确认对话框
    Dialog {
        id: deleteConfirmDialog
        title: "确认删除"
        modal: true
        anchors.centerIn: parent
        width: 300
        height: 150

        property int userId: -1

        Rectangle {
            anchors.fill: parent
            color: ThemeManager.surfaceElement0
            radius: 10

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15

                Text {
                    text: "确定要删除这个用户吗？"
                    font.pixelSize: 14
                    color: ThemeManager.color0
                    Layout.alignment: Qt.AlignHCenter
                }

                RowLayout {
                    Layout.alignment: Qt.AlignRight
                    spacing: 10

                    Button {
                        text: "取消"
                        font.pixelSize: 14
                        background: Rectangle {
                            color: ThemeManager.surfaceElement1
                            radius: 5
                        }
                        contentItem: Text {
                            text: parent.text
                            color: ThemeManager.color0
                            font.pixelSize: parent.font.pixelSize
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: deleteConfirmDialog.close()
                    }

                    Button {
                        text: "删除"
                        font.pixelSize: 14
                        background: Rectangle {
                            color: ThemeManager.color1
                            radius: 5
                        }
                        contentItem: Text {
                            text: parent.text
                            color: ThemeManager.surfaceElement0
                            font.pixelSize: parent.font.pixelSize
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: {
                            if (UserManager.deleteUser(deleteConfirmDialog.userId)) {
                                deleteConfirmDialog.close()
                            }
                        }
                    }
                }
            }
        }
    }

    // 属性
    property int currentUserId: -1

    // 初始化
    Component.onCompleted: {
        updateUserList()
    }

    // 监听用户列表变化
    Connections {
        target: UserManager
        function onUserListChanged() {
            updateUserList()
        }
    }

    // 更新用户列表
    function updateUserList() {
        userListView.model.clear()
        const users = UserManager.getAllUsers()
        for (let i = 0; i < users.length; i++) {
            userListView.model.append(users[i])
        }
    }
}
