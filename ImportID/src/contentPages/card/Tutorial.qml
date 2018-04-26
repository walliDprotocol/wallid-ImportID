import QtQuick 2.6
import QtQuick.Controls 2.1
import "../../scripts/Constants.js" as Constants

//Import C++ defined enums
import eidguiV2 1.0

TutorialForm {

    property string tempImportText: ""
    property string tempWalletSigned: ""
    property string tempSod: ""
    property string tempCertificate: ""
    property bool appFormLoaded: false

    Connections {
        target: gapi
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
        }
    }

    propertStartButton {
        onClicked: {
            console.log("Start Button clicked")
                mainFormID.propertyPageLoader.source = "App.qml"
        }
    }
    propertyTutorialButton {
        onClicked: {
            console.log("Tutorial Button clicked")
                mainWindow.title = qsTr("STR_APP_TITLE_TEXT") + controler.autoTr
                propertyintroPage.visible = false
                propertyTutorialFirstPage.visible = true
                propertyRectTutorialStatus.visible = true
                propertyTutorialStatusCicle1.opacity = 1
                propertyTutorialStatusCicle2.opacity = 0.5
                propertyTutorialStatusCicle3.opacity = 0.5
        }
    }
    propertyFirstPageButton {
        onClicked: {
            console.log("First Page Button clicked")
            propertyTutorialFirstPage.visible = false
            propertyTutorialSecondPage.visible = true
            propertyTutorialStatusCicle1.opacity = 0.5
            propertyTutorialStatusCicle2.opacity = 1
            propertyTutorialStatusCicle3.opacity = 0.5
        }
    }
    propertySecondPageButton {
        onClicked: {
            console.log("Second Page Button clicked")
            propertyTutorialSecondPage.visible = false
            propertyTutorialThirdPage.visible = true
            propertyTutorialStatusCicle1.opacity = 0.5
            propertyTutorialStatusCicle2.opacity = 0.5
            propertyTutorialStatusCicle3.opacity = 1
        }
    }
    propertyThirdPageButton {
        onClicked: {
            console.log("Third Page Button clicked")
            propertyTutorialThirdPage.visible = false
            mainFormID.propertyPageLoader.source = "App.qml"
        }
    }
    propertyBackFirstPageButton {
        onClicked: {
            console.log("Back First Page Button clicked")
            propertyTutorialFirstPage.visible = false
            propertyintroPage.visible = true
            mainWindow.title = qsTr("STR_APP_TITLE") + controler.autoTr
            propertyRectTutorialStatus.visible = false
        }
    }
    propertyBackSecondPageButton {
        onClicked: {
            console.log("Back Second Page Button clicked")
            propertyTutorialSecondPage.visible = false
            propertyTutorialFirstPage.visible = true
            propertyTutorialStatusCicle1.opacity = 1
            propertyTutorialStatusCicle2.opacity = 0.5
            propertyTutorialStatusCicle3.opacity = 0.5
            mainWindow.title = qsTr("STR_APP_TITLE") + controler.autoTr
        }
    }
    propertyBackThirdPageButton {
        onClicked: {
            console.log("Back Third Page Button clicked")
            propertyTutorialThirdPage.visible = false
            propertyTutorialSecondPage.visible = true
            propertyTutorialStatusCicle1.opacity = 0.5
            propertyTutorialStatusCicle2.opacity = 1
            propertyTutorialStatusCicle3.opacity = 0.5
            mainWindow.title = qsTr("STR_APP_TITLE") + controler.autoTr
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
