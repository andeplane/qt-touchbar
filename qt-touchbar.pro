TEMPLATE = app
TARGET = qt-and-touchbar
INCLUDEPATH += .
QT += quick
CONFIG += c++11

# Input
OBJECTIVE_SOURCES += \
    main.mm \
    touchbar.mm \
    touchbarbutton.mm

HEADERS += \
    touchbar.h \
    touchbarbutton.h

LIBS += -framework AppKit
RESOURCES += qml.qrc
