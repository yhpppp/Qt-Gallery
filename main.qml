import QtQuick 2.12

import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.0

//Window {
//    width: 640
//    height: 480
//    visible: true
//    title: qsTr("Hello World")
//}
ApplicationWindow {
    id:root
    width: 360
    height: 520
    visible: true
    title: "Controls模块演示"

    header: ToolBar {
        Material.foreground: "white"

        RowLayout {
            spacing: 20
            anchors.fill: parent
            // 工具栏按钮
            ToolButton {
//                action:
            }
            // 标题
            Label {
                id:titleLabel
                text:"介绍"
                font.pixelSize: 20
//                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
//                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
//                action: optionsMenuAction
            }
        }
    }

    //提供基于堆栈的导航模型
    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Pane {
            id: pane

            Image {
                id:logo
                width: pane.width/2
                height: pane.height/2
//                width:pane.availableWidth / 2
//                height:pane.availableHeight / 2
                anchors.centerIn: parent
//                anchors.verticalCenterOffset: -50
                   fillMode: Image.PreserveAspectFit
                source:"images/qt-logo.png"
            }

            Label {
                text:"Qt Quick controls~ "
                anchors.margins: 20
                anchors.top: logo.bottom
                anchors.left: parent.left
                anchors.right: parent.right
//                anchors.bottom:
                horizontalAlignment: Label.AlignHCenter
                wrapMode: Label.Wrap
            }

            Image {
                id: arrow
                source: "images/arrow.png"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
            }

        }
    }

    Drawer {
        id: drawer
        width: Math.min(root.width,window.height) / 3 * 2
    }

    // 左侧导航事件
    Action {
        id:navigateBackAction
        icon.name: stackView.depth > 1 ? "back" : "drawer"

        onTriggered: {
            if(stackView.depth > 1) {
                stackView.pop()
//                listView.currentIndex = -1
            } else {

            }
        }
    }


}
