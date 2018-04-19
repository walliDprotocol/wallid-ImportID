#include "gapi.h"
#include <QString>
#include <QVector>
#include <QDate>
#include <QtConcurrent>
#include <cstdio>
#include <QQuickImageProvider>
#include <QCryptographicHash>
#include "qpainter.h"
#include "eidlib.h"

using namespace eIDMW;

#define TRIES_LEFT_ERROR    1000

static  bool    g_cleaningCallback=false;
static  int g_runningCallback=0;

/*
    GAPI - Graphic Application Programming Interface
*/

GAPI::GAPI(QObject *parent) :
    QObject(parent) {
    image_provider = new PhotoImageProvider();
    m_addressLoaded = false;
    m_shortcutFlag = 0;

    //----------------------------------
    // set a timer to check if the number of card readers is changed
    //----------------------------------
    m_timerReaderList = new QTimer(this);
    connect(m_timerReaderList, SIGNAL(timeout()), this, SLOT(updateReaderList()));
    m_timerReaderList->start(TIMERREADERLIST);
}

void GAPI::initTranslation() {

    QString     appPath = QCoreApplication::applicationDirPath();
    m_Settings.setExePath(appPath);
    QString CurrLng   = m_Settings.getGuiLanguageString();
    if (LoadTranslationFile(CurrLng)==false){
        emit signalLanguageChangedError();
    }
}

bool GAPI::LoadTranslationFile(QString NewLanguage)
{

    QString strTranslationFile;
    strTranslationFile = QString("ImportID_") + NewLanguage;

    qDebug() << "C++: GAPI LoadTranslationFile" << strTranslationFile << m_Settings.getExePath();

    if (!m_translator.load(strTranslationFile,m_Settings.getExePath()+"/"))
    {
        // this should not happen, since we've built the menu with the translation filenames
        strTranslationFile = QString("ImportID_") + STR_DEF_GUILANGUAGE;
        //try load default translation file
        qDebug() << "C++: AppController GAPI" << strTranslationFile << m_Settings.getExePath();
        if (!m_translator.load(strTranslationFile,m_Settings.getExePath()+"/"))
        {
            // this should not happen too, since we've built the menu with the translation filenames
            qDebug() << "C++: AppController Load Default Translation File Error";
            return false;
        }
        qDebug() << "C++: GAPI Loaded Default Translation File";
        qApp->installTranslator(&m_translator);
        return false;
    }
    //------------------------------------
    // install the translator object and load the .qm file for
    // the given language.
    //------------------------------------
    qApp->installTranslator(&m_translator);
    return true;
}

QString GAPI::getDataCardIdentifyValue(IDInfoKey key) {

    qDebug() << "C++: getDataCardIdentifyValue ";

    return m_data[key];
}

void GAPI::setDataCardIdentify(QMap<IDInfoKey, QString> data) {

    qDebug() << "C++: setDataCardIdentify ";

    m_data = data;
    emit signalCardDataChanged();
}

bool isExpiredDate(const char * strDate) {
    if (strDate == NULL)
        return false;

    QDate qDate = QDate::fromString(strDate, "dd MM yyyy");
    QDate curDate = QDate::currentDate();

    if ( curDate > qDate )
        return true;
    return false;
}

QString GAPI::getAddressField(AddressInfoKey key) {
    return m_addressData[key];
}

