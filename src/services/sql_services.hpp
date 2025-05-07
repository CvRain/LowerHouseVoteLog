//
// Created by cvrain on 25-5-7.
//

#ifndef SQL_SERVICES_HPP
#define SQL_SERVICES_HPP

#include <string>
#include <SQLiteCpp/SQLiteCpp.h>

class SqlServices {
public:
    SqlServices(const SqlServices&) = delete;
    SqlServices& operator=(const SqlServices&) = delete;

    static SqlServices& get_instance();
    void init();
private:
    explicit SqlServices();
    ~SqlServices() = default;

    SQLite::Database database;
    bool isInit = false;
};



#endif //SQL_SERVICES_HPP
