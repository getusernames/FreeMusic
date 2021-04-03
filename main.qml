import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtLocation 5.12
Window {
    visible: true
    width: 1280
    height: 820
    id: root
    //变量定义
    property alias icoMoonFont: icomoonFont.name
    property alias maxBtn: maxButton

    property real dpScale:  1.5
    readonly property real dp: Math.max(Screen.pixelDensity * 25.4 / 160 * dpScale, 1)
    //无边框设置，可以自定义标题栏
    flags:Qt.FramelessWindowHint | Qt.Window;
    //标题栏
    Rectangle{
        id:titleBar
        width: parent.width
        height: parent.height/12
        color: "#e91111"
        anchors.top: parent.top
        Rectangle{
            id:logoRect
            height: parent.height
            width: 200
            color: "#e91111"
            anchors.top:parent.top
            anchors.left: parent.left
            Image {
                id: logPng
                source: "src/image/logo1.png"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                id: softName
                text: qsTr("自由云音乐")
                font.family: "Microsoft YaHei";
                font.pixelSize: 18;
                color: "#ffffff"
                anchors.left: logPng.right
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        SearchRectByself{
            anchors.left: logoRect.right

        }

        CloseBttonByself{
            id:closeButton
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10*dp
        }
        MaxButtonByself{
            id:maxButton
            property bool isNormalSize: true
            anchors.right: closeButton.left
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                if(isNormalSize){
                    root.showMaximized();
                    isNormalSize=false;
                }
                else{
                    root.showNormal();
                    isNormalSize=true;
                }
            }
        }
        MinButtonByself{
            anchors.right: maxButton.left
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                root.showMinimized();
            }
        }
    }

    //左侧导航栏
    Rectangle{
        id:navigationBar
        width: parent.width/5
        color: "#e6e6e6"
        anchors.top: titleBar.bottom
        anchors.left: parent.left
        anchors.bottom: statusBar.top

        ListModel{
            id:narBarModel
            ListElement{
                symbol:"\uf002"
                item:qsTr("搜索")
                group:qsTr("推荐")
            }
            ListElement{
                symbol:"\uf001"
                item:qsTr("发现音乐")
                group:qsTr("推荐")
            }
            ListElement{
                symbol:"\uf26c"
                item:qsTr("MV")
                group:qsTr("推荐")
            }
            ListElement{
                symbol:"\uf0c0"
                item:qsTr("朋友")
                group:qsTr("推荐")
            }
            ListElement{
                symbol:"\uf10c"
                item:qsTr("本地音乐")
                group:qsTr("我的音乐")
            }
            ListElement{
                symbol:"\uf019"
                item:qsTr("下载管理")
                group:qsTr("我的音乐")
            }
            ListElement{
                symbol:"\uf0c2"
                item:qsTr("我的音乐云盘")
                group:qsTr("我的音乐")
            }
            ListElement{
                symbol:"\uf2ce"
                item:qsTr("我的电台")
                group:qsTr("我的音乐")
            }
            ListElement{
                symbol:"\uf0fe"
                item:qsTr("我的收藏")
                group:qsTr("我的音乐")
            }
            ListElement{
                symbol:"\uf08a"
                item:qsTr("我喜欢的音乐")
                group:qsTr("创建的歌单")
            }
            ListElement{
                symbol:"\uf0ca"
                item:qsTr("热门50单曲")
                group:qsTr("创建的歌单")
            }
            ListElement{
                symbol:"\uf0ca"
                item:qsTr("带上耳机 享受重低音")
                group:qsTr("收藏的歌单")
            }
            ListElement{
                symbol:"\uf0ca"
                item:qsTr("带上耳机 享受重低音")
                group:qsTr("收藏的歌单")
            }
        }
        Component{
            id:narBarDelegate
            Rectangle{
                width: parent.width
                height: 30*dp
                color: "#f3f3f5"
                Text {
                    font.bold: true
                    text:section
                    color: "#a6aaaa"
                    font.pixelSize: 14*dp
                    anchors.left: parent.left
                    anchors.leftMargin: 5*dp
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        ButtonGroup{
            id:narBarBtngroup
        }

        ListView{
            anchors.fill: parent
            model: narBarModel
            delegate: ListElementByself{
                symbolText:symbol
                itemText:item
            }
            section.property: "group"
            section.criteria: ViewSection.FullString
            section.delegate: narBarDelegate
        }
    }
    //底部状态栏
    Rectangle{
        id:statusBar
        width: parent.width
        anchors.bottom: parent.bottom
        height: 54*dp
        color: "#ffffff"
        //边框线
        Rectangle{
            id:border__
            color: "#f3f3f5"
            width: parent.width
            height: 0.5*dp
            anchors.top: parent.top
        }

        Rectangle{
            id: musicInfoImage
            color: "#123456"
            anchors{
                top:border__.bottom
                topMargin: 1*dp
                left: parent.left
                //leftMargin: 1*dp
                bottom: parent.bottom
                //bottomMargin: 1*dp
            }
            width: height
        }
        MusicRoundButton{
            id:stepBackward
            anchors{
                left: musicInfoImage.right
                leftMargin: 20*dp
                verticalCenter: parent.verticalCenter
            }
            width: 35*dp
            text:"\uf048"
        }
        MusicRoundButton{
            id:playBtn
            anchors{
                left: stepBackward.right
                leftMargin: 10*dp
                verticalCenter: parent.verticalCenter
            }
            width: 40*dp
            text:"\uf04b"
            secondText:"\uf04c"
        }
        MusicRoundButton{
            id:stepForward
            anchors{
                left: playBtn.right
                leftMargin: 10*dp
                verticalCenter: parent.verticalCenter
            }
            width: 35*dp
            text:"\uf051"
        }


        PlaySlider{
            anchors{
                left: stepForward.right
                leftMargin: 10*dp
                right: collectBtn.left
                rightMargin: 10*dp
                top:parent.top
                topMargin: 1*dp
                bottom: parent.bottom
                bottomMargin: 1*dp
            }
        }


        //收藏
        MusicControlBtn{
            id:collectBtn
            property bool isLove: false;
            anchors{
                right: playModeBtn.left
                leftMargin: 10*dp
                top:parent.top
                topMargin: 5*dp
                bottom:parent.bottom
                bottomMargin: 5*dp
            }
            width: height
            text:"\uf004"
            fontfamily:icomoonFont.name
            color: isLove?"#DC2F2E":"#999999"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    collectBtn.isLove = !collectBtn.isLove;
                }
            }
        }


        //播放模式
        MusicControlBtn{
            id:playModeBtn
            property int playMode:0;
            anchors{
                right: volumeBtn.left
                leftMargin: 10*dp
                top:parent.top
                topMargin: 5*dp
                bottom:parent.bottom
                bottomMargin: 5*dp
            }
            width: height
            text:playMode==0?"\uf021":(playMode==1?"\uf074":"\uf03a")
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    playModeBtn.playMode = (playModeBtn.playMode+1)%3;
                }
            }
        }

        //音量
        MusicControlBtn{
            id:volumeBtn
            property int volumeValue:80;
            property string volumeoff:"\uf026";
            property string volumedown:"\uf027";
            property string volumeup:"\uf028";
            anchors{
                right: currentListBtn.left
                leftMargin: 10*dp
                top:parent.top
                topMargin: 5*dp
                bottom:parent.bottom
                bottomMargin: 5*dp
            }
            width: height
            text: ((volumeBtn.volumeValue == 0) ?volumeoff:(volumeBtn.volumeValue<50?volumedown:volumeup))
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    volumeControlPopup.open();
                }
            }
            onActiveFocusChanged: {
                if(activeFocus|| volumeControlPopup.activeFocus)
                    volumeControlPopup.open();
                else
                    volumeControlPopup.close();
            }
        }

        //当前列表
        MusicControlBtn{
            id:currentListBtn
            anchors{
                right: parent.right
                rightMargin: 40*dp
                top:parent.top
                topMargin: 5*dp
                bottom:parent.bottom
                bottomMargin: 5*dp
            }
            width: height
            text:"\uf03c"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    console.log("1")
                }
            }
        }

        Popup{
            y:(border__.y-height-5*dp)
            x:(volumeBtn.x+volumeBtn.width/2 - width/9*3)
            id:volumeControlPopup;
            width: 150*dp
            height: 40*dp
            background: Loader{
                source: "VolumeControlDlg.qml";
            }
        }

    }
    //内容框
    Rectangle{
        id:contentBar
        anchors.top: titleBar.bottom
        anchors.left: navigationBar.right
        width: parent.width-navigationBar.width
        height: parent.height-titleBar.height-statusBar.height
        LocalContentByself{
            anchors.fill: parent
        }
    }

    FontLoader{
        id:icomoonFont;
        source: "Font/fonts/FontAwesome.otf"
    }
    MoveWindowByself{
        id:moveWindow
    }
    ResizeWindowByself{
        //上
        id:resizeWindowTop
        type:1
        width: root.width
        anchors.top: parent.top
    }
    ResizeWindowByself{
        //下
        id:resizeWindowBottom
        type:2
        width: root.width
        anchors.bottom: parent.bottom
    }
    ResizeWindowByself{
        //左
        id:resizeWindowLeft
        type:3
        height: root.height
        anchors.left: parent.left
    }
    ResizeWindowByself{
        //右
        id:resizeWindowRight
        type:4
        height: root.height
        anchors.right: parent.right
    }
}
