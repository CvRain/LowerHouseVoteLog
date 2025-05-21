#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QDebug>
#include <SQLiteCpp/SQLiteCpp.h>

#include "services/sql_services.hpp"
#include "services/user_manager.hpp"
#include "theme/theme_manager.hpp"
#include "theme/palette_manager.hpp"

int main(int argc, char *argv[]) {
    const QGuiApplication app(argc, argv);

    qDebug() << "SQlite3 compile time header version "
            << SQLite::VERSION
            << " (vs dynamic lib version "
            << SQLite::getLibVersion() << ")";
    qDebug() << "SqliteC++ version" << SQLITECPP_VERSION;

    SqlServices::get_instance().init();

    qmlRegisterSingletonInstance<UserManager>("UserManager", 1, 0, "UserManager", UserManager::getInstance());
    qmlRegisterSingletonInstance<ThemeManager>("LowerHouseVoteLog", 1, 0, "ThemeManager", ThemeManager::getInstance());
    qmlRegisterSingletonInstance<PaletteManager>("LowerHouseVoteLog", 1, 0, "PaletteManager", PaletteManager::getInstance());
    qmlRegisterUncreatableType<QColor>("QtQml.Types", 1, 0, "QColor", "Built-in type");
    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("LowerHouseVoteLog", "Main");

    return QGuiApplication::exec();
}
