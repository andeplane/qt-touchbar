#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "touchbar.h"
#include "touchbarbutton.h"
#include "touchbarslider.h"

int main(int argc, char *argv[])
{
    qmlRegisterType<TouchBar>("TouchBar", 1, 0, "TouchBar");
    qmlRegisterType<TouchBarButton>("TouchBar", 1, 0, "TouchBarButton");
    qmlRegisterType<TouchBarSlider>("TouchBar", 1, 0, "TouchBarSlider");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;


    return app.exec();
}
