/****************************************************************************
** Meta object code from reading C++ file 'gapi.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.9.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../src/gapi.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gapi.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.9.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GAPI_t {
    QByteArrayData data[116];
    char stringdata0[1747];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GAPI_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GAPI_t qt_meta_stringdata_GAPI = {
    {
QT_MOC_LITERAL(0, 0, 4), // "GAPI"
QT_MOC_LITERAL(1, 5, 19), // "signalReaderContext"
QT_MOC_LITERAL(2, 25, 0), // ""
QT_MOC_LITERAL(3, 26, 25), // "signalSetReaderComboIndex"
QT_MOC_LITERAL(4, 52, 15), // "selected_reader"
QT_MOC_LITERAL(5, 68, 21), // "signalCardDataChanged"
QT_MOC_LITERAL(6, 90, 19), // "signalAddressLoaded"
QT_MOC_LITERAL(7, 110, 9), // "m_foreign"
QT_MOC_LITERAL(8, 120, 21), // "signalCardAccessError"
QT_MOC_LITERAL(9, 142, 10), // "error_code"
QT_MOC_LITERAL(10, 153, 18), // "signalGenericError"
QT_MOC_LITERAL(11, 172, 21), // "signalPersoDataLoaded"
QT_MOC_LITERAL(12, 194, 10), // "persoNotes"
QT_MOC_LITERAL(13, 205, 26), // "signalAddressLoadedChanged"
QT_MOC_LITERAL(14, 232, 17), // "signalCardChanged"
QT_MOC_LITERAL(15, 250, 25), // "signalCertificatesChanged"
QT_MOC_LITERAL(16, 276, 15), // "certificatesMap"
QT_MOC_LITERAL(17, 292, 32), // "getCertificateAuthStatusFinished"
QT_MOC_LITERAL(18, 325, 17), // "certificateStatus"
QT_MOC_LITERAL(19, 343, 24), // "signalShowCardActivation"
QT_MOC_LITERAL(20, 368, 13), // "statusMessage"
QT_MOC_LITERAL(21, 382, 26), // "signalLanguageChangedError"
QT_MOC_LITERAL(22, 409, 28), // "signalImportCertificatesFail"
QT_MOC_LITERAL(23, 438, 28), // "signalRemoveCertificatesFail"
QT_MOC_LITERAL(24, 467, 16), // "getRetReaderList"
QT_MOC_LITERAL(25, 484, 15), // "setReaderByUser"
QT_MOC_LITERAL(26, 500, 14), // "setReaderIndex"
QT_MOC_LITERAL(27, 515, 19), // "resetReaderSelected"
QT_MOC_LITERAL(28, 535, 20), // "returnReaderSelected"
QT_MOC_LITERAL(29, 556, 10), // "signed int"
QT_MOC_LITERAL(30, 567, 16), // "setAddressLoaded"
QT_MOC_LITERAL(31, 584, 13), // "addressLoaded"
QT_MOC_LITERAL(32, 598, 16), // "startCardReading"
QT_MOC_LITERAL(33, 615, 19), // "startReadingAddress"
QT_MOC_LITERAL(34, 635, 13), // "verifyAuthPin"
QT_MOC_LITERAL(35, 649, 3), // "pin"
QT_MOC_LITERAL(36, 653, 19), // "getTriesLeftAuthPin"
QT_MOC_LITERAL(37, 673, 13), // "verifySignPin"
QT_MOC_LITERAL(38, 687, 19), // "getTriesLeftSignPin"
QT_MOC_LITERAL(39, 707, 16), // "verifyAddressPin"
QT_MOC_LITERAL(40, 724, 22), // "getTriesLeftAddressPin"
QT_MOC_LITERAL(41, 747, 17), // "getCardActivation"
QT_MOC_LITERAL(42, 765, 24), // "getDataCardIdentifyValue"
QT_MOC_LITERAL(43, 790, 15), // "GAPI::IDInfoKey"
QT_MOC_LITERAL(44, 806, 3), // "key"
QT_MOC_LITERAL(45, 810, 15), // "getAddressField"
QT_MOC_LITERAL(46, 826, 20), // "GAPI::AddressInfoKey"
QT_MOC_LITERAL(47, 847, 17), // "setEventCallbacks"
QT_MOC_LITERAL(48, 865, 24), // "startfillCertificateList"
QT_MOC_LITERAL(49, 890, 22), // "startGetCardActivation"
QT_MOC_LITERAL(50, 913, 25), // "showCertificateAuthStatus"
QT_MOC_LITERAL(51, 939, 15), // "initTranslation"
QT_MOC_LITERAL(52, 955, 16), // "updateReaderList"
QT_MOC_LITERAL(53, 972, 6), // "m_data"
QT_MOC_LITERAL(54, 979, 23), // "QMap<IDInfoKey,QString>"
QT_MOC_LITERAL(55, 1003, 13), // "m_addressData"
QT_MOC_LITERAL(56, 1017, 28), // "QMap<AddressInfoKey,QString>"
QT_MOC_LITERAL(57, 1046, 9), // "persoData"
QT_MOC_LITERAL(58, 1056, 15), // "isAddressLoaded"
QT_MOC_LITERAL(59, 1072, 9), // "IDInfoKey"
QT_MOC_LITERAL(60, 1082, 12), // "Documenttype"
QT_MOC_LITERAL(61, 1095, 15), // "Documentversion"
QT_MOC_LITERAL(62, 1111, 7), // "Surname"
QT_MOC_LITERAL(63, 1119, 9), // "Givenname"
QT_MOC_LITERAL(64, 1129, 3), // "Sex"
QT_MOC_LITERAL(65, 1133, 6), // "Height"
QT_MOC_LITERAL(66, 1140, 11), // "Nationality"
QT_MOC_LITERAL(67, 1152, 9), // "Birthdate"
QT_MOC_LITERAL(68, 1162, 11), // "Documentnum"
QT_MOC_LITERAL(69, 1174, 17), // "Validitybegindate"
QT_MOC_LITERAL(70, 1192, 15), // "Validityenddate"
QT_MOC_LITERAL(71, 1208, 3), // "NIC"
QT_MOC_LITERAL(72, 1212, 3), // "NIF"
QT_MOC_LITERAL(73, 1216, 4), // "NISS"
QT_MOC_LITERAL(74, 1221, 4), // "NSNS"
QT_MOC_LITERAL(75, 1226, 13), // "IssuingEntity"
QT_MOC_LITERAL(76, 1240, 14), // "PlaceOfRequest"
QT_MOC_LITERAL(77, 1255, 7), // "Country"
QT_MOC_LITERAL(78, 1263, 6), // "Father"
QT_MOC_LITERAL(79, 1270, 6), // "Mother"
QT_MOC_LITERAL(80, 1277, 21), // "AccidentalIndications"
QT_MOC_LITERAL(81, 1299, 14), // "AddressInfoKey"
QT_MOC_LITERAL(82, 1314, 8), // "District"
QT_MOC_LITERAL(83, 1323, 12), // "Municipality"
QT_MOC_LITERAL(84, 1336, 6), // "Parish"
QT_MOC_LITERAL(85, 1343, 10), // "Streettype"
QT_MOC_LITERAL(86, 1354, 10), // "Streetname"
QT_MOC_LITERAL(87, 1365, 12), // "Buildingtype"
QT_MOC_LITERAL(88, 1378, 6), // "Doorno"
QT_MOC_LITERAL(89, 1385, 5), // "Floor"
QT_MOC_LITERAL(90, 1391, 4), // "Side"
QT_MOC_LITERAL(91, 1396, 8), // "Locality"
QT_MOC_LITERAL(92, 1405, 5), // "Place"
QT_MOC_LITERAL(93, 1411, 4), // "Zip4"
QT_MOC_LITERAL(94, 1416, 4), // "Zip3"
QT_MOC_LITERAL(95, 1421, 14), // "PostalLocality"
QT_MOC_LITERAL(96, 1436, 14), // "Foreigncountry"
QT_MOC_LITERAL(97, 1451, 14), // "Foreignaddress"
QT_MOC_LITERAL(98, 1466, 11), // "Foreigncity"
QT_MOC_LITERAL(99, 1478, 13), // "Foreignregion"
QT_MOC_LITERAL(100, 1492, 15), // "Foreignlocality"
QT_MOC_LITERAL(101, 1508, 17), // "Foreignpostalcode"
QT_MOC_LITERAL(102, 1526, 15), // "CardAccessError"
QT_MOC_LITERAL(103, 1542, 13), // "NoReaderFound"
QT_MOC_LITERAL(104, 1556, 11), // "NoCardFound"
QT_MOC_LITERAL(105, 1568, 13), // "CardReadError"
QT_MOC_LITERAL(106, 1582, 16), // "SodCardReadError"
QT_MOC_LITERAL(107, 1599, 17), // "CardUserPinCancel"
QT_MOC_LITERAL(108, 1617, 16), // "CardUnknownError"
QT_MOC_LITERAL(109, 1634, 11), // "SignMessage"
QT_MOC_LITERAL(110, 1646, 13), // "SignMessageOK"
QT_MOC_LITERAL(111, 1660, 26), // "SignMessageTimestampFailed"
QT_MOC_LITERAL(112, 1687, 16), // "eCustomEventType"
QT_MOC_LITERAL(113, 1704, 10), // "ET_UNKNOWN"
QT_MOC_LITERAL(114, 1715, 15), // "ET_CARD_CHANGED"
QT_MOC_LITERAL(115, 1731, 15) // "ET_CARD_REMOVED"

    },
    "GAPI\0signalReaderContext\0\0"
    "signalSetReaderComboIndex\0selected_reader\0"
    "signalCardDataChanged\0signalAddressLoaded\0"
    "m_foreign\0signalCardAccessError\0"
    "error_code\0signalGenericError\0"
    "signalPersoDataLoaded\0persoNotes\0"
    "signalAddressLoadedChanged\0signalCardChanged\0"
    "signalCertificatesChanged\0certificatesMap\0"
    "getCertificateAuthStatusFinished\0"
    "certificateStatus\0signalShowCardActivation\0"
    "statusMessage\0signalLanguageChangedError\0"
    "signalImportCertificatesFail\0"
    "signalRemoveCertificatesFail\0"
    "getRetReaderList\0setReaderByUser\0"
    "setReaderIndex\0resetReaderSelected\0"
    "returnReaderSelected\0signed int\0"
    "setAddressLoaded\0addressLoaded\0"
    "startCardReading\0startReadingAddress\0"
    "verifyAuthPin\0pin\0getTriesLeftAuthPin\0"
    "verifySignPin\0getTriesLeftSignPin\0"
    "verifyAddressPin\0getTriesLeftAddressPin\0"
    "getCardActivation\0getDataCardIdentifyValue\0"
    "GAPI::IDInfoKey\0key\0getAddressField\0"
    "GAPI::AddressInfoKey\0setEventCallbacks\0"
    "startfillCertificateList\0"
    "startGetCardActivation\0showCertificateAuthStatus\0"
    "initTranslation\0updateReaderList\0"
    "m_data\0QMap<IDInfoKey,QString>\0"
    "m_addressData\0QMap<AddressInfoKey,QString>\0"
    "persoData\0isAddressLoaded\0IDInfoKey\0"
    "Documenttype\0Documentversion\0Surname\0"
    "Givenname\0Sex\0Height\0Nationality\0"
    "Birthdate\0Documentnum\0Validitybegindate\0"
    "Validityenddate\0NIC\0NIF\0NISS\0NSNS\0"
    "IssuingEntity\0PlaceOfRequest\0Country\0"
    "Father\0Mother\0AccidentalIndications\0"
    "AddressInfoKey\0District\0Municipality\0"
    "Parish\0Streettype\0Streetname\0Buildingtype\0"
    "Doorno\0Floor\0Side\0Locality\0Place\0Zip4\0"
    "Zip3\0PostalLocality\0Foreigncountry\0"
    "Foreignaddress\0Foreigncity\0Foreignregion\0"
    "Foreignlocality\0Foreignpostalcode\0"
    "CardAccessError\0NoReaderFound\0NoCardFound\0"
    "CardReadError\0SodCardReadError\0"
    "CardUserPinCancel\0CardUnknownError\0"
    "SignMessage\0SignMessageOK\0"
    "SignMessageTimestampFailed\0eCustomEventType\0"
    "ET_UNKNOWN\0ET_CARD_CHANGED\0ET_CARD_REMOVED"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GAPI[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      37,   14, // methods
       4,  270, // properties
       5,  286, // enums/sets
       0,    0, // constructors
       0,       // flags
      15,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,  199,    2, 0x06 /* Public */,
       3,    1,  200,    2, 0x06 /* Public */,
       5,    0,  203,    2, 0x06 /* Public */,
       6,    1,  204,    2, 0x06 /* Public */,
       8,    1,  207,    2, 0x06 /* Public */,
      10,    1,  210,    2, 0x06 /* Public */,
      11,    1,  213,    2, 0x06 /* Public */,
      13,    0,  216,    2, 0x06 /* Public */,
      14,    1,  217,    2, 0x06 /* Public */,
      15,    1,  220,    2, 0x06 /* Public */,
      17,    1,  223,    2, 0x06 /* Public */,
      19,    1,  226,    2, 0x06 /* Public */,
      21,    0,  229,    2, 0x06 /* Public */,
      22,    0,  230,    2, 0x06 /* Public */,
      23,    0,  231,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      24,    0,  232,    2, 0x0a /* Public */,
      25,    1,  233,    2, 0x0a /* Public */,
      27,    0,  236,    2, 0x0a /* Public */,
      28,    0,  237,    2, 0x0a /* Public */,
      30,    1,  238,    2, 0x0a /* Public */,
      32,    0,  241,    2, 0x0a /* Public */,
      33,    0,  242,    2, 0x0a /* Public */,
      34,    1,  243,    2, 0x0a /* Public */,
      36,    0,  246,    2, 0x0a /* Public */,
      37,    1,  247,    2, 0x0a /* Public */,
      38,    0,  250,    2, 0x0a /* Public */,
      39,    1,  251,    2, 0x0a /* Public */,
      40,    0,  254,    2, 0x0a /* Public */,
      41,    0,  255,    2, 0x0a /* Public */,
      42,    1,  256,    2, 0x0a /* Public */,
      45,    1,  259,    2, 0x0a /* Public */,
      47,    0,  262,    2, 0x0a /* Public */,
      48,    0,  263,    2, 0x0a /* Public */,
      49,    0,  264,    2, 0x0a /* Public */,
      50,    1,  265,    2, 0x0a /* Public */,
      51,    0,  268,    2, 0x0a /* Public */,
      52,    0,  269,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::Long,    4,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    7,
    QMetaType::Void, QMetaType::Int,    9,
    QMetaType::Void, QMetaType::QString,    9,
    QMetaType::Void, QMetaType::QString,   12,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    9,
    QMetaType::Void, QMetaType::QVariantMap,   16,
    QMetaType::Void, QMetaType::Int,   18,
    QMetaType::Void, QMetaType::QString,   20,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::QVariantList,
    QMetaType::Void, QMetaType::ULong,   26,
    QMetaType::Void,
    0x80000000 | 29,
    QMetaType::Void, QMetaType::Bool,   31,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::UInt, QMetaType::QString,   35,
    QMetaType::UInt,
    QMetaType::UInt, QMetaType::QString,   35,
    QMetaType::UInt,
    QMetaType::UInt, QMetaType::QString,   35,
    QMetaType::UInt,
    QMetaType::QString,
    QMetaType::QString, 0x80000000 | 43,   44,
    QMetaType::QString, 0x80000000 | 46,   44,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,   18,
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
      53, 0x80000000 | 54, 0x00095008,
      55, 0x80000000 | 56, 0x00095008,
      57, QMetaType::QString, 0x00495003,
      58, QMetaType::Bool, 0x00495003,

 // properties: notify_signal_id
       0,
       0,
       6,
       7,

 // enums: name, flags, count, data
      59, 0x0,   21,  306,
      81, 0x0,   20,  348,
     102, 0x0,    6,  388,
     109, 0x0,    2,  400,
     112, 0x0,    3,  404,

 // enum data: key, value
      60, uint(GAPI::Documenttype),
      61, uint(GAPI::Documentversion),
      62, uint(GAPI::Surname),
      63, uint(GAPI::Givenname),
      64, uint(GAPI::Sex),
      65, uint(GAPI::Height),
      66, uint(GAPI::Nationality),
      67, uint(GAPI::Birthdate),
      68, uint(GAPI::Documentnum),
      69, uint(GAPI::Validitybegindate),
      70, uint(GAPI::Validityenddate),
      71, uint(GAPI::NIC),
      72, uint(GAPI::NIF),
      73, uint(GAPI::NISS),
      74, uint(GAPI::NSNS),
      75, uint(GAPI::IssuingEntity),
      76, uint(GAPI::PlaceOfRequest),
      77, uint(GAPI::Country),
      78, uint(GAPI::Father),
      79, uint(GAPI::Mother),
      80, uint(GAPI::AccidentalIndications),
      82, uint(GAPI::District),
      83, uint(GAPI::Municipality),
      84, uint(GAPI::Parish),
      85, uint(GAPI::Streettype),
      86, uint(GAPI::Streetname),
      87, uint(GAPI::Buildingtype),
      88, uint(GAPI::Doorno),
      89, uint(GAPI::Floor),
      90, uint(GAPI::Side),
      91, uint(GAPI::Locality),
      92, uint(GAPI::Place),
      93, uint(GAPI::Zip4),
      94, uint(GAPI::Zip3),
      95, uint(GAPI::PostalLocality),
      96, uint(GAPI::Foreigncountry),
      97, uint(GAPI::Foreignaddress),
      98, uint(GAPI::Foreigncity),
      99, uint(GAPI::Foreignregion),
     100, uint(GAPI::Foreignlocality),
     101, uint(GAPI::Foreignpostalcode),
     103, uint(GAPI::NoReaderFound),
     104, uint(GAPI::NoCardFound),
     105, uint(GAPI::CardReadError),
     106, uint(GAPI::SodCardReadError),
     107, uint(GAPI::CardUserPinCancel),
     108, uint(GAPI::CardUnknownError),
     110, uint(GAPI::SignMessageOK),
     111, uint(GAPI::SignMessageTimestampFailed),
     113, uint(GAPI::ET_UNKNOWN),
     114, uint(GAPI::ET_CARD_CHANGED),
     115, uint(GAPI::ET_CARD_REMOVED),

       0        // eod
};

