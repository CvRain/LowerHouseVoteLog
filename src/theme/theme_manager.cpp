//
// Created by CvRai on 25-5-14.
//

#include "theme_manager.hpp"

#include <iostream>
#include <QQmlEngine>
#include <QJSEngine>

#include "theme/palette_manager.hpp"

QColor setColorAlpha(const QColor& color, const int alpha) {
    auto newColor = color;
    newColor.setAlpha(alpha);
    return newColor;
}

ThemeManager* ThemeManager::instance = nullptr;

ThemeManager* ThemeManager::getInstance() {
    if (instance == nullptr) {
        instance = new ThemeManager();
    }
    return instance;
}

ThemeManager* ThemeManager::create(QQmlEngine*, QJSEngine*) { return getInstance(); }

ThemeManager::ThemeManager(QObject* parent) {
    connect(PaletteManager::getInstance(), &PaletteManager::paletteChanged, this, &ThemeManager::themeChanged);
    connect(this, &ThemeManager::themeChanged, this, &ThemeManager::themeChangedMessage);
}

QColor ThemeManager::getBackgroundPanel() { return PaletteManager::getInstance()->GetBase(); }
QColor ThemeManager::getSecondaryPanel0() { return PaletteManager::getInstance()->GetCrust(); }
QColor ThemeManager::getSecondaryPanel1() { return PaletteManager::getInstance()->GetMantle(); }
QColor ThemeManager::getSurfaceElement0() { return PaletteManager::getInstance()->GetSurface0(); }
QColor ThemeManager::getSurfaceElement1() { return PaletteManager::getInstance()->GetSurface1(); }
QColor ThemeManager::getSurfaceElement2() { return PaletteManager::getInstance()->GetSurface2(); }
QColor ThemeManager::getOverlay0() { return PaletteManager::getInstance()->GetOverlay0(); }
QColor ThemeManager::getOverlay1() { return PaletteManager::getInstance()->GetOverlay1(); }
QColor ThemeManager::getOverlay2() { return PaletteManager::getInstance()->GetOverlay2(); }
QColor ThemeManager::getBodyCopy() { return PaletteManager::getInstance()->GetText(); }
QColor ThemeManager::getMainHeadline() { return PaletteManager::getInstance()->GetText(); }
QColor ThemeManager::getLabel0() { return PaletteManager::getInstance()->GetSubtext0(); }
QColor ThemeManager::getLabel1() { return PaletteManager::getInstance()->GetSubtext1(); }
QColor ThemeManager::getSubHeadline0() { return PaletteManager::getInstance()->GetSubtext0(); }
QColor ThemeManager::getSubHeadline1() { return PaletteManager::getInstance()->GetSubtext1(); }
QColor ThemeManager::getSubtle() { return PaletteManager::getInstance()->GetOverlay1(); }
QColor ThemeManager::getLink() { return PaletteManager::getInstance()->GetBlue(); }
QColor ThemeManager::getSuccess() { return PaletteManager::getInstance()->GetGreen(); }
QColor ThemeManager::getWarning() { return PaletteManager::getInstance()->GetYellow(); }
QColor ThemeManager::getError() { return PaletteManager::getInstance()->GetRed(); }
QColor ThemeManager::getTags() { return PaletteManager::getInstance()->GetBlue(); }
QColor ThemeManager::getSelectionBackground() { return setColorAlpha(PaletteManager::getInstance()->GetBlue(), 33); }
QColor ThemeManager::getCursor() { return PaletteManager::getInstance()->GetRosewater(); }
QColor ThemeManager::getCursorText() {
    return PaletteManager::getInstance()->getCurrentPaletteType() == PaletteManager::ThemeType::Latte
                   ? PaletteManager::getInstance()->GetBase()
                   : PaletteManager::getInstance()->GetCrust();
}
QColor ThemeManager::getActiveBorder() {return PaletteManager::getInstance()->GetLavender();}
QColor ThemeManager::getInactiveBorder() { return PaletteManager::getInstance()->GetOverlay0(); }
QColor ThemeManager::getBellBorder() { return PaletteManager::getInstance()->GetYellow(); }
QColor ThemeManager::getColor0() {return PaletteManager::getInstance()->GetSubtext1();}
QColor ThemeManager::getColor1() {return PaletteManager::getInstance()->GetRed();}
QColor ThemeManager::getColor2() {return PaletteManager::getInstance()->GetGreen();}
QColor ThemeManager::getColor3() {return PaletteManager::getInstance()->GetYellow();}
QColor ThemeManager::getColor4() {return PaletteManager::getInstance()->GetBlue();}
QColor ThemeManager::getColor5() {return PaletteManager::getInstance()->GetPink();}
QColor ThemeManager::getColor6() {return PaletteManager::getInstance()->GetTeal();}
QColor ThemeManager::getColor7() {return PaletteManager::getInstance()->GetSurface2();}
QColor ThemeManager::getColor8() {return PaletteManager::getInstance()->GetSubtext0();}
QColor ThemeManager::getColor9() {return PaletteManager::getInstance()->GetRed().lighter();}
QColor ThemeManager::getColor10() {return PaletteManager::getInstance()->GetGreen().lighter();}
QColor ThemeManager::getColor11() {return PaletteManager::getInstance()->GetYellow().lighter();}
QColor ThemeManager::getColor12() {return PaletteManager::getInstance()->GetBlue().lighter();}
QColor ThemeManager::getColor13() {return PaletteManager::getInstance()->GetPink().lighter();}
QColor ThemeManager::getColor14() {return PaletteManager::getInstance()->GetTeal().lighter();}
QColor ThemeManager::getColor15() {return PaletteManager::getInstance()->GetSurface1();}
QColor ThemeManager::getColor16() {return PaletteManager::getInstance()->GetPeach();}
QColor ThemeManager::getColor17() {return PaletteManager::getInstance()->GetRosewater();}
QColor ThemeManager::getMark1() {return PaletteManager::getInstance()->GetLavender();}
QColor ThemeManager::getMark1Text() {return PaletteManager::getInstance()->GetBase();}
QColor ThemeManager::getMark2() {return PaletteManager::getInstance()->GetMauve();}
QColor ThemeManager::getMark2Text() {return PaletteManager::getInstance()->GetBase();}
QColor ThemeManager::getMark3() {return PaletteManager::getInstance()->GetSapphire();}
QColor ThemeManager::getMark3Text() {return PaletteManager::getInstance()->GetBase();}

void ThemeManager::themeChangedMessage() {
    qDebug() << "ThemeManager::themeChangedMessage: " << PaletteManager::getInstance()->getCurrentPaletteText();
    std::cout << "ThemeManager::themeChangedMessage: "
              << PaletteManager::getInstance()->getCurrentPaletteText().toStdString() << std::endl;
}

void ThemeManager::setTheme(PaletteManager::ThemeType type) {
    PaletteManager::getInstance()->setCurrentPalette(type);
    emit themeChanged();
}
