//
// Created by cvrain on 25-5-4.
//

#ifndef USER_HPP
#define USER_HPP

#include <string>
#include <memory>
#include <optional>
#include <SQLiteCpp/SQLiteCpp.h>

#include "services/sql_services.hpp"

struct User {
    int id;
    std::string name;
    std::string signature;
    int64_t create_time;
    int64_t update_time;
};

namespace UserOperation {
    inline std::optional<User> create_user(const std::string &name, const std::string &signature) {
        try {
            SQLite::Database &db = SqlServices::get_instance().get_database();
            SQLite::Transaction transaction(db);
            const auto current_time = std::chrono::system_clock::now().time_since_epoch().count();

            SQLite::Statement query(
                db, "INSERT INTO user (name, signature, create_time, update_time) VALUES (?, ?, ?, ?)");
            query.bind(1, name);
            query.bind(2, signature);
            query.bind(3, current_time);
            query.bind(4, current_time);
            query.exec();
            transaction.commit();

            return User{
                .id = static_cast<int>(db.getLastInsertRowid()),
                .name = name,
                .signature = signature,
                .create_time = current_time,
                .update_time = current_time
            };
        }
        catch (SQLite::Exception &e) {
            throw std::runtime_error(e.what());
        }
    }

    inline std::optional<std::vector<User>> get_all_user() {
        try {
            const auto &db = SqlServices::get_instance().get_database();
            SQLite::Statement query(db, "SELECT * FROM user");

            std::vector<User> users;
            while (query.executeStep()) {
                users.push_back(User{
                    .id = query.getColumn(0).getInt(),
                    .name = query.getColumn(1).getString(),
                    .signature = query.getColumn(2).getString(),
                    .create_time = query.getColumn(3).getInt(),
                    .update_time = query.getColumn(4).getInt()
                });
            }
            return users;
        }
        catch (SQLite::Exception &e) {
            throw std::runtime_error(e.what());
        }
    }

    inline bool update_user_name(const int id, const std::string &name) {
        try {
            SQLite::Database &db = SqlServices::get_instance().get_database();
            SQLite::Transaction transaction(db);
            const auto current_time = std::chrono::system_clock::now().time_since_epoch().count();
            SQLite::Statement query(
                db, "UPDATE user SET name = ?, update_time = ? WHERE id = ?");
            query.bind(1, name);
            query.bind(2, current_time);
            query.bind(3, id);
            query.exec();
            transaction.commit();
            return true;
        }
        catch (SQLite::Exception &e) {
            throw std::runtime_error(e.what());
        }
    }

    inline bool update_user_signature(const int id, const std::string &signature) {
        try {
            SQLite::Database &db = SqlServices::get_instance().get_database();
            SQLite::Transaction transaction(db);
            const auto current_time = std::chrono::system_clock::now().time_since_epoch().count();
            SQLite::Statement query(
                db, "UPDATE user SET signature = ?, update_time = ? WHERE id = ?");
            query.bind(1, signature);
            query.bind(2, current_time);
            query.bind(3, id);
            query.exec();
            transaction.commit();
            return true;
        }
        catch (SQLite::Exception &e) {
            throw std::runtime_error(e.what());
        }
    }
}

#endif //USER_HPP
