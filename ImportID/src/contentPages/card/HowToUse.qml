import QtQuick 2.6
import QtQuick.Controls 2.1
import "../../scripts/Constants.js" as Constants

//Import C++ defined enums
import eidguiV2 1.0

HowToUseForm {
    propertyBackHowToUseButton {
        onClicked: {
            mainFormID.propertyPageLoader.source = "App.qml"
        }
    }
    Component.onCompleted: {
    }
}
