import QtQuick 2.6
import QtQuick.Controls 2.1

import "../scripts/Constants.js" as Constants

Item {
    property alias propertyTextTitle: textTitle
    property alias propertyTextAnswer: textAnswer
    property alias propertyTitleMouseArea: titleMouseArea

    height: rectTitle.height + Constants.HEIGHT_LINE_FAQS + 2 * Constants.SPACE_V_TEXT_FAQS
            + (textAnswer.visible ?  textAnswer.paintedHeight : 0)

    Rectangle{
        id: rectTitle
        width: parent.width
        height: textTitle.paintedHeight
        Text {
            id: textTitle
            width: parent.width - 30
            wrapMode: Text.WordWrap
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Constants.SIZE_TEXT_TITLE_FAQS
            color: Constants.COLOR_MAIN
        }
        Rectangle {
            id: rectLine
            width: parent.width
            height: Constants.HEIGHT_LINE_FAQS
            color: Constants.COLOR_MAIN_SOFT_GRAY
            anchors.top: parent.bottom
        }
        Image {
            id: indicatorIconArrow1
            antialiasing: true
            anchors.right: rectLine.right
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/arrow-down.png"
            rotation: textAnswer.visible ? 180 : 0
        }
        MouseArea {
            id: titleMouseArea
            hoverEnabled: true
            anchors.fill: parent
        }
    }
    Text {
        id: textAnswer
        width: parent.width
        wrapMode: Text.WordWrap
        anchors.top: rectTitle.bottom
        anchors.topMargin: Constants.SPACE_V_TEXT_FAQS
        font.pixelSize: Constants.SIZE_TEXT_FAQS
        color: Constants.COLOR_MAIN_SOFT_GRAY
        visible: false
    }
}
