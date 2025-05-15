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

class ThemeManager : public QObject {
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

public:
    static ThemeManager* getInstance();

    static ThemeManager* create(QQmlEngine *, QJSEngine *);

private:
    explicit ThemeManager(QObject *parent = nullptr);

    static ThemeManager *instance;
};


#endif //THEME_MANAGER_HPP
