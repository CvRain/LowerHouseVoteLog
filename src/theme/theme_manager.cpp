//
// Created by cvrain on 25-5-13.
//

#include "theme_manager.hpp"
#include <iostream>

ThemeManager *ThemeManager::instance = nullptr;

ThemeManager* ThemeManager::getInstance() {
    if (!instance) {
        instance = new ThemeManager();
    }
    return instance;
}

ThemeManager* ThemeManager::create(const QQmlEngine *engine, const QJSEngine *scriptEngine) {
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    return getInstance();
}

QString ThemeManager::testHelloWorld() {
    return "Hello World";
}

void ThemeManager::setThemeType(const ThemeType type) {
    this->currentType = type;
    std::cout << "set theme type: " << static_cast<int>(type) << std::endl;
    currentThemeTypeChanged();
}

ThemeManager::ThemeType ThemeManager::getThemeType() const {
    return currentType;
}

const Palette* ThemeManager::getCurrentPalette() const {
    return palettes.at(currentType);
}

ThemeManager::ThemeManager(QObject *parent) : QObject(parent) {
    frappePalette = std::make_unique<FrappeLatte>();
    lattePalette = std::make_unique<LattePalette>();
    mochaPalette = std::make_unique<MochaPalette>();
    macchiatoPalette = std::make_unique<MacchiatoPalette>();

    palettes.insert(std::make_pair(ThemeType::Frappe, frappePalette.get()));
    palettes.insert(std::make_pair(ThemeType::Latte, lattePalette.get()));
    palettes.insert(std::make_pair(ThemeType::Mocha, mochaPalette.get()));
    palettes.insert(std::make_pair(ThemeType::Macchiato, macchiatoPalette.get()));
}

QColor ThemeManager::GetRosewater() const {
    return getCurrentPalette()->rosewater;
}

QColor ThemeManager::GetFlamingo() const {
    return getCurrentPalette()->flamingo;
}

QColor ThemeManager::GetPink() const {
    return getCurrentPalette()->pink;
}

QColor ThemeManager::GetMauve() const {
    return getCurrentPalette()->mauve;
}

QColor ThemeManager::GetRed() const {
    return getCurrentPalette()->red;
}

QColor ThemeManager::GetMaroon() const {
    return getCurrentPalette()->maroon;
}

QColor ThemeManager::GetPeach() const {
    return getCurrentPalette()->peach;
}

QColor ThemeManager::GetYellow() const {
    return getCurrentPalette()->yellow;
}

QColor ThemeManager::GetGreen() const {
    return getCurrentPalette()->green;
}

QColor ThemeManager::GetTeal() const {
    return getCurrentPalette()->teal;
}

QColor ThemeManager::GetSky() const {
    return getCurrentPalette()->sky;
}

QColor ThemeManager::GetSapphire() const {
    return getCurrentPalette()->sapphire;
}

QColor ThemeManager::GetBlue() const {
    return getCurrentPalette()->blue;
}

QColor ThemeManager::GetLavender() const {
    return getCurrentPalette()->lavender;
}

QColor ThemeManager::GetText() const {
    return getCurrentPalette()->text;
}

QColor ThemeManager::GetSubtext1() const {
    return getCurrentPalette()->subtext1;
}

QColor ThemeManager::GetSubtext0() const {
    return getCurrentPalette()->subtext0;
}

QColor ThemeManager::GetOverlay2() const {
    return getCurrentPalette()->overlay2;
}

QColor ThemeManager::GetOverlay1() const {
    return getCurrentPalette()->overlay1;
}

QColor ThemeManager::GetOverlay0() const {
    return getCurrentPalette()->overlay0;
}

QColor ThemeManager::GetSurface2() const {
    return getCurrentPalette()->surface2;
}

QColor ThemeManager::GetSurface1() const {
    return getCurrentPalette()->surface1;
}

QColor ThemeManager::GetSurface0() const {
    return getCurrentPalette()->surface0;
}

QColor ThemeManager::GetBase() const {
    return getCurrentPalette()->base;
}

QColor ThemeManager::GetMantle() const {
    return getCurrentPalette()->mantle;
}

QColor ThemeManager::GetCrust() const {
    return getCurrentPalette()->crust;
}
