message("core.pri is loaded.")

!include( $$PWD/share/qtpromise-0.6.0/qtpromise.pri) {
    error( "Core: Coudn't find the QtPromise.pri file!" )
}

!include( $$PWD/share/openssl/openssl.pri) {
    error( "Core: Coudn't find the OpenSSL.pri file!" )
}

TEMPLATE = app

QT += core websockets webchannel network sql widgets
#QT += printsupport

message(Core pwd: $$PWD)

INCLUDEPATH += \
               $$PWD/core/ \
               $$PWD/share/

DEPENDPATH += \
              $$PWD/core/ \
              $$PWD/share/

QT              += webview bluetooth
QT              -= webenginewidgets


SOURCES         = \
                $$PWD/core/db_local_core.cpp \
                $$PWD/core/main.cpp \
                $$PWD/core/tactilus_mobile.cpp \
                $$PWD/core/websocketclientwrapper.cpp \
                $$PWD/core/websockettransport.cpp \
                $$PWD/core/guiproxy.cpp \
                $$PWD/core/guiproxy_interface.cpp \
                $$PWD/core/activation_helper.cpp \
                $$PWD/core/db_activation.cpp

HEADERS         = \
                $$PWD/core/db_local_core.h \
                $$PWD/core/tactilus_mobile.h \
                $$PWD/core/websocketclientwrapper.h \
                $$PWD/core/websockettransport.h \
                $$PWD/core/guiproxy.h \
                $$PWD/core/guiproxy_interface.h \
                $$PWD/share/plugin_interfaces.h \
                $$PWD/share/hub_base.h \
                $$PWD/share/db_base.h \
                $$PWD/core/activation_helper.h \
                $$PWD/core/db_activation.h


OBJECTIVE_HEADERS   = \
                    $$PWD/share/ios_helper.h \
                    $$PWD/core/wkMainView.h \
                    $$PWD/core/backButtonInPDF.h

OBJECTIVE_SOURCES   = \
                    $$PWD/share/ios_helper.mm \
                    $$PWD/core/APNSApplicationDelegate.mm \
                    $$PWD/core/wkMainView.mm \
                    $$PWD/core/backButtonInPDF.mm


QMAKE_INFO_PLIST    = $$PWD/resources/fr.plist
QMAKE_ASSET_CATALOGS += $$PWD/resources/fr.xcassets

app_launch_images.files = $$PWD/resources/fr.xib
QMAKE_BUNDLE_DATA += app_launch_images

QMAKE_TARGET_BUNDLE_PREFIX  = com.sensorproducts

EVERYTHING =  $$SOURCES $$HEADERS
message(Core: $$EVERYTHING)


RESOURCES       = $$PWD/resources/fr_res.qrc
TARGET          = fr

QMAKE_PROJECT_NAME = core


CONFIG(debug, release|debug) {
    LIBS += -L$$OUT_PWD/../plugins/

    contains(DEFINES, TCT_PLUGIN_DATAPORT) {
        LIBS += -lhubpluginDataPort_debug
#        LIBS += -L$$OUT_PWD/../plugins/ -lhubpluginSimulator_debug
    }
    contains(DEFINES, TCT_PLUGIN_UPDATER) {
        LIBS += -lpluginUpdater_debug
    }
    contains(DEFINES, TCT_PLUGIN_CONSOLE) {
        LIBS += -lpluginConsole_debug
    }
    contains(DEFINES, TCT_PLUGIN_SLEEPACE) {
        LIBS += -lhubPluginSleepace_debug
        QMAKE_LFLAGS += -force_load $$PWD/../plugin_sleepace/BluetoothManager.framework/BluetoothManager
        QMAKE_LFLAGS += -force_load $$PWD/../plugin_sleepace/Reston.framework/Reston
    }
    contains(DEFINES, TCT_PLUGIN_AHBPUMP) {
        LIBS += -lhubPluginAhbpump_debug
    }

    LIBS += -F$$PWD/share/ -framework openssl
    QMAKE_LFLAGS += -force_load $$PWD/share/openssl.framework/openssl

}
CONFIG(release, release|debug) {
    LIBS += -L$$OUT_PWD/../plugins/
    contains(DEFINES, TCT_PLUGIN_DATAPORT) {
        LIBS += -lhubpluginDataPort
#        LIBS += -lhubpluginSimulator
    }
    contains(DEFINES, TCT_PLUGIN_UPDATER) {
        LIBS += -lpluginUpdater
    }
    contains(DEFINES, TCT_PLUGIN_CONSOLE) {
        LIBS += -lpluginConsole
    }
    contains(DEFINES, TCT_PLUGIN_SLEEPACE) {
        LIBS += -lhubPluginSleepace
        QMAKE_LFLAGS += -force_load $$PWD/../plugin_sleepace/BluetoothManager.framework/BluetoothManager
        QMAKE_LFLAGS += -force_load $$PWD/../plugin_sleepace/Reston.framework/Reston
    }
    contains(DEFINES, TCT_PLUGIN_AHBPUMP) {
        LIBS += -lhubPluginAhbpump
    }

    LIBS += -F$$PWD/share/ -framework openssl
    QMAKE_LFLAGS += -force_load $$PWD/share/openssl.framework/openssl
}

message(Core libs: $$LIBS)

DESTDIR    = ../