#define BEGIN_TRY_CATCH  \
    try					  \
{

#define END_TRY_CATCH    \
    }                    \
    catch (PTEID_ExNoReader &) \
{                           \
    qDebug() << "No card reader found !"; \
    emit signalCardAccessError(NoReaderFound); \
    }     \
    catch (PTEID_ExNoCardPresent &) \
{     \
    qDebug() << "No card present."; \
    emit signalCardAccessError(NoCardFound); \
    }     \
    catch (PTEID_Exception &e) \
{ \
    long errorCode = e.GetError(); \
    if (errorCode >= EIDMW_SOD_UNEXPECTED_VALUE && \
    errorCode <= EIDMW_SOD_ERR_VERIFY_SOD_SIGN) \
{ \
    fprintf(stderr, "SOD exception! Error code (see strings in eidErrors.h): %08lx\n", e.GetError()); \
    emit signalCardAccessError(SodCardReadError); \
    } else if (errorCode == EIDMW_ERR_PIN_CANCEL) \
{ \
    emit signalCardAccessError(CardUserPinCancel); \
    } \
    else \
{ \
    fprintf(stderr, "Generic eidlib exception! Error code (see strings in eidErrors.h): %08lx\n", e.GetError()); \
    QString msgError = QString("%08\n").arg(e.GetError()); \
    emit signalGenericError(msgError); \
    } \
    }

void GAPI::getAddressFile() {
    qDebug() << "C++: getAddressFile()";
    bool m_foreign;

    BEGIN_TRY_CATCH;

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return;

    PTEID_Address &addressFile = card->getAddr();

    if (!addressFile.isNationalAddress())
    {
        qDebug() << "Is foreign citizen";
        m_foreign = true;
        m_addressData[Foreigncountry] = QString::fromUtf8(addressFile.getForeignCountry());
        m_addressData[Foreignaddress] = QString::fromUtf8(addressFile.getForeignAddress());
        m_addressData[Foreigncity] = QString::fromUtf8(addressFile.getForeignCity());
        m_addressData[Foreignregion] = QString::fromUtf8(addressFile.getForeignRegion());
        m_addressData[Foreignlocality] = QString::fromUtf8(addressFile.getForeignLocality());
        m_addressData[Foreignpostalcode] = QString::fromUtf8(addressFile.getForeignPostalCode());
    }
    else
    {
        qDebug() << "Is national citizen";
        m_foreign = false;
        m_addressData[District] = QString::fromUtf8(addressFile.getDistrict());
        m_addressData[Municipality] = QString::fromUtf8(addressFile.getMunicipality());
        m_addressData[Parish] = QString::fromUtf8(addressFile.getCivilParish());
        m_addressData[Streettype] = QString::fromUtf8(addressFile.getStreetType());
        m_addressData[Streetname] = QString::fromUtf8(addressFile.getStreetName());
        m_addressData[Buildingtype] = QString::fromUtf8(addressFile.getBuildingType());
        m_addressData[Doorno] = QString::fromUtf8(addressFile.getDoorNo());
        m_addressData[Floor] = QString::fromUtf8(addressFile.getFloor());
        m_addressData[Side] = QString::fromUtf8(addressFile.getSide());
        m_addressData[Locality] = QString::fromUtf8(addressFile.getLocality());
        m_addressData[Place] = QString::fromUtf8(addressFile.getPlace());
        m_addressData[Zip4] = QString::fromUtf8(addressFile.getZip4());
        m_addressData[Zip3] = QString::fromUtf8(addressFile.getZip3());
        m_addressData[PostalLocality] = QString::fromUtf8(addressFile.getPostalLocality());
    }
    emit signalAddressLoaded(m_foreign);

    END_TRY_CATCH
}

void GAPI::getPersoDataFile() {

    qDebug() << "getPersoDataFile() called";

    BEGIN_TRY_CATCH;

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return;

    emit signalPersoDataLoaded(QString(card->readPersonalNotes()));

    END_TRY_CATCH

}

unsigned int GAPI::verifyAuthPin(QString pin_value) {
    unsigned long tries_left = TRIES_LEFT_ERROR;

    BEGIN_TRY_CATCH

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return TRIES_LEFT_ERROR;

    PTEID_Pin & auth_pin = card->getPins().getPinByPinRef(PTEID_Pin::AUTH_PIN);
    auth_pin.verifyPin(pin_value.toLatin1().data(), tries_left);

    if (tries_left == 0) {
        qDebug() << "WARNING: Auth PIN blocked!" + tries_left;
    }

    END_TRY_CATCH

            //QML default types don't include long
            return (unsigned int)tries_left;
}

