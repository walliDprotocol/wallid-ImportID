import QtQuick 2.6
import QtQuick.Controls 2.1

FAQBoxForm {
    propertyTitleMouseArea {
        onClicked: {
            propertyTextAnswer.visible = !propertyTextAnswer.visible
        }
    }
    propertyTextAnswer {
        onLinkActivated: {
            Qt.openUrlExternally(link)
        }
    }
}
