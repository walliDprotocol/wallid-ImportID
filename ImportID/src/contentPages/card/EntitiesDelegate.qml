import QtQuick 2.6
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0

import "../../scripts/Constants.js" as Constants

ItemDelegate {
    id: itemDlgt
    width: parent.width;
    height: 40
    contentItem: Rectangle{
        width: parent.width
        height: parent.height
        color: "transparent"
        Image {
            id: imageEntity
            antialiasing: true
            width: Constants.SIZE_IMAGE_LOGO_CC_WIDTH
            height: Constants.SIZE_IMAGE_LOGO_CC_HEIGHT
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: icon
        }
        Text {
            anchors.left: imageEntity.right
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            text: name + controler.autoTr
        }
    }
    onPressed: {
        console.log(index)
        indicatorIcon.source = propertyListViewTemp.model.get(index).icon
        indicatorText.text = qsTranslate("EntitiesModel", propertyListViewTemp.model.get(index).name)
        propertStartButton.checkable = true
    }
}
