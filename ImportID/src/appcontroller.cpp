#include "appcontroller.h"
#include <QObject>
#include <QCursor>
#include <QDebug>

#include <fstream>
#include <sstream>
#include <iostream>
#include <stdlib.h>
#include <cstring>

#include "eidlib.h"

#ifdef WIN32
#include <windows.h>
#include <stdio.h>
#include <QSysInfo>
#include <QNetworkProxy>
#endif

#ifndef WIN32
#include <unistd.h>
#endif

#include "gapi.h"

AppController::AppController(GUISettings& settings,QObject *parent) :
    QObject(parent)
  , m_Settings(settings)
{
    QString strVersion ("0.0.0");
    m_Settings.setGuiVersion(strVersion);
    qDebug() << "C++: AppController started. App version: " << m_Settings.getGuiVersion() +" - " + "r0000";
}

QString AppController::getAppVersion(void){

    return m_Settings.getGuiVersion() + " - " + "r0000";
}

void AppController::initTranslation(){

    QString     appPath = QCoreApplication::applicationDirPath();
    m_Settings.setExePath(appPath);
    QString CurrLng   = m_Settings.getGuiLanguageString();

    if (LoadTranslationFile(CurrLng)==false){
        emit signalLanguageChangedError();
    }
}

bool AppController::LoadTranslationFile(QString NewLanguage)
{

    QString strTranslationFile;
    strTranslationFile = QString("ImportID_") + NewLanguage;

    qDebug() << "C++: AppController LoadTranslationFile" << strTranslationFile << m_Settings.getExePath();

    if (!m_translator.load(strTranslationFile,m_Settings.getExePath()+"/"))
    {
        // this should not happen, since we've built the menu with the translation filenames
        strTranslationFile = QString("ImportID_") + STR_DEF_GUILANGUAGE;
        //try load default translation file
        qDebug() << "C++: AppController LoadTranslationFile" << strTranslationFile << m_Settings.getExePath();
        if (!m_translator.load(strTranslationFile,m_Settings.getExePath()+"/"))
        {
            // this should not happen too, since we've built the menu with the translation filenames
            qDebug() << "C++: AppController Load Default Translation File Error";
            return false;
        }
        qDebug() << "C++: AppController Loaded Default Translation File";
    }
    //------------------------------------
    // install the translator object and load the .qm file for
    // the given language.
    //------------------------------------
    qApp->installTranslator(&m_translator);
    return true;
}

QVariant AppController::getCursorPos()
{
    return QVariant(QCursor::pos());
}

bool AppController::getRegCertValue (void){

    return m_Settings.getRegCert();
}
bool AppController::getRemoveCertValue (void){

    return m_Settings.getRemoveCert();
}

void AppController::setRegCertValue (bool bRegCert){

    m_Settings.setRegCert(bRegCert);
}
void AppController::setRemoveCertValue (bool bRemoveCert){

    m_Settings.setRemoveCert(bRemoveCert);
}
