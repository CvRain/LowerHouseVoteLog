#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <SQLiteCpp/SQLiteCpp.h>

#include "services/sql_services.hpp"
#include "models/user.hpp"

int main(int argc, char *argv[]) {
    const QGuiApplication app(argc, argv);

    qDebug() << "SQlite3 compile time header version "
            << SQLite::VERSION
            << " (vs dynamic lib version "
            << SQLite::getLibVersion() << ")";
    qDebug() << "SqliteC++ version" << SQLITECPP_VERSION;

    SqlServices::get_instance().init();

    for (const auto user_result = UserOperation::get_all_user().value_or({}); const auto &user : user_result) {
        qDebug() << "user id: " << user.id << " name: " << user.name << " signature: " << user.signature;
    }

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
