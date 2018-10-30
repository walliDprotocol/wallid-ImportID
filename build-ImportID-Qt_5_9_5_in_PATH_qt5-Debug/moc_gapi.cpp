/****************************************************************************
** Meta object code from reading C++ file 'gapi.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.9.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../src/gapi.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gapi.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.9.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GAPI_t {
    QByteArrayData data[142];
    char stringdata0[2044];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GAPI_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GAPI_t qt_meta_stringdata_GAPI = {
    {
QT_MOC_LITERAL(0, 0, 4), // "GAPI"
QT_MOC_LITERAL(1, 5, 26), // "signalLanguageChangedError"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 19), // "signalReaderContext"
QT_MOC_LITERAL(4, 53, 25), // "signalSetReaderComboIndex"
QT_MOC_LITERAL(5, 79, 15), // "selected_reader"
QT_MOC_LITERAL(6, 95, 21), // "signalCardDataChanged"
QT_MOC_LITERAL(7, 117, 19), // "signalAddressLoaded"
QT_MOC_LITERAL(8, 137, 9), // "m_foreign"
QT_MOC_LITERAL(9, 147, 21), // "signalCardAccessError"
QT_MOC_LITERAL(10, 169, 10), // "error_code"
QT_MOC_LITERAL(11, 180, 18), // "signalGenericError"
QT_MOC_LITERAL(12, 199, 21), // "signalPersoDataLoaded"
QT_MOC_LITERAL(13, 221, 10), // "persoNotes"
QT_MOC_LITERAL(14, 232, 26), // "signalAddressLoadedChanged"
QT_MOC_LITERAL(15, 259, 17), // "signalCardChanged"
QT_MOC_LITERAL(16, 277, 25), // "signalCertificatesChanged"
QT_MOC_LITERAL(17, 303, 15), // "certificatesMap"
QT_MOC_LITERAL(18, 319, 24), // "signalShowCardActivation"
QT_MOC_LITERAL(19, 344, 13), // "statusMessage"
QT_MOC_LITERAL(20, 358, 30), // "signalWalletAddressSignSuccess"
QT_MOC_LITERAL(21, 389, 19), // "walletAddressSigned"
QT_MOC_LITERAL(22, 409, 27), // "signalWalletAddressSignFail"
QT_MOC_LITERAL(23, 437, 18), // "signalGetSodSucess"
QT_MOC_LITERAL(24, 456, 3), // "Sod"
QT_MOC_LITERAL(25, 460, 26), // "signalGetCertificateSucess"
QT_MOC_LITERAL(26, 487, 11), // "Certificate"
QT_MOC_LITERAL(27, 499, 23), // "signalUpdateProgressBar"
QT_MOC_LITERAL(28, 523, 5), // "value"
QT_MOC_LITERAL(29, 529, 26), // "signalUpdateProgressStatus"
QT_MOC_LITERAL(30, 556, 19), // "signalOpenCMDSucess"
QT_MOC_LITERAL(31, 576, 20), // "signalCloseCMDSucess"
QT_MOC_LITERAL(32, 597, 15), // "signCMDFinished"
QT_MOC_LITERAL(33, 613, 11), // "return_code"
QT_MOC_LITERAL(34, 625, 15), // "initTranslation"
QT_MOC_LITERAL(35, 641, 16), // "setTextClipboard"
QT_MOC_LITERAL(36, 658, 4), // "text"
QT_MOC_LITERAL(37, 663, 16), // "getRetReaderList"
QT_MOC_LITERAL(38, 680, 15), // "setReaderByUser"
QT_MOC_LITERAL(39, 696, 14), // "setReaderIndex"
QT_MOC_LITERAL(40, 711, 19), // "resetReaderSelected"
QT_MOC_LITERAL(41, 731, 20), // "returnReaderSelected"
QT_MOC_LITERAL(42, 752, 10), // "signed int"
QT_MOC_LITERAL(43, 763, 16), // "setAddressLoaded"
QT_MOC_LITERAL(44, 780, 13), // "addressLoaded"
QT_MOC_LITERAL(45, 794, 16), // "startCardReading"
QT_MOC_LITERAL(46, 811, 19), // "startReadingAddress"
QT_MOC_LITERAL(47, 831, 16), // "verifyAddressPin"
QT_MOC_LITERAL(48, 848, 3), // "pin"
QT_MOC_LITERAL(49, 852, 24), // "getDataCardIdentifyValue"
QT_MOC_LITERAL(50, 877, 15), // "GAPI::IDInfoKey"
QT_MOC_LITERAL(51, 893, 3), // "key"
QT_MOC_LITERAL(52, 897, 15), // "getAddressField"
QT_MOC_LITERAL(53, 913, 20), // "GAPI::AddressInfoKey"
QT_MOC_LITERAL(54, 934, 17), // "setEventCallbacks"
QT_MOC_LITERAL(55, 952, 19), // "setCardReadersCheck"
QT_MOC_LITERAL(56, 972, 6), // "status"
QT_MOC_LITERAL(57, 979, 16), // "updateReaderList"
QT_MOC_LITERAL(58, 996, 25), // "startSigningWalletAddress"
QT_MOC_LITERAL(59, 1022, 13), // "walletAddress"
QT_MOC_LITERAL(60, 1036, 15), // "startGettingSod"
QT_MOC_LITERAL(61, 1052, 23), // "startGettingCertificate"
QT_MOC_LITERAL(62, 1076, 11), // "signOpenCMD"
QT_MOC_LITERAL(63, 1088, 12), // "mobileNumber"
QT_MOC_LITERAL(64, 1101, 11), // "secret_code"
QT_MOC_LITERAL(65, 1113, 2), // "wa"
QT_MOC_LITERAL(66, 1116, 12), // "signCloseCMD"
QT_MOC_LITERAL(67, 1129, 9), // "sms_token"
QT_MOC_LITERAL(68, 1139, 17), // "showSignCMDDialog"
QT_MOC_LITERAL(69, 1157, 4), // "code"
QT_MOC_LITERAL(70, 1162, 13), // "m_addressData"
QT_MOC_LITERAL(71, 1176, 28), // "QMap<AddressInfoKey,QString>"
QT_MOC_LITERAL(72, 1205, 9), // "persoData"
QT_MOC_LITERAL(73, 1215, 9), // "IDInfoKey"
QT_MOC_LITERAL(74, 1225, 12), // "Documenttype"
QT_MOC_LITERAL(75, 1238, 15), // "Documentversion"
QT_MOC_LITERAL(76, 1254, 11), // "DocumentPAN"
QT_MOC_LITERAL(77, 1266, 7), // "Surname"
QT_MOC_LITERAL(78, 1274, 9), // "Givenname"
QT_MOC_LITERAL(79, 1284, 3), // "Sex"
QT_MOC_LITERAL(80, 1288, 6), // "Height"
QT_MOC_LITERAL(81, 1295, 11), // "Nationality"
QT_MOC_LITERAL(82, 1307, 9), // "Birthdate"
QT_MOC_LITERAL(83, 1317, 11), // "Documentnum"
QT_MOC_LITERAL(84, 1329, 16), // "CivilianIdNumber"
QT_MOC_LITERAL(85, 1346, 17), // "Validitybegindate"
QT_MOC_LITERAL(86, 1364, 15), // "Validityenddate"
QT_MOC_LITERAL(87, 1380, 3), // "NIC"
QT_MOC_LITERAL(88, 1384, 3), // "NIF"
QT_MOC_LITERAL(89, 1388, 4), // "NISS"
QT_MOC_LITERAL(90, 1393, 4), // "NSNS"
QT_MOC_LITERAL(91, 1398, 13), // "IssuingEntity"
QT_MOC_LITERAL(92, 1412, 14), // "PlaceOfRequest"
QT_MOC_LITERAL(93, 1427, 7), // "Country"
QT_MOC_LITERAL(94, 1435, 13), // "SurnameFather"
QT_MOC_LITERAL(95, 1449, 13), // "SurnameMother"
QT_MOC_LITERAL(96, 1463, 15), // "GivenNameFather"
QT_MOC_LITERAL(97, 1479, 15), // "GivenNameMother"
QT_MOC_LITERAL(98, 1495, 10), // "Validation"
QT_MOC_LITERAL(99, 1506, 4), // "MRZ1"
QT_MOC_LITERAL(100, 1511, 4), // "MRZ2"
QT_MOC_LITERAL(101, 1516, 4), // "MRZ3"
QT_MOC_LITERAL(102, 1521, 21), // "AccidentalIndications"
QT_MOC_LITERAL(103, 1543, 14), // "AddressInfoKey"
QT_MOC_LITERAL(104, 1558, 11), // "CountryCode"
QT_MOC_LITERAL(105, 1570, 8), // "District"
QT_MOC_LITERAL(106, 1579, 12), // "DistrictCode"
QT_MOC_LITERAL(107, 1592, 12), // "Municipality"
QT_MOC_LITERAL(108, 1605, 16), // "MunicipalityCode"
QT_MOC_LITERAL(109, 1622, 6), // "Parish"
QT_MOC_LITERAL(110, 1629, 10), // "ParishCode"
QT_MOC_LITERAL(111, 1640, 10), // "Streettype"
QT_MOC_LITERAL(112, 1651, 14), // "AbbrStreetType"
QT_MOC_LITERAL(113, 1666, 10), // "Streetname"
QT_MOC_LITERAL(114, 1677, 12), // "Buildingtype"
QT_MOC_LITERAL(115, 1690, 16), // "AbbrBuildingType"
QT_MOC_LITERAL(116, 1707, 6), // "Doorno"
QT_MOC_LITERAL(117, 1714, 5), // "Floor"
QT_MOC_LITERAL(118, 1720, 4), // "Side"
QT_MOC_LITERAL(119, 1725, 8), // "Locality"
QT_MOC_LITERAL(120, 1734, 5), // "Place"
QT_MOC_LITERAL(121, 1740, 4), // "Zip4"
QT_MOC_LITERAL(122, 1745, 4), // "Zip3"
QT_MOC_LITERAL(123, 1750, 14), // "PostalLocality"
QT_MOC_LITERAL(124, 1765, 20), // "GeneratedAddressCode"
QT_MOC_LITERAL(125, 1786, 14), // "Foreigncountry"
QT_MOC_LITERAL(126, 1801, 14), // "Foreignaddress"
QT_MOC_LITERAL(127, 1816, 11), // "Foreigncity"
QT_MOC_LITERAL(128, 1828, 13), // "Foreignregion"
QT_MOC_LITERAL(129, 1842, 15), // "Foreignlocality"
QT_MOC_LITERAL(130, 1858, 17), // "Foreignpostalcode"
QT_MOC_LITERAL(131, 1876, 15), // "CardAccessError"
QT_MOC_LITERAL(132, 1892, 13), // "NoReaderFound"
QT_MOC_LITERAL(133, 1906, 11), // "NoCardFound"
QT_MOC_LITERAL(134, 1918, 13), // "CardReadError"
QT_MOC_LITERAL(135, 1932, 16), // "SodCardReadError"
QT_MOC_LITERAL(136, 1949, 17), // "CardUserPinCancel"
QT_MOC_LITERAL(137, 1967, 16), // "CardUnknownError"
QT_MOC_LITERAL(138, 1984, 16), // "eCustomEventType"
QT_MOC_LITERAL(139, 2001, 10), // "ET_UNKNOWN"
QT_MOC_LITERAL(140, 2012, 15), // "ET_CARD_CHANGED"
QT_MOC_LITERAL(141, 2028, 15) // "ET_CARD_REMOVED"

    },
    "GAPI\0signalLanguageChangedError\0\0"
    "signalReaderContext\0signalSetReaderComboIndex\0"
    "selected_reader\0signalCardDataChanged\0"
    "signalAddressLoaded\0m_foreign\0"
    "signalCardAccessError\0error_code\0"
    "signalGenericError\0signalPersoDataLoaded\0"
    "persoNotes\0signalAddressLoadedChanged\0"
    "signalCardChanged\0signalCertificatesChanged\0"
    "certificatesMap\0signalShowCardActivation\0"
    "statusMessage\0signalWalletAddressSignSuccess\0"
    "walletAddressSigned\0signalWalletAddressSignFail\0"
    "signalGetSodSucess\0Sod\0"
    "signalGetCertificateSucess\0Certificate\0"
    "signalUpdateProgressBar\0value\0"
    "signalUpdateProgressStatus\0"
    "signalOpenCMDSucess\0signalCloseCMDSucess\0"
    "signCMDFinished\0return_code\0initTranslation\0"
    "setTextClipboard\0text\0getRetReaderList\0"
    "setReaderByUser\0setReaderIndex\0"
    "resetReaderSelected\0returnReaderSelected\0"
    "signed int\0setAddressLoaded\0addressLoaded\0"
    "startCardReading\0startReadingAddress\0"
    "verifyAddressPin\0pin\0getDataCardIdentifyValue\0"
    "GAPI::IDInfoKey\0key\0getAddressField\0"
    "GAPI::AddressInfoKey\0setEventCallbacks\0"
    "setCardReadersCheck\0status\0updateReaderList\0"
    "startSigningWalletAddress\0walletAddress\0"
    "startGettingSod\0startGettingCertificate\0"
    "signOpenCMD\0mobileNumber\0secret_code\0"
    "wa\0signCloseCMD\0sms_token\0showSignCMDDialog\0"
    "code\0m_addressData\0QMap<AddressInfoKey,QString>\0"
    "persoData\0IDInfoKey\0Documenttype\0"
    "Documentversion\0DocumentPAN\0Surname\0"
    "Givenname\0Sex\0Height\0Nationality\0"
    "Birthdate\0Documentnum\0CivilianIdNumber\0"
    "Validitybegindate\0Validityenddate\0NIC\0"
    "NIF\0NISS\0NSNS\0IssuingEntity\0PlaceOfRequest\0"
    "Country\0SurnameFather\0SurnameMother\0"
    "GivenNameFather\0GivenNameMother\0"
    "Validation\0MRZ1\0MRZ2\0MRZ3\0"
    "AccidentalIndications\0AddressInfoKey\0"
    "CountryCode\0District\0DistrictCode\0"
    "Municipality\0MunicipalityCode\0Parish\0"
    "ParishCode\0Streettype\0AbbrStreetType\0"
    "Streetname\0Buildingtype\0AbbrBuildingType\0"
    "Doorno\0Floor\0Side\0Locality\0Place\0Zip4\0"
    "Zip3\0PostalLocality\0GeneratedAddressCode\0"
    "Foreigncountry\0Foreignaddress\0Foreigncity\0"
    "Foreignregion\0Foreignlocality\0"
    "Foreignpostalcode\0CardAccessError\0"
    "NoReaderFound\0NoCardFound\0CardReadError\0"
    "SodCardReadError\0CardUserPinCancel\0"
    "CardUnknownError\0eCustomEventType\0"
    "ET_UNKNOWN\0ET_CARD_CHANGED\0ET_CARD_REMOVED"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GAPI[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      42,   14, // methods
       2,  320, // properties
       4,  328, // enums/sets
       0,    0, // constructors
       0,       // flags
      21,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,  224,    2, 0x06 /* Public */,
       3,    0,  225,    2, 0x06 /* Public */,
       4,    1,  226,    2, 0x06 /* Public */,
       6,    0,  229,    2, 0x06 /* Public */,
       7,    1,  230,    2, 0x06 /* Public */,
       9,    1,  233,    2, 0x06 /* Public */,
      11,    1,  236,    2, 0x06 /* Public */,
      12,    1,  239,    2, 0x06 /* Public */,
      14,    0,  242,    2, 0x06 /* Public */,
      15,    1,  243,    2, 0x06 /* Public */,
      16,    1,  246,    2, 0x06 /* Public */,
      18,    1,  249,    2, 0x06 /* Public */,
      20,    1,  252,    2, 0x06 /* Public */,
      22,    0,  255,    2, 0x06 /* Public */,
      23,    1,  256,    2, 0x06 /* Public */,
      25,    1,  259,    2, 0x06 /* Public */,
      27,    1,  262,    2, 0x06 /* Public */,
      29,    1,  265,    2, 0x06 /* Public */,
      30,    0,  268,    2, 0x06 /* Public */,
      31,    0,  269,    2, 0x06 /* Public */,
      32,    1,  270,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      34,    0,  273,    2, 0x0a /* Public */,
      35,    1,  274,    2, 0x0a /* Public */,
      37,    0,  277,    2, 0x0a /* Public */,
      38,    1,  278,    2, 0x0a /* Public */,
      40,    0,  281,    2, 0x0a /* Public */,
      41,    0,  282,    2, 0x0a /* Public */,
      43,    1,  283,    2, 0x0a /* Public */,
      45,    0,  286,    2, 0x0a /* Public */,
      46,    0,  287,    2, 0x0a /* Public */,
      47,    1,  288,    2, 0x0a /* Public */,
      49,    1,  291,    2, 0x0a /* Public */,
      52,    1,  294,    2, 0x0a /* Public */,
      54,    0,  297,    2, 0x0a /* Public */,
      55,    1,  298,    2, 0x0a /* Public */,
      57,    0,  301,    2, 0x0a /* Public */,
      58,    1,  302,    2, 0x0a /* Public */,
      60,    0,  305,    2, 0x0a /* Public */,
      61,    0,  306,    2, 0x0a /* Public */,
      62,    3,  307,    2, 0x0a /* Public */,
      66,    1,  314,    2, 0x0a /* Public */,
      68,    1,  317,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Long,    5,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    8,
    QMetaType::Void, QMetaType::Int,   10,
    QMetaType::Void, QMetaType::QString,   10,
    QMetaType::Void, QMetaType::QString,   13,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,   10,
    QMetaType::Void, QMetaType::QVariantMap,   17,
    QMetaType::Void, QMetaType::QString,   19,
    QMetaType::Void, QMetaType::QString,   21,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   24,
    QMetaType::Void, QMetaType::QString,   26,
    QMetaType::Void, QMetaType::Int,   28,
    QMetaType::Void, QMetaType::QString,   19,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Long,   33,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   36,
    QMetaType::QVariantList,
    QMetaType::Void, QMetaType::ULong,   39,
    QMetaType::Void,
    0x80000000 | 42,
    QMetaType::Void, QMetaType::Bool,   44,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::UInt, QMetaType::QString,   48,
    QMetaType::QString, 0x80000000 | 50,   51,
    QMetaType::QString, 0x80000000 | 53,   51,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,   56,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   59,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,   63,   64,   65,
    QMetaType::Void, QMetaType::QString,   67,
    QMetaType::Void, QMetaType::Long,   69,

 // properties: name, type, flags
      70, 0x80000000 | 71, 0x00095008,
      72, QMetaType::QString, 0x00495003,

 // properties: notify_signal_id
       0,
       7,

 // enums: name, flags, count, data
      73, 0x0,   29,  344,
     103, 0x0,   27,  402,
     131, 0x0,    6,  456,
     138, 0x0,    3,  468,

 // enum data: key, value
      74, uint(GAPI::Documenttype),
      75, uint(GAPI::Documentversion),
      76, uint(GAPI::DocumentPAN),
      77, uint(GAPI::Surname),
      78, uint(GAPI::Givenname),
      79, uint(GAPI::Sex),
      80, uint(GAPI::Height),
      81, uint(GAPI::Nationality),
      82, uint(GAPI::Birthdate),
      83, uint(GAPI::Documentnum),
      84, uint(GAPI::CivilianIdNumber),
      85, uint(GAPI::Validitybegindate),
      86, uint(GAPI::Validityenddate),
      87, uint(GAPI::NIC),
      88, uint(GAPI::NIF),
      89, uint(GAPI::NISS),
      90, uint(GAPI::NSNS),
      91, uint(GAPI::IssuingEntity),
      92, uint(GAPI::PlaceOfRequest),
      93, uint(GAPI::Country),
      94, uint(GAPI::SurnameFather),
      95, uint(GAPI::SurnameMother),
      96, uint(GAPI::GivenNameFather),
      97, uint(GAPI::GivenNameMother),
      98, uint(GAPI::Validation),
      99, uint(GAPI::MRZ1),
     100, uint(GAPI::MRZ2),
     101, uint(GAPI::MRZ3),
     102, uint(GAPI::AccidentalIndications),
     104, uint(GAPI::CountryCode),
     105, uint(GAPI::District),
     106, uint(GAPI::DistrictCode),
     107, uint(GAPI::Municipality),
     108, uint(GAPI::MunicipalityCode),
     109, uint(GAPI::Parish),
     110, uint(GAPI::ParishCode),
     111, uint(GAPI::Streettype),
     112, uint(GAPI::AbbrStreetType),
     113, uint(GAPI::Streetname),
     114, uint(GAPI::Buildingtype),
     115, uint(GAPI::AbbrBuildingType),
     116, uint(GAPI::Doorno),
     117, uint(GAPI::Floor),
     118, uint(GAPI::Side),
     119, uint(GAPI::Locality),
     120, uint(GAPI::Place),
     121, uint(GAPI::Zip4),
     122, uint(GAPI::Zip3),
     123, uint(GAPI::PostalLocality),
     124, uint(GAPI::GeneratedAddressCode),
     125, uint(GAPI::Foreigncountry),
     126, uint(GAPI::Foreignaddress),
     127, uint(GAPI::Foreigncity),
     128, uint(GAPI::Foreignregion),
     129, uint(GAPI::Foreignlocality),
     130, uint(GAPI::Foreignpostalcode),
     132, uint(GAPI::NoReaderFound),
     133, uint(GAPI::NoCardFound),
     134, uint(GAPI::CardReadError),
     135, uint(GAPI::SodCardReadError),
     136, uint(GAPI::CardUserPinCancel),
     137, uint(GAPI::CardUnknownError),
     139, uint(GAPI::ET_UNKNOWN),
     140, uint(GAPI::ET_CARD_CHANGED),
     141, uint(GAPI::ET_CARD_REMOVED),

       0        // eod
};

