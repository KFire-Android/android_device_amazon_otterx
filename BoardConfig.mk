# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_FOLDER := device/amazon/otter

# inherit from common
-include device/amazon/otter-common/BoardConfigCommon.mk

# Use the non-open-source parts, if they're present
-include vendor/amazon/otter/BoardConfigVendor.mk

# Kernel
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := mem=512M console=null androidboot.selinux=permissive
TARGET_BOOTLOADER_BOARD_NAME := otter
TARGET_OTA_ASSERT_DEVICE := blaze,otter
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/platform/omap/omap_hsmmc.1/by-name/media
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/platform/omap/omap_hsmmc.1/by-name/media

# Kernel Build
TARGET_KERNEL_SOURCE := kernel/amazon/otter-common
TARGET_KERNEL_CONFIG := otter_android_defconfig

# Filesystem
TARGET_RECOVERY_FSTAB = $(DEVICE_FOLDER)/fstab.otter
RECOVERY_FSTAB_VERSION = 2
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1192230912

# Recovery
TARGET_RECOVERY_INITRC := $(DEVICE_FOLDER)/init.recovery.rc
TARGET_RECOVERY_PRE_COMMAND := "/system/bin/pre-recovery.sh \#"
BOARD_ALWAYS_INSECURE := true

# Enable dalvik startup with a low memory footprint
TARGET_ARCH_LOWMEM := true
