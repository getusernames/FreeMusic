import QtQuick 2.0
import QtQml 2.12

MouseArea{
    property real xmouse;//鼠标的x轴坐标
    property real ymouse;//鼠标的y轴坐标
    anchors.fill: parent
    z:-1;
    onPressed: {
        xmouse=mouse.x;
        ymouse=mouse.y;
    }
    onPositionChanged: {
        root.x=root.x+(mouse.x-xmouse);
        root.y=root.y+(mouse.y-ymouse);
    }
    onDoubleClicked: {
        root.showMaximized();
    }
}

