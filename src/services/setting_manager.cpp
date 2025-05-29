//
// Created by cvrain on 25-5-28.
//

#include "setting_manager.hpp"

#include <QFile>

Setting::Setting(QObject* parent) : QObject(parent) {}

Setting* Setting::create(const QQmlEngine*, const QJSEngine*) { return new Setting(); }

SettingManager* SettingManager::instance = nullptr;

SettingManager::SettingManager(QObject* parent) : QObject(parent) {}

SettingManager* SettingManager::create(const QQmlEngine*, const QJSEngine*) { return getInstance(); }

SettingManager* SettingManager::getInstance() {
    if (instance == nullptr) {
        instance = new SettingManager();
    }
    return instance;
}

void SettingManager::init() {
    // check config_path file exist
    if (!QFile::exists(config_path.data())) {
        // copy from ":/res/setting.toml"
        QFile::copy(":/res/setting.toml", config_path.data());
    }
    try {
        config = toml::parse(config_path);
    }
    catch (const toml::parse_error& error) {
        qDebug() << "parse error:" << error.description().data();
        return;
    }
}
