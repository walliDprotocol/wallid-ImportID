#ifndef GAPI_H
#define GAPI_H

#include <QQuickImageProvider>
#include <QQmlEngine>
#include <QObject>
#include <QMap>
#include <QTimer>
#include <QDebug>
#include <QtQml>
#include <QPixmap>
#include "Settings.h"

//MW libraries
#include "eidlib.h"
#include "eidErrors.h"
#include "eidlibException.h"

/*
    GAPI - Graphic Application Programming Interface

*/

class GAPI;

//***********************************************
// callback data class
// This class can be used to store whatever info we
// need from the callback function
//***********************************************
class CallBackData
{
public:
    CallBackData( void )
        : m_readerName()
        , m_mainWnd()
        , m_cardID(0)
    {
    }
    CallBackData( const char* pReaderName, GAPI* pGAPI )
        : m_readerName(pReaderName)
        , m_mainWnd(pGAPI)
        , m_cardID(0)
    {
    }
    virtual ~CallBackData( void )
    {
    }
    QString const& getReaderName()
    {
        return m_readerName;
    }
    void setReaderName( QString const& readerName)
    {
        m_readerName = readerName;
    }
    void setReaderName( const char* readerName)
    {
        m_readerName = readerName;
    }
    GAPI* getMainWnd( void )
    {
        return m_mainWnd;
    }
private:
    QString m_readerName;
    GAPI*   m_mainWnd;
public:
    unsigned long   m_cardID;
};

typedef QMap<QString,unsigned long> tCallBackHandles;
typedef QMap<QString,CallBackData*> tCallBackData;

class PhotoImageProvider: public QQuickImageProvider 
{
public:
    PhotoImageProvider() : QQuickImageProvider(QQuickImageProvider::Pixmap) {}
    void setPixmap(QPixmap &pixmap) { p = pixmap; }

private:
    QPixmap p;
};

class GAPI : public QObject
{
    #define TIMERREADERLIST 5000
    Q_OBJECT
    Q_PROPERTY(QMap<AddressInfoKey, QString> m_addressData NOTIFY signalAddressLoaded)
    Q_PROPERTY(QString persoData MEMBER m_persoData NOTIFY signalPersoDataLoaded)

public:
    explicit GAPI(QObject *parent = 0);

    enum IDInfoKey { Documenttype, Documentversion, DocumentPAN, Surname, Givenname, Sex, Height, Nationality,
                     Birthdate, Documentnum, CivilianIdNumber , Validitybegindate, Validityenddate,
                     NIC, NIF, NISS, NSNS, IssuingEntity, PlaceOfRequest, Country, SurnameFather, SurnameMother,
                     GivenNameFather, GivenNameMother,Validation, MRZ1, MRZ2, MRZ3,AccidentalIndications };

    enum AddressInfoKey { CountryCode, District, DistrictCode, Municipality, MunicipalityCode, Parish, ParishCode,
                          Streettype, AbbrStreetType, Streetname, Buildingtype, AbbrBuildingType, Doorno, Floor, Side,
                          Locality, Place, Zip4, Zip3, PostalLocality, GeneratedAddressCode, Foreigncountry,
                          Foreignaddress, Foreigncity, Foreignregion, Foreignlocality, Foreignpostalcode};

    enum CardAccessError { NoReaderFound, NoCardFound, CardReadError, SodCardReadError, CardUserPinCancel,
                           CardUnknownError };

    enum eCustomEventType { ET_UNKNOWN, ET_CARD_CHANGED, ET_CARD_REMOVED };

    Q_ENUMS(CardAccessError)
    Q_ENUMS(eCustomEventType)
    Q_ENUMS(IDInfoKey)
    Q_ENUMS(AddressInfoKey)

    bool isAddressLoaded() {return m_addressLoaded; }

    QQuickImageProvider * buildImageProvider() { return image_provider; }

    // Do not forget to declare your class to the QML system.
    static void declareQMLTypes() {
        qmlRegisterType<GAPI>("gapi", 1, 0, "GAPI");
    }
    GUISettings    m_Settings;

public slots:
    // Slots to Gui request values
    QVariantList getRetReaderList(void);
    void setReaderByUser(unsigned long setReaderIndex);
    void resetReaderSelected(void) {selectedReaderIndex =  -1; }
    signed int returnReaderSelected(void) {return selectedReaderIndex; }
    void setAddressLoaded(bool addressLoaded) {m_addressLoaded = addressLoaded; }
    void startCardReading();
    void startReadingAddress();

    unsigned int verifyAddressPin(QString pin);

    QString getCardActivation();
    QString getDataCardIdentifyValue(GAPI::IDInfoKey key);
    QString getAddressField(GAPI::AddressInfoKey key);

    void setEventCallbacks( void );
    void startGetCardActivation ( void );
    void showCertificateAuthStatus(int certificateStatus);

    void initTranslation();

    void updateReaderList( void );

    void startSigningWalletAddress(QString walletAddress);
    void startGettingSod();
    void startGettingCertificate();

signals:
    // Signal from GAPI to Gui
    // Notify about Card Identify changed
    void signalReaderContext();
    void signalSetReaderComboIndex(long selected_reader);
    void signalCardDataChanged();
    void signalAddressLoaded(bool m_foreign);
    void signalCardAccessError(int error_code);
    void signalGenericError(const QString error_code);
    void signalPersoDataLoaded(const QString& persoNotes);
    void signalAddressLoadedChanged();
    void signalCardChanged(const int error_code);
    void signalCertificatesChanged(const QVariantMap certificatesMap);
    void getCertificateAuthStatusFinished(int certificateStatus);
    void signalShowCardActivation(QString statusMessage);

    void signalLanguageChangedError();

    void signalWalletAddressSignSuccess(const QString walletAddressSigned);
    void signalWalletAddressSignFail();
    void signalGetSodSucess(const QString Sod);
    void signalGetCertificateSucess(const QString Certificate);

private:
    bool LoadTranslationFile(QString NewLanguage);

    void setDataCardIdentify(QMap<GAPI::IDInfoKey, QString> m_data);
    void connectToCard();
    void getPersoDataFile();
    void setPersoDataFile(QString text);
    void getAddressFile();
    void getCertificateAuthStatus(void );
    void getCardInstance(eIDMW::PTEID_EIDCard *&new_card);

    void stopAllEventCallbacks(void);
    void cleanupCallbackData(void);

    void doSignWalletAddress(QString walletAddress);
    void doGetSod();
    void doGetCertificate();

    // Data Card Identify map
    QMap<GAPI::IDInfoKey, QString> m_data;
    QMap<GAPI::AddressInfoKey, QString> m_addressData;
    //Don't free this!, we release ownership to the QMLEngine in buildImageProvider()
    PhotoImageProvider *image_provider;

    QString m_persoData;
    bool m_addressLoaded;
    signed int selectedReaderIndex = -1;

    tCallBackHandles		m_callBackHandles;
    tCallBackData			m_callBackData;

    QTimer* m_timerReaderList;

protected:
    QTranslator m_translator;
};
#endif // GAPI_H
