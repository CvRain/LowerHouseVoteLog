//
// Created by cvrain on 25-5-15.
//

#include "palette_manager.hpp"

PaletteManager *PaletteManager::instance = nullptr;

PaletteManager *PaletteManager::getInstance() {
    if (instance == nullptr) {
        instance = new PaletteManager();
    }
    return instance;
}

PaletteManager *PaletteManager::create(const QQmlEngine *engine, const QJSEngine *scriptEngine) {
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    return getInstance();
}

QString PaletteManager::getCurrentPaletteText() { return themeTexts.at(currentThemeType); }

void PaletteManager::setCurrentPalette(const ThemeType type) {
    if (type == currentThemeType) {
        return;
    }
    qDebug() << "set new palette type: " << type;
    currentThemeType = type;
    updateCurrentTheme();
    emit paletteChanged();
}

PaletteManager::ThemeType PaletteManager::getCurrentPaletteType() const { return currentThemeType; }

void PaletteManager::updateCurrentTheme() {
    qDebug() << "palette changed update current theme";
    currentPalette = &palettes.at(currentThemeType);
}

Palette *PaletteManager::getCurrentPalette() const { return currentPalette; }

PaletteManager::PaletteManager(QObject *parent) : QObject(parent) {
    //todo
    //connect(this, &PaletteManager::paletteChanged, this, &PaletteManager::updateCurrentTheme);

    this->palettes.insert(std::make_pair(ThemeType::Frappe, generateFrappePalette()));
    this->palettes.insert(std::make_pair(ThemeType::Latte, generateLattePalette()));
    this->palettes.insert(std::make_pair(ThemeType::Macchiato, generateMacchiatoPalette()));
    this->palettes.insert(std::make_pair(ThemeType::Mocha, generateMochaPalette()));

    currentPalette   = &palettes.at(ThemeType::Latte);
    currentThemeType = ThemeType::Latte;
    updateCurrentTheme();

    themeTexts.insert(std::make_pair(ThemeType::Frappe, "Frappe"));
    themeTexts.insert(std::make_pair(ThemeType::Latte, "Latte"));
    themeTexts.insert(std::make_pair(ThemeType::Macchiato, "Macchiato"));
    themeTexts.insert(std::make_pair(ThemeType::Mocha, "Mocha"));
}

QColor PaletteManager::GetRosewater() const { return getCurrentPalette()->rosewater; }

QColor PaletteManager::GetFlamingo() const { return getCurrentPalette()->flamingo; }

QColor PaletteManager::GetPink() const { return getCurrentPalette()->pink; }

QColor PaletteManager::GetMauve() const { return getCurrentPalette()->mauve; }

QColor PaletteManager::GetRed() const { return getCurrentPalette()->red; }

QColor PaletteManager::GetMaroon() const { return getCurrentPalette()->maroon; }

QColor PaletteManager::GetPeach() const { return getCurrentPalette()->peach; }

QColor PaletteManager::GetYellow() const { return getCurrentPalette()->yellow; }

QColor PaletteManager::GetGreen() const { return getCurrentPalette()->green; }

QColor PaletteManager::GetTeal() const { return getCurrentPalette()->teal; }

QColor PaletteManager::GetSky() const { return getCurrentPalette()->sky; }

QColor PaletteManager::GetSapphire() const { return getCurrentPalette()->sapphire; }

QColor PaletteManager::GetBlue() const { return getCurrentPalette()->blue; }

QColor PaletteManager::GetLavender() const { return getCurrentPalette()->lavender; }

QColor PaletteManager::GetText() const { return getCurrentPalette()->text; }

QColor PaletteManager::GetSubtext1() const { return getCurrentPalette()->subtext1; }

QColor PaletteManager::GetSubtext0() const { return getCurrentPalette()->subtext0; }

QColor PaletteManager::GetOverlay2() const { return getCurrentPalette()->overlay2; }

QColor PaletteManager::GetOverlay1() const { return getCurrentPalette()->overlay1; }

QColor PaletteManager::GetOverlay0() const { return getCurrentPalette()->overlay0; }

QColor PaletteManager::GetSurface2() const { return getCurrentPalette()->surface2; }

QColor PaletteManager::GetSurface1() const { return getCurrentPalette()->surface1; }

QColor PaletteManager::GetSurface0() const { return getCurrentPalette()->surface0; }

QColor PaletteManager::GetBase() const { return getCurrentPalette()->base; }

QColor PaletteManager::GetMantle() const { return getCurrentPalette()->mantle; }

QColor PaletteManager::GetCrust() const { return getCurrentPalette()->crust; }
