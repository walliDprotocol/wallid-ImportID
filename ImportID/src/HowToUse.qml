import QtQuick 2.6
import QtQuick.Controls 2.1

import "../../scripts/Constants.js" as Constants

Rectangle {
    id: helpPage
    width: parent.width
    height: parent.height
    visible: false

    Text {
        id: textTop1
        x: 30
        y: Constants.PAGE_Y_POS
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
