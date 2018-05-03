import QtQuick 2.6
import QtQuick.Controls 2.1

import "../../scripts/Constants.js" as Constants
import "../../components" as Components

Item {
    anchors.fill: parent

    property alias propertyBackAboutUsButton: backAboutUsButton
    property alias propertySubTextVersion: subTextVersion

    Rectangle {
        id: helpPage
        width: parent.width
        height: parent.height
        visible: true

        Image {
            id: imageIcon
            antialiasing: true
            height: 160
            y: Constants.HEIGHT_LANGUAGE_COMPONENT + 5
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
            source : "qrc:/images/logo.svg"
        }

        Text {
            id: textAboutUs
            x: 30
            y: Constants.HEIGHT_LANGUAGE_COMPONENT + 5 + imageIcon.height
            text: qsTr("STR_ABOUT_US") + controler.autoTr
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        Text {
            id: subTextAboutUs
            x: 30
            text: qsTr("STR_ABOUT_US_TEXT") + controler.autoTr
            width: parent.width - 60
            wrapMode: Text.WordWrap
            anchors.top: textAboutUs.bottom
            anchors.topMargin: 10
            font.pixelSize: Constants.SIZE_TEXT_LABEL
            color: Constants.COLOR_MAIN_BLACK
        }
        Text {
            id: textVersion
            x: 30
            anchors.top: subTextAboutUs.bottom
            anchors.topMargin: 30
            text: qsTr("STR_VERSION") + controler.autoTr
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        Text {
            id: subTextVersion
            x: 30
            width: parent.width - 60
            wrapMode: Text.WordWrap
            anchors.top: textVersion.bottom
            anchors.topMargin: 10
            font.pixelSize: Constants.SIZE_TEXT_LABEL
            color: Constants.COLOR_MAIN_BLACK
        }

        Button {
            id: backAboutUsButton
            x: Constants.BUTTONS_BACK_X_POS
            y: parent.height - backAboutUsButton.height
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
    }
}
