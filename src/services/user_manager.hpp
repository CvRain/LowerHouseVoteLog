//
// Created by cvrain on 25-5-9.
//

#ifndef USER_MANAGER_HPP
#define USER_MANAGER_HPP

#include <QObject>

#include "services/sql_services.hpp"

class UserManager : public QObject {
    Q_OBJECT

public:
    static UserManager* getInstance();

    [[nodiscard]] Q_INVOKABLE bool checkUserExist() const;

    Q_INVOKABLE static QString helloWorld();

private:
    explicit UserManager(QObject *parent = nullptr);

    SQLite::Database &db;
};


#endif //USER_MANAGER_HPP
