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
    property alias propertyImageEntity: imageEntity
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
                hoverEnabled : true
                anchors.fill: parent
            }
            Text {
                id: helpTextMenu
                text: qsTr("How to Use")
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
                hoverEnabled : true
                anchors.fill: parent
            }
            Text {
                id: helpTextBlockId
                text: qsTr("Power by BlockID @ 2018")
                font.capitalization: Font.MixedCase
                anchors.right: parent.right
                enabled: true
            }
        }
    }

    Rectangle {
        id: introBox
        x: 0
        width: parent.width
        height: parent.height - rectBotton.height
        anchors.topMargin: 0
        visible: true

        Rectangle {
            id: rowIntroTitle
            width: parent.height
            height: parent.height * 0.4
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: textTopTitle
                text: "ImportID"
                y: 100
                font.bold: false
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Constants.SIZE_TEXT_TITLE
                color: Constants.COLOR_MAIN_DARK
            }
            Text {
                id: textAppSlogan
                text: "Extract ID attributes "
                y: 180
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                color: Constants.COLOR_MAIN_SOFT_GRAY
            }
            Text {
                id: textTopSubTitle2
                text: "to the blockchain"
                y: 210
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

            Rectangle{
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
                    model: [ "",
                    "Citizen Card - Portuguese Republic"]
                }
            }
            Rectangle{
                id: rectSelectEntityBottom
                width: Constants.WIDTH_BUTTON
                height: parent.height
                anchors.top: rectSelectEntityTop.bottom
                anchors.margins: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    id: startButton
                    text: qsTr("ImportID")
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
            text: "1 " + qsTr("Select Card Reader")
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
            text: "2 " + qsTr("Choose data to import")
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
            text: qsTr("Identity")
        }
        CheckBox {
            id: checkBoxAddress
            x: 150
            anchors.top: textStep2.bottom
            anchors.topMargin: 10
            text: qsTr("Address")
        }
        Text {
            id: textStep3
            x: 30
            y: 250
            text: "3 " + qsTr("Your ether wallet address")
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
            text: qsTr("Back")
            font.capitalization: Font.MixedCase
            width: Constants.WIDTH_BUTTON
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true
        }
        Button {
            id: generateButton
            y: Constants.BUTTONS_Y_POS
            x: parent.width - 30 - generateButton.width
            text: qsTr("Generate ID Data")
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
            text: qsTr("ID Data Successfully created")
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
            text: qsTr("Back")
            font.capitalization: Font.MixedCase
            width: Constants.WIDTH_BUTTON
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true
        }
        Button {
            id: gotoButton
            x: parent.width - 30 - generateButton.width
            y: Constants.BUTTONS_Y_POS
            text: qsTr("Goto MyEtherID.io")
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
            text: qsTr("What is BlockID")
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        Text {
            id: subTextTop1
            x: 30
            text: qsTr("BlockID is a concept for an ecosystem: secure and reliable loading of validated off-chain \
identity in the blockchain and consequent use of encrypted and previously authorized form")
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
            text: qsTr("What is BlockID")
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        Text {
            id: subTextTop2
            x: 30
            text: qsTr("BlockID is a concept for an ecosystem: secure and reliable loading of validated off-chain \
identity in the blockchain and consequent use of encrypted and previously authorized form")
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
            text: qsTr("What is BlockID")
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        Text {
            id: subTextTop3
            x: 30
            text: qsTr("BlockID is a concept for an ecosystem: secure and reliable loading of validated off-chain \
identity in the blockchain and consequent use of encrypted and previously authorized form")
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
            text: qsTr("What is BlockID")
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        Text {
            id: subTextTop4
            x: 30
            text: qsTr("BlockID is a concept for an ecosystem: secure and reliable loading of validated off-chain \
identity in the blockchain and consequent use of encrypted and previously authorized form")
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
            text: qsTr("Back")
            font.capitalization: Font.MixedCase
            width: Constants.WIDTH_BUTTON
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true
        }
    }
}
