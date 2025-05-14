//
// Created by CvRai on 25-5-14.
//

#include "theme_manager.hpp"

ThemeManager* ThemeManager::instance = nullptr;

ThemeManager* ThemeManager::getInstance()
{
    if (instance == nullptr)
    {
        instance = new ThemeManager();
    }
    return instance;
}

ThemeManager* ThemeManager::create(QQmlEngine*, QJSEngine*)
{
    return getInstance();
}

void ThemeManager::changeTheme(const ThemeType type)
{
    qDebug() << "change new type: " << type;
    currentThemeType = type;
    currentPalette = &palettes.at(type);
    emit themeChanged();
}

Palette* ThemeManager::getCurrentPalette() const
{
    return currentPalette;
}


QString ThemeManager::getThemeText(const ThemeType type) const
{
    return themeTexts.at(type);
}

QString ThemeManager::getCurrentThemeText() const
{
    const auto result =  themeTexts.at(currentThemeType);
    qDebug() << "ThemeManager::getCurrentThemeText: " << result;
    return result;
}

ThemeManager::ThemeType ThemeManager::getCurrentThemeType() const
{
    return currentThemeType;
}

ThemeManager::ThemeManager(QObject* parent)
{
    this->palettes.insert(std::make_pair(ThemeType::Frappe, generateFrappePalette()));
    this->palettes.insert(std::make_pair(ThemeType::Latte, generateLattePalette()));
    this->palettes.insert(std::make_pair(ThemeType::Macchiato, generateMacchiatoPalette()));
    this->palettes.insert(std::make_pair(ThemeType::Mocha, generateMochaPalette()));

    currentPalette = &palettes.at(ThemeType::Latte);
    currentThemeType = ThemeType::Latte;

    themeTexts.insert(std::make_pair(ThemeType::Frappe, "Frappe"));
    themeTexts.insert(std::make_pair(ThemeType::Latte, "Latte"));
    themeTexts.insert(std::make_pair(ThemeType::Macchiato, "Macchiato"));
    themeTexts.insert(std::make_pair(ThemeType::Mocha, "Mocha"));
}

QColor ThemeManager::GetRosewater() const
{
    return getCurrentPalette()->rosewater;
}

QColor ThemeManager::GetFlamingo() const
{
    return getCurrentPalette()->flamingo;
}

QColor ThemeManager::GetPink() const
{
    return getCurrentPalette()->pink;
}

QColor ThemeManager::GetMauve() const
{
    return getCurrentPalette()->mauve;
}

QColor ThemeManager::GetRed() const
{
    return getCurrentPalette()->red;
}

QColor ThemeManager::GetMaroon() const
{
    return getCurrentPalette()->maroon;
}

QColor ThemeManager::GetPeach() const
{
    return getCurrentPalette()->peach;
}

QColor ThemeManager::GetYellow() const
{
    return getCurrentPalette()->yellow;
}

QColor ThemeManager::GetGreen() const
{
    return getCurrentPalette()->green;
}

QColor ThemeManager::GetTeal() const
{
    return getCurrentPalette()->teal;
}

QColor ThemeManager::GetSky() const
{
    return getCurrentPalette()->sky;
}

QColor ThemeManager::GetSapphire() const
{
    return getCurrentPalette()->sapphire;
}

QColor ThemeManager::GetBlue() const
{
    return getCurrentPalette()->blue;
}

QColor ThemeManager::GetLavender() const
{
    return getCurrentPalette()->lavender;
}

QColor ThemeManager::GetText() const
{
    return getCurrentPalette()->text;
}

QColor ThemeManager::GetSubtext1() const
{
    return getCurrentPalette()->subtext1;
}

QColor ThemeManager::GetSubtext0() const
{
    return getCurrentPalette()->subtext0;
}

QColor ThemeManager::GetOverlay2() const
{
    return getCurrentPalette()->overlay2;
}

QColor ThemeManager::GetOverlay1() const
{
    return getCurrentPalette()->overlay1;
}

QColor ThemeManager::GetOverlay0() const
{
    return getCurrentPalette()->overlay0;
}

QColor ThemeManager::GetSurface2() const
{
    return getCurrentPalette()->surface2;
}

QColor ThemeManager::GetSurface1() const
{
    return getCurrentPalette()->surface1;
}

QColor ThemeManager::GetSurface0() const
{
    return getCurrentPalette()->surface0;
}

QColor ThemeManager::GetBase() const
{
    return getCurrentPalette()->base;
}

QColor ThemeManager::GetMantle() const
{
    return getCurrentPalette()->mantle;
}

QColor ThemeManager::GetCrust() const
{
    return getCurrentPalette()->crust;
}
