import QtQuick 2.6
import QtQuick.Controls 2.1

import "../../scripts/Constants.js" as Constants
import "../../components" as Components

Item {
    anchors.fill: parent

    property alias propertyBackAboutUsButton: backAboutUsButton

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
            id: textTop1
            x: 30
            y: Constants.HEIGHT_LANGUAGE_COMPONENT + 5 + imageIcon.height
            text: qsTr("STR_ABOUT_US") + controler.autoTr
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        Text {
            id: subTextTop1
            x: 30
            text: qsTr("STR_ABOUT_US_TEXT") + controler.autoTr
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
            text: qsTr("STR_VERSION") + controler.autoTr
            font.pixelSize: Constants.SIZE_TEXT_BODY
            color: Constants.COLOR_MAIN
        }
        Text {
            id: subTextTop2
            x: 30
            text: "0.0.1"
            width: parent.width - 60
            wrapMode: Text.WordWrap
            anchors.top: textTop2.bottom
            anchors.topMargin: 10
            font.pixelSize: Constants.SIZE_TEXT_LABEL
            color: Constants.COLOR_MAIN_BLACK
        }

        Button {
            id: backAboutUsButton
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
    }
}
