import QtQuick 2.6
import QtQuick.Controls 2.1

import "../../scripts/Constants.js" as Constants

Rectangle {
    anchors.fill: parent

    property alias propertyBusyIndicator: busyIndication

    property alias propertyintroPage: introBox
    property alias propertyGeneratePage: generatePage
    property alias propertyFinishPage: finishPage
    property alias propertyRectBotton: rectBotton

    property alias propertyRectGenPage_CC_PT: rectGenPage_CC_PT
    property alias propertyRectGenPage_CMD_PT: rectGenPage_CMD_PT

    property alias propertyComboBoxReader: comboBoxReader
    property alias propertyComboBoxEntity: comboBoxEntity
    property alias propertyListViewTemp: listViewTemp
    property alias propertyComboBoxLanguage: comboBoxLanguage
    property alias propertyImageEntity: imageEntity
    property alias propertyImageLang: indicatorIconLanguage
    property alias propertyCheckBoxIdentity: checkBoxIdentity
    property alias propertyCheckBoxAddress: checkBoxAddress
    property alias propertyTextWalletAddress: textWalletAddress
    property alias propertyTextStepDescription: textStepDescription
    property alias propertyImportText: importText
    property alias propertyTextFieldWallet: textFieldWallet

    // CMD_PT
    property alias propertyComboBoxIndicative: comboBoxIndicative
    property alias propertyTextFieldMobileNumber: textFieldMobileNumber
    property alias propertyTextFieldPin: textFieldPin

    property alias propertStartButton: startButton
    property alias propertHelpTextMenuMouseArea: helpTextMenuMouseArea
    property alias propertAboutUsTextMenuMouseArea: aboutUsTextMenuMouseArea
    property alias propertyTutorialMouseArea: tutorialMouseArea
    property alias propertHelpTextMenu: helpTextMenu
    property alias propertyTutorialTextMenu: tutorialTextMenu
    property alias propertAboutText: aboutText

    property alias propertyGenerateButton: generateButton
    property alias propertyBackButton: backButton
    property alias propertyBackGenerateButton: backGenerateButton
    property alias propertyGotoButton: gotoButton

    property alias propertyFlickImportText: flickableImportText

    property alias propertyIndicatorText: indicatorText.text
    property alias propertyIndicatorImage: indicatorIcon.source

    color: Constants.COLOR_BACKGROUND

    BusyIndicator {
        id: busyIndication
        width: 120
        height: 120
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        running: false
        anchors.centerIn: parent
        // BusyIndicator should be on top of all other content
        z: 1
    }

    Item {
        id: rectBotton
        x: 30
        width: parent.width - 60
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        height: Constants.ARROW_HEIGHT
        enabled: true

        Item {
            id: rectTutorial
            width: parent.width / 3
            height: parent.height
            enabled: true
            MouseArea {
                id: tutorialMouseArea
                hoverEnabled: true
                anchors.fill: parent
            }
            Text {
                id: tutorialTextMenu
                text: qsTr("STR_TUTORIAL") + controler.autoTr
                font.capitalization: Font.MixedCase
                font.pixelSize: Constants.SIZE_TEXT_BOTTON
                enabled: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Item {
            id: rectAboutUs
            width: parent.width / 3
            anchors.left: rectTutorial.right
            height: parent.height
            enabled: true
            MouseArea {
                id: aboutUsTextMenuMouseArea
                hoverEnabled: true
                anchors.fill: parent
            }
            Text {
                id: aboutText
                text: qsTr("STR_ABOUT_US") + controler.autoTr
                font.capitalization: Font.MixedCase
                font.pixelSize: Constants.SIZE_TEXT_BOTTON
                enabled: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Item {
            id: rectHowTouse
            width: parent.width / 3
            anchors.left: rectAboutUs.right
            height: parent.height
            enabled: true
            MouseArea {
                id: helpTextMenuMouseArea
                hoverEnabled: true
                anchors.fill: parent
            }
            Text {
                id: helpTextMenu
                text: qsTr("STR_HOW_TO_USE") + controler.autoTr
                font.capitalization: Font.MixedCase
                font.pixelSize: Constants.SIZE_TEXT_BOTTON
                enabled: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    Item {
        id: introBox
        width: parent.width
        height: parent.height
        visible: true

        Item {
            id: rectSelectLanguage
            width: parent.width - 20
            anchors.horizontalCenter: parent.horizontalCenter
            height: Constants.HEIGHT_LANGUAGE_COMPONENT
            y: 5

            ComboBox {
                id: comboBoxLanguage
                width: indicatorIconLanguage.width + indicatorIconLanguageArrow.width + 15
                height: Constants.HEIGHT_LANGUAGE_COMPONENT
                visible: true
                //the background of the combobox
                background: Rectangle {
                    border.width: 0
                    border.color: Constants.COLOR_MAIN_SOFT_GRAY
                    color: Constants.COLOR_MAIN_SOFT_GRAY
                    radius: 0
                }
                model: LanguageModel {
                }
                delegate: LanguageDelegate {
                }
                //the arrow on the right in the combobox
                indicator: Item {

                    width: parent.width
                    height: 40
                    anchors.verticalCenter: parent.verticalCenter
                    id: itemDlgtLanguage
                    Image {
                        id: indicatorIconLanguage
                        antialiasing: true
                        height: 18
                        x: 5
                        anchors.verticalCenter: parent.verticalCenter
                        fillMode: Image.PreserveAspectFit
                    }
                    Image {
                        id: indicatorIconLanguageArrow
                        antialiasing: true
                        width: Constants.ARROW_DOWN_WIDTH
                        height: Constants.ARROW_DOWN_HEIGHT
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: indicatorIconLanguage.right
                        anchors.leftMargin: 5
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/images/arrow-down.png"
                    }
                }
                //the list of elements and their style when the combobox is open
                popup: Popup {
                    id: comboPopupLanguage
                    y: comboBoxLanguage.height - 1
                    width: comboBoxLanguage.width
                    height: contentItem.implicitHeigh
                    padding: 1

                    contentItem: ListView {
                        id: listViewLanguage
                        implicitHeight: contentHeight
                        model: comboBoxLanguage.popup.visible ? comboBoxLanguage.delegateModel : null
                        ScrollIndicator.vertical: ScrollIndicator {
                        }
                    }

                    background: Rectangle {
                        radius: 0
                        border.width: 1
                        border.color: Constants.COLOR_MAIN
                    }
                }
            }
        }

        Item {
            id: rowIntroTitle
            width: parent.width
            height: parent.height * 0.4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rectSelectLanguage.bottom

            Image {
                id: imageIcon
                antialiasing: true
                height: 80
                anchors.bottom: textAppSlogan.top
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/logo.png"
            }
            Text {
                id: textAppSlogan
                text: qsTr("STR_TEXT_SUB_TITLE") + controler.autoTr
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                color: Constants.COLOR_MAIN_SOFT_GRAY
            }
        }

        Item {
            id: rectSelectEntity
            width: parent.width * 0.7
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rowIntroTitle.bottom
            anchors.topMargin: 80
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true

            Rectangle {
                id: rectSelectEntityTop
                width: parent.width
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                Image {
                    id: imageEntity
                    antialiasing: true
                    width: 80
                    height: Constants.HEIGHT_BOTTOM_COMPONENT
                    fillMode: Image.PreserveAspectFit
                    anchors.right: comboBoxEntity.left
                }
                ComboBox {
                    id: comboBoxEntity
                    width: parent.width
                    height: Constants.HEIGHT_BOTTOM_COMPONENT
                    Text {
                        font.family: lato.name
                        font.capitalization: Font.MixedCase
                    }
                    visible: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    //the background of the combobox
                    background: Rectangle {
                        border.width: 0
                        border.color: Constants.COLOR_MAIN
                        radius: 0
                        color: Constants.COLOR_MAIN_SOFT_GRAY
                    }
                    model: EntitiesModel {
                    }
                    delegate: EntitiesDelegate {
                    }
                    //the arrow on the right in the combobox
                    indicator: Item {

                        width: parent.width
                        height: 40
                        anchors.verticalCenter: parent.verticalCenter
                        id: itemDlgt
                        Image {
                            id: indicatorIcon
                            antialiasing: true
                            width: Constants.SIZE_IMAGE_ENTITY_WIDTH
                            height: Constants.SIZE_IMAGE_ENTITY_HEIGHT
                            x: 10
                            anchors.verticalCenter: parent.verticalCenter
                            fillMode: Image.PreserveAspectFit
                        }
                        Text {
                            id: indicatorText
                            anchors.left: indicatorIcon.right
                            anchors.leftMargin: 20
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("STR_CHOOSE_ID_TYPE") + controler.autoTr
                        }
                        Image {
                            id: indicatorIconArrow
                            antialiasing: true
                            width: Constants.ARROW_DOWN_COMBO_WIDTH
                            height: Constants.ARROW_DOWN_COMBO_HEIGHT
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            fillMode: Image.PreserveAspectFit
                            source: "qrc:/images/arrow-down.png"
                        }
                    }
                    //the list of elements and their style when the combobox is open
                    popup: Popup {
                        id: comboPopup
                        y: comboBoxEntity.height - 1
                        width: comboBoxEntity.width
                        height: contentItem.implicitHeigh
                        padding: 1

                        contentItem: ListView {
                            id: listView
                            implicitHeight: contentHeight
                            model: comboBoxEntity.popup.visible ? comboBoxEntity.delegateModel : null
                            ScrollIndicator.vertical: ScrollIndicator {
                            }
                        }

                        background: Rectangle {
                            radius: 0
                            border.width: 1
                            border.color: Constants.COLOR_MAIN
                        }
                    }
                }
                ListView {
                    // Temp model used to update comboBoxEntity model
                    // After change language
                    id: listViewTemp
                    model: EntitiesModel {
                    }
                }
            }
            Item {
                id: rectSelectEntityBottom
                width: Constants.WIDTH_BUTTON
                height: parent.height
                anchors.top: rectSelectEntityTop.bottom
                anchors.margins: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    id: startButton
                    text: qsTr("STR_IMPORT_BUTTON") + controler.autoTr
                    font.capitalization: Font.MixedCase
                    font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                    contentItem: Text {
                        text: startButton.text
                        font: startButton.font
                        color: Constants.COLOR_TEXT_MAIN_WHITE
                        opacity: enabled ? 1.0 : 0.3
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    width: Constants.WIDTH_BUTTON
                    height: Constants.HEIGHT_BOTTOM_COMPONENT
                    enabled: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {
                        color: startButton.enabled ? Constants.COLOR_BUTTONS : Constants.COLOR_BUTTONS_DOWN
                        radius: 10
                    }
                }
            }
        }
    }

    Item {
        id: generatePage
        width: parent.width
        height: parent.height - rectBotton.height
        anchors.topMargin: 0
        visible: false

        Item {
            id: rectGenPage_CC_PT
            width: parent.width
            height: Constants.HEIGHT_IDT_TOP
            visible: false
            Text {
                id: textStep1
                x: 30
                y: Constants.PAGE_Y_POS
                text: "1  " + qsTranslate(
                          "CC_PT", "STR_SELECT_CARD_READER") + controler.autoTr
                font.pixelSize: Constants.SIZE_TEXT_BODY
                color: Constants.COLOR_TEXT_TITLE
            }
            ComboBox {
                id: comboBoxReader
                width: parent.width - 120
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: lato.name
                font.pixelSize: Constants.SIZE_TEXT_FIELD
                font.capitalization: Font.MixedCase
                visible: true
                anchors.top: textStep1.bottom
                anchors.topMargin: 10
                x: 60
            }
        }
        Item {
            id: rectGenPage_CMD_PT
            width: parent.width
            height: Constants.HEIGHT_IDT_TOP
            visible: false
            Text {
                id: textStep1_CMD_PT
                x: 30
                y: Constants.PAGE_Y_POS
                text: "1  " + qsTranslate(
                          "CC_PT", "STR_SELECT_CMD_LOGIN") + controler.autoTr
                font.pixelSize: Constants.SIZE_TEXT_BODY
                color: Constants.COLOR_TEXT_TITLE
            }
            Item {
                id: rectMobilNumber
                width: parent.width - 120
                height: 40
                anchors.top: textStep1_CMD_PT.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: textPinCurrent
                    text: qsTranslate(
                              "CMD_PT",
                              "STR_SIGN_CMD_MOVEL_NUM") + controler.autoTr
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: Constants.COLOR_TEXT_MAIN_WHITE
                    height: parent.height
                    width: parent.width * 0.3
                }
                ComboBox {
                    id: comboBoxIndicative
                    width: parent.width * 0.4
                    anchors.verticalCenter: parent.verticalCenter
                    model: ["+351 - Portugal", "+55 - Brazil", "+34 - Spain", "-------------------", "+93 - Afghanistan", "+355 - Albania", "+213 - Algeria", "+684 - American Samoa", "+376 - Andorra", "+244 - Angola", "+809 - Anguilla", "+268 - Antigua", "+54 - Argentina", "+374 - Armenia", "+297 - Aruba", "+247 - Ascension Island", "+61 - Australia", "+672 - Australian External Territories", "+43 - Austria", "+994 - Azerbaijan", "+242 - Bahamas", "+246 - Barbados", "+973 - Bahrain", "+880 - Bangladesh", "+375 - Belarus", "+32 - Belgium", "+501 - Belize", "+229 - Benin", "+809 - Bermuda", "+975 - Bhutan", "+284 - British Virgin Islands", "+591 - Bolivia", "+387 - Bosnia and Hercegovina", "+267 - Botswana", "+55 - Brazil", "+284 - British V.I.", "+673 - Brunei Darussalm", "+359 - Bulgaria", "+226 - Burkina Faso", "+257 - Burundi", "+855 - Cambodia", "+237 - Cameroon", "+1 - Canada", "+238 - CapeVerde Islands", "+1 - Caribbean Nations", "+345 - Cayman Islands", "+238 - Cape Verdi", "+236 - Central African Republic", "+235 - Chad", "+56 - Chile", "+86 - China (People's Republic)", "+886 - China-Taiwan", "+57 - Colombia", "+269 - Comoros and Mayotte", "+242 - Congo", "+506 - Costa Rica", "+385 - Croatia", "+53 - Cuba", "+357 - Cyprus", "+420 - Czech Republic", "+45 - Denmark", "+246 - Diego Garcia", "+767 - Dominca", "+809 - Dominican Republic", "+253 - Djibouti", "+593 - Ecuador", "+20 - Egypt", "+503 - El Salvador", "+240 - Equatorial Guinea", "+291 - Eritrea", "+372 - Estonia", "+251 - Ethiopia", "+500 - Falkland Islands", "+298 - Faroe (Faeroe) Islands (Denmark)", "+679 - Fiji", "+358 - Finland", "+33 - France", "+596 - French Antilles", "+594 - French Guiana", "+241 - Gabon (Gabonese Republic)", "+220 - Gambia", "+995 - Georgia", "+49 - Germany", "+233 - Ghana", "+350 - Gibraltar", "+30 - Greece", "+299 - Greenland", "+473 - Grenada/Carricou", "+671 - Guam", "+502 - Guatemala", "+224 - Guinea", "+245 - Guinea-Bissau", "+592 - Guyana", "+509 - Haiti", "+504 - Honduras", "+852 - Hong Kong", "+36 - Hungary", "+354 - Iceland", "+91 - India", "+62 - Indonesia", "+98 - Iran", "+964 - Iraq", "+353 - Ireland (Irish Republic; Eire)", "+972 - Israel", "+39 - Italy", "+225 - Ivory Coast (La Cote d'Ivoire)", "+876 - Jamaica", "+81 - Japan", "+962 - Jordan", "+7 - Kazakhstan", "+254 - Kenya", "+855 - Khmer Republic (Cambodia/Kampuchea)", "+686 - Kiribati Republic (Gilbert Islands)", "+82 - Korea, Republic of (South Korea)", "+850 - Korea, People's Republic of (North Korea)", "+965 - Kuwait", "+996 - Kyrgyz Republic", "+371 - Latvia", "+856 - Laos", "+961 - Lebanon", "+266 - Lesotho", "+231 - Liberia", "+370 - Lithuania", "+218 - Libya", "+423 - Liechtenstein", "+352 - Luxembourg", "+853 - Macao", "+389 - Macedonia", "+261 - Madagascar", "+265 - Malawi", "+60 - Malaysia", "+960 - Maldives", "+223 - Mali", "+356 - Malta", "+692 - Marshall Islands", "+596 - Martinique (French Antilles)", "+222 - Mauritania", "+230 - Mauritius", "+269 - Mayolte", "+52 - Mexico", "+691 - Micronesia (F.S. of Polynesia)", "+373 - Moldova", "+33 - Monaco", "+976 - Mongolia", "+473 - Montserrat", "+212 - Morocco", "+258 - Mozambique", "+95 - Myanmar (former Burma)", "+264 - Namibia (former South-West Africa)", "+674 - Nauru", "+977 - Nepal", "+31 - Netherlands", "+599 - Netherlands Antilles", "+869 - Nevis", "+687 - New Caledonia", "+64 - New Zealand", "+505 - Nicaragua", "+227 - Niger", "+234 - Nigeria", "+683 - Niue", "+850 - North Korea", "+1 670 - North Mariana Islands (Saipan)", "+47 - Norway", "+968 - Oman", "+92 - Pakistan", "+680 - Palau", "+507 - Panama", "+675 - Papua New Guinea", "+595 - Paraguay", "+51 - Peru", "+63 - Philippines", "+48 - Poland", "+351 - Portugal (includes Azores)", "+1 787 - Puerto Rico", "+974 - Qatar", "+262 - Reunion (France)", "+40 - Romania", "+7 - Russia", "+250 - Rwanda (Rwandese Republic)", "+670 - Saipan", "+378 - San Marino", "+239 - Sao Tome and Principe", "+966 - Saudi Arabia", "+221 - Senegal", "+381 - Serbia and Montenegro", "+248 - Seychelles", "+232 - Sierra Leone", "+65 - Singapore", "+421 - Slovakia", "+386 - Slovenia", "+677 - Solomon Islands", "+252 - Somalia", "+27 - South Africa", "+34 - Spain", "+94 - Sri Lanka", "+290 - St. Helena", "+869 - St. Kitts/Nevis", "+508 - St. Pierre &(et) Miquelon (France)", "+249 - Sudan", "+597 - Suriname", "+268 - Swaziland", "+46 - Sweden", "+41 - Switzerland", "+963 - Syrian Arab Republic (Syria)", "+689 - Tahiti (French Polynesia)", "+886 - Taiwan", "+7 - Tajikistan", "+255 - Tanzania (includes Zanzibar)", "+66 - Thailand", "+228 - Togo (Togolese Republic)", "+690 - Tokelau", "+676 - Tonga", "+1 868 - Trinidad and Tobago", "+216 - Tunisia", "+90 - Turkey", "+993 - Turkmenistan", "+688 - Tuvalu (Ellice Islands)", "+256 - Uganda", "+380 - Ukraine", "+971 - United Arab Emirates", "+44 - United Kingdom", "+598 - Uruguay", "+1 - USA", "+7 - Uzbekistan", "+678 - Vanuatu (New Hebrides)", "+39 - Vatican City", "+58 - Venezuela", "+84 - Viet Nam", "+1 340 - Virgin Islands", "+681 - Wallis and Futuna", "+685 - Western Samoa", "+381 - Yemen (People's Democratic Republic of)", "+967 - Yemen Arab Republic (North Yemen)", "+381 - Yugoslavia (discontinued)", "+243 - Zaire", "+260 - Zambia", "+263 - Zimbabwe"]
                    font.capitalization: Font.MixedCase
                    visible: true
                    anchors.left: textPinCurrent.right
                }
                TextField {
                    id: textFieldMobileNumber
                    width: parent.width * 0.25
                    anchors.verticalCenter: parent.verticalCenter
                    font.italic: textFieldMobileNumber.text === "" ? true : false
                    placeholderText: qsTranslate(
                                         "CMD_PT",
                                         "STR_SIGN_CMD_MOVEL_NUM_OP") + "?" + controler.autoTr
                    validator: RegExpValidator {
                        regExp: /[0-9]+/
                    }
                    clip: false
                    anchors.left: comboBoxIndicative.right
                    anchors.leftMargin: parent.width * 0.05
                }
            }
            Item {
                id: rectPin
                width: parent.width - 120
                height: 40
                anchors.top: rectMobilNumber.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: textPinNew
                    text: qsTranslate("CMD_PT",
                                      "STR_SIGN_CMD_PIN") + controler.autoTr
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: Constants.COLOR_TEXT_MAIN_WHITE
                    height: parent.height
                    width: parent.width * 0.3
                }
                TextField {
                    id: textFieldPin
                    width: parent.width * 0.7
                    anchors.verticalCenter: parent.verticalCenter
                    font.italic: textFieldPin.text === "" ? true : false
                    placeholderText: qsTranslate(
                                         "CMD_PT",
                                         "STR_SIGN_CMD_PIN_OP") + "?" + controler.autoTr
                    echoMode: TextInput.Password
                    clip: false
                    anchors.left: textPinNew.right
                }
            }
        }
        Item {
            id: rectGenPage
            width: parent.width
            height: parent.height - rectGenPage_CC_PT.height
            anchors.top: rectGenPage_CC_PT.bottom
            visible: true
            Text {
                id: textStep2
                x: 30
                text: "2  " + qsTr(
                          "STR_CHOOSE_DATA_TO_IMPORT") + controler.autoTr
                font.pixelSize: Constants.SIZE_TEXT_BODY
                color: Constants.COLOR_TEXT_TITLE
            }
            Item{
                id: rectCheckBoxIdentity
                width: 200
                height: Constants.HEIGHT_BOTTOM_COMPONENT
                anchors.top: textStep2.bottom
                anchors.topMargin: 10
                CheckBox {
                    id: checkBoxIdentity
                    x: 60
                    Rectangle{
                        color: Constants.COLOR_TEXT_MAIN_WHITE
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        width: Constants.SIZE_CHECKBOX_COMPONENT
                        height: Constants.SIZE_CHECKBOX_COMPONENT
                    }
                }
                Text {
                    text: qsTr("STR_CHECKBOX_IDENTITY") + controler.autoTr
                    color: Constants.COLOR_TEXT_MAIN_WHITE
                    anchors.left: checkBoxIdentity.right
                    y: 6
                }
            }

            Item{
                id: rectCheckBoxAddress
                width: 200
                height: Constants.HEIGHT_BOTTOM_COMPONENT
                anchors.top: textStep2.bottom
                anchors.topMargin: 10
                anchors.left: rectCheckBoxIdentity.right
                CheckBox {
                    id: checkBoxAddress
                    Rectangle{
                        color: Constants.COLOR_TEXT_MAIN_WHITE
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        width: Constants.SIZE_CHECKBOX_COMPONENT
                        height: Constants.SIZE_CHECKBOX_COMPONENT
                    }
                }
                Text {
                    text: qsTr("STR_CHECKBOX_ADDRESS") + controler.autoTr
                    color: Constants.COLOR_TEXT_MAIN_WHITE
                    anchors.left: checkBoxAddress.right
                    y: 6
                }
            }
            Text {
                id: textStep3
                x: 30
                anchors.top: rectCheckBoxAddress.bottom
                anchors.topMargin: 50
                text: "3  " + qsTr("STR_ENTER_WALLET") + controler.autoTr
                font.pixelSize: Constants.SIZE_TEXT_BODY
                color: Constants.COLOR_TEXT_TITLE
            }
            TextField {
                id: textFieldWallet
                x: 60
                anchors.top: textStep3.bottom
                anchors.topMargin: 10
                width: parent.width - 120
                anchors.horizontalCenter: parent.horizontalCenter
                text: ""
            }
            Button {
                id: backGenerateButton
                x: Constants.BUTTONS_BACK_X_POS
                y: parent.height
                font.capitalization: Font.MixedCase
                width: Constants.ARROW_WIDTH
                height: Constants.ARROW_HEIGHT
                enabled: true
                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: 0
                    color: Constants.COLOR_BUTTONS
                    Image {
                        antialiasing: true
                        width: parent.width * 0.5
                        height: parent.height * 0.5
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/images/arrow-back.png"
                    }
                }
            }
            Button {
                id: generateButton
                x: parent.width - 30 - generateButton.width
                y: Constants.BUTTONS_Y_POS - rectGenPage_CC_PT.height
                text: qsTr("STR_GENERATE") + controler.autoTr
                font.capitalization: Font.MixedCase
                font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                contentItem: Text {
                    text: generateButton.text
                    font: generateButton.font
                    color: Constants.COLOR_TEXT_MAIN_WHITE
                    opacity: enabled ? 1.0 : 0.3
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                width: 2 * Constants.WIDTH_BUTTON
                height: Constants.HEIGHT_BOTTOM_COMPONENT
                enabled: false
                anchors.horizontalCenter: parent.horizontalCenter
                background: Rectangle {
                    color: generateButton.enabled ? Constants.COLOR_BUTTONS : Constants.COLOR_BUTTONS_DOWN
                    radius: 10
                }
            }
        }
    }
    Item {
        id: finishPage
        width: parent.width
        height: parent.height - rectBotton.height
        visible: false

        Text {
            id: textStep4
            x: 30
            y: Constants.PAGE_Y_POS
            text: qsTr("STR_DATA_CREATED") + controler.autoTr
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_TEXT_TITLE
        }
        Text {
            id: textWalletAddress
            x: 30
            y: 35
            width: parent.width - 60
            wrapMode: Text.WordWrap
            anchors.top: textStep4.bottom
            anchors.topMargin: 10
            font.pixelSize: Constants.SIZE_TEXT_LABEL
            color: Constants.COLOR_TEXT_MAIN_WHITE
        }
        Text {
            id: textStepDescription
            x: 30
            y: 35
            width: parent.width - 60
            wrapMode: Text.WordWrap
            anchors.top: textWalletAddress.bottom
            anchors.topMargin: 10
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_TEXT_TITLE
        }
        Frame {
            id: frame
            width: parent.width - 60
            height: 250
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: textStepDescription.bottom
            anchors.topMargin: 10
            spacing: 10

            Flickable {
                id: flickableImportText
                width: parent.width
                height: parent.height
                boundsBehavior: Flickable.StopAtBounds
                maximumFlickVelocity: 2500
                flickableDirection: Flickable.VerticalFlick
                contentWidth: importText.paintedWidth
                contentHeight: importText.paintedHeight
                clip: true

                TextEdit {
                    id: importText
                    text: ""
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    width: flickableImportText.width - 20
                    height: flickableImportText.height
                    focus: true
                    font.pixelSize: Constants.SIZE_TEXT_LABEL
                    selectByMouse: true
                    color: Constants.COLOR_TEXT_MAIN_WHITE
                }
                ScrollBar.vertical: ScrollBar {
                    active: true
                    visible: true
                    policy: ScrollBar.AlwaysOn
                    width: 10

                    onActiveChanged: {
                        if (!active)
                            active = true
                    }
                }
            }
        }
        Button {
            id: backButton
            x: Constants.BUTTONS_BACK_X_POS
            y: parent.height
            font.capitalization: Font.MixedCase
            width: Constants.ARROW_WIDTH
            height: Constants.ARROW_HEIGHT
            enabled: true
            background: Rectangle {
                width: parent.width
                height: parent.height
                radius: 0
                color: Constants.COLOR_BUTTONS
                Image {
                    antialiasing: true
                    width: parent.width * 0.5
                    height: parent.height * 0.5
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/images/arrow-back.png"
                }
            }
        }
        Button {
            id: gotoButton
            x: parent.width - 30 - generateButton.width
            y: Constants.BUTTONS_Y_POS
            text: qsTr("STR_GOTO_MYETHERID_IO") + controler.autoTr
            font.capitalization: Font.MixedCase
            font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
            contentItem: Text {
                text: gotoButton.text
                font: gotoButton.font
                color:Constants.COLOR_TEXT_MAIN_WHITE
                opacity: enabled ? 1.0 : 0.3
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            width: 2 * Constants.WIDTH_BUTTON
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle {
                color: Constants.COLOR_MAIN_DARK
                radius: 10
            }
        }
    }
}
