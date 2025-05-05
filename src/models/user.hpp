//
// Created by cvrain on 25-5-4.
//

#ifndef USER_HPP
#define USER_HPP

#include <string>
#include <memory>

struct User {
    int id;
    std::unique_ptr<std::string> name;
    std::string signature;
    int64_t create_time;
    int64_t update_time;
};

#endif //USER_HPP