unsigned int GAPI::getTriesLeftAuthPin() {
    unsigned long tries_left = TRIES_LEFT_ERROR;

    BEGIN_TRY_CATCH

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return TRIES_LEFT_ERROR;

    PTEID_Pin & auth_pin = card->getPins().getPinByPinRef(PTEID_Pin::AUTH_PIN);
    tries_left = auth_pin.getTriesLeft();

    if (tries_left == 0) {
        qDebug() << "WARNING: Auth PIN blocked!" + tries_left;
    }

    END_TRY_CATCH

            //QML default types don't include long
            return (unsigned int)tries_left;
}

unsigned int GAPI::verifySignPin(QString pin_value) {
    unsigned long tries_left = TRIES_LEFT_ERROR;

    BEGIN_TRY_CATCH

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return TRIES_LEFT_ERROR;

    PTEID_Pin & sign_pin = card->getPins().getPinByPinRef(PTEID_Pin::SIGN_PIN);
    sign_pin.verifyPin(pin_value.toLatin1().data(), tries_left);

    if (tries_left == 0) {
        qDebug() << "WARNING: Sign PIN blocked!" + tries_left;
    }

    END_TRY_CATCH

            //QML default types don't include long
            return (unsigned int)tries_left;
}

unsigned int GAPI::getTriesLeftSignPin() {
    unsigned long tries_left = TRIES_LEFT_ERROR;

    BEGIN_TRY_CATCH

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return TRIES_LEFT_ERROR;

    PTEID_Pin & sign_pin = card->getPins().getPinByPinRef(PTEID_Pin::SIGN_PIN);
    tries_left = sign_pin.getTriesLeft();

    if (tries_left == 0) {
        qDebug() << "WARNING: Sign PIN blocked!" + tries_left;
    }

    END_TRY_CATCH

            //QML default types don't include long
            return (unsigned int)tries_left;
}

unsigned int GAPI::verifyAddressPin(QString pin_value) {
    unsigned long tries_left = TRIES_LEFT_ERROR;

    BEGIN_TRY_CATCH

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return TRIES_LEFT_ERROR;

    PTEID_Pin & address_pin = card->getPins().getPinByPinRef(PTEID_Pin::ADDR_PIN);
    address_pin.verifyPin(pin_value.toLatin1().data(), tries_left);

    if (tries_left == 0) {
        qDebug() << "WARNING: Address PIN blocked!" + tries_left;
    }

    END_TRY_CATCH

            //QML default types don't include long
            return (unsigned int)tries_left;
}

unsigned int GAPI::getTriesLeftAddressPin() {
    unsigned long tries_left = TRIES_LEFT_ERROR;

    BEGIN_TRY_CATCH

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return TRIES_LEFT_ERROR;

    PTEID_Pin & address_pin = card->getPins().getPinByPinRef(PTEID_Pin::ADDR_PIN);
    tries_left = address_pin.getTriesLeft();

    if (tries_left == 0) {
        qDebug() << "WARNING: Address PIN blocked!" + tries_left;
    }

    END_TRY_CATCH

            //QML default types don't include long
            return (unsigned int)tries_left;
}

