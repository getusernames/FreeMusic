import QtQuick 2.0
import QtQuick.Controls 2.5

Button{

    property color maxBtnClickColor: "#e6e6e6"
    property color maxBtnHoveredColor: "#646464"
    property color maxBtnNormalColor: "#e91111"
    id:maxBtn
    width: 30*dp
    height: 30*dp
    flat: true;
    font{
        family: icoMoonFont;
        pixelSize: titleBar.height/3;
    }
    text: "\uf2d0";
    background: Rectangle{
        implicitWidth: titleBar.height;
        implicitHeight: titleBar.height;
        color: {
            if(maxBtn.pressed && maxBtn.hovered)
                return maxBtnClickColor;
            if(maxBtn.hovered)
                return maxBtnHoveredColor;
            else
                return maxBtnNormalColor;
        }
    }
    contentItem: Label{
        text: maxBtn.text;
        font: maxBtn.font;
        color: "#ffffff"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    ToolTip.visible: maxBtn.hovered;
    ToolTip.delay: 500;
    ToolTip.text: qsTr("最大化");
}
