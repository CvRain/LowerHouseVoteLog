//
// Created by cvrain on 25-5-9.
//

#include "user_manager.hpp"

#include <QDebug>

#include "services/sql_services.hpp"

UserManager *UserManager::instance = nullptr;

UserManager::UserManager(QObject *parent) : QObject(parent), db(SqlServices::get_instance().get_database()) {}

UserManager *UserManager::getInstance() {
    if (instance == nullptr) {
        instance = new UserManager();
    }
    return instance;
}

UserManager *UserManager::create(const QQmlEngine *engine, const QJSEngine *scriptEngine) {
    Q_UNUSED(engine);
    Q_UNUSED(scriptEngine);
    return getInstance();
}

bool UserManager::checkUserExist() const {
    try {
        auto       query  = SQLite::Statement(db, "SELECT * FROM user");
        const auto result = query.executeStep();

        qDebug() << (result ? "Found user" : "Not found user");

        return result;
    }
    catch (const SQLite::Exception &e) {
        qDebug() << e.what();
        throw e;
    }
}

QString UserManager::helloWorld() {
    qDebug() << "Hello World";
    return "Hello World";
}
