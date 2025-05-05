cmake_minimum_required(VERSION 3.16)

project(LowerHouseVoteLog VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/third_party/SQLiteCpp)

find_package(Qt6 REQUIRED COMPONENTS Quick Core)

qt_standard_project_setup(REQUIRES 6.5)

if (QT_KNOWN_POLICY_QTP0004)
    qt_policy(SET QTP0004 NEW)
endif ()

if (QT_KNOWN_POLICY_QTP0005)
    qt_policy(SET QTP0005 NEW)
endif ()

qt_add_executable(appLowerHouseVoteLog
        src/main.cpp
        src/models/user.hpp
)

qt_add_qml_module(appLowerHouseVoteLog
        URI LowerHouseVoteLog
        VERSION 1.0
        QML_FILES
        qml/Main.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appLowerHouseVoteLog PROPERTIES
        #    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appLowerHouseVoteLog
        MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
        MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
        MACOSX_BUNDLE TRUE
        WIN32_EXECUTABLE TRUE
)

target_link_libraries(appLowerHouseVoteLog
        PRIVATE
        Qt6::Quick
        SQLiteCpp
        sqlite3
        pthread
        dl
)


include(GNUInstallDirs)
install(TARGETS appLowerHouseVoteLog
        BUNDLE DESTINATION .
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
