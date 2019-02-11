#include "gapi.h"
#include <QString>
#include <QVector>
#include <QDate>
#include <QtConcurrent>
#include <cstdio>
#include <QQuickImageProvider>
#include <QCryptographicHash>
#include <QClipboard>
#include <QByteArray>
#include "qpainter.h"
#include "eidlib.h"

#include <openssl/bio.h>
#include <openssl/x509.h>

using namespace eIDMW;

#define TRIES_LEFT_ERROR    1000

static  bool    g_cleaningCallback=false;
static  int g_runningCallback=0;

/*
    GAPI - Graphic Application Programming Interface
*/

GAPI::GAPI(QObject *parent) :
    QObject(parent) {
    m_addressLoaded = false;

    cmd_signature = new eIDMW::CMDSignature( );

    //----------------------------------
    // set a timer to check if the number of card readers is changed
    //----------------------------------
    m_timerReaderList = new QTimer(this);
    connect(m_timerReaderList, SIGNAL(timeout()), this, SLOT(updateReaderList()));
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

void GAPI::setTextClipboard(QString text){

    qDebug() << "C++: setTextClipboard";

    QClipboard *p_Clipboard = NULL;
    p_Clipboard->setText(text);
}
/*
 * IDType : CC_PT
 * ITName : Cartão de Cidadão - Portuguese Republic
 *
 */
void GAPI::setCardReadersCheck(bool status){

    if(status)
    {
        m_timerReaderList->start(TIMERREADERLIST);
    }else{
        m_timerReaderList->stop();
        stopAllEventCallbacks();
    };
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
        m_addressData[CountryCode] = QString::fromUtf8(addressFile.getCountryCode());
        m_addressData[GeneratedAddressCode] = QString::fromUtf8(addressFile.getGeneratedAddressCode());
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
        m_addressData[CountryCode] = QString::fromUtf8(addressFile.getCountryCode());
        m_addressData[District] = QString::fromUtf8(addressFile.getDistrict());
        m_addressData[DistrictCode] = QString::fromUtf8(addressFile.getDistrictCode());
        m_addressData[Municipality] = QString::fromUtf8(addressFile.getMunicipality());
        m_addressData[MunicipalityCode] = QString::fromUtf8(addressFile.getMunicipalityCode());
        m_addressData[Parish] = QString::fromUtf8(addressFile.getCivilParish());
        m_addressData[ParishCode] = QString::fromUtf8(addressFile.getCivilParishCode());
        m_addressData[Streettype] = QString::fromUtf8(addressFile.getStreetType());
        m_addressData[AbbrStreetType] = QString::fromUtf8(addressFile.getAbbrStreetType());
        m_addressData[Streetname] = QString::fromUtf8(addressFile.getStreetName());
        m_addressData[Buildingtype] = QString::fromUtf8(addressFile.getBuildingType());
        m_addressData[AbbrBuildingType] = QString::fromUtf8(addressFile.getAbbrBuildingType());
        m_addressData[Doorno] = QString::fromUtf8(addressFile.getDoorNo());
        m_addressData[Floor] = QString::fromUtf8(addressFile.getFloor());
        m_addressData[Side] = QString::fromUtf8(addressFile.getSide());
        m_addressData[Locality] = QString::fromUtf8(addressFile.getLocality());
        m_addressData[Place] = QString::fromUtf8(addressFile.getPlace());
        m_addressData[Zip4] = QString::fromUtf8(addressFile.getZip4());
        m_addressData[Zip3] = QString::fromUtf8(addressFile.getZip3());
        m_addressData[PostalLocality] = QString::fromUtf8(addressFile.getPostalLocality());
        m_addressData[GeneratedAddressCode] = QString::fromUtf8(addressFile.getGeneratedAddressCode());
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

    cardData[GivenNameFather] = QString::fromUtf8(eid_file.getGivenNameFather());
    cardData[SurnameFather] = QString::fromUtf8(eid_file.getSurnameFather());
    cardData[GivenNameMother] = QString::fromUtf8(eid_file.getGivenNameMother());
    cardData[SurnameMother] = QString::fromUtf8(eid_file.getSurnameMother());

    cardData[Documenttype] = QString::fromUtf8(eid_file.getDocumentType());
    cardData[Documentnum] = QString::fromUtf8(eid_file.getDocumentNumber());
    cardData[CivilianIdNumber] = QString::fromUtf8(eid_file.getCivilianIdNumber());
    cardData[Documentversion] = QString::fromUtf8(eid_file.getDocumentVersion());
    cardData[DocumentPAN] = QString::fromUtf8(eid_file.getDocumentPAN());
    cardData[Nationality] = QString::fromUtf8(eid_file.getNationality());
    cardData[Validityenddate] = QString::fromUtf8(eid_file.getValidityEndDate());
    cardData[Validitybegindate] = QString::fromUtf8(eid_file.getValidityBeginDate());
    cardData[PlaceOfRequest] = QString::fromUtf8(eid_file.getLocalofRequest());
    cardData[IssuingEntity] = QString::fromUtf8(eid_file.getIssuingEntity());
    cardData[NISS] = QString::fromUtf8(eid_file.getSocialSecurityNumber());
    cardData[NSNS] = QString::fromUtf8(eid_file.getHealthNumber());
    cardData[NIF]  = QString::fromUtf8(eid_file.getTaxNo());

    cardData[Validation] = QString::fromUtf8(eid_file.getValidation());
    cardData[MRZ1] = QString::fromUtf8(eid_file.getMRZ1());
    cardData[MRZ2] = QString::fromUtf8(eid_file.getMRZ2());
    cardData[MRZ3] = QString::fromUtf8(eid_file.getMRZ3());
    cardData[AccidentalIndications] = QString::fromUtf8(eid_file.getAccidentalIndications());

    //Load photo into a QPixmap
    PTEID_ByteArray& photo = eid_file.getPhotoObj().getphoto();

    QPixmap image_photo;
    image_photo.loadFromData(photo.GetBytes(), photo.Size(), "PNG");

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

void GAPI::startSigningWalletAddress(QString walletAddress) {

    QFuture<void> future =
            QtConcurrent::run(this, &GAPI::doSignWalletAddress, walletAddress);

}

//TODO: walletAddress should be the plain version of the wallet address with 0x prefix
//TODO: clarify if we need to sign the Ethereum public key instead
void GAPI::doSignWalletAddress(QString walletAddress) {

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

/*
 * IDType : CMD_PT
 * ITName : Chave Móvel Digital - Portuguese Republic
 *
 */

void GAPI::signOpenCMD(QString mobileNumber, QString secret_code, QString wa)
{
    signalUpdateProgressStatus(tr("STR_CONNECTING_CMD_PT"));

    connect(this, SIGNAL(signCMDFinished(long)),
            this, SLOT(showSignCMDDialog(long)), Qt::UniqueConnection);

    CmdSignParams params;

    params.secret_code = secret_code;
    params.mobileNumber = mobileNumber;
    params.page = 1;
    params.coord_x = 0;
    params.coord_y = 0;
    params.wa = wa;

    QString walletAddress = params.wa;

    if (walletAddress.size() != ETH_WALLET_ADDR_SIZE &&
        walletAddress.size() != ETH_WALLET_ADDR_SIZE+2) {
        qDebug() << "Invalid walletAddress!";
        emit signalWalletAddressSignFail();
        return;
    }

    QByteArray signatureInput = walletAddress.size() == ETH_WALLET_ADDR_SIZE
            ? QByteArray::fromHex(walletAddress.toUtf8()) :
              QByteArray::fromHex(walletAddress.right(ETH_WALLET_ADDR_SIZE).toUtf8());

    cmd_signature->set_string_handler(params.wa.toStdString(), signatureInput);

    QtConcurrent::run(this, &GAPI::doOpenSignCMD, cmd_signature, params);
}

void GAPI::doOpenSignCMD(CMDSignature *cmd_signature, CmdSignParams &params)
{
    qDebug() << "GAPI: doOpenSignCMD! MobileNumber = " << params.mobileNumber
             << " secret_code = " << params.secret_code
             << " wa = " << params.wa;

    int ret = 0;

    try {
        signalUpdateProgressBar(25);
        CMDProxyInfo proxyInfo; // TODO: Implement proxyinfo
        ret = cmd_signature->signOpen(proxyInfo,
                                      params.mobileNumber.toStdString(),
                                      params.secret_code.toStdString(),
                                      params.page,
                                      params.coord_x, params.coord_y,
                                      params.location.toUtf8().data(), params.reason.toUtf8().data(),
                                      "");
         if ( ret != 0 ) {
            qDebug() << "signOpen failed! - ret: " << ret << endl;

            signCMDFinished(ret);
            signalUpdateProgressBar(100);
            return;
        }


    } catch (PTEID_Exception &e) {
        qDebug() << "Caught exception in some SDK method. Error code: " << hex << e.GetError() << endl;
        signalUpdateProgressBar(100);
    }

    signalUpdateProgressBar(50);
    signalUpdateProgressStatus(tr("STR_LOGIN_SUCESS_CMD_PT"));
    emit signalOpenCMDSucess();
}

void GAPI::signCloseCMD(QString sms_token)
{
    qDebug() << "GAPI: signCloseCMD! sms_token = " + sms_token;

    signalUpdateProgressStatus(tr("STR_SENDING_CODE_CMD_PT"));

    QtConcurrent::run(this, &GAPI::doCloseSignCMD, cmd_signature, sms_token);
}

void GAPI::doCloseSignCMD(CMDSignature *cmd_signature, QString sms_token)
{
    qDebug() << "doCloseSignCMD! " << "sms_token = " << sms_token;

    int ret = 0;
    std::string local_sms_token = sms_token.toUtf8().data();

    try {
        signalUpdateProgressBar(75);
        ret = cmd_signature->signClose(local_sms_token);
        if ( ret != 0 ) {
            qDebug() << "signClose failed!" << endl;
            signCMDFinished(ret);
            signalUpdateProgressBar(100);
            return;
        }

    } catch (PTEID_Exception &e) {
        qDebug() << "Caught exception in some SDK method. Error code: " << hex << e.GetError() << endl;
    }

    QByteArray cert(cmd_signature->m_string_certificate.c_str(),
                    cmd_signature->m_string_certificate.length());

    QByteArray certHex = QByteArray::fromHex(cert);

    parseCitizenDataFromCert(certHex);

    signCMDFinished(ret);
    signalUpdateProgressBar(100);

    emit signalWalletAddressSignSuccess(QString::fromStdString(cmd_signature->m_string_signature));
    emit signalGetCertificateSucess(QString::fromStdString(cmd_signature->m_string_certificate));
    emit signalCloseCMDSucess(m_citizen_fullname,m_civil_number,citizenBirthDate);

    qDebug() << "signClose success!" << endl;
}

void GAPI::parseCitizenDataFromCert(QByteArray &certData) {
    const int cert_field_size = 256;
    const int dateOfBirth_offset = 18;
    char myDate[15];

    char * cert_data = certData.data();
    char *data_serial = (char *)malloc(cert_field_size);
    char *data_common_name = (char *)malloc(cert_field_size);

    X509 *x509 = d2i_X509(NULL, (const unsigned char**)&cert_data, certData.size());

    if (x509 == NULL) {
        qDebug("parseCitizenDataFromCert() Error decoding certificate data!");
        free(data_serial);
        free(data_common_name);
        return;
    }

    X509_NAME * subj = X509_get_subject_name(x509);
    X509_NAME_get_text_by_NID(subj, NID_serialNumber, data_serial, cert_field_size);
    X509_NAME_get_text_by_NID(subj, NID_commonName, data_common_name, cert_field_size);

    m_civil_number = data_serial;
    m_citizen_fullname = data_common_name;

    int loc = X509_get_ext_by_NID(x509, NID_subject_directory_attributes, -1);
    X509_EXTENSION *ex = X509_get_ext(x509, loc);
    ASN1_OCTET_STRING* octet_str = X509_EXTENSION_get_data(ex);
    const unsigned char* octet_str_data = octet_str->data;
    const unsigned char * generalized_time_ptr = octet_str_data + dateOfBirth_offset;

    memset(myDate, 0, sizeof(myDate));
    memcpy(myDate, generalized_time_ptr, sizeof(myDate)-1);

    QString formatIn = "yyyyMMddHHmmss";
    QString date = QString::fromUtf8(myDate);
    QDateTime time = QDateTime::fromString(date, formatIn);
    QString formatOut = "yyyy-MM-dd";

    citizenBirthDate = time.toString(formatOut);

    qDebug() << "m_civil_number: " + m_civil_number;
    qDebug() << "m_citizen_fullname: " + m_citizen_fullname;
    qDebug() << "citizenBirthDate: " + citizenBirthDate;

    X509_free(x509);
}

void GAPI::showSignCMDDialog(long code)
{
    QString error_msg;
    QString support_string = tr("STR_ERROR_MSG_CMD_PT");

    PTEID_LOG(PTEID_LOG_LEVEL_ERROR, "eidgui", "CMD signature op finished with error code 0x%08x", code);

    // TODO: Add messages to network errors
    switch(code)
    {
        case 0:
            error_msg = tr("STR_SUCESS_CMD_PT");
            break;
        case -1:
            error_msg = tr("STR_TIMEOUT_ERROR_CMD_PT");
            break;
        default:
            error_msg = tr("STR_LOGIN_ERROR_CMD_PT");
            break;
    }

    if (code != 0)
        error_msg += "\n\n" + support_string;

    qDebug() << error_msg;
    signalUpdateProgressStatus(error_msg);
}
