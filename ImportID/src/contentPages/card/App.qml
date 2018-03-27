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
                        + closeImportText()

                propertyTextWalletAddress.text = "Wallet: "+propertyTextFieldWallet.text
                propertyTextStepDescription.text =
                        "4 - Select the text in the box below and copy (CTRL-C) and then paste this data (CTRL-V) into MyEtherID (import section)"

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
                        + closeImportText()
            }

            propertyTextWalletAddress.text = "Wallet: "+propertyTextFieldWallet.text
            propertyTextStepDescription.text =
                    "4 - Select the text in the box below and copy (CTRL-C) and then paste this data (CTRL-V) into MyEtherID (import section)"

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
        onSignalWalletAddressSignSucess: {
            console.log("Signal Wallet Address Sign Sucess = " + walletAddressSigned)
            tempWalletSigned = walletAddressSigned
            gapi.startCardReading()
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

    propertyComboBoxEntity.onCurrentIndexChanged: {
        console.log("propertyComboBoxEntity onCurrentIndexChanged index = "
                    + propertyComboBoxEntity.currentIndex)
        if(propertyComboBoxEntity.currentIndex > 0){
            propertyImageEntity.source = "qrc:/images/logo_icon_CC.png"
        }else{
            propertyImageEntity.source = ""
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
            mainWindow.title = "ImportID - Extract ID attributes to the blockchain"
            propertyintroPage.visible = false
            propertyGeneratePage.visible = true

            gapi.setEventCallbacks()
            propertyComboBoxReader.model = gapi.getRetReaderList()
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
                         Constants.COLOR_MAIN_BLACK
    }
    propertHelpTextMenu{
        font.weight: propertHelpTextMenuMouseArea.containsMouse ?
                         Font.Bold :
                         Font.Normal
        color: propertHelpTextMenuMouseArea.containsMouse ?
                         Constants.COLOR_MAIN :
                         Constants.COLOR_MAIN_BLACK
    }
    propertyHelpTextBlockIdMenuMouseArea {
        onClicked: {
            Qt.openUrlExternally("https://blockid.herokuapp.com")
        }
    }
    propertHelpTextBlockId{
        font.weight: propertyHelpTextBlockIdMenuMouseArea.containsMouse ?
                         Font.Bold :
                         Font.Normal
        color: propertyHelpTextBlockIdMenuMouseArea.containsMouse ?
                         Constants.COLOR_MAIN :
                         Constants.COLOR_MAIN_BLACK
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
                        qsTr("Error")
                mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                        qsTr("Please Fill the Ethereum Wallet Address")
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
            mainWindow.title = "ImportID"
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
        console.log("Page Card Identify mainWindow Completed")    
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
