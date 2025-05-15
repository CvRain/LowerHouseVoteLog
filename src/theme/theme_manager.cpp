//
// Created by CvRai on 25-5-14.
//

#include "theme_manager.hpp"

#include <iostream>

#include "theme/palette_manager.hpp"

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

void ThemeManager::themeChangedMessage() {
    qDebug() << "ThemeManager::themeChangedMessage: " << PaletteManager::getInstance()->getCurrentPaletteText();
    std::cout << "ThemeManager::themeChangedMessage: "
              << PaletteManager::getInstance()->getCurrentPaletteText().toStdString() << std::endl;
}

void ThemeManager::setTheme(PaletteManager::ThemeType type) {
    PaletteManager::getInstance()->setCurrentPalette(type);
    emit themeChanged();
}
