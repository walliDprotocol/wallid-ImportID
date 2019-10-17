import QtQuick 2.6

/* Constants imports */
import "scripts/Constants.js" as Constants
import "components" as Components

Rectangle {
    anchors.fill: parent

    property alias propertyMainView: mainView

    property alias propertyContentPagesView: contentPagesView

    property alias propertyPageLoader: pageLoaderID
    width: Constants.SCREEN_MINIMUM_WIDTH
    height: Constants.SCREEN_MINIMUM_HEIGHT

    border.width: Constants.APP_BORDER
    border.color: Constants.COLOR_TOP_BAR

    /* Title bar */

    /* Main View */
    Item {
        id: mainView
        width: parent.width - 2 * Constants.APP_BORDER
        height: 570
        x: Constants.APP_BORDER
        y: 2

        /* Content Pages View */
        Item {
            id: contentPagesView
            anchors.fill: parent
            z: 1
            Item {
                anchors.fill: parent
                PageLoader {
                    id: pageLoaderID
                    anchors.fill: parent
                    propertyGeneralPopUp.visible: false
                }
            }
        }
    }
}
