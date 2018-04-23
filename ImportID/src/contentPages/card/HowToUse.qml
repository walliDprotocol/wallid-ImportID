import QtQuick 2.6
import QtQuick.Controls 2.1

HowToUseForm {
    propertyBackHowToUseButton {
        onClicked: {
            mainFormID.propertyPageLoader.source = "App.qml"
        }
    }
    propertyFaqBoxL1{
        onVisibleChanged: {
            if(propertyFaqBoxL1.visible)
                resetAllFaqBox("L1")
        }
    }
    propertyFaqBoxL2{
        onVisibleChanged: {
            if(propertyFaqBoxL2.visible)
                resetAllFaqBox("L2")
        }
    }
    propertyFaqBoxL3{
        onVisibleChanged: {
            if(propertyFaqBoxL3.visible)
                resetAllFaqBox("L3")
        }
    }
    propertyFaqBoxL4{
        onVisibleChanged: {
            if(propertyFaqBoxL4.visible)
                resetAllFaqBox("L4")
        }
    }
    propertyFaqBoxL5{
        onVisibleChanged: {
            if(propertyFaqBoxL5.visible)
                resetAllFaqBox("L5")
        }
    }
    propertyFaqBoxL6{
        onVisibleChanged: {
            if(propertyFaqBoxL6.visible)
                resetAllFaqBox("L6")
        }
    }
    propertyFaqBoxL7{
        onVisibleChanged: {
            if(propertyFaqBoxL7.visible)
                resetAllFaqBox("L7")
        }
    }
    propertyFaqBoxL8{
        onVisibleChanged: {
            if(propertyFaqBoxL8.visible)
                resetAllFaqBox("L8")
        }
    }
    propertyFaqBoxR1{
        onVisibleChanged: {
            if(propertyFaqBoxR1.visible)
                resetAllFaqBox("R1")
        }
    }
    propertyFaqBoxR2{
        onVisibleChanged: {
            if(propertyFaqBoxR2.visible)
                resetAllFaqBox("R2")
        }
    }
    propertyFaqBoxR3{
        onVisibleChanged: {
            if(propertyFaqBoxR3.visible)
                resetAllFaqBox("R3")
        }
    }
    propertyFaqBoxR4{
        onVisibleChanged: {
            if(propertyFaqBoxR4.visible)
                resetAllFaqBox("R4")
        }
    }
    propertyFaqBoxR5{
        onVisibleChanged: {
            if(propertyFaqBoxR5.visible)
                resetAllFaqBox("R5")
        }
    }
    propertyFaqBoxR6{
        onVisibleChanged: {
            if(propertyFaqBoxR6.visible)
                resetAllFaqBox("R6")
        }
    }
    propertyFaqBoxR7{
        onVisibleChanged: {
            if(propertyFaqBoxR7.visible)
                resetAllFaqBox("R7")
        }
    }
    propertyFaqBoxR8{
        onVisibleChanged: {
            if(propertyFaqBoxR8.visible)
                resetAllFaqBox("R8")
        }
    }

    function resetAllFaqBox(index){
        if(index !== "L1")
            propertyFaqBoxL1.visible = false
        if(index !== "L2")
            propertyFaqBoxL2.visible = false
        if(index !== "L3")
            propertyFaqBoxL3.visible = false
        if(index !== "L4")
            propertyFaqBoxL4.visible = false
        if(index !== "L5")
            propertyFaqBoxL5.visible = false
        if(index !== "L6")
            propertyFaqBoxL6.visible = false
        if(index !== "L7")
            propertyFaqBoxL7.visible = false
        if(index !== "L8")
            propertyFaqBoxL8.visible = false
        if(index !== "R1")
            propertyFaqBoxR1.visible = false
        if(index !== "R2")
            propertyFaqBoxR2.visible = false
        if(index !== "R3")
            propertyFaqBoxR3.visible = false
        if(index !== "R4")
            propertyFaqBoxR4.visible = false
        if(index !== "R5")
            propertyFaqBoxR5.visible = false
        if(index !== "R6")
            propertyFaqBoxR6.visible = false
        if(index !== "R7")
            propertyFaqBoxR7.visible = false
        if(index !== "R8")
            propertyFaqBoxR8.visible = false
    }
}
