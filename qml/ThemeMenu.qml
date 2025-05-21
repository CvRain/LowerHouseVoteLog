import QtQuick

// 主题选择轨道
Item {
    id: themeMenu
    visible: false
    width: 200
    height: 200
    z: 1

    property var themeButtons: []
    property int animationDelay: 100 // 每个按钮的动画延迟时间

    // 监听侧边栏的展开状态
    Connections {
        target: sidebar
        function onExpandedChanged() {
            if (!expanded) {
                themeMenu.visible = false
            }
        }
    }

    function startAnimations() {
        for (var i = 0; i < themeButtons.length; i++) {
            themeButtons[i].startAnimation(i * animationDelay)
        }
    }

    Component.onCompleted: {
        var themes = [{
                          "text": "Latte",
                          "theme": PaletteManager.Latte,
                          "icon": "☕"
                      }, {
                          "text": "Frappe",
                          "theme": PaletteManager.Frappe,
                          "icon": "🍹"
                      }, {
                          "text": "Macchiato",
                          "theme": PaletteManager.Macchiato,
                          "icon": "🥤"
                      }, {
                          "text": "Mocha",
                          "theme": PaletteManager.Mocha,
                          "icon": "🍫"
                      }]

        // 计算按钮位置，使其分布在9点到12点之间
        for (var i = 0; i < themes.length; i++) {
            // 将角度范围限制在180度到270度之间（9点到12点）
            var angle = (180 + (i * 90 / (themes.length - 1))) * Math.PI / 180
            var radius = 80 // 半径
            var x = Math.cos(angle) * radius
            var y = Math.sin(angle) * radius

            var button = themeButtonComponent.component.createObject(themeMenu,
                                                                     {
                                                                         "x": x + 150,
                                                                         "y": y + 150,
                                                                         "themeData": themes[i]
                                                                     })
            themeButtons.push(button)
        }
    }

    ThemeButtonComponent {
        id: themeButtonComponent
    }
}