void GAPI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        GAPI *_t = static_cast<GAPI *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->signalLanguageChangedError(); break;
        case 1: _t->signalReaderContext(); break;
        case 2: _t->signalSetReaderComboIndex((*reinterpret_cast< long(*)>(_a[1]))); break;
        case 3: _t->signalCardDataChanged(); break;
        case 4: _t->signalAddressLoaded((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 5: _t->signalCardAccessError((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: _t->signalGenericError((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 7: _t->signalPersoDataLoaded((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 8: _t->signalAddressLoadedChanged(); break;
        case 9: _t->signalCardChanged((*reinterpret_cast< const int(*)>(_a[1]))); break;
        case 10: _t->signalCertificatesChanged((*reinterpret_cast< const QVariantMap(*)>(_a[1]))); break;
        case 11: _t->signalShowCardActivation((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 12: _t->signalWalletAddressSignSuccess((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 13: _t->signalWalletAddressSignFail(); break;
        case 14: _t->signalGetSodSucess((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 15: _t->signalGetCertificateSucess((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 16: _t->signalUpdateProgressBar((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 17: _t->signalUpdateProgressStatus((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 18: _t->signalOpenCMDSucess(); break;
        case 19: _t->signalCloseCMDSucess(); break;
        case 20: _t->signCMDFinished((*reinterpret_cast< long(*)>(_a[1]))); break;
        case 21: _t->initTranslation(); break;
        case 22: _t->setTextClipboard((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 23: { QVariantList _r = _t->getRetReaderList();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = std::move(_r); }  break;
        case 24: _t->setReaderByUser((*reinterpret_cast< ulong(*)>(_a[1]))); break;
        case 25: _t->resetReaderSelected(); break;
        case 26: { signed int _r = _t->returnReaderSelected();
            if (_a[0]) *reinterpret_cast< signed int*>(_a[0]) = std::move(_r); }  break;
        case 27: _t->setAddressLoaded((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 28: _t->startCardReading(); break;
        case 29: _t->startReadingAddress(); break;
        case 30: { uint _r = _t->verifyAddressPin((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< uint*>(_a[0]) = std::move(_r); }  break;
        case 31: { QString _r = _t->getDataCardIdentifyValue((*reinterpret_cast< GAPI::IDInfoKey(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 32: { QString _r = _t->getAddressField((*reinterpret_cast< GAPI::AddressInfoKey(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 33: _t->setEventCallbacks(); break;
        case 34: _t->setCardReadersCheck((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 35: _t->updateReaderList(); break;
        case 36: _t->startSigningWalletAddress((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 37: _t->startGettingSod(); break;
        case 38: _t->startGettingCertificate(); break;
        case 39: _t->signOpenCMD((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 40: _t->signCloseCMD((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 41: _t->showSignCMDDialog((*reinterpret_cast< long(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalLanguageChangedError)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalReaderContext)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(long );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalSetReaderComboIndex)) {
                *result = 2;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalCardDataChanged)) {
                *result = 3;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalAddressLoaded)) {
                *result = 4;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(int );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalCardAccessError)) {
                *result = 5;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(const QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalGenericError)) {
                *result = 6;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalPersoDataLoaded)) {
                *result = 7;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalAddressLoadedChanged)) {
                *result = 8;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(const int );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalCardChanged)) {
                *result = 9;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(const QVariantMap );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalCertificatesChanged)) {
                *result = 10;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalShowCardActivation)) {
                *result = 11;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(const QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalWalletAddressSignSuccess)) {
                *result = 12;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalWalletAddressSignFail)) {
                *result = 13;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(const QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalGetSodSucess)) {
                *result = 14;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(const QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalGetCertificateSucess)) {
                *result = 15;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(int );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalUpdateProgressBar)) {
                *result = 16;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(const QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalUpdateProgressStatus)) {
                *result = 17;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalOpenCMDSucess)) {
                *result = 18;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signalCloseCMDSucess)) {
                *result = 19;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(long );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GAPI::signCMDFinished)) {
                *result = 20;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        GAPI *_t = static_cast<GAPI *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 1: *reinterpret_cast< QString*>(_v) = _t->m_persoData; break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        GAPI *_t = static_cast<GAPI *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 1:
            if (_t->m_persoData != *reinterpret_cast< QString*>(_v)) {
                _t->m_persoData = *reinterpret_cast< QString*>(_v);
                Q_EMIT _t->signalPersoDataLoaded(_t->m_persoData);
            }
            break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject GAPI::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_GAPI.data,
      qt_meta_data_GAPI,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *GAPI::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GAPI::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GAPI.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int GAPI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 42)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 42;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 42)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 42;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void GAPI::signalLanguageChangedError()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void GAPI::signalReaderContext()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void GAPI::signalSetReaderComboIndex(long _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void GAPI::signalCardDataChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void GAPI::signalAddressLoaded(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void GAPI::signalCardAccessError(int _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void GAPI::signalGenericError(const QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}

// SIGNAL 7
void GAPI::signalPersoDataLoaded(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 7, _a);
}

// SIGNAL 8
void GAPI::signalAddressLoadedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void GAPI::signalCardChanged(const int _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 9, _a);
}

// SIGNAL 10
void GAPI::signalCertificatesChanged(const QVariantMap _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 10, _a);
}

// SIGNAL 11
void GAPI::signalShowCardActivation(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 11, _a);
}

// SIGNAL 12
void GAPI::signalWalletAddressSignSuccess(const QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 12, _a);
}

// SIGNAL 13
void GAPI::signalWalletAddressSignFail()
{
    QMetaObject::activate(this, &staticMetaObject, 13, nullptr);
}

// SIGNAL 14
void GAPI::signalGetSodSucess(const QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 14, _a);
}

// SIGNAL 15
void GAPI::signalGetCertificateSucess(const QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 15, _a);
}

// SIGNAL 16
void GAPI::signalUpdateProgressBar(int _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 16, _a);
}

// SIGNAL 17
void GAPI::signalUpdateProgressStatus(const QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 17, _a);
}

// SIGNAL 18
void GAPI::signalOpenCMDSucess()
{
    QMetaObject::activate(this, &staticMetaObject, 18, nullptr);
}

// SIGNAL 19
void GAPI::signalCloseCMDSucess()
{
    QMetaObject::activate(this, &staticMetaObject, 19, nullptr);
}

// SIGNAL 20
void GAPI::signCMDFinished(long _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 20, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
