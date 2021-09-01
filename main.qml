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
                action: navigateBackAction
            }
            // 标题
            Label {
                id:titleLabel
                text: listView.currentItem ? listView.currentItem.text : "介绍"
//                text:  "介绍"
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
        width: Math.min(root.width,root.height) / 3 * 2
        height: root.height
        interactive: stackView.depth === 1
        // 左侧导航
        ListView {
            id: listView
            focus:true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: listView.width
                text:model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
                    drawer.close()
                }
            }

            model: ListModel {
                ListElement {
                    title: "按钮:Button";
                    source: "pages/ButtonPage.qml"
                }
                ListElement {
                    title: "复选框:CheckBox"
                    source: "pages/CheckBoxPage.qml"
                }
            }
        }
    }

    // 链接一组触发相同事件的抽象操作输入
    Action {
        id:navigateBackAction
        icon.name: stackView.depth > 1 ? "back" : "drawer"
        onTriggered: {
            console.log("stackView.depth", stackView.depth)
            if(stackView.depth > 1) {
                stackView.pop()
                listView.currentIndex = -1
            } else {
                drawer.open()
            }
        }
    }


}
