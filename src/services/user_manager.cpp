//
// Created by cvrain on 25-5-9.
//

#include "user_manager.hpp"

#include "services/sql_services.hpp"
#include <QDebug>

UserManager::UserManager(QObject *parent)
: QObject(parent), db(SqlServices::get_instance().get_database()) {
}

UserManager * UserManager::getInstance() {
    static UserManager instance;
    return &instance;
}

bool UserManager::checkUserExist() const {
    try {
        auto query = SQLite::Statement(db, "SELECT * FROM user");
        const auto result = query.executeStep();

        qDebug() << (result ? "Found user" :"Not found user");

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
