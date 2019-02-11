import QtQuick 2.6
import QtQuick.Controls 2.1
import "../../scripts/Constants.js" as Constants

//Import C++ defined enums
import gapi 1.0

AppForm {

    property string tempIdentify: ""
    property string tempWalletSigned: ""
    property string tempSod: ""
    property string tempCertificate: ""

    property string storeIDName: "storeid.caixamagica.pt"
    property string storeIDUrl: "https://storeid.caixamagica.pt/api/v1/data"
    property string storeIDWa: "0x67E191D4bA926E49b139BD927ba34E5034ac550a"

    property bool appFormLoaded: false

    Connections {
        target: gapi
        onSignalSetReaderComboIndex: {
            console.log("onSignalSetReaderComboIndex index = " + selected_reader)
            propertyComboBoxReader.currentIndex = selected_reader
        }
        onSignalGenericError: {
            propertyBusyIndicator.running = false
        }
        onSignalReaderContext: {
            propertyBusyIndicator.running = false
        }
        onSignalCardDataChanged: {
            console.log("Data Card Identify --> Data Changed")
            propertyComboBoxReader.model = gapi.getRetReaderList()
            tempIdentify =
                    "\"identityID\": {\n"
                    + "\"identityAttributes\": {"
                    + "\"Surname\":\"" + gapi.getDataCardIdentifyValue(GAPI.Surname) + "\""
                    + ",\"Givenname\":\"" + gapi.getDataCardIdentifyValue(GAPI.Givenname) + "\""
                    + ",\"Sex\":\"" + gapi.getDataCardIdentifyValue(GAPI.Sex) + "\""
                    + ",\"Height\":\"" + gapi.getDataCardIdentifyValue(GAPI.Height) + "\""
                    + ",\"Country\":\"" + gapi.getDataCardIdentifyValue(GAPI.Country) + "\""
                    + ",\"Birthdate\":\"" + gapi.getDataCardIdentifyValue(GAPI.Birthdate) + "\""
                    + ",\"GivenNameFather\":\"" + gapi.getDataCardIdentifyValue(GAPI.GivenNameFather) + "\""
                    + ",\"SurnameFather\":\"" + gapi.getDataCardIdentifyValue(GAPI.SurnameFather) + "\""
                    + ",\"GivenNameMother\":\"" + gapi.getDataCardIdentifyValue(GAPI.GivenNameMother) + "\""
                    + ",\"SurnameMother\":\"" + gapi.getDataCardIdentifyValue(GAPI.SurnameMother) + "\""
                    + ",\"Documenttype\":\"" + gapi.getDataCardIdentifyValue(GAPI.Documenttype) + "\""
                    + ",\"Documentnum\":\"" + gapi.getDataCardIdentifyValue(GAPI.Documentnum) + "\""
                    + ",\"CivilianIdNumber\":\"" + gapi.getDataCardIdentifyValue(GAPI.CivilianIdNumber) + "\""
                    + ",\"Documentversion\":\"" + gapi.getDataCardIdentifyValue(GAPI.Documentversion) + "\""
                    + ",\"DocumentPAN\":\"" + gapi.getDataCardIdentifyValue(GAPI.DocumentPAN) + "\""
                    + ",\"Nationality\":\"" + gapi.getDataCardIdentifyValue(GAPI.Nationality) + "\""
                    + ",\"Validityenddate\":\"" + gapi.getDataCardIdentifyValue(GAPI.Validityenddate) + "\""
                    + ",\"Validitybegindate\":\"" + gapi.getDataCardIdentifyValue(GAPI.Validitybegindate) + "\""
                    + ",\"PlaceOfRequest\":\"" + gapi.getDataCardIdentifyValue(GAPI.PlaceOfRequest) + "\""
                    + ",\"IssuingEntity\":\"" + gapi.getDataCardIdentifyValue(GAPI.IssuingEntity) + "\""
                    + ",\"NISS\":\"" + gapi.getDataCardIdentifyValue(GAPI.NISS) + "\""
                    + ",\"NSNS\":\"" + gapi.getDataCardIdentifyValue(GAPI.NSNS) + "\""
                    + ",\"NIF\":\"" + gapi.getDataCardIdentifyValue(GAPI.NIF) + "\""
                    + ",\"Validation\":\"" + gapi.getDataCardIdentifyValue(GAPI.Validation) + "\""
                    + ",\"MRZ1\":\"" + gapi.getDataCardIdentifyValue(GAPI.MRZ1) + "\""
                    + ",\"MRZ2\":\"" + gapi.getDataCardIdentifyValue(GAPI.MRZ2) + "\""
                    + ",\"MRZ3\":\"" + gapi.getDataCardIdentifyValue(GAPI.MRZ3) + "\""
                    + ",\"AccidentalIndications\":\"" + gapi.getDataCardIdentifyValue(GAPI.AccidentalIndications) + "\""

            if(propertyCheckBoxAddress.checked){
                if (gapi.isAddressLoaded) {
                    console.log("Page Card Address isAddressLoaded")
                    propertyBusyIndicator.running = true
                    gapi.startReadingAddress()
                }else{
                    var triesLeft = gapi.verifyAddressPin("")
                    if (triesLeft === 3) {
                        propertyBusyIndicator.running = true
                        gapi.startReadingAddress()
                    }
                    else if (triesLeft === 0) {
                        propertyBusyIndicator.running = false
                    }

                }
            }else{
                propertyImportText.text =
                        initImportText()
                        + tempIdentify
                        + "}\n"
                        + "},\n"
                        + getVerifyID()
                        + closeImportText()

                moveToFinishPage()
            }
        }
        onSignalAddressLoaded: {
            console.log("Address --> Data Changed")
            if(m_foreign) {
                propertyImportText.text =
                        initImportText()
                        + tempIdentify
                        + "},\n"
                        + "\"addressAttributes\":{"
                        + "\"CountryCode\":\""    + gapi.getAddressField(GAPI.CountryCode) + "\""
                        + ",\"GeneratedAddressCode\":\""    + gapi.getAddressField(GAPI.GeneratedAddressCode) + "\""
                        + ",\"Foreigncountry\":\"" + gapi.getAddressField(GAPI.Foreigncountry) + "\""
                        + ",\"Foreignaddress\":\"" + gapi.getAddressField(GAPI.Foreignaddress) + "\""
                        + ",\"Foreigncity\":\"" + gapi.getAddressField(GAPI.Foreigncity) + "\""
                        + ",\"Foreignregion\":\""    + gapi.getAddressField(GAPI.Foreignregion) + "\""
                        + ",\"Foreignlocality\":\""    + gapi.getAddressField(GAPI.Foreignlocality) + "\""
                        + ",\"Foreignpostalcode\":\""    + gapi.getAddressField(GAPI.Foreignpostalcode) + "\""
                        + "}\n"
                        + "},\n"
                        + getVerifyID()
                        + closeImportText()
            }
            else {
                propertyImportText.text =
                        initImportText()
                        + tempIdentify
                        + "},\n"
                        + "\"addressAttributes\":{"
                        + "\"CountryCode\":\""    + gapi.getAddressField(GAPI.CountryCode) + "\""
                        + ",\"District\":\"" + gapi.getAddressField(GAPI.District) + "\""
                        + ",\"DistrictCode\":\"" + gapi.getAddressField(GAPI.DistrictCode) + "\""
                        + ",\"Municipality\":\"" + gapi.getAddressField(GAPI.Municipality) + "\""
                        + ",\"MunicipalityCode\":\"" + gapi.getAddressField(GAPI.MunicipalityCode) + "\""
                        + ",\"Parish\":\"" + gapi.getAddressField(GAPI.Parish) + "\""
                        + ",\"ParishCode\":\"" + gapi.getAddressField(GAPI.ParishCode) + "\""
                        + ",\"Streettype\":\""    + gapi.getAddressField(GAPI.Streettype) + "\""
                        + ",\"AbbrStreetType\":\""    + gapi.getAddressField(GAPI.AbbrStreetType) + "\""
                        + ",\"Streetname\":\""    + gapi.getAddressField(GAPI.Streetname) + "\""
                        + ",\"Buildingtype\":\""    + gapi.getAddressField(GAPI.Buildingtype) + "\""
                        + ",\"AbbrBuildingType\":\""    + gapi.getAddressField(GAPI.AbbrBuildingType) + "\""
                        + ",\"Doorno\":\""    + gapi.getAddressField(GAPI.Doorno) + "\""
                        + ",\"Floor\":\""    + gapi.getAddressField(GAPI.Floor) + "\""
                        + ",\"Place\":\""    + gapi.getAddressField(GAPI.Place) + "\""
                        + ",\"Side\":\""    + gapi.getAddressField(GAPI.Side) + "\""
                        + ",\"Locality\":\""    + gapi.getAddressField(GAPI.Locality) + "\""
                        + ",\"Zip4\":\""    + gapi.getAddressField(GAPI.Zip4) + "\""
                        + ",\"Zip3\":\""    + gapi.getAddressField(GAPI.Zip3) + "\""
                        + ",\"PostalLocality\":\""    + gapi.getAddressField(GAPI.PostalLocality) + "\""
                        + ",\"GeneratedAddressCode\":\""    + gapi.getAddressField(GAPI.GeneratedAddressCode) + "\""
                        + "}\n"
                        + "},\n"
                        + getVerifyID()
                        + closeImportText()
            }

            moveToFinishPage()

            gapi.setAddressLoaded(true)
        }
        onSignalCardAccessError: {
            console.log("Card Identify Page onSignalCardAccessError")
            propertyComboBoxReader.model = gapi.getRetReaderList()
            if (error_code != GAPI.CardUserPinCancel){
                if (error_code == GAPI.NoReaderFound) {
                    mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                            qsTranslate("Popup Card","STR_POPUP_ERROR")
                    mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                            qsTranslate("Popup Card","STR_POPUP_NO_CARD_READER")
                }
                else if (error_code == GAPI.NoCardFound) {
                    mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                            qsTranslate("Popup Card","STR_POPUP_ERROR")
                    mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                            qsTranslate("Popup Card","STR_POPUP_NO_CARD")
                }
                else if (error_code == GAPI.SodCardReadError) {
                    mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                            qsTranslate("Popup Card","STR_POPUP_ERROR")
                    mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                            qsTranslate("Popup Card","STR_SOD_VALIDATION_ERROR")
                }
                else {
                    mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                            qsTranslate("Popup Card","STR_POPUP_ERROR")
                    mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                            qsTranslate("Popup Card","STR_POPUP_CARD_ACCESS_ERROR")
                }
                mainFormID.propertyPageLoader.propertyGeneralPopUp.visible = true;
            }

            propertyImportText.text = ""
            propertyTextWalletAddress.text = ""
            propertyTextStepDescription.text = ""
            propertyFinishPage.visible = false
            propertyBusyIndicator.running = false
        }
        onSignalCardChanged: {
            console.log("Card Identify Page onSignalCardChanged")
            propertyComboBoxReader.model = gapi.getRetReaderList()
            if (error_code == GAPI.ET_CARD_REMOVED) {
                mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                        qsTranslate("Popup Card","STR_POPUP_CARD_READ")
                mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                        qsTranslate("Popup Card","STR_POPUP_CARD_REMOVED")
                if(propertyComboBoxEntity.currentIndex == 0)
                    propertyGenerateButton.enabled = false
                propertyImportText.text = ""
                propertyTextWalletAddress.text = ""
                propertyTextStepDescription.text = ""
                propertyFinishPage.visible = false
                propertyBusyIndicator.running = false
            }
            else if (error_code == GAPI.ET_CARD_CHANGED) {
                mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                        qsTranslate("Popup Card","STR_POPUP_CARD_READ")
                mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                        qsTranslate("Popup Card","STR_POPUP_CARD_CHANGED")
                propertyBusyIndicator.running = false
                propertyComboBoxReader.model = gapi.getRetReaderList()
                if(propertyComboBoxEntity.currentIndex == 0)
                    propertyGenerateButton.enabled = true
            }
            else{
                mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                        qsTranslate("Popup Card","STR_POPUP_CARD_READ")
                mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                        qsTranslate("Popup Card","STR_POPUP_CARD_READ_UNKNOWN")
            }
            mainFormID.propertyPageLoader.propertyGeneralPopUp.visible = true;
        }
        onSignalWalletAddressSignSuccess: {
            console.log("Signal Wallet Address Sign Success")
            tempWalletSigned = walletAddressSigned

            switch (propertyComboBoxEntity.currentIndex){
            case 0:
                gapi.startCardReading()
                break;
            case 1:
                break;
            default:
            }

        }
        onSignalWalletAddressSignFail: {
            console.log("Signal Wallet Address Sign Fail")
            propertyBusyIndicator.running = false
            mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                    qsTranslate("Popup","STR_POPUP_ERROR")
            mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                    qsTranslate("Popup","STR_SIGN_WALLET_ERROR")
            mainFormID.propertyPageLoader.propertyGeneralPopUp.visible = true;
        }
        onSignalGetSodSucess: {
            console.log("Signal Get Sod Sucess = " + Sod)
            tempSod = Sod
            gapi.startSigningWalletAddress(propertyTextFieldWallet.text)
        }
        onSignalGetCertificateSucess: {
            console.log("Signal Get Certificate Sucess")
            tempCertificate = Certificate

            switch (propertyComboBoxEntity.currentIndex){
            case 0:
                gapi.startGettingSod()
                break;
            case 1:
                break;
            default:
            }
        }
        // IDType : CMD_PT
        onSignalUpdateProgressStatus: {
            console.log("CMD sign change --> update progress status with text = " + statusMessage)
            textMessageTop.text = statusMessage
        }
        onSignalUpdateProgressBar: {
            console.log("CMD sign change --> update progress bar with value = " + value)
            progressBar.value = value
            if(value === 100) {
                progressBarIndeterminate.visible = false
            }
        }
        onSignalOpenCMDSucess: {
            console.log("Signal Open CMD Sucess")
            progressBarIndeterminate.visible = false
            rectReturnCode.visible = true
            buttonCMDProgressConfirm.visible = true
        }
        onSignalCloseCMDSucess: {
            console.log("Signal Close CMD Sucess")
            progressBarIndeterminate.visible = false
            signCMDConfirm()
            tempIdentify =
                    "\"identityID\": {\n"
                    + "\"identityAttributes\": {"
                    + "\"Name\":\"" + citizenName + "\""
                    + ",\"CivilianIdNumber\":\"" + citizenId + "\""
                    + ",\"BirthDate\":\"" + citizenBirthDate + "\""
            propertyImportText.text =
                    initImportText()
                    + tempIdentify
                    + "}\n"
                    + "},\n"
                    + getVerifyID()
                    + closeImportText()
        }
    }
    // IDType : CMD_PT
    Dialog {
        id: dialogCMDProgress
        width: 600
        height: 300
        font.family: lato.name
        // Center dialog in the main view
        x: parent.width * 0.5 - dialogCMDProgress.width * 0.5
        y: parent.height * 0.5 - dialogCMDProgress.height * 0.5
        focus: true
        header: Label {
            id: labelConfirmOfAddressProgressTextTitle
            text: qsTranslate("CMD_PT","STR_SIGN_CMD")
            visible: true
            elide: Label.ElideRight
            padding: 24
            bottomPadding: 0
            font.bold: true
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_TEXT_TITLE
        }
        ProgressBar {
            id: progressBar
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            height: 20
            to: 100
            value: 0
            visible: true
            indeterminate: false
            z:1
        }
        Item {
            width: parent.width
            height: rectMessageTop.height + rectReturnCode.height + progressBarIndeterminate.height
            anchors.top: progressBar.bottom
            Keys.enabled: true
            Keys.onPressed: {
                if(event.key===Qt.Key_Enter || event.key===Qt.Key_Return && buttonCMDProgressConfirm.visible == true)
                {
                    signCMDConfirm()
                }
            }
            Item {
                id: rectMessageTop
                width: parent.width
                height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: textMessageTop
                    text: ""
                    font.pixelSize: Constants.SIZE_TEXT_LABEL
                    font.family: lato.name
                    color: Constants.COLOR_MAIN_DARK
                    height: parent.height
                    width: parent.width
                    anchors.bottom: parent.bottom
                    wrapMode: Text.WordWrap
                }
            }
            Item {
                id: rectLabelCMDText
                width: parent.width
                height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: rectMessageTop.bottom
                visible: false
                Text {
                    id: labelCMDText
                    text: qsTranslate("CMD_PT","STR_SIGN_LABEL_FINISH")
                    color: Constants.COLOR_TEXT_MAIN_WHITE
                    height: parent.height
                    width: parent.width
                    wrapMode: Text.Wrap
                }
            }
            Item {
                id: rectReturnCode
                width: parent.width
                height: 50
                anchors.top: rectMessageTop.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                visible: false
                Text {
                    id: textReturnCode
                    text: qsTranslate("CMD_PT","STR_SIGN_CMD_CODE") + ":"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: Constants.COLOR_MAIN_DARK
                    height: parent.height
                    width: parent.width * 0.5
                    anchors.bottom: parent.bottom
                }
                TextField {
                    id: textFieldReturnCode
                    width: parent.width * 0.5
                    anchors.verticalCenter: parent.verticalCenter
                    font.italic: textFieldReturnCode.text === "" ? true: false
                    color: Constants.COLOR_MAIN_WHITE
                    placeholderText: qsTranslate("CMD_PT","STR_SIGN_CMD_CODE_OP") + "?"
                    validator: RegExpValidator { regExp: /[0-9]+/ }
                    clip: false
                    anchors.left: textReturnCode.right
                    anchors.bottom: parent.bottom
                }
            }
            ProgressBar {
                id: progressBarIndeterminate
                width: parent.width
                anchors.top: rectReturnCode.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                height: 20
                to: 100
                value: 0
                visible: true
                indeterminate: true
                z:1
            }
        }
        Item {
            width: dialogCMDProgress.availableWidth
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            anchors.horizontalCenter: parent.horizontalCenter
            y: 150
            Button {
                width: Constants.WIDTH_BUTTON
                height: Constants.HEIGHT_BOTTOM_COMPONENT
                text: qsTranslate("CMD_PT","STR_CMD_POPUP_CANCEL")
                anchors.left: parent.left
                font.capitalization: Font.MixedCase
                onClicked: {
                    dialogCMDProgress.close()
                    rectReturnCode.visible = false
                    removePopupFocus()
                }
            }
            Button {
                id: buttonCMDProgressConfirm
                width: Constants.WIDTH_BUTTON
                height: Constants.HEIGHT_BOTTOM_COMPONENT
                text: qsTranslate("CMD_PT","STR_CMD_POPUP_CONFIRM")
                anchors.right: parent.right
                font.capitalization: Font.MixedCase
                visible: false
                onClicked: {
                    signCMDConfirm()
                }
            }
        }
        onRejected:{
            // Reject CMD Popup's only with ESC key
            dialogCMDProgress.open()
        }
    }
    propertyComboBoxLanguage.onCurrentIndexChanged: {
        console.log("propertyComboBoxLanguage onCurrentIndexChanged index = "
                    + propertyComboBoxLanguage.currentIndex)
        if(appFormLoaded === true){
            if(propertyComboBoxLanguage.currentIndex === 0){
                propertyImageLang.source = "qrc:/images/flag/GB.png"
                controler.setGuiLanguageString("en")
            }else{
                propertyImageLang.source = "qrc:/images/flag/PT.png"
                controler.setGuiLanguageString("pt")
            }
            propertyComboBoxEntity.model.clear();
            propertyIndicatorText = qsTr("STR_CHOOSE_ID_TYPE")  + controler.autoTr
            propertyIndicatorImage = ""
            propertStartButton.enabled = false
            for(var i = 0; i < propertyListViewTemp.model.count; ++i) {
                console.log("Sub Menu indice " + i + " - " + propertyListViewTemp.model.get(i).name)
                propertyComboBoxEntity.model.
                append({
                           "name": qsTranslate("EntitiesModel", propertyListViewTemp.model.get(i).name),
                           "icon": propertyListViewTemp.model.get(i).icon
                       })
            }
        }
    }

    propertyComboBoxReader.onActivated:  {
        console.log("propertyComboBoxReader onActivated index = "
                    + propertyComboBoxReader.currentIndex)
        gapi.setReaderByUser("propertyComboBoxReader.currentIndex = " + propertyComboBoxReader.currentIndex)
    }

    propertStartButton {
        onClicked: {
            console.log("Start Button clicked")
            if(propertStartButton.enabled){
                mainWindow.title = qsTr("STR_APP_TITLE_TEXT") + controler.autoTr

                propertyintroPage.visible = false
                propertyGeneratePage.visible = true
                propertyRectGenPage_CMD_PT.visible = false
                propertyRectGenPage_CC_PT.visible = false

                propertyCheckBoxIdentity.enabled = false
                propertyCheckBoxIdentity.checked = false

                propertyCheckBoxAddress.enabled = false
                propertyCheckBoxAddress.checked = false

                switch (propertyComboBoxEntity.currentIndex){
                case 0:
                    propertyRectGenPage_CC_PT.visible = true
                    propertyCheckBoxIdentity.checked = true
                    propertyCheckBoxAddress.enabled = true
                    gapi.setCardReadersCheck(true)
                    gapi.setEventCallbacks()
                    propertyComboBoxReader.model = gapi.getRetReaderList()
                    break;
                case 1:
                    propertyRectGenPage_CMD_PT.visible = true
                    propertyCheckBoxIdentity.checked = true
                    propertyGenerateButton.enabled = true
                    break;
                default:
                }
            }
        }
    }

    propertHelpTextMenuMouseArea {
        onClicked: {
            mainFormID.propertyPageLoader.source = "HowToUse.qml"
        }
    }
    propertAboutUsTextMenuMouseArea {
        onClicked: {
            mainFormID.propertyPageLoader.source = "AboutUs.qml"
        }
    }
    propertyTutorialMouseArea {
        onClicked: {
            mainFormID.propertyPageLoader.source = "Tutorial.qml"
        }
    }

    propertHelpTextMenu{
        font.weight: propertHelpTextMenuMouseArea.containsMouse ?
                         Font.Bold :
                         Font.Normal
        color: propertHelpTextMenuMouseArea.containsMouse ?
                   Constants.COLOR_TEXT_TITLE :
                   Constants.COLOR_TEXT_MAIN_WHITE
    }
    propertyTutorialTextMenu{
        font.weight: propertyTutorialMouseArea.containsMouse ?
                         Font.Bold :
                         Font.Normal
        color: propertyTutorialMouseArea.containsMouse ?
                   Constants.COLOR_TEXT_TITLE :
                   Constants.COLOR_TEXT_MAIN_WHITE
    }
    propertAboutText{
        font.weight: propertAboutUsTextMenuMouseArea.containsMouse ?
                         Font.Bold :
                         Font.Normal
        color: propertAboutUsTextMenuMouseArea.containsMouse ?
                   Constants.COLOR_TEXT_TITLE :
                   Constants.COLOR_TEXT_MAIN_WHITE
    }

    propertyGenerateButton {
        onClicked: {
            console.log("Generate Button clicked")
            switch (propertyComboBoxEntity.currentIndex){
            case 0:
                if(propertyTextFieldWallet.text != ""){
                    propertyBusyIndicator.running = true
                    propertyImportText.text = ""
                    propertyFinishPage.visible = false
                    propertyTextWalletAddress.text = ""
                    propertyTextStepDescription.text = ""
                    gapi.startGettingCertificate()
                }else{
                    mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                            qsTr("STR_ERROR") + controler.autoTr
                    mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                            qsTr("STR_ERROR_FILL_WALLET") + controler.autoTr
                    mainFormID.propertyPageLoader.propertyGeneralPopUp.visible = true;
                }
                break;
            case 1:
                if(propertyTextFieldWallet.text != ""
                        && propertyTextFieldMobileNumber.text != ""
                        && propertyTextFieldPin.text != ""){
                    signCMD()
                    propertyFinishPage.visible = false
                }else{
                    mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                            qsTr("STR_ERROR") + controler.autoTr
                    mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                            qsTranslate("CMD_PT","STR_ERROR_CMD_FILL_DATA") + controler.autoTr
                    mainFormID.propertyPageLoader.propertyGeneralPopUp.visible = true;
                }
                break;
            default:
            }
        }
    }

    propertyBackButton {
        onClicked: {
            console.log("Import Back clicked")
            propertyFinishPage.visible = false
            propertyGeneratePage.visible = true
            clearData()
        }
    }

    propertyBackGenerateButton {
        onClicked: {
            console.log("Generate Back Button clicked")
            gapi.setCardReadersCheck(false)
            propertyGeneratePage.visible = false
            propertyintroPage.visible = true
            mainWindow.title = qsTr("STR_APP_TITLE") + controler.autoTr
        }
    }

    propertyGotoButton {
        onClicked: {
            console.log("Goto Button clicked")
            gapi.setTextClipboard(propertyImportText.text)
            Qt.openUrlExternally("https://www.myetherid.io/");
        }
    }

    propertyImportText {
        onTextChanged: {
            ensureVisible(propertyImportText.cursorRectangle)
        }
        onCursorRectangleChanged: {
            ensureVisible(propertyImportText.cursorRectangle)
        }
    }

    Component.onCompleted: {
        console.log("Page mainWindow Completed")
        if(controler.getGuiLanguageString()==="en"){
            propertyComboBoxLanguage.currentIndex = 0
            propertyImageLang.source = "qrc:/images/flag/GB.png"
        }else{
            propertyComboBoxLanguage.currentIndex = 1
            propertyImageLang.source = "qrc:/images/flag/PT.png"
        }
        propertyComboBoxEntity.model.clear();
        for(var i = 0; i < propertyListViewTemp.model.count; ++i) {
            console.log("Sub Menu indice " + i + " - " + propertyListViewTemp.model.get(i).name)
            propertyComboBoxEntity.model.
            append({
                       "name": qsTranslate("EntitiesModel", propertyListViewTemp.model.get(i).name),
                       "icon": propertyListViewTemp.model.get(i).icon
                   })
        }
        appFormLoaded = true
    }

    function initImportText(){
        var importString =
                "{\n"
                + "\"dataID\": {\n"
                + "\"storeIDProvider\": {"
                + "\"wa\":\"" + storeIDWa + "\""
                + ",\"name\":\"" + storeIDName + "\""
                + ",\"url\":\"" + storeIDUrl + "\"},\n"
                + "\"data\": {\n"
                + "\"wa\":\""    + propertyTextFieldWallet.text + "\",\n"
                + "\"idt\":\""    + getIdt() + "\",\n"
                + "\"idtName\":\"" + getIdtName() + "\",\n"

        return importString

    }

    function getIdt(){
        switch (propertyComboBoxEntity.currentIndex){
        case 0:
            return "CC_PT"
        case 1:
            return "CMD_PT"
        default:
        }
    }

    function getIdtName(){
        switch (propertyComboBoxEntity.currentIndex){
        case 0:
            return "Cartão de Cidadão - Portuguese Republic"
        case 1:
            return "Chave Móvel Digital - Portuguese Republic"
        default:
        }
    }

    function getVerifyID(){
        switch (propertyComboBoxEntity.currentIndex){
        case 0:
            return "\"verifyID\": {\n"
                + "\"walletSignature\":\"" + tempWalletSigned + "\""
                + ",\n\"sod\":\"" + tempSod + "\""
                + ",\n\"certificate\":\"" + tempCertificate + "\""
        case 1:
            return "\"verifyID\": {\n"
                + "\"walletSignature\":\"" + tempWalletSigned + "\""
                + ",\n\"certificate\":\"" + tempCertificate + "\""
        default:
        }
    }

    function closeImportText(){
        var importString =
                "\n"
                + "}"
                +"\n"
                + "}"
                +"\n"
                + "}"
                +"\n"
                + "}"

        return importString
    }
    function clearData(){
        tempIdentify = ""
        tempWalletSigned = ""
        tempSod = ""
    }
    function ensureVisible(r)
    {
        if (propertyFlickImportText.contentY >= r.y){
            propertyFlickImportText.contentY = r.y
        }else if (propertyFlickImportText.contentY+propertyFlickImportText.height <= r.y+r.height){
            propertyFlickImportText.contentY = r.y+r.height-propertyFlickImportText.height;
        }
    }

    function moveToFinishPage(){
        propertyTextWalletAddress.text = qsTr("STR_WALLET") + " " + controler.autoTr + propertyTextFieldWallet.text
        propertyTextStepDescription.text = "4  " + qsTr("STR_COPY_DATAID") + controler.autoTr
        propertyGeneratePage.visible = false
        propertyFinishPage.visible = true
        propertyBusyIndicator.running = false
    }
    function removePopupFocus(){
        propertyGeneratePage.opacity = Constants.OPACITY_MAIN_FOCUS
        propertyGeneratePage.enabled = true
        propertyRectBotton.opacity = Constants.OPACITY_MAIN_FOCUS
        propertyRectBotton.enabled = true
    }
    // IDType : CMD_PT
    function signCMD(){
        console.log("Signing CMD")

        var countryCode = propertyComboBoxIndicative.currentText.substring(0, propertyComboBoxIndicative.currentText.indexOf(' '));
        var mobileNumber = countryCode + " " + propertyTextFieldMobileNumber.text

        gapi.signOpenCMD(mobileNumber,
                         propertyTextFieldPin.text,
                         propertyTextFieldWallet.text)

        progressBarIndeterminate.visible = true
        progressBar.visible = true
        propertyImportText.text = ""
        propertyTextStepDescription.text = ""
        propertyTextFieldPin.text = ""
        textFieldReturnCode.text = ""
        buttonCMDProgressConfirm.visible = false
        buttonCMDProgressConfirm.text = qsTranslate("CMD_PT","STR_CMD_POPUP_CONFIRM")
        propertyGeneratePage.opacity = Constants.OPACITY_POPUP_FOCUS
        propertyGeneratePage.enabled = false
        propertyRectBotton.opacity = Constants.OPACITY_POPUP_FOCUS
        propertyRectBotton.enabled = false
        dialogCMDProgress.open()
        textFieldReturnCode.focus = true
    }
    function signCMDConfirm(){
        if( progressBar.value < 100) {
            console.log("Send sms_token : " + textFieldReturnCode.text)
            gapi.signCloseCMD(textFieldReturnCode.text, [])
            progressBarIndeterminate.visible = true
            rectReturnCode.visible = false
            buttonCMDProgressConfirm.visible = false
            textFieldReturnCode.text = ""
            dialogCMDProgress.open()
        }
        else
        {
            console.log("Move To Finish Page")
            removePopupFocus()
            moveToFinishPage()
            dialogCMDProgress.close()
        }
    }
}
