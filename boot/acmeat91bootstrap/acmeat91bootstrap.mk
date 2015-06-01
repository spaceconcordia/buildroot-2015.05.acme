ACMEAT91BOOTSTRAP_VERSION = acme
ACMEAT91BOOTSTRAP_SITE = $(call github,tanzilli,at91bootstrap,$(ACMEAT91BOOTSTRAP_VERSION))

ACMEAT91BOOTSTRAP_BINARY = $(ACMEAT91BOOTSTRAP_MAKE_SUBDIR)/binaries/at91bootstrap.bin

ACMEAT91BOOTSTRAP_INSTALL_STAGING = YES
ACMEAT91BOOTSTRAP_INSTALL_TARGET = NO
ACMEAT91BOOTSTRAP_INSTALL_IMAGES = YES

define ACMEAT91BOOTSTRAP_BUILD_CMDS
  $(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) arietta-128m_defconfig
  $(MAKE1) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)
endef

define ACMEAT91BOOTSTRAP_INSTALL_IMAGES_CMDS
        cp $(@D)/$(ACMEAT91BOOTSTRAP_BINARY) $(BINARIES_DIR)/boot.bin
endef

$(eval $(generic-package))
