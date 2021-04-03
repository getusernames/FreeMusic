import QtQuick 2.0
import QtQuick.Controls 2.5

Button{
    id:closeBtn;
    property color closeBtnClickColor: "#e6e6e6"
    property color closeBtnHoveredColor: "#646464"
    property color closeBtnNormalColor: "#e91111"
    width: 30*dp
    height: 30*dp
    anchors{
        right: parent.right;
    }
    flat: true;
    font{
        family: icoMoonFont;
        pixelSize: titleBar.height/3;
    }
    text: "\uf2d3";
    background: Rectangle{
        implicitWidth: titleBar.height;
        implicitHeight: titleBar.height;
        color: {
            if(closeBtn.pressed && closeBtn.hovered)
                return closeBtnClickColor;
            if(closeBtn.hovered)
                return closeBtnHoveredColor;
            else
                return closeBtnNormalColor;
        }
    }
    contentItem: Label{
        text: closeBtn.text;
        font: closeBtn.font;
        color: "#ffffff"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    ToolTip.visible: closeBtn.hovered;
    ToolTip.delay: 500;
    ToolTip.text: qsTr("关闭");

    onClicked: Qt.quit();
}
