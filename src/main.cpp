#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <SQLiteCpp/SQLiteCpp.h>

int main(int argc, char *argv[]) {
    const QGuiApplication app(argc, argv);

    SQLite::Database db("test.db3");
    SQLite::Statement query(db, "SELECT * FROM test");


    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("LowerHouseVoteLog", "Main");

    return QGuiApplication::exec();
}