QString GAPI::getCardActivation() {
    BEGIN_TRY_CATCH

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return "Error getting Card Activation";

    PTEID_EId &eid_file = card->getID();

    PTEID_Certificates&	 certificates	= card->getCertificates();

    int certificateStatus = PTEID_CERTIF_STATUS_UNKNOWN;

    certificateStatus = certificates.getCert(PTEID_Certificate::CITIZEN_AUTH).getStatus();

    // If state active AND validity not expired AND certificate active
    if(card->isActive() && !isExpiredDate(eid_file.getValidityEndDate())
            && certificateStatus == PTEID_CERTIF_STATUS_VALID)
    {
        return QString(tr("STR_CARD_ACTIVE_AND_VALID"));
    }
    // Else If state active AND validity not expired AND certificate error
    else if(card->isActive() && !isExpiredDate(eid_file.getValidityEndDate())
            && (certificateStatus == PTEID_CERTIF_STATUS_CONNECT || certificateStatus == PTEID_CERTIF_STATUS_ERROR
            || certificateStatus == PTEID_CERTIF_STATUS_ISSUER || certificateStatus == PTEID_CERTIF_STATUS_UNKNOWN))
    {
        return QString(tr("STR_CARD_CONNECTION_ERROR"));
    }
    //Else If state active AND validity not expired AND certificate suspended or revoked
    else if(card->isActive() && !isExpiredDate(eid_file.getValidityEndDate())
            && (certificateStatus == PTEID_CERTIF_STATUS_SUSPENDED || certificateStatus == PTEID_CERTIF_STATUS_REVOKED))
    {
        return QString(tr("STR_CARD_CANCELED"));
    }
    //Else If state active AND validity expired
    else if(card->isActive() && isExpiredDate(eid_file.getValidityEndDate()))
    {
        return QString(tr("STR_CARD_EXPIRED"));
    }
    //Else If state not active
    else if(!card->isActive())
    {
        return QString(tr("STR_CARD_NOT_ACTIVE"));
    }
    END_TRY_CATCH
}

QPixmap PhotoImageProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    if (id != "photo.png") {
        qDebug() << "PhotoImageProvider: wrong id requested - " << id;
        return QPixmap();
    }

    if (!requestedSize.isValid())
    {
        if (requestedSize.height() > p.height() || requestedSize.width() > p.width())
        {
            qDebug() << "PhotoImageProvider: Invalid requestedSize - " << requestedSize;
            return QPixmap();
        }
    }

    size->setWidth(p.width());
    size->setHeight(p.height());

    return p;
}

void GAPI::startCardReading() {
    QFuture<void> future = QtConcurrent::run(this, &GAPI::connectToCard);

}

void GAPI::startReadingAddress() {
    QtConcurrent::run(this, &GAPI::getAddressFile);
}

