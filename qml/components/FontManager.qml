pragma Singleton

import QtQuick

QtObject {
    id: root

    property FontLoader caskaydiaCoveBold: FontLoader {
        source: "qrc:/res/fonts/CaskaydiaCoveNerdFont-Bold.ttf"
    }
    
    property FontLoader caskaydiaCoveBoldItalic: FontLoader {
        source: "qrc:/res/fonts/CaskaydiaCoveNerdFont-BoldItalic.ttf"
    }
    
    property FontLoader caskaydiaCoveExtraLight: FontLoader {
        source: "qrc:/res/fonts/CaskaydiaCoveNerdFont-ExtraLight.ttf"
    }
    
    property FontLoader caskaydiaCoveExtraLightItalic: FontLoader {
        source: "qrc:/res/fonts/CaskaydiaCoveNerdFont-ExtraLightItalic.ttf"
    }
    
    property FontLoader caskaydiaCoveItalic: FontLoader {
        source: "qrc:/res/fonts/CaskaydiaCoveNerdFont-Italic.ttf"
    }
    
    property FontLoader caskaydiaCoveLight: FontLoader {
        source: "qrc:/res/fonts/CaskaydiaCoveNerdFont-Light.ttf"
    }
    
    property FontLoader caskaydiaCoveLightItalic: FontLoader {
        source: "qrc:/res/fonts/CaskaydiaCoveNerdFont-LightItalic.ttf"
    }
    
    property FontLoader caskaydiaCoveRegular: FontLoader {
        source: "qrc:/res/fonts/CaskaydiaCoveNerdFont-Regular.ttf"
    }

    property FontLoader hanYi: FontLoader {
        source: "qrc:/res/fonts/HanYi.ttf"
    }
}
