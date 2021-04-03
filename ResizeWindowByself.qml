import QtQuick 2.0

MouseArea{
    property var clickPos ;
    property int type : 1 ;
    property bool needChange : false;
    property var minWidth : root.minimumWidth
    property var minHeight: root.minimumHeight
    width: 5
    height: 5
    cursorShape: {
        switch(type){
        case 1:
        case 2:
            return Qt.SizeVerCursor;
        case 3:
        case 4:
            return Qt.SizeHorCursor;
        case 5:
        case 8:
            return Qt.SizeFDiagCursor;
        case 6:
        case 7:
            return Qt.SizeBDiagCursor;
        }
    }
    onPressed: {
        needChange=true;
        clickPos=Qt.point(mouse.x,mouse.y);
    }
    onPositionChanged: {
        resizeWindow(Qt.point(mouse.x-clickPos.x,mouse.y-clickPos.y),type);
    }
    onReleased: {
        needChange=false;
    }
    function resizeWindow(spacing,type){
        switch(type){
        case 1:
            //上
            root.setY((root.height-spacing.y)>minHeight?(root.y+spacing.y):root.y);
            root.setHeight((root.height-spacing.y)>minHeight?(root.height-spacing.y):minHeight);
            break;
        case 2:
            //下
            root.setHeight((root.height+spacing.y)>minHeight?(root.height+spacing.y):minHeight);
            break;
        case 3:
            //左
            root.setX((root.width-spacing.x)>minWidth?(root.x+spacing.x):root.x);
            root.setWidth((root.width-spacing.x)>minWidth?(root.width-spacing.x):minWidth);
            break;
        case 4:
            //右
            root.setWidth((root.width+spacing.x)>minWidth?(root.width+spacing.x):minWidth);
            break;
        case 5:
            //左上
            root.setX((root.width-spacing.x)>minWidth?(root.x+spacing.x):root.x);
            root.setY((root.height-spacing.y)>minHeight?(root.y+spacing.y):root.y);
            root.setWidth((root.width-spacing.x)>minWidth?(root.width-spacing.x):minWidth);
            root.setHeight((root.height-spacing.y)>minHeight?(root.height-spacing.y):minHeight);
            break;
        case 6:
            //右上
            root.setY((root.height-spacing.y)>minHeight?(root.y+spacing.y):root.y);
            root.setWidth((root.width+spacing.x)>minWidth?(root.width+spacing.x):minWidth);
            root.setHeight((root.height-spacing.y)>minHeight?(root.height-spacing.y):minHeight);
            break;
        case 7:
            //左下
            root.setX((root.width-spacing.x)>minWidth?(root.x+spacing.x):root.x);
            root.setWidth((root.width-spacing.x)>minWidth?(root.width-spacing.x):minWidth);
            root.setHeight((root.height+spacing.y)>minHeight?(root.height+spacing.y):minHeight);
            break;
        case 8:
            //右下
            root.setWidth((root.width+spacing.x)>minWidth?(root.width+spacing.x):minWidth);
            root.setHeight((root.height+spacing.y)>minHeight?(root.height+spacing.y):minHeight);
            break;
        }
    }
}
