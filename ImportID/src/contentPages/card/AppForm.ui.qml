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
    property alias propertyHelpPage: helpPage

    property alias propertyComboBoxReader: comboBoxReader
    property alias propertyComboBoxEntity: comboBoxEntity
    property alias propertyComboBoxLanguage: comboBoxLanguage
    property alias propertyImageEntity: imageEntity
    property alias propertyImageLang: imageLang
    property alias propertyCheckBoxIdentity: checkBoxIdentity
    property alias propertyCheckBoxAddress: checkBoxAddress
    property alias propertyTextWalletAddress: textWalletAddress
    property alias propertyTextStepDescription: textStepDescription
    property alias propertyImportText: importText
    property alias propertyTextFieldWallet: textFieldWallet

    property alias propertStartButton: startButton
    property alias propertHelpTextMenuMouseArea: helpTextMenuMouseArea
    property alias propertHelpTextMenu: helpTextMenu
    property alias propertyHelpTextBlockIdMenuMouseArea: helpTextBlockIdMenuMouseArea
    property alias propertHelpTextBlockId: helpTextBlockId

    property alias propertyGenerateButton: generateButton
    property alias propertyBackButton: backButton
    property alias propertyBackGenerateButton: backGenerateButton
    property alias propertyGotoButton: gotoButton
    property alias propertyBackHelpButton: backHelpButton

    property alias propertyFlickImportText: flickableImportText

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
            id: rectLeft
            width: parent.width / 2
            anchors.bottom: parent.bottom
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
            id: rectRight
            width: parent.width / 2
            anchors.bottom: parent.bottom
            height: parent.height
            enabled: true
            anchors.left: rectLeft.right
            MouseArea {
                id: helpTextBlockIdMenuMouseArea
                hoverEnabled: true
                anchors.fill: parent
            }
            Text {
                id: helpTextBlockId
                text: qsTr("STR_POWER_BY") + controler.autoTr
                font.capitalization: Font.MixedCase
                anchors.right: parent.right
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
            width: parent.width - 10
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            y: 10
            x: 10
            Image {
                id: imageLang
                antialiasing: true
                height: 30
                y: 5
                fillMode: Image.PreserveAspectFit
            }
            ComboBox {
                id: comboBoxLanguage
                width: 150
                height: 40
                font.family: lato.name
                font.pixelSize: Constants.SIZE_TEXT_FIELD
                font.capitalization: Font.MixedCase
                visible: true
                anchors.left: imageLang.right
                anchors.margins: 10
                model: [
                    qsTr("STR_LANG_EN") + controler.autoTr,
                    qsTr("STR_LANG_PT") + controler.autoTr
                ]
            }
        }

        Rectangle {
            id: rowIntroTitle
            width: parent.width
            height: parent.height * 0.4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rectSelectLanguage.bottom

            Text {
                id: textTopTitle
                text: qsTr("STR_TEXT_TITLE") + controler.autoTr
                y: 100
                font.bold: false
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Constants.SIZE_TEXT_TITLE
                color: Constants.COLOR_MAIN_DARK
            }
            Text {
                id: textAppSlogan
                text: qsTr("STR_TEXT_SUB_TITLE") + controler.autoTr
                y: 180
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                color: Constants.COLOR_MAIN_SOFT_GRAY
            }
        }

        Rectangle {
            id: rectSelectEntity
            width: parent.width - 60
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
                    height: Constants.HEIGHT_BOTTOM_COMPONENT
                    fillMode: Image.PreserveAspectFit
                }
                ComboBox {
                    id: comboBoxEntity
                    width: parent.width - imageEntity.width - 20
                    height: Constants.HEIGHT_BOTTOM_COMPONENT
                    font.family: lato.name
                    font.pixelSize: Constants.SIZE_TEXT_FIELD
                    font.capitalization: Font.MixedCase
                    visible: true
                    anchors.left: imageEntity.right
                    anchors.margins: 20
                    model: [
                        qsTr("STR_CHOOSE_ID_TYPE") + controler.autoTr,
                        qsTr("STR_CC_PORTUGUESE") + controler.autoTr
                    ]
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
                    width: Constants.WIDTH_BUTTON
                    height: Constants.HEIGHT_BOTTOM_COMPONENT
                    font.capitalization: Font.MixedCase
                    enabled: true
                    anchors.horizontalCenter: parent.horizontalCenter
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
            y: 50
            text: "1 " + qsTr("STR_SELECT_CARD_READER") + controler.autoTr
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
            text: "2 " + qsTr("STR_CHOOSE_DATA_TO_IMPORT") + controler.autoTr
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
            text: "3 " + qsTr("STR_ENTER_WALLET") + controler.autoTr
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
            y: Constants.BUTTONS_Y_POS
            text: qsTr("STR_BACK_BUTTON") + controler.autoTr
            font.capitalization: Font.MixedCase
            width: Constants.WIDTH_BUTTON
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true
        }
        Button {
            id: generateButton
            y: Constants.BUTTONS_Y_POS
            x: parent.width - 30 - generateButton.width
            text: qsTr("STR_GENERATE") + controler.autoTr
            font.capitalization: Font.MixedCase
            width: Constants.WIDTH_BUTTON
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: false
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
            y: 50
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
            font.pixelSize: Constants.SIZE_TEXT_BODY
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
            y: Constants.BUTTONS_Y_POS
            text: qsTr("STR_BACK_BUTTON") + controler.autoTr
            font.capitalization: Font.MixedCase
            width: Constants.WIDTH_BUTTON
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true
        }
        Button {
            id: gotoButton
            x: parent.width - 30 - generateButton.width
            y: Constants.BUTTONS_Y_POS
            text: qsTr("STR_GOTO_MYETHERID_IO") + controler.autoTr
            font.capitalization: Font.MixedCase
            width: Constants.WIDTH_BUTTON
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true
        }
    }

    Rectangle {
        id: helpPage
        width: parent.width
        height: parent.height
        visible: false

        Text {
            id: textTop1
            x: 30
            y: 50
            text: qsTr("STR_WHAT_IS_BLOCKID") + controler.autoTr
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        Text {
            id: subTextTop1
            x: 30
            text: qsTr("STR_WHAT_IS_BLOCKID_TEXT") + controler.autoTr
            width: parent.width - 60
            wrapMode: Text.WordWrap
            anchors.top: textTop1.bottom
            anchors.topMargin: 10
            font.pixelSize: Constants.SIZE_TEXT_LABEL
            color: Constants.COLOR_MAIN_BLACK
        }
        Text {
            id: textTop2
            x: 30
            anchors.top: subTextTop1.bottom
            anchors.topMargin: 30
            text: qsTr("STR_WHAT_IS_BLOCKID") + controler.autoTr
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        Text {
            id: subTextTop2
            x: 30
            text: qsTr("STR_WHAT_IS_BLOCKID_TEXT") + controler.autoTr
            width: parent.width - 60
            wrapMode: Text.WordWrap
            anchors.top: textTop2.bottom
            anchors.topMargin: 10
            font.pixelSize: Constants.SIZE_TEXT_LABEL
            color: Constants.COLOR_MAIN_BLACK
        }
        Text {
            id: textTop3
            x: 30
            anchors.top: subTextTop2.bottom
            anchors.topMargin: 30
            text: qsTr("STR_WHAT_IS_BLOCKID") + controler.autoTr
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        Text {
            id: subTextTop3
            x: 30
            text: qsTr("STR_WHAT_IS_BLOCKID_TEXT") + controler.autoTr
            width: parent.width - 60
            wrapMode: Text.WordWrap
            anchors.top: textTop3.bottom
            anchors.topMargin: 10
            font.pixelSize: Constants.SIZE_TEXT_LABEL
            color: Constants.COLOR_MAIN_BLACK
        }
        Text {
            id: textTop4
            x: 30
            anchors.top: subTextTop3.bottom
            anchors.topMargin: 30
            text: qsTr("STR_WHAT_IS_BLOCKID") + controler.autoTr
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        Text {
            id: subTextTop4
            x: 30
            text: qsTr("STR_WHAT_IS_BLOCKID_TEXT") + controler.autoTr
            width: parent.width - 60
            wrapMode: Text.WordWrap
            anchors.top: textTop4.bottom
            anchors.topMargin: 10
            font.pixelSize: Constants.SIZE_TEXT_LABEL
            color: Constants.COLOR_MAIN_BLACK
        }
        Button {
            id: backHelpButton
            x: 30
            y: Constants.BUTTONS_Y_POS
            text: qsTr("STR_BACK_BUTTON") + controler.autoTr
            font.capitalization: Font.MixedCase
            width: Constants.WIDTH_BUTTON
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true
        }
    }
}
