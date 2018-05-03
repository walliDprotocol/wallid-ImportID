#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QIcon>
#include "appcontroller.h"
#include "gapi.h"
#include "eidlib.h"

using namespace eIDMW;

int main(int argc, char *argv[])
{
    int retValue = 0;
    bool test_mode = false;

    QApplication app(argc, argv);

    // Set app icon
    app.setWindowIcon(QIcon(":/appicon.ico"));

    //QQuickStyle::setStyle("Material");
    QQuickStyle::setStyle("Universal");
    //QQuickStyle::setStyle("Default");

    QQmlApplicationEngine engine;

    // GUISettings init
    GUISettings settings;
    // AppController init
    AppController controller(settings);

    PTEID_InitSDK();

    if (argc == 2 && strcmp(argv[1], "-test") == 0)
    {
        test_mode = true;
        settings.setTestMode( test_mode );
        if(test_mode)
            qDebug() << "Starting App in test mode";
    }

    // GAPI init
    GAPI gapi;
    GAPI::declareQMLTypes();

    // Embedding C++ Objects into QML with Context Properties
    QQmlContext* ctx = engine.rootContext();
    ctx->setContextProperty("gapi", &gapi);
    ctx->setContextProperty("controler", &controller);

    engine.addImageProvider("myimageprovider", gapi.buildImageProvider());

    // Load main QML file
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    retValue = app.exec();

    PTEID_ReleaseSDK();

    return retValue;
}
