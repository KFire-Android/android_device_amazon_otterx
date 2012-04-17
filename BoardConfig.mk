#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
BOARD_USES_GENERIC_AUDIO := false
USE_CAMERA_STUB := true
BOARD_HAVE_FAKE_GPS := true
BOARD_HAVE_BLUETOOTH := false

# Use the non-open-source parts, if they're present
-include vendor/amazon/otter/BoardConfigVendor.mk


# Processor
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := mem=512M console=ttyO2,115200n8 vram=24M omapfb.vram=0:8M def_disp=lcd2
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := omap4
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := otter
TARGET_BOARD_INFO_FILE := device/amazon/otter/board-info.txt
TARGET_PREBUILT_KERNEL := device/amazon/otter/kernel
TARGET_PROVIDES_INIT_RC := true
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/platform/omap/omap_hsmmc.1/by-name/media
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/platform/omap/omap_hsmmc.1/by-name/media

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1192230912
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_VOLD_MAX_PARTITIONS := 32
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_WLAN_DEVICE                := wl12xx_mac80211
BOARD_SOFTAP_DEVICE              := wl12xx_mac80211
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wl12xx_sdio.ko"
WIFI_DRIVER_MODULE_NAME          := "wl12xx_sdio"
WIFI_FIRMWARE_LOADER             := ""
COMMON_GLOBAL_CFLAGS += -DUSES_TI_MAC80211

# Graphics
BOARD_EGL_CFG := device/amazon/otter/prebuilt/etc/egl.cfg
USE_OPENGL_RENDERER := true

# OMAP
OMAP_ENHANCEMENT := true
ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4
endif

# OTA Packaging
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/amazon/otter/releasetools/otter_ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := device/amazon/otter/releasetools/otter_img_from_target_files
TARGET_CUSTOM_RELEASETOOL := ./device/amazon/otter/releasetools/squisher

# Recovery
TARGET_PREBUILT_RECOVERY_KERNEL := device/amazon/otter/recovery-kernel
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_ALWAYS_INSECURE := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_otter

# Misc.
BOARD_NEEDS_CUTILS_LOG := true
#BOARD_USES_SECURE_SERVICES := true
BOARD_LIB_DUMPSTATE := libdumpstate.otter
BOARD_USE_LEGACY_TOUCHSCREEN := true

