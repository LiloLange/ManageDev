
#CONFIG *= tct_cloud_enabled
#CONFIG *= tct_desktop
CONFIG *= tct_mobile_ios

QMAKE_IOS_DEPLOYMENT_TARGET = 12.0
QMAKE_APPLE_TARGETED_DEVICE_FAMILY = 2 #1-iPhone, 2-iPad, 1,2-Universal

DEFINES += SPI_PRODUCT_ID=\\\"202\\\" # Bodyfitter2-FR

DEFINES += TCT_LICENSE_REQUIRED
