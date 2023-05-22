
exists( $$PWD/plugin_dataport/plugin_dataport.pro ){
	DEFINES += TCT_PLUGIN_DATAPORT
#        message("plugin_dataport.pro file found")
}

exists( $$PWD/plugin_updater/plugin_updater.pro ){
	DEFINES += TCT_PLUGIN_UPDATER
#        message("plugin_updater.pro file found")
}

exists( $$PWD/plugin_console/plugin_console.pro ){
        DEFINES += TCT_PLUGIN_CONSOLE
#        message("plugin_console.pro file found")
}

exists( $$PWD/plugin_ahbpump/plugin_ahbpump.pro ){
	DEFINES += TCT_PLUGIN_AHBPUMP
#        message("plugin_ahbpump.pro file found")
}

exists( $$PWD/plugin_sleepace/plugin_sleepace.pro ){
	DEFINES += TCT_PLUGIN_SLEEPACE
#        message("plugin_sleepace.pro file found")
}

CONFIG(tct_desktop) {
    DEFINES += TCT_DESKTOP
}

CONFIG(tct_mobile_ios) {
    DEFINES += TCT_MOBILE_IOS
}

CONFIG(tct_cloud_enabled) {
    DEFINES += TCT_CLOUD_ENABLED
}

CONFIG(debug, release|debug) {
    DEFINES += TCT_DEBUG
}

CONFIG(release, release|debug) {
    DEFINES += TCT_RELEASE
}

WARNINGS += -Wall

#release: DESTDIR = build/release
#debug:   DESTDIR = build/debug

UI_DIR = uics
MOC_DIR = mocs
OBJECTS_DIR = objs
RCC_DIR = qrcs
