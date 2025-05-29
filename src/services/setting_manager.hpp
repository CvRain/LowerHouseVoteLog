//
// Created by cvrain on 25-5-28.
//

#ifndef SETTING_MANAGER_HPP
#define SETTING_MANAGER_HPP

#include <QQmlEngine>
#include <toml++/toml.hpp>

class Setting : public QObject {
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Setting(QObject *parent = nullptr);
    static Setting *create(const QQmlEngine *, const QJSEngine *);
};

class SettingManager : public QObject {
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
public:
    static SettingManager *create(const QQmlEngine *, const QJSEngine *);
    static SettingManager *getInstance();

    void init();

private:
    explicit SettingManager(QObject *parent = nullptr);
    static SettingManager *instance;

    const std::string config_path = "./config.toml";

    toml::table config;
};


#endif  // SETTING_MANAGER_HPP
