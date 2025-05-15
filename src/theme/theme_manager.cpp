//
// Created by CvRai on 25-5-14.
//

#include "theme_manager.hpp"

ThemeManager* ThemeManager::instance = nullptr;

ThemeManager* ThemeManager::getInstance()
{
    if (instance == nullptr)
    {
        instance = new ThemeManager();
    }
    return instance;
}

ThemeManager* ThemeManager::create(QQmlEngine*, QJSEngine*)
{
    return getInstance();
}
ThemeManager::ThemeManager(QObject* parent)
{

}

