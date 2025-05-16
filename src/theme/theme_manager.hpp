//
// Created by CvRai on 25-5-14.
//

#ifndef THEME_MANAGER_HPP
#define THEME_MANAGER_HPP

#include <QJSEngine>
#include <QObject>
#include <QQmlEngine>
#include <QString>

#include "palette_manager.hpp"

class ThemeManager : public QObject {
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
    Q_PROPERTY(QColor backgroundPanel READ getBackgroundPanel NOTIFY themeChanged)
    Q_PROPERTY(QColor secondaryPanel0 READ getSecondaryPanel0 NOTIFY themeChanged)
    Q_PROPERTY(QColor secondaryPanel1 READ getSecondaryPanel1 NOTIFY themeChanged)
    Q_PROPERTY(QColor surfaceElement0 READ getSurfaceElement0 NOTIFY themeChanged)
    Q_PROPERTY(QColor surfaceElement1 READ getSurfaceElement1 NOTIFY themeChanged)
    Q_PROPERTY(QColor surfaceElement2 READ getSurfaceElement2 NOTIFY themeChanged)
    Q_PROPERTY(QColor overlay0 READ getOverlay0 NOTIFY themeChanged)
    Q_PROPERTY(QColor overlay1 READ getOverlay1 NOTIFY themeChanged)
    Q_PROPERTY(QColor overlay2 READ getOverlay2 NOTIFY themeChanged)
    Q_PROPERTY(QColor bodyCopy READ getBodyCopy NOTIFY themeChanged)
    Q_PROPERTY(QColor mainHeadline READ getMainHeadline NOTIFY themeChanged)
    Q_PROPERTY(QColor label0 READ getLabel0 NOTIFY themeChanged)
    Q_PROPERTY(QColor label1 READ getLabel1 NOTIFY themeChanged)
    Q_PROPERTY(QColor subHeadline0 READ getSubHeadline0 NOTIFY themeChanged)
    Q_PROPERTY(QColor subHeadline1 READ getSubHeadline1 NOTIFY themeChanged)
    Q_PROPERTY(QColor subtle READ getSubtle NOTIFY themeChanged)
    Q_PROPERTY(QColor link READ getLink NOTIFY themeChanged)
    Q_PROPERTY(QColor success READ getSuccess NOTIFY themeChanged)
    Q_PROPERTY(QColor warning READ getWarning NOTIFY themeChanged)
    Q_PROPERTY(QColor error READ getError NOTIFY themeChanged)
    Q_PROPERTY(QColor tags READ getTags NOTIFY themeChanged)
    Q_PROPERTY(QColor selectionBackground READ getSelectionBackground NOTIFY themeChanged)
    Q_PROPERTY(QColor cursor READ getCursor NOTIFY themeChanged)
    Q_PROPERTY(QColor cursorText READ getCursorText NOTIFY themeChanged)
    Q_PROPERTY(QColor activeBorder READ getActiveBorder NOTIFY themeChanged)
    Q_PROPERTY(QColor inactiveBorder READ getInactiveBorder NOTIFY themeChanged)
    Q_PROPERTY(QColor bellBorder READ getBellBorder NOTIFY themeChanged)
    Q_PROPERTY(QColor color0 READ getColor0 NOTIFY themeChanged)
    Q_PROPERTY(QColor color1 READ getColor1 NOTIFY themeChanged)
    Q_PROPERTY(QColor color2 READ getColor2 NOTIFY themeChanged)
    Q_PROPERTY(QColor color3 READ getColor3 NOTIFY themeChanged)
    Q_PROPERTY(QColor color4 READ getColor4 NOTIFY themeChanged)
    Q_PROPERTY(QColor color5 READ getColor5 NOTIFY themeChanged)
    Q_PROPERTY(QColor color6 READ getColor6 NOTIFY themeChanged)
    Q_PROPERTY(QColor color7 READ getColor7 NOTIFY themeChanged)
    Q_PROPERTY(QColor color8 READ getColor8 NOTIFY themeChanged)
    Q_PROPERTY(QColor color9 READ getColor9 NOTIFY themeChanged)
    Q_PROPERTY(QColor color10 READ getColor10 NOTIFY themeChanged)
    Q_PROPERTY(QColor color11 READ getColor11 NOTIFY themeChanged)
    Q_PROPERTY(QColor color12 READ getColor12 NOTIFY themeChanged)
    Q_PROPERTY(QColor color13 READ getColor13 NOTIFY themeChanged)
    Q_PROPERTY(QColor color14 READ getColor14 NOTIFY themeChanged)
    Q_PROPERTY(QColor color15 READ getColor15 NOTIFY themeChanged)
    Q_PROPERTY(QColor color16 READ getColor16 NOTIFY themeChanged)
    Q_PROPERTY(QColor color17 READ getColor17 NOTIFY themeChanged)
    Q_PROPERTY(QColor mark1 READ getMark1 NOTIFY themeChanged)
    Q_PROPERTY(QColor mark1Text READ getMark1Text NOTIFY themeChanged)
    Q_PROPERTY(QColor mark2 READ getMark2 NOTIFY themeChanged)
    Q_PROPERTY(QColor mark2Text READ getMark2Text NOTIFY themeChanged)
    Q_PROPERTY(QColor mark3 READ getMark3 NOTIFY themeChanged)
    Q_PROPERTY(QColor mark3Text READ getMark3Text NOTIFY themeChanged)

public:
    static ThemeManager *getInstance();
    static ThemeManager *create(QQmlEngine *, QJSEngine *);

    static QColor getBackgroundPanel();
    static QColor getSecondaryPanel0();
    static QColor getSecondaryPanel1();
    static QColor getSurfaceElement0();
    static QColor getSurfaceElement1();
    static QColor getSurfaceElement2();
    static QColor getOverlay0();
    static QColor getOverlay1();
    static QColor getOverlay2();
    static QColor getBodyCopy();
    static QColor getMainHeadline();
    static QColor getLabel0();
    static QColor getLabel1();
    static QColor getSubHeadline0();
    static QColor getSubHeadline1();
    static QColor getSubtle();
    static QColor getLink();
    static QColor getSuccess();
    static QColor getWarning();
    static QColor getError();
    static QColor getTags();
    static QColor getSelectionBackground();
    static QColor getCursor();
    static QColor getCursorText();
    static QColor getActiveBorder();
    static QColor getInactiveBorder();
    static QColor getBellBorder();
    static QColor getColor0();
    static QColor getColor1();
    static QColor getColor2();
    static QColor getColor3();
    static QColor getColor4();
    static QColor getColor5();
    static QColor getColor6();
    static QColor getColor7();
    static QColor getColor8();
    static QColor getColor9();
    static QColor getColor10();
    static QColor getColor11();
    static QColor getColor12();
    static QColor getColor13();
    static QColor getColor14();
    static QColor getColor15();
    static QColor getColor16();
    static QColor getColor17();
    static QColor getMark1();
    static QColor getMark1Text();
    static QColor getMark2();
    static QColor getMark2Text();
    static QColor getMark3();
    static QColor getMark3Text();

public slots:
    void themeChangedMessage();
    void setTheme(PaletteManager::ThemeType type);

signals:
    void themeChanged();


private:
    explicit ThemeManager(QObject *parent = nullptr);

    static ThemeManager *instance;
};


#endif  // THEME_MANAGER_HPP
