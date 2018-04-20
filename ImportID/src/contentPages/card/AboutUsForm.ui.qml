import QtQuick 2.6
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0

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
            source : "qrc:/images/icon.png"
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
            text: "<-"
            font.capitalization: Font.MixedCase
            width: 40
            height: 40
            enabled: true
            contentItem: Text {
                text: backAboutUsButton.text
                font: backAboutUsButton.font
                color: backAboutUsButton.down ? Constants.COLOR_BUTTONS_DOWN : Constants.COLOR_BUTTONS
                opacity: enabled ? 1.0 : 0.3
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            background: Rectangle {
                color: Constants.COLOR_MAIN_DARK
                radius : 10
            }
        }
    }
}
