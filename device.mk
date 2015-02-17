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

$(call inherit-product, device/amazon/otter-common/common.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

# Hardware HALs
PRODUCT_PACKAGES += \
    lights.otterx \
    power.otterx \
    audio.primary.otterx \
    sensors.otterx

# Rootfs
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/fstab.otterx:/root/fstab.otterx \
    $(DEVICE_FOLDER)/init.otterx.rc:/root/init.otterx.rc \
    $(DEVICE_FOLDER)/init.otterx.usb.rc:/root/init.otterx.usb.rc \
    $(DEVICE_FOLDER)/init.recovery.otterx.rc:/root/init.recovery.otterx.rc \
    $(DEVICE_FOLDER)/ueventd.otterx.rc:/root/ueventd.otterx.rc

# Prebuilt system/bin
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/bin/fix-mac.sh:/system/bin/fix-mac.sh

# Prebuilt system/etc
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/etc/firmware/ducati-m3.512MB.bin:/system/etc/firmware/ducati-m3.512MB.bin

# Misc
PRODUCT_PACKAGES += \
    charger_res_images

# Recovery USB
ADDITIONAL_BUILD_PROPERTIES += \
    usb.vendor=1949 \
    usb.product.adb=0006 \
    usb.product.mtpadb=0006

# Mark as low ram device
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.low_ram=true

# Dalvik settings
ADDITIONAL_BUILD_PROPERTIES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=48m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=2m
