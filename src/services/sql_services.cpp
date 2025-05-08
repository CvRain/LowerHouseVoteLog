//
// Created by cvrain on 25-5-7.
//

#include "sql_services.hpp"

#include <iostream>

SqlServices& SqlServices::get_instance() {
    static SqlServices instance;
    return instance;
}

void SqlServices::init() {
    try {
        std::cout << "Try to create table" << std::endl;
        database.exec("CREATE TABLE IF NOT EXISTS user("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "name TEXT NOT NULL, "
            "signature TEXT, "
            "create_time TIMESTAMP,"
            "update_time TIMESTAMP)"
        );
        database.exec("CREATE TABLE IF NOT EXISTS record("
            "record_id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "user_id INTEGER NOT NULL,"
            "title TEXT NOT NULL,"
            "description TEXT,"
            "start_time INTEGER NOT NULL,"
            "end_time INTEGER NOT NULL"
            ")");
    }
    catch (const SQLite::Exception &e) {
        std::cerr << "SQLite exception: " << e.what() << std::endl;
    }
}

SQLite::Database & SqlServices::get_database() {
    return database;
}

SqlServices::SqlServices()
    : database(SQLite::Database("vote_log.db", SQLite::OPEN_READWRITE | SQLite::OPEN_CREATE)) {
}
