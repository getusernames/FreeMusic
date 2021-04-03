import QtQuick 2.0
import QtQuick.Controls 2.5

Button{

    property color minBtnClickColor: "#e6e6e6"
    property color minBtnHoveredColor: "#646464"
    property color minBtnNormalColor: "#e91111"
    id:minBtn
    width: 30*dp
    height: 30*dp
    flat: true;
    font{
        family: icoMoonFont;
        pixelSize: titleBar.height/3;
    }
    text: "\uf2d1";
    background: Rectangle{
        implicitWidth: titleBar.height;
        implicitHeight: titleBar.height;
        color: {
            if(minBtn.pressed && minBtn.hovered)
                return minBtnClickColor;
            if(minBtn.hovered)
                return minBtnHoveredColor;
            else
                return minBtnNormalColor;
        }
    }
    contentItem: Label{
        text: minBtn.text;
        font: minBtn.font;
        color: "#ffffff"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    ToolTip.visible: minBtn.hovered;
    ToolTip.delay: 500;
    ToolTip.text: qsTr("最小化");
}
