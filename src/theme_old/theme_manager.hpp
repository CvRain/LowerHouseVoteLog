//
// Created by cvrain on 25-5-13.
//

#ifndef THEME_MANAGER_HPP
#define THEME_MANAGER_HPP

#include <QObject>
#include <QQmlEngine>
#include <QJSEngine>
#include <map>

#include "theme/palette.hpp"

class ThemeManager : public QObject {
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
    Q_PROPERTY(ThemeType currentThemeType READ getThemeType WRITE setThemeType NOTIFY currentThemeTypeChanged FINAL)

public:
    enum class ThemeType: int {
        Frappe,
        Latte,
        Macchiato,
        Mocha
    };
    Q_ENUM(ThemeType)

    static ThemeManager* getInstance();

    static ThemeManager* create(const QQmlEngine *engine, const QJSEngine *scriptEngine);

    Q_INVOKABLE static QString testHelloWorld();

    void setThemeType(ThemeType type);

    [[nodiscard]] ThemeType getThemeType() const;

    [[nodiscard]] const Palette* getCurrentPalette() const;

    [[nodiscard]] QColor GetRosewater() const;
    [[nodiscard]] QColor GetFlamingo() const;
    [[nodiscard]] QColor GetPink() const;
    [[nodiscard]] QColor GetMauve() const;
    [[nodiscard]] QColor GetRed() const;
    [[nodiscard]] QColor GetMaroon() const;
    [[nodiscard]] QColor GetPeach() const;
    [[nodiscard]] QColor GetYellow() const;
    [[nodiscard]] QColor GetGreen() const;
    [[nodiscard]] QColor GetTeal() const;
    [[nodiscard]] QColor GetSky() const;
    [[nodiscard]] QColor GetSapphire() const;
    [[nodiscard]] QColor GetBlue() const;
    [[nodiscard]] QColor GetLavender() const;
    [[nodiscard]] QColor GetText() const;
    [[nodiscard]] QColor GetSubtext1() const;
    [[nodiscard]] QColor GetSubtext0() const;
    [[nodiscard]] QColor GetOverlay2() const;
    [[nodiscard]] QColor GetOverlay1() const;
    [[nodiscard]] QColor GetOverlay0() const;
    [[nodiscard]] QColor GetSurface2() const;
    [[nodiscard]] QColor GetSurface1() const;
    [[nodiscard]] QColor GetSurface0() const;
    [[nodiscard]] QColor GetBase() const;
    [[nodiscard]] QColor GetMantle() const;
    [[nodiscard]] QColor GetCrust() const;

signals:
    void currentThemeTypeChanged();

private:
    explicit ThemeManager(QObject *parent = nullptr);

    static ThemeManager *instance;
    ThemeType currentType = ThemeType::Frappe;

    std::map<ThemeType, Palette*> palettes;
    std::unique_ptr<Palette> frappePalette;
    std::unique_ptr<Palette> lattePalette;
    std::unique_ptr<Palette> macchiatoPalette;
    std::unique_ptr<Palette> mochaPalette;
};


#endif //THEME_MANAGER_HPP
