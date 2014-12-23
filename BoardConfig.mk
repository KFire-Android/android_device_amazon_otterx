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

DEVICE_FOLDER := device/amazon/otterx

# inherit from common
-include device/amazon/otter-common/BoardConfigCommon.mk

# Use the non-open-source parts, if they're present
-include vendor/amazon/otterx/BoardConfigVendor.mk

# Kernel
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := mem=512M androidboot.selinux=permissive newbootargs
TARGET_BOOTLOADER_BOARD_NAME := otterx
TARGET_OTA_ASSERT_DEVICE := otterx

# Kernel Build
TARGET_KERNEL_SOURCE := kernel/amazon/otter-common
TARGET_KERNEL_CONFIG := android_omap4_defconfig
TARGET_KERNEL_VARIANT_CONFIG := android_otterx_defconfig

# Filesystem
TARGET_RECOVERY_FSTAB = $(DEVICE_FOLDER)/fstab.otterx
RECOVERY_FSTAB_VERSION = 2
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 536870912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 801112064
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6083296830

# Recovery
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true

# Enable dalvik startup with a low memory footprint
TARGET_ARCH_LOWMEM := true
