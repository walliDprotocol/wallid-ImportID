import QtQuick 2.6
import QtQuick.Controls 2.1

import "../../scripts/Constants.js" as Constants

Item {
    anchors.fill: parent

    property alias propertyRectTutorialStatus: rectTutorialStatus
    property alias propertyTutorialStatusCicle1: tutorialStatusCicle1
    property alias propertyTutorialStatusCicle2: tutorialStatusCicle2
    property alias propertyTutorialStatusCicle3: tutorialStatusCicle3
    property alias propertyintroPage: introBox
    property alias propertyTutorialFirstPage: tutorialFirstPage
    property alias propertyTutorialSecondPage: tutorialSecondPage
    property alias propertyTutorialThirdPage: tutorialThirdPage

    property alias propertyComboBoxLanguage: comboBoxLanguage
    property alias propertyImageLang: indicatorIconLanguage

    property alias propertStartButton: startButton
    property alias propertyTutorialButton: tutorialButton

    property alias propertyFirstPageButton: firstPageButton
    property alias propertySecondPageButton: secondPageButton
    property alias propertyThirdPageButton: thirdPageButton
    property alias propertyBackFirstPageButton: backFirstPageButton
    property alias propertyBackSecondPageButton: backSecondPageButton
    property alias propertyBackThirdPageButton: backThirdPageButton

    property alias propertyReminderCheckBox: reminderCheckBox

    Item {
        id: main
        anchors.fill: parent

        Item {
            id: rectTutorialStatus
            x: 30
            width: 100
            height: Constants.ARROW_HEIGHT
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            visible: true

            Rectangle {
                id: tutorialStatusCicle1
                width: 15
                height: 15
                radius: width / 2
                color: Constants.COLOR_MAIN
                anchors.right: tutorialStatusCicle2.left
                anchors.margins: 15
				opacity: 1
            }
            Rectangle {
                id: tutorialStatusCicle2
                width: 15
                height: 15
                radius: width / 2
                color: Constants.COLOR_MAIN
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 15
				opacity: 0.5
            }
            Rectangle {
                id: tutorialStatusCicle3
                width: 15
                height: 15
                radius: width / 2
                color: Constants.COLOR_MAIN
                anchors.left: tutorialStatusCicle2.right
                anchors.margins: 15
				opacity: 0.5
            }
        }
        Item {
            id: introBox
            width: parent.width
            height: parent.height
            visible: false

            Item {
                id: rectSelectLanguage
                width: parent.width - 20
                anchors.horizontalCenter: parent.horizontalCenter
                height: Constants.HEIGHT_LANGUAGE_COMPONENT
                y: 5

                ComboBox {
                    id: comboBoxLanguage
                    width: indicatorIconLanguage.width + indicatorIconLanguageArrow.width + 15
                    height: Constants.HEIGHT_LANGUAGE_COMPONENT
                    visible: true
                    //the background of the combobox
                    background: Rectangle {
                        border.width: 0
                        border.color: Constants.COLOR_MAIN_SOFT_GRAY
                        color: Constants.COLOR_MAIN_SOFT_GRAY
                        radius: 0
                    }
                    model: LanguageModel {}
                    delegate: LanguageDelegate {}
                    //the arrow on the right in the combobox
                    indicator: Item {

                        width: parent.width
                        height: 40
                        anchors.verticalCenter: parent.verticalCenter
                        id: itemDlgtLanguage
                        Image {
                            id: indicatorIconLanguage
                            antialiasing: true
                            height: 18
                            x: 5
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
                            anchors.leftMargin: 5
                            fillMode: Image.PreserveAspectFit
                            source: "qrc:/images/arrow-down.png"
                        }
                    }
                    //the list of elements and their style when the combobox is open
                    popup: Popup {
                        id: comboPopupLanguage
                        y: comboBoxLanguage.height - 1
                        width: comboBoxLanguage.width
                        height: contentItem.implicitHeigh
                        padding: 1

                        contentItem: ListView {
                            id: listViewLanguage
                            implicitHeight: contentHeight
                            model: comboBoxLanguage.popup.visible ? comboBoxLanguage.delegateModel : null
                            ScrollIndicator.vertical: ScrollIndicator {}
                        }

                        background: Rectangle {
                            radius: 0
                            border.width: 1
                            border.color: Constants.COLOR_MAIN
                        }
                    }
                }
            }

            Item {
                id: rowIntroTitle
                width: parent.width
                height: parent.height * 0.4
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: rectSelectLanguage.bottom

                Image {
                    id: imageIcon
                    antialiasing: true
                    height: 80
                    anchors.bottom: textAppSlogan.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/logo.png"
                }
                Text {
                    id: textAppSlogan
                    text: qsTr("STR_TEXT_SUB_TITLE") + controler.autoTr
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                    color: Constants.COLOR_MAIN_SOFT_GRAY
                }
            }

            Item {
                width: parent.width * 0.5
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: rowIntroTitle.bottom
                anchors.topMargin: 80
                height: Constants.HEIGHT_BOTTOM_COMPONENT
                enabled: true

                Button {
                    id: tutorialButton
                    text: qsTr("STR_TUTORIAL_BUTTON") + controler.autoTr
                    font.capitalization: Font.MixedCase
                    font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                    contentItem: Text {
                        text: tutorialButton.text
                        font: tutorialButton.font
                        color: Constants.COLOR_TEXT_MAIN_WHITE
                        opacity: enabled ? 1.0 : 0.3
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    width: Constants.WIDTH_BUTTON
                    height: Constants.HEIGHT_BOTTOM_COMPONENT
                    anchors.left: parent.left
                    background: Rectangle {
                        color: tutorialButton.enabled ? Constants.COLOR_BUTTONS : Constants.COLOR_BUTTONS_DOWN
                        radius: 10
                    }
                }

                Button {
                    id: startButton
                    text: qsTr("STR_START") + controler.autoTr
                    font.capitalization: Font.MixedCase
                    font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                    contentItem: Text {
                        text: startButton.text
                        font: startButton.font
                        color: Constants.COLOR_TEXT_MAIN_WHITE
                        opacity: enabled ? 1.0 : 0.3
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    width: Constants.WIDTH_BUTTON
                    height: Constants.HEIGHT_BOTTOM_COMPONENT
                    anchors.right: parent.right
                    background: Rectangle {
                        color: startButton.enabled ? Constants.COLOR_BUTTONS : Constants.COLOR_BUTTONS_DOWN
                        radius: 10
                    }
                }
            }

            Item {
                id: rectReminderCheckBox
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                enabled: true
                width: textReminder.width
                height: Constants.HEIGHT_BOTTOM_COMPONENT

                Text {
                    id: textReminder
                    text: qsTranslate("PageHelpDocOnline", "STR_HOME_REMINDER")
                    color: Constants.COLOR_TEXT_MAIN_WHITE
                    y: 6
                }
                CheckBox {
                    id: reminderCheckBox
                    anchors.right: textReminder.left
                    Rectangle {
                        color: Constants.COLOR_TEXT_MAIN_WHITE
                        transformOrigin: Item.Center
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        width: Constants.SIZE_CHECKBOX_COMPONENT
                        height: Constants.SIZE_CHECKBOX_COMPONENT
                    }
                }
            }
        }
        Item {
            id: tutorialFirstPage
            width: parent.width
            height: parent.height - rectTutorialStatus.height

            visible: true

            Image {
                id: imageFirstPage
                antialiasing: true
                y: 30
                height: Constants.HEIGHT_IMG_TUTORIAL
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:/images/tutorial/page1.png"
            }
            Rectangle {
                id: rectStep1
                width: parent.width / 2 - 45
                anchors.top: imageFirstPage.bottom
                x: 30
                Rectangle {
                    id: cicleStep1
                    width: 30
                    height: 30
                    color: Constants.COLOR_MAIN
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "1"
                        font.pixelSize: Constants.SIZE_TEXT_BODY
                        color: Constants.COLOR_MAIN_WHITE
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Text {
                    id: textStep1Title
                    text: qsTr("STR_TUTORIAL_STEP1_TITLE") + controler.autoTr
                    font.pixelSize: Constants.SIZE_TEXT_BODY
                    color: Constants.COLOR_TEXT_TITLE
                    anchors.top: cicleStep1.bottom
                    anchors.margins: 20
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
                Text {
                    anchors.top: textStep1Title.bottom
                    anchors.margins: 20
                    text: qsTr("STR_TUTORIAL_STEP1_TEXT") + controler.autoTr
                    color: Constants.COLOR_MAIN_SOFT_GRAY
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }
            Rectangle {
                id: rectStep2
                width: parent.width / 2 - 45
                anchors.left: rectStep1.right
                anchors.leftMargin: 30
                anchors.top: imageFirstPage.bottom
                Rectangle {
                    id: cicleStep2
                    width: 30
                    height: 30
                    color: Constants.COLOR_MAIN
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "2"
                        font.pixelSize: Constants.SIZE_TEXT_BODY
                        color: Constants.COLOR_MAIN_WHITE
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Text {
                    id: textStep2Title
                    text: qsTr("STR_TUTORIAL_STEP2_TITLE") + controler.autoTr
                    font.pixelSize: Constants.SIZE_TEXT_BODY
                    color: Constants.COLOR_TEXT_TITLE
                    anchors.top: cicleStep2.bottom
                    anchors.margins: 20
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
                Text {
                    anchors.top: textStep2Title.bottom
                    anchors.margins: 20
                    text: qsTr("STR_TUTORIAL_STEP2_TEXT") + controler.autoTr
                    color: Constants.COLOR_MAIN_SOFT_GRAY
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }

            Button {
                id: backFirstPageButton
                x: Constants.BUTTONS_BACK_X_POS
                y: parent.height
                font.capitalization: Font.MixedCase
                width: Constants.ARROW_WIDTH
                height: Constants.ARROW_HEIGHT
                enabled: true
                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: Constants.BUTTON_RADIUS
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

            Button {
                id: firstPageButton
                x: parent.width - Constants.BUTTONS_BACK_X_POS - firstPageButton.width
                y: parent.height
                font.capitalization: Font.MixedCase
                font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                width: Constants.ARROW_WIDTH
                height: Constants.ARROW_HEIGHT
                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: Constants.BUTTON_RADIUS
                    color: Constants.COLOR_BUTTONS
                    Image {
                        antialiasing: true
                        width: parent.width * 0.5
                        height: parent.height * 0.5
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        rotation: 180
                        source: "qrc:/images/arrow-back.png"
                    }
                }
            }
        }
        Item {
            id: tutorialSecondPage
            width: parent.width
            height: parent.height - rectTutorialStatus.height
            visible: false

            Image {
                id: imageSecondPage
                antialiasing: true
                y: 30
                height: Constants.HEIGHT_IMG_TUTORIAL
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:/images/tutorial/page2.png"
            }
            Rectangle {
                id: rectStep3
                width: parent.width / 2 - 45
                anchors.top: imageSecondPage.bottom
                x: 30
                Rectangle {
                    id: cicleStep3
                    width: 30
                    height: 30
                    color: Constants.COLOR_MAIN
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "3"
                        font.pixelSize: Constants.SIZE_TEXT_BODY
                        color: Constants.COLOR_MAIN_WHITE
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Text {
                    id: textStep3Title
                    text: qsTr("STR_TUTORIAL_STEP3_TITLE") + controler.autoTr
                    font.pixelSize: Constants.SIZE_TEXT_BODY
                    color: Constants.COLOR_TEXT_TITLE
                    anchors.top: cicleStep3.bottom
                    anchors.margins: 20
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
                Text {
                    anchors.top: textStep3Title.bottom
                    anchors.margins: 20
                    text: qsTr("STR_TUTORIAL_STEP3_TEXT") + controler.autoTr
                    color: Constants.COLOR_MAIN_SOFT_GRAY
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }
            Rectangle {
                id: rectStep4
                width: parent.width / 2 - 45
                anchors.top: imageSecondPage.bottom
                anchors.left: rectStep3.right
                anchors.leftMargin: 30
                Rectangle {
                    id: cicleStep4
                    width: 30
                    height: 30
                    color: Constants.COLOR_MAIN
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "4"
                        font.pixelSize: Constants.SIZE_TEXT_BODY
                        color: Constants.COLOR_MAIN_WHITE
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Text {
                    id: textStep4Title
                    text: qsTr("STR_TUTORIAL_STEP4_TITLE") + controler.autoTr
                    font.pixelSize: Constants.SIZE_TEXT_BODY
                    color: Constants.COLOR_TEXT_TITLE
                    anchors.top: cicleStep4.bottom
                    anchors.margins: 20
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
                Text {
                    anchors.top: textStep4Title.bottom
                    anchors.margins: 20
                    text: qsTr("STR_TUTORIAL_STEP4_TEXT") + controler.autoTr
                    color: Constants.COLOR_MAIN_SOFT_GRAY
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }

            Button {
                id: backSecondPageButton
                x: Constants.BUTTONS_BACK_X_POS
                y: parent.height
                font.capitalization: Font.MixedCase
                width: Constants.ARROW_WIDTH
                height: Constants.ARROW_HEIGHT
                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: Constants.BUTTON_RADIUS
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
            Button {
                id: secondPageButton
                x: parent.width - Constants.BUTTONS_BACK_X_POS - secondPageButton.width
                y: parent.height
                font.capitalization: Font.MixedCase
                font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                width: Constants.ARROW_WIDTH
                height: Constants.ARROW_HEIGHT
                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: Constants.BUTTON_RADIUS
                    color: Constants.COLOR_BUTTONS
                    Image {
                        antialiasing: true
                        width: parent.width * 0.5
                        height: parent.height * 0.5
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        rotation: 180
                        source: "qrc:/images/arrow-back.png"
                    }
                }
            }
        }
        Item {
            id: tutorialThirdPage
            width: parent.width
            height: parent.height - rectTutorialStatus.height
            visible: false

            Image {
                id: imageThirdPage
                antialiasing: true
                y: 30
                height: Constants.HEIGHT_IMG_TUTORIAL
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:/images/tutorial/page3.png"
            }

            Rectangle {
                id: rectStep5
                width: parent.width / 2 - 45
                anchors.top: imageThirdPage.bottom
                x: 30
                Rectangle {
                    id: cicleStep5
                    width: 30
                    height: 30
                    color: Constants.COLOR_MAIN
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "5"
                        font.pixelSize: Constants.SIZE_TEXT_BODY
                        color: Constants.COLOR_MAIN_WHITE
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Text {
                    id: textStep5Title
                    text: qsTr("STR_TUTORIAL_STEP5_TITLE") + controler.autoTr
                    font.pixelSize: Constants.SIZE_TEXT_BODY
                    color: Constants.COLOR_TEXT_TITLE
                    anchors.top: cicleStep5.bottom
                    anchors.margins: 20
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
                Text {
                    anchors.top: textStep5Title.bottom
                    anchors.margins: 20
                    text: qsTr("STR_TUTORIAL_STEP5_TEXT") + controler.autoTr
                    color: Constants.COLOR_MAIN_SOFT_GRAY
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }
            Rectangle {
                id: rectStep6
                width: parent.width / 2 - 45
                anchors.top: imageThirdPage.bottom
                anchors.left: rectStep5.right
                anchors.leftMargin: 30
                Rectangle {
                    id: cicleStep6
                    width: 30
                    height: 30
                    color: Constants.COLOR_MAIN
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "6"
                        font.pixelSize: Constants.SIZE_TEXT_BODY
                        color: Constants.COLOR_MAIN_WHITE
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Text {
                    id: textStep6Title
                    text: qsTr("STR_TUTORIAL_STEP6_TITLE") + controler.autoTr
                    font.pixelSize: Constants.SIZE_TEXT_BODY
                    color: Constants.COLOR_TEXT_TITLE
                    anchors.top: cicleStep6.bottom
                    anchors.margins: 20
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
                Text {
                    anchors.top: textStep6Title.bottom
                    anchors.margins: 20
                    text: qsTr("STR_TUTORIAL_STEP6_TEXT") + controler.autoTr
                    color: Constants.COLOR_MAIN_SOFT_GRAY
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }

            Button {
                id: backThirdPageButton
                x: Constants.BUTTONS_BACK_X_POS
                y: parent.height
                font.capitalization: Font.MixedCase
                width: Constants.ARROW_WIDTH
                height: Constants.ARROW_HEIGHT
                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: Constants.BUTTON_RADIUS
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
            Button {
                id: thirdPageButton
                x: parent.width - Constants.BUTTONS_BACK_X_POS - thirdPageButton.width
                y: parent.height
                font.capitalization: Font.MixedCase
                font.pixelSize: Constants.SIZE_TEXT_SUB_TITLE
                width: Constants.ARROW_WIDTH
                height: Constants.ARROW_HEIGHT
                background: Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: Constants.BUTTON_RADIUS
                    color: Constants.COLOR_BUTTONS
                    Image {
                        antialiasing: true
                        width: parent.width * 0.5
                        height: parent.height * 0.5
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        rotation: 180
                        source: "qrc:/images/arrow-back.png"
                    }
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

