import QtQuick 2.0
import QtQuick.Controls 2.5
//搜索
Rectangle{
    id:searchTextEdit

    anchors{
        leftMargin: 20*dp
        top:parent.top
        topMargin: 12*dp
        bottom: parent.bottom
        bottomMargin: 12*dp
    }
    color: "#a82828"
    radius: 20
    width: 300

    TextField{
        id:textEdit
        anchors.fill: parent
        anchors.leftMargin: 7*dp
        anchors.rightMargin: 10*dp
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 14
        placeholderTextColor: "#C77373"
        placeholderText: qsTr("搜索音乐，歌手，歌词，用户");

        background: Rectangle{
                color: "#a82828";
            }

        Keys.enabled: true;
        Keys.onReturnPressed: {
            searchBtn.btnClicked();
        }

        onActiveFocusChanged: {
            if(activeFocus)
            {
                if(text.length===0){
                    searchDlg.open();
                    icon_SearchRect.visible = true;
                    console.log("open")
                }
            }
            else{
                searchDlg.close();
                icon_SearchRect.visible = false;
                console.log("close")
            }
        }

        //            onTextChanged: {
        //                    if(text.length>0){
        //                        searchDlg.close();
        //                        console.log("close")
        //                    }
        //                    else{
        //                        searchDlg.open();
        //                        console.log("open")
        //                    }
        //            }

        Label{
            id:icon_SearchRect
            visible: false
            anchors{
                top:parent.bottom
                left: parent.left
                leftMargin: 12*dp
            }
            height: 12*dp
            width: height
            color: "#ffffff"
            text: "\uf0d8";
            font.family: icomoonFont.name
            font.pixelSize: 16*dp;
        }
    }


    Label{
        font.family: icomoonFont.name
        font.pixelSize: 18;
        verticalAlignment:Label.AlignVCenter;
        horizontalAlignment: Label.AlignHCenter;
        color: "#C77373"
        text:"\uf002"
        anchors.right: searchTextEdit.right
        anchors.left: textEdit.right
        anchors.rightMargin: 15*dp
        anchors.bottom: searchTextEdit.bottom
        anchors.top: searchTextEdit.top

    }

    Popup{
        topMargin: titleBar.height+1*dp;
        id:searchDlg;
        //visible: false;
        width: searchTextEdit.width*1.5;
        height: 300*dp
        background: Loader{
            source: "SearchPromptByself.qml";
        }
        onClosed: textEdit.focus=false;
    }


    Component.onCompleted:{
        searchDlg.close();}

}
