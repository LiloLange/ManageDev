
message(Bodyfitter2 Firmness Recommendation [FR] project)

TEMPLATE    = subdirs

SUBDIRS     = \
            core \
            plugin_updater \
            plugin_dataport

core.depends = plugin_updater plugin_dataport