void GAPI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        GAPI *_t = static_cast<GAPI *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->signalReaderContext(); break;
        case 1: _t->signalSetReaderComboIndex((*reinterpret_cast< long(*)>(_a[1]))); break;
        case 2: _t->signalCardDataChanged(); break;
        case 3: _t->signalAddressLoaded((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 4: _t->signalCardAccessError((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 5: _t->signalGenericError((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 6: _t->signalPersoDataLoaded((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 7: _t->signalAddressLoadedChanged(); break;
        case 8: _t->signalCardChanged((*reinterpret_cast< const int(*)>(_a[1]))); break;
        case 9: _t->signalCertificatesChanged((*reinterpret_cast< const QVariantMap(*)>(_a[1]))); break;
        case 10: _t->getCertificateAuthStatusFinished((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 11: _t->signalShowCardActivation((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 12: _t->signalLanguageChangedError(); break;
        case 13: _t->signalImportCertificatesFail(); break;
        case 14: _t->signalRemoveCertificatesFail(); break;
        case 15: { QVariantList _r = _t->getRetReaderList();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = std::move(_r); }  break;
        case 16: _t->setReaderByUser((*reinterpret_cast< ulong(*)>(_a[1]))); break;
        case 17: _t->resetReaderSelected(); break;
        case 18: { signed int _r = _t->returnReaderSelected();
            if (_a[0]) *reinterpret_cast< signed int*>(_a[0]) = std::move(_r); }  break;
        case 19: _t->setAddressLoaded((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 20: _t->startCardReading(); break;
        case 21: _t->startReadingAddress(); break;
        case 22: { uint _r = _t->verifyAuthPin((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< uint*>(_a[0]) = std::move(_r); }  break;
        case 23: { uint _r = _t->getTriesLeftAuthPin();
            if (_a[0]) *reinterpret_cast< uint*>(_a[0]) = std::move(_r); }  break;
        case 24: { uint _r = _t->verifySignPin((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< uint*>(_a[0]) = std::move(_r); }  break;
        case 25: { uint _r = _t->getTriesLeftSignPin();
            if (_a[0]) *reinterpret_cast< uint*>(_a[0]) = std::move(_r); }  break;
        case 26: { uint _r = _t->verifyAddressPin((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< uint*>(_a[0]) = std::move(_r); }  break;
        case 27: { uint _r = _t->getTriesLeftAddressPin();
            if (_a[0]) *reinterpret_cast< uint*>(_a[0]) = std::move(_r); }  break;
        case 28: { QString _r = _t->getCardActivation();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 29: { QString _r = _t->getDataCardIdentifyValue((*reinterpret_cast< GAPI::IDInfoKey(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 30: { QString _r = _t->getAddressField((*reinterpret_cast< GAPI::AddressInfoKey(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 31: _t->setEventCallbacks(); break;
        case 32: _t->startfillCertificateList(); break;
        case 33: _t->startGetCardActivation(); break;
        case 34: _t->showCertificateAuthStatus((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 35: _t->initTranslation(); break;
        case 36: _t->updateReaderList(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalReaderContext)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(long );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalSetReaderComboIndex)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalCardDataChanged)) {
                *result = 2;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(bool );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalAddressLoaded)) {
                *result = 3;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalCardAccessError)) {
                *result = 4;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(const QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalGenericError)) {
                *result = 5;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(const QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalPersoDataLoaded)) {
                *result = 6;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalAddressLoadedChanged)) {
                *result = 7;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(const int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalCardChanged)) {
                *result = 8;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(const QVariantMap );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalCertificatesChanged)) {
                *result = 9;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::getCertificateAuthStatusFinished)) {
                *result = 10;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalShowCardActivation)) {
                *result = 11;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalLanguageChangedError)) {
                *result = 12;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalImportCertificatesFail)) {
                *result = 13;
                return;
            }
        }
        {
            typedef void (GAPI::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GAPI::signalRemoveCertificatesFail)) {
                *result = 14;
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
        case 2: *reinterpret_cast< QString*>(_v) = _t->m_persoData; break;
        case 3: *reinterpret_cast< bool*>(_v) = _t->isAddressLoaded(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        GAPI *_t = static_cast<GAPI *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 2:
            if (_t->m_persoData != *reinterpret_cast< QString*>(_v)) {
                _t->m_persoData = *reinterpret_cast< QString*>(_v);
                Q_EMIT _t->signalPersoDataLoaded(_t->m_persoData);
            }
            break;
        case 3: _t->setAddressLoaded(*reinterpret_cast< bool*>(_v)); break;
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
        return static_cast<void*>(const_cast< GAPI*>(this));
    return QObject::qt_metacast(_clname);
}

int GAPI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 37)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 37;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 37)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 37;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 4;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void GAPI::signalReaderContext()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void GAPI::signalSetReaderComboIndex(long _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void GAPI::signalCardDataChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void GAPI::signalAddressLoaded(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void GAPI::signalCardAccessError(int _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void GAPI::signalGenericError(const QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void GAPI::signalPersoDataLoaded(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}

// SIGNAL 7
void GAPI::signalAddressLoadedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void GAPI::signalCardChanged(const int _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 8, _a);
}

// SIGNAL 9
void GAPI::signalCertificatesChanged(const QVariantMap _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 9, _a);
}

// SIGNAL 10
void GAPI::getCertificateAuthStatusFinished(int _t1)
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
void GAPI::signalLanguageChangedError()
{
    QMetaObject::activate(this, &staticMetaObject, 12, nullptr);
}

// SIGNAL 13
void GAPI::signalImportCertificatesFail()
{
    QMetaObject::activate(this, &staticMetaObject, 13, nullptr);
}

// SIGNAL 14
void GAPI::signalRemoveCertificatesFail()
{
    QMetaObject::activate(this, &staticMetaObject, 14, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
