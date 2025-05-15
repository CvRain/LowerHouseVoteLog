//
// Created by CvRai on 25-5-14.
//

#ifndef THEME_MANAGER_HPP
#define THEME_MANAGER_HPP

#include <QJSEngine>
#include <QObject>
#include <QQmlEngine>
#include <QString>
#include <map>

#include "palette.hpp"
#include "palette_manager.hpp"

class ThemeManager : public QObject {
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
    Q_PROPERTY(QColor backgroundPanel READ getBackgroundPanel NOTIFY themeChanged)

public:
    static ThemeManager *getInstance();
    static ThemeManager *create(QQmlEngine *, QJSEngine *);

    static QColor getBackgroundPanel();

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
