import QtQuick 2.6
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0

import "../../scripts/Constants.js" as Constants

Item {
    anchors.fill: parent

    property alias propertyBusyIndicator: busyIndication

    property alias propertyintroPage: introBox
    property alias propertyGeneratePage: generatePage
    property alias propertyFinishPage: finishPage

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

    property alias propertStartButton: startButton
    property alias propertHelpTextMenuMouseArea: helpTextMenuMouseArea
    property alias propertAboutUsTextMenuMouseArea: aboutUsTextMenuMouseArea
    property alias propertyTutorialMouseArea: tutorialMouseArea
    property alias propertHelpTextMenu: helpTextMenu
    property alias propertyTutorialTextMenu: tutorialTextMenu
    property alias propertAboutTextBlockId: aboutTextBlockId

    property alias propertyGenerateButton: generateButton
    property alias propertyBackButton: backButton
    property alias propertyBackGenerateButton: backGenerateButton
    property alias propertyGotoButton: gotoButton


    property alias propertyFlickImportText: flickableImportText

    property alias propertyIndicatorText: indicatorText.text
    property alias propertyIndicatorImage: indicatorIcon.source

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

    Rectangle {
        id: rectBotton
        x: 30
        width: parent.width - 60
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        height: 30
        enabled: true

        Rectangle {
            id: rectAboutUs
            width: 100
            anchors.bottom: parent.bottom
            height: parent.height
            enabled: true
            anchors.right: rectBotton.right
            MouseArea {
                id: aboutUsTextMenuMouseArea
                hoverEnabled: true
                anchors.fill: parent
            }
            Text {
                id: aboutTextBlockId
                text: qsTr("STR_ABOUT_US") + controler.autoTr
                font.capitalization: Font.MixedCase
                anchors.right: parent.right
                enabled: true
            }
        }
        Rectangle {
            id: rectHowTouse
            width: 100
            anchors.bottom: parent.bottom
            anchors.right: rectAboutUs.left
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
                enabled: true
            }
        }
        Rectangle {
            id: rectTutorial
            width: 100
            anchors.bottom: parent.bottom
            anchors.right: rectHowTouse.left
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
                enabled: true
            }
        }
    }

    Rectangle {
        id: introBox
        width: parent.width
        height: parent.height - rectBotton.height
        anchors.topMargin: 0
        visible: true

        Rectangle {
            id: rectSelectLanguage
            width: parent.width - 20
            anchors.horizontalCenter: parent.horizontalCenter
            height: Constants.HEIGHT_LANGUAGE_COMPONENT
            y: 5

            ComboBox {
                id: comboBoxLanguage
                width: 60
                height: Constants.HEIGHT_LANGUAGE_COMPONENT
                visible: true
                //the background of the combobox
                background: Rectangle {
                    border.width: 1
                    border.color: Constants.COLOR_MAIN
                    radius: 5
                }
                model: LanguageModel{}
                delegate: LanguageDelegate{}
                //the arrow on the right in the combobox
                indicator:Item{

                    width: parent.width;
                    height: 40
                    anchors.verticalCenter: parent.verticalCenter
                    id: itemDlgtLanguage
                    Image {
                        id: indicatorIconLanguage
                        antialiasing: true
                        height: 18
                        x: 10
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
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/images/arrow-down.svg"
                    }
                }
                //the list of elements and their style when the combobox is open
                popup: Popup {
                    id:comboPopupLanguage
                    y: comboBoxLanguage.height - 1
                    width: comboBoxLanguage.width
                    height:contentItem.implicitHeigh
                    padding: 1

                    contentItem:
                        ListView {
                        id:listViewLanguage
                        implicitHeight: contentHeight
                        model: comboBoxLanguage.popup.visible ? comboBoxLanguage.delegateModel : null
                        ScrollIndicator.vertical: ScrollIndicator { }
                    }

                    background: Rectangle {
                        radius: 0
                        border.width: 1
                        border.color: Constants.COLOR_MAIN
                    }
                }
            }
        }

        Rectangle {
            id: rowIntroTitle
            width: parent.width
            height: parent.height * 0.4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rectSelectLanguage.bottom

            Image {
                id: imageIcon
                antialiasing: true
                height: 160
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
                source : "qrc:/images/logo.svg"
            }
            Text {
                id: textAppSlogan
                text: qsTr("STR_TEXT_SUB_TITLE") + controler.autoTr
                anchors.horizontalCenter: parent.horizontalCenter
                y: imageIcon.height
                font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                color: Constants.COLOR_MAIN_SOFT_GRAY
            }
        }

        Rectangle {
            id: rectSelectEntity
            width: parent.width * 0.5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rowIntroTitle.bottom
            anchors.topMargin: 80
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true
            color: "blue"

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
                        border.width: 1
                        border.color: Constants.COLOR_MAIN
                        radius: 10
                    }
                    model: EntitiesModel{}
                    delegate: EntitiesDelegate{}
                    //the arrow on the right in the combobox
                    indicator:Item{

                        width: parent.width;
                        height: 40
                        anchors.verticalCenter: parent.verticalCenter
                        id: itemDlgt
                        Image {
                            id: indicatorIcon
                            antialiasing: true
                            width: Constants.SIZE_IMAGE_LOGO_CC_WIDTH
                            height: Constants.SIZE_IMAGE_LOGO_CC_HEIGHT
                            x: 10
                            anchors.verticalCenter: parent.verticalCenter
                            fillMode: Image.PreserveAspectFit
                        }
                        Text {
                            id: indicatorText
                            anchors.left: indicatorIcon.right
                            anchors.leftMargin: 20
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("STR_CHOOSE_ID_TYPE")  + controler.autoTr
                        }
                        Image {
                            id: indicatorIconArrow
                            antialiasing: true
                            height: Constants.HEIGHT_BOTTOM_COMPONENT
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            fillMode: Image.PreserveAspectFit
                            source: "qrc:/images/arrow-down.svg"
                        }
                    }
                    //the list of elements and their style when the combobox is open
                    popup: Popup {
                        id:comboPopup
                        y: comboBoxEntity.height - 1
                        width: comboBoxEntity.width
                        height:contentItem.implicitHeigh
                        padding: 1

                        contentItem:
                            ListView {
                            id:listView
                            implicitHeight: contentHeight
                            model: comboBoxEntity.popup.visible ? comboBoxEntity.delegateModel : null
                            ScrollIndicator.vertical: ScrollIndicator { }
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
                    model: EntitiesModel{}
                }
            }
            Rectangle {
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
                        color: startButton.down ? Constants.COLOR_BUTTONS_DOWN : Constants.COLOR_BUTTONS
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
                        color: startButton.enabled ? Constants.COLOR_MAIN_DARK : Constants.COLOR_MAIN_SOFT_GRAY
                        radius : 10
                    }
                }
            }
        }
    }

    Rectangle {
        id: generatePage
        width: parent.width
        height: parent.height - rectBotton.height
        anchors.topMargin: 0
        visible: false
        Text {
            id: textStep1
            x: 30
            y: Constants.PAGE_Y_POS
            text: "1  " + qsTr("STR_SELECT_CARD_READER") + controler.autoTr
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
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
        Text {
            id: textStep2
            x: 30
            y: 150
            text: "2  " + qsTr("STR_CHOOSE_DATA_TO_IMPORT") + controler.autoTr
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        CheckBox {
            id: checkBoxIdentity
            x: 60
            anchors.top: textStep2.bottom
            anchors.topMargin: 10
            checked: true
            enabled: false
            text: qsTr("STR_CHECKBOX_IDENTITY") + controler.autoTr
        }
        CheckBox {
            id: checkBoxAddress
            x: 150
            anchors.top: textStep2.bottom
            anchors.topMargin: 10
            text: qsTr("STR_CHECKBOX_ADDRESS") + controler.autoTr
        }
        Text {
            id: textStep3
            x: 30
            y: 250
            text: "3  " + qsTr("STR_ENTER_WALLET") + controler.autoTr
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
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
            x: 30
            y: Constants.BUTTONS_BACK_Y_POS
            font.capitalization: Font.MixedCase
            width: Constants.ARROW_WIDTH
            height: Constants.ARROW_HEIGHT
            enabled: true
            background: Rectangle {
                radius : 10
                Image {
                    antialiasing: true
                    anchors.fill: parent
                    source: "qrc:/images/arrow-back.svg"
                }
            }
        }



        Button {
            id: generateButton
            y: Constants.BUTTONS_Y_POS
            x: parent.width - 30 - generateButton.width
            text: qsTr("STR_GENERATE") + controler.autoTr
            font.capitalization: Font.MixedCase
            font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
            contentItem: Text {
                text: generateButton.text
                font: generateButton.font
                color: generateButton.down ? Constants.COLOR_BUTTONS_DOWN : Constants.COLOR_BUTTONS
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
                color: generateButton.enabled ? Constants.COLOR_MAIN_DARK : Constants.COLOR_MAIN_SOFT_GRAY
                radius : 10
            }
        }
    }

    Rectangle {
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
            color: Constants.COLOR_MAIN
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
            color: Constants.COLOR_MAIN_BLACK
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
            color: Constants.COLOR_MAIN
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
            x: 30
            y: Constants.BUTTONS_BACK_Y_POS
            font.capitalization: Font.MixedCase
            width: Constants.ARROW_WIDTH
            height: Constants.ARROW_HEIGHT
            enabled: true
            background: Rectangle {
                radius : 10
                Image {
                    antialiasing: true
                    anchors.fill: parent
                    source: "qrc:/images/arrow-back.svg"
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
                color: gotoButton.down ? Constants.COLOR_BUTTONS_DOWN : Constants.COLOR_BUTTONS
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
                radius : 10
            }
        }
    }
}