void GAPI::getCardInstance(PTEID_EIDCard * &new_card) {

    try
    {
        unsigned long ReaderEndIdx = ReaderSet.readerCount();
        long ReaderIdx = 0;
        long CardIdx = 0;
        long tempReaderIndex = 0;

        if ( ReaderEndIdx == 0 ) {
            emit signalCardAccessError(NoReaderFound);
        } else {
            bool bCardPresent = false;
            PTEID_CardType lastFoundCardType = PTEID_CARDTYPE_UNKNOWN;

            // Count number of cards
            for (ReaderIdx = 0; ReaderIdx < ReaderEndIdx; ReaderIdx++)
            {
                PTEID_ReaderContext& readerContext = ReaderSet.getReaderByNum(ReaderIdx);

                if (readerContext.isCardPresent())
                {
                    bCardPresent = true;
                    CardIdx++;
                    tempReaderIndex = ReaderIdx;
                }
            }
            // Test if Card Reader was previously selected
            if(selectedReaderIndex != -1){ // Card Reader was previously selected
                PTEID_ReaderContext& readerContext = ReaderSet.getReaderByNum(selectedReaderIndex);
                PTEID_CardType CardType = readerContext.getCardType();
                lastFoundCardType = CardType;
                switch (CardType)
                {
                case PTEID_CARDTYPE_IAS07:
                {

                    PTEID_EIDCard& Card = readerContext.getEIDCard();
                    new_card = &Card;
                    //Disable SOD checking, so that we can easily use test cards
                    Card.doSODCheck(false);
                    break;
                }
                    
                case PTEID_CARDTYPE_UNKNOWN:
                default:
                    break;
                }
            }else{ //Card Reader was not previously selected
                if(CardIdx == 1){
                    PTEID_ReaderContext& readerContext = ReaderSet.getReaderByNum(tempReaderIndex);
                    PTEID_CardType CardType = readerContext.getCardType();
                    lastFoundCardType = CardType;
                    switch (CardType)
                    {
                        case PTEID_CARDTYPE_IAS07:
                        {

                            PTEID_EIDCard& Card = readerContext.getEIDCard();
                            new_card = &Card;
                            //Disable SOD checking, so that we can easily use test cards
                            Card.doSODCheck(false);
                            break;
                        }
                            
                        case PTEID_CARDTYPE_UNKNOWN:
                        default:
                            break;
                    }
                }
                if(CardIdx > 1 && selectedReaderIndex == -1){
                    emit signalReaderContext();
                    selectedReaderIndex = -1;
                }
                else{
                    if (!bCardPresent)
                    {
                        emit signalCardAccessError(NoCardFound);
                    }
                    else if (CardIdx == 1 && lastFoundCardType == PTEID_CARDTYPE_UNKNOWN)
                    {
                        selectedReaderIndex = -1;
                        emit signalCardAccessError(CardUnknownError);
                    }
                    else if (CardIdx == 1 && lastFoundCardType != PTEID_CARDTYPE_UNKNOWN)
                    {
                        selectedReaderIndex = tempReaderIndex;
                    }
                }
            }
        }
    }
    catch (PTEID_ExParamRange e)
    {
        PTEID_LOG(PTEID_LOG_LEVEL_DEBUG, "eidgui", "loadCardData failed with error code 0x%08x", e.GetError());
        emit signalCardAccessError(CardUnknownError);
    }
    catch (PTEID_ExNoCardPresent e)
    {
        PTEID_LOG(PTEID_LOG_LEVEL_DEBUG, "eidgui", "loadCardData failed with error code 0x%08x", e.GetError());
        emit signalCardAccessError(NoCardFound);
    }
    catch (PTEID_ExCardChanged e)
    {
        PTEID_LOG(PTEID_LOG_LEVEL_DEBUG, "eidgui", "loadCardData failed with error code 0x%08x", e.GetError());
        emit signalCardAccessError(CardUnknownError);
    }
    catch (PTEID_ExBadTransaction& e)
    {
        PTEID_LOG(PTEID_LOG_LEVEL_DEBUG, "eidgui", "loadCardData failed with error code 0x%08x", e.GetError());
        emit signalCardAccessError(CardUnknownError);
    }
    catch (PTEID_ExCertNoRoot& e)
    {
        PTEID_LOG(PTEID_LOG_LEVEL_DEBUG, "eidgui", "loadCardData failed with error code 0x%08x", e.GetError());
        emit signalCardAccessError(CardUnknownError);
    }
    catch (PTEID_Exception e)
    {
        PTEID_LOG(PTEID_LOG_LEVEL_DEBUG, "eidgui", "loadCardData failed with error code 0x%08x", e.GetError());
        emit signalCardAccessError(CardUnknownError);
    }
}

void GAPI::setReaderByUser(unsigned long setReaderIndex){

    qDebug() << "AppController GAPI::setReader!" << setReaderIndex;

    if (setReaderIndex >= ReaderSet.readerCount()) {
        setReaderIndex = ReaderSet.readerCount() - 1;
    }
    selectedReaderIndex = setReaderIndex;
}

QVariantList GAPI::getRetReaderList()
{
    qDebug() << "AppController GAPI::getRetReaderList!" ;

    QVariantList list;

    try {
        const char* const* ReaderList = ReaderSet.readerList();

        for (unsigned long Idx=0; Idx < ReaderSet.readerCount(); Idx++)
        {
            const char* readerName = ReaderList[Idx];
            list << readerName;
        }
        if ( selectedReaderIndex >= 0 ) {
            if ((unsigned long)selectedReaderIndex >= ReaderSet.readerCount()) {
                selectedReaderIndex = ReaderSet.readerCount() - 1;
            }
            emit signalSetReaderComboIndex(selectedReaderIndex);
        }


    }catch (PTEID_Exception& e) {
        qDebug() << "Error getRetReaderList!" ;
    }

    return list;
}

