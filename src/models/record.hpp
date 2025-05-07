//
// Created by cvrain on 25-5-7.
//

#ifndef RECORD_HPP
#define RECORD_HPP

#include <string>

struct Record {
    int record_id;
    int user_id;
    int start_time;
    int end_time;
    std::string title;
    std::string description;
};

#endif //RECORD_HPP
