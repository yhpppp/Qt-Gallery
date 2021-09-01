import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

ScrollablePage {
    id: page

    Column {
        spacing: 40
        width: parent.width

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "按钮组件"
        }

        ColumnLayout {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                text: "按钮-1"
                Layout.fillWidth: true
            }
            Button {
                text: "按钮-2(高亮)"
                Layout.fillWidth: true
                highlighted: true
            }
            Button {
                text: "按钮-3(禁用)"
                enabled: false
                Layout.fillWidth: true
            }
        }
    }
}