void GAPI::connectToCard() {

    BEGIN_TRY_CATCH

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return;

    PTEID_EId &eid_file = card->getID();

    qDebug() << "C++: loading Card Data";

    QMap<IDInfoKey, QString> cardData;

    cardData[Surname] = QString::fromUtf8(eid_file.getSurname());
    cardData[Givenname] = QString::fromUtf8(eid_file.getGivenName());
    cardData[Sex] =       QString::fromUtf8(eid_file.getGender());
    cardData[Height] = QString::fromUtf8(eid_file.getHeight());
    cardData[Country] = QString::fromUtf8(eid_file.getCountry());
    cardData[Birthdate] = QString::fromUtf8(eid_file.getDateOfBirth());
    cardData[Father] = QString::fromUtf8(eid_file.getGivenNameFather()) + " " +
            QString::fromUtf8(eid_file.getSurnameFather());
    cardData[Mother] = QString::fromUtf8(eid_file.getGivenNameMother()) + " " +
            QString::fromUtf8(eid_file.getSurnameMother());
    cardData[Documenttype] = QString::fromUtf8(eid_file.getDocumentType());
    cardData[Documentnum] = QString::fromUtf8(eid_file.getDocumentNumber());
    cardData[Documentversion] = QString::fromUtf8(eid_file.getDocumentVersion());
    cardData[Nationality] = QString::fromUtf8(eid_file.getNationality());
    cardData[Validityenddate] = QString::fromUtf8(eid_file.getValidityEndDate());
    cardData[Validitybegindate] = QString::fromUtf8(eid_file.getValidityBeginDate());
    cardData[PlaceOfRequest] = QString::fromUtf8(eid_file.getLocalofRequest());
    cardData[IssuingEntity] = QString::fromUtf8(eid_file.getIssuingEntity());
    cardData[NISS] = QString::fromUtf8(eid_file.getSocialSecurityNumber());
    cardData[NSNS] = QString::fromUtf8(eid_file.getHealthNumber());
    cardData[NIF]  = QString::fromUtf8(eid_file.getTaxNo());

    //Load photo into a QPixmap
    PTEID_ByteArray& photo = eid_file.getPhotoObj().getphoto();

    QPixmap image_photo;
    image_photo.loadFromData(photo.GetBytes(), photo.Size(), "PNG");

    image_provider->setPixmap(image_photo);

    //All data loaded: we can emit the signal to QML
    setDataCardIdentify(cardData);

    END_TRY_CATCH
}

//****************************************************
// Callback function used by the Readercontext to notify insertion/removal of a card
// The callback comes at:
// - startup
// - insertion of a card
// - removal of a card
// - add/remove of a cardreader
// When a card is inserted we post a signal to the GUI telling that
// a new card is inserted.
//****************************************************
void cardEventCallback(long lRet, unsigned long ulState, CallBackData* pCallBackData)
{
    g_runningCallback++;

    try
    {
        PTEID_ReaderContext& readerContext = ReaderSet.getReaderByName(pCallBackData->getReaderName().toLatin1());

        //------------------------------------
        // is card retracted from reader?
        //------------------------------------
        if (!readerContext.isCardPresent())
        {
            //------------------------------------
            // send an event to the main app to show the popup message
            //------------------------------------
            if(pCallBackData->getMainWnd()->returnReaderSelected() != -1){
                pCallBackData->getMainWnd()->signalCardChanged(GAPI::ET_CARD_CHANGED);
            }else{
                pCallBackData->getMainWnd()->signalCardChanged(GAPI::ET_CARD_REMOVED);
            }
            pCallBackData->getMainWnd()->setAddressLoaded(false);
            pCallBackData->getMainWnd()->resetReaderSelected();

            g_runningCallback--;
            return;
        }
        //------------------------------------
        // is card inserted ?
        //------------------------------------
        if (readerContext.isCardChanged(pCallBackData->m_cardID))
        {
            //------------------------------------
            // send an event to the main app to show the popup message
            //------------------------------------
            pCallBackData->getMainWnd()->signalCardChanged(GAPI::ET_CARD_CHANGED);
            pCallBackData->getMainWnd()->setAddressLoaded(false);
            pCallBackData->getMainWnd()->resetReaderSelected();
        }
    }
    catch (...)
    {
        emit pCallBackData->getMainWnd()->signalCardAccessError(GAPI::CardUnknownError);
        // we catch ALL exceptions. This is because otherwise the thread throwing the exception stops
    }
    g_runningCallback--;
}

