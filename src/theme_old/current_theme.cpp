//
// Created by cvrain on 25-5-13.
//

#include "current_theme.hpp"

CurrentTheme::CurrentTheme(QObject *parent) {
    connect(ThemeManager::getInstance(), &ThemeManager::currentThemeTypeChanged, this, &CurrentTheme::themeChanged);
    onThemeChanged();
}

void CurrentTheme::onThemeChanged() {
    qDebug() << "CurrentTheme::onThemeChanged called";
    auto* themeManager = ThemeManager::getInstance();
    qDebug() << "ThemeManager instance:" << themeManager;
    
    rosewater = themeManager->GetRosewater();
    flamingo = themeManager->GetFlamingo();
    pink = themeManager->GetPink();
    mauve = themeManager->GetMauve();
    red = themeManager->GetRed();
    maroon = themeManager->GetMaroon();
    peach = themeManager->GetPeach();
    yellow = themeManager->GetYellow();
    green = themeManager->GetGreen();
    teal = themeManager->GetTeal();
    sky = themeManager->GetSky();
    sapphire = themeManager->GetSapphire();
    blue = themeManager->GetBlue();
    lavender = themeManager->GetLavender();
    text = themeManager->GetText();
    subtext1 = themeManager->GetSubtext1();
    subtext0 = themeManager->GetSubtext0();
    overlay2 = themeManager->GetOverlay2();
    overlay1 = themeManager->GetOverlay1();
    overlay0 = themeManager->GetOverlay0();
    surface2 = themeManager->GetSurface2();
    surface1 = themeManager->GetSurface1();
    surface0 = themeManager->GetSurface0();
    base = themeManager->GetBase();
    mantle = themeManager->GetMantle();
    crust = themeManager->GetCrust();
    
    qDebug() << "New base color:" << base;
    emit themeChanged();
    qDebug() << "Theme change signal emitted";
}

QColor CurrentTheme::GetRosewater() const{
    return rosewater;
}
QColor CurrentTheme::GetFlamingo() const{
    return flamingo;
}
QColor CurrentTheme::GetPink() const{
    qDebug() << "GetPink" << pink;
    return pink;
}
QColor CurrentTheme::GetMauve() const{
    return mauve;
}
QColor CurrentTheme::GetRed() const{
    return red;
}
QColor CurrentTheme::GetMaroon() const{
    return maroon;
}
QColor CurrentTheme::GetPeach() const{
    qDebug() << "GetPeach" << peach;
    return peach;
}
QColor CurrentTheme::GetYellow() const{
    return yellow;
}
QColor CurrentTheme::GetGreen() const{
    return green;
}
QColor CurrentTheme::GetTeal() const{
    return teal;
}
QColor CurrentTheme::GetSky() const{
    return sky;
}
QColor CurrentTheme::GetSapphire() const{
    return sapphire;
}
QColor CurrentTheme::GetBlue() const{
    return blue;
}
QColor CurrentTheme::GetLavender() const{
    return lavender;
}
QColor CurrentTheme::GetText() const{
    return text;
}
QColor CurrentTheme::GetSubtext1() const{
    return subtext1;
}
QColor CurrentTheme::GetSubtext0() const{
    return subtext0;
}
QColor CurrentTheme::GetOverlay2() const{
    return overlay2;
}
QColor CurrentTheme::GetOverlay1() const{
    return overlay1;
}
QColor CurrentTheme::GetOverlay0() const{
    return overlay0;
}
QColor CurrentTheme::GetSurface2() const{
    return surface2;
}
QColor CurrentTheme::GetSurface1() const{
    return surface1;
}
QColor CurrentTheme::GetSurface0() const{
    return surface0;
}
QColor CurrentTheme::GetBase() const{
    return base;
}
QColor CurrentTheme::GetMantle() const{
    return mantle;
}
QColor CurrentTheme::GetCrust() const{
    return crust;
}