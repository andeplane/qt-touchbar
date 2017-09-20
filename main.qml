import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4 as QQC1
import QtQuick.Layouts 1.3
import TouchBar 1.0

QQC1.ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    TouchBar {
        id: controller
        TouchBarButton {
            title: "MyButton 1"
            onPressed: console.log("Did press this button")
        }
        TouchBarButton {
            title: "MyButton 2"
            onPressed: console.log("Did press this other button")
        }
    }
}