//*****************************************************
// update the readerlist. In case a reader is added to the machine
// at runtime.
//*****************************************************
void GAPI::updateReaderList( void )
{
    //----------------------------------------------------
    // check if the number of readers is changed
    //----------------------------------------------------
    try
    {
        if (ReaderSet.isReadersChanged())
        {
            stopAllEventCallbacks();
            ReaderSet.releaseReaders();

                    if ( 0 == ReaderSet.readerCount() ){
                        emit signalCardAccessError(NoReaderFound);
                      }
        }
        if ( 0 == m_callBackHandles.size() )
        {
            setEventCallbacks();
        }
    }
    catch(...)
    {
        stopAllEventCallbacks();
        ReaderSet.releaseReaders();
    }
}
void GAPI::setEventCallbacks( void )
{
    //----------------------------------------
    // for all the readers, create a callback such we can know
    // afterwards, which reader called us
    //----------------------------------------

    try
    {
        size_t maxcount=ReaderSet.readerCount(true);
        for (size_t Ix=0; Ix<maxcount; Ix++)
        {
            void (*fCallback)(long lRet, unsigned long ulState, void* pCBData);

            const char*			 readerName		= ReaderSet.getReaderName(Ix);
            PTEID_ReaderContext& readerContext  = ReaderSet.getReaderByNum(Ix);
            CallBackData*		 pCBData		= new CallBackData(readerName, this);

            fCallback = (void (*)(long,unsigned long,void *))&cardEventCallback;

            m_callBackHandles[readerName] = readerContext.SetEventCallback(fCallback, pCBData);
            m_callBackData[readerName]	  = pCBData;
        }
    }
    catch(PTEID_Exception& e)
    {
        emit signalCardChanged(ET_UNKNOWN);
    }
}

//*****************************************************
// stop the event callbacks and delete the corresponding callback data
// objects.
//*****************************************************
void GAPI::stopAllEventCallbacks( void )
{

    for (tCallBackHandles::iterator it = m_callBackHandles.begin()
            ; it != m_callBackHandles.end()
            ; it++
    )
    {
        PTEID_ReaderContext& readerContext = ReaderSet.getReaderByName(it.key().toLatin1());
        unsigned long handle = it.value();
        readerContext.StopEventCallback(handle);
    }
    m_callBackHandles.clear();
    cleanupCallbackData();
}

//*****************************************************
// cleanup the callback data
//*****************************************************
void GAPI::cleanupCallbackData(void)
{

    while(g_runningCallback)
    {
//#ifdef WIN32
//        ::Sleep(100);
//#else
//        ::usleep(100000);
//#endif
    }

    g_cleaningCallback = true;

    for (tCallBackData::iterator it = m_callBackData.begin()
            ; it != m_callBackData.end()
            ; it++
    )
    {
        CallBackData* pCallbackData = it.value();
        delete pCallbackData;
    }
    m_callBackData.clear();
    g_cleaningCallback = false;
}

void GAPI::startGetCardActivation( void ) {

    connect(this, SIGNAL(getCertificateAuthStatusFinished(int)),
            this, SLOT(showCertificateAuthStatus(int)), Qt::UniqueConnection);

    QtConcurrent::run(this, &GAPI::getCertificateAuthStatus);
}

void GAPI::showCertificateAuthStatus(int certificateStatus)
{
    QString returnString;

    returnString = getCardActivation();

    emit signalShowCardActivation(returnString);
}

