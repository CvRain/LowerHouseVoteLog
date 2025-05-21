//
// Created by cvrain on 25-5-15.
//

#ifndef PALETTE_MANAGER_HPP
#define PALETTE_MANAGER_HPP

#include <QObject>
#include <QQmlEngine>

#include "theme/palette.hpp"

class PaletteManager : public QObject {
    Q_OBJECT
    QML_SINGLETON
    QML_ELEMENT
    QML_NAMED_ELEMENT(PaletteManager)
    QML_UNCREATABLE("PaletteManager is a singleton")

    Q_PROPERTY(QColor rosewater READ GetRosewater NOTIFY paletteChanged)
    Q_PROPERTY(QColor flamingo READ GetFlamingo NOTIFY paletteChanged)
    Q_PROPERTY(QColor pink READ GetPink NOTIFY paletteChanged)
    Q_PROPERTY(QColor mauve READ GetMauve NOTIFY paletteChanged)
    Q_PROPERTY(QColor red READ GetRed NOTIFY paletteChanged)
    Q_PROPERTY(QColor maroon READ GetMaroon NOTIFY paletteChanged)
    Q_PROPERTY(QColor peach READ GetPeach NOTIFY paletteChanged)
    Q_PROPERTY(QColor yellow READ GetYellow NOTIFY paletteChanged)
    Q_PROPERTY(QColor green READ GetGreen NOTIFY paletteChanged)
    Q_PROPERTY(QColor teal READ GetTeal NOTIFY paletteChanged)
    Q_PROPERTY(QColor sky READ GetSky NOTIFY paletteChanged)
    Q_PROPERTY(QColor sapphire READ GetSapphire NOTIFY paletteChanged)
    Q_PROPERTY(QColor blue READ GetBlue NOTIFY paletteChanged)
    Q_PROPERTY(QColor lavender READ GetLavender NOTIFY paletteChanged)
    Q_PROPERTY(QColor text READ GetText NOTIFY paletteChanged)
    Q_PROPERTY(QColor subtext1 READ GetSubtext1 NOTIFY paletteChanged)
    Q_PROPERTY(QColor subtext0 READ GetSubtext0 NOTIFY paletteChanged)
    Q_PROPERTY(QColor overlay2 READ GetOverlay2 NOTIFY paletteChanged)
    Q_PROPERTY(QColor overlay1 READ GetOverlay1 NOTIFY paletteChanged)
    Q_PROPERTY(QColor overlay0 READ GetOverlay0 NOTIFY paletteChanged)
    Q_PROPERTY(QColor surface2 READ GetSurface2 NOTIFY paletteChanged)
    Q_PROPERTY(QColor surface1 READ GetSurface1 NOTIFY paletteChanged)
    Q_PROPERTY(QColor surface0 READ GetSurface0 NOTIFY paletteChanged)
    Q_PROPERTY(QColor base READ GetBase NOTIFY paletteChanged)
    Q_PROPERTY(QColor mantle READ GetMantle NOTIFY paletteChanged)
    Q_PROPERTY(QColor crust READ GetCrust NOTIFY paletteChanged)

    Q_PROPERTY(QString currentThemeText READ getCurrentPaletteText NOTIFY paletteChanged)
    Q_PROPERTY(ThemeType currentThemeType READ getCurrentPaletteType WRITE setCurrentPalette NOTIFY paletteChanged)
public:
    enum class ThemeType : int { Frappe, Latte, Macchiato, Mocha };
    Q_ENUM(ThemeType)

    static PaletteManager *getInstance();
    static PaletteManager *create(const QQmlEngine *engine, const QJSEngine *scriptEngine);

    QString getCurrentPaletteText();
    void    setCurrentPalette(ThemeType type);
    void    updateCurrentTheme();

    [[nodiscard]] Palette  *getCurrentPalette() const;
    [[nodiscard]] ThemeType getCurrentPaletteType() const;

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

public slots:
    void paletteChangedMessage();

signals:
    void paletteChanged();

private:
    explicit PaletteManager(QObject *parent = nullptr);
    static PaletteManager *instance;

    ThemeType currentThemeType;
    Palette  *currentPalette = nullptr;

    std::map<ThemeType, Palette> palettes;
    std::map<ThemeType, QString> themeTexts;
};


#endif  // PALETTE_MANAGER_HPP
