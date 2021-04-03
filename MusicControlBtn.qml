import QtQuick 2.0
import QtQuick.Controls 2.5
Rectangle{
    width: height
    property alias text: musicControlBtnText.text
    property alias fontfamily: musicControlBtnText.font.family;
    property alias color : musicControlBtnText.color
    Label{
        id:musicControlBtnText
        anchors.fill: parent
        font.family: icomoonFont.name
        font.pixelSize: 15*dp;
        verticalAlignment:Label.AlignVCenter;
        horizontalAlignment: Label.AlignHCenter;
        color: "#999999"
    }
}
