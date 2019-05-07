QT += quick qml
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

RESOURCES += qml/qml.qrc \
    javascript/javascripts.qrc

CONFIG(debug, debug|release){
    DESTDIR = $$PWD/output/debug
    CONFIG += console
}

CONFIG(release, debug|release){
    DESTDIR = $$PWD/output/release
}


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$[QT_INSTALL_QML]

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

qmls =  $$PWD/qml/main.qml
js = $$PWD/javascript/cxlmath.js \
     $$PWD/javascript/sphere.js \
     $$PWD/javascript/traceray.js

#update qml
qml_scenes.depends = $$qmls
qml_scenes.commands =

js_scenes.depends = $$js
js_scenes.commands =

QMAKE_EXTRA_TARGETS += qml_scenes js_scenes

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
