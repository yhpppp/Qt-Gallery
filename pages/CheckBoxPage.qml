import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
ScrollablePage {
    id: page

    Column {
//        width: parent.width
        spacing: 40
        Label {
            width: parent.width
            text: "复选框组件"
            horizontalAlignment: Qt.AlignHCenter
        }

        ColumnLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            CheckBox {
                text: "啤酒"
            }
            CheckBox {
                text: "可乐(选中)"
                checked: true
            }
            CheckBox {
                text: "白开水(禁用)"
                enabled: false
            }
        }

    }


}
