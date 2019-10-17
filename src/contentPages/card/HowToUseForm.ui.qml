import QtQuick 2.6
import QtQuick.Controls 2.1

import "../../scripts/Constants.js" as Constants
import "../../components" as Components

Item {
    anchors.fill: parent

    property alias propertyBackHowToUseButton: backHowToUseButton

    property alias propertyFaqBoxL1: faqBoxL1.propertyTextAnswer
    property alias propertyFaqBoxL2: faqBoxL2.propertyTextAnswer
    property alias propertyFaqBoxL3: faqBoxL3.propertyTextAnswer
    property alias propertyFaqBoxL4: faqBoxL4.propertyTextAnswer
    property alias propertyFaqBoxL5: faqBoxL5.propertyTextAnswer
    property alias propertyFaqBoxL6: faqBoxL6.propertyTextAnswer
    property alias propertyFaqBoxL7: faqBoxL7.propertyTextAnswer
    property alias propertyFaqBoxL8: faqBoxL8.propertyTextAnswer

    property alias propertyFaqBoxR1: faqBoxR1.propertyTextAnswer
    property alias propertyFaqBoxR2: faqBoxR2.propertyTextAnswer
    property alias propertyFaqBoxR3: faqBoxR3.propertyTextAnswer
    property alias propertyFaqBoxR4: faqBoxR4.propertyTextAnswer
    property alias propertyFaqBoxR5: faqBoxR5.propertyTextAnswer
    property alias propertyFaqBoxR6: faqBoxR6.propertyTextAnswer
    property alias propertyFaqBoxR7: faqBoxR7.propertyTextAnswer
    property alias propertyFaqBoxR8: faqBoxR8.propertyTextAnswer

    Item {
        id: helpPage
        width: parent.width
        height: parent.height
        visible: true

        Item {
            id: leftFaqs
            width: parent.width * 0.5 - 45
            height: parent.height
            y: Constants.PAGE_Y_POS
            x: 30
            visible: true
            Components.FAQBox {
                id: faqBoxL1
                width: parent.width
                propertyTextTitle.text: qsTr("STR_FAQ_L1") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_L1_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxL2
                width: parent.width
                anchors.top: faqBoxL1.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_L2") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_L2_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxL3
                width: parent.width
                anchors.top: faqBoxL2.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_L3") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_L3_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxL4
                width: parent.width
                anchors.top: faqBoxL3.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_L4") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_L4_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxL5
                width: parent.width
                anchors.top: faqBoxL4.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_L5") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_L5_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxL6
                width: parent.width
                anchors.top: faqBoxL5.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_L6") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_L6_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxL7
                width: parent.width
                anchors.top: faqBoxL6.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_L7") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_L7_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxL8
                width: parent.width
                anchors.top: faqBoxL7.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_L8") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_L8_TEXT") + "<style> a:link { color :"
                                         + Constants.COLOR_LINKS + "; }</style>"
                                         + "<a href=\"https://www.myetherwallet.com\"> www.myetherwallet.com"
            }
        }

        Item {
            id: rightFaqs
            width: parent.width * 0.5 - 45
            height: parent.height
            y: Constants.PAGE_Y_POS
            visible: true
            anchors.left: leftFaqs.right
            anchors.leftMargin: 30

            Components.FAQBox {
                id: faqBoxR1
                width: parent.width
                propertyTextTitle.text: qsTr("STR_FAQ_R1") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_R1_TEXT") + controler.autoTr
                // TODO: Add link to Tutorial
            }
            Components.FAQBox {
                id: faqBoxR2
                width: parent.width
                anchors.top: faqBoxR1.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_R2") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_R2_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxR3
                width: parent.width
                anchors.top: faqBoxR2.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_R3") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_R3_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxR4
                width: parent.width
                anchors.top: faqBoxR3.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_R4") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_R4_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxR5
                width: parent.width
                anchors.top: faqBoxR4.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_R5") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_R5_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxR6
                width: parent.width
                anchors.top: faqBoxR5.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_R6") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_R6_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxR7
                width: parent.width
                anchors.top: faqBoxR6.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_R7") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_R7_TEXT") + controler.autoTr
            }
            Components.FAQBox {
                id: faqBoxR8
                width: parent.width
                anchors.top: faqBoxR7.bottom
                propertyTextTitle.text: qsTr("STR_FAQ_R8") + controler.autoTr
                propertyTextAnswer.text: qsTr("STR_FAQ_R8_TEXT") + "<style> a:link { color :"
                                         + Constants.COLOR_LINKS + "; }</style>"
                                         + "<a href=\"https://www.myetherid.io\"> www.myetherid.io"
            }
        }

        Button {
            id: backHowToUseButton
            x: Constants.BUTTONS_BACK_X_POS
            y: parent.height - 30
            width: Constants.ARROW_WIDTH
            height: Constants.ARROW_HEIGHT
            font.capitalization: Font.MixedCase
            enabled: true
            background: Rectangle {
                width: parent.width
                height: parent.height
                radius: 5
                color: Constants.COLOR_BUTTONS
                Image {
                    antialiasing: true
                    width: parent.width * 0.5
                    height: parent.height * 0.5
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/images/arrow-back.png"
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

