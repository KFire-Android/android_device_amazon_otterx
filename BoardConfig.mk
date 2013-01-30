DEVICE_FOLDER := device/amazon/otter

# inherit from common
-include device/amazon/otter-common/BoardConfigCommon.mk

# Use the non-open-source parts, if they're present
-include vendor/amazon/otter/BoardConfigVendor.mk

# Kernel
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := mem=512M console=/dev/null
TARGET_BOOTLOADER_BOARD_NAME := otter
TARGET_OTA_ASSERT_DEVICE := blaze,otter
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/platform/omap/omap_hsmmc.1/by-name/media
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/platform/omap/omap_hsmmc.1/by-name/media

# Kernel Build
TARGET_KERNEL_SOURCE := kernel/amazon/otter-common
TARGET_KERNEL_CONFIG := otter_android_defconfig

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1192230912

# Recovery
TARGET_RECOVERY_INITRC := $(DEVICE_FOLDER)/recovery/init.recovery.rc
TARGET_RECOVERY_PRE_COMMAND := "idme postmode 1;"
BOARD_ALWAYS_INSECURE := true

