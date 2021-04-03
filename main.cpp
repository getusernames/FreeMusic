#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QDebug>
#include "libzplay.h"
using namespace libZPlay;
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    // 添加字体文件
    int fontId = QFontDatabase::addApplicationFont(":/Font/fonts/fontawesome-webfont.ttf");
    QStringList fontFamilies = QFontDatabase::applicationFontFamilies(fontId);

    ZPlay *player = CreateZPlay();

    if(player->OpenFile("music\\华语群星 - 我和我的祖国.mp3", sfAutodetect) == 0)
       {
          return -1;
       }
    player->Play();
    return app.exec();
}
