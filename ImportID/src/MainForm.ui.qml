import QtQuick 2.6

/* Constants imports */
import "scripts/Constants.js" as Constants
import "components" as Components

Rectangle {
    anchors.fill: parent

    property alias propertyMainView: mainView

    property alias propertyContentPagesView: contentPagesView

    property alias propertyPageLoader: pageLoaderID

    border.width: Constants.APP_BORDER
    border.color : Constants.COLOR_MAIN

    /* Title bar */
    Components.TitleBar {
        id: titleBar;
        width: parent.width;
        height: Constants.TITLE_BAR_SIZE;
        opacity: 1
    }

    /* Main View */
    Item {
        id: mainView
        width: parent.width - 2 * Constants.APP_BORDER
        height: parent.height - Constants.TITLE_BAR_SIZE - Constants.APP_BORDER
        x: Constants.APP_BORDER
        y: Constants.TITLE_BAR_SIZE

        /* Content Pages View */
        Item {
            id: contentPagesView
            anchors.fill: parent
            z: 1
            Item {
                anchors.fill: parent
                PageLoader{
                    id: pageLoaderID
                    anchors.fill: parent
                    propertyGeneralPopUp.visible: false
                }
            }
        }
    }
}
