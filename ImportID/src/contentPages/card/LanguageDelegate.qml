import QtQuick 2.6
import QtQuick.Controls 2.1

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
            width: Constants.HEIGHT_LANGUAGE_COMPONENT
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: icon
        }
    }
    onPressed: {
        console.log(index)
    }
}
