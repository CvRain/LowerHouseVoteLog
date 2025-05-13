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

public:
    enum class ThemeType: int {
        Frappe,
        Latte,
        Macchiato,
        Mocha
    };

    Q_PROPERTY(ThemeType currentThemeType READ getThemeType WRITE setThemeType NOTIFY currentThemeTypeChanged FINAL)
    Q_PROPERTY(Palette currentType READ getCurrentPalette)
    Q_PROPERTY(QColor rosewater READ GetRosewater FINAL)
    Q_PROPERTY(QColor flamingo READ GetFlamingo FINAL)
    Q_PROPERTY(QColor pink READ GetPink FINAL)
    Q_PROPERTY(QColor mauve READ GetMauve FINAL)
    Q_PROPERTY(QColor red READ GetRed FINAL)
    Q_PROPERTY(QColor maroon READ GetMaroon FINAL)
    Q_PROPERTY(QColor peach READ GetPeach FINAL)
    Q_PROPERTY(QColor yellow READ GetYellow FINAL)
    Q_PROPERTY(QColor green READ GetGreen FINAL)
    Q_PROPERTY(QColor teal READ GetTeal FINAL)
    Q_PROPERTY(QColor sky READ GetSky FINAL)
    Q_PROPERTY(QColor sapphire READ GetSapphire FINAL)
    Q_PROPERTY(QColor blue READ GetBlue FINAL)
    Q_PROPERTY(QColor lavender READ GetLavender FINAL)
    Q_PROPERTY(QColor text READ GetText FINAL)
    Q_PROPERTY(QColor subtext1 READ GetSubtext1 FINAL)
    Q_PROPERTY(QColor subtext0 READ GetSubtext0 FINAL)
    Q_PROPERTY(QColor overlay2 READ GetOverlay2 FINAL)
    Q_PROPERTY(QColor overlay1 READ GetOverlay1 FINAL)
    Q_PROPERTY(QColor overlay0 READ GetOverlay0 FINAL)
    Q_PROPERTY(QColor surface2 READ GetSurface2 FINAL)
    Q_PROPERTY(QColor surface1 READ GetSurface1 FINAL)
    Q_PROPERTY(QColor surface0 READ GetSurface0 FINAL)
    Q_PROPERTY(QColor base READ GetBase FINAL)
    Q_PROPERTY(QColor mantle READ GetMantle FINAL)
    Q_PROPERTY(QColor crust READ GetCrust FINAL)


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

    std::map<ThemeType, Palette *> palettes;
    std::unique_ptr<Palette> frappePalette;
    std::unique_ptr<Palette> lattePalette;
    std::unique_ptr<Palette> macchiatoPalette;
    std::unique_ptr<Palette> mochaPalette;
};


#endif //THEME_MANAGER_HPP
