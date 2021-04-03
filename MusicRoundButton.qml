﻿import QtQuick 2.0

Rectangle{
    id:button
    width: 70*dp
    height:width
    signal clicked()
    property alias text:btn_label.text;
    property string secondText: "";
    property color btnColor: "#DC2F2E";

    color: btnColor
    radius:width/2
    border.width: 2
    border.color: "#ffffff"

    Text {
        id: btn_label
        font.pointSize: 10
        font.family: icomoonFont.name
        width: parent.width
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        anchors.centerIn: button
        color: "#ffffff"
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            if(secondText != ""){
                var tempstr = text;
                text = secondText;
                secondText = tempstr;
            }
            button.clicked();
        }
    }

}
