import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "expandable.liu-xiao-guo"

    width: units.gu(60)
    height: units.gu(85)

    ListModel {
        id: listmodel
        ListElement { name: "image1.jpg" }
        ListElement { name: "image2.jpg" }
        ListElement { name: "image3.jpg" }
        ListElement { name: "image4.jpg" }
        ListElement { name: "image5.jpg" }
        ListElement { name: "image6.jpg" }
        ListElement { name: "image7.jpg" }
        ListElement { name: "image8.jpg" }
        ListElement { name: "image9.jpg" }
        ListElement { name: "image10.jpg" }
        ListElement { name: "image11.jpg" }
    }

    Page {
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("expandable")
        }

        Item {
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                top: pageHeader.bottom
            }

            UbuntuListView {
                id: listview
                anchors.fill: parent
                height: units.gu(24)
                model: listmodel
                delegate: ListItem.Expandable {
                    id: exp
                    expandedHeight: units.gu(15)
                    expanded: listview.currentIndex == index

                    Row {
                        id: top
                        height: collapsedHeight
                        spacing: units.gu(2)
                        Image {
                            height: parent.height
                            width: height
                            source: "images/" + name
                        }

                        Label {
                            text: "This is the text on the right"
                        }
                    }

                    Label {
                        anchors.top: top.bottom
                        anchors.topMargin: units.gu(0.5)
                        text: "This is the detail"
                    }

                    onClicked: {
//                        expanded = true;
                        listview.currentIndex = index
                    }
                }
            }
        }

    }
}

