#ifndef APPCONTROLLER_H
#define APPCONTROLLER_H

#include <QObject>
#include <QVariant>
#include "Settings.h"

//MW libraries
#include "eidlib.h"
#include "eidErrors.h"
#include "eidlibException.h"
#include "eidlibdefines.h"

class AppController : public QObject
{
    Q_OBJECT
    //  Used to dynamic translation in QML (QTBUG-15602)
    Q_PROPERTY(QString autoTr READ getAutoTr NOTIFY languageChanged)
public:
    explicit AppController(GUISettings &settings, QObject *parent = 0);
    GUISettings&    getSettings( void )
    {
        return m_Settings;
    }
    QString getAutoTr() {
     return "";
    }

public slots:
    Q_INVOKABLE QVariant getCursorPos();
    QString getAppVersion(void);
    bool getNotShowHelpStartUp(void);
    void setNotShowHelpStartUp(bool notshowhelpStartUp);
    void initTranslation(void);

    bool getRegCertValue(void);
    bool getRemoveCertValue(void);

    void setRegCertValue(bool bRegCert);
    void setRemoveCertValue(bool bRemoveCert);

    QString getGuiLanguageString(void);
    void setGuiLanguageString (QString language);

private:
    GUISettings&    m_Settings;
    bool LoadTranslationFile(QString NewLanguage);

protected:
    QTranslator m_translator;

signals:
    void languageChanged();
    void signalLanguageChangedError();
};

#endif // APPCONTROLLER_H
