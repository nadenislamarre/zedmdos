################################################################################
#
# zedmdos-system
#
################################################################################

ZEDMDOS_SYSTEM_VERSION = 1.0-dev
ZEDMDOS_SYSTEM_LICENSE = GPL
ZEDMDOS_SYSTEM_SOURCE=

define ZEDMDOS_SYSTEM_INSTALL_CONFIG
	mkdir -p $(TARGET_DIR)/etc/init.d
	cp $(BR2_EXTERNAL_ZEDMDOS_PATH)/package/zedmdos/zedmdos-system/zedmdos.ini.sample               $(BINARIES_DIR)/zedmdos.ini.sample
	install -m 0755 $(BR2_EXTERNAL_ZEDMDOS_PATH)/package/zedmdos/zedmdos-system/inittab             $(TARGET_DIR)/etc/inittab
	install -m 0755 $(BR2_EXTERNAL_ZEDMDOS_PATH)/package/zedmdos/zedmdos-system/init.service        $(TARGET_DIR)/etc/init.d/S03init
	install -m 0755 $(BR2_EXTERNAL_ZEDMDOS_PATH)/package/zedmdos/zedmdos-system/default-dmd.service $(TARGET_DIR)/etc/init.d/S60default-dmd
	install -m 0755 $(BR2_EXTERNAL_ZEDMDOS_PATH)/package/zedmdos/zedmdos-system/connman.service     $(TARGET_DIR)/etc/init.d/S45connman # replace the default one
	mkdir -p $(TARGET_DIR)/etc/connman
	install -m 0755 $(BR2_EXTERNAL_ZEDMDOS_PATH)/package/zedmdos/zedmdos-system/connman-main.conf   $(TARGET_DIR)/etc/connman/main.conf
	echo $(ZEDMDOS_SYSTEM_VERSION) > ${TARGET_DIR}/etc/zedmdos.version
endef

ZEDMDOS_SYSTEM_POST_INSTALL_TARGET_HOOKS += ZEDMDOS_SYSTEM_INSTALL_CONFIG

$(eval $(generic-package))
