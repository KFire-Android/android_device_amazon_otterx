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

$(call inherit-product, device/amazon/otter-common/common.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

# Hardware HALs
PRODUCT_PACKAGES += \
    hwcomposer.otter \
    lights.otter \
    power.otter \
    audio.primary.otter \
    sensors.otter

# Rootfs
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/fstab.otter:/root/fstab.omap4430 \
    $(DEVICE_FOLDER)/init.omap4430.rc:/root/init.omap4430.rc \
    $(DEVICE_FOLDER)/init.omap4430.usb.rc:/root/init.omap4430.usb.rc

# Prebuilt system/bin
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/bin/fix-mac.sh:/system/bin/fix-mac.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/pre-recovery.sh:/system/bin/pre-recovery.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/idme:/system/bin/idme

# Prebuilt system/etc
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/etc/mountd.conf:/system/etc/mountd.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/firmware/ducati-m3.512MB.bin:/system/etc/firmware/ducati-m3.512MB.bin

# Prebuilt system/lib
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/lib/libidme.so:/system/lib/libidme.so

# Recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_PACKAGES += \
    sdcard

# Mark as low ram device
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true

# Enable KSM by default
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ksm.default=1
