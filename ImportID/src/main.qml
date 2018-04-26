import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Window 2.2

//Import C++ defined enums
import eidguiV2 1.0

/* Constants imports */
import "scripts/Constants.js" as Constants

Window {
    id: mainWindow
    visible: true
    flags: Qt.Window | Qt.CustomizeWindowHint | Qt.FramelessWindowHint

    width: Constants.SCREEN_MINIMUM_WIDTH
    height: Constants.SCREEN_MINIMUM_HEIGHT
    minimumWidth: Constants.SCREEN_MINIMUM_WIDTH
    minimumHeight: Constants.SCREEN_MINIMUM_HEIGHT

    title: "ImportID"

    FontLoader { id: lato; source: "qrc:/fonts/lato/Lato-Regular.ttf" }

    onMinimumWidthChanged: {
        console.log("Window Loaded")
        controler.initTranslation()
        gapi.initTranslation()
    }

    Connections {
        target: controler
        onSignalLanguageChangedError: {
            mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                    "Erro / Error"
            mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                    "Erro na leitura dos idiomas. Por favor, reinstale a aplicação \n
Load language error. Please reinstall the application"
            mainFormID.propertyPageLoader.propertyGeneralPopUp.visible = true
        }
    }

    Connections {
        target: gapi
        onSignalGenericError: {
            console.log("Signal onSignalGenericError")
            mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                    qsTranslate("Popup Card","STR_POPUP_ERROR")
            mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                    qsTranslate("Popup Card","STR_GENERIC_ERROR_MSG") + "\n\n" +
                    qsTranslate("Popup Card","STR_ERROR_CODE") + error_code
            mainFormID.propertyPageLoader.propertyGeneralPopUp.visible = true;
        }
        onSignalImportCertificatesFail: {
            console.log("Signal onSignalImportCertificatesFail")
            mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                    qsTranslate("Popup Card","STR_POPUP_ERROR")
            mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                    qsTranslate("Popup Card","STR_CERTIFICATES_IMPORT_ERROR_MSG")
            mainFormID.propertyPageLoader.propertyGeneralPopUp.visible = true;
        }
        onSignalRemoveCertificatesFail: {
            console.log("Signal onSignalRemoveCertificatesFail")
            mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                    qsTranslate("Popup Card","STR_POPUP_ERROR")
            mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                    qsTranslate("Popup Card","STR_CERTIFICATES_REMOVE_ERROR_MSG")
            mainFormID.propertyPageLoader.propertyGeneralPopUp.visible = true;
        }
        onSignalLanguageChangedError: {
            mainFormID.propertyPageLoader.propertyGeneralTitleText.text =
                    "Erro / Error"
            mainFormID.propertyPageLoader.propertyGeneralPopUpLabelText.text =
                    "Erro na leitura dos idiomas. Por favor, reinstale a aplicação \n
Load language error. Please reinstall the application"
            mainFormID.propertyPageLoader.propertyGeneralPopUp.visible = true
        }

        onSignalSetReaderComboIndex: {
            console.log("onSignalSetReaderComboIndex index = " + selected_reader)
            comboBoxReader.currentIndex = selected_reader
        }

        onSignalReaderContext: {
            console.log("onSignalReaderContext")
            //console.log("Reader List: " + gapi.getRetReaderList())
            //console.log("Reader List Count: " + gapi.getRetReaderList().length)

            for ( var i = 0; i < gapi.getRetReaderList().length; ++i ) {
              //  console.log("Reader List " + "i = " + i +" : "+ gapi.getRetReaderList()[i])
                comboBoxReader.model = gapi.getRetReaderList()
            }
            mainFormID.opacity = 0.5
            readerContext.open()
        }
    }

    Dialog {
        id: readerContext
        width: 400
        height: 250
        visible: false
        font.family: lato.name
        // Center dialog in the main view
        x: parent.width * 0.5 - readerContext.width * 0.5
        y: parent.height * 0.5 - readerContext.height * 0.5

        header: Label {
            id: labelReaderContext
            text: "Aviso"
            elide: Label.ElideRight
            padding: 24
            bottomPadding: 0
            font.bold: true
            font.pixelSize: 16
            color: Constants.COLOR_MAIN
        }
        Item {
            width: parent.width
            height: rectMessageTop.height + rectReaderCombo.height + rectSwitchRemember.height

            Item {
                id: rectMessageTop
                width: parent.width
                height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: textMessageTop
                    text: "Múltiplos cartões detectados"
                    font.pixelSize: Constants.SIZE_TEXT_LABEL
                    font.family: lato.name
                    color: Constants.COLOR_TEXT_LABEL
                    height: parent.height
                    width: parent.width
                    anchors.bottom: parent.bottom
                    wrapMode: Text.WordWrap
                }
            }
            Rectangle {
                id: rectReaderCombo
                width: parent.width
                color: "white"
                height: 3 * Constants.SIZE_TEXT_FIELD
                anchors.top : rectMessageTop.bottom

                ComboBox {
                    id: comboBoxReader
                    width: parent.width
                    height: 3 * Constants.SIZE_TEXT_FIELD
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: lato.name
                    font.pixelSize: Constants.SIZE_TEXT_FIELD
                    font.capitalization: Font.MixedCase
                    visible: true
                }
            }
            Item {
                id: rectSwitchRemember
                width: parent.width
                height: 50
                anchors.top: rectReaderCombo.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                visible: true
                Text {
                    id: textNote
                    text:  "Para alterar essa opção mais tarde, vá para o menu de configuração"
                    font.pixelSize: Constants.SIZE_TEXT_LABEL
                    font.family: lato.name
                    color: Constants.COLOR_TEXT_LABEL
                    height: parent.height
                    width: parent.width
                    anchors.bottom: parent.bottom
                    wrapMode: Text.WordWrap
                }
            }
        }

        standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
        onAccepted: {
            console.log("propertyComboBoxReader onActivated index = " + comboBoxReader.currentIndex)
            gapi.setReaderByUser(comboBoxReader.currentIndex)

            mainFormID.opacity = 1
            mainFormID.propertyPageLoader.source = mainFormID.propertyPageLoader.source

            // Force reload page loader
            var temp = mainFormID.propertyPageLoader.source
            mainFormID.propertyPageLoader.source = ""
            mainFormID.propertyPageLoader.source = temp
        }
        onRejected: {
            mainFormID.opacity = 1
        }
    }

    MainForm {
        id: mainFormID

        Component.onCompleted: {
                mainFormID.propertyContentPagesView.width = mainWindow.width
                mainFormID.propertyPageLoader.source = "contentPages/card/Tutorial.qml"
        }
    }
    Component.onCompleted: {
        console.log("Window mainWindow Completed")
        controler.initTranslation()
        gapi.initTranslation()
    }
}