void GAPI::getCertificateAuthStatus ( void )
{
    int certificateStatus = PTEID_CERTIF_STATUS_UNKNOWN;

    qDebug() << "getCertificateAuthStatus";

    BEGIN_TRY_CATCH

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return;

    PTEID_Certificates&	 certificates	= card->getCertificates();

    certificateStatus = certificates.getCert(PTEID_Certificate::CITIZEN_AUTH).getStatus();

    emit getCertificateAuthStatusFinished(certificateStatus);

    END_TRY_CATCH
}

void GAPI::startSigningWalletAddress(QString walletAddress) {

    QFuture<void> future =
            QtConcurrent::run(this, &GAPI::doSignWalletAddress, walletAddress);

}

//TODO: walletAddress should be the plain version of the wallet address with 0x prefix
//TODO: clarify if we need to sign the Ethereum public key instead
void GAPI::doSignWalletAddress(QString walletAddress) {
    const int ETH_WALLET_ADDR_SIZE = 40;

    qDebug() << "doSignWalletAddress = " << walletAddress;

    BEGIN_TRY_CATCH

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);

    if (card == NULL) return;

    if (walletAddress.size() != ETH_WALLET_ADDR_SIZE && 
        walletAddress.size() != ETH_WALLET_ADDR_SIZE+2) {
        qDebug() << "Invalid walletAddress!";
        emit signalWalletAddressSignFail();
        return;
    }
    
    //Skip the 0x prefix if present.
    QByteArray signatureInput = walletAddress.size() == ETH_WALLET_ADDR_SIZE ? QByteArray::fromHex(walletAddress.toUtf8()) :
                                   QByteArray::fromHex(walletAddress.right(ETH_WALLET_ADDR_SIZE).toUtf8());

    QCryptographicHash sha256(QCryptographicHash::Sha256);
    sha256.addData(signatureInput);

    QByteArray res = sha256.result();

    PTEID_ByteArray inputData((const unsigned char*)res.constData(), 32);

    PTEID_ByteArray signatureData = card->SignSHA256(inputData);

    QByteArray ba((const char *)signatureData.GetBytes(), signatureData.Size());

    emit signalWalletAddressSignSuccess(ba.toHex(0));

    END_TRY_CATCH
}

void GAPI::startGettingSod() {

    QFuture<void> future =
            QtConcurrent::run(this, &GAPI::doGetSod);

}

unsigned int parseSODLength(const unsigned char *sodData) {

    if (sodData != NULL) {
        return (sodData[2] << 8) + sodData[3] + 4; // Plus 4 accounts for the Initial Tag and Length (77 82 XX XX)
    }
    else
        return 0;
}

void GAPI::doGetSod() {

    qDebug() << "doGetSod";

    BEGIN_TRY_CATCH

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return;

    PTEID_Sod& sodFile = card->getSod();
    PTEID_ByteArray sodData = sodFile.getData();

    unsigned int sodLength = parseSODLength(sodData.GetBytes());
    //qDebug() << "Parsed SOD Length: " << sodLength;

    QByteArray ba((const char *)sodData.GetBytes(), sodLength);

    emit signalGetSodSucess(ba.toHex(0));

    END_TRY_CATCH
}

void GAPI::startGettingCertificate() {

    QFuture<void> future =
            QtConcurrent::run(this, &GAPI::doGetCertificate);

}

void GAPI::doGetCertificate() {

    qDebug() << "doGetCertificate";

    BEGIN_TRY_CATCH

    PTEID_EIDCard * card = NULL;
    getCardInstance(card);
    if (card == NULL) return;
    PTEID_Certificates &certs = card->getCertificates();
    PTEID_ByteArray certData;

    certs.getCert(PTEID_Certificate::CITIZEN_AUTH).getFormattedData(certData);

    QByteArray ba((const char *)certData.GetBytes(), certData.Size());

    emit signalGetCertificateSucess(ba.toHex(0));

    END_TRY_CATCH
}
