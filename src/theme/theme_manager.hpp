//
// Created by CvRai on 25-5-14.
//

#ifndef THEME_MANAGER_HPP
#define THEME_MANAGER_HPP

#include <QObject>
#include <QQmlEngine>
#include <QJSEngine>
#include <QString>
#include <map>

#include "palette.hpp"

class ThemeManager : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
    Q_PROPERTY(QColor rosewater READ GetRosewater NOTIFY themeChanged)
    Q_PROPERTY(QColor flamingo READ GetFlamingo NOTIFY themeChanged)
    Q_PROPERTY(QColor pink READ GetPink NOTIFY themeChanged)
    Q_PROPERTY(QColor mauve READ GetMauve NOTIFY themeChanged)
    Q_PROPERTY(QColor red READ GetRed NOTIFY themeChanged)
    Q_PROPERTY(QColor maroon READ GetMaroon NOTIFY themeChanged)
    Q_PROPERTY(QColor peach READ GetPeach NOTIFY themeChanged)
    Q_PROPERTY(QColor yellow READ GetYellow NOTIFY themeChanged)
    Q_PROPERTY(QColor green READ GetGreen NOTIFY themeChanged)
    Q_PROPERTY(QColor teal READ GetTeal NOTIFY themeChanged)
    Q_PROPERTY(QColor sky READ GetSky NOTIFY themeChanged)
    Q_PROPERTY(QColor sapphire READ GetSapphire NOTIFY themeChanged)
    Q_PROPERTY(QColor blue READ GetBlue NOTIFY themeChanged)
    Q_PROPERTY(QColor lavender READ GetLavender NOTIFY themeChanged)
    Q_PROPERTY(QColor text READ GetText NOTIFY themeChanged)
    Q_PROPERTY(QColor subtext1 READ GetSubtext1 NOTIFY themeChanged)
    Q_PROPERTY(QColor subtext0 READ GetSubtext0 NOTIFY themeChanged)
    Q_PROPERTY(QColor overlay2 READ GetOverlay2 NOTIFY themeChanged)
    Q_PROPERTY(QColor overlay1 READ GetOverlay1 NOTIFY themeChanged)
    Q_PROPERTY(QColor overlay0 READ GetOverlay0 NOTIFY themeChanged)
    Q_PROPERTY(QColor surface2 READ GetSurface2 NOTIFY themeChanged)
    Q_PROPERTY(QColor surface1 READ GetSurface1 NOTIFY themeChanged)
    Q_PROPERTY(QColor surface0 READ GetSurface0 NOTIFY themeChanged)
    Q_PROPERTY(QColor base READ GetBase NOTIFY themeChanged)
    Q_PROPERTY(QColor mantle READ GetMantle NOTIFY themeChanged)
    Q_PROPERTY(QColor crust READ GetCrust NOTIFY themeChanged)

    Q_PROPERTY(QString currentThemeText READ getCurrentThemeText NOTIFY themeChanged)

    Q_PROPERTY(ThemeType currentThemeType READ getCurrentThemeType WRITE changeTheme NOTIFY themeChanged)

public:
    enum class ThemeType: int
    {
        Frappe,
        Latte,
        Macchiato,
        Mocha
    };

    Q_ENUM(ThemeType)

    static ThemeManager* getInstance();
    static ThemeManager* create(QQmlEngine*, QJSEngine*);

    [[nodiscard]] Q_INVOKABLE QString getThemeText(ThemeType type) const;
    [[nodiscard]] Q_INVOKABLE QString getCurrentThemeText() const;
    [[nodiscard]] Q_INVOKABLE ThemeType getCurrentThemeType() const;

    [[nodiscard]] Palette* getCurrentPalette() const;
    Q_INVOKABLE void changeTheme(ThemeType type);

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
    void themeChanged();

private:
    explicit ThemeManager(QObject* parent = nullptr);
    static ThemeManager* instance;
    ThemeType currentThemeType;
    Palette* currentPalette = nullptr;

    std::map<ThemeType, Palette> palettes;
    std::map<ThemeType, QString> themeTexts;
};


#endif //THEME_MANAGER_HPP
