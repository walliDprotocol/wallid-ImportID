import QtQuick 2.6
import QtQuick.Controls 2.1
import "../../scripts/Constants.js" as Constants

//Import C++ defined enums
import eidguiV2 1.0

AppForm {

    property string tempImportText: ""
    property string tempWalletSigned: ""
    property string tempSod: ""
    property string tempCertificate: ""
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
            tempImportText =
                    " \"Surname\":\"" + gapi.getDataCardIdentifyValue(GAPI.Surname) + "\""
                    + ", \"Givenname\":\"" + gapi.getDataCardIdentifyValue(GAPI.Givenname) + "\""
                    + ", \"Sex\":\"" + gapi.getDataCardIdentifyValue(GAPI.Sex) + "\""
                    + ", \"Height\":\"" + gapi.getDataCardIdentifyValue(GAPI.Height) + "\""
                    + ", \"Country\":\"" + gapi.getDataCardIdentifyValue(GAPI.Country) + "\""
                    + ", \"Birthdate\":\"" + gapi.getDataCardIdentifyValue(GAPI.Birthdate) + "\""
                    + ", \"Father\":\"" + gapi.getDataCardIdentifyValue(GAPI.Father) + "\""
                    + ", \"Mother\":\"" + gapi.getDataCardIdentifyValue(GAPI.Mother) + "\""
                    + ", \"Documenttype\":\"" + gapi.getDataCardIdentifyValue(GAPI.Documenttype) + "\""
                    + ", \"Documentnum\":\"" + gapi.getDataCardIdentifyValue(GAPI.Documentnum) + "\""
                    + ", \"Documentversion\":\"" + gapi.getDataCardIdentifyValue(GAPI.Documentversion) + "\""
                    + ", \"Nationality\":\"" + gapi.getDataCardIdentifyValue(GAPI.Nationality) + "\""
                    + ", \"Validityenddate\":\"" + gapi.getDataCardIdentifyValue(GAPI.Validityenddate) + "\""
                    + ", \"Validitybegindate\":\"" + gapi.getDataCardIdentifyValue(GAPI.Validitybegindate) + "\""
                    + ", \"PlaceOfRequest\":\"" + gapi.getDataCardIdentifyValue(GAPI.PlaceOfRequest) + "\""
                    + ", \"IssuingEntity\":\"" + gapi.getDataCardIdentifyValue(GAPI.IssuingEntity) + "\""
                    + ", \"NISS\":\"" + gapi.getDataCardIdentifyValue(GAPI.NISS) + "\""
                    + ", \"NSNS\":\"" + gapi.getDataCardIdentifyValue(GAPI.NSNS) + "\""
                    + ", \"NIF\":\"" + gapi.getDataCardIdentifyValue(GAPI.NIF) + "\""

            if(propertyCheckBoxAddress.checked){
                if (gapi.isAddressLoaded) {
                    console.log("Page Card Address isAddressLoaded")
                    propertyBusyIndicator.running = true
                    gapi.startReadingAddress()
                }else{
                    if(Constants.USE_SDK_PIN_UI_POPUP){
                        var triesLeft = gapi.verifyAddressPin("")
                        if (triesLeft === 3) {
                            propertyBusyIndicator.running = true
                            gapi.startReadingAddress()
                        }
                    }else{
                        dialogTestPin.open()
                        textFieldPin.text = ""
                    }
                }
            }else{
                propertyImportText.text =
                        initImportText()
                        + tempImportText
                        + "},\n\"wallet_signature\":\"" + tempWalletSigned + "\""
                        + ",\n\"sod\":\"" + tempSod + "\""
                        + ",\n\"certificate\":\"" + tempCertificate + "\""
                        + ",\n\"wallet_address\":\"" + propertyTextFieldWallet.text + "\""
                        + closeImportText()

                propertyTextWalletAddress.text = qsTr("STR_WALLET") + " " + controler.autoTr + propertyTextFieldWallet.text
                propertyTextStepDescription.text = "4 " + qsTr("STR_COPY_DATAID") + controler.autoTr
                propertyGeneratePage.visible = false
                propertyFinishPage.visible = true
                propertyBusyIndicator.running = false
            }
        }
        onSignalAddressLoaded: {
            console.log("Address --> Data Changed")
            if(m_foreign) {
                propertyImportText.text =
                        initImportText()
                        + tempImportText
                        + middleImportText()
                        + "\"address_attributes\":{"
                        + " \"Foreigncountry\":\"" + gapi.getAddressField(GAPI.Foreigncountry) + "\""
                        + ", \"Foreignaddress\":\"" + gapi.getAddressField(GAPI.Foreignaddress) + "\""
                        + ", \"Foreigncity\":\"" + gapi.getAddressField(GAPI.Foreigncity) + "\""
                        + ", \"Foreignregion\":\""    + gapi.getAddressField(GAPI.Foreignregion) + "\""
                        + ", \"Foreignlocality\":\""    + gapi.getAddressField(GAPI.Foreignlocality) + "\""
                        + ", \"Foreignpostalcode\":\""    + gapi.getAddressField(GAPI.Foreignpostalcode) + "\""
                        + "},\nwallet_signature\":\"" + tempWalletSigned + "\""
                        + ",\nsod\":\"" + tempSod + "\""
                        + ",\ncertificate\":\"" + tempCertificate + "\""
                        + ",\n\"wallet_address\":\"" + propertyTextFieldWallet.text + "\""
                        + closeImportText()
            }
            else {
                propertyImportText.text =
                        initImportText()
                        + tempImportText
                        + middleImportText()
                        + "\"address_attributes\":{"
                        + " \"District\":\"" + gapi.getAddressField(GAPI.District) + "\""
                        + ", \"Municipality\":\"" + gapi.getAddressField(GAPI.Municipality) + "\""
                        + ", \"Parish\":\"" + gapi.getAddressField(GAPI.Parish) + "\""
                        + ", \"Streettype\":\""    + gapi.getAddressField(GAPI.Streettype) + "\""
                        + ", \"Streetname\":\""    + gapi.getAddressField(GAPI.Streetname) + "\""
                        + ", \"Doorno\":\""    + gapi.getAddressField(GAPI.Doorno) + "\""
                        + ", \"Floor\":\""    + gapi.getAddressField(GAPI.Floor) + "\""
                        + ", \"Place\":\""    + gapi.getAddressField(GAPI.Place) + "\""
                        + ", \"Side\":\""    + gapi.getAddressField(GAPI.Side) + "\""
                        + ", \"Locality\":\""    + gapi.getAddressField(GAPI.Locality) + "\""
                        + ", \"Zip4\":\""    + gapi.getAddressField(GAPI.Zip4) + "\""
                        + ", \"Zip3\":\""    + gapi.getAddressField(GAPI.Zip3) + "\""
                        + ", \"PostalLocality\":\""    + gapi.getAddressField(GAPI.PostalLocality) + "\""
                        + "},\n\"wallet_signature\":\"" + tempWalletSigned + "\""
                        + ",\n\"sod\":\"" + tempSod + "\""
                        + ",\n\"certificate\":\"" + tempCertificate + "\""
                        + ",\n\"wallet_address\":\"" + propertyTextFieldWallet.text + "\""
                        + closeImportText()
            }

            propertyTextWalletAddress.text = qsTr("STR_WALLET") + " " + controler.autoTr + propertyTextFieldWallet.text
            propertyTextStepDescription.text = "4 " + qsTr("STR_COPY_DATAID") + controler.autoTr

            propertyGeneratePage.visible = false
            propertyFinishPage.visible = true
            propertyBusyIndicator.running = false

            gapi.setAddressLoaded(true)
            if(!Constants.USE_SDK_PIN_UI_POPUP)
                dialogTestPin.visible = false
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
                propertyGenerateButton.enabled = true
                //gapi.startCardReading()
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
            console.log("Signal Wallet Address Sign Success = " + walletAddressSigned)
            tempWalletSigned = walletAddressSigned
            gapi.startCardReading()
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
            console.log("Signal Get Certificate Sucess = " + Certificate)
            tempCertificate = Certificate
            gapi.startGettingSod()
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
            propertStartButton.checkable = false
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
        gapi.setReaderByUser(propertyComboBoxReader.currentIndex)
    }

    propertStartButton {
        onClicked: {
            console.log("Start Button clicked")
            if(propertStartButton.checkable){
                mainWindow.title = qsTr("STR_APP_TITLE_TEXT") + controler.autoTr
                propertyintroPage.visible = false
                propertyGeneratePage.visible = true
                gapi.setEventCallbacks()
                propertyComboBoxReader.model = gapi.getRetReaderList()
            }
        }
    }
    propertHelpTextMenuMouseArea {
        onClicked: {
            propertyHelpPage.visible = true
        }
    }
    propertyBackHelpButton {
        onClicked: {
            propertyHelpPage.visible = false
        }
    }

    propertHelpTextMenu{
        font.weight: propertHelpTextMenuMouseArea.containsMouse ?
                         Font.Bold :
                         Font.Normal
        color: propertHelpTextMenuMouseArea.containsMouse ?
                   Constants.COLOR_MAIN :
                   Constants.COLOR_MAIN_SOFT_GRAY
    }
    propertAboutTextBlockId{
        font.weight: propertyAboutTextBlockIdMenuMouseArea.containsMouse ?
                         Font.Bold :
                         Font.Normal
        color: propertyAboutTextBlockIdMenuMouseArea.containsMouse ?
                   Constants.COLOR_MAIN :
                   Constants.COLOR_MAIN_SOFT_GRAY
    }

    propertyGenerateButton {
        onClicked: {
            console.log("Generate Button clicked")

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
            console.log("Generate Button clicked")
            propertyGeneratePage.visible = false
            propertyintroPage.visible = true
            mainWindow.title = qsTr("STR_APP_TITLE") + controler.autoTr
        }
    }

    propertyGotoButton {
        onClicked: {
            console.log("Goto Button clicked")
            Qt.openUrlExternally("http://blockid.herokuapp.com//");
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
            console.log(propertyListViewTemp.model.get(i).icon)
        }
        appFormLoaded = true
    }

    function initImportText(){
        var importString =
                "{\n"
                + "\"id_attributes\": {"

        return importString
    }
    function middleImportText(){
        var importString =
                "},\n"

        return importString
    }
    function closeImportText(){
        var importString =
                "\n"
                + "}"

        return importString
    }
    function clearData(){
        tempImportText = ""
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
}
