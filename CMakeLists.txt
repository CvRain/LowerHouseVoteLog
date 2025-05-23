cmake_minimum_required(VERSION 3.20)
cmake_policy(SET CMP0071 NEW)

project(LowerHouseVoteLog VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(QT_QML_GENERATE_QMLLS_INI ON)
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake)

add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/third_party/SQLiteCpp)

find_package(Qt6 REQUIRED COMPONENTS Quick Core)

qt_standard_project_setup(REQUIRES 6.5)

if(QT_KNOWN_POLICY_QTP0004)
        qt_policy(SET QTP0004 NEW)
endif()

if(QT_KNOWN_POLICY_QTP0005)
        qt_policy(SET QTP0005 NEW)
endif()

qt_add_executable(appLowerHouseVoteLog
        src/main.cpp
        src/models/user.hpp
        src/services/sql_services.cpp
        src/services/sql_services.hpp
        src/models/record.hpp
        src/services/user_manager.cpp
        src/services/user_manager.hpp
        src/theme/palette.hpp
        src/theme/palette.cpp
        src/theme/theme_manager.cpp
        src/theme/theme_manager.hpp
        src/theme/palette_manager.cpp
        src/theme/palette_manager.hpp
        resource.qrc
)

target_include_directories(appLowerHouseVoteLog PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        ${CMAKE_CURRENT_SOURCE_DIR}/src/theme
)

set(    QML_FILES
        qml/Main.qml
        qml/Sidebar.qml
        qml/ThemeMenu.qml
        qml/ThemeButtonComponent.qml
        qml/pages/StartVotePage.qml
        qml/pages/ActivityPage.qml
        qml/components/MenuItem.qml
)

qt_add_qml_module(appLowerHouseVoteLog
        URI LowerHouseVoteLog
        VERSION 1.0
        QML_FILES ${QML_FILES}
        RESOURCES resource.qrc
        IMPORT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/src
        SOURCES
        src/theme/theme_manager.cpp
        src/theme/theme_manager.hpp
        src/theme/palette_manager.cpp
        src/theme/palette_manager.hpp
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
)


include(GNUInstallDirs)
install(TARGETS appLowerHouseVoteLog
        BUNDLE DESTINATION .
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
