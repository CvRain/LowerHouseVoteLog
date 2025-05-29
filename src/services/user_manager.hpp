//
// Created by cvrain on 25-5-9.
//

#ifndef USER_MANAGER_HPP
#define USER_MANAGER_HPP

#include <QQmlEngine>

#include "services/sql_services.hpp"

class UserManager : public QObject {
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
    QML_UNCREATABLE("UserManager is a singleton")

public:
    static UserManager* getInstance();
    static UserManager* create(const QQmlEngine *, const QJSEngine *);

    [[nodiscard]] Q_INVOKABLE bool checkUserExist() const;

    Q_INVOKABLE static QString helloWorld();

private:
    explicit UserManager(QObject *parent = nullptr);

    SQLite::Database &db;
    static UserManager *instance;
};


#endif //USER_MANAGER_HPP
