import QtQuick 2.6
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0

import "../../scripts/Constants.js" as Constants

Item {
    anchors.fill: parent

    property alias propertyBusyIndicator: busyIndication

    property alias propertyRowTopTitle: rowTopTitle

    property alias propertyintroPage: introBox
    property alias propertyGeneratePage: generatePage
    property alias propertyFinishPage: finishPage

    property alias propertyComboBoxReader: comboBoxReader
    property alias propertyCheckBoxIdentity: checkBoxIdentity
    property alias propertyCheckBoxAddress: checkBoxAddress
    property alias propertyTextStepDescription: textStepDescription
    property alias propertyImportText: importText
    property alias propertyTextFieldWallet: textFieldWallet

    property alias propertStartButton: startButton
    property alias propertyGenerateButton: generateButton
    property alias propertyBackButton: backButton
    property alias propertyBackGenerateButton: backGenerateButton
    property alias propertyGotoButton: gotoButton

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
        id: rowTopTitle
        width: parent.width
        height: parent.height * 0.1
        color: Constants.COLOR_MAIN_SOFT_GRAY
        visible: !introBox.visible

        Text {
            id: textTopRawTitle
            text: "Block ID - Off-chain to On-chain Identity Service"
            font.bold: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN_DARK
        }
    }
    Rectangle {
        id: introBox
        x: 0
        width: parent.width
        height: parent.height - rowTopTitle.height
        anchors.top: rowTopTitle.bottom
        anchors.topMargin: 0
        visible: true

        Rectangle {
            id: rowIntroTitle
            width: parent.height
            height: parent.height * 0.4
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: textTopTitle
                text: "Block ID"
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: -40
                font.bold: false
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: Constants.SIZE_TEXT_TITLE
                color: Constants.COLOR_MAIN_DARK
            }
            Text {
                id: textTopSubTitle1
                text: "Off-chain to On-chain"
                anchors.verticalCenterOffset: 23
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                color: Constants.COLOR_MAIN_DARK
            }
            Text {
                id: textTopSubTitle2
                text: "Identity Service"
                anchors.verticalCenterOffset: 60
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                color: Constants.COLOR_MAIN_DARK
            }
        }

        Frame {
            id: frame1
            x: 60
            width: parent.width - 120
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rowIntroTitle.bottom
            anchors.topMargin: 80
            height: 104
            enabled: true

            Image {
                x: 8
                y: 20
                antialiasing: true
                width: Constants.SIZE_IMAGE_LOGO_CC_WIDTH
                height: Constants.SIZE_IMAGE_LOGO_CC_HEIGHT
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/logo_CC.png"
            }

            Button {
                id: startButton
                y: 20
                text: qsTr("Import ID")
                width: Constants.WIDTH_BUTTON
                height: Constants.HEIGHT_BOTTOM_COMPONENT
                anchors.horizontalCenterOffset: 92
                font.capitalization: Font.MixedCase
                enabled: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    Rectangle {
        id: generatePage
        width: parent.width
        height: parent.height - rowTopTitle.height
        anchors.top: rowTopTitle.bottom
        anchors.topMargin: 0
        visible: false
        Text {
            id: textStep1
            x: 30
            y: 25
            text: "1 - " + qsTr("Select the Card Reader")
            font.pixelSize: Constants.SIZE_TEXT_BODY
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
            y: 143
            text: "2 - " + qsTr("Select data to import")
            font.pixelSize: Constants.SIZE_TEXT_BODY
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
            x: 60
            anchors.top: checkBoxIdentity.bottom
            text: qsTr("Address")
        }
        Text {
            id: textStep3
            x: 30
            y: 280
            text: "3 - " + qsTr("Ethereum Wallet  address")
            font.pixelSize: Constants.SIZE_TEXT_BODY
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
            y: 400
            text: qsTr("Back")
            font.capitalization: Font.MixedCase
            width: Constants.WIDTH_BUTTON
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true
        }
        Button {
            id: generateButton
            y: 400
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
        height: parent.height - rowTopTitle.height
        anchors.top: rowTopTitle.bottom
        visible: false

        Text {
            id: textStep4
            x: 30
            y: 25
            text: qsTr("ID Data successfully created")
            font.pixelSize: Constants.SIZE_TEXT_BODY
        }
        Text {
            id: textStepDescription
            x: 30
            y: 35
            width: parent.width - 60
            wrapMode: Text.WordWrap
            anchors.top: textStep4.bottom
            anchors.topMargin: 10
            font.pixelSize: Constants.SIZE_TEXT_LABEL
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
            y: 400
            text: qsTr("Back")
            font.capitalization: Font.MixedCase
            width: Constants.WIDTH_BUTTON
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true
        }
        Button {
            id: gotoButton
            x: parent.width - 30 - generateButton.width
            y: 400
            text: qsTr("Goto MyEtherID")
            font.capitalization: Font.MixedCase
            width: Constants.WIDTH_BUTTON
            height: Constants.HEIGHT_BOTTOM_COMPONENT
            enabled: true
        }
    }
}
